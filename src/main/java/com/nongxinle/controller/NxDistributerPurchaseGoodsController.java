package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 06-24 11:45
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.*;
import com.nongxinle.service.NxDepartmentOrdersService;
import com.nongxinle.service.NxDistributerPurchaseBatchService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.ibatis.annotations.Arg;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.service.NxDistributerPurchaseGoodsService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;

import static com.nongxinle.utils.CommonUtils.generateUUID;
import static com.nongxinle.utils.DateUtils.formatWhatTime;


@RestController
@RequestMapping("api/nxdistributerpurchasegoods")
public class NxDistributerPurchaseGoodsController {
	@Autowired
	private NxDistributerPurchaseGoodsService nxDisPurcGoodsService;

	@Autowired
	private NxDistributerPurchaseBatchService nxDPBService;

	@Autowired
	private NxDepartmentOrdersService  nxDepartmentOrdersService;




	/**
	 * DISTRIBUTE
	 * 批发商获取进货商品列表
	 * @param disId 批发商id
	 * @return 进货商品列表
	 */
	@RequestMapping(value = "/getPurchaseGoods/{disId}")
	@ResponseBody
	public R getPurchaseGoodsAndPurchaseBatch(@PathVariable Integer disId) {
		Map<String, Object> map2 = new HashMap<>();
		map2.put("disId", disId);
		map2.put("status", 3);

		//1,查询采购商品
		List<NxDistributerFatherGoodsEntity>  purchase = nxDisPurcGoodsService.queryDisPurchaseGoods(map2);

		return R.ok().put("data", purchase);
	}

	/**
	 * 添加进货商品
	 * @param purchaseGoodsEntity 批发商商品
	 * @return ok
	 */
	@RequestMapping(value = "/savePlanPurchase", method = RequestMethod.POST)
	@ResponseBody
	public R savePlanPurchase (@RequestBody NxDistributerPurchaseGoodsEntity purchaseGoodsEntity) {

		purchaseGoodsEntity.setNxDpgStatus(0);
		nxDisPurcGoodsService.save(purchaseGoodsEntity);

		Integer nxDistributerPurchaseGoodsId = purchaseGoodsEntity.getNxDistributerPurchaseGoodsId();

		List<NxDepartmentOrdersEntity> nxDepartmentOrdersEntities =
				purchaseGoodsEntity.getNxDepartmentOrdersEntities();
		if(nxDepartmentOrdersEntities.size() > 0){

			for (NxDepartmentOrdersEntity order : nxDepartmentOrdersEntities) {
				order.setNxDoPurchaseGoodsId(nxDistributerPurchaseGoodsId);
				order.setNxDoStatus(1);
				order.setNxDoBuyStatus(1);
				nxDepartmentOrdersService.update(order);

			}
		}

		return R.ok();
	}


//	////////////////////////////////////////////////


	@RequestMapping(value = "/finishPruchaseGoodsStatus", method = RequestMethod.POST)
	@ResponseBody
	public R finishPruchaseGoodsStatus (@RequestBody List<NxDistributerPurchaseGoodsEntity> purGoodsList  ) {
		System.out.println(purGoodsList);
		for (NxDistributerPurchaseGoodsEntity purgoods : purGoodsList) {
			purgoods.setNxDpgTime(formatWhatTime(0));
			purgoods.setNxDpgPurchaseType(3);
			purgoods.setNxDpgStatus(3);
			nxDisPurcGoodsService.update(purgoods);
		}
		return R.ok();
	}
	@RequestMapping(value = "/copyPruchaseGoodsStatus", method = RequestMethod.POST)
	@ResponseBody
	public R copyPruchaseGoodsStatus (@RequestBody List<NxDistributerPurchaseGoodsEntity> purGoodsList  ) {
		System.out.println(purGoodsList);
		for (NxDistributerPurchaseGoodsEntity purgoods : purGoodsList) {
			purgoods.setNxDpgPurchaseType(1);
			purgoods.setNxDpgStatus(1);
			purgoods.setNxDpgTime(formatWhatTime(0));
			nxDisPurcGoodsService.update(purgoods);
		}
	    return R.ok();
	}




	@RequestMapping(value = "/purUserGetPurchaseGoods/{purUserId}")
	@ResponseBody
	public R purUserGetPurchaseGoods(@PathVariable Integer purUserId) {


		Map<String, Object> map = new HashMap<>();
		map.put("purUserId", purUserId);
//		map.put("status", 1);
		List<NxDistributerPurchaseGoodsEntity>  purchase = nxDisPurcGoodsService.purUserGetPurchaseGoods(purUserId);

	    return R.ok().put("data", purchase);
	}



	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxdistributerpurchasegoods:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxDistributerPurchaseGoodsEntity> nxDistributerPurchaseGoodsList = nxDisPurcGoodsService.queryList(map);
		int total = nxDisPurcGoodsService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxDistributerPurchaseGoodsList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxDistributerPurchaseGoods}")
	@RequiresPermissions("nxdistributerpurchasegoods:info")
	public R info(@PathVariable("nxDistributerPurchaseGoods") Integer nxDistributerPurchaseGoods){
		NxDistributerPurchaseGoodsEntity nxDistributerPurchaseGood = nxDisPurcGoodsService.queryObject(nxDistributerPurchaseGoods);

		return R.ok().put("nxDistributerPurchaseGoods", nxDistributerPurchaseGood);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
	@RequiresPermissions("nxdistributerpurchasegoods:save")
	public R save(@RequestBody NxDistributerPurchaseGoodsEntity nxDistributerPurchaseGoods){
		nxDisPurcGoodsService.save(nxDistributerPurchaseGoods);
		
		return R.ok();
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
//	@RequiresPermissions("nxdistributerpurchasegoods:update")
	public R update(@RequestBody NxDistributerPurchaseGoodsEntity nxDistributerPurchaseGoods){
		nxDisPurcGoodsService.update(nxDistributerPurchaseGoods);
		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxdistributerpurchasegoods:delete")
	public R delete(@RequestBody Integer[] nxDistributerPurchaseGoodss){
		nxDisPurcGoodsService.deleteBatch(nxDistributerPurchaseGoodss);
		
		return R.ok();
	}
	
}
