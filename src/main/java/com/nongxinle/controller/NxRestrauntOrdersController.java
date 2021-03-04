package com.nongxinle.controller;

/**
 * @author lpy
 * @date 12-01 07:19
 */

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.*;


import com.nongxinle.entity.*;
import com.nongxinle.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.utils.R;



@RestController
@RequestMapping("api/nxrestrauntorders")

public class NxRestrauntOrdersController {
    @Autowired
    private NxRestrauntOrdersService nxRestrauntOrdersService;
    @Autowired
    private NxRestrauntService nxRestrauntService;
    @Autowired
    private NxCommunityFatherGoodsService nxCommunityFatherGoodsService;
    @Autowired
    private NxCommunityGoodsService cgService;
    @Autowired
    private NxCommunityPurchaseBatchService nxCPBatchService;

    private static String freeZero = "49.0";
    private static String freeOne = "99.0";
    private static String freeTwo = "99.0";


    @RequestMapping(value = "/disGetTodayCommunity/{disId}")
    @ResponseBody
    public R disGetTodayCommunity(@PathVariable Integer disId) {
        //今天平台
        Map<String, Object> map3 = new HashMap<>();
        map3.put("disId", disId);
        map3.put("status", 1);
        List<NxCommunityEntity> communityEntities =  nxRestrauntOrdersService.queryDistributerTodayCommunity(map3);
        System.out.println( "lccccccc" + communityEntities);
        Map<String, Object> map = new HashMap<>();

        if(communityEntities.size() > 0){
            Map<String, Object> map4 = new HashMap<>();
            map4.put("disId", disId);
            map4.put("status", 1);
            map4.put("equalBuyStatus", 0);
            List<NxDistributerGoodsEntity> distributerGoodsEntities = nxRestrauntOrdersService.queryDistributerGoodsWithResOrdersByParams(map4);
            map.put("comArr", distributerGoodsEntities);
        }else{
            map.put("comArr", new ArrayList<>());
        }
        //purchase
        Map<String, Object> map2 = new HashMap<>();
        map2.put("disId", disId);
        map2.put("status", 0);
        List<NxCommunityPurchaseBatchEntity> batchEntities = nxCPBatchService.queryComPurchaseBatchByParams(map2);
        if(batchEntities.size() > 0){
            map.put("batchArr", batchEntities);
        }else{
            map.put("batchArr", new ArrayList<>());
        }


        return R.ok().put("data", map);


    }


    @RequestMapping(value = "/getResToPrintResOrders/{id}")
    @ResponseBody
    public R getResToPrintResOrders(@PathVariable Integer id) {
        Map<String, Object> map = new HashMap<>();
        map.put("resFatherId", id);
        map.put("equalStatus", 3);
        map.put("printTimes", 0);
        List<NxRestrauntOrdersEntity> ordersEntities = nxRestrauntOrdersService.queryResOrdersByParams(map);
        return R.ok().put("data", ordersEntities);
    }


    @RequestMapping(value = "/comSaveOrderPrice", method = RequestMethod.POST)
    @ResponseBody
    public R comSaveOrderPrice (@RequestBody  List<NxRestrauntOrdersEntity> orders ) {
        for (NxRestrauntOrdersEntity order :
                orders) {
            nxRestrauntOrdersService.update(order);
        }
        return R.ok();
    }
    @RequestMapping(value = "/comGetResOrdersToFill/{id}")
    @ResponseBody
    public R comGetResOrdersToFill(@PathVariable Integer id) {
        Map<String, Object> map = new HashMap<>();
        map.put("resFatherId", id);
        map.put("status", 5);
        map.put("printTimes", 0);
        return R.ok().put("data",nxRestrauntOrdersService.queryResOrdersByParams(map));
    }

    @RequestMapping(value = "/comGetAccountResOrdersToPrint/{id}")
    @ResponseBody
    public R comGetAccountResOrdersToPrint(@PathVariable Integer id) {
        Map<String, Object> map = new HashMap<>();
        map.put("resFatherId", id);
        map.put("equalStatus", 1);
        map.put("printTimes", 0);
        return R.ok().put("data",nxRestrauntOrdersService.queryResOrdersByParams(map));
    }


    @RequestMapping(value = "/resManGetResOrders/{id}")
    @ResponseBody
    public R resManGetResOrders(@PathVariable String id) {

        Map<String, Object> map = new HashMap<>();
        map.put("resFatherId", id );
        map.put("status", 4 );
        List<NxCommunityFatherGoodsEntity> fatherGoodsEntities = nxRestrauntOrdersService.queryResOrdersByComStockGoodsType(map);
        return R.ok().put("data", fatherGoodsEntities);

    }


    @RequestMapping(value = "/chainResManGetResOrders/{resFatherId}")
    @ResponseBody
    public R chainResManGetResOrders(@PathVariable Integer resFatherId) {

        NxRestrauntEntity restrauntEntity = nxRestrauntService.queryResInfo(resFatherId);
        List<Integer> ids = new ArrayList<>();
        for (NxRestrauntEntity res :restrauntEntity.getNxRestrauntEntities()) {
            Integer nxRestrauntId = res.getNxRestrauntId();
            ids.add(nxRestrauntId);
        }
        System.out.println(ids);

        Map<String, Object> map = new HashMap<>();
        map.put("resIds",ids);
        map.put("status", 4);
        List<NxRestrauntOrdersEntity> ordersEntities = nxRestrauntOrdersService.queryResChainOrdersByParams(map);
        return R.ok().put("data", ordersEntities);
    }

    @RequestMapping(value = "/receiveOrderApply/{id}")
    @ResponseBody
    public R receiveOrderApply(@PathVariable Integer id) {
        NxRestrauntOrdersEntity ordersEntity = nxRestrauntOrdersService.queryObject(id);
        ordersEntity.setNxRoStatus(5);
        nxRestrauntOrdersService.update(ordersEntity);
        return R.ok();
    }

