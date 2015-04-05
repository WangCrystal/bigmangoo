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
import org.ofbiz.service.GenericServiceException;
import org.ofbiz.service.LocalDispatcher;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * PersonEvents
 * Created by lianghh on 15/4/5.
 */
public class PersonEvents {

    public static final String module = PersonEvents.class.getName();

    public static String updatePassword(HttpServletRequest request, HttpServletResponse response) {

        LocalDispatcher dispatcher = (LocalDispatcher) request.getAttribute("dispatcher");
        final Delegator delegator = (Delegator)request.getAttribute("delegator");
        GenericValue userLogin = (GenericValue) request.getSession().getAttribute("userLogin");

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String newPasswordVerify = request.getParameter("newPasswordVerify");

        // 校验是否相等
        if(!newPassword.equals(newPasswordVerify)){
            request.setAttribute("_BM_ERROR_MESSAGE_", "两次密码不一致");
            return "success";
        }

        //TODO 校验当前密码是否正确

        // 调用服务更换密码
        try{
            dispatcher.runSync("updatePassword", UtilMisc.toMap(
                    "currentPassword",currentPassword,
                    "newPassword",newPassword,
                    "newPasswordVerify",newPasswordVerify,
                    "userLoginId",userLogin.getString("userLoginId")));
        } catch (GenericServiceException e){

            //TODO
            return "success";
        }

        return "success";

    }

}
