package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 12-01 07:19
 */

import com.nongxinle.entity.*;

import java.util.List;
import java.util.Map;
import java.util.TreeSet;


public interface NxRestrauntOrdersDao extends BaseDao<NxRestrauntOrdersEntity> {

    List<NxRestrauntEntity> queryCommunityTodayRestruants(Map<String, Object> map1);

    List<NxRestrauntOrdersEntity> queryResOrdersByParams(Map<String, Object> map3);

    int queryResOrdersTotalByParams(Map<String, Object> map1);

    int queryResOrderTotalByParams(Map<String, Object> deliverymap);

    List<NxCommunityFatherGoodsEntity> comGetUnPlanPurchaseApplys(Map<String, Object> map);

    List<NxRestrauntOrdersEntity> queryResOrdersForComGoods(Map<String, Object> map1);

    List<NxCommunityFatherGoodsEntity> queryResOrdersByComStockGoodsType(Map<String, Object> map2);

    List<NxSupplierEntity> queryResOrdersByComSupplierGoodsType(Map<String, Object> map2);

    List<NxCommunityFatherGoodsEntity> queryTodayComGoodsType(Map<String, Object> map1);

    List<NxCommunityGoodsEntity> queryOrderGoodsByFatherId(Map<String, Object> map);
}
