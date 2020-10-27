package com.nongxinle.controller;

/**
 * @author lpy
 * @date 06-24 11:45
 */

import java.util.ArrayList;
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
import static com.nongxinle.utils.DateUtils.*;


@RestController
@RequestMapping("api/nxdistributerpurchasegoods")
public class NxDistributerPurchaseGoodsController {
    @Autowired
    private NxDistributerPurchaseGoodsService nxDisPurcGoodsService;

    @Autowired
    private NxDistributerPurchaseBatchService nxDPBService;

    @Autowired
    private NxDepartmentOrdersService nxDepartmentOrdersService;


    /**
     * DISTRIBUTER
     * 完成进货商品
     * @param purGoodsList 进货列表
     * @return ok
     */
    @RequestMapping(value = "/finishPruchaseGoodsStatus", method = RequestMethod.POST)
    @ResponseBody
    public R finishPruchaseGoodsStatus(@RequestBody List<NxDistributerPurchaseGoodsEntity> purGoodsList) {
        System.out.println(purGoodsList);
        for (NxDistributerPurchaseGoodsEntity purgoods : purGoodsList) {
            purgoods.setNxDpgPurchaseType(3);
            purgoods.setNxDpgStatus(3);
            purgoods.setNxDpgTime(formatWhatTime(0));
            nxDisPurcGoodsService.update(purgoods);
        }
        return R.ok();
    }

    /**
     * 复制进货商品
     * @param purGoodsList 进货列表
     * @return ok
     */
    @RequestMapping(value = "/copyPruchaseGoodsStatus", method = RequestMethod.POST)
    @ResponseBody
    public R copyPruchaseGoodsStatus(@RequestBody List<NxDistributerPurchaseGoodsEntity> purGoodsList) {
        System.out.println(purGoodsList);
        for (NxDistributerPurchaseGoodsEntity purgoods : purGoodsList) {
            purgoods.setNxDpgPurchaseType(1);
            purgoods.setNxDpgStatus(1);
            purgoods.setNxDpgTime(formatWhatTime(0));
            nxDisPurcGoodsService.update(purgoods);
        }
        return R.ok();
    }


    /**
     * 打印进货商品
     * @param purGoodsList 进货列表
     * @return ok
     */
    @RequestMapping(value = "/printPurchaseGoodsStatus", method = RequestMethod.POST)
    @ResponseBody
    public R printPurchaseGoodsStatus(@RequestBody List<NxDistributerPurchaseGoodsEntity> purGoodsList) {
        System.out.println(purGoodsList);
        for (NxDistributerPurchaseGoodsEntity purgoods : purGoodsList) {
            purgoods.setNxDpgPurchaseType(2);
            purgoods.setNxDpgStatus(2);
            purgoods.setNxDpgTime(formatWhatTime(0));
            nxDisPurcGoodsService.update(purgoods);
        }
        return R.ok();
    }

    @RequestMapping(value = "/disGoodsGetPurchaseGoods/{disGoodsId}")
    @ResponseBody
    public R disGoodsGetPurchaseGoods(@PathVariable Integer disGoodsId) {

        Map<String, Object> map2 = new HashMap<>();
        map2.put("disGoodsId", disGoodsId);
        List<NxDistributerPurchaseGoodsEntity> entities = nxDisPurcGoodsService.queryPurchaseGoodsByParams(map2);

        return R.ok().put("data", entities);
    }


    @RequestMapping(value = "/getDatePurchaseGoods", method = RequestMethod.POST)
    @ResponseBody
    public R getDatePurchaseGoods(Integer disId, String date) {
        System.out.println(date);
        Map<String, Object> map = new HashMap<>();

        map.put("disId", disId);
        map.put("applyDate", date);
        List<NxDistributerFatherGoodsEntity> purchase = nxDisPurcGoodsService.queryDisPurchaseGoods(map);

        return R.ok().put("data", purchase);
    }

