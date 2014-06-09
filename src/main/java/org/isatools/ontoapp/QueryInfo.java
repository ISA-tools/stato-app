package org.isatools.ontoapp;

import java.util.ArrayList;

/**
 * Created by agbeltran on 09/06/2014.
 */
public class QueryInfo {

    private ArrayList<String> queryStringList = new ArrayList<String>();
    private ArrayList<String> queryList = new ArrayList<String>();
    private ArrayList<String> queryTypeList = new ArrayList<String>();
    private ArrayList<String> queryTypeStringList = new ArrayList<String>();
    private ArrayList<Integer> startList = new ArrayList<Integer>();
    private ArrayList<Integer> endList = new ArrayList<Integer>();

    //queryType for all the queries
    private static String QUERY_TYPE_ALL = "all";


    public QueryInfo(){

    }


    public void addQueryTypeAll(int total){
        queryTypeList.add(QUERY_TYPE_ALL);
        startList.add(new Integer(0));
        endList.add(new Integer(total));

    }

    public void addEnd(int end){
        endList.add(new Integer(end));
    }

    public void addStart(int end){
        startList.add(new Integer(end));
    }

    public void addQueryType(String queryType){
        queryTypeList.add(queryType);
    }

    public void addQueryTypeString(String queryTypeString){
        queryTypeStringList.add(queryTypeString);
    }

    public void addQueryString(String queryString){
        queryStringList.add(queryString);
    }

    public void addQuery(String query){
        queryList.add(query);
    }
}
