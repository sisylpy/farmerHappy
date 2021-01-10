package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 11-30 15:31
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.NxRestrauntEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxCommunityRestrauantEntity;
import com.nongxinle.service.NxCommunityRestrauantService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxcommunityrestrauant")
public class NxCommunityRestrauantController {
	@Autowired
	private NxCommunityRestrauantService nxCommunityRestrauantService;

	@RequestMapping(value = "/comGetAllCustomer/{comId}")
	@ResponseBody
	public R comGetAllCustomer(@PathVariable Integer comId) {

	    List<NxRestrauntEntity> restrauntEntities = nxCommunityRestrauantService.queryRestrauntsByComId(comId);
	    return R.ok().put("data", restrauntEntities);
	}

	
}
