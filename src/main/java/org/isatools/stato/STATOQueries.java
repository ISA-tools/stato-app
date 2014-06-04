package org.isatools.stato;

/**
 * Created by agbeltran on 01/05/2014.
 */
public class STATOQueries {

    public static String[] QUERY_STRING = new String[15];
    public static String[] QUERY_DL = new String[15];

    public static String QUERY_ALL = "all";
    public static int QUERY_ALL_START = 0;
    public static int QUERY_ALL_END = 14;

    public static String QUERY_TESTS = "tests";
    public static int QUERY_TESTS_START = 0;
    public static int QUERY_TESTS_END = 8;

    public static String QUERY_PLOTS = "plots";
    public static int QUERY_PLOTS_START = 9;
    public static int QUERY_PLOTS_END = 11;

    public static String QUERY_MEASURES = "measures";
    public static int QUERY_MEASURES_START = 12;
    public static int QUERY_MEASURES_END = 12;

    public static String QUERY_DESIGNS = "designs";
    public static int QUERY_DESIGN_START = 13;
    public static int QUERY_DESIGN_END = 14;


    static{

        //initialising query strings and DL expression

        //STATISTICAL TESTS
        QUERY_STRING[0] = "Which <span class='highlight'>statistical tests</span> require the <span class='highlight'>homoskedasticity hypothesis</span> to be true in order to be used?";
        QUERY_DL[0] = "'statistical hypothesis test' and 'has part' some ('homoskedasticity hypothesis' and 'has value' value true)";

        QUERY_STRING[1] = "Which <span class='highlight'>statistical tests</span> require <span class='highlight'>specific hypotheses</span> to be true in order to be used?";
        QUERY_DL[1] = "'statistical hypothesis test' and 'has part' some (hypothesis and 'has value' value true)";

        QUERY_STRING[2] = "Which <span class='highlight'>statistical tests</span> should only be applied if <span class='highlight'>normality and equivariance hypothesis</span> are met?";
        QUERY_DL[2] = "'statistical hypothesis test' and 'has part' some ('normal distribution hypothesis' and 'has value' value true) and 'has part' some ('homoskedasticity hypothesis' and 'has value' value true)";

        QUERY_STRING[3] = "What are the <span class='highlight'>statistical tests</span> which can be used to perform <span class='highlight'>within subject comparison</span>?";
        QUERY_DL[3] = "'statistical hypothesis test' and achieves_planned_objective some 'within subject comparison objective'";

        QUERY_STRING[4] = "Which <span class='highlight'>statistical tests</span> use a <span class='highlight'>contingency table</span>?";
        QUERY_DL[4] = "'statistical hypothesis test' and has_specified_input some 'contingency table'";

        QUERY_STRING[5] = "Which <span class='highlight'>statistical tests</span> require <span class='highlight'>ranking of a variable</span>?";
        QUERY_DL[5] = "'statistical hypothesis test' and 'has part' some ranking";

        QUERY_STRING[6] = "Which <span class='highlight'>statistical tests</span> evaluate <span class='highlight'>variance equality</span>?";
        QUERY_DL[6] = "achieves_planned_objective some 'equal variance testing objective'\n" +
                "or 'homoskedasticity test'";

        QUERY_STRING[7] = "Which <span class='highlight'>statistical tests<span class='highlight'> may be used to test <span class='highlight'>association between categorical variables</span>?";
        QUERY_DL[7] = "'statistical hypothesis test' and achieves_planned_objective some 'association between categorical variables testing objective'";

        QUERY_STRING[8] = "Which <span class='highlight'>statistical tests</span> use an <span class='highlight'>F- distribution</span>?";
        QUERY_DL[8] = "'statistical hypothesis test' and 'has part' some (F-distribution and 'has value' value true)";

        //PLOTS
        QUERY_STRING[9] = "Which <span class='highlight'>plots<span class='highlight'> may be used to represent the results of a <span class='highlight'>genetic association study</a>?";
        QUERY_DL[9] = "graph and 'is about' some 'genetic association study'\n" +
                "or\n" +
                "is_specified_output_of some ('data visualization' and 'genetic association study')";

        QUERY_STRING[10] = "Which <span class='highlight'>plots</span> may be used to represent the results of a meta-analysis?";
        QUERY_DL[10] = "is_specified_output_of some ('data visualization' and ('is preceded by' some 'meta analysis'))";

        QUERY_STRING[11] = "Which <span class='highlight'>plots</span> use <span class='highlight'>effect size estimate</span>?";
        QUERY_DL[11] = "graph and 'has part' some (axis and denotes some 'effect size estimate')";

        //STATISTICAL MEASURES
        QUERY_STRING[12] = "Having <span class='highlight'>2 ordinal variables</span>, which <span class='highlight'>correlation coefficient</span> can be computed?";
        QUERY_DL[12] = "'correlation coefficient' and 'is about' exactly 2 'ordinal variable'";

        //STUDY DESIGN
        QUERY_STRING[13] = "Which <span class='highlight'>study designs</span> use <span class='highlight'>blocking variables</span>?";
        QUERY_DL[13] = "'study design' and declares some 'blocking variable'";

        QUERY_STRING[14] = "Which <span class='highlight'>study designs</span> uses <span class='highlight'>time</span> as <span class='highlight'>blocking variable</span>?";
        QUERY_DL[14] = "'study design' and declares some ('blocking variable' and 'is about' some 'time sampled measurement data set')";

    }

}
