package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 12-02 20:50
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.*;
import com.nongxinle.service.NxRestrauntOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.service.NxCommunityPurchaseGoodsService;
import com.nongxinle.utils.R;

import static com.nongxinle.utils.DateUtils.formatWhatDay;
import static com.nongxinle.utils.DateUtils.formatWhatTime;


@RestController
@RequestMapping("api/nxcommunitypurchasegoods")
public class NxCommunityPurchaseGoodsController {
	@Autowired
	private NxCommunityPurchaseGoodsService nxCommunityPurchaseGoodsService;
	@Autowired
	private NxRestrauntOrdersService nxRestrauntOrdersService;


	/**
	 * 复制进货商品
	 *
	 * @param purGoodsList 进货列表
	 * @return ok
	 */
	@RequestMapping(value = "/copyComPruchaseGoodsStatus", method = RequestMethod.POST)
	@ResponseBody
	public R copyPruchaseGoodsStatus(@RequestBody List<NxCommunityPurchaseGoodsEntity> purGoodsList) {
		System.out.println(purGoodsList);
		for (NxCommunityPurchaseGoodsEntity purgoods : purGoodsList) {
			purgoods.setNxCpgPurchaseType(1);
			purgoods.setNxCpgStatus(1);
			purgoods.setNxCpgTime(formatWhatTime(0));
			nxCommunityPurchaseGoodsService.update(purgoods);
		}
		return R.ok();
	}

	@RequestMapping(value = "/getDateComPurchaseGoods", method = RequestMethod.POST)
	@ResponseBody
	public R getDateComPurchaseGoods(Integer comId, String date) {
		System.out.println(date);
		Map<String, Object> map = new HashMap<>();

		map.put("comId", comId);
		map.put("purchaseDate", date);
		List<NxCommunityFatherGoodsEntity> purchase = nxCommunityPurchaseGoodsService.queryComPurchaseGoods(map);

		return R.ok().put("data", purchase);
	}

	@RequestMapping(value = "/saveComPlanPurchase", method = RequestMethod.POST)
	@ResponseBody
	public R saveComPlanPurchase(@RequestBody NxCommunityPurchaseGoodsEntity purchaseGoodsEntity) {
		if (!purchaseGoodsEntity.getNxCpgQuantity().equals("0")) {
			purchaseGoodsEntity.setNxCpgStatus(0);
			purchaseGoodsEntity.setNxCpgApplyDate(formatWhatDay(0));
			nxCommunityPurchaseGoodsService.save(purchaseGoodsEntity);
		}

		Integer nxDistributerPurchaseGoodsId = purchaseGoodsEntity.getNxCommunityPurchaseGoodsId();
		List<NxRestrauntOrdersEntity> nxDepartmentOrdersEntities =
				purchaseGoodsEntity.getNxRestrauntOrdersEntityList();
		if (nxDepartmentOrdersEntities.size() > 0) {
			for (NxRestrauntOrdersEntity order : nxDepartmentOrdersEntities) {
				order.setNxRoPurchaseGoodsId(nxDistributerPurchaseGoodsId);
				order.setNxRoBuyStatus(1);
				nxRestrauntOrdersService.update(order);
			}
		}

		return R.ok();
	}



	
}
