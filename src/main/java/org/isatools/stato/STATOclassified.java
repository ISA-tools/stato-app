package org.isatools.stato;

import org.isatools.owl.DLQueryParser;
import org.isatools.owl.OWLClassifier;
import org.isatools.owl.OWLUtil;
import org.semanticweb.owlapi.apibinding.OWLManager;
import org.semanticweb.owlapi.model.*;
import org.semanticweb.owlapi.reasoner.NodeSet;
import owltools.io.CatalogXmlIRIMapper;

import java.io.File;
import java.io.IOException;

/**
 * Created by the ISATeam.
 * User: agbeltran
 * Date: 04/03/2014
 * Time: 15:41
 *
 * @author <a href="mailto:alejandra.gonzalez.beltran@gmail.com">Alejandra Gonzalez-Beltran</a>
 */
public class STATOclassified  {

    OWLClassifier classifier = null;
    OWLOntologyManager manager = null;
    OWLOntology stato = null;

    private DLQueryParser dlQueryParser = null;


    private String STATO_file = "/Users/agbeltran/workspace/stato/src/ontology/stato.owl";
    private String classifiedSTATO_file =  "/Users/agbeltran/workspace/src/ontology/stato/classified-stato.owl";
    private IRI STATO_iri = IRI.create("http://purl.obolibrary.org/obo/stato.owl");


    public STATOclassified(){

        try {

            stato = loadLocalOntology(STATO_file);
            classifier = new OWLClassifier();
            classifier.classify(stato, STATO_iri);
            dlQueryParser = new DLQueryParser(classifier.getManager());

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

        OWLClassExpression classExpression = dlQueryParser.parse(dlQueryString);

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

        STATOclassified statoClassified = new STATOclassified();
        statoClassified.runQueries();
    }

}
