package com.nongxinle.controller;

/**
 * @author lpy
 * @date 12-01 07:19
 */

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.*;

import com.alibaba.fastjson.JSON;
import com.nongxinle.entity.*;
import com.nongxinle.service.NxCommunityGoodsService;
import com.nongxinle.service.NxCommunityPurchaseGoodsService;
import com.nongxinle.service.NxRestrauntService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.service.NxRestrauntOrdersService;
import com.nongxinle.utils.R;

import static com.nongxinle.utils.DateUtils.*;
import static com.nongxinle.utils.DateUtils.formatWhatDay;


@RestController
@RequestMapping("api/nxrestrauntorders")

public class NxRestrauntOrdersController {
    @Autowired
    private NxRestrauntOrdersService nxRestrauntOrdersService;
    @Autowired
    private NxRestrauntService nxRestrauntService;
    @Autowired
    private NxCommunityPurchaseGoodsService nxCommunityPurchaseGoodsService;


    @RequestMapping(value = "/changeApplyGoodsStatus", method = RequestMethod.POST)
    @ResponseBody
    public R changeApplyGoodsStatus(@RequestBody List<NxRestrauntOrdersEntity> orderEntities) {
        for (NxRestrauntOrdersEntity orders : orderEntities) {
            orders.setNxRoStatus(1);
            nxRestrauntOrdersService.update(orders);
        }
        return R.ok();
    }

    @RequestMapping(value = "/resGetToDeliveryGoods", method = RequestMethod.POST)
    @ResponseBody
    public R resGetToDeliveryGoods(Integer resId) {
        Map<String, Object> map = new HashMap<>();
        map.put("resFatherId", resId);
//        map.put("arriveDate", formatWhatDay(which));
        map.put("status", 3);
        List<NxRestrauntOrdersEntity> nxRestrauntOrdersEntities = nxRestrauntOrdersService.queryResOrdersByParams(map);
        return R.ok().put("data", nxRestrauntOrdersEntities);
    }


    @RequestMapping(value = "/getUnCostOrders", method = RequestMethod.POST)
    @ResponseBody
    public R getUnCostOrders(Integer comId, Integer type) {

        System.out.println(type + "type===");
        Map<String, Object> map = new HashMap<>();
        map.put("comId", comId);
        map.put("type", type);
        map.put("cost", 0);
        System.out.println("sisysysy");
        System.out.println(map);
        List<NxCommunityFatherGoodsEntity> fatherGoodsEntities = nxRestrauntOrdersService.queryResOrdersByComStockGoodsType(map);
        return R.ok().put("data", fatherGoodsEntities);
    }


    @RequestMapping(value = "/saveRestrauntOrderBuyPrice", method = RequestMethod.POST)
    @ResponseBody
    public R saveRestrauntOrderBuyPrice(@RequestBody List<NxRestrauntOrdersEntity> depOrders) {
        for (NxRestrauntOrdersEntity ordersEntity : depOrders) {
            nxRestrauntOrdersService.update(ordersEntity);
        }
        return R.ok();
    }

    @RequestMapping(value = "/saveToFillRestrauntWeight", method = RequestMethod.POST)
    @ResponseBody
    public R saveToFillRestrauntWeight(@RequestBody List<NxRestrauntOrdersEntity> depOrders) {
        for (NxRestrauntOrdersEntity ordersEntity : depOrders) {
//            ordersEntity.setNxRoStatus(2);
            nxRestrauntOrdersService.update(ordersEntity);
        }
        return R.ok();
    }

