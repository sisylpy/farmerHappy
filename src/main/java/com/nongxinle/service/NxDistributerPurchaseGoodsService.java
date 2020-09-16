package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 06-24 11:45
 */

import com.nongxinle.entity.NxDistributerFatherGoodsEntity;
import com.nongxinle.entity.NxDistributerPurchaseGoodsEntity;

import java.util.List;
import java.util.Map;

public interface NxDistributerPurchaseGoodsService {


	List<NxDistributerFatherGoodsEntity> queryDisPurchaseGoods(Map<String, Object> map);


//	//////////////////

	List<NxDistributerPurchaseGoodsEntity> purUserGetPurchaseGoods(Integer purUserId);


	NxDistributerPurchaseGoodsEntity queryObject(Integer nxDistributerPurchaseGoods);
	
	List<NxDistributerPurchaseGoodsEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxDistributerPurchaseGoodsEntity nxDistributerPurchaseGoods);
	
	void update(NxDistributerPurchaseGoodsEntity nxDistributerPurchaseGoods);
	
	void delete(Integer nxDistributerPurchaseGoods);
	
	void deleteBatch(Integer[] nxDistributerPurchaseGoodss);


//	List<NxDistributerPurchaseGoodsEntity> queryPurchaseGoodsByUUID(String uuid);

	List<NxDistributerPurchaseGoodsEntity> queryPurchaseGoodsByGoodsId(Map<String, Object> map);


    List<NxDistributerPurchaseGoodsEntity> queryPurchaseGoodsByBatchId(Integer purchaseBatchId);

}
