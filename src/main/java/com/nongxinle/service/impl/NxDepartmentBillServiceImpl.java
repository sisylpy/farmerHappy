package com.nongxinle.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDepartmentBillDao;
import com.nongxinle.entity.NxDepartmentBillEntity;
import com.nongxinle.service.NxDepartmentBillService;



@Service("nxDepartmentBillService")
public class NxDepartmentBillServiceImpl implements NxDepartmentBillService {
	@Autowired
	private NxDepartmentBillDao nxDepartmentBillDao;
	
	@Override
	public NxDepartmentBillEntity queryObject(Integer nxDepartmentBillId){
		return nxDepartmentBillDao.queryObject(nxDepartmentBillId);
	}

	@Override
	public int queryTotal(Map<String, Object> map){
		return nxDepartmentBillDao.queryTotal(map);
	}
	
	@Override
	public void save(NxDepartmentBillEntity nxDepartmentBill){
		nxDepartmentBillDao.save(nxDepartmentBill);
	}
	
	@Override
	public void update(NxDepartmentBillEntity nxDepartmentBill){
		nxDepartmentBillDao.update(nxDepartmentBill);
	}
	
	@Override
	public void delete(Integer nxDepartmentBillId){
		nxDepartmentBillDao.delete(nxDepartmentBillId);
	}

    @Override
    public List<NxDepartmentBillEntity> queryBillsByParams(Map<String, Object> map) {
     return   nxDepartmentBillDao.queryBillsByParams(map);
    }


}