    @RequestMapping(value = "/weighingGetOrderGoodsType", method = RequestMethod.POST)
    @ResponseBody
    public R weighingGetOrderGoodsType(Integer comId, Integer type) {
        if (type == 1) {
            Map<String, Object> map1 = new HashMap<>();
            map1.put("comId", comId);
            map1.put("type", type);
            map1.put("status", 2);
            List<NxCommunityFatherGoodsEntity> fatherGoodsEntities = nxRestrauntOrdersService.queryTodayComGoodsType(map1);

            System.out.println("1-------resutltltltltssssss");
            System.out.println(fatherGoodsEntities.size());
            if (fatherGoodsEntities.size() > 0){
                return R.ok().put("data", fatherGoodsEntities);
            }else{
                return R.error(-1, "暂时没有订货");
            }
        } else if (type == 2) {
            Map<String, Object> map2 = new HashMap<>();
            map2.put("comId", comId);
            map2.put("type", type);
            map2.put("status", 2);
            List<NxCommunityFatherGoodsEntity> fatherGoodsEntities = nxRestrauntOrdersService.queryTodayComGoodsType(map2);
            System.out.println("222--------resutltltltltssssss");
            System.out.println(fatherGoodsEntities.size());
            if (fatherGoodsEntities.size() > 0){
                return R.ok().put("data", fatherGoodsEntities);
            }else{
                return R.error(-1, "暂时没有订货");

            }
        }
        return R.error(-1, "请重新查询");
    }


    @RequestMapping(value = "/printOrder", method = RequestMethod.POST)
    @ResponseBody
    public R printOrder (Integer orderId, String orderWeight) {
        System.out.println("ororororor " + orderId + orderWeight);
        NxRestrauntOrdersEntity ordersEntity = nxRestrauntOrdersService.queryObject(orderId);
        System.out.println("ishehehhehe" + ordersEntity.getNxRoWeight() + "weieighhghghhg");
        String nxRoPrice = ordersEntity.getNxRoPrice();
        float a=Float.parseFloat(nxRoPrice);
        float b = Float.parseFloat(orderWeight);
        float result = a * b;
        NumberFormat formatter = new DecimalFormat("0.0");
        String formmatedFloatValue = formatter.format(result);
        ordersEntity.setNxRoSubtotal(formmatedFloatValue);
        ordersEntity.setNxRoStatus(2);
        ordersEntity.setNxRoWeight(orderWeight);

        nxRestrauntOrdersService.update(ordersEntity);
        return R.ok();
    }

    @RequestMapping(value = "/weighingGetGoods", method = RequestMethod.POST)
    @ResponseBody
    public R weighingGetGoods(Integer fatherId, Integer type) {
        Map<String, Object> map2 = new HashMap<>();
        map2.put("fatherId", fatherId);
        map2.put("type", type);
        map2.put("status", 2);
        List<NxCommunityGoodsEntity> comGoodsEntities = nxRestrauntOrdersService.queryOrderGoodsByFatherId(map2);

        if (comGoodsEntities.size() > 0) {
            return R.ok().put("data", comGoodsEntities);
        } else {
            return R.error(-1, "暂时没有商品");
        }

    }

    @RequestMapping(value = "/weighingGetOrders/{goodsId}")
    @ResponseBody
    public R weighingGetOrders(@PathVariable Integer goodsId) {

        Map<String, Object> map2 = new HashMap<>();
        map2.put("comGoodsId", goodsId);
        map2.put("status", 2);
        List<NxRestrauntOrdersEntity> comGoodsEntities = nxRestrauntOrdersService.queryResOrdersByParams(map2);

        if (comGoodsEntities.size() > 0) {
            return R.ok().put("data", comGoodsEntities);
        } else {
            return R.error(-1, "暂时没有商品");
        }
    }


