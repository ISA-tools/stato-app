package org.isatools.stato;


import org.semanticweb.owlapi.apibinding.OWLManager;
import org.semanticweb.owlapi.model.OWLDataFactory;
import org.semanticweb.owlapi.model.OWLOntology;
import org.semanticweb.owlapi.model.OWLOntologyCreationException;
import org.semanticweb.owlapi.model.OWLOntologyManager;
import owltools.io.CatalogXmlIRIMapper;

import java.io.File;
import java.io.IOException;

/**
 * Created by the ISATeam.
 * User: agbeltran
 * Date: 04/03/2014
 * Time: 13:38
 *
 * @author <a href="mailto:alejandra.gonzalez.beltran@gmail.com">Alejandra Gonzalez-Beltran</a>
 */
public class STATOQuery
{

    private String STATO_file = "/Users/agbeltran/work-dev/stato-agb/stato.owl";

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



    public STATOQuery(){

    }

    private OWLOntology loadLocalSTATO()
            throws IOException, OWLOntologyCreationException {
        File file = new File(STATO_file);
        String path = file.getParent();
        String catalogPath = path + "/catalog-v001.xml";
        manager = OWLManager.createOWLOntologyManager();
        manager.addIRIMapper(new CatalogXmlIRIMapper(catalogPath));
        OWLOntology ontology = manager.loadOntologyFromOntologyDocument(file);
        return ontology;
    }


    public void runDLQuery(){

    }

    public void runSPARQLQuery(){

    }


    public static void main( String[] args )
    {
        System.out.println( "Run STATO query" );
        STATOQuery statoQuery = new STATOQuery();
        try {

            statoQuery.loadLocalSTATO();

        } catch (IOException e) {
            e.printStackTrace();
        } catch (OWLOntologyCreationException e) {
            e.printStackTrace();
        }
    }
}