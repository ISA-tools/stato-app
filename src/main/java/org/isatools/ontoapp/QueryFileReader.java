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
    private ArrayList<Integer> startList = new ArrayList<Integer>();
    private ArrayList<Integer> endList = new ArrayList<Integer>();

    private static String QUERY_TYPE_SEPARATOR = "===";
    private static String COMMENT = "#";
    /**
     *
     */
    public QueryFileReader(){


    }

    public void readFile(String file) {

        BufferedReader br = null;

        String queryType = null;
        String queryString = null;
        String query = null;

        try {
            br = new BufferedReader(new FileReader(file));

            String line = br.readLine();
            int count = 0;


            while (line != null) {
                line = br.readLine();

                if (line.startsWith(COMMENT)){

                    continue;

                } else if (line.startsWith(QUERY_TYPE_SEPARATOR)){

                    queryType = line.substring(QUERY_TYPE_SEPARATOR.length());
                    queryTypeList.add(queryType);

                } else {
                

                }

            }

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

}
