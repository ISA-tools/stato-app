package org.isatools.stato;

import org.isatools.owl.DLQueryEngine;
import org.isatools.owl.DLQueryParser;
import org.isatools.owl.OWLClassifier;
import org.semanticweb.HermiT.Reasoner;
import org.semanticweb.owlapi.apibinding.OWLManager;
import org.semanticweb.owlapi.model.*;
import org.semanticweb.owlapi.reasoner.NodeSet;
import org.semanticweb.owlapi.reasoner.OWLReasoner;
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory;
import org.semanticweb.owlapi.reasoner.structural.StructuralReasonerFactory;
import org.semanticweb.owlapi.util.AnnotationValueShortFormProvider;
import org.semanticweb.owlapi.util.ShortFormProvider;
import owltools.io.CatalogXmlIRIMapper;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.*;

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

    private URL STATO_url = null;
    private IRI STATO_iri = IRI.create("http://purl.obolibrary.org/obo/stato.owl");

    private List<String> result;


    public STATOQueryDemo(String statoFullPath) {

        result = new ArrayList<String>();
        try {
            //STATO_url = getClass().getResource("stato/releases/1.1/stato.owl");
            //stato = loadLocalOntology(STATO_url.getFile());
            //InputStream is = getClass().getResourceAsStream("/WEB-INF/stato/releases/1.1/stato.owl");

            //ServletContext context = getServletContext();
            //String fullPath = context.getRealPath("/WEB-INF/stato/releases/1.1/stato.owl");
            //String fullPath =  getClass().getResource("/WEB-INF/stato/releases/1.1/stato.owl").getPath();

            stato = loadLocalOntology(statoFullPath);
            dataFactory = manager.getOWLDataFactory();

            List<OWLAnnotationProperty> annotationProperties = new ArrayList();//Arrays.asList(dataFactory.getRDFSLabel());

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

    private OWLReasoner createReasoner(final OWLOntology rootOntology) {
        // We need to create an instance of OWLReasoner. An OWLReasoner provides
        // the basic query functionality that we need, for example the ability
        // obtain the subclasses of a class etc. To do this we use a reasoner
        // factory.
        // Create a reasoner factory.
        //OWLReasonerFactory reasonerFactory = new StructuralReasonerFactory();
        //return reasonerFactory.createReasoner(rootOntology);

        OWLReasoner reasoner = new Reasoner.ReasonerFactory().createReasoner(rootOntology);
        return reasoner;
    }

    private OWLOntology loadLocalOntologyIS(InputStream inputStream)
            throws IOException, OWLOntologyCreationException {
        //String catalogPath = path + "/catalog-v001.xml";
        manager = OWLManager.createOWLOntologyManager();
        //manager.addIRIMapper(new CatalogXmlIRIMapper(catalogPath));
        return manager.loadOntologyFromOntologyDocument(inputStream);
    }

    private OWLOntology loadLocalOntology(String fileString)
            throws IOException, OWLOntologyCreationException {
        System.out.println("In loadLocalOntology... fileString="+fileString);
        //File file = new File(fileString);
        //String path = file.getParent();
        //System.out.println("path="+path);
        //String catalogPath = path + "/catalog-v001.xml";
        manager = OWLManager.createOWLOntologyManager();
        //manager.addIRIMapper(new CatalogXmlIRIMapper(catalogPath));
        //return manager.loadOntologyFromOntologyDocument(file);
        return manager.loadOntology(IRI.create("file:"+fileString));
    }
    /*
    private OWLOntology loadLocalOntology(String fileString)
            throws IOException, OWLOntologyCreationException {
        System.out.println("In loadLocalOntology... fileString="+fileString);
        File file = new File(fileString);
        String path = file.getParent();
        System.out.println("path="+path);
        //String catalogPath = path + "/catalog-v001.xml";
        manager = OWLManager.createOWLOntologyManager();
        //manager.addIRIMapper(new CatalogXmlIRIMapper(catalogPath));
        return manager.loadOntologyFromOntologyDocument(file);
    }
    */


    public String runDLQuery(String dlQueryString){
        Set<OWLClass> set = dlQueryEngine.getSubClasses(dlQueryString, false);
        return processResults(set);
    }

    public String processResults(Set<OWLClass> set){

        StringBuffer buffer = new StringBuffer();
        for(OWLClass cls: set){
            // Get the annotations on the class that use the label property (rdfs:label)
            for (OWLAnnotation annotation : cls.getAnnotations(stato, dataFactory.getRDFSLabel())) {
                if (annotation.getValue() instanceof OWLLiteral) {
                    OWLLiteral val = (OWLLiteral) annotation.getValue();
                        //Get your String here
                        buffer.append( "<a href=\"http://bioportal.bioontology.org/ontologies/STATO/?p=classes&conceptid="+ cls +">"+ val.getLiteral()+"</a> <br>" );
                }
            }
        }
        return buffer.toString();
    }


    public void runQueries(){
        for(String dlQuery: STATOQueries.QUERY_DL){
            String processedResult = runDLQuery(dlQuery);
            result.add(processedResult);
        }
    }

    public List<String> getResult(){

        return result;
    }


    public static void main(String[] args) throws Exception {

        //STATOQueryDemo statoQueryDemo = new STATOQueryDemo();
        //String result = statoQueryDemo.runDLQuery("'statistical hypothesis test' and 'has part' some ('homoskedasticity hypothesis' and 'has value' value true)");
        //System.out.println(result);
        //statoQueryDemo.runQueries();
        //System.out.println(statoQueryDemo.getResult());
    }

}
