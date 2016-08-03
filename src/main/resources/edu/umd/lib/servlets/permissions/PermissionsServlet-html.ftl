<!DOCTYPE html>
<#--
  Copyright 2014 Hippo B.V. (http://www.onehippo.com)

  Licensed under the Apache License, Version 2.0 (the  "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS"
  BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
  
  ------------------------------------------------------------------------------
  
  Note: This file has been renamed and extensively modified from the original
  "hippo-repository-2.26.21" tagged version of:
 
     servlets/src/main/resources/org/hippoecm/repository/RepositoryServlet-html.ftl 
 
   see https://code.onehippo.org/cms-community/hippo-repository/blob/hippo-repository-2.26.21/servlets/src/main/resources/org/hippoecm/repository/RepositoryServlet-html.ftl
-->

${response.setContentType("text/html;charset=UTF-8")}

<html>

<head>
  <title>Permissions Browser</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <style type="text/css">
    body { background-color: #efefef }
    h3 {margin:2px}
    table.params {font-size:small}
    td.header {text-align: left; vertical-align: top; padding: 10px;}
    td {text-align: left}
    th {text-align: left}
    #infotable { background-color: #cfcfcf }
    #error { background-color: #efef00; font-size: large; padding: 10px }
    
    #permissionsTable { border: thin solid black;
                       border-collapse: collapse; }
    #permissionsTable th { border: thin solid black; margin-left: 20px; margin-right: 20px; text-align: center; }
    #permissionsTable td { border: thin solid black;  margin-left: 20px; margin-right: 20px; text-align: center; }
    .result-true { background-color: mediumseagreen; }
    .result-false { background-color: lightcoral; }
    
  </style>
</head>

<body>

<table id="infotable" width="100%">
  <tr>
    <td class="header">
      <h3>Query Parmeters</h3>
      <table style="params" summary="searching">
        <form method="POST" action="" accept-charset="UTF-8">
          <tr>
            <th>User id: </th>
            <td>
              <input name="jcrUserId" type="text" size="80" value="${jcrUserId!}"/>
            </td>
          </tr>
          <tr>
            <th>JCR path: </th>
            <td>
              <input name="jcrPath" type="text" size="80" value="${jcrPath!}"/>
            </td>
          </tr>
          <tr>
            <td><input type="submit" value="Fetch"/></td>
          </tr>
        </form>
      </table>
    </td>
  </tr>
</table>  
<br>

<#if allPermissions??>
  <table id="permissionsTable" width="100%">
    <tr>
      <#list allPermissions as permission>
      <th>${permission}</th>
      </#list>
    </tr>
    <tr>
      <#list allPermissions as permission>
        <#assign result = (privilegesMap[permission])!"false">
        <td id="${permission}" class="result-${result}">${result}</td>
      </#list>
    </tr>    
  </table>
</#if>

<#if exception??>
  <h3>Error: ${exception.message}</h3>
</#if>

</body>
</html>
