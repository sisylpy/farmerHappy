package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 06-21 21:51
 */

import com.nongxinle.entity.*;

import java.util.List;
import java.util.Map;


public interface NxDepartmentOrdersDao extends BaseDao<NxDepartmentOrdersEntity> {

    List<NxDepartmentOrdersEntity> queryDisOrdersByParams(Map<String, Object> map);

    List<NxDepartmentEntity> queryDistributerTodayDepartments(Map<String, Object> map);

    List<NxDistributerFatherGoodsEntity>  disGetUnPlanPurchaseApplys(Map<String, Object> map);

    List<NxDepartmentOrdersEntity> queryOrdersForDisGoods(Map<String, Object> map1);

    int queryTotalByParams(Map<String, Object> map);

//    List<NxDepartmentOrdersEntity> queryDepChainOrdersByParams(Map<String, Object> map);

    List<NxCommunityEntity> queryDistributerTodayCommunity(Map<String, Object> map3);
}
