package solrsample

import org.apache.solr.client.solrj.SolrServer
import org.apache.solr.client.solrj.SolrQuery
import org.apache.solr.client.solrj.response.QueryResponse
import org.apache.solr.client.solrj.SolrRequest
import org.apache.solr.client.solrj.impl.HttpSolrServer
import org.apache.solr.client.solrj.request.QueryRequest
import org.apache.solr.common.SolrDocumentList

import groovy.json.*


class SolrController {

    def index() {
        if(request.post) {
            def url = params.serverurl
            def slurper = new JsonSlurper()
            def queryJSON = slurper.parseText(params.query)
            
            // サーバーを作成
            SolrServer server = new HttpSolrServer(url)

            // パラメータを設定
            SolrQuery query = new SolrQuery();
            for(key in queryJSON.keySet()){
                query.setParam(key, queryJSON.get(key))
            }
        
            //リクエスト
            QueryResponse resp = server.query(query);

            //レスポンスの処理
            ['queryResults': resp.getResults(), 'facetField': resp.getFacetFields()]
        }
    }
}