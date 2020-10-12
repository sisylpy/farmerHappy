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
import com.nongxinle.entity.NxDistributerFatherGoodsEntity;

import java.util.List;
import java.util.Map;


public interface NxDepartmentOrdersDao extends BaseDao<NxDepartmentOrdersEntity> {

    List<NxDepartmentOrdersEntity> queryDisOrdersByParams(Map<String, Object> map);

    List<NxDepartmentEntity> queryDistributerTodayOrders(Integer disId);

    List<NxDistributerFatherGoodsEntity>  disGetUnPlanPurchaseApplys(Integer disId);

    Integer queryNewOrders(Integer nxDepartmentId);

    Integer queryFatherNewOrders(Integer nxDepartmentId);


    List<NxDepartmentOrdersEntity> queryOrdersForDisGoods(Map<String, Object> map1);
}
