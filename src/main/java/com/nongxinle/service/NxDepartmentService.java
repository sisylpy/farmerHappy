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

	String saveNewRestraunt(NxDepartmentEntity dep);

	List<NxDepartmentEntity>  queryGroupInfo(String openId);

	Map<String, Object> queryDepAndUserInfo(Integer nxDepartmentUserId);

	void saveJustDepartment(NxDepartmentEntity nxDepartmentEntity);





	NxDepartmentEntity queryObject(Integer nxDepartmentId);
	
	List<NxDepartmentEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(NxDepartmentEntity nxDepartment);
	
	void update(NxDepartmentEntity nxDepartment);
	
	void delete(Integer nxDepartmentId);
	
	void deleteBatch(Integer[] nxDepartmentIds);


	List<NxDepartmentEntity> querySubDepartments(Integer depId);




}