    @RequestMapping(value = "/orderGetResApply/{resId}")
    @ResponseBody
    public R orderGetResApply(@PathVariable Integer resId) {

        //今天的数据
        Map<String, Object> map = new HashMap<>();
        map.put("resId", resId);
        map.put("orderBy", "time");
        map.put("status", 5);

        return R.ok().put("data",nxRestrauntOrdersService.queryResOrdersByParams(map)) ;
    }


    @RequestMapping(value = "/changeOrderToUnWeight/{orderid}")
    @ResponseBody
    public R changeOrderToUnWeight(@PathVariable Integer orderid) {
        NxRestrauntOrdersEntity ordersEntity = nxRestrauntOrdersService.queryObject(orderid);
        ordersEntity.setNxRoStatus(0);
        ordersEntity.setNxRoWeight("-1");
        ordersEntity.setNxRoSubtotal("-1");
        nxRestrauntOrdersService.update(ordersEntity);
        return R.ok();
    }


    /**
     * community
     * 区域商获取正在进货商品
     *
     * @param comId 区域id
     * @return 进货批次
     */
    @RequestMapping(value = "/comGetBuyingGoods", method = RequestMethod.POST)
    @ResponseBody
    public R comGetBuyingGoods(Integer comId, Integer type) {
        System.out.println(type + "tytytytytyt" + comId);
        Map<String, Object> map = new HashMap<>();
        map.put("comId", comId);
        map.put("status", 1);
        map.put("type", type);
        TreeSet<NxCommunityPurchaseBatchEntity> batchEntities = nxRestrauntOrdersService.queryBuyingBatchGoods(map);
        return R.ok().put("data", batchEntities);
    }
    /**
     * community
     * 区域商获取未称重商品
     *
     * @param comId 区域商id
     * @return 区域商品
     */
    @RequestMapping(value = "/comGetToWeighCustomerList/{comId}")
    @ResponseBody
    public R comGetToWeighCustomerList(@PathVariable Integer comId) {
        Map<String, Object> map = new HashMap<>();
        map.put("comId", comId);
        map.put("status", 1);
        map.put("equalBuyStatus", 0);

        TreeSet<NxRestrauntEntity> restrauntEntities = nxRestrauntOrdersService.queryTodayComRestrauant(map);

        return R.ok().put("data", restrauntEntities);
    }

    /**
     * community
     * 区域商获取未称重商品
     *
     * @param comId 区域商id
     * @return 区域商品
     */
    @RequestMapping(value = "/comGetToWeighGoodsList/{comId}")
    @ResponseBody
    public R comGetToWeighGoodsList(@PathVariable Integer comId) {
        Map<String, Object> map = new HashMap<>();
        map.put("comId", comId);
        map.put("status", 1);
        map.put("order", "goods");
        List<NxCommunityFatherGoodsEntity> fatherGoods = nxRestrauntOrdersService.queryTodayComGoodsType(map);

        return R.ok().put("data", fatherGoods);
    }


    @RequestMapping(value = "/comGetResDeliveryGoods", method = RequestMethod.POST)
    @ResponseBody
    public R comGetResDeliveryGoods(Integer resId) {
        Map<String, Object> map = new HashMap<>();
        map.put("resFatherId", resId);
        map.put("equalStatus", 1);
        map.put("orderByGoods", 1);
        List<NxRestrauntOrdersEntity> nxRestrauntOrdersEntities = nxRestrauntOrdersService.queryComDeliveryResOrdersByParams(map);
        return R.ok().put("data", nxRestrauntOrdersEntities);
    }


    /**
     * 获取未填写成本的订单
     *
     * @param comId 社区id
     * @param type  类别
     * @return
     */
    @RequestMapping(value = "/comGetUnCostOrders", method = RequestMethod.POST)
    @ResponseBody
    public R comGetUnCostOrders(Integer comId, Integer type) {

        System.out.println(type + "type===");
        Map<String, Object> map = new HashMap<>();
        map.put("comId", comId);
        map.put("type", type);
        map.put("cost", 0);
        map.put("equalStatus", 6);
        TreeSet<NxRestrauntOrdersEntity> ordersTreeSet = nxRestrauntOrdersService.queryUnCostDate(map);
        List<Map<String, Object>> result = new ArrayList<>();
        if (ordersTreeSet.size() > 0) {
            for (NxRestrauntOrdersEntity orders : ordersTreeSet) {
                Map<String, Object> map1 = new HashMap<>();
                map1.put("comId", comId);
                map1.put("type", type);
                map1.put("cost", 0);
                map1.put("equalStatus", 6);
                map1.put("deliveryDate", orders.getNxRoDeliveryDate());
                List<NxCommunityFatherGoodsEntity> fatherGoodsEntities = nxRestrauntOrdersService.queryResOrdersByComStockGoodsType(map1);
                Map<String, Object> map3 = new HashMap<>();
                map3.put("date", orders.getNxRoDeliveryDate());
                map3.put("arr", fatherGoodsEntities);
                result.add(map3);
            }

            return R.ok().put("data", result);
        } else {
            return R.error(-1, "meiyou dingdan");
        }

    }


    /**
     * community
     * 填写订单商品的进货成本
     *
     * @param resOrders 订单
     * @return ok
     */
    @RequestMapping(value = "/comFillDailyOrderCost", method = RequestMethod.POST)
    @ResponseBody
    public R comFillDailyOrderCost(@RequestBody List<NxRestrauntOrdersEntity> resOrders) {
        for (NxRestrauntOrdersEntity ordersEntity : resOrders) {
            ordersEntity.setNxRoStatus(7);
            nxRestrauntOrdersService.update(ordersEntity);
        }
        return R.ok();
    }

