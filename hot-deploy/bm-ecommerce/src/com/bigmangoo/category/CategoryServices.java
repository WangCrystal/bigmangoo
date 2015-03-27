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

package com.bigmangoo.category;

import javolution.util.FastList;
import javolution.util.FastMap;
import org.ofbiz.base.util.Debug;
import org.ofbiz.base.util.UtilMisc;
import org.ofbiz.base.util.UtilValidate;
import org.ofbiz.entity.Delegator;
import org.ofbiz.entity.GenericEntityException;
import org.ofbiz.entity.GenericValue;
import org.ofbiz.entity.util.EntityUtil;
import org.ofbiz.security.authz.da.ObjectDaHandler;
import org.ofbiz.service.DispatchContext;
import org.ofbiz.service.LocalDispatcher;
import org.ofbiz.service.ServiceUtil;

import java.util.List;
import java.util.Locale;
import java.util.Map;

/**
 * Services for Category
 */
public class CategoryServices {

    public static final String module = CategoryServices.class.getName();

    /**
     * 通过目录ID取得目录下的所有分类
     * @param ctx
     * @param context
     * @return
     */
    public static Map<String, Object> getCategoryTreeByCatalogId(DispatchContext ctx, Map<String, Object> context) {

        Delegator delegator = ctx.getDelegator();
        LocalDispatcher dispatcher = ctx.getDispatcher();
        Locale locale = (Locale) context.get("locale");
        String errMsg = null;

        //返回值
        Map<String, Object> result = ServiceUtil.returnSuccess();
        Map<String, Object> categoryTree = FastMap.newInstance();

        String currentCatalogId = (String) context.get("currentCatalogId");

        //取得当前目录下 浏览根/PCCT_BROWSE_ROOT 分类
        try {
            List<GenericValue> prodCatalogCategoryList = delegator.findByAndCache("ProdCatalogCategory", UtilMisc.toMap("prodCatalogId",currentCatalogId,"prodCatalogCategoryTypeId","PCCT_BROWSE_ROOT"));
            prodCatalogCategoryList = EntityUtil.filterByDate(prodCatalogCategoryList);
            GenericValue prodCatalogCategoryMap = EntityUtil.getFirst(prodCatalogCategoryList);

            // 迭代取得当前店铺信息以及下属店铺信息
            if(UtilValidate.isNotEmpty(prodCatalogCategoryMap)){
                categoryTree.put("productCategoryId", prodCatalogCategoryMap.getString("productCategoryId"));
                fillCategoryTree(categoryTree,delegator);
            }

        }catch (GenericEntityException e){
            Debug.logWarning(e.getMessage(), module);
            return ServiceUtil.returnError(e.getMessage());
        }

        //获取分类树
        result.put("categoryTree", categoryTree);

        return result;

    }

    /**
     * 取得当前节点信息以及下属节点信息
     * @param categoryTreeNode
     * @param delegator
     */
    private static void fillCategoryTree(Map<String, Object> categoryTreeNode,Delegator delegator) throws GenericEntityException{

        String productCategoryId = (String) categoryTreeNode.get("productCategoryId");

        List<GenericValue> productCategoryContentAndInfoList = delegator.findByAndCache("ProductCategoryContentAndInfo",UtilMisc.toMap("productCategoryId",productCategoryId,"prodCatContentTypeId","CATEGORY_NAME"));
        productCategoryContentAndInfoList = EntityUtil.filterByDate(productCategoryContentAndInfoList);
        GenericValue productCategoryContentAndInfoMap = EntityUtil.getFirst(productCategoryContentAndInfoList);

        //取得categoryName
        if(UtilValidate.isNotEmpty(productCategoryContentAndInfoMap) && "ELECTRONIC_TEXT".equals(productCategoryContentAndInfoMap.getString("drDataResourceTypeId"))){
            GenericValue electronicText = delegator.findOne("ElectronicText",UtilMisc.toMap("dataResourceId",productCategoryContentAndInfoMap.getString("drDataResourceId")),true);
            if(UtilValidate.isNotEmpty(electronicText)){
                categoryTreeNode.put("categoryName",electronicText.getString("textData"));
            }
        }
        if(!categoryTreeNode.containsKey("categoryName")){
            GenericValue productCategoryMap = delegator.findOne("ProductCategory",UtilMisc.toMap("productCategoryId",productCategoryId),true);
            String categoryName = productCategoryMap.getString("categoryName");
            String description = productCategoryMap.getString("description");
            if(UtilValidate.isNotEmpty(categoryName)){
                categoryTreeNode.put("categoryName",categoryName);
            }else if(UtilValidate.isNotEmpty(description)){
                categoryTreeNode.put("categoryName",description);
            }
        }

        //取得当前分类下级分类进行显示
        List<GenericValue> productCategoryRollupList = delegator.findByAndCache("ProductCategoryRollup",UtilMisc.toMap("parentProductCategoryId",productCategoryId));
        if(UtilValidate.isNotEmpty(productCategoryRollupList)){
            List<Map<String,Object>> childs = FastList.newInstance();

            for(GenericValue productCategoryRollupMap : productCategoryRollupList){
                Map<String,Object> child = FastMap.newInstance();

                child.put("productCategoryId",productCategoryRollupMap.getString("productCategoryId"));
                fillCategoryTree(child,delegator);

                childs.add(child);
            }

            categoryTreeNode.put("childs",childs);

        }

    }

}
