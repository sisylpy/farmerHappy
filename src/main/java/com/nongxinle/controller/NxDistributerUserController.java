package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 2020-02-10 19:43:11
 */

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.nongxinle.entity.NxDistributerUserRoleEntity;
import com.nongxinle.utils.MyAPPIDConfig;
import com.nongxinle.utils.WeChatUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDistributerUserEntity;
import com.nongxinle.service.NxDistributerUserService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;


@RestController
@RequestMapping("api/nxdistributeruser")
public class NxDistributerUserController {
	@Autowired
	private NxDistributerUserService nxDistributerUserService;

	@RequestMapping(value = "/downLoadNumber/{value}")
	public ResponseEntity downLoadNumber (@PathVariable String value, HttpSession session) throws Exception {

		System.out.println("nihao");

		//1,获取文件路径
		ServletContext servletContext = session.getServletContext();
		String realPath = servletContext.getRealPath("numberRecord/" + value + ".mp3");

		System.out.println("kaknakreailpath" + value);
		//2,把文件读取程序当中
		InputStream io = new FileInputStream(realPath);
		byte[] body = new byte[io.available()];
		io.read(body);


		//3,创建相应头
		HttpHeaders httpHeaders = new HttpHeaders();
		System.out.println(httpHeaders);

		httpHeaders.add("Content-Disposition","attachment; filename=" +  value +".mp3");
		httpHeaders.add("Content-Type","audio/mpeg");
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(body, httpHeaders, HttpStatus.OK);
		System.out.println("---0000000=-========");
		System.out.println(responseEntity);
		return responseEntity;
	}


	@RequestMapping(value = "/getDisUsers/{disId}")
	@ResponseBody
	public R getDisUsers(@PathVariable Integer disId) {
	   List<NxDistributerUserEntity> userEntities = nxDistributerUserService.getAllUserByDisId(disId);
	    return R.ok().put("data", userEntities);
	}

	/**
	 * 批发商登陆
	 * @param distributerUserEntity 批发商
	 * @return 批发商
	 */
	@RequestMapping(value = "/disLogin", method = RequestMethod.POST)
	@ResponseBody
	public R disLogin (@RequestBody NxDistributerUserEntity distributerUserEntity ) {

		MyAPPIDConfig myAPPIDConfig = new MyAPPIDConfig();
		String url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + myAPPIDConfig.getCaidiAppID() + "&secret=" +
				myAPPIDConfig.getCaidiScreat() + "&js_code=" + distributerUserEntity.getNxDiuCode() +
				"&grant_type=authorization_code";
		// 发送请求，返回Json字符串
		String str = WeChatUtil.httpRequest(url, "GET", null);
		// 转成Json对象 获取openid
		JSONObject jsonObject = JSONObject.parseObject(str);

		// 我们需要的openid，在一个小程序中，openid是唯一的
		String openid = jsonObject.get("openid").toString();
		List<NxDistributerUserEntity> distributerUserEntities = nxDistributerUserService.queryUserByOpenId(openid);
		if(distributerUserEntities.size() > 0){
			NxDistributerUserEntity nxDistributerUserEntity = distributerUserEntities.get(0);
			Integer nxDistributerUserId = nxDistributerUserEntity.getNxDistributerUserId();
			NxDistributerUserEntity nxDistributerEntity = nxDistributerUserService.queryUserInfo(nxDistributerUserId);

			return R.ok().put("data", nxDistributerEntity);
		}else {
			return R.error(-1,"用户不存在");
		}
	}


	/**
	 * 批发商新管理者注册
	 * @param distributerUserEntity 批发商用户
	 * @return 批发商
	 */
	@RequestMapping(value = "/disUserSave", method = RequestMethod.POST)
	@ResponseBody
	public R disUserSave (@RequestBody NxDistributerUserEntity distributerUserEntity ) {

		MyAPPIDConfig myAPPIDConfig = new MyAPPIDConfig();
		String url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + myAPPIDConfig.getCaidiAppID() + "&secret=" +
				myAPPIDConfig.getCaidiScreat() + "&js_code=" + distributerUserEntity.getNxDiuCode() +
				"&grant_type=authorization_code";
		// 发送请求，返回Json字符串
		String str = WeChatUtil.httpRequest(url, "GET", null);
		// 转成Json对象 获取openid
		JSONObject jsonObject = JSONObject.parseObject(str);

		// 我们需要的openid，在一个小程序中，openid是唯一的
		String openid = jsonObject.get("openid").toString();
		List<NxDistributerUserEntity> distributerUserEntities = nxDistributerUserService.queryUserByOpenId(openid);
		if(distributerUserEntities.size() > 0){
			return R.error(-1, "用户已存在，请直接登陆");
		}else {

			distributerUserEntity.setNxDiuWxOpenId(openid);
			nxDistributerUserService.save(distributerUserEntity);
			Integer nxDistributerUserId = distributerUserEntity.getNxDistributerUserId();
			NxDistributerUserEntity nxDistributerEntity = nxDistributerUserService.queryUserInfo(nxDistributerUserId);

			return  R.ok().put("data", nxDistributerEntity);
		}
	}


	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
//	@RequiresPermissions("nxdistributeruser:save")
	public R save(@RequestBody NxDistributerUserEntity nxDistributerUser){
		nxDistributerUserService.save(nxDistributerUser);
		Integer nxDistributerUserId = nxDistributerUser.getNxDistributerUserId();
		NxDistributerUserEntity nxDistributerUserEntity = nxDistributerUserService.queryObject(nxDistributerUserId);

		return R.ok().put("data", nxDistributerUserEntity);
	}

	
}
