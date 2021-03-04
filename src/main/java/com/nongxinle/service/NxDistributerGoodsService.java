package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 07-27 17:38
 */

import com.nongxinle.entity.NxDistributerFatherGoodsEntity;
import com.nongxinle.entity.NxDistributerGoodsEntity;
import com.nongxinle.entity.NxGoodsEntity;

import java.util.List;
import java.util.Map;

public interface NxDistributerGoodsService {


	List<NxDistributerGoodsEntity> queryDisGoodsByParams(Map<String, Object> map);

	int queryDisGoodsTotal(Map<String, Object> map3);



	NxDistributerGoodsEntity queryObject(Integer nxDistributerGoodsId);
	
	List<NxDistributerGoodsEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxDistributerGoodsEntity nxDistributerGoods);
	
	void update(NxDistributerGoodsEntity nxDistributerGoods);

	int delete(Integer nxDistributerGoodsId);
	
	void deleteBatch(Integer[] nxDistributerGoodsIds);

    List<NxDistributerGoodsEntity> queryDisGoodsHasNxGoodsFather(Map<String, Object> map);

    List<NxDistributerGoodsEntity> queryAddDistributerNxGoods(Map<String, Object> map);


    NxDistributerGoodsEntity queryDisGoodsDetail(Integer disGoodsId);



    List<NxDistributerGoodsEntity> queryDisGoodsQuickSearchStr(Map<String, Object> map);


	List<NxDistributerGoodsEntity> queryDisGoodsQuickSearchPinyin(Map<String, Object> map2);

    List<NxDistributerGoodsEntity> querydisGoodsByNxGoodsId(Integer nxSGoodsId);


    List<NxDistributerGoodsEntity> queryDgSubNameByFatherId(Integer nxDistributerFatherGoodsId);
}
