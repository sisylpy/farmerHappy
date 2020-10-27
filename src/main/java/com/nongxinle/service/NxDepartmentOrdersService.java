package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 06-21 21:51
 */

import com.nongxinle.entity.NxDepartmentEntity;
import com.nongxinle.entity.NxDepartmentOrdersEntity;
import com.nongxinle.entity.NxDistributerFatherGoodsEntity;

import java.util.List;
import java.util.Map;

public interface NxDepartmentOrdersService {


	List<NxDepartmentOrdersEntity> queryDisOrdersByParams(Map<String, Object> map);

	List<NxDepartmentEntity> queryDistributerTodayDepartments(Map<String, Object> map);

	void save(NxDepartmentOrdersEntity nxDepartmentOrders);

	List<NxDistributerFatherGoodsEntity>  disGetUnPlanPurchaseApplys(Map<String, Object> map);
	List<NxDepartmentOrdersEntity> queryOrdersForDisGoods(Map<String, Object> map1);


//	////////



	NxDepartmentOrdersEntity queryObject(Integer nxDepartmentOrdersId);
	
	List<NxDepartmentOrdersEntity> queryList(Map<String, Object> map);

	void update(NxDepartmentOrdersEntity nxDepartmentOrders);
	
	void delete(Integer nxDepartmentOrdersId);






}
