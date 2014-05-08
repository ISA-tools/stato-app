package org.isatools.owl;

import org.coode.owlapi.manchesterowlsyntax.ManchesterOWLSyntaxClassExpressionParser;
import org.coode.owlapi.manchesterowlsyntax.ManchesterOWLSyntaxEditorParser;
import org.semanticweb.owlapi.expression.OWLEntityChecker;
import org.semanticweb.owlapi.expression.ParserException;
import org.semanticweb.owlapi.expression.ShortFormEntityChecker;
import org.semanticweb.owlapi.model.OWLClassExpression;
import org.semanticweb.owlapi.model.OWLDataFactory;
import org.semanticweb.owlapi.model.OWLOntology;
import org.semanticweb.owlapi.model.OWLOntologyManager;
import org.semanticweb.owlapi.util.*;

import java.util.Set;

/**
 * Created by the ISATeam.
 * User: agbeltran
 * Date: 04/03/2014
 * Time: 13:55
 *
 * @author <a href="mailto:alejandra.gonzalez.beltran@gmail.com">Alejandra Gonzalez-Beltran</a>
 */
public class DLQueryParser {

    private final OWLOntology rootOntology;
    private final ShortFormProvider shortFormProvider;

    private OWLOntologyManager manager = null;
    private OWLDataFactory dataFactory = null;
    private ManchesterOWLSyntaxClassExpressionParser parser = null;
    private OWLClassExpression description = null;


    /**
     * Constructs a DLQueryParser using the specified ontology and short form
     * provider to map entity IRIs to short names.
     *
     * @param rootOntology
     *        The root ontology. This essentially provides the domain vocabulary
     *        for the query.
     * @param shortFormProvider
     *        A short form provider to be used for mapping back and forth
     *        between entities and their short names (renderings).
     */
    public DLQueryParser(OWLOntology rootOntology, ShortFormProvider shortFormProvider){
        this.rootOntology = rootOntology;
        this.shortFormProvider = shortFormProvider;

        System.out.println("Classes in signature");
        System.out.println(rootOntology.getClassesInSignature());

        manager = rootOntology.getOWLOntologyManager();
        dataFactory = manager.getOWLDataFactory();
    }

    public OWLClassExpression parseString(String classExpressionString){

        System.out.println("ontologies...");
        System.out.println(manager.getOntologies());

        // Set up the real parser
        ManchesterOWLSyntaxEditorParser parser = new ManchesterOWLSyntaxEditorParser(
                dataFactory, classExpressionString);
        parser.setDefaultOntology(rootOntology);

        Set<OWLOntology> importsClosure = rootOntology.getImportsClosure();

        System.out.println("imports closure");
        System.out.println(importsClosure);

        BidirectionalShortFormProvider bidiShortFormProvider =
                 new BidirectionalShortFormProviderAdapter(
                        manager, importsClosure, shortFormProvider);

        // Specify an entity checker that wil be used to check a class
        // expression contains the correct names.
        OWLEntityChecker entityChecker = new ShortFormEntityChecker(
                bidiShortFormProvider);
        parser.setOWLEntityChecker(entityChecker);
        // Do the actual parsing

        return parser.parseClassExpression();


    }

//    public OWLClassExpression parse(String dlQuery) {
//        try{
//
//            System.out.println("Ontologies... ");
//            System.out.println(manager.getOntologies());
//
//            BidirectionalShortFormProvider sfp =
//                    new BidirectionalShortFormProviderAdapter(manager.getOntologies(),
//                            shortFormProvider);
//
//            parser = new ManchesterOWLSyntaxClassExpressionParser(dataFactory,
//                    new ShortFormEntityChecker(
//                            sfp));
//
//            description = parser.parse(dlQuery);
//
//
//            return description;
//        }catch(ParserException pEx){
//
//           pEx.printStackTrace();
//
//        }
//
//        return null;
//    }





}
