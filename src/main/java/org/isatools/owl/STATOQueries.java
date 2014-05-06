package org.isatools.owl;

/**
 * Created by agbeltran on 01/05/2014.
 */
public class STATOQueries {


    public static String QUERY1_STRING = "Which statistical tests make assume the homoskedasticity hypothesis as true?";
    public static String QUERY1_DL = "'statistical hypothesis test' and 'has part' some ('homoskedasticity hypothesis' and 'has value' value true)";

    public static String QUERY2_STRING = "Which statistical tests make particular assumptions before application?";
    public static String QUERY2_DL = "'statistical hypothesis test' and 'has part' some (hypothesis and 'has value' value true)";

    public static String QUERY3_STRING = "What are the statistical tests which can be used to test within subject comparison?";
    public static String QUERY3_DL = "'statistical hypothesis test' and achieves_planned_objective some 'within subject comparison objective'";

    public static String QUERY4_STRING = "Which plot may be produced in a genetic association study?";
    public static String QUERY4_DL = "graph and 'is about' some 'genetic association study'\n" +
            "or\n" +
            "is_specified_output_of some ('data visualization' and 'genetic association study')";

    public static String QUERY5_STRING = "Which plot may be produced in a meta-analysis?";
    public static String QUERY5_DL = "is_specified_output_of some ('data visualization' and ('is preceded by' some 'meta analysis'))";

    public static String QUERY6_STRING = "Which plot use effect size estimate?";
    public static String QUERY6_DL = "graph and 'has part' some (axis and denotes some 'effect size estimate')";

    public static String QUERY7_STRING = "Which plot use effect size estimate?";
    public static String QUERY7_DL = "'study design' and declares some 'blocking variable'";


    public static String QUERY8_STRING = "Which study design uses time as blocking variable?";
    public static String QUERY8_DL = "'study design' and declares some ('blocking variable' and 'is about' some 'time sampled measurement data set')";

    public static String QUERY9_STRING = "Which test uses a contingency table?";
    public static String QUERY9_DL = "'statistical hypothesis test' and has_specified_input some 'contingency table'";

    public static String QUERY10_STRING = "Which statistical test requires ranking of a variable?";
    public static String QUERY10_DL = "'statistical hypothesis test' and 'has part' some ranking";

    public static String QUERY11_STRING = "Which statistical test evaluates variance equality?";
    public static String QUERY11_DL = "achieves_planned_objective some 'equal variance testing objective'\n" +
            "or 'homoskedasticity test'";

    public static String QUERY12_STRING = "Which statistical test or data transformation method may be used to test association between categorical variable?";
    public static String QUERY12_DL = "'statistical hypothesis test' and achieves_planned_objective some 'association testing objective'";

    public static String QUERY13_STRING = "Which statistical test use 'normal distribution'?";
    public static String QUERY13_DL = "'statistical hypothesis test' and 'has part' some ('normal distribution hypothesis' and 'has value' value true)";

    public static String QUERY14_STRING = "Which correlation coefficient can be used with exactly 2 ordinal variable?";
    public static String QUERY14_DL = "'correlation coefficient' and 'is about' exactly 2 'ordinal variable'";


}
