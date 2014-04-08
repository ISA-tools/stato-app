package org.isatools.owl;

import org.coode.owlapi.manchesterowlsyntax.ManchesterOWLSyntaxClassExpressionParser;
import org.semanticweb.owlapi.expression.ParserException;
import org.semanticweb.owlapi.expression.ShortFormEntityChecker;
import org.semanticweb.owlapi.model.OWLClassExpression;
import org.semanticweb.owlapi.model.OWLDataFactory;
import org.semanticweb.owlapi.model.OWLOntologyManager;
import org.semanticweb.owlapi.util.BidirectionalShortFormProvider;
import org.semanticweb.owlapi.util.BidirectionalShortFormProviderAdapter;
import org.semanticweb.owlapi.util.SimpleShortFormProvider;

/**
 * Created by the ISATeam.
 * User: agbeltran
 * Date: 04/03/2014
 * Time: 13:55
 *
 * @author <a href="mailto:alejandra.gonzalez.beltran@gmail.com">Alejandra Gonzalez-Beltran</a>
 */
public class DLQueryParser {

    private OWLOntologyManager manager = null;
    private OWLDataFactory dataFactory = null;
    private ManchesterOWLSyntaxClassExpressionParser parser = null;
    private OWLClassExpression description = null;


    public DLQueryParser(OWLOntologyManager m){
        manager = m;
        dataFactory = manager.getOWLDataFactory();
    }

    public OWLClassExpression parse(String dlQuery) {
        try{
            BidirectionalShortFormProvider sfp =
                    new BidirectionalShortFormProviderAdapter(manager.getOntologies(),
                            new SimpleShortFormProvider());

            parser = new ManchesterOWLSyntaxClassExpressionParser(dataFactory,
                    new ShortFormEntityChecker(
                            sfp));

            description = parser.parse(dlQuery);

            return description;
        }catch(ParserException pEx){

           pEx.printStackTrace();

        }

        return null;
    }





}
