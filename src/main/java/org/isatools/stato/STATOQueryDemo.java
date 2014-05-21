package org.isatools.stato;

import com.sun.tools.javac.util.Pair;
import org.isatools.owl.DLQueryEngine;
import org.isatools.owl.DLQueryParser;
import org.isatools.owl.OWLClassifier;
import org.semanticweb.HermiT.Reasoner;
import org.semanticweb.owlapi.apibinding.OWLManager;
import org.semanticweb.owlapi.model.*;
import org.semanticweb.owlapi.reasoner.OWLReasoner;
import org.semanticweb.owlapi.util.AnnotationValueShortFormProvider;
import org.semanticweb.owlapi.util.ShortFormProvider;

import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.*;
import java.util.logging.Logger;

/**
 * Created by the ISATeam.
 * User: agbeltran
 * Date: 04/03/2014
 * Time: 15:41
 *
 * @author <a href="mailto:alejandra.gonzalez.beltran@gmail.com">Alejandra Gonzalez-Beltran</a>
 */
public class STATOQueryDemo{ //extends HttpServlet {

    private OWLClassifier classifier = null;
    private OWLOntologyManager manager = null;
    private OWLDataFactory dataFactory = null;
    private OWLOntology stato = null;

    private DLQueryParser dlQueryParser = null;
    private DLQueryEngine dlQueryEngine = null;

//    private URL STATO_url = null;
//    private IRI STATO_iri = IRI.create("http://purl.obolibrary.org/obo/stato.owl");

    private final static Logger logger = Logger.getLogger(STATOQueryDemo.class.getName());

    //<DLquery, resultMap>
    private Map<String, List<Pair<String, String>>> resultMap;


    public STATOQueryDemo(File statoFile) {
        System.out.println("STATOQueryDemo constructor");
        resultMap = new HashMap<String, List<Pair<String, String>>>();
        try {
            manager = OWLManager.createOWLOntologyManager();
            stato = loadLocalOntology(statoFile);
            dataFactory = manager.getOWLDataFactory();

            List<OWLAnnotationProperty> annotationProperties = new ArrayList();

            Map<OWLAnnotationProperty, List<String>> langMap = new HashMap<OWLAnnotationProperty, List<String>>();

            Map<IRI, List<String>> annotMap = new HashMap<IRI, List<String>>();
            List<String> langList = new ArrayList();

            String en = Locale.ENGLISH.getLanguage();
            langList.add(en);
            annotMap.put(dataFactory.getRDFSLabel().getIRI(), langList);

            for (IRI iri : annotMap.keySet()){
                OWLAnnotationProperty p  = manager.getOWLDataFactory().getOWLAnnotationProperty(iri);
                annotationProperties.add(p);
                langMap.put(p, annotMap.get(iri));
            }

            ShortFormProvider shortFormProvider = new AnnotationValueShortFormProvider(
                    annotationProperties,
                    //langMap,
                    Collections.<OWLAnnotationProperty, List<String>> emptyMap(),
                    manager);

            dlQueryEngine = new DLQueryEngine(createReasoner(stato), shortFormProvider);

        } catch (IOException e) {
            e.printStackTrace();
        } catch (OWLOntologyCreationException e) {
            e.printStackTrace();
        }
    }


    /**
     * Relying on Hermit reasoner
     *
     * @param rootOntology
     * @return
     */
    private OWLReasoner createReasoner(final OWLOntology rootOntology) {
        OWLReasoner reasoner = new Reasoner.ReasonerFactory().createReasoner(rootOntology);
        return reasoner;
    }
      
    private OWLOntology loadLocalOntology(File file)
            throws IOException, OWLOntologyCreationException {
        System.out.println("In loadLocalOntology... file="+file);
        String path = file.getParent();
        System.out.println("path="+path);

//        Scanner scanner = new Scanner(file);
//        String line = null;
//        int i = 0;
//        while (scanner.hasNext() && i < 10){
//            line = scanner.nextLine();
//            logger.info("Line "+i+": " + line);
//            i++;
//        }
        //String catalogPath = path + "/catalog-v001.xml";
        //manager.addIRIMapper(new CatalogXmlIRIMapper(catalogPath));
        return manager.loadOntologyFromOntologyDocument(file);
    }


    public List<Pair<String, String>> runDLQuery(String dlQueryString){
        List<Pair<String, String>> resultString = resultMap.get(dlQueryString);

        if (resultString!=null)
            return resultString;

        Set<OWLClass> set = dlQueryEngine.getSubClasses(dlQueryString, false);
        resultString = processResults(set);

        resultMap.put(dlQueryString, resultString);

        return resultString;
    }

    public List<Pair<String, String>> processResults(Set<OWLClass> set){

        List<Pair<String, String>> list = new ArrayList<Pair<String, String>>();

        Pair<String, String> pair = null;
        for(OWLClass cls: set){
            // Get the annotations on the class that use the label property (rdfs:label)
            for (OWLAnnotation annotation : cls.getAnnotations(stato, dataFactory.getRDFSLabel())) {
                if (annotation.getValue() instanceof OWLLiteral) {
                    OWLLiteral val = (OWLLiteral) annotation.getValue();
                        //Get your String here
                        pair = new Pair(cls, val.getLiteral());
                        //buffer.append( "<a href=\"http://bioportal.bioontology.org/ontologies/STATO/?p=classes&conceptid="+ cls +">"+ val.getLiteral()+"</a> <br>" );
                    list.add(pair);
                }
            }
        }
        //return buffer.toString();
        return list;
    }


//    public void runQueries(){
//        for(String dlQuery: STATOQueries.QUERY_DL){
//            String processedResult = runDLQuery(dlQuery);
//            resultMap.put(dlQuery, processedResult);
//        }
//    }

    public static void main(String[] args) throws Exception {

//        URL url = STATOQueryDemo.class.getClass().getResource("/stato/releases/1.1/stato.owl");
//        System.out.println("url = "+url);
//        String jspPath =  url.getPath();
//
//        System.out.println("jspPath="+jspPath);
//        //String statoFilePath = jspPath+ "stato.owl";
//        File statoFile = new File(jspPath);
//
//        STATOQueryDemo statoQueryDemo = new STATOQueryDemo(statoFile);
//        String result = statoQueryDemo.runDLQuery("'statistical hypothesis test' and 'has part' some ('homoskedasticity hypothesis' and 'has value' value true)");
//        System.out.println(result);

        //STATOQueryDemo statoQueryDemo = new STATOQueryDemo();
        //String resultMap = statoQueryDemo.runDLQuery("'statistical hypothesis test' and 'has part' some ('homoskedasticity hypothesis' and 'has value' value true)");
        //System.out.println(resultMap);
        //statoQueryDemo.runQueries();
        //System.out.println(statoQueryDemo.getResultMap());
    }

}
