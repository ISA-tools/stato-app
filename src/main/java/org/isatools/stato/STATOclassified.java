package org.isatools.stato;

import org.isatools.owl.OWLUtil;
import org.semanticweb.HermiT.Reasoner;
import org.semanticweb.owlapi.apibinding.OWLManager;
import org.semanticweb.owlapi.io.StringDocumentTarget;
import org.semanticweb.owlapi.model.*;
import org.semanticweb.owlapi.reasoner.InferenceType;
import org.semanticweb.owlapi.reasoner.OWLReasoner;
import org.semanticweb.owlapi.reasoner.OWLReasonerFactory;
import org.semanticweb.owlapi.util.InferredAxiomGenerator;
import org.semanticweb.owlapi.util.InferredClassAssertionAxiomGenerator;
import org.semanticweb.owlapi.util.InferredOntologyGenerator;
import org.semanticweb.owlapi.util.InferredSubClassAxiomGenerator;
import owltools.io.CatalogXmlIRIMapper;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by the ISATeam.
 * User: agbeltran
 * Date: 04/03/2014
 * Time: 15:41
 *
 * @author <a href="mailto:alejandra.gonzalez.beltran@gmail.com">Alejandra Gonzalez-Beltran</a>
 */
public class STATOclassified {

    private String STATO_file = "/Users/agbeltran/work-dev/stato-agb/stato.owl";
    private String classifiedSTATO_file =  "/Users/agbeltran/work-dev/stato-agb/classified-stato.owl";

    /**
     * The manager for the current ontology.
     */
    private static OWLOntologyManager manager = null;

    /**
     * The data factory for the current manager.
     */
    private static OWLDataFactory dataFactory = null;

    /**
     * The ontology being worked on.
     */
    private static OWLOntology ontology = null;

    private static OWLOntology classifiedOntology = null;

    private static OWLReasonerFactory reasonerFactory = null;


    public STATOclassified(){

        // Create a reasoner factory.
        //reasonerFactory = new StructuralReasonerFactory();
        //reasonerFactory = new PelletReasonerFactory();
        reasonerFactory = new Reasoner.ReasonerFactory();

        // of the example, we will just load the pizza ontology.
        manager = OWLManager.createOWLOntologyManager();

        try {
            loadLocalSTATO();
            createClassifiedOntology();

        } catch (IOException e) {
            e.printStackTrace();
        } catch (OWLOntologyCreationException e) {
            e.printStackTrace();
        } catch (OWLOntologyStorageException e) {
            e.printStackTrace();
        }

    }


    private void loadLocalSTATO()
            throws IOException, OWLOntologyCreationException {
        File file = new File(STATO_file);
        String path = file.getParent();
        String catalogPath = path + "/catalog-v001.xml";
        manager = OWLManager.createOWLOntologyManager();
        manager.addIRIMapper(new CatalogXmlIRIMapper(catalogPath));
        ontology = manager.loadOntologyFromOntologyDocument(file);

    }

    public OWLOntology getClassifiedOntology(){

        if (classifiedOntology==null) {
            try {

                createClassifiedOntology();

            } catch (OWLOntologyCreationException e) {
                e.printStackTrace();
            } catch (OWLOntologyStorageException e) {
                e.printStackTrace();
            }
        }

        return classifiedOntology;
    }


    public void createClassifiedOntology()
            throws OWLOntologyCreationException, OWLOntologyStorageException {


        // Create the reasoner and classify the ontology
        OWLReasoner reasoner = reasonerFactory.createNonBufferingReasoner(ontology);

        reasoner.precomputeInferences(InferenceType.CLASS_HIERARCHY);

        // To generate an inferred ontology we use implementations of inferred
        // axiom generators to generate the parts of the ontology we want (e.g.
        // subclass axioms, equivalent classes axioms, class assertion axiom
        // etc. - see the org.semanticweb.owlapi.util package for more
        // implementations). Set up our list of inferred axiom generators
        List<InferredAxiomGenerator<? extends OWLAxiom>> gens = new ArrayList<InferredAxiomGenerator<? extends OWLAxiom>>();
        gens.add(new InferredSubClassAxiomGenerator());
        gens.add(new InferredClassAssertionAxiomGenerator());



        // Put the inferred axioms into a fresh empty ontology - note that there
        // is nothing stopping us stuffing them back into the original asserted
        // ontology if we wanted to do this.
        classifiedOntology = manager.createOntology();

        // Now get the inferred ontology generator to generate some inferred
        // axioms for us (into our fresh ontology). We specify the reasoner that
        // we want to use and the inferred axiom generators that we want to use.
        InferredOntologyGenerator iog = new InferredOntologyGenerator(reasoner, gens);
        iog.fillOntology(manager, classifiedOntology);

        // Save the inferred ontology. (Replace the URI with one that is
        // appropriate for your setup)
        manager.saveOntology(classifiedOntology, new StringDocumentTarget());

        OWLUtil.saveRDFXML(classifiedOntology, IRI.create("file:"+classifiedSTATO_file));
    }


    public static void main(String[] args) {

        STATOclassified statOclassified = new STATOclassified();



    }

}
