package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 10-11 17:01
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.NxDepartmentOrdersEntity;
import com.nongxinle.service.NxDepartmentOrdersService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDepartmentBillEntity;
import com.nongxinle.service.NxDepartmentBillService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;

import static com.nongxinle.utils.DateUtils.formatWhatDay;


@RestController
@RequestMapping("api/nxdepartmentbill")
public class NxDepartmentBillController {
	@Autowired
	private NxDepartmentBillService nxDepartmentBillService;
	@Autowired
	private NxDepartmentOrdersService nxDepartmentOrdersService;


	@RequestMapping(value = "/disGetBills", method = RequestMethod.POST)
	@ResponseBody
	public R disGetBills (@RequestBody NxDepartmentBillEntity billEntity ) {
		Integer nxDbDisId = billEntity.getNxDbDisId();
		Integer nxDbDepId = billEntity.getNxDbDepId();
		Map<String, Object> map = new HashMap<>();
		map.put("disId", nxDbDisId);
		map.put("depId", nxDbDepId);
		map.put("status", 1);
		List<NxDepartmentBillEntity> billEntityList = nxDepartmentBillService.queryBillsByParams(map);
		return R.ok().put("data", billEntityList);
	}

	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	public R save(@RequestBody NxDepartmentBillEntity nxDepartmentBill){
		List<NxDepartmentOrdersEntity> nxDepartmentOrdersEntities = nxDepartmentBill.getNxDepartmentOrdersEntities();

		for (NxDepartmentOrdersEntity orders : nxDepartmentOrdersEntities) {
			orders.setNxDoStatus(3);
			nxDepartmentOrdersService.update(orders);
		}
		nxDepartmentBill.setNxDbStatus(0);
		nxDepartmentBill.setNxDbTime(formatWhatDay(0));
		nxDepartmentBillService.save(nxDepartmentBill);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
	@RequiresPermissions("nxdepartmentbill:update")
	public R update(@RequestBody NxDepartmentBillEntity nxDepartmentBill){
		nxDepartmentBillService.update(nxDepartmentBill);
		
		return R.ok();
	}
	

	
}
