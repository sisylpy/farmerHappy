package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 12-01 08:51
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.*;
import com.nongxinle.service.NxCommunityStandardService;
import com.nongxinle.service.NxRestrauntService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.service.NxRestrauntComGoodsService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxrestrauntcomgoods")
public class NxRestrauntComGoodsController {
	@Autowired
	private NxRestrauntComGoodsService nxRestaruantComGoodsService;
	@Autowired
	private NxRestrauntService nxRestrauntService;



	@RequestMapping(value = "/resGetHistoryGoods/{resId}")
	@ResponseBody
	public R resGetHistoryGoods(@PathVariable Integer resId) {
		Map<String, Object> map = new HashMap<>();
		map.put("resId", resId);
		List<NxCommunityFatherGoodsEntity> fatherGoodsEntities = nxRestaruantComGoodsService.queryHistoryGoods(map);
		return R.ok().put("data", fatherGoodsEntities);
	}


	@RequestMapping(value = "/resGetResGoods", method = RequestMethod.POST)
	@ResponseBody
	public R resGetResGoods(Integer limit, Integer page,Integer resId, Integer fatherId) {
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		map.put("resId", resId);
		map.put("fatherId", fatherId);
		List<NxRestrauntComGoodsEntity> goodsEntities = nxRestaruantComGoodsService.queryResGoodsByFatherId(map);

//		for (NxRestrauntComGoodsEntity resComGoods : goodsEntities) {
//			Integer comGoodsId = resComGoods.getNxRestrauntComGoodsId();
//			List<NxCommunityStandardEntity> standardEntities = nxCommunityStandardService.queryComGoodsStandards(comGoodsId);
//			resComGoods.setNxCommunityStandardEntities(standardEntities);
//		}

		Map<String, Object> map3 = new HashMap<>();
		map3.put("resFatherId", resId);
		map3.put("fatherId", fatherId );
		int total = nxRestaruantComGoodsService.queryComGoodsTotal(map3);
		PageUtils pageUtil = new PageUtils(goodsEntities, total, limit, page);
		return R.ok().put("page", pageUtil);
	}


	@RequestMapping(value = "/resGetResComGoodsCata/{resId}")
	@ResponseBody
	public R resGetResComGoodsCata(@PathVariable Integer resId) {

		NxRestrauntEntity nxRestrauntEntity = nxRestrauntService.queryObject(resId);
		Integer nxRestrauntServiceLevel = nxRestrauntEntity.getNxRestrauntServiceLevel();
		Map<String, Object> map = new HashMap<>();
		map.put("resId", resId);
		map.put("level", nxRestrauntServiceLevel);

		System.out.println(map);
		System.out.println("heereemapd");

		List<NxCommunityFatherGoodsEntity> disGoodsEntities = nxRestaruantComGoodsService.resGetResComGoodsCata(map);
		return R.ok().put("data", disGoodsEntities);
	}



	
}