    /**
     * 区域商填写订单重量
     *
     * @param resOrders
     * @return
     */
    @RequestMapping(value = "/comSaveOrderWeight", method = RequestMethod.POST)
    @ResponseBody
    public R comSaveOrderWeight(@RequestBody List<NxRestrauntOrdersEntity> resOrders) {
        for (NxRestrauntOrdersEntity ordersEntity : resOrders) {
            ordersEntity.setNxRoStatus(1);
//            ordersEntity.setNxRoBuyStatus(1);
            nxRestrauntOrdersService.update(ordersEntity);
        }
        return R.ok();
    }

    /**
     * android
     * 2
     *
     * @param fatherId
     * @param type
     * @return
     */
    @RequestMapping(value = "/weighingGetGoods", method = RequestMethod.POST)
    @ResponseBody
    public R aaaweighingGetGoods(Integer fatherId, Integer type) {
        Map<String, Object> map2 = new HashMap<>();
        map2.put("fatherId", fatherId);
        map2.put("type", type);
        map2.put("status", 1);
        List<NxCommunityGoodsEntity> comGoodsEntities = nxRestrauntOrdersService.queryOrderGoodsByFatherId(map2);

        if (comGoodsEntities.size() > 0) {
            return R.ok().put("data", comGoodsEntities);
        } else {
            return R.error(-1, "暂时没有商品");
        }

    }

    /**
     * android 获取称重订单
     *
     * @param goodsId
     * @return
     */
    @RequestMapping(value = "/weighingGetOrders/{goodsId}")
    @ResponseBody
    public R aaaweighingGetOrders(@PathVariable Integer goodsId) {

        Map<String, Object> map2 = new HashMap<>();
        map2.put("comGoodsId", goodsId);
        map2.put("status", 1);
        List<NxRestrauntOrdersEntity> comGoodsEntities = nxRestrauntOrdersService.queryResOrdersByParams(map2);

        if (comGoodsEntities.size() > 0) {
            return R.ok().put("data", comGoodsEntities);
        } else {
            return R.error(-1, "暂时没有商品");
        }
    }

    /**
     * android
     * 获取未称重商品类别
     *
     * @param comId
     * @param type
     * @return
     */
    @RequestMapping(value = "/weighingGetOrderGoodsType", method = RequestMethod.POST)
    @ResponseBody
    public R aaaaweighingGetOrderGoodsType(Integer comId, Integer type) {
        if (type == 1) {
            Map<String, Object> map1 = new HashMap<>();
            map1.put("comId", comId);
            map1.put("type", type);
            map1.put("status", 1);
            List<NxCommunityFatherGoodsEntity> fatherGoodsEntities = nxRestrauntOrdersService.queryTodayComGoodsType(map1);
            if (fatherGoodsEntities.size() > 0) {
                return R.ok().put("data", fatherGoodsEntities);
            } else {
                return R.error(-1, "暂时没有订货");
            }
        } else if (type == 2) {
            Map<String, Object> map2 = new HashMap<>();
            map2.put("comId", comId);
            map2.put("type", type);
            map2.put("status", 1);
            List<NxCommunityFatherGoodsEntity> fatherGoodsEntities = nxRestrauntOrdersService.queryTodayComGoodsType(map2);
            if (fatherGoodsEntities.size() > 0) {
                return R.ok().put("data", fatherGoodsEntities);
            } else {
                return R.error(-1, "暂时没有订货");

            }
        }
        else if (type == 3) {
            Map<String, Object> map2 = new HashMap<>();
            map2.put("comId", comId);
            map2.put("type", type);
            map2.put("status", 1);
            List<NxCommunityFatherGoodsEntity> fatherGoodsEntities = nxRestrauntOrdersService.queryTodayComGoodsType(map2);
            if (fatherGoodsEntities.size() > 0) {
                return R.ok().put("data", fatherGoodsEntities);
            } else {
                return R.error(-1, "暂时没有订货");

            }
        }
        return R.error(-1, "请重新查询");
    }


    /**
     * android 称重
     *
     * @param orderId
     * @param orderWeight
     * @return
     */
    @RequestMapping(value = "/saveOrderWeight", method = RequestMethod.POST)
    @ResponseBody
    public R androidSaveOrderWeight(Integer orderId, String orderWeight) {
        NxRestrauntOrdersEntity ordersEntity = nxRestrauntOrdersService.queryObject(orderId);
        String nxRoPrice = ordersEntity.getNxRoPrice();
        float a = Float.parseFloat(nxRoPrice);
        float b = Float.parseFloat(orderWeight);
        float result = a * b;
        NumberFormat formatter = new DecimalFormat("0.0");
        String formmatedFloatValue = formatter.format(result);
        ordersEntity.setNxRoSubtotal(formmatedFloatValue);
        ordersEntity.setNxRoStatus(1);
//        ordersEntity.setNxRoBuyStatus(1);
        ordersEntity.setNxRoWeight(orderWeight);
        nxRestrauntOrdersService.update(ordersEntity);
        return R.ok();
    }


    /**
     * community
     * 社区获取未进货商品
     *
     * @param comId 社区ID
     * @param type  商品类别
     * @return
     */
    @RequestMapping(value = "/comGetTodayUnBuyGoodsType", method = RequestMethod.POST)
    @ResponseBody
    public R comGetTodayUnBuyGoodsType(Integer comId, Integer type) {

        Map<String, Object> map2 = new HashMap<>();
        map2.put("comId", comId);
        map2.put("type", type);
        map2.put("equalBuyStatus", 0);
        map2.put("status", 1);

        if (type == 2 || type == 1) {
            List<NxCommunityFatherGoodsEntity> fatherGoodsEntities = nxRestrauntOrdersService.queryResOrdersByComStockGoodsType(map2);
            Map<String, Object> resultMap = getApplyComGoodsStatusTotal(comId, type);
            resultMap.put("arr", fatherGoodsEntities);
            return R.ok().put("data", resultMap);
        } else if (type == 3) {

            List<NxDistributerEntity> DistributerEntities = nxRestrauntOrdersService.queryResOrdersByComDistributerGoodsType(map2);

            Map<String, Object> resultMap = getApplyComGoodsStatusTotal(comId, type);
            resultMap.put("arr", DistributerEntities);

            return R.ok().put("data", resultMap);
        }

        return R.error(-1, "请重新查询");

    }

