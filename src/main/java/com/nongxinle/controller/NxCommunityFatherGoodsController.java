package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 2020-02-24 17:06:57
 */

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.NxCommunityAdsenseEntity;
import com.nongxinle.entity.NxCommunityPromoteEntity;
import com.nongxinle.entity.NxDistributerFatherGoodsEntity;
import com.nongxinle.service.NxCommunityAdsenseService;
import com.nongxinle.service.NxCommunityPromoteService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxCommunityFatherGoodsEntity;
import com.nongxinle.service.NxCommunityFatherGoodsService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxcommunityfathergoods")
public class NxCommunityFatherGoodsController {
	@Autowired
	private NxCommunityFatherGoodsService cfgService;

	@Autowired
	private NxCommunityPromoteService nxCommunityPromoteService;

	@Autowired
	private NxCommunityAdsenseService nxCommunityAdsenseService;

	//

	@RequestMapping(value = "/getRankFatherGoods/{comId}")
	@ResponseBody
	public R getRankFatherGoods(@PathVariable Integer comId) {
	    List<NxCommunityFatherGoodsEntity> fatherGoodsEntities = cfgService.queryRankFatherGoods(comId);
	    return R.ok().put("data", fatherGoodsEntities);
	}

	/**
	 * 获取批发商商品的父类列表
	 * @param comId 批发商id
	 * @return 批发商父类列表
	 */
	@RequestMapping(value = "/getComGoodsCata", method = RequestMethod.POST)
	@ResponseBody
	public R getComGoodsCata(Integer comId, Integer level) {
		System.out.println(comId + level + "abc");
		Map<String, Object> map = new HashMap<>();
		map.put("comId", comId);
		map.put("level", level);
		List<NxCommunityFatherGoodsEntity> comGoodsCata = cfgService.queryComGoodsCata(map);
		if(comGoodsCata.size() > 0){
			return R.ok().put("data", comGoodsCata);
		}
		List<NxCommunityFatherGoodsEntity> zero = new ArrayList<>();
		return R.ok().put("data", zero);
	}

	@RequestMapping(value = "/comGetComGoodsCata/{comId}")
	@ResponseBody
	public R comGetComGoodsCata(@PathVariable Integer comId) {
		Map<String, Object> map = new HashMap<>();
		map.put("comId", comId);
		List<NxCommunityFatherGoodsEntity> comGoodsCata = cfgService.queryComGoodsCata(map);
		if(comGoodsCata.size() > 0){
			return R.ok().put("data", comGoodsCata);
		}
		List<NxCommunityFatherGoodsEntity> zero = new ArrayList<>();
		return R.ok().put("data", zero);
	}


	// #20afb8  #1ebaee  #3cc36e  #f5c832  #f09628  #f05a32 #20afb8 #969696

	@RequestMapping(value = "/customerIndexData/{communityId}")
	@ResponseBody
	public R customerIndexData(@PathVariable Integer communityId) {

		List<NxCommunityFatherGoodsEntity> entities = cfgService.queryCataListByCommunityId(communityId);
		List<NxCommunityFatherGoodsEntity> fatherGoodsEntities = new ArrayList<>();
		for (NxCommunityFatherGoodsEntity father : entities) {
			Integer nxCommunityFatherGoodsId = father.getNxCommunityFatherGoodsId();
			List<NxCommunityPromoteEntity> nxPromoteEntities = nxCommunityPromoteService.queryPromoteByFatherId(nxCommunityFatherGoodsId);
			father.setNxPromoteEntities(nxPromoteEntities);
			fatherGoodsEntities.add(father);
		}

		List<NxCommunityAdsenseEntity> adsenseEntities = nxCommunityAdsenseService.queryAdsenseByNxCommunityId(communityId);
		Map<String, Object> map = new HashMap<>();
		map.put("adsense", adsenseEntities);
		map.put("fathers", fatherGoodsEntities);


		System.out.println(entities);

		return R.ok().put("data", map);
	}
	@RequestMapping(value = "/getCgCateList/{communityId}")
	@ResponseBody
	public R getGoodsCateList(@PathVariable Integer communityId) {
		List<NxCommunityFatherGoodsEntity> entities = cfgService.queryCataListByCommunityId(communityId);
		return R.ok().put("data", entities);
	}

	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("nxdistributerfathergoods:save")
	public R save(@RequestBody NxCommunityFatherGoodsEntity nxDistributerFatherGoods){
		cfgService.save(nxDistributerFatherGoods);
		
		return R.ok();
	}

	
}
