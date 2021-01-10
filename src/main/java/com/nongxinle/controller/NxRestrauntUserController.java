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

import com.alibaba.fastjson.JSONObject;
import com.nongxinle.entity.NxDepartmentUserEntity;
import com.nongxinle.service.NxRestrauntService;
import com.nongxinle.utils.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxRestrauntUserEntity;
import com.nongxinle.service.NxRestrauntUserService;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

import static com.nongxinle.utils.DateUtils.formatWhatDay;


@RestController
@RequestMapping("api/nxrestrauntuser")
public class NxRestrauntUserController {
	@Autowired
	private NxRestrauntUserService nxRestrauntUserService;

	@Autowired
	private NxRestrauntService nxRestrauntService;




	@RequestMapping(value = "/deleteResUser/{userid}")
	@ResponseBody
	public R deleteResUser(@PathVariable Integer userid) {
	    nxRestrauntUserService.delete(userid);
	    return R.ok();
	}


	@ResponseBody
	@RequestMapping("/resUserSave")
	public R resUserSave(@RequestBody NxRestrauntUserEntity nxRestrauntUserEntity){


		MyAPPIDConfig myAPPIDConfig = new MyAPPIDConfig();
		String resAppID = myAPPIDConfig.getRestrauntAppID();
		String resScreat = myAPPIDConfig.getRestrauntScreat();

		String url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + resAppID + "&secret=" + resScreat + "&js_code=" + nxRestrauntUserEntity.getNxRuCode()+ "&grant_type=authorization_code";
		// 发送请求，返回Json字符串
		String str = WeChatUtil.httpRequest(url, "GET", null);
		// 转成Json对象 获取openid
		JSONObject jsonObject = JSONObject.parseObject(str);

		// 我们需要的openid，在一个小程序中，openid是唯一的
		String openid = jsonObject.get("openid").toString();

		NxRestrauntUserEntity resUserEntities = nxRestrauntUserService.queryResUserByOpenId(openid);
		if(resUserEntities != null){
			return R.error(-1,"请直接登陆");

		}else{
			//添加新用户
			nxRestrauntUserEntity.setNxRuWxOpenId(openid);
			nxRestrauntUserEntity.setNxRuJoinDate(formatWhatDay(0));
			nxRestrauntUserService.save(nxRestrauntUserEntity);
			Integer restrauntUserId = nxRestrauntUserEntity.getNxRestrauntUserId();
//			Map<String, Object> stringObjectMap = nxDepartmentService.queryGroupAndUserInfo(nxDepartmentUserId);

			return R.ok().put("data",restrauntUserId);
		}
	}




   @RequestMapping(value = "/getRestrauntUsers/{resId}")
   @ResponseBody
   public R getRestrauntUsers(@PathVariable Integer resId) {
       List<NxRestrauntUserEntity> userEntities = nxRestrauntUserService.queryAllResUsersByResId(resId);
       return R.ok().put("data", userEntities);
   }





	@RequestMapping(value = "/getResUserInfo/{userId}")
	@ResponseBody
	public R getResUserInfo(@PathVariable Integer userId) {
		NxRestrauntUserEntity restaurantUserEntity = nxRestrauntUserService.queryObject(userId);
		return R.ok().put("data", restaurantUserEntity);
	}

	/**
	 * 修改订货用户信息
	 * @param userName 订货用户名称
	 * @param userId 用户id
	 * @return ok
	 */
	@RequestMapping(value = "/updateResUser", method = RequestMethod.POST)
	@ResponseBody
	public R updateResUser (String userName, Integer userId) {
		NxRestrauntUserEntity nxDepartmentUserEntity = nxRestrauntUserService.queryObject(userId);
		nxDepartmentUserEntity.setNxRuWxNickName(userName);
		nxRestrauntUserService.update(nxDepartmentUserEntity);

		Map<String, Object> map = new HashMap<>();

		map.put("userInfo", nxDepartmentUserEntity );
		return R.ok().put("data", map);
	}

	/**
	 * 部门用户修改用户信息
	 * @param file 用户头像
	 * @param userName 用户名
	 * @param userId 用户id
	 * @param session 图片
	 * @return ok
	 */
	@RequestMapping(value = "/updateResUserWithFile", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public R updateResUserWithFile(@RequestParam("file") MultipartFile file,
								   @RequestParam("userName") String userName,
								   @RequestParam("userId") Integer userId,
								   HttpSession session) {
		//1,上传图片
		String newUploadName = "uploadImage";
		String realPath = UploadFile.upload(session, newUploadName, file);

		String filename = file.getOriginalFilename();
		String filePath = newUploadName + "/" + filename;
		NxRestrauntUserEntity nxDepartmentUserEntity = nxRestrauntUserService.queryObject(userId);
		nxDepartmentUserEntity.setNxRuWxNickName(userName);
		nxDepartmentUserEntity.setNxRuWxAvartraUrl(filePath);
		nxDepartmentUserEntity.setNxRuUrlChange(1);
		nxRestrauntUserService.update(nxDepartmentUserEntity);

		return R.ok();
	}







	@RequestMapping(value = "/restruanteUserLogin/{code}")
	@ResponseBody
	public R restruanteUserLogin(@PathVariable String code) {

		MyAPPIDConfig myAPPIDConfig = new MyAPPIDConfig();


		String url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + myAPPIDConfig.getRestrauntAppID()
				+ "&secret=" + myAPPIDConfig.getRestrauntScreat() + "&js_code=" + code +
				"&grant_type=authorization_code";
		// 发送请求，返回Json字符串
		String str = WeChatUtil.httpRequest(url, "GET", null);
		// 转成Json对象 获取openid
		JSONObject jsonObject = JSONObject.parseObject(str);

		// 我们需要的openid，在一个小程序中，openid是唯一的
		String openId = jsonObject.get("openid").toString();
		System.out.println("");
		if(openId != null){
			NxRestrauntUserEntity restaurantUserEntity = nxRestrauntUserService.queryResUserByOpenId(openId);
			System.out.println(restaurantUserEntity);
			System.out.println("====---------");
			if(restaurantUserEntity != null){
				Integer restaurantUserId = restaurantUserEntity.getNxRestrauntUserId();
				Map<String, Object> stringObjectMap = nxRestrauntService.queryResAndUserInfo(restaurantUserId);
				return R.ok().put("data", stringObjectMap);
			}else{
				return R.error(-1,"请进行注册");
			}

		}else {
			return R.error(-1,"请进行注册");
		}
	}



	

	
}
