package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 05-09 21:11
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.NxDepartmentEntity;
import com.nongxinle.service.NxDepartmentService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDistributerDepartmentEntity;
import com.nongxinle.service.NxDistributerDepartmentService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxdistributerdepartment")
public class NxDistributerDepartmentController {
	@Autowired
	private NxDistributerDepartmentService nxDistributerDepartmentService;

	@Autowired
	private NxDepartmentService nxDepartmentService;


	@RequestMapping(value = "/disGetCustomerToReplaceOrder/{disId}")
	@ResponseBody
	public R disGetCustomerToReplaceOrder(@PathVariable Integer disId) {
		Map<String, Object> map = new HashMap<>();
		map.put("disId", disId);
		map.put("isGroup", 1);
		map.put("subAmount", 0);
		List<NxDepartmentEntity> entities =  nxDistributerDepartmentService.queryDisDepartmentsBySettleType(map);


		return R.ok().put("data", entities);
	}

	/**
	 * 获取批发商客户列表
	 * @param disId 批发商id
	 * @return 客户列表
	 */
	@RequestMapping(value = "/disGetAllCustomer/{disId}")
	@ResponseBody
	public R disGetAllDisDepartments(@PathVariable Integer disId) {

		Map<String, Object> map = new HashMap<>();
		map.put("disId", disId);
		map.put("type", 1);
		List<NxDepartmentEntity> entities =  nxDistributerDepartmentService.queryDisDepartmentsBySettleType(map);
		Map<String, Object> map1 = new HashMap<>();
		map1.put("disId", disId);
		map1.put("type", 2);
		List<NxDepartmentEntity> entities2 =  nxDistributerDepartmentService.queryDisDepartmentsBySettleType(map1);

		Map<String, Object> mapData = new HashMap<>();
		mapData.put("settleTypeOne", entities);
		mapData.put("settleTypeTwo", entities2);
		return R.ok().put("data", mapData);
	}

	/**
	 * 批发商添加客户
	 * @param distributerDepartmentEntity 客户
	 * @return 0
	 */
	@RequestMapping(value = "/saveOneCustomer", method = RequestMethod.POST)
	@ResponseBody
	public R saveOneCustomer (@RequestBody NxDistributerDepartmentEntity distributerDepartmentEntity)  {

		NxDepartmentEntity nxDepartmentEntity = distributerDepartmentEntity.getNxDepartmentEntity();

		//1,保存部门
		nxDepartmentService.saveJustDepartment(nxDepartmentEntity);

		//2，保存批发商部门
		Integer nxDepartmentId = nxDepartmentEntity.getNxDepartmentId();
		distributerDepartmentEntity.setNxDdDepartmentId(nxDepartmentId);
		nxDistributerDepartmentService.save(distributerDepartmentEntity);

		//3，如果有子部门，则保存子部门
		List<NxDepartmentEntity> nxDepartmentEntities = nxDepartmentEntity.getNxDepartmentEntities();
		if(nxDepartmentEntities.size() > 0){
			for (NxDepartmentEntity sub : nxDepartmentEntities) {
				sub.setNxDepartmentFatherId(nxDepartmentId);
				nxDepartmentService.saveJustDepartment(sub);
			}
		}
		return R.ok();
	}



}
