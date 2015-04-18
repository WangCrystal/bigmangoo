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

<#if (shoppingCartSize > 0)>

    <table class="table table-condensed">

        <thead>
        <tr>
            <td><strong>产品</strong></td>
            <td><strong>数量</strong></td>
            <td><strong>单价</strong></td>
            <td><strong>调整</strong></td>
            <td><strong>明细合计</strong></td>
            <td><strong>操作</strong></td>
        </tr>
        </thead>

        <tbody>

    <#list shoppingCart.items() as cartLine>

        <tr>
            <td>
                <img style="width:50px;height:50px;" src='http://www.haotu.net/up/2841/256/dota2b.png'/>
                美特斯邦威
            </td>
            <td>1</td>
            <td>2</td>
            <td>1</td>
            <td>1</td>
            <td>
                <a href="#">移除购物车</a>
            </td>
        </tr>

    </#list>


        <tr>
            <td>
                <img style="width:50px;height:50px;" src='http://www.haotu.net/up/2841/256/dota2b.png'/>
                美特斯邦威
            </td>
            <td>1</td>
            <td>2</td>
            <td>1</td>
            <td>1</td>
            <td>
                <a href="#">移除购物车</a>
            </td>
        </tr>

        <tr>
            <td>
                <img style="width:50px;height:50px;" src='http://www.haotu.net/up/2841/256/dota2b.png'/>
                美特斯邦威
            </td>
            <td>1</td>
            <td>2</td>
            <td>1</td>
            <td>1</td>
            <td>
                <a href="#">移除购物车</a>
            </td>
        </tr>

        <tr>
            <td>
                <img style="max-width:50px;max-height:50px;" src='http://www.haotu.net/up/2841/256/dota2b.png'/>
                美特斯邦威
            </td>
            <td>1</td>
            <td>2</td>
            <td>1</td>
            <td>1</td>
            <td>
                <a href="#">移除购物车</a>
            </td>
        </tr>

        </tbody>

    </table>

<#else>
    购物车为空
</#if>


