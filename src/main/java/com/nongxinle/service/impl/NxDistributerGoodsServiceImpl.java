package com.nongxinle.service.impl;

import com.nongxinle.entity.NxDistributerStandardEntity;
import com.nongxinle.entity.NxGoodsEntity;
import com.nongxinle.service.NxDepartmentStandardService;
import com.nongxinle.service.NxDistributerStandardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDistributerGoodsDao;
import com.nongxinle.entity.NxDistributerGoodsEntity;
import com.nongxinle.service.NxDistributerGoodsService;



@Service("nxDistributerGoodsService")
public class NxDistributerGoodsServiceImpl implements NxDistributerGoodsService {
	@Autowired
	private NxDistributerGoodsDao nxDistributerGoodsDao;


	@Override
	public List<NxDistributerGoodsEntity> queryDisGoodsByParams(Map<String, Object> map) {
		return nxDistributerGoodsDao.queryDisGoodsByParams(map);
	}

	@Override
	public int queryDisGoodsTotal(Map<String, Object> map3) {
		return nxDistributerGoodsDao.queryDisGoodsTotal(map3);
	}





//	//////////////////////




    @Override
	public NxDistributerGoodsEntity queryObject(Integer nxDistributerGoodsId){
		return nxDistributerGoodsDao.queryObject(nxDistributerGoodsId);
	}
	
	@Override
	public List<NxDistributerGoodsEntity> queryList(Map<String, Object> map){
		return nxDistributerGoodsDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxDistributerGoodsDao.queryTotal(map);
	}
	
	@Override
	public void save(NxDistributerGoodsEntity nxDistributerGoods){
		nxDistributerGoodsDao.save(nxDistributerGoods);
	}
	
	@Override
	public void update(NxDistributerGoodsEntity nxDistributerGoods){
		nxDistributerGoodsDao.update(nxDistributerGoods);
	}
	
	@Override
	public int delete(Integer nxDistributerGoodsId){
		int delete = nxDistributerGoodsDao.delete(nxDistributerGoodsId);
		return delete;
	}
	
	@Override
	public void deleteBatch(Integer[] nxDistributerGoodsIds){
		nxDistributerGoodsDao.deleteBatch(nxDistributerGoodsIds);
	}

    @Override
    public List<NxDistributerGoodsEntity> queryDisGoodsHasNxGoodsFather(Map<String, Object> map) {

		return nxDistributerGoodsDao.queryDisGoodsHasNxGoodsFather(map);
    }

    @Override
    public List<NxDistributerGoodsEntity> queryAddDistributerNxGoods(Map<String, Object> map) {

		return nxDistributerGoodsDao.queryAddDistributerNxGoods(map);
    }


	@Override
	public NxDistributerGoodsEntity queryDisGoodsDetail(Integer disGoodsId) {
		return nxDistributerGoodsDao.queryDisGoodsDetail(disGoodsId);
	}



    @Override
    public List<NxDistributerGoodsEntity> queryQuickSearch(Map<String, Object> map) {

		return nxDistributerGoodsDao.queryQuickSearch(map);
    }


    @Override
    public List<NxDistributerGoodsEntity> queryIfHasDisGoods(Map<String, Object> map1) {

		return nxDistributerGoodsDao.queryIfHasDisGoods(map1);
    }

//    @Override
//    public Integer deleteDisGoods(Map<String, Object> map) {
//		Integer integer = nxDistributerGoodsDao.deleteDisGoods(map);
//		return integer;
//
//	}



}
