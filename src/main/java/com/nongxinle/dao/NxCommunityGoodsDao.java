package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 2020-02-10 19:43:11
 */

import com.nongxinle.entity.NxCommunityGoodsEntity;
import com.nongxinle.entity.NxDistributerGoodsEntity;

import java.util.List;
import java.util.Map;


public interface NxCommunityGoodsDao extends BaseDao<NxCommunityGoodsEntity> {

    List<NxCommunityGoodsEntity> queryCommunityGoods(Map<String, Object> map);

    int queryTotalByFatherId(Map<String, Object> map);

    List<NxCommunityGoodsEntity> queryDisDownloadGoods(Map<String, Object> map);

//    NxCommunityGoodsEntity queryGoods(Map<String, Object> map);

//    List<NxCommunityGoodsEntity> queryPlanGoods(Map<String, Object> planMap);

//    List<NxCommunityGoodsEntity> queryPurchaseGoods(Map<String, Object> map);

    List<NxCommunityGoodsEntity> queryCommunityDownloadGoods(Map<String, Object> map);

    List<NxCommunityGoodsEntity> querySupplierGoods(Map<String, Object> map);

    List<NxCommunityGoodsEntity>  queryHasNxGoodsFather(Map<String, Object> map);

    List<NxCommunityGoodsEntity> queryStockGoods(Map<String, Object> map);

    List<NxCommunityGoodsEntity> queryCommunityGoodsWithPinyin(Map<String, Object> map);

    List<NxCommunityGoodsEntity> queryComGoodsHasNxGoodsFather(Map<String, Object> map);

    List<NxCommunityGoodsEntity> queryComGoodsByParams(Map<String, Object> map7);

    NxCommunityGoodsEntity queryComGoodsDetail(Integer comGoodsId);

    List<NxCommunityGoodsEntity> queryAddCommunityNxGoods(Map<String, Object> map);

    List<NxCommunityGoodsEntity> queryComGoodsQuickSearchStr(Map<String, Object> map);

    List<NxCommunityGoodsEntity> queryComGoodsQuickSearchPinyin(Map<String, Object> map2);

}
