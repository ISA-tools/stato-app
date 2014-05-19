package org.isatools.stato;
import org.isatools.owl.DLQueryEngine;
import org.isatools.owl.DLQueryParser;
import org.semanticweb.HermiT.Reasoner;
import org.semanticweb.owlapi.apibinding.OWLManager;
import org.semanticweb.owlapi.model.*;
import org.semanticweb.owlapi.reasoner.OWLReasoner;
import org.semanticweb.owlapi.util.AnnotationValueShortFormProvider;
import org.semanticweb.owlapi.util.ShortFormProvider;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.net.URL;
import java.util.*;

/**
 * Created by agbeltran on 19/05/2014.
 */

public class STATOQueryDemoServlet extends HttpServlet {


    private OWLOntologyManager manager = null;
    private OWLDataFactory dataFactory = null;
    private OWLOntology stato = null;

    private DLQueryParser dlQueryParser = null;
    private DLQueryEngine dlQueryEngine = null;

    private URL STATO_url = null;
    private IRI STATO_iri = IRI.create("http://purl.obolibrary.org/obo/stato.owl");

    private List<String> result;


    public void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws ServletException, IOException {


        //response format
        response.setContentType("text/html");

        String queryNumber = request.getParameter("queryNumber");

        String filename = "/WEB-INF/stato/releases/1.1/stato.owl";

        ServletContext context = getServletContext();

        InputStream is = context.getResourceAsStream(filename);

        try{
            stato = loadLocalOntologyIS(is);
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

            runQuery(queryNumber, response);

        }catch(OWLOntologyCreationException ocex){
            ocex.printStackTrace();
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

    public void runQuery(String queryNumber, HttpServletResponse response) throws IOException {
        int queryNumberInt = (new Integer(queryNumber)).intValue();

        String dlQueryString = STATOQueries.QUERY_DL[queryNumberInt];
        String result = runDLQuery(dlQueryString);

        PrintWriter out = response.getWriter();
        out.println(result);

    }

    public void runQueries(){
        for(String dlQuery: STATOQueries.QUERY_DL){
            String processedResult = runDLQuery(dlQuery);
            result.add(processedResult);
        }
    }

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


    public void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
    }
}