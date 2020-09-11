package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 06-25 22:52
 */

import com.nongxinle.entity.NxDistributerPurchaseBatchEntity;

import java.util.List;
import java.util.Map;


public interface NxDistributerPurchaseBatchDao extends BaseDao<NxDistributerPurchaseBatchEntity> {

    List<NxDistributerPurchaseBatchEntity> queryDisPurchaseBatch(Map<String, Object> map);

    void delateBatchId(Integer purchaseBatchId);

}
