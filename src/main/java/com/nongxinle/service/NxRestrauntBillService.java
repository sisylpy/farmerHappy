package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 12-13 09:47
 */

import com.nongxinle.entity.NxRestrauntBillEntity;

import java.util.List;
import java.util.Map;

public interface NxRestrauntBillService {
	
	NxRestrauntBillEntity queryObject(Integer nxRestrauntBillId);
	
	List<NxRestrauntBillEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxRestrauntBillEntity nxRestrauntBill);
	
	void update(NxRestrauntBillEntity nxRestrauntBill);
	
	void delete(Integer nxRestrauntBillId);
	
	void deleteBatch(Integer[] nxRestrauntBillIds);

	Integer restrauntCashPay(NxRestrauntBillEntity billEntity);

    List<NxRestrauntBillEntity> queryRestrauntBillsByParams(Map<String, Object> map);

	int queryTotalRestrauntBillByParams(Map<String, Object> map1);

    NxRestrauntBillEntity queryRestrauntBillApplys(Integer billId);
}
