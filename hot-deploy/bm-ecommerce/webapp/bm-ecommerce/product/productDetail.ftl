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
    <li><a href="#">鞋子</a></li>
    <li class="active">阿迪达斯男士运动鞋</li>
</ol>

<div class="row well">

    <div class="col-md-4">
        <#assign largeImageUrl = product?if_exists.largeImageUrl?if_exists />
        <#if largeImageUrl?string?has_content>
            <img style="max-width:100%;" src="${largeImageUrl?if_exists}" alt="">
        <#else>
            <img style="max-width:100%;" src="/images/defaultImage.jpg" alt="">
        </#if>

    </div>

    <div class="col-md-8">

        <strong>
            阿迪达斯男士运动鞋
        </strong>

        <h6 style="color:red;">

            <#assign productAndPriceViewList = delegator.findByAnd("ProductAndPriceView", {"productId" : product.productId , "productPriceTypeId" : "LIST_PRICE"})>
            <#if productAndPriceViewList?has_content>
                <#assign productAndPriceView = Static["org.ofbiz.entity.util.EntityUtil"].getFirst(productAndPriceViewList)>
                <#if productAndPriceView?has_content>
                    $${(productAndPriceView.price)!}
                </#if>
            </#if>

        </h6>

        <form role="form">
            <div class="form-group">
                <strong class='col-md-2'>颜色</strong>
                <div class="col-md-10">
                    <a href="#"><span class="label label-default">红色</span></a>
                    <a href="#"><span class="label label-primary">红色</span></a>
                    <a href="#"><span class="label label-default">红色</span></a>
                    <a href="#"><span class="label label-default">红色</span></a>
                    <a href="#"><span class="label label-default">红色</span></a>
                    <a href="#"><span class="label label-default">红色</span></a>
                    <a href="#"><span class="label label-default">红色</span></a>
                    <a href="#"><span class="label label-default">红色</span></a>
                    <a href="#"><span class="label label-default">红色</span></a>
                    <a href="#"><span class="label label-default">红色</span></a>
                    <a href="#"><span class="label label-default">红色</span></a>
                </div>
            </div>
        </form>

        <form role="form">
            <div class="form-group">
                <strong class='col-md-2'>尺寸</strong>
                <div class="col-md-10">
                    <a href="#"><span class="label label-primary">2码</span></a>
                    <a href="#"><span class="label label-default">4码</span></a>
                    <a href="#"><span class="label label-default">2码</span></a>
                    <a href="#"><span class="label label-default">4码</span></a>
                    <a href="#"><span class="label label-default">2码</span></a>
                    <a href="#"><span class="label label-default">4码</span></a>
                    <a href="#"><span class="label label-default">2码</span></a>
                    <a href="#"><span class="label label-default">4码</span></a>
                    <a href="#"><span class="label label-default">2码</span></a>
                    <a href="#"><span class="label label-default">4码</span></a>
                    <a href="#"><span class="label label-default">2码</span></a>
                    <a href="#"><span class="label label-default">4码</span></a>
                    <a href="#"><span class="label label-default">2码</span></a>
                    <a href="#"><span class="label label-default">4码</span></a>
                    <a href="#"><span class="label label-default">4码</span></a>
                    <a href="#"><span class="label label-default">2码</span></a>
                    <a href="#"><span class="label label-default">4码</span></a>
                    <a href="#"><span class="label label-default">2码</span></a>
                    <a href="#"><span class="label label-default">4码</span></a>
                    <a href="#"><span class="label label-default">2码</span></a>
                    <a href="#"><span class="label label-default">4码</span></a>
                    <a href="#"><span class="label label-default">2码</span></a>
                    <a href="#"><span class="label label-default">4码</span></a>
                    <a href="#"><span class="label label-default">2码</span></a>
                    <a href="#"><span class="label label-default">4码</span></a>
                    <a href="#"><span class="label label-default">2码</span></a>
                    <a href="#"><span class="label label-default">4码</span></a>
                </div>
            </div>
        </form>

        <form class="form-inline">
            <div class="form-group" style="margin-top:10px;">
                <input type="text" class="form-control" id="exampleInputName2" placeholder="数量" value="1">
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
