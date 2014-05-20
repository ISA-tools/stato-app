package org.isatools.stato;

/**
 * Created by agbeltran on 01/05/2014.
 */
public class STATOQueries {

    public static String[] QUERY_STRING = new String[14];
    public static String[] QUERY_DL = new String[14];

    public static String QUERY_ALL = "all";
    public static int QUERY_ALL_START = 0;
    public static int QUERY_ALL_END = 13;

    public static String QUERY_TESTS = "tests";
    public static int QUERY_TESTS_START = 0;
    public static int QUERY_TESTS_END = 7;

    public static String QUERY_PLOTS = "plots";
    public static int QUERY_PLOTS_START = 8;
    public static int QUERY_PLOTS_END = 11;

    public static String QUERY_MEASURES = "measures";
    public static int QUERY_MEASURES_START = 12;
    public static int QUERY_MEASURES_END = 12;

    public static String QUERY_DESIGN = "designs";
    public static int QUERY_DESIGN_START = 13;
    public static int QUERY_DESIGN_END = 13;


    static{

        //initialising query strings and DL expression

        //STATISTICAL TESTS
        QUERY_STRING[0] = "Which statistical tests make assume the homoskedasticity hypothesis as true?";
        QUERY_DL[0] = "'statistical hypothesis test' and 'has part' some ('homoskedasticity hypothesis' and 'has value' value true)";

        QUERY_STRING[1] = "Which statistical tests make particular assumptions before application?";
        QUERY_DL[1] = "'statistical hypothesis test' and 'has part' some (hypothesis and 'has value' value true)";

        QUERY_STRING[2] = "What are the statistical tests which can be used to test within subject comparison?";
        QUERY_DL[2] = "'statistical hypothesis test' and achieves_planned_objective some 'within subject comparison objective'";

        QUERY_STRING[3] = "Which statistical test uses a contingency table?";
        QUERY_DL[3] = "'statistical hypothesis test' and has_specified_input some 'contingency table'";

        QUERY_STRING[4] = "Which statistical test requires ranking of a variable?";
        QUERY_DL[4] = "'statistical hypothesis test' and 'has part' some ranking";

        QUERY_STRING[5] = "Which statistical test evaluates variance equality?";
        QUERY_DL[5] = "achieves_planned_objective some 'equal variance testing objective'\n" +
                "or 'homoskedasticity test'";

        QUERY_STRING[6] = "Which statistical test or data transformation method may be used to test association between categorical variable?";
        QUERY_DL[6] = "'statistical hypothesis test' and achieves_planned_objective some 'association testing objective'";

        QUERY_STRING[7] = "Which statistical test use 'normal distribution'?";
        QUERY_DL[7] = "'statistical hypothesis test' and 'has part' some ('normal distribution hypothesis' and 'has value' value true)";

        //PLOTS
        QUERY_STRING[8] = "Which plot may be produced in a genetic association study?";
        QUERY_DL[8] = "graph and 'is about' some 'genetic association study'\n" +
                "or\n" +
                "is_specified_output_of some ('data visualization' and 'genetic association study')";

        QUERY_STRING[9] = "Which plot may be produced in a meta-analysis?";
        QUERY_DL[9] = "is_specified_output_of some ('data visualization' and ('is preceded by' some 'meta analysis'))";

        QUERY_STRING[10] = "Which plot use effect size estimate?";
        QUERY_DL[10] = "graph and 'has part' some (axis and denotes some 'effect size estimate')";

        QUERY_STRING[11] = "Which plot use effect size estimate?";
        QUERY_DL[11] = "'study design' and declares some 'blocking variable'";

        //STATISTICAL MEASURES
        QUERY_STRING[12] = "Which correlation coefficient can be used with exactly 2 ordinal variable?";
        QUERY_DL[12] = "'correlation coefficient' and 'is about' exactly 2 'ordinal variable'";

        //STUDY DESIGN
        QUERY_STRING[13] = "Which study design uses time as blocking variable?";
        QUERY_DL[13] = "'study design' and declares some ('blocking variable' and 'is about' some 'time sampled measurement data set')";

    }

}