    /**
     * DISTRIBUTE
     * 批发商获取进货商品列表
     * @param disId 批发商id
     * @return 进货商品列表
     */
    @RequestMapping(value = "/getPurchaseGoods", method = RequestMethod.POST)
    @ResponseBody
    public R getPurchaseGoods(Integer disId, Integer times) {

        List<Map<String, Object>> dataList = new ArrayList<>();

        //明天的数据
        Map<String, Object> map1 = new HashMap<>();
        map1.put("disId", disId);
        map1.put("arriveDate", formatWhatDay(1));
        map1.put("equalBuyStatus", 0);
        List<NxDepartmentOrdersEntity> tomUnPurchaseApplys = nxDepartmentOrdersService.queryDisOrdersByParams(map1);
        Map<String, Object> map2 = new HashMap<>();
            //1,查询进货
            Map<String, Object> map = new HashMap<>();
            map.put("disId", disId);
            map.put("purchaseDate", formatWhatDay(1));
            List<NxDistributerFatherGoodsEntity> purchase = nxDisPurcGoodsService.queryDisPurchaseGoods(map);

            //4，查询
            Map<String, Object> map3 = new HashMap<>();
            map3.put("disId", disId);
            map3.put("purchaseDate",  formatWhatDay(1));
            int purchaseTotal =  nxDisPurcGoodsService.queryPurchaseTotal(map3);
            map2.put("goodsAmount", purchaseTotal);
            map2.put("fatherAmount", purchase.size());
            map2.put("week", getWeek(1));
            map2.put("hao", getJustHao(1));
            map2.put("arr", purchase);
            map2.put("which", "明天");
            map2.put("date", formatWhatDay(1));
            map2.put("orders", tomUnPurchaseApplys.size());
            dataList.add(map2);



		//今天的数据
		Map<String, Object> map6 = new HashMap<>();
		map6.put("disId", disId);
		map6.put("arriveDate", formatWhatDay(0));
		map6.put("equalBuyStatus", 0);
		List<NxDepartmentOrdersEntity> todayUnPurchaseApplys = nxDepartmentOrdersService.queryDisOrdersByParams(map6);

//		if(todayUnPurchaseApplys.size() > 0){
            //1,查询采购商品
            Map<String, Object> map4 = new HashMap<>();
            map4.put("disId", disId);
            map4.put("purchaseDate", formatWhatDay(0));
            List<NxDistributerFatherGoodsEntity> purchaseToday = nxDisPurcGoodsService.queryDisPurchaseGoods(map4);

            Map<String, Object> map5 = new HashMap<>();
            Map<String, Object> map8 = new HashMap<>();
            map8.put("disId", disId);
            map8.put("purchaseDate",  formatWhatDay(0));
            int purchaseTotals =  nxDisPurcGoodsService.queryPurchaseTotal(map8);
            map5.put("fatherAmount", purchaseToday.size());
            map5.put("goodsAmount", purchaseTotals);
            map5.put("arr", purchaseToday);
            map5.put("week", getWeek(0));
            map5.put("hao", getJustHao(0));
            map5.put("which", "今天");
            map5.put("date", formatWhatDay(0));
            map5.put("orders", todayUnPurchaseApplys.size());
            dataList.add(map5);
//        }

        return R.ok().put("data", dataList);
    }


    @RequestMapping(value = "/deletePlanPurchase", method = RequestMethod.POST)
    @ResponseBody
    public R deletePlanPurchase(@RequestBody NxDistributerPurchaseGoodsEntity purchaseGoodsEntity) {
        List<NxDepartmentOrdersEntity> nxDepartmentOrdersEntities = purchaseGoodsEntity.getNxDepartmentOrdersEntities();
        for (NxDepartmentOrdersEntity orders : nxDepartmentOrdersEntities) {
            orders.setNxDoStatus(0);
            orders.setNxDoBuyStatus(0);
            orders.setNxDoPurchaseGoodsId(null);
            nxDepartmentOrdersService.update(orders);
        }
        nxDisPurcGoodsService.delete(purchaseGoodsEntity.getNxDistributerPurchaseGoodsId());
        return R.ok();
    }

