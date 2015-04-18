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

import javolution.util.FastList;
import javolution.util.FastMap;
import org.ofbiz.base.util.Debug;
import org.ofbiz.base.util.UtilMisc;
import org.ofbiz.base.util.UtilValidate;
import org.ofbiz.entity.Delegator;
import org.ofbiz.entity.GenericEntityException;
import org.ofbiz.entity.GenericValue;
import org.ofbiz.entity.condition.EntityCondition;
import org.ofbiz.entity.condition.EntityExpr;
import org.ofbiz.entity.condition.EntityOperator;
import org.ofbiz.entity.util.EntityUtil;
import org.ofbiz.service.DispatchContext;
import org.ofbiz.service.LocalDispatcher;
import org.ofbiz.service.ServiceUtil;

import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Services for Product
 */
public class PersonServices {

    public static final String module = PersonServices.class.getName();

    /**
     * 取得用户的货运地址
     * @param ctx
     * @param context
     * @return
     */
    public static Map<String, Object> getCustomerAddressByPartyId(DispatchContext ctx, Map<String, Object> context) {
        Delegator delegator = ctx.getDelegator();
        LocalDispatcher dispatcher = ctx.getDispatcher();
        Locale locale = (Locale) context.get("locale");
        String errMsg = null;

        //返回值
        Map<String, Object> result = ServiceUtil.returnSuccess();

        String partyId = (String) context.get("partyId");

        try {

            // 取出所有用途为货运地址的联系方式
            List<GenericValue> partyContactMechPurposeList = delegator.findByAndCache("PartyContactMechPurpose", UtilMisc.toMap("partyId", partyId, "contactMechPurposeTypeId", "SHIPPING_LOCATION"));
            partyContactMechPurposeList = EntityUtil.filterByDate(partyContactMechPurposeList);
            List<String> contactMechs = EntityUtil.getFieldListFromEntityList(partyContactMechPurposeList,"contactMechId",true);

            // 取得当前用户的货运地址
            List<EntityExpr> exprs = FastList.newInstance();
            exprs.add(EntityCondition.makeCondition("contactMechId", EntityOperator.IN, contactMechs));
            exprs.add(EntityCondition.makeCondition("partyId", EntityOperator.EQUALS, partyId));
            exprs.add(EntityCondition.makeCondition("contactMechTypeId", EntityOperator.EQUALS, "POSTAL_ADDRESS"));
            List<GenericValue> partyAndContactMechList = delegator.findList("PartyAndContactMech",EntityCondition.makeCondition(exprs, EntityOperator.AND),null, null, null, true);
            partyAndContactMechList = EntityUtil.filterByDate(partyAndContactMechList);
            result.put("customerAddressList",partyAndContactMechList);

        } catch (GenericEntityException e){

            Debug.logError(e, module);
            return ServiceUtil.returnError(e.getMessage());

        }

        return result;

    }

}
