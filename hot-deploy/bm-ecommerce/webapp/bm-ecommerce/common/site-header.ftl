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
<div class="row" style="margin-top: 10px;margin-bottom: 10px;">

    <div class="col-md-4">

        <#if overrideLogo?exists>
            <img src="${overrideLogo}" width="270" height="60" alt="京东">
        <#else>
            请设置网站logo
        </#if>

    </div>

    <div class="col-md-4">
        <div class="form-group center-block">
            <div class="input-group">
                <input class="form-control" id="navbarInput-01" type="search" placeholder="搜索">
                <span class="input-group-btn">
                  <button type="submit" class="btn"><span class="fui-search"></span></button>
                </span>
            </div>
        </div>
    </div>

    <div class="col-md-4">

        <div class="pull-right">

            <#assign shoppingCart = sessionAttributes.shoppingCart?if_exists>
            <#if shoppingCart?has_content>
                <#assign shoppingCartSize = shoppingCart.size()>
            <#else>
                <#assign shoppingCartSize = 0>
            </#if>

            <a type="button" class="btn btn-default" href="<@ofbizUrl>showcart</@ofbizUrl>">
                购物车${(shoppingCart.getTotalQuantity())!}
            </a>

            <#if userLogin?has_content && userLogin.userLoginId != "anonymous">
                <div class="btn-group">
                    <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle" type="button">
                        <#if sessionAttributes.autoName?has_content>
                            ${sessionAttributes.autoName?html}
                        </#if>
                        <span class="caret"></span>
                    </button>
                    <ul role="menu" class="dropdown-menu">
                        <li><a href="<@ofbizUrl>customerInfo</@ofbizUrl>">个人中心</a></li>
                        <li class="divider"></li>
                        <li><a href="<@ofbizUrl>logout</@ofbizUrl>">退出</a></li>
                    </ul>
                </div>
            <#else/>
                <a href="<@ofbizUrl>${checkLoginUrl}</@ofbizUrl>" type="button" class="btn btn-info">登陆</a>
            </#if>

        </div>

    </div>

</div>