    /**
     * 修改进货商品
     * @param purchaseGoodsEntity 进货商品
     * @return 进货商品
     */
    @RequestMapping(value = "/updatePlanPurchase", method = RequestMethod.POST)
    @ResponseBody
    public R updatePlanPurchase(@RequestBody NxDistributerPurchaseGoodsEntity purchaseGoodsEntity) {
        nxDisPurcGoodsService.update(purchaseGoodsEntity);
        return R.ok().put("data", purchaseGoodsEntity);
    }

    /**
     * 添加进货商品
     * @param purchaseGoodsEntity 批发商商品
     * @return ok
     */
    @RequestMapping(value = "/savePlanPurchase", method = RequestMethod.POST)
    @ResponseBody
    public R savePlanPurchase(@RequestBody NxDistributerPurchaseGoodsEntity purchaseGoodsEntity) {

        if(!purchaseGoodsEntity.getNxDpgQuantity().equals("0")){
            purchaseGoodsEntity.setNxDpgStatus(0);
            purchaseGoodsEntity.setNxDpgApplyDate(formatWhatDay(0));
            nxDisPurcGoodsService.save(purchaseGoodsEntity);
        }

        Integer nxDistributerPurchaseGoodsId = purchaseGoodsEntity.getNxDistributerPurchaseGoodsId();

        List<NxDepartmentOrdersEntity> nxDepartmentOrdersEntities =
                purchaseGoodsEntity.getNxDepartmentOrdersEntities();
        if (nxDepartmentOrdersEntities.size() > 0) {

            System.out.println("nomammamamam");

            for (NxDepartmentOrdersEntity order : nxDepartmentOrdersEntities) {
                order.setNxDoPurchaseGoodsId(nxDistributerPurchaseGoodsId);
                order.setNxDoStatus(1);
                order.setNxDoBuyStatus(1);
                nxDepartmentOrdersService.update(order);
                System.out.println("gunndnngnngng");
            }
        }

        return R.ok();
    }


//	////////////////////////////////////////////////


//
//	@RequestMapping(value = "/purUserGetPurchaseGoods/{purUserId}")
//	@ResponseBody
//	public R purUserGetPurchaseGoods(@PathVariable Integer purUserId) {
//
//
//		Map<String, Object> map = new HashMap<>();
//		map.put("purUserId", purUserId);
////		map.put("status", 1);
//		List<NxDistributerPurchaseGoodsEntity>  purchase = nxDisPurcGoodsService.purUserGetPurchaseGoods(purUserId);
//
//	    return R.ok().put("data", purchase);
//	}


    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("nxdistributerpurchasegoods:list")
    public R list(Integer page, Integer limit) {
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
    public R info(@PathVariable("nxDistributerPurchaseGoods") Integer nxDistributerPurchaseGoods) {
        NxDistributerPurchaseGoodsEntity nxDistributerPurchaseGood = nxDisPurcGoodsService.queryObject(nxDistributerPurchaseGoods);

        return R.ok().put("nxDistributerPurchaseGoods", nxDistributerPurchaseGood);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/save")
    @RequiresPermissions("nxdistributerpurchasegoods:save")
    public R save(@RequestBody NxDistributerPurchaseGoodsEntity nxDistributerPurchaseGoods) {
        nxDisPurcGoodsService.save(nxDistributerPurchaseGoods);

        return R.ok();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
//	@RequiresPermissions("nxdistributerpurchasegoods:update")
    public R update(@RequestBody NxDistributerPurchaseGoodsEntity nxDistributerPurchaseGoods) {
        nxDisPurcGoodsService.update(nxDistributerPurchaseGoods);

        return R.ok();
    }

    /**
     * 删除
     */
    @ResponseBody
    @RequestMapping("/delete")
    @RequiresPermissions("nxdistributerpurchasegoods:delete")
    public R delete(@RequestBody Integer[] nxDistributerPurchaseGoodss) {
        nxDisPurcGoodsService.deleteBatch(nxDistributerPurchaseGoodss);

        return R.ok();
    }

}
