package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 11-28 21:17
 */

import com.nongxinle.entity.NxECommerceSupplierEntity;
import com.nongxinle.entity.NxSupplierEntity;

import java.util.List;
import java.util.Map;

public interface NxECommerceSupplierService {
	
	NxECommerceSupplierEntity queryObject(Integer nxDistributerSupplierId);
	
	List<NxECommerceSupplierEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxECommerceSupplierEntity nxECommerceSupplier);
	
	void update(NxECommerceSupplierEntity nxECommerceSupplier);
	
	void delete(Integer nxDistributerSupplierId);
	
	void deleteBatch(Integer[] nxDistributerSupplierIds);

    List<NxSupplierEntity> queryCommerceSupplierByComId(Integer commerceId);
}
