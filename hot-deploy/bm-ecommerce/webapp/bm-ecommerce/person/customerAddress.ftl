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
<table class="table table-condensed">

    <tbody>

    <#list customerAddressList as customerAddressMap>

        <tr>
            <td>
                ${(customerAddressMap.paAttnName)!}
            </td>
            <td>
                ${(customerAddressMap.paToName)!}
            </td>
            <td>
                ${(customerAddressMap.paAddress1)!}
            </td>
            <td>
                <#if defaultShipAddr == customerAddressMap.contactMechId>
                    默认收货地址
                <#else>
                    <form name="defaultShippingAddressForm_${customerAddressMap.contactMechId}" method="post" action="<@ofbizUrl>setCustomerDefaultAddress</@ofbizUrl>">
                        <input type="hidden" name="defaultShipAddr" value="${customerAddressMap.contactMechId}" />
                    </form>
                    <a href="javascript:document.defaultShippingAddressForm_${customerAddressMap.contactMechId}.submit();">设为默认地址</a>
                </#if>
            </td>
            <td>
                <a class="btn btn-success btn-xs pull-right" data-toggle="collapse" href="#editAddressWell" aria-expanded="false" aria-controls="editAddressWell">修改</a>
            </td>

        </tr>

    </#list>

    </tbody>

</table>
