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

<div class="row well">

    <div class="col-md-4">
        <#if productImages?has_content>
            <#list productImages as productImage>
                <img style="max-width:100%;" src="${productImage?if_exists}" alt="">
            </#list>
        <#else>
            <img style="max-width:100%;" src="/images/defaultImage.jpg" alt="">
        </#if>

    </div>

    <div class="col-md-8">
        <#if productInfo?has_content>

            <strong>
                ${(productInfo.productName)!}
            </strong>

            <h6 style="color:red;">

                <@ofbizCurrency amount=productInfo.productPrice isoCode=productInfo.productUomId/>

            </h6>

        </#if>

        <#if productFeatures?has_content>

            <#list productFeatures as productFeature>
                <div class="form-group">
                    <strong class='col-md-2'>${(productFeature.productFeatureTypeId)!}</strong>
                    <div class="col-md-10">
                        <#if productFeature.productSelectFeatureList?has_content>
                            <#list productFeature.productSelectFeatureList as productSelectFeature>
                                <#if productSelectFeature.selected == "true">
                                    <a href="<@ofbizUrl>checkProductId?productId=${(productSelectFeature.variantProductId)!}&productFeatureId=${(productSelectFeature.productFeatureId)!}</@ofbizUrl>"><span class="label label-primary">${(productSelectFeature.description)!}</span></a>
                                <#elseif productSelectFeature.selected == "false">
                                    <a href="<@ofbizUrl>checkProductId?productId=${(productSelectFeature.variantProductId)!}&productFeatureId=${(productSelectFeature.productFeatureId)!}</@ofbizUrl>"><span class="label label-default">${(productSelectFeature.description)!}</span></a>
                                </#if>
                            </#list>
                        </#if>
                    </div>
                </div>

            </#list>

        </#if>

        <form class="form-inline" action="<@ofbizUrl>additem</@ofbizUrl>" method="post">
            <div class="form-group" style="margin-top:10px;">
                <input type="hidden" name="add_product_id" value="${(productInfo.productId)!}"/>
                <input type="text" name="quantity" class="form-control" placeholder="数量" value="1">
                <button type="submit" class="btn btn-warning">加入购物车</button>
            </div>
        </form>

    </div>

</div>

<div role="tabpanel" style="padding-top:100px;">

    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">商品详情</a></li>
        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">商品评论</a></li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="home">

            这是商品的详细信息

        </div>
        <div role="tabpanel" class="tab-pane" id="profile">
            这是商品评论
        </div>
    </div>

</div>
