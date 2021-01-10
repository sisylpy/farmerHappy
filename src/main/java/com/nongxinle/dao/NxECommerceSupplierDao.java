package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 11-28 21:17
 */

import com.nongxinle.entity.NxECommerceSupplierEntity;
import com.nongxinle.entity.NxSupplierEntity;

import java.util.List;


public interface NxECommerceSupplierDao extends BaseDao<NxECommerceSupplierEntity> {

    List<NxSupplierEntity> queryCommerceSupplierByComId(Integer commerceId);
}
