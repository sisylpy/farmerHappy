package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 2020-03-04 19:11:55
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.NxOrderTemplateEntity;
import com.nongxinle.service.NxOrderTemplateService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxCustomerUserEntity;
import com.nongxinle.service.NxCustomerUserService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxcustomeruser")
public class NxCustomerUserController {
	@Autowired
	private NxCustomerUserService nxCustomerUserService;

	@Autowired
	private NxOrderTemplateService nxOrderTemplateService;










    @RequestMapping(value = "/customerUserGetMy/{customerUserId}")
    @ResponseBody
    public R customerUserGetMy(@PathVariable Integer customerUserId) {

		System.out.println("hai");
		NxCustomerUserEntity nxCustomerUserEntity = nxCustomerUserService.queryObject(customerUserId);

		Map<String, Object> map = new HashMap<>();
		map.put("customerUserId", customerUserId);

		List<NxOrderTemplateEntity> templateEntities = nxOrderTemplateService.queryList(map);
		Map<String, Object> resultData = new HashMap<>();
		resultData.put("user", nxCustomerUserEntity);
		resultData.put("template", templateEntities);

		return R.ok().put("data", resultData);
    }


	
}
