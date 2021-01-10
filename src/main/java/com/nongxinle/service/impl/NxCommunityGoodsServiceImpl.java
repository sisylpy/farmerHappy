package com.nongxinle.service.impl;

import com.nongxinle.entity.NxCommunityGoodsEntity;
import com.nongxinle.entity.NxDistributerGoodsEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxCommunityGoodsDao;
import com.nongxinle.service.NxCommunityGoodsService;



@Service("NxCommunityGoodsService")
public class NxCommunityGoodsServiceImpl implements NxCommunityGoodsService {
	@Autowired
	private NxCommunityGoodsDao nxCommunityGoodsDao;
	
	@Override
	public NxCommunityGoodsEntity queryObject(Integer communityGoodsId){
		return nxCommunityGoodsDao.queryObject(communityGoodsId);
	}
	
	@Override
	public List<NxCommunityGoodsEntity> queryList(Map<String, Object> map){
		return nxCommunityGoodsDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxCommunityGoodsDao.queryTotal(map);
	}
	
	@Override
	public void save(NxCommunityGoodsEntity nxCommunityGoods){
		nxCommunityGoodsDao.save(nxCommunityGoods);
	}
	
	@Override
	public void update(NxCommunityGoodsEntity nxCommunityGoods){
		nxCommunityGoodsDao.update(nxCommunityGoods);
	}
	
	@Override
	public void delete(Integer commGoodsId){
		nxCommunityGoodsDao.delete(commGoodsId);
	}
	
	@Override
	public void deleteBatch(Integer[] commGoodsIds){
		nxCommunityGoodsDao.deleteBatch(commGoodsIds);
	}

    @Override
    public List<NxCommunityGoodsEntity> queryCommunityGoods(Map<String, Object> map) {

		return nxCommunityGoodsDao.queryCommunityGoods(map);
    }

    @Override
    public int queryTotalByFatherId(Map<String, Object> map) {

		return nxCommunityGoodsDao.queryTotalByFatherId(map);
    }

    @Override
    public List<NxCommunityGoodsEntity> queryDisDownloadGoods(Map<String, Object> map) {

		return nxCommunityGoodsDao.queryDisDownloadGoods(map);
    }

//    @Override
//    public NxCommunityGoodsEntity queryGoods(Map<String, Object> map) {
//
//		return nxCommunityGoodsDao.queryGoods(map);
//    }
//
//    @Override
//    public List<NxCommunityGoodsEntity> queryPlanGoods(Map<String, Object> planMap) {
//
//		return  nxCommunityGoodsDao.queryPlanGoods(planMap);
//    }

//    @Override
//    public List<NxCommunityGoodsEntity> queryPurchaseGoods(Map<String, Object> map) {
//        return nxCommunityGoodsDao.queryPurchaseGoods(map);
//    }

    @Override
    public List<NxCommunityGoodsEntity> queryCommunityDownloadGoods(Map<String, Object> map) {

		return nxCommunityGoodsDao.queryCommunityDownloadGoods(map);
    }

	@Override
	public List<NxCommunityGoodsEntity> querySupplierGoods(Map<String, Object> map) {
		return nxCommunityGoodsDao.querySupplierGoods(map);

	}

    @Override
    public List<NxCommunityGoodsEntity>  queryHasNxGoodsFather(Map<String, Object> map) {
        return nxCommunityGoodsDao.queryHasNxGoodsFather(map);
    }

    @Override
    public List<NxCommunityGoodsEntity> queryStockGoods(Map<String, Object> map) {
        return nxCommunityGoodsDao.queryStockGoods(map);
    }

	@Override
	public List<NxCommunityGoodsEntity> queryCommunityGoodsWithPinyin(Map<String, Object> map) {
		return nxCommunityGoodsDao.queryCommunityGoodsWithPinyin(map);
	}

    @Override
    public List<NxCommunityGoodsEntity> queryComGoodsHasNxGoodsFather(Map<String, Object> map) {

		return nxCommunityGoodsDao.queryComGoodsHasNxGoodsFather(map);
    }

    @Override
    public List<NxCommunityGoodsEntity> queryComGoodsByParams(Map<String, Object> map7) {

		return nxCommunityGoodsDao.queryComGoodsByParams(map7);

    }

    @Override
    public NxCommunityGoodsEntity queryComGoodsDetail(Integer comGoodsId) {

		return nxCommunityGoodsDao.queryComGoodsDetail(comGoodsId);
    }

    @Override
    public List<NxCommunityGoodsEntity> queryAddCommunityNxGoods(Map<String, Object> map) {

		return nxCommunityGoodsDao.queryAddCommunityNxGoods(map);
    }

    @Override
    public List<NxCommunityGoodsEntity> queryComGoodsQuickSearchStr(Map<String, Object> map) {

		return nxCommunityGoodsDao.queryComGoodsQuickSearchStr(map);
    }

	@Override
	public List<NxCommunityGoodsEntity> queryComGoodsQuickSearchPinyin(Map<String, Object> map2) {
		return nxCommunityGoodsDao.queryComGoodsQuickSearchPinyin(map2);
	}

}
