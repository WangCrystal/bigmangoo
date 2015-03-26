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

package com.bigmangoo.product;

import javolution.util.FastList;
import javolution.util.FastMap;
import org.ofbiz.base.util.Debug;
import org.ofbiz.base.util.UtilMisc;
import org.ofbiz.entity.Delegator;
import org.ofbiz.entity.GenericEntityException;
import org.ofbiz.entity.GenericValue;
import org.ofbiz.entity.util.EntityUtil;
import org.ofbiz.service.DispatchContext;
import org.ofbiz.service.GenericServiceException;
import org.ofbiz.service.LocalDispatcher;
import org.ofbiz.service.ServiceUtil;

import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Services for Product
 */
public class ProductServices {

    public static final String module = ProductServices.class.getName();

    /**
     * 通过商品ID取得当前商品的基本信息
     * @param ctx
     * @param context
     * @return
     */
    public static Map<String, Object> getProductDetailById(DispatchContext ctx, Map<String, Object> context) {

        Delegator delegator = ctx.getDelegator();
        LocalDispatcher dispatcher = ctx.getDispatcher();
        Locale locale = (Locale) context.get("locale");
        String errMsg = null;

        //返回值
        Map<String, Object> result = ServiceUtil.returnSuccess();
        Map<String, Object> productInfo = FastMap.newInstance();

        String productId = (String) context.get("productId");
        //不显示虚拟商品，取得虚拟商品下第一个变型商品进行显示
        try{
            GenericValue product = delegator.findOne("Product", UtilMisc.toMap("productId", productId), true);
            if("Y".equals(product.getString("isVirtual")) && "N".equals(product.getString("isVariant"))){
                List<GenericValue> productVariants = delegator.findByAnd("ProductAndAssoc",UtilMisc.toMap("productId",productId,"productAssocTypeId","PRODUCT_VARIANT"),UtilMisc.toList("fromDate"),true);
                GenericValue productVariant = EntityUtil.getFirst(productVariants);
                productId = productVariant.getString("productIdTo");
            }
        } catch (GenericEntityException e) {
            Debug.logError(e, module);
            return ServiceUtil.returnError(e.getMessage());
        }

        //获取商品的基本信息
        result.put("productInfo", productInfo);

        return result;

    }

}
