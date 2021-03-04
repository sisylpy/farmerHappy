package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 01-17 07:54
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.service.NxCommunityPurchaseBatchService;


@RestController
@RequestMapping("api/nxcommunitypurchasebatch")
public class NxCommunityPurchaseBatchController {
	@Autowired
	private NxCommunityPurchaseBatchService cpbService;






	
}
