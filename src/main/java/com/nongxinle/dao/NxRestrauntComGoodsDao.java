package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 12-01 08:51
 */

import com.nongxinle.entity.NxCommunityFatherGoodsEntity;
import com.nongxinle.entity.NxRestrauntComGoodsEntity;

import java.util.List;
import java.util.Map;


public interface NxRestrauntComGoodsDao extends BaseDao<NxRestrauntComGoodsEntity> {

    List<NxRestrauntComGoodsEntity> queryResComGoodsByParams(Map<String, Object> map);

    List<NxCommunityFatherGoodsEntity> resGetResComGoodsCata(Map<String, Object> map);

    List<NxRestrauntComGoodsEntity> queryResGoodsByFatherId(Map<String, Object> map);

    int queryComGoodsTotal(Map<String, Object> map3);

    List<NxCommunityFatherGoodsEntity> queryHistoryGoods(Map<String, Object> map);

    List<NxRestrauntComGoodsEntity> queryHistoryGoodsQuickSearchStr(Map<String, Object> map1);

    List<NxCommunityFatherGoodsEntity> queryOrderUserGoods(Map<String, Object> map);

    List<NxCommunityFatherGoodsEntity> queryOrderResGoods(Map<String, Object> map);

    List<NxRestrauntComGoodsEntity> orderUserQueryResComGoodsQuickSearchStr(Map<String, Object> map);

    List<NxRestrauntComGoodsEntity> ordreUserQueryHistoryGoodsQuickSearchStr(Map<String, Object> map1);

    void deleteResComGoods(Map<String, Object> map1);
}
