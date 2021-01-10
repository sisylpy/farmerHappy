package com.nongxinle.service.impl;

import com.nongxinle.entity.NxSupplierEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxECommerceSupplierDao;
import com.nongxinle.entity.NxECommerceSupplierEntity;
import com.nongxinle.service.NxECommerceSupplierService;



@Service("nxECommerceSupplierService")
public class NxECommerceSupplierServiceImpl implements NxECommerceSupplierService {
	@Autowired
	private NxECommerceSupplierDao nxECommerceSupplierDao;
	
	@Override
	public NxECommerceSupplierEntity queryObject(Integer nxDistributerSupplierId){
		return nxECommerceSupplierDao.queryObject(nxDistributerSupplierId);
	}
	
	@Override
	public List<NxECommerceSupplierEntity> queryList(Map<String, Object> map){
		return nxECommerceSupplierDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxECommerceSupplierDao.queryTotal(map);
	}
	
	@Override
	public void save(NxECommerceSupplierEntity nxECommerceSupplier){
		nxECommerceSupplierDao.save(nxECommerceSupplier);
	}
	
	@Override
	public void update(NxECommerceSupplierEntity nxECommerceSupplier){
		nxECommerceSupplierDao.update(nxECommerceSupplier);
	}
	
	@Override
	public void delete(Integer nxDistributerSupplierId){
		nxECommerceSupplierDao.delete(nxDistributerSupplierId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxDistributerSupplierIds){
		nxECommerceSupplierDao.deleteBatch(nxDistributerSupplierIds);
	}

    @Override
    public List<NxSupplierEntity> queryCommerceSupplierByComId(Integer commerceId) {

		return nxECommerceSupplierDao.queryCommerceSupplierByComId(commerceId);
    }

}
