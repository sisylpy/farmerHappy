package com.nongxinle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDistributerPurchaseGoodsDao;
import com.nongxinle.entity.NxDistributerPurchaseGoodsEntity;
import com.nongxinle.service.NxDistributerPurchaseGoodsService;



@Service("nxDistributerPurchaseGoodsService")
public class NxDistributerPurchaseGoodsServiceImpl implements NxDistributerPurchaseGoodsService {
	@Autowired
	private NxDistributerPurchaseGoodsDao nxDistributerPurchaseGoodsDao;
	
	@Override
	public NxDistributerPurchaseGoodsEntity queryObject(Integer nxDistributerPurchaseGoods){
		return nxDistributerPurchaseGoodsDao.queryObject(nxDistributerPurchaseGoods);
	}
	
	@Override
	public List<NxDistributerPurchaseGoodsEntity> queryList(Map<String, Object> map){
		return nxDistributerPurchaseGoodsDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxDistributerPurchaseGoodsDao.queryTotal(map);
	}
	
	@Override
	public void save(NxDistributerPurchaseGoodsEntity nxDistributerPurchaseGoods){
		nxDistributerPurchaseGoodsDao.save(nxDistributerPurchaseGoods);
	}
	
	@Override
	public void update(NxDistributerPurchaseGoodsEntity nxDistributerPurchaseGoods){
		nxDistributerPurchaseGoodsDao.update(nxDistributerPurchaseGoods);
	}
	
	@Override
	public void delete(Integer nxDistributerPurchaseGoods){
		nxDistributerPurchaseGoodsDao.delete(nxDistributerPurchaseGoods);
	}
	
	@Override
	public void deleteBatch(Integer[] nxDistributerPurchaseGoodss){
		nxDistributerPurchaseGoodsDao.deleteBatch(nxDistributerPurchaseGoodss);
	}

    @Override
    public List<NxDistributerPurchaseGoodsEntity> queryDisPurchaseGoods(Map<String, Object> map) {

		return nxDistributerPurchaseGoodsDao.queryDisPurchaseGoods(map);
    }

//    @Override
//    public List<NxDistributerPurchaseGoodsEntity> queryPurchaseGoodsByUUID(String uuid) {
//
//		return nxDistributerPurchaseGoodsDao.queryPurchaseGoodsByUUID(uuid);
//    }

    @Override
    public List<NxDistributerPurchaseGoodsEntity> queryPurchaseGoodsByGoodsId(Map<String, Object> map) {

		return nxDistributerPurchaseGoodsDao.queryPurchaseGoodsByGoodsId(map);
    }

    @Override
    public List<NxDistributerPurchaseGoodsEntity> purUserGetPurchaseGoods(Integer purUserId) {

		return nxDistributerPurchaseGoodsDao.queryPurUserPurchaseGoods(purUserId);
    }

    @Override
    public List<NxDistributerPurchaseGoodsEntity> queryPurchaseGoodsByBatchId(Integer purchaseBatchId) {

		return nxDistributerPurchaseGoodsDao.queryPurchaseGoodsByBatchId(purchaseBatchId);
    }

}
