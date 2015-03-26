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
<ol class="breadcrumb">
    <li><a href="#">首页</a></li>
    <li class="active">鞋子</li>
</ol>


    <#if productCategoryMembers?has_content>
    <div class="row">

        <#list productCategoryMembers as productCategoryMember>

            <#assign product = delegator.findOne("Product", {"productId" : productCategoryMember.productId}, true)>
            <#if product?exists>
                <#assign smallImageUrl = product.smallImageUrl?if_exists>
                <#if !smallImageUrl?string?has_content><#assign smallImageUrl = "/images/defaultImage.jpg"></#if>

                    <div class="col-md-3">
                        <div class="tile">
                            <img src="${(smallImageUrl)!}" alt="Compas" class="tile-image big-illustration">
                            <#assign productName = product.productName?default('')>
                            <#if productName?length gt 10>
                                <#assign productName = productName?substring(0,10)>
                            </#if>
                            <h3 class="tile-title">${productName}</h3>
                            <p style="color:red;">
                                <strong>

                                    <#assign productAndPriceViewList = delegator.findByAnd("ProductAndPriceView", {"productId" : productCategoryMember.productId , "productPriceTypeId" : "LIST_PRICE"})>
                                    <#if productAndPriceViewList?has_content>
                                        <#assign productAndPriceView = Static["org.ofbiz.entity.util.EntityUtil"].getFirst(productAndPriceViewList)>
                                        <#if productAndPriceView?has_content>
                                            $${(productAndPriceView.price)!}
                                        </#if>
                                    </#if>

                                </strong>
                            </p>

                            <a class="btn btn-primary btn-large btn-block" target="_blank" href="<@ofbizUrl>productDetail?productId=${(productCategoryMember.productId)!}</@ofbizUrl>">详情</a>

                        </div>
                    </div>
            </#if>

        </#list>

    </div>

        <!-- 分页 -->
        <#assign viewIndexMax = Static["java.lang.Math"].ceil((listSize - 1)?double / viewSize?double)>
        <#if (viewIndexMax?int > 0)>
            <ul class="pagination-plain">

            <#if (viewIndex?int > 0)>
                <li class="previous"><a href="<@ofbizUrl>productCategoryList?category_id=${productCategoryId}&VIEW_SIZE${viewSize}=&VIEW_INDEX=${viewIndex?int - 1}</@ofbizUrl>">← 前一页</a></li>
            </#if>

            <li class="active"><a href="#fakelink">${lowIndex} - ${highIndex} / ${listSize}</a></li>

            <#if highIndex?int < listSize?int>
                <li class="next"><a href="<@ofbizUrl>productCategoryList?category_id=${productCategoryId}&VIEW_SIZE${viewSize}=&VIEW_INDEX=${viewIndex?int + 1}</@ofbizUrl>">后一页 →</a></li>
            </#if>

            </ul>
        </#if>

    <#else>
        <h6>当前分类下没有商品</h6>
    </#if>
