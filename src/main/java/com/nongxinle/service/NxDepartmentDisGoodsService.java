package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 07-30 23:58
 */

import com.nongxinle.entity.*;

import java.util.List;
import java.util.Map;

public interface NxDepartmentDisGoodsService {

	List<NxDepartmentEntity> queryDepartmentsByDisGoodsId(Integer disGoodsId);

	List<NxDistributerFatherGoodsEntity> depGetDepDisGoodsCata(Integer depId);

	List<NxDepartmentDisGoodsEntity> queryDepGoodsByFatherId(Map<String, Object> map);

	List<NxDepartmentDisGoodsEntity> queryAddDisDepGoods(Map<String, Object> map);

	int queryDepGoodsTotal(Map<String, Object> map3);

	List<NxDepartmentDisGoodsEntity> queryDepDisSearchStr(Map<String, Object> map);

	void save(NxDepartmentDisGoodsEntity nxDepartmentDisGoods);

	void update(NxDepartmentDisGoodsEntity nxDepartmentDisGoods);

	NxDepartmentDisGoodsEntity queryObject(Integer nxDepartmentDisGoodsId);

    List<NxDepartmentDisGoodsEntity> queryDepDisSearchPinyin(Map<String, Object> map);

    List<NxDepartmentDisGoodsEntity> queryDepDisSearchHeadPy(Map<String, Object> map3);

//	/////


//	List<NxDistributerGoodsEntity> queryIfHasDisGoods(Map<String, Object> map);

//
//	List<NxDepartmentDisGoodsEntity> queryList(Map<String, Object> map);
//
//	int queryTotal(Map<String, Object> map);
//
//
//
//	void delete(Integer nxDepartmentDisGoodsId);
//
//	void deleteBatch(Integer[] nxDepartmentDisGoodsIds);




}