    private Map<String, Object> getApplyComGoodsStatusTotal(Integer comId, Integer type) {

        Map<String, Object> map1 = new HashMap<>();
        map1.put("comId", comId);
        map1.put("status", 1);
        map1.put("type", type);
        int totalGoods = nxRestrauntOrdersService.queryOrderComGoodsTodayTotal(map1);

        Map<String, Object> map2 = new HashMap<>();
        map2.put("comId", comId);
        map2.put("equalBuyStatus", 1);
        map2.put("status", 1);
        map2.put("type", type);
        int totalPurGoods = nxRestrauntOrdersService.queryOrderComGoodsTodayTotal(map2);

        Map<String, Object> resultMap = new HashMap<>();

        resultMap.put("goodsTotal", totalGoods);
        resultMap.put("goodsPurchase", totalPurGoods);
        return resultMap;

    }


    /**
     * community
     * 区域获取今日订货餐馆订单
     *
     * @param comId 社区id
     * @return 订货餐馆
     */
    @RequestMapping(value = "/comGetTodayOrderRestruant/{comId}")
    @ResponseBody
    public R comGetTodayOrderCustomer(@PathVariable Integer comId) {

        //今天订货
        Map<String, Object> map1 = new HashMap<>();
        map1.put("comId", comId);
        map1.put("status", 4);
        map1.put("printTimes", 0);
        TreeSet<NxRestrauntEntity> departmentEntities = nxRestrauntOrdersService.queryCommunityTodayRestruants(map1);

        //待支付客户
        Map<String, Object> map2 = new HashMap<>();
        map2.put("comId", comId);
        map2.put("status", 6);
        map2.put("dayuStatus", 4);
        map2.put("settleType", 0);
        TreeSet<NxRestrauntEntity> unPayRes = nxRestrauntOrdersService.queryCommunityTodayRestruants(map2);
        //待收货客户
        Map<String, Object> map3 = new HashMap<>();
        map3.put("comId", comId);
        map3.put("status", 5);
        map3.put("dayuStatus", 4);
        map3.put("settleType", 1);
        TreeSet<NxRestrauntEntity> unReceiveRes = nxRestrauntOrdersService.queryCommunityTodayRestruants(map3);


        Map<String, Object> map = new HashMap<>();
        map.put("arr", departmentEntities);
        map.put("unPay", unPayRes.size());
        map.put("unReceive", unReceiveRes.size());
        return R.ok().put("data", map);

    }


    /**
     * 餐馆获取订单
     *
     * @param resId 餐馆id
     * @return 订单
     */
    @RequestMapping(value = "/resGetApply/{resId}")
    @ResponseBody
    public R resGetApply(@PathVariable Integer resId) {
        Map<String, Object> mapData = new HashMap<>();
        List<NxRestrauntOrdersEntity> ordersEntitiesZero = getResApplysByRank(0, resId);
        List<NxRestrauntOrdersEntity> ordersEntitiesOne = getResApplysByRank(1, resId);
        List<NxRestrauntOrdersEntity> ordersEntitiesTwo = getResApplysByRank(2, resId);
        String totalExpectZero = "0.0";
        String totalExpectOne = "0.0";
        String totalExpectTwo = "0.0";
        String yunfeiZero = "0.0";
        String yunfeiOne = "0.0";
        String yunfeiTwo = "0.0";
        if (ordersEntitiesZero.size() > 0) {
            Map<String, Object> stringObjectMap = resGetTotalOrdersZero(ordersEntitiesZero);
            stringObjectMap.put("arr", ordersEntitiesZero);
            mapData.put("zero", stringObjectMap);
            totalExpectZero = (String) stringObjectMap.get("totalExpect");
            yunfeiZero = (String) stringObjectMap.get("yunfei");
        } else {
            mapData.put("zero", -1);
        }
        if (ordersEntitiesOne.size() > 0) {
            Map<String, Object> stringObjectMapOne = resGetTotalOrdersOne(ordersEntitiesOne);
            stringObjectMapOne.put("arr", ordersEntitiesOne);
            mapData.put("one", stringObjectMapOne);
            totalExpectOne = (String) stringObjectMapOne.get("totalExpect");
            yunfeiOne = (String) stringObjectMapOne.get("yunfei");
        } else {
            mapData.put("one", -1);
        }
        if (ordersEntitiesTwo.size() > 0) {
            Map<String, Object> stringObjectMapTwo = resGetTotalOrdersTwo(ordersEntitiesTwo, new BigDecimal(totalExpectZero));
            stringObjectMapTwo.put("arr", ordersEntitiesTwo);
            mapData.put("two", stringObjectMapTwo);
            totalExpectTwo = (String) stringObjectMapTwo.get("totalExpect");
            yunfeiTwo = (String) stringObjectMapTwo.get("yunfei");
        } else {
            mapData.put("two", -1);
        }

        //totalGoods, totalYunfei,total
        BigDecimal add = new BigDecimal(totalExpectZero).add(new BigDecimal(totalExpectOne)).add(new BigDecimal(totalExpectTwo));
        mapData.put("totalGoods", add.toString());
        BigDecimal totalYunfei = getMinBig(new BigDecimal(yunfeiZero), new BigDecimal(yunfeiOne), new BigDecimal(yunfeiTwo));
        System.out.println("mininmini===" + totalYunfei);
        mapData.put("totalYunfei", totalYunfei.toString());
        if (!totalYunfei.toString().equals("-1")) {
            BigDecimal add1 = add.add(totalYunfei);
            mapData.put("total", add1.toString());

        } else {
            mapData.put("total", add.toString());
        }

        //yunfeiZeroTishi
        if (!yunfeiZero.equals("0.0")) {
            BigDecimal bigDecimal = countTishiYunfeiZero(yunfeiZero, totalExpectZero);
            mapData.put("tishiZero", bigDecimal.toString());
        } else {
            mapData.put("tishiZero", -1);
        }
        //yunfeiOneTishi
        if (!yunfeiOne.equals("0.0")) {
            BigDecimal bigDecimal = countTishiYunfeiOne(yunfeiOne, totalExpectOne);
            mapData.put("tishiOne", bigDecimal.toString());
        } else {
            mapData.put("tishiOne", -1);
        }
        //yunfeiTwoTishi
        if (!yunfeiTwo.equals("0.0")) {
            BigDecimal bigDecimal = countTishiYunfeiTwo(yunfeiTwo, totalExpectTwo);
            mapData.put("tishiTwo", bigDecimal.toString());
        } else {
            mapData.put("tishiTwo", -1);
        }

        //获取餐馆是否结账
        NxRestrauntEntity nxRestrauntEntity = nxRestrauntService.queryObject(resId);
        if(nxRestrauntEntity.getNxRestrauntWorkingStatus().equals(3)){
            Map<String, Object> stringObjectMap = resGetToPayApply(resId);
            mapData.put("payMap", stringObjectMap);
        }else{
            mapData.put("payMap", -1);
        }

        if (!nxRestrauntEntity.getNxRestrauntWorkingStatus().equals(3) &&ordersEntitiesZero.size() == 0 && ordersEntitiesOne.size() == 0 && ordersEntitiesTwo.size() == 0) {
            return R.error(-1, "无订单");
        } else {
            return R.ok().put("data", mapData);
        }

    }