    @RequestMapping(value = "/comGetOrderGoodsType", method = RequestMethod.POST)
    @ResponseBody
    public R comGetOrderGoodsType(Integer comId, Integer type) {

        if (type == 1) {

            Map<String, Object> map2 = new HashMap<>();
            map2.put("comId", comId);
            map2.put("type", type);
            map2.put("status", 2);
            List<NxCommunityFatherGoodsEntity> fatherGoodsEntities = nxRestrauntOrdersService.queryResOrdersByComStockGoodsType(map2);

            System.out.println("resutltltltlt");
            System.out.println(fatherGoodsEntities);
            return R.ok().put("data", fatherGoodsEntities);
        } else if (type == 2) {
            Map<String, Object> map2 = new HashMap<>();
            map2.put("comId", comId);
            map2.put("type", type);
            map2.put("status", 2);
            List<NxCommunityFatherGoodsEntity> fatherGoodsEntities = nxRestrauntOrdersService.queryResOrdersByComStockGoodsType(map2);
            return R.ok().put("data", fatherGoodsEntities);

        } else if (type == 3) {

            Map<String, Object> map2 = new HashMap<>();
            map2.put("comId", comId);
            map2.put("type", type);
            map2.put("status", 2);
            List<NxSupplierEntity> supplierEntities = nxRestrauntOrdersService.queryResOrdersByComSupplierGoodsType(map2);

            return R.ok().put("data", supplierEntities);

        }
//		else if(type == 4){
//			List<NxCommunityGoodsEntity> communityGoodsEntities = nxRestrauntOrdersService.queryResOrdersByComHandlingGoodsType(map2);
//			return R.ok();
//
//		}

        return R.error(-1, "请重新查询");

    }

    //不要purchase的概念了
    private Map<String, Object> purchaseGoodsResOrder(Integer comId, Integer type, Integer which) {
        Map<String, Object> map2 = new HashMap<>();
        map2.put("comId", comId);
        map2.put("purchaseDate", formatWhatDay(which));
        map2.put("type", type);
        List<NxCommunityFatherGoodsEntity> fatherGoodsEntities = nxCommunityPurchaseGoodsService.queryResOrdersByComPurchaseGoods(map2);

        Map<String, Object> map5 = new HashMap<>();
        map5.put("arr", fatherGoodsEntities);
        map5.put("week", getWeek(which));
        map5.put("hao", getJustHao(which));
        map5.put("which", 0);
        map5.put("date", formatWhatDay(which));
        map5.put("arrAmount", fatherGoodsEntities.size());
        return map5;
    }

    private Map<String, Object> stockGoodsResOrder(Integer comId, Integer type, Integer which) {
        Map<String, Object> map2 = new HashMap<>();
        map2.put("comId", comId);
//        map2.put("arriveDate", formatWhatDay(which));
        map2.put("type", type);
        map2.put("status", 2);
        List<NxCommunityFatherGoodsEntity> fatherGoodsEntities = nxRestrauntOrdersService.queryResOrdersByComStockGoodsType(map2);
        Map<String, Object> map5 = new HashMap<>();

        map5.put("arr", fatherGoodsEntities);
        map5.put("week", getWeek(which));
        map5.put("hao", getJustHao(which));
        map5.put("which", 0);
        map5.put("date", formatWhatDay(which));
        map5.put("arrAmount", fatherGoodsEntities.size());
        return map5;
    }

    private Map<String, Object> supplierGoodsResOrder(Integer comId, Integer type, Integer which) {
        Map<String, Object> map2 = new HashMap<>();
        map2.put("comId", comId);
        map2.put("arriveDate", formatWhatDay(which));
        map2.put("type", type);
        map2.put("status", 2);
        List<NxSupplierEntity> supplierEntities = nxRestrauntOrdersService.queryResOrdersByComSupplierGoodsType(map2);
        Map<String, Object> map5 = new HashMap<>();

        map5.put("arr", supplierEntities);
        map5.put("week", getWeek(which));
        map5.put("hao", getJustHao(which));
        map5.put("which", 0);
        map5.put("date", formatWhatDay(which));
        map5.put("arrAmount", supplierEntities.size());
        return map5;
    }


    @RequestMapping(value = "/comGetToPlanPurchaseGoods", method = RequestMethod.POST)
    @ResponseBody
    public R comGetToPlanPurchaseGoods(@RequestBody NxCommunityPurchaseGoodsEntity purchaseGoodsEntity) {
        Map<String, Object> map = new HashMap<>();
        map.put("comId", purchaseGoodsEntity.getNxCpgCommunityId());
        map.put("arriveDate", purchaseGoodsEntity.getNxCpgPurchaseDate());
        map.put("comGoodsType", 1);
        List<NxCommunityFatherGoodsEntity> fatherGoodsEntities = nxRestrauntOrdersService.comGetUnPlanPurchaseApplys(map);

        return R.ok().put("data", fatherGoodsEntities);
    }


