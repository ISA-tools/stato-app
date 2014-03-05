package org.isatools.stato;


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

    private STATOclassified statoClassified = null;

    public STATOQuery(){
        statoClassified = new STATOclassified();
    }



    public void runDLQuery(){



    }

    public void runSPARQLQuery(){

    }

    /*

    public void shouldQueryWithReasoner() throws OWLOntologyCreationException {
        // We will load the pizza ontology and query it using a reasoner
        IRI documentIRI = IRI.create(PIZZA_IRI);
        OWLOntologyManager man = OWLManager.createOWLOntologyManager();
        OWLOntology ont = man.loadOntologyFromOntologyDocument(documentIRI);
        // For this particular ontology, we know that all class, properties
        // names etc. have URIs that is made up of the ontology IRI plus # plus
        // the local name
        String prefix = ont.getOntologyID().getOntologyIRI() + "#";
        // Create a reasoner. We will use Pellet in this case. Make sure that
        // the latest version of the Pellet libraries are on the runtime class
        // path
        OWLReasonerFactory reasonerFactory = new StructuralReasonerFactory();
        // Uncomment the line below reasonerFactory = new
        // PelletReasonerFactory();
        OWLReasoner reasoner = reasonerFactory.createNonBufferingReasoner(ont);
        // Now we can query the reasoner, suppose we want to determine the
        // properties that instances of Marghertia pizza must have
        OWLClass margheritaPizza = man.getOWLDataFactory().getOWLClass(
                IRI.create(prefix + "Margherita"));
        printProperties(man, ont, reasoner, margheritaPizza);
        // Let's do the same for JalapenoPepperTopping
        OWLClass vegTopping = man.getOWLDataFactory().getOWLClass(
                IRI.create(prefix + "JalapenoPepperTopping"));
        printProperties(man, ont, reasoner, vegTopping);
        // We can also ask if the instances of a class must have a property
        OWLClass mozzarellaTopping = man.getOWLDataFactory().getOWLClass(
                IRI.create(prefix + "MozzarellaTopping"));
        OWLObjectProperty hasOrigin = man
                .getOWLDataFactory()
                .getOWLObjectProperty(IRI.create(prefix + "hasCountryOfOrigin"));
        if (hasProperty(man, reasoner, mozzarellaTopping, hasOrigin)) {
            System.out.println("Instances of " + mozzarellaTopping
                    + " have a country of origin");
        }
    }
    */


    public static void main( String[] args )
    {
        System.out.println( "Run STATO query" );
        STATOQuery statoQuery = new STATOQuery();

    }
}