    public Map<String, Object> resGetToPayApply(Integer resId) {
        Map<String, Object> mapData = new HashMap<>();
        List<NxRestrauntOrdersEntity> ordersEntitiesZero = getResToPayApplysByRank(0, resId);
        List<NxRestrauntOrdersEntity> ordersEntitiesOne = getResToPayApplysByRank(1, resId);
        List<NxRestrauntOrdersEntity> ordersEntitiesTwo = getResToPayApplysByRank(2, resId);
        System.out.println(ordersEntitiesOne);
        System.out.println("hahhahahahahha------------------------------------");
        String totalExpectZero = "0.0";
        String totalExpectOne = "0.0";
        String totalExpectTwo = "0.0";
        String yunfeiZero = "0.0";
        String yunfeiOne = "0.0";
        String yunfeiTwo = "0.0";
        if (ordersEntitiesZero.size() > 0) {
            Map<String, Object> stringObjectMap = resGetTotalOrdersZeroPay(ordersEntitiesZero);
            stringObjectMap.put("arr", ordersEntitiesZero);
            mapData.put("zero", stringObjectMap);
            totalExpectZero = (String) stringObjectMap.get("totalSubtotal");
            yunfeiZero = (String) stringObjectMap.get("yunfei");
        } else {
            mapData.put("zero", -1);
        }
        if (ordersEntitiesOne.size() > 0) {
            Map<String, Object> stringObjectMapOne = resGetTotalOrdersOnePay(ordersEntitiesOne);
            stringObjectMapOne.put("arr", ordersEntitiesOne);
            mapData.put("one", stringObjectMapOne);
            totalExpectOne = (String) stringObjectMapOne.get("totalSubtotal");
            yunfeiOne = (String) stringObjectMapOne.get("yunfei");
        } else {
            mapData.put("one", -1);
        }
        if (ordersEntitiesTwo.size() > 0) {
            Map<String, Object> stringObjectMapTwo = resGetTotalOrdersTwoPay(ordersEntitiesTwo, new BigDecimal(totalExpectZero));
            stringObjectMapTwo.put("arr", ordersEntitiesTwo);
            mapData.put("two", stringObjectMapTwo);
            totalExpectTwo = (String) stringObjectMapTwo.get("totalSubtotal");
            yunfeiTwo = (String) stringObjectMapTwo.get("yunfei");
        } else {
            mapData.put("two", -1);
        }

        //totalGoods, totalYunfei,total
        BigDecimal add = new BigDecimal(totalExpectZero).add(new BigDecimal(totalExpectOne)).add(new BigDecimal(totalExpectTwo));
        mapData.put("totalGoods", add.toString());
        BigDecimal totalYunfei = getMinBig(new BigDecimal(yunfeiZero), new BigDecimal(yunfeiOne), new BigDecimal(yunfeiTwo));
        System.out.println("mininmini===" + totalYunfei);
        mapData.put("totalYunfei", totalYunfei.toString());
        if (!totalYunfei.toString().equals("-1")) {
            BigDecimal add1 = add.add(totalYunfei);
            mapData.put("total", add1.toString());

        } else {
            mapData.put("total", add.toString());
        }

        //yunfeiZeroTishi
        if (!yunfeiZero.equals("0.0")) {
            BigDecimal bigDecimal = countTishiYunfeiZero(yunfeiZero, totalExpectZero);
            mapData.put("tishiZero", bigDecimal.toString());
        } else {
            mapData.put("tishiZero", -1);
        }
        //yunfeiOneTishi
        if (!yunfeiOne.equals("0.0")) {
            BigDecimal bigDecimal = countTishiYunfeiOne(yunfeiOne, totalExpectOne);
            mapData.put("tishiOne", bigDecimal.toString());
        } else {
            mapData.put("tishiOne", -1);
        }
        //yunfeiTwoTishi
        if (!yunfeiTwo.equals("0.0")) {
            BigDecimal bigDecimal = countTishiYunfeiTwo(yunfeiTwo, totalExpectTwo);
            mapData.put("tishiTwo", bigDecimal.toString());
        } else {
            mapData.put("tishiTwo", -1);
        }


            return  mapData;

    }

