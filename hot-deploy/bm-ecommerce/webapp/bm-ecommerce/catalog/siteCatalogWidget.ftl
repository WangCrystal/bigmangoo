<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->

<#if (catalogCol?size > 1)>
<nav class="navbar navbar-default" role="navigation">

    <div class="row">
        <div class="col-md-2">

        </div>
        <div class="col-md-10">

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">

                <ul class="nav navbar-nav">

                <#list catalogCol as catalogId>
                    <#assign thisCatalogName = Static["org.ofbiz.product.catalog.CatalogWorker"].getCatalogName(request, catalogId)>
                    <li <#if catalogId == currentCatalogId>class="active"</#if>>
                        <a href="javascript:document.choosecatalogform_${catalogId}.submit();">${thisCatalogName}</a>
                        <form name="choosecatalogform_${catalogId}" method="post" action="<@ofbizUrl>main</@ofbizUrl>">
                            <input name="CURRENT_CATALOG_ID" value="${catalogId}" hidden="hidden">
                        </form>
                    </li>
                </#list>

                </ul>

            </div>

        </div>
    </div>

</nav>
</#if>
