package org.isatools.stato;

/**
 * Created by the ISATeam.
 * User: agbeltran
 * Date: 05/03/2014
 * Time: 11:42
 *
 * @author <a href="mailto:alejandra.gonzalez.beltran@gmail.com">Alejandra Gonzalez-Beltran</a>
 */
public class STATODemoQueries {


    private STATOQuery queryEngine = null;

    private String ANOVA_hypotheses = "hypothesis and (‘is part of’ some ANOVA)";


    public STATODemoQueries(){

        queryEngine = new STATOQuery();

        queryEngine.runDLQuery(ANOVA_hypotheses);

    }

    public static void main(String[] args) {

        STATODemoQueries demo = new STATODemoQueries();

    }




}