    private BigDecimal getMinBig(BigDecimal rd, BigDecimal sl, BigDecimal sj) {

        List<BigDecimal> array = new ArrayList<>();
        BigDecimal zero = new BigDecimal("0.0");
        if (rd.compareTo(zero) != 0) {
            array.add(rd);
        }
        if (sl.compareTo(zero) != 0) {
            array.add(sl);
        }
        if (sj.compareTo(zero) != 0) {
            array.add(sj);
        }
        if (array.size() > 0) {
            BigDecimal min = array.get(0);
            //获取最小值
            for (int i = 0; i < array.size(); i++) {
                if (array.get(i).compareTo(min) == (-1)) {
                    min = array.get(i);
                }
            }
            return min;
        } else {
            return new BigDecimal("0.0");
        }
    }

    private BigDecimal countTishiYunfeiZero(String yunfei, String totalExpectZero) {
        BigDecimal subtract = new BigDecimal("99.0").subtract(new BigDecimal(totalExpectZero));
        return subtract;

//        if (yunfei.equals("12.0")) {
//            BigDecimal subtract = new BigDecimal("49.0").subtract(new BigDecimal(totalExpectZero));
//            return subtract;
//        } else {
//            BigDecimal subtract = new BigDecimal("99.0").subtract(new BigDecimal(totalExpectZero));
//            return subtract;
//        }
    }

    private BigDecimal countTishiYunfeiOne(String yunfei, String totalExpectOne) {

//        BigDecimal   noyunfeiTotal = (new BigDecimal(yunfei)).divide(new BigDecimal("0.055"),2,BigDecimal.ROUND_HALF_UP);
//        BigDecimal divide = noyunfeiTotal.divide(new BigDecimal("0.500"), 2, BigDecimal.ROUND_HALF_UP);
//        BigDecimal subtract = divide.subtract(new BigDecimal(totalExpectZero));
//        return subtract;
        if (yunfei.equals("20.0")) {
            BigDecimal subtract = new BigDecimal("99.0").subtract(new BigDecimal(totalExpectOne));
            return subtract;
        } else {
            return new BigDecimal("0.0");

        }

//        else{
//            BigDecimal subtract = new BigDecimal("99.0").subtract(new BigDecimal(totalExpectZero));
//            return subtract;
//        }
    }

    private BigDecimal countTishiYunfeiTwo(String yunfei, String totalExpectTwo) {
//        BigDecimal   noyunfeiTotal = (new BigDecimal(yunfei)).divide(new BigDecimal("0.085"),2,BigDecimal.ROUND_HALF_UP);
//        BigDecimal divide = noyunfeiTotal.divide(new BigDecimal("0.300"), 2, BigDecimal.ROUND_HALF_UP);
//        BigDecimal subtract = divide.subtract(new BigDecimal(totalExpectZero));
//        return divide;

        if (yunfei.equals("16.0")) {
            BigDecimal subtract = new BigDecimal("99.0").subtract(new BigDecimal(totalExpectTwo));
            return subtract;
        } else {
            return new BigDecimal("0.0");

        }
    }


//

    private List<NxRestrauntOrdersEntity> getResToPayApplysByRank(Integer rank, Integer resId) {
        //今天的数据
        Map<String, Object> map = new HashMap<>();
        map.put("resId", resId);
        map.put("orderBy", "time");
        map.put("equalStatus", 4);
        map.put("rank", rank);
        return nxRestrauntOrdersService.queryResOrdersByParams(map);
    }


    private List<NxRestrauntOrdersEntity> getResApplysByRank(Integer rank, Integer resId) {
        //今天的数据
        Map<String, Object> map = new HashMap<>();
        map.put("resId", resId);
        map.put("orderBy", "time");
        map.put("status", 4);
        map.put("rank", rank);
        return nxRestrauntOrdersService.queryResOrdersByParams(map);
    }

    private Map<String, Object> resGetTotalOrdersTwo(List<NxRestrauntOrdersEntity> ordersEntities, BigDecimal zeroTotal) {
        Map<String, Object> map = new HashMap<>();
        //1.预期One-订单金额
        BigDecimal totalExpect = new BigDecimal(0);
        for (NxRestrauntOrdersEntity ordersEntity : ordersEntities) {
            String nxRoExpectPrice = ordersEntity.getNxRoExpectPrice();
            if (nxRoExpectPrice != null) {
                BigDecimal subtotal = new BigDecimal(nxRoExpectPrice);
                totalExpect = totalExpect.add(subtotal);
            }
        }
        map.put("totalExpect", totalExpect.toString());

        //2，订单级别运费

//        BigDecimal oneShouldTotal = zeroTotal.multiply(new BigDecimal("0.3"));
//        BigDecimal chaTotal = totalExpect.subtract(oneShouldTotal);
//        if(chaTotal.signum() == 1 && totalExpect.compareTo(new BigDecimal(freeTwo)) < 0){
//            BigDecimal oneYunfei = chaTotal.multiply(new BigDecimal("0.085"));
//            BigDecimal setScale1 = oneYunfei.setScale(2,BigDecimal.ROUND_HALF_UP);
//            map.put("yunfei", setScale1.toString());
//        }else{
//            map.put("yunfei", "-1");
//        }

        BigDecimal mintotalExpect = new BigDecimal(99);

        if (totalExpect.compareTo(mintotalExpect) < 0) {
            BigDecimal subtract = mintotalExpect.subtract(totalExpect);
            map.put("cha", subtract.toString());
            map.put("yunfei", "16.0");
            //小于99 大于49
        } else {
            map.put("cha", 0);
            map.put("yunfei", "-1");
        }
        return map;
    }