    /**
     * 区域获取今日订货餐馆订单
     *
     * @param comId
     * @return
     */
    @RequestMapping(value = "/comGetTodayOrderRestruant/{comId}")
    @ResponseBody
    public R comGetTodayOrderCustomer(@PathVariable Integer comId) {

        //今天订货
        Map<String, Object> map1 = new HashMap<>();
        map1.put("comId", comId);
        map1.put("status", 5);
        List<NxRestrauntEntity> departmentEntities = nxRestrauntOrdersService.queryCommunityTodayRestruants(map1);

        if (departmentEntities.size() > 0) {
            return R.ok().put("data", departmentEntities);
        } else {
            return R.error(-1, "无订单");
        }
    }


    @RequestMapping(value = "/resGetApply/{resId}")
    @ResponseBody
    public R resGetApply(@PathVariable Integer resId) {

        //今天的数据
        Map<String, Object> map = new HashMap<>();
        map.put("resId", resId);
        map.put("orderBy", "time");
        map.put("status", 5);

        List<NxRestrauntOrdersEntity> ordersEntities = nxRestrauntOrdersService.queryResOrdersByParams(map);
        if ((ordersEntities.size() > 0)) {
            Map<String, Object> map1 = resGetTotalOrders(ordersEntities);
            map1.put("arr", ordersEntities);
            //查询餐馆状态
            NxRestrauntEntity nxRestrauntEntity = nxRestrauntService.queryObject(resId);
            map1.put("workingStatus", nxRestrauntEntity.getNxRestrauntWorkingStatus());
            map1.put("deliveryCost", nxRestrauntEntity.getNxRestrauntDeliveryCost());
            map1.put("deliveryLimit", nxRestrauntEntity.getNxRestrauntDeliveryLimit());
            System.out.println(nxRestrauntEntity.getNxRestrauntWorkingStatus() + "statussss");
            if (nxRestrauntEntity.getNxRestrauntWorkingStatus() == 3) {
                List<NxRestrauntOrdersEntity> payArr = new ArrayList<>();
                BigDecimal payToatl = new BigDecimal(0);
                System.out.println(payToatl + "payToatlpayToatl");

                for (NxRestrauntOrdersEntity orders : ordersEntities) {
                    String subtoal = orders.getNxRoSubtotal();
                    System.out.println(subtoal);
                    if (subtoal != null) {
                        BigDecimal pay = new BigDecimal(subtoal);
                        payToatl = payToatl.add(pay);
                        System.out.println(payToatl + "papapapap");
                        payArr.add(orders);
                    }
                }

                map1.put("payArr", JSON.toJSON(payArr));
                map1.put("payTotal", payToatl);
            }
            System.out.println("ekkekekekeekekke");
            System.out.println(map1);
            return R.ok().put("data", map1);
        }

        return R.error(-1, "没有订单");
    }

    private Map<String, Object> resGetTotalOrders(List<NxRestrauntOrdersEntity> ordersEntities) {
        Map<String, Object> map = new HashMap<>();
        BigDecimal total = new BigDecimal(0);
        List<NxRestrauntOrdersEntity> statusOrders = new ArrayList<>();
        for (NxRestrauntOrdersEntity ordersEntity : ordersEntities) {
            String nxRoSubtotal = ordersEntity.getNxRoSubtotal();
            if (nxRoSubtotal != null) {
                BigDecimal subtotal = new BigDecimal(nxRoSubtotal);
                total = total.add(subtotal);
                statusOrders.add(ordersEntity);
            }
        }
        map.put("total", total);
        map.put("payArr", statusOrders);
        return map;
    }

