package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 06-25 22:52
 */

import com.nongxinle.entity.NxDistributerPurchaseBatchEntity;
import com.nongxinle.entity.NxDistributerPurchaseGoodsEntity;

import java.util.List;
import java.util.Map;

public interface NxDistributerPurchaseBatchService {
	
	NxDistributerPurchaseBatchEntity queryObject(Integer nxDistributerPurchaseBatchId);
	
	List<NxDistributerPurchaseBatchEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	Integer save(NxDistributerPurchaseBatchEntity nxDistributerPurchaseBatch);
	
	void update(NxDistributerPurchaseBatchEntity nxDistributerPurchaseBatch);
	
	void delete(String nxDpbUuid);
	
	void deleteBatch(String[] nxDpbUuids);

	List<NxDistributerPurchaseBatchEntity> queryDisPurchaseBatch(Map<String, Object> map);

    void deleteBatchId(Integer purchaseBatchId);

//	List<NxDistributerPurchaseGoodsEntity> queryPurRoleBatchs(Map<String, Object> map2);
}