    private Map<String, Object> resGetTotalOrdersTwoPay(List<NxRestrauntOrdersEntity> ordersEntities, BigDecimal zeroTotal) {
        Map<String, Object> map = new HashMap<>();
        //1.预期One-订单金额
        BigDecimal totalSubtotal = new BigDecimal(0);
        for (NxRestrauntOrdersEntity ordersEntity : ordersEntities) {
            String nxRoSubtotal = ordersEntity.getNxRoSubtotal();
            if (nxRoSubtotal != null) {
                BigDecimal subtotal = new BigDecimal(nxRoSubtotal);
                totalSubtotal = totalSubtotal.add(subtotal);
            }
        }
        map.put("totalSubtotal", totalSubtotal.toString());

        //2，订单级别运费

//        BigDecimal oneShouldTotal = zeroTotal.multiply(new BigDecimal("0.3"));
//        BigDecimal chaTotal = totalExpect.subtract(oneShouldTotal);
//        if(chaTotal.signum() == 1 && totalExpect.compareTo(new BigDecimal(freeTwo)) < 0){
//            BigDecimal oneYunfei = chaTotal.multiply(new BigDecimal("0.085"));
//            BigDecimal setScale1 = oneYunfei.setScale(2,BigDecimal.ROUND_HALF_UP);
//            map.put("yunfei", setScale1.toString());
//        }else{
//            map.put("yunfei", "-1");
//        }

        BigDecimal mintotalExpect = new BigDecimal(99);

        if (totalSubtotal.compareTo(mintotalExpect) < 0) {
            BigDecimal subtract = mintotalExpect.subtract(totalSubtotal);
            map.put("cha", subtract.toString());
            map.put("yunfei", "16.0");
            //小于99 大于49
        } else {
            map.put("cha", 0);
            map.put("yunfei", "-1");
        }
        return map;
    }

    private Map<String, Object> resGetTotalOrdersOne(List<NxRestrauntOrdersEntity> ordersEntities) {
        Map<String, Object> map = new HashMap<>();

        //1.预期订单金额
        BigDecimal totalExpect = new BigDecimal(0);
        for (NxRestrauntOrdersEntity ordersEntity : ordersEntities) {
            String nxRoExpectPrice = ordersEntity.getNxRoExpectPrice();
            if (nxRoExpectPrice != null) {
                BigDecimal subtotal = new BigDecimal(nxRoExpectPrice);
                totalExpect = totalExpect.add(subtotal);
            }
        }
        map.put("totalExpect", totalExpect.toString());
        //2，订单级别运费
        //最低
        BigDecimal mintotalExpect = new BigDecimal(99);

        //小于49
        if (totalExpect.compareTo(mintotalExpect) < 0) {
            BigDecimal subtract = mintotalExpect.subtract(totalExpect);
            map.put("cha", subtract.toString());
            map.put("yunfei", "20.0");
            //小于99 大于49
        } else {
            map.put("cha", 0);
            map.put("yunfei", "-1");

        }

        return map;
    }

    private Map<String, Object> resGetTotalOrdersOnePay(List<NxRestrauntOrdersEntity> ordersEntities) {
        Map<String, Object> map = new HashMap<>();

        //1.预期订单金额
        BigDecimal totalSubtotal = new BigDecimal(0);
        for (NxRestrauntOrdersEntity ordersEntity : ordersEntities) {
            String nxRoSubtotal = ordersEntity.getNxRoSubtotal();
            if (nxRoSubtotal != null) {
                BigDecimal subtotal = new BigDecimal(nxRoSubtotal);
                totalSubtotal = totalSubtotal.add(subtotal);
            }
        }
        map.put("totalSubtotal", totalSubtotal.toString());
        //2，订单级别运费
        //最低
        BigDecimal mintotalExpect = new BigDecimal(99);

        //小于49
        if (totalSubtotal.compareTo(mintotalExpect) < 0) {
            BigDecimal subtract = mintotalExpect.subtract(totalSubtotal);
            map.put("cha", subtract.toString());
            map.put("yunfei", "20.0");
            //小于99 大于49
        } else {
            map.put("cha", 0);
            map.put("yunfei", "-1");

        }

        return map;
    }


//    private Map<String, Object> resGetTotalOrdersOne(List<NxRestrauntOrdersEntity> ordersEntities, BigDecimal zeroTotal) {
//        Map<String, Object> map = new HashMap<>();
//
//        //1.预期One-订单金额
//        BigDecimal totalExpect = new BigDecimal(0);
//        for (NxRestrauntOrdersEntity ordersEntity : ordersEntities) {
//            String nxRoExpectPrice = ordersEntity.getNxRoExpectPrice();
//            if (nxRoExpectPrice != null) {
//                BigDecimal subtotal = new BigDecimal(nxRoExpectPrice);
//                totalExpect = totalExpect.add(subtotal);
//            }
//        }
//        map.put("totalExpect", totalExpect.toString());
//
//        //2，订单级别运费
//        BigDecimal oneShouldTotal = zeroTotal.multiply(new BigDecimal("0.5"));
//        BigDecimal chaTotal = totalExpect.subtract(oneShouldTotal);
//        System.out.println(totalExpect + "tttt");
//        if(chaTotal.signum() == 1 && totalExpect.compareTo(new BigDecimal(freeOne)) < 0){
//
//            BigDecimal oneYunfei = chaTotal.multiply(new BigDecimal("0.055"));
//            BigDecimal setScale1 = oneYunfei.setScale(2,BigDecimal.ROUND_HALF_UP);
//            map.put("yunfei", setScale1.toString());
//        }else{
//            map.put("yunfei", "0.0");
//        }
//
//        return map;
//    }

