package org.isatools.ontoapp;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;


/**
 * Created by agbeltran on 06/06/2014.
 */
public class QueryFileReader {

    private ArrayList<String> queryStringList = new ArrayList<String>();
    private ArrayList<String> queryList = new ArrayList<String>();
    private ArrayList<String> queryTypeList = new ArrayList<String>();
    private ArrayList<String> queryTypeStringList = new ArrayList<String>();
    private ArrayList<Integer> startList = new ArrayList<Integer>();
    private ArrayList<Integer> endList = new ArrayList<Integer>();

    //queryType for all the queries
    private static String QUERY_TYPE_ALL = "all";
    private static String QUERY_TYPE_SEPARATOR = "===";
    private static String COMMENT = "#";
    /**
     *
     */
    public QueryFileReader(){

    }

    private void addQueryTypeAll(int total){

        queryTypeList.add(QUERY_TYPE_ALL);
        startList.add(new Integer(0));
        endList.add(new Integer(total));

    }

    public void readFile(String file) {

        BufferedReader br = null;

        String queryType = null;
        String queryTypeString = null;
        String queryString = null;
        String query = null;
        boolean firstString = true;

        try {
            br = new BufferedReader(new FileReader(file));

            String line = br.readLine();
            int count = 0;


            while (line != null) {

                if (line.startsWith(COMMENT) || line.equals("")){

                    line = br.readLine();
                    continue;

                } else if (line.startsWith(QUERY_TYPE_SEPARATOR)){

                    if (queryType!=null)
                        endList.add(new Integer(count-1));

                    queryType = line.substring(QUERY_TYPE_SEPARATOR.length(),line.indexOf(','));
                    queryTypeString = line.substring(line.indexOf(',')+1);
                    queryTypeList.add(queryType);
                    queryTypeStringList.add(queryTypeString);
                    startList.add(new Integer(count));

                } else {

                    if (queryType!=null) {

                        if (firstString) {
                            queryStringList.add(line);
                            firstString = false;
                        } else {
                            queryList.add(line);
                            count++;
                            firstString = true;
                        }

                    }
                }

                line = br.readLine();
            }

            if (queryType!=null)
               addQueryTypeAll(count-1);

        }catch(IOException ioexception){

            ioexception.printStackTrace();

        }  finally {
            try {

                if (br!=null)
                    br.close();

            }catch(IOException ioexception){
                ioexception.printStackTrace();
            }
        }

    }

    public static void main(String[] args) {
        String fileName = "/Users/agbeltran/workspace/stato-app/src/main/resources/queries/queries.txt";
        QueryFileReader reader = new QueryFileReader();
        reader.readFile(fileName);



    }

}
