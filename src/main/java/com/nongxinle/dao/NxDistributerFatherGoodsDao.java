package com.nongxinle.dao;

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


public interface NxDistributerFatherGoodsDao extends BaseDao<NxDistributerFatherGoodsEntity> {

    List<NxDistributerFatherGoodsEntity> queryDisGoodsCata(Integer disId);

    List<NxDistributerFatherGoodsEntity> queryHasDisFathersFather(Map<String, Object> map2);

    List<NxDistributerFatherGoodsEntity> queryDisFathersGoodsByParams(Map<String, Object> map);


//    List<NxDistributerFatherGoodsEntity> queryHasGreatGrandGoods(Map<String, Object> map3);

}
