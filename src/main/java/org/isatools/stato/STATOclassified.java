package org.isatools.stato;

import org.isatools.owl.ClassifiedOntology;
import org.isatools.owl.OWLUtil;
import org.semanticweb.owlapi.apibinding.OWLManager;
import org.semanticweb.owlapi.model.IRI;
import org.semanticweb.owlapi.model.OWLOntology;
import org.semanticweb.owlapi.model.OWLOntologyCreationException;
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
public class STATOclassified extends ClassifiedOntology {

    private String STATO_file = "/Users/agbeltran/work-dev/stato-agb/stato.owl";
    private String classifiedSTATO_file =  "/Users/agbeltran/work-dev/stato-agb/classified-stato.owl";


    public STATOclassified(){

        try {
            loadLocalSTATO();
            OWLOntology classifiedOntology = getClassifiedOntology();
            OWLUtil.saveRDFXML(classifiedOntology, IRI.create("file:" + classifiedSTATO_file));

        } catch (IOException e) {
            e.printStackTrace();
        } catch (OWLOntologyCreationException e) {
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




    public static void main(String[] args) {

        STATOclassified statoClassified = new STATOclassified();




    }

}