    private Map<String, Object> resGetTotalOrdersZero(List<NxRestrauntOrdersEntity> ordersEntities) {
        Map<String, Object> map = new HashMap<>();

        //1.预期订单金额
        BigDecimal totalExpect = new BigDecimal(0);
        for (NxRestrauntOrdersEntity ordersEntity : ordersEntities) {
            String nxRoExpectPrice = ordersEntity.getNxRoExpectPrice();
            if (nxRoExpectPrice != null) {
                BigDecimal subtotal = new BigDecimal(nxRoExpectPrice);
                totalExpect = totalExpect.add(subtotal);
            }
        }
        map.put("totalExpect", totalExpect.toString());
        //2，订单级别运费
        //最低
        BigDecimal mintotalExpect = new BigDecimal(49);
        BigDecimal middletotalExpect = new BigDecimal(99);
//            BigDecimal maxtotalExpect = new BigDecimal(199);

        //小于49
        if (totalExpect.compareTo(mintotalExpect) < 0) {
            BigDecimal subtract = mintotalExpect.subtract(totalExpect);
            map.put("cha", subtract.toString());
            map.put("yunfei", "12.0");
            //小于99 大于49
        } else {
//

            if (totalExpect.compareTo(middletotalExpect) < 0) {
                BigDecimal subtract = middletotalExpect.subtract(totalExpect);
                map.put("cha", subtract.toString());
                map.put("yunfei", "10.0");
                //xiao于199 大于99
            } else {
                map.put("cha", 0);
                map.put("yunfei", "-1");


//                    map.put("cha", 0);
//                    map.put("yunfei", "-1");
//
////                    if(totalExpect.compareTo(maxtotalExpect) < 0){
////                        BigDecimal subtract = maxtotalExpect.subtract(totalExpect);
////                        map.put("cha", subtract.toString());
////                        map.put("yunfei", "12.0");
////                        //dayu 199
////                    }else {
////                        map.put("cha", 0);
////                        map.put("yunfei", "0.0");
////                    }
            }
        }

        return map;
    }

    private Map<String, Object> resGetTotalOrdersZeroPay(List<NxRestrauntOrdersEntity> ordersEntities) {
        Map<String, Object> map = new HashMap<>();

        //1.预期订单金额
        BigDecimal totalSubtotal = new BigDecimal(0);
        for (NxRestrauntOrdersEntity ordersEntity : ordersEntities) {
            String nxRoSubtotal = ordersEntity.getNxRoSubtotal();
            if (nxRoSubtotal != null) {
                BigDecimal subtotal = new BigDecimal(nxRoSubtotal);
                totalSubtotal = totalSubtotal.add(subtotal);
            }
        }
        map.put("totalSubtotal", totalSubtotal.toString());
        //2，订单级别运费
        //最低
        BigDecimal mintotalExpect = new BigDecimal(49);
        BigDecimal middletotalExpect = new BigDecimal(99);
//            BigDecimal maxtotalExpect = new BigDecimal(199);

        //小于49
        if (totalSubtotal.compareTo(mintotalExpect) < 0) {
            BigDecimal subtract = mintotalExpect.subtract(totalSubtotal);
            map.put("cha", subtract.toString());
            map.put("yunfei", "12.0");
            //小于99 大于49
        } else {
            if (totalSubtotal.compareTo(middletotalExpect) < 0) {
                BigDecimal subtract = middletotalExpect.subtract(totalSubtotal);
                map.put("cha", subtract.toString());
                map.put("yunfei", "10.0");
                //xiao于199 大于99
            } else {
                map.put("cha", 0);
                map.put("yunfei", "-1");
            }
        }

        return map;
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

        Map<String, Object> map1 = new HashMap<>();
        map1.put("comId", comId);
        map1.put("equalStatus", 1);
        TreeSet<NxRestrauntEntity> restaurantEntities1 = nxRestrauntOrdersService.queryDeliveryResByParams(map1);

        return R.ok().put("data", restaurantEntities1);
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
        //rank
        Integer nxRoComGoodsFatherId = nxRestrauntOrdersEntity.getNxRoComGoodsFatherId();
        NxCommunityFatherGoodsEntity fatherGoodsEntity = nxCommunityFatherGoodsService.queryObject(nxRoComGoodsFatherId);
        NxCommunityFatherGoodsEntity grandGoodsEntity = nxCommunityFatherGoodsService.queryObject(fatherGoodsEntity.getNxCfgFathersFatherId());
        Integer nxCfgOrderRank = grandGoodsEntity.getNxCfgOrderRank();
        nxRestrauntOrdersEntity.setNxRoOrderRank(nxCfgOrderRank);
        //printTimes
        nxRestrauntOrdersEntity.setNxRoPrintTimes(0);
        //Distributer
        Integer comGoodsId = nxRestrauntOrdersEntity.getNxRoComGoodsId();
        NxCommunityGoodsEntity communityGoodsEntity = cgService.queryObject(comGoodsId);
        Integer nxCgDistributerId = communityGoodsEntity.getNxCgDistributerId();
        Integer nxCgDistributerGoodsId = communityGoodsEntity.getNxCgDistributerGoodsId();
        if(!nxCgDistributerId.equals(-1)){
           nxRestrauntOrdersEntity.setNxRoComDistributerId(nxCgDistributerId);
           nxRestrauntOrdersEntity.setNxRoComDistributerGoodsId(nxCgDistributerGoodsId);
           nxRestrauntOrdersEntity.setNxRoCostPrice(communityGoodsEntity.getNxCgBuyingPrice());
        }

        nxRestrauntOrdersService.save(nxRestrauntOrdersEntity);
        return R.ok().put("data", nxRestrauntOrdersEntity);
    }


}
