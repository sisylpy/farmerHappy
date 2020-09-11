package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 06-21 21:51
 */

import com.nongxinle.entity.NxDepartmentEntity;
import com.nongxinle.entity.NxDepartmentOrdersEntity;

import java.util.List;
import java.util.Map;

public interface NxDepartmentOrdersService {


	List<NxDepartmentOrdersEntity> queryDisOrdersByParams(Map<String, Object> map);

	List<NxDepartmentEntity> queryDistributerTodayOrders(Integer disId);

	void save(NxDepartmentOrdersEntity nxDepartmentOrders);


//	////////





	NxDepartmentOrdersEntity queryObject(Integer nxDepartmentOrdersId);
	
	List<NxDepartmentOrdersEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	

	void update(NxDepartmentOrdersEntity nxDepartmentOrders);
	
	void delete(Integer nxDepartmentOrdersId);
	
	void deleteBatch(Integer[] nxDepartmentOrdersIds);



	List<NxDepartmentOrdersEntity> disGetUnPlanPurchaseApplys(Integer disId);

	List<NxDepartmentOrdersEntity> disGetUnPlanPurchaseGoodsByFatherGoodsId(Integer nxGoodsId);

//	Map<String, Object> queryDistributerIndexData(Integer disId);

    List<NxDepartmentOrdersEntity> queryToFillDepOrders(Map<String, Object> map);


	List<NxDepartmentOrdersEntity> queryDepartmentTodayOrders(Integer depId);

    Integer queryNewOrders(Integer nxDepartmentId);

	Integer queryFatherNewOrders(Integer nxDepartmentId);


	int queryDisOrdersTotal(Map<String, Object> map);

    List<NxDepartmentOrdersEntity> queryIndependentOrdersByLimit(Map<String, Object> map);

	int queryIndependentOrdersTotal(Map<String, Object> map);
}
