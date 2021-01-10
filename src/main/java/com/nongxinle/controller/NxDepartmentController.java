package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 06-16 11:26
 */

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.nongxinle.entity.NxCommunityEntity;
import com.nongxinle.entity.NxDepartmentUserEntity;
//import com.nongxinle.service.NxDepartmentOrdersService;
import com.nongxinle.service.NxDepartmentUserService;
import com.nongxinle.utils.MyAPPIDConfig;
import com.nongxinle.utils.WeChatUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDepartmentEntity;
import com.nongxinle.service.NxDepartmentService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxdepartment")
public class NxDepartmentController {
	@Autowired
	private NxDepartmentService nxDepartmentService;

	@Autowired
	private NxDepartmentUserService nxDepartmentUserService;



	/**
	 * PURCHASE
	 * 修改群名称
	 * @param departmentEntity 群
	 * @return ok
	 */
	@RequestMapping(value = "/updateGroupName", method = RequestMethod.POST)
	@ResponseBody
	public R updateGroupName (@RequestBody  NxDepartmentEntity departmentEntity ) {
		nxDepartmentService.update(departmentEntity);
	    return R.ok();
	}

	/**
	 * 微信小程序扫描二维码校验文件
	 * @return 校验内容
	 */
	@RequestMapping(value = "/evR5kgsE0d.txt")
	@ResponseBody
	public String depRegist( ) {
		return "b59516a6fda0db869e06518f51400610";
	}



	/**
	 * PURCHASE
	 * 采购员注册
	 * @param dep 订货群
	 * @return 群信息
	 */
	@RequestMapping(value = "/restrauntRegist", method = RequestMethod.POST)
	@ResponseBody
	public R restrauntRegist (@RequestBody NxDepartmentEntity dep) {

//wxApp
		MyAPPIDConfig myAPPIDConfig = new MyAPPIDConfig();
		String purchaseAppID = myAPPIDConfig.getPurchaseAppID();
		String purchaseScreat = myAPPIDConfig.getPurchaseScreat();

		NxDepartmentUserEntity nxDepartmentUserEntity = dep.getNxDepartmentUserEntity();
		String url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + purchaseAppID + "&secret=" + purchaseScreat + "&js_code=" + nxDepartmentUserEntity.getNxDuCode()+ "&grant_type=authorization_code";
		// 发送请求，返回Json字符串
		String str = WeChatUtil.httpRequest(url, "GET", null);
		// 转成Json对象 获取openid
		JSONObject jsonObject = JSONObject.parseObject(str);

		// 我们需要的openid，在一个小程序中，openid是唯一的
		String openid = jsonObject.get("openid").toString();
		NxDepartmentUserEntity nxDepartmentUserEntity1 = nxDepartmentUserService.queryDepUserByOpenId(openid);
		if(nxDepartmentUserEntity1 == null){
			dep.getNxDepartmentUserEntity().setNxDuWxOpenId(openid);
			Integer depUserId = nxDepartmentService.saveNewDepartment(dep);
			if (depUserId != null){
				Map<String, Object> stringObjectMap = nxDepartmentService.queryDepAndUserInfo(depUserId);
				return R.ok().put("data", stringObjectMap);
			}
			return R.error(-1,"注册失败");
		}else {
			return R.error(-1,"此微信号已注册过采购员");
		}



	}

	/**
	 * ORDER
	 * 获取群的子部门
	 * @param depId 群id
	 * @return 子部门列表
	 */
	@RequestMapping(value = "/getSubDepartments/{depId}")
	@ResponseBody
	public R getSubDepartments(@PathVariable Integer depId) {
		System.out.println(depId);
		List<NxDepartmentEntity> departmentEntities =   nxDepartmentService.querySubDepartments(depId);
		return R.ok().put("data", departmentEntities);
	}



	/**
	 * ORDER
	 * @param depId
	 * @return
	 */
	@RequestMapping(value = "/getDepInfo/{depId}")
	@ResponseBody
	public R getDepInfo(@PathVariable Integer depId) {
		NxDepartmentEntity nxDepartmentEntity = nxDepartmentService.queryObject(depId);
		return R.ok().put("data", nxDepartmentEntity);
	}




//	//////////////////


//
//	@RequestMapping(value = "/getFatherDep/{depId}")
//	@ResponseBody
//	public R getFatherDep(@PathVariable Integer depId) {
//		List<NxDepartmentEntity> departmentEntities = nxDepartmentService.queryFatherDep(depId);
//	    return R.ok().put("data", departmentEntities.get(0));
//	}


//
//	/**
//	 * 保存
//	 */
//	@ResponseBody
//	@RequestMapping("/saveSubDepartment")
//	public R saveSubDepartment(@RequestBody NxDepartmentEntity nxDepartment){
//		List<NxDepartmentEntity> nxDepartmentEntities = nxDepartment.getNxDepartmentEntities();
//		for (NxDepartmentEntity dep : nxDepartmentEntities) {
//		nxDepartmentService.saveSubDepartment(dep);
//		}
//		Integer nxDepartmentId = nxDepartment.getNxDepartmentId();
//		NxDepartmentEntity nxDepartmentEntity = nxDepartmentService.queryObject(nxDepartmentId);
//		Integer nxDepartmentSubAmount = nxDepartmentEntity.getNxDepartmentSubAmount();
//		nxDepartmentEntity.setNxDepartmentSubAmount(nxDepartmentSubAmount + nxDepartment.getNxDepartmentEntities().size());
//		nxDepartmentService.update(nxDepartmentEntity);
//		return R.ok();
//	}


//
//	 @RequestMapping(value = "/getDisDepartments", method = RequestMethod.POST)
//	  @ResponseBody
//	  public R getDisDepartments (Integer disId, String type) {
//
//		 Map<String, Object> map = new HashMap<>();
//		 map.put("disId", disId);
//		 map.put("type", type);
//		 List<NxDepartmentEntity> list =  nxDepartmentService.queryDisDepartments(map);
//		 return R.ok().put("data", list);
//	  }


	/**
	 * 保存
	 */
//	@ResponseBody
//	@RequestMapping("/save")
//	public R save(@RequestBody NxDepartmentEntity nxDepartment){
//		nxDepartmentService.save(nxDepartment);
//		return R.ok();
//	}


	

}
