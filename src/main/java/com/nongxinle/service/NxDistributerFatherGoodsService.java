package com.nongxinle.service;

/**
 *
 *
 * @author lpy
 * @date 07-27 17:38
 */

import com.nongxinle.entity.NxDepartmentOrdersEntity;
import com.nongxinle.entity.NxDistributerFatherGoodsEntity;
import com.nongxinle.entity.NxDistributerGoodsEntity;
import com.nongxinle.entity.NxGoodsEntity;

import java.util.List;
import java.util.Map;

public interface NxDistributerFatherGoodsService {

	void save(NxDistributerFatherGoodsEntity nxDistributerFatherGoods);

	void delete(Integer nxDistributerFatherGoodsId);

	List<NxDistributerFatherGoodsEntity> queryDistributerGoodsCata(Integer disId);

	List<NxDistributerFatherGoodsEntity> queryHasDisFathersFather(Map<String, Object> map2);

	List<NxDistributerFatherGoodsEntity> queryDisFathersGoodsByParams(Map<String, Object> map);

	void update(NxDistributerFatherGoodsEntity nxDistributerFatherGoods);


//
	NxDistributerFatherGoodsEntity queryObject(Integer nxDistributerFatherGoodsId);

//
//	List<NxDistributerFatherGoodsEntity> queryList(Map<String, Object> map);
//
//	int queryTotal(Map<String, Object> map);
//
//
//
//
//	void deleteBatch(Integer[] nxDistributerFatherGoodsIds);



}
