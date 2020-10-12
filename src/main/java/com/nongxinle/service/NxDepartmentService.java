package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 06-16 11:26
 */

import com.nongxinle.entity.NxDepartmentEntity;

import java.util.List;
import java.util.Map;

public interface NxDepartmentService {

	Integer saveNewRestraunt(NxDepartmentEntity dep);

	List<NxDepartmentEntity>  queryMultiGroupInfo(String openId);

	Map<String, Object> queryDepAndUserInfo(Integer nxDepartmentUserId);

	void saveJustDepartment(NxDepartmentEntity nxDepartmentEntity);

	List<NxDepartmentEntity> querySubDepartments(Integer depId);

	void save(NxDepartmentEntity nxDepartment);

	NxDepartmentEntity queryObject(Integer nxDepartmentId);

	void update(NxDepartmentEntity nxDepartment);



//
//
//
//	List<NxDepartmentEntity> queryList(Map<String, Object> map);
//
//	int queryTotal(Map<String, Object> map);
//
//
//
//	void delete(Integer nxDepartmentId);
//
//	void deleteBatch(Integer[] nxDepartmentIds);






}
