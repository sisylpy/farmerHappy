package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 06-21 21:51
 */

import com.nongxinle.entity.NxCommunityOrdersEntity;
import com.nongxinle.entity.NxDepartmentEntity;
import com.nongxinle.entity.NxDepartmentOrdersEntity;

import java.util.List;
import java.util.Map;


public interface NxDepartmentOrdersDao extends BaseDao<NxDepartmentOrdersEntity> {

    List<NxDepartmentOrdersEntity> queryDisOrdersByParams(Map<String, Object> map);

    List<NxDepartmentEntity> queryDistributerTodayOrders(Integer disId);


    List<NxDepartmentOrdersEntity> disGetUnPlanPurchaseApplys(Integer disId);

    List<NxDepartmentOrdersEntity> disGetUnPlanPurchaseGoodsByFatherGoodsId(Integer nxGoodsId);

    List<NxDepartmentOrdersEntity> queryOrders(Map<String, Object> map1);

    List<NxDepartmentOrdersEntity> queryKindsOfOrders(Map<String, Object> map);


    List<NxDepartmentOrdersEntity> queryDepartmentTodayOrders(Integer depId);

    Integer queryNewOrders(Integer nxDepartmentId);

    Integer queryFatherNewOrders(Integer nxDepartmentId);


    int queryDisOrdersTotal(Map<String, Object> map);

    List<NxDepartmentOrdersEntity> queryIndependentOrdersByLimit(Map<String, Object> map);

    int queryIndependentOrdersTotal(Map<String, Object> map);
}
