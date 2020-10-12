package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 10-11 17:01
 */

import com.nongxinle.entity.NxDepartmentBillEntity;

import java.util.List;
import java.util.Map;


public interface NxDepartmentBillDao extends BaseDao<NxDepartmentBillEntity> {

    List<NxDepartmentBillEntity> queryBillsByParams(Map<String, Object> map);
}
