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
public class ProductServices {

    public static final String module = ProductServices.class.getName();

    /**
     * 校验当前商品ID是否被支持
     * @param ctx
     * @param context
     * @return
     */
    public static Map<String, Object> checkProductId(DispatchContext ctx, Map<String, Object> context) {
        Delegator delegator = ctx.getDelegator();
        LocalDispatcher dispatcher = ctx.getDispatcher();
        Locale locale = (Locale) context.get("locale");
        String errMsg = null;

        String productId = (String) context.get("productId");

        //返回值
        Map<String, Object> result = ServiceUtil.returnSuccess();

        //虚拟商品直接取得变型商品显示
        try{
            GenericValue product = delegator.findOne("Product", UtilMisc.toMap("productId", productId), true);
            if("Y".equals(product.getString("isVirtual")) && "N".equals(product.getString("isVariant"))){
                List<GenericValue> productVariants = delegator.findByAndCache("ProductAndAssoc",UtilMisc.toMap("productId",productId,"productAssocTypeId","PRODUCT_VARIANT"),UtilMisc.toList("fromDate"));
                GenericValue productVariant = EntityUtil.getFirst(productVariants);
                productId = productVariant.getString("productIdTo");
            }
        } catch (GenericEntityException e) {
            Debug.logError(e, module);
            return ServiceUtil.returnError(e.getMessage());
        }

        result.put("variantProductId", productId);

        return result;

    }

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

        //产品ID,当前店铺数据
        String productId = (String) context.get("productId");
        GenericValue productStore = (GenericValue) context.get("productStore");

        //获取商品的基本信息
        Map<String, Object> productInfo = FastMap.newInstance();
        try{
            List<GenericValue> productPriceViewList = delegator.findByAndCache("ProductAndPriceView",UtilMisc.toMap("productId",productId,"currencyUomId",productStore.getString("defaultCurrencyUomId"),"productPriceTypeId","DEFAULT_PRICE","productPricePurposeId","PURCHASE"));
            productPriceViewList = EntityUtil.filterByDate(productPriceViewList);
            GenericValue productPriceViewMap = EntityUtil.getFirst(productPriceViewList);
            productInfo.put("productName",productPriceViewMap.getString("productName"));//产品名称
            productInfo.put("productPrice",productPriceViewMap.getString("price"));//产品价格
            productInfo.put("productUomId",productPriceViewMap.getString("currencyUomId"));//产品价格uom
        } catch (GenericEntityException e) {
            Debug.logError(e, module);
            return ServiceUtil.returnError(e.getMessage());
        }

        result.put("productInfo", productInfo);

        //获取商品的额外图片信息
        try{
            List<String> productImages = FastList.newInstance();
            List<String> productContentTypeIds = UtilMisc.toList("XTRA_IMG_1_DETAIL","XTRA_IMG_2_DETAIL","XTRA_IMG_3_DETAIL","XTRA_IMG_4_DETAIL");
            List<EntityExpr> exprs = FastList.newInstance();
            exprs.add(EntityCondition.makeCondition("productId", EntityOperator.EQUALS, productId));
            exprs.add(EntityCondition.makeCondition("productContentTypeId", EntityOperator.IN, productContentTypeIds));
            productImages = EntityUtil.getFieldListFromEntityList(
                    delegator.findList("ProductContentAndInfo", EntityCondition.makeCondition(exprs, EntityOperator.AND),UtilMisc.toSet("drObjectInfo"),null,null,true)
                    ,"drObjectInfo",true);
            result.put("productImages", productImages);
        } catch (GenericEntityException e) {
            Debug.logError(e, module);
            return ServiceUtil.returnError(e.getMessage());
        }

        //获取产品可选特征


        return result;

    }

}
