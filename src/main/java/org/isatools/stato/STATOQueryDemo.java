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
    private Map<String, List<STATOResult>> resultMap;


    public STATOQueryDemo(File statoFile) {
        System.out.println("STATOQueryDemo constructor");
        resultMap = new HashMap<String, List<STATOResult>>();
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


    public List<STATOResult> runDLQuery(String dlQueryString){
        List<STATOResult> resultString = resultMap.get(dlQueryString);

        if (resultString!=null)
            return resultString;

        Set<OWLClass> set = dlQueryEngine.getSubClasses(dlQueryString, false);
        resultString = processResults(set);

        resultMap.put(dlQueryString, resultString);

        return resultString;
    }

    public List<STATOResult> processResults(Set<OWLClass> set){

        List<STATOResult> list = new ArrayList<STATOResult>();

        STATOResult result = null;
        String iri = null, label = null, definition = null;
        for(OWLClass cls: set){

            iri = cls.getIRI().toString();
            // Get the annotations on the class that use the label property (rdfs:label)
            for (OWLAnnotation annotation : cls.getAnnotations(stato, dataFactory.getRDFSLabel())) {
                if (annotation.getValue() instanceof OWLLiteral) {
                    OWLLiteral val = (OWLLiteral) annotation.getValue();
                    //Get your String here
                    label = val.getLiteral();
                }
            }
            for (OWLAnnotation annotation : cls.getAnnotations(stato, dataFactory.getOWLAnnotationProperty(IRI.create("http://purl.obolibrary.org/obo/IAO_0000115")))) {
                if (annotation.getValue() instanceof OWLLiteral) {
                    OWLLiteral val = (OWLLiteral) annotation.getValue();
                    //Get your String here
                    definition = val.getLiteral();
                }
            }
            result = new STATOResult(iri, label, definition);
            list.add(result);
        }
        return list;
    }


    public List<STATOResult> getPrecomputedResults(String dlQueryString){
        if (resultMap!=null)
            return resultMap.get(dlQueryString);
        return null;
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
