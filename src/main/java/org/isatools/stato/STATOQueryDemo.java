package org.isatools.stato;

import org.isatools.owl.DLQueryParser;
import org.isatools.owl.OWLClassifier;
import org.semanticweb.owlapi.apibinding.OWLManager;
import org.semanticweb.owlapi.model.*;
import org.semanticweb.owlapi.reasoner.NodeSet;
import org.semanticweb.owlapi.util.AnnotationValueShortFormProvider;
import org.semanticweb.owlapi.util.ShortFormProvider;
import owltools.io.CatalogXmlIRIMapper;

import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Created by the ISATeam.
 * User: agbeltran
 * Date: 04/03/2014
 * Time: 15:41
 *
 * @author <a href="mailto:alejandra.gonzalez.beltran@gmail.com">Alejandra Gonzalez-Beltran</a>
 */
public class STATOQueryDemo {

    OWLClassifier classifier = null;
    OWLOntologyManager manager = null;
    OWLDataFactory dataFactory = null;
    OWLOntology stato = null, classifiedOntology;

    private DLQueryParser dlQueryParser = null;


    private String STATO_file = "/Users/agbeltran/workspace/stato/src/ontology/stato.owl";
    private String classifiedSTATO_file =  "/Users/agbeltran/workspace/src/ontology/stato/classified-stato.owl";
    private IRI STATO_iri = IRI.create("http://purl.obolibrary.org/obo/stato.owl");


    public STATOQueryDemo(){

        try {

            stato = loadLocalOntology(STATO_file);
            classifier = new OWLClassifier();
            classifier.classify(stato, STATO_iri);
            classifiedOntology = classifier.getClassifiedOntology();

            dataFactory = manager.getOWLDataFactory();

//            List<IRI> annotationIRIS = new ArrayList<IRI>();
//            annotationIRIS.add(IRI.create("http://www.w3.org/2000/01/rdf-schema#label"));
//
//            Map<OWLAnnotationProperty, List<String>> propLangMap = new HashMap<OWLAnnotationProperty, List<String>>();
//
//            // convert IRI -> lang map into annotation property -> lang map
//            final List<OWLAnnotationProperty> properties = new ArrayList<OWLAnnotationProperty>();
//
//            List<String> annotationLanguages = new ArrayList<String>();
//
//            Map<IRI, List<String>> iriLangMap = new HashMap<IRI, List<String>>();
//            for (IRI iri : annotationIRIS) {
//                iriLangMap.put(iri, Collections.unmodifiableList(annotationLanguages));
//            }
//
//            for (IRI iri : annotationIRIS){
//                final OWLAnnotationProperty ap = dataFactory.getOWLAnnotationProperty(iri);
//                properties.add(ap);
//                propLangMap.put(ap, iriLangMap.get(iri));
//            }
//            ShortFormProvider shortFormProvider = new AnnotationValueShortFormProvider(properties,
//                    propLangMap,
//                    manager);

            ShortFormProvider shortFormProvider = new AnnotationValueShortFormProvider(
                    Arrays.asList(dataFactory.getRDFSLabel()),
                    Collections.<OWLAnnotationProperty, List<String>> emptyMap(),
                    manager);

            dlQueryParser = new DLQueryParser(classifiedOntology, shortFormProvider);

        } catch (IOException e) {
            e.printStackTrace();
        } catch (OWLOntologyCreationException e) {
            e.printStackTrace();
        }

    }


    private OWLOntology loadLocalOntology(String fileString)
            throws IOException, OWLOntologyCreationException {
        File file = new File(fileString);
        String path = file.getParent();
        String catalogPath = path + "/catalog-v001.xml";
        manager = OWLManager.createOWLOntologyManager();
        manager.addIRIMapper(new CatalogXmlIRIMapper(catalogPath));
        return manager.loadOntologyFromOntologyDocument(file);
    }


    private void runDLQuery(String dlQueryString){

        OWLClassExpression classExpression = dlQueryParser.parseString(dlQueryString);

        NodeSet<OWLClass> set =classifier.getDescendants(classExpression);

        System.out.println("Set =>" + set);
    }


    public void runQueries(){

        for(String dlQuery: STATOQueries.QUERY_DL){

            System.out.println("DL Query = "+dlQuery);
            runDLQuery(dlQuery);
        }

    }


    public static void main(String[] args) {

        STATOQueryDemo statoClassified = new STATOQueryDemo();
        statoClassified.runQueries();
    }

}
