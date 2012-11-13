<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ソーラーサンプル</title>
    <g:javascript library="jquery" />
    <r:layoutResources />
    <script type="text/javascript">
      $(document).ready(function(){
        var result = ${queryResults.encodeAsJSON()}
        var facet = ${facetField.encodeAsJSON()}
        if(result.class != 'org.codehaus.groovy.runtime.NullObject'){
          for(var i=0;i<result.length;i++){
            var tr = $('<tr/>')
            var td = $('<td/>').text(result[i].id)
            tr.append(td);
            td = $('<td/>').text(result[i].manu)
            tr.append(td);
            td = $('<td/>').text(result[i].manu_id_s)
            tr.append(td);
            td = $('<td/>').text(result[i].cat)
            tr.append(td);
            td = $('<td/>').text(result[i].features)
            tr.append(td);
            td = $('<td/>').text(result[i].price)
            tr.append(td);
            td = $('<td/>').text(result[i].price_c)
            tr.append(td);
            td = $('<td/>').text(result[i].inStock)
            tr.append(td);
            td = $('<td/>').text(result[i].popularity)
            tr.append(td);
            td = $('<td/>').text(result[i].manufacturedate_dt)
            tr.append(td);
            td = $('<td/>').text(result[i].store)
            tr.append(td);
            td = $('<td/>').text(result[i].compName_s)
            tr.append(td);
            td = $('<td/>').text(result[i].address_s)
            tr.append(td);
            td = $('<td/>').text(result[i]._version_)
            tr.append(td);
            $('#resultdata').append(tr);
          }
        }
        
        if(facet.class != 'org.codehaus.groovy.runtime.NullObject'){
         for(var j=0;j<facet[0].valueCount;j++){
            var tr = $('<tr/>')
            var td = $('<td/>').text(facet[0].values[j].name)
            tr.append(td);
            td = $('<td/>').text(facet[0].values[j].count)
            tr.append(td);
            td = $('<td/>').text(facet[0].values[j].asFilterQuery)
            tr.append(td);
            $('#facetdata').append(tr);
          }
        }
      });
    </script>
  </head>
  <body>
    <g:form name="solrquery" url="[controller:'solr',action:'index']">
      ServerURL : <g:textField name="serverurl" value="http://localhost:8983/solr/collection1" size="40"/><br>
      Query : <g:textField name="query" value='{"q":"*:*", "facet":"true" ,"facet.field":"compName_s"}' size="50"/><br>
      <input type="submit" value="Request">
    </g:form>
  <p>
    QueryはJSONで書いて下さい。<br>
    頑張ればきっとJSONぐらいで書けるはずだ！<br>
    ＊結果はすごい下の方まであるので、見逃し注意
  </p>
  <br>
  <h2>Result</h2>
  <table border=1>
    <thead><tr>
        <td>id</td>
        <td>manu</td>
        <td>manu_id_s</td>
        <td>cat</td>
        <td>features</td>
        <td>price</td>
        <td>price_c</td>
        <td>inStock</td>
        <td>popularity</td>
        <td>manufacturedate_dt</td>
        <td>store</td>
        <td>compName_s</td>
        <td>address_s</td>
        <td>_version_</td>
    </tr></thead>
    <tbody id="resultdata"></tbody>
  </table>
  <br>
  <h2>Facet</h2>
  <table border=1>
    <thead><tr>
        <td>name</td>
        <td>count</td>
        <td>asFilterQuery</td>
    </tr></thead>
    <tbody id="facetdata"></tbody>
  </table>  
  </body>
</html>