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


<#if orderHeaderList?has_content>

    <table class="table table-condensed">

        <thead>
        <tr>
            <td><strong>订单</strong></td>
            <td><strong>金额</strong></td>
            <td><strong>状态</strong></td>
            <td><strong>操作</strong></td>
        </tr>
        </thead>

        <tbody>

                <#list orderHeaderList as orderHeader>

                    <tr>
                        <td>
                            ${orderHeader.orderId}
                        </td>
                        <td>
                            <@ofbizCurrency amount=orderHeader.grandTotal isoCode=orderHeader.currencyUom />
                        </td>
                        <td>
                            <#assign status = orderHeader.getRelatedOneCache("StatusItem") />
                            ${status.get("description",locale)}
                        </td>
                        <td>
                            <a href="<@ofbizUrl>orderDetail</@ofbizUrl>">查看</a>
                        </td>
                    </tr>

                </#list>

        </tbody>

    </table>

<#else>
    没有订单
</#if>
