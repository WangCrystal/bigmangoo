/*******************************************************************************
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 *******************************************************************************/
package com.bigmangoo.person;

import org.ofbiz.base.util.UtilMisc;
import org.ofbiz.entity.Delegator;
import org.ofbiz.entity.GenericValue;
import org.ofbiz.product.store.ProductStoreWorker;
import org.ofbiz.service.GenericServiceException;
import org.ofbiz.service.LocalDispatcher;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * PersonEvents
 */
public class PersonEvents {

    public static final String module = PersonEvents.class.getName();

    /**
     * 更换当前用户密码
     * @param request
     * @param response
     * @return
     */
    public static String updatePassword(HttpServletRequest request, HttpServletResponse response) {

        LocalDispatcher dispatcher = (LocalDispatcher) request.getAttribute("dispatcher");
        final Delegator delegator = (Delegator)request.getAttribute("delegator");
        GenericValue userLogin = (GenericValue) request.getSession().getAttribute("userLogin");

        String newPassword = request.getParameter("newPassword");
        String newPasswordVerify = request.getParameter("newPasswordVerify");

        // 校验是否相等
        if(!newPassword.equals(newPasswordVerify)){
            request.setAttribute("_BM_ERROR_MESSAGE_", "两次密码不一致");
            return "success";
        }

        // 调用服务更换密码
        try{

            Map<String,Object> serviceResult = dispatcher.runSync("updatePassword", UtilMisc.toMap(
                    "newPassword",newPassword,
                    "newPasswordVerify",newPasswordVerify,
                    "userLoginId",userLogin.getString("userLoginId"),
                    "userLogin",userLogin));

            if(serviceResult.containsKey("errorMessage")){
                request.setAttribute("_BM_ERROR_MESSAGE_", "修改密码失败。" + serviceResult.get("errorMessage"));
            }else {
                request.setAttribute("_BM_SUCCESS_MESSAGE_", "成功更新密码！");
            }

        } catch (GenericServiceException e){

            request.setAttribute("_BM_ERROR_MESSAGE_", "修改密码失败");

            e.printStackTrace();
            return "success";
        }

        return "success";

    }

    /**
     * 设置当前用户的默认收货地址
     * @param request
     * @param response
     * @return
     */
    public static String setCustomerDefaultAddress(HttpServletRequest request, HttpServletResponse response) {

        LocalDispatcher dispatcher = (LocalDispatcher) request.getAttribute("dispatcher");
        GenericValue productStore = ProductStoreWorker.getProductStore(request);
        GenericValue userLogin = (GenericValue) request.getSession().getAttribute("userLogin");

        String productStoreId = productStore.getString("productStoreId");
        String partyId = userLogin.getString("partyId");

        String defaultShipAddr = request.getParameter("defaultShipAddr");

        try{
            Map<String,Object> serviceResult = dispatcher.runSync("setPartyProfileDefaults",
                    UtilMisc.toMap("productStoreId",productStoreId,"partyId",partyId,"defaultShipAddr",defaultShipAddr,"userLogin",userLogin));

            if(serviceResult.containsKey("errorMessage")){
                request.setAttribute("_BM_ERROR_MESSAGE_", "设置收货地址失败。" + serviceResult.get("errorMessage"));
            }

        } catch (GenericServiceException e){

            request.setAttribute("_BM_ERROR_MESSAGE_", "设置收货地址失败");

            e.printStackTrace();
            return "success";
        }

        return "success";

    }
}
