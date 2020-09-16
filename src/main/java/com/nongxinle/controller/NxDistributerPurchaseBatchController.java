package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 06-25 22:52
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.NxDistributerPurchaseGoodsEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDistributerPurchaseBatchEntity;
import com.nongxinle.service.NxDistributerPurchaseBatchService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxdistributerpurchasebatch")
public class NxDistributerPurchaseBatchController {
	@Autowired
	private NxDistributerPurchaseBatchService nxDPBService;



	@RequestMapping(value = "/haveReadPurchaseBatch/{batchId}")
	@ResponseBody
	public R haveReadPurchaseBatch(@PathVariable Integer batchId) {
		NxDistributerPurchaseBatchEntity entity = nxDPBService.queryObject(batchId);
		entity.setNxDpbStatus(1);
		nxDPBService.update(entity);
		return R.ok();
	}


	@RequestMapping(value = "/delatePurchaseBatch/{purchaseBatchId}")
	@ResponseBody
	public R delatePurchaseBatch(@PathVariable Integer purchaseBatchId) {
		System.out.println(purchaseBatchId);
		nxDPBService.deleteBatchId(purchaseBatchId);

	    return R.ok();
	}


	/**
	 * 批发商获取进货商品列表
	 * @param batchId
	 * @return
	 */
	@RequestMapping(value = "/getPurchaseGoodsBatch/{batchId}")
	@ResponseBody
	public R getPurchaseGoodsBatch(@PathVariable Integer batchId) {
		NxDistributerPurchaseBatchEntity entity = nxDPBService.queryObject(batchId);

		return R.ok().put("data", entity);
	}
	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("nxdistributerpurchasebatch:list")
	public R list(Integer page, Integer limit){
		Map<String, Object> map = new HashMap<>();
		map.put("offset", (page - 1) * limit);
		map.put("limit", limit);
		
		//查询列表数据
		List<NxDistributerPurchaseBatchEntity> nxDistributerPurchaseBatchList = nxDPBService.queryList(map);
		int total = nxDPBService.queryTotal(map);
		
		PageUtils pageUtil = new PageUtils(nxDistributerPurchaseBatchList, total, limit, page);
		
		return R.ok().put("page", pageUtil);
	}
	
	
	/**
	 * 信息
	 */
	@ResponseBody
	@RequestMapping("/info/{nxDpbUuid}")
	@RequiresPermissions("nxdistributerpurchasebatch:info")
	public R info(@PathVariable("nxDpbUuid") Integer nxDpbUuid){
		NxDistributerPurchaseBatchEntity nxDistributerPurchaseBatch = nxDPBService.queryObject(nxDpbUuid);
		
		return R.ok().put("nxDistributerPurchaseBatch", nxDistributerPurchaseBatch);
	}
	
	/**
	 * 保存
	 */
	@ResponseBody
	@RequestMapping("/save")
//	@RequiresPermissions("nxdistributerpurchasebatch:save")
	public R save(@RequestBody NxDistributerPurchaseBatchEntity nxDistributerPurchaseBatch){
		Integer id =  nxDPBService.save(nxDistributerPurchaseBatch);
		
		return R.ok().put("data",id);
	}
	
	/**
	 * 修改
	 */
	@ResponseBody
	@RequestMapping("/update")
//	@RequiresPermissions("nxdistributerpurchasebatch:update")
	public R update(@RequestBody NxDistributerPurchaseBatchEntity nxDistributerPurchaseBatch){
		nxDPBService.update(nxDistributerPurchaseBatch);


		
		return R.ok();
	}
	
	/**
	 * 删除
	 */
	@ResponseBody
	@RequestMapping("/delete")
	@RequiresPermissions("nxdistributerpurchasebatch:delete")
	public R delete(@RequestBody String[] nxDpbUuids){
		nxDPBService.deleteBatch(nxDpbUuids);
		
		return R.ok();
	}
	
}
