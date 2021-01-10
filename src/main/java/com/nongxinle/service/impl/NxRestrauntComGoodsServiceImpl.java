package com.nongxinle.service.impl;

import com.nongxinle.entity.NxCommunityFatherGoodsEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxRestrauntComGoodsDao;
import com.nongxinle.entity.NxRestrauntComGoodsEntity;
import com.nongxinle.service.NxRestrauntComGoodsService;



@Service("nxRestaruantComGoodsService")
public class NxRestrauntComGoodsServiceImpl implements NxRestrauntComGoodsService {
	@Autowired
	private NxRestrauntComGoodsDao nxRestrauntComGoodsDao;
	
	@Override
	public NxRestrauntComGoodsEntity queryObject(Integer nxRestrauntComGoodsId){
		return nxRestrauntComGoodsDao.queryObject(nxRestrauntComGoodsId);
	}
	
	@Override
	public List<NxRestrauntComGoodsEntity> queryList(Map<String, Object> map){
		return nxRestrauntComGoodsDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxRestrauntComGoodsDao.queryTotal(map);
	}
	
	@Override
	public void save(NxRestrauntComGoodsEntity nxRestaruantComGoods){
		nxRestrauntComGoodsDao.save(nxRestaruantComGoods);
	}
	
	@Override
	public void update(NxRestrauntComGoodsEntity nxRestaruantComGoods){
		nxRestrauntComGoodsDao.update(nxRestaruantComGoods);
	}
	
	@Override
	public void delete(Integer nxRestrauntComGoodsId){
		nxRestrauntComGoodsDao.delete(nxRestrauntComGoodsId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxRestrauntComGoodsIds){
		nxRestrauntComGoodsDao.deleteBatch(nxRestrauntComGoodsIds);
	}

    @Override
    public List<NxRestrauntComGoodsEntity> queryResComGoodsByParams(Map<String, Object> map) {

		return nxRestrauntComGoodsDao.queryResComGoodsByParams(map);
    }

    @Override
    public List<NxCommunityFatherGoodsEntity> resGetResComGoodsCata(Map<String, Object> map) {
        return nxRestrauntComGoodsDao.resGetResComGoodsCata(map);
    }

    @Override
    public List<NxRestrauntComGoodsEntity> queryResGoodsByFatherId(Map<String, Object> map) {

		return nxRestrauntComGoodsDao.queryResGoodsByFatherId(map);
    }

    @Override
    public int queryComGoodsTotal(Map<String, Object> map3) {

		return nxRestrauntComGoodsDao.queryComGoodsTotal(map3);
    }

    @Override
    public List<NxCommunityFatherGoodsEntity> queryHistoryGoods(Map<String, Object> map) {

		return nxRestrauntComGoodsDao.queryHistoryGoods(map);
    }

}