    private Map<String, Object> depGetWhichApplys(Integer resId, Integer which) {

        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("whatDay", getWeek(which));
        dataMap.put("date", getJustHao(which));

        Map<String, Object> deliveryTotalMap = new HashMap<>();

        //统计配送待备货
        Map<String, Object> deliverymap = new HashMap<>();
        deliverymap.put("arriveDate", formatWhatDay(which));
        deliverymap.put("resId", resId);
        deliverymap.put("goodsType", 0);
        int deliverytotal = nxRestrauntOrdersService.queryResOrdersTotalByParams(deliverymap);

        Map<String, Object> waitmap = new HashMap<>();
        waitmap.put("arriveDate", formatWhatDay(which));
        waitmap.put("resId", resId);
        waitmap.put("goodsType", 0);
        waitmap.put("statusEqual", 0);
        int waittotal = nxRestrauntOrdersService.queryResOrdersTotalByParams(waitmap);

        Map<String, Object> finishmap = new HashMap<>();
        finishmap.put("arriveDate", formatWhatDay(which));
        finishmap.put("resId", resId);
        finishmap.put("goodsType", 0);
        finishmap.put("statusEqual", 3);
        int finishtotal = nxRestrauntOrdersService.queryResOrdersTotalByParams(finishmap);


        deliveryTotalMap.put("waitTotal", waittotal);
        deliveryTotalMap.put("deliveryingTotal", deliverytotal - waittotal - finishtotal);
        deliveryTotalMap.put("finishTotal", finishtotal);
        dataMap.put("delivery", deliveryTotalMap);


        return dataMap;
    }


    /**
     * Community
     * quyu获取今日订货群和订单
     *
     * @param comId quyuid
     * @return 订货群
     */
    @RequestMapping(value = "/comGetToDeliveryRestraunt/{comId}")
    @ResponseBody
    public R comGetToDeliveryRestraunt(@PathVariable Integer comId) {
//    	List<Map<String, Object>> returnData = new ArrayList<>();
//
//		Map<String, Object> driverRestraunt = getDeliveryRestraunt(comId, 0);
//		returnData.add(driverRestraunt);
//		Map<String, Object> driverRestraunt1 = getDeliveryRestraunt(comId, 1);
//		returnData.add(driverRestraunt1);

        Map<String, Object> map1 = new HashMap<>();
        map1.put("comId", comId);
//        map1.put("arriveDate", formatWhatDay(which));
        map1.put("status", 3);
        List<NxRestrauntEntity> restaurantEntities1 = nxRestrauntOrdersService.queryCommunityTodayRestruants(map1);


        return R.ok().put("data", restaurantEntities1);
    }

    private Map<String, Object> getDeliveryRestraunt(Integer comId, Integer which) {
        //今天订货
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("whatDay", getWeek(which));
        dataMap.put("date", getJustHao(which));
        dataMap.put("which", which);
        dataMap.put("week", getWeek(which));
        dataMap.put("hao", getJustHao(which));

        Map<String, Object> map1 = new HashMap<>();
        map1.put("comId", comId);
        map1.put("arriveDate", formatWhatDay(which));
        map1.put("status", 3);
        List<NxRestrauntEntity> restaurantEntities1 = nxRestrauntOrdersService.queryCommunityTodayRestruants(map1);
        dataMap.put("arr", restaurantEntities1);

        return dataMap;
    }


    @RequestMapping(value = "/updateOrder", method = RequestMethod.POST)
    @ResponseBody
    public R updateOrder(@RequestBody NxRestrauntOrdersEntity nxRestrauntOrdersEntity) {
        nxRestrauntOrdersService.update(nxRestrauntOrdersEntity);
        return R.ok();
    }

    @RequestMapping(value = "/deleteResOrder/{id}")
    @ResponseBody
    public R deleteResOrder(@PathVariable Integer id) {
        nxRestrauntOrdersService.delete(id);
        return R.ok();
    }

    @ResponseBody
    @RequestMapping("/saveResOrder")
    public R saveResOrder(@RequestBody NxRestrauntOrdersEntity nxRestrauntOrdersEntity) {
        nxRestrauntOrdersService.save(nxRestrauntOrdersEntity);
        return R.ok();
    }


}
