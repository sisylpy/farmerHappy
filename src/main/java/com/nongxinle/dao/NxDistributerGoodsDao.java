package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 07-27 17:38
 */

import com.nongxinle.entity.NxDistributerGoodsEntity;
import com.nongxinle.entity.NxGoodsEntity;

import java.util.List;
import java.util.Map;


public interface NxDistributerGoodsDao extends BaseDao<NxDistributerGoodsEntity> {

    List<NxDistributerGoodsEntity> queryDisGoodsByParams(Map<String, Object> map);

    int queryDisGoodsTotal(Map<String, Object> map3);


    List<NxDistributerGoodsEntity> queryDisGoodsHasNxGoodsFather(Map<String, Object> map);

    List<NxDistributerGoodsEntity> queryAddDistributerNxGoods(Map<String, Object> map);

    List<NxGoodsEntity> queryAllDistributerGoodsCata(Integer disId);

    Integer queryGrandSubAmount(Integer nxGrandGoodsId);

    List<NxGoodsEntity> queryDisGoodsGrandList(Map<String, Object> map);

    NxDistributerGoodsEntity queryDisGoodsDetail(Integer disGoodsId);

    Integer querySubAmount(Integer nxGoodsId);

    List<NxDistributerGoodsEntity> queryDisGoodsFatherList(Map<String, Object> map);

    List<NxDistributerGoodsEntity> queryDisGoodsQuickSearchStr(Map<String, Object> map);

    NxDistributerGoodsEntity queryDisGoodsWithStandards(Integer nxDdgDisGoodsId);

    List<NxDistributerGoodsEntity> queryIfHasDisGoods(Map<String, Object> map1);

    List<NxDistributerGoodsEntity> queryIfFatherHasOtherDisGoods(Integer nxDgDfgGoodsFatherId);

    List<NxDistributerGoodsEntity> queryDisGoodsQuickSearchPinyin(Map<String, Object> map2);

    List<NxDistributerGoodsEntity> queryDisGoodsByNxGoodsId(Integer nxSGoodsId);

    List<NxDistributerGoodsEntity> queryDgSubNameByFatherId(Integer nxDistributerFatherGoodsId);
}
