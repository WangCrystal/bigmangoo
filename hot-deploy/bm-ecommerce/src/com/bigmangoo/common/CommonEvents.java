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

package com.bigmangoo.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.ofbiz.securityext.login.LoginEvents;

/**
 * 通用类
 */
public class CommonEvents {

    public static String module = CommonEvents.class.getName();

    public static String storeLogin(HttpServletRequest request, HttpServletResponse response) {

        // 调用系统方法
        String resultStr = LoginEvents.storeLogin(request,response);

        // 进行错误处理
        if("error".equals(resultStr)){
            request.setAttribute("_BM_ERROR_MESSAGE_", "登录失败<br>"+request.getAttribute("_ERROR_MESSAGE_"));
            return "error";
        }

        return "success";
    }


}
