package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 10-11 17:01
 */

import com.nongxinle.entity.NxDepartmentBillEntity;

import java.util.List;
import java.util.Map;

public interface NxDepartmentBillService {
	
	NxDepartmentBillEntity queryObject(Integer nxDepartmentBillId);

	int queryTotal(Map<String, Object> map);

	void save(NxDepartmentBillEntity nxDepartmentBill);

	void update(NxDepartmentBillEntity nxDepartmentBill);

	void delete(Integer nxDepartmentBillId);

    List<NxDepartmentBillEntity> queryBillsByParams(Map<String, Object> map);
}
