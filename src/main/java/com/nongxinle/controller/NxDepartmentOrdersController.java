package com.nongxinle.controller;

/**
 * @author lpy
 * @date 06-21 21:51
 */

import java.util.*;

import com.nongxinle.entity.*;
import com.nongxinle.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.nongxinle.utils.R;

import static com.nongxinle.utils.DateUtils.*;


@RestController
@RequestMapping("api/nxdepartmentorders")
public class NxDepartmentOrdersController {
    @Autowired
    private NxDepartmentOrdersService nxDepartmentOrdersService;
    @Autowired
    private NxDepartmentService nxDepartmentService;
    @Autowired
    private NxRestrauntOrdersService nxRestrauntOrdersService ;








    @RequestMapping(value = "/finishOrders", method = RequestMethod.POST)
    @ResponseBody
    public R finishOrders (@RequestBody List<NxDepartmentOrdersEntity> ordersEntities  ) {
        for (NxDepartmentOrdersEntity orders : ordersEntities) {
            orders.setNxDoStatus(3);
            nxDepartmentOrdersService.update(orders);
        }
        return R.ok();
    }
    /**
     * 批发商给客户添加申请
     * @param depFatherId 客户id
     * @return 订单
     */
    @RequestMapping(value = "/disGetDepTodayOrders/{depFatherId}")
    @ResponseBody
    public R disGetDepTodayOrders (@PathVariable Integer depFatherId) {
//        Map<String, Object> map = new HashMap<>();
//        map.put("disId", disId);
//        map.put("depFatherId", depFatherId);
//        map.put("status", 3);
//       List<NxDepartmentOrdersEntity> ordersEntities =  nxDepartmentOrdersService.queryDisOrdersByParams(map);

//
        List<Map<String, Object>> resultData = new ArrayList<>();
        //明天的数据
        Map<String, Object> map3 = new HashMap<>();
        map3.put("arriveDate", formatWhatDay(1));
        map3.put("depFatherId", depFatherId);
        map3.put("status", 3);
        map3.put("orderBy", "time");
        List<NxDepartmentOrdersEntity> ordersEntities3 = nxDepartmentOrdersService.queryDisOrdersByParams(map3);
        if ((ordersEntities3.size() > 0)){
            Map<String, Object> map1 =  depGetWhichApplys(depFatherId, 1);
            map1.put("arr", ordersEntities3);
            resultData.add(map1);
        }
        //今天的数据
        Map<String, Object> map = new HashMap<>();
        map.put("arriveDate", formatWhatDay(0));
        map.put("depFatherId", depFatherId);
        map.put("status", 3);
        map.put("orderBy", "time");
        List<NxDepartmentOrdersEntity> ordersEntities = nxDepartmentOrdersService.queryDisOrdersByParams(map);
        if ((ordersEntities.size() > 0)){
            Map<String, Object> map1 =  depGetWhichApplys(depFatherId, 0);
            map1.put("arr", ordersEntities);
            resultData.add(map1);
        }

        return R.ok().put("data", resultData);
    }


    /**
     * 批发商打印拣货单
     * @param ordersEntities 订单
     * @return ok
     */
    @RequestMapping(value = "/distributionWeighing", method = RequestMethod.POST)
    @ResponseBody
    public R distributionWeighing(@RequestBody List<NxDepartmentOrdersEntity> ordersEntities) {

        for (NxDepartmentOrdersEntity orders : ordersEntities) {
            orders.setNxDoStatus(1);
            nxDepartmentOrdersService.update(orders);
        }
        return R.ok();
    }


    /**
     * 批发商获取未进货的订单
     * @param purchaseGoodsEntity 批发商id
     * @return 批发商父类商品
     */
    @RequestMapping(value = "/disGetToPlanPurchaseGoods", method = RequestMethod.POST)
    @ResponseBody
    public R disGetToPlanPurchaseGoods(@RequestBody NxDistributerPurchaseGoodsEntity purchaseGoodsEntity) {
        Map<String, Object> map = new HashMap<>();
        map.put("disId", purchaseGoodsEntity.getNxDpgDistributerId());
        map.put("arriveDate",purchaseGoodsEntity.getNxDpgPurchaseDate() );
        List<NxDistributerFatherGoodsEntity> fatherGoodsEntities = nxDepartmentOrdersService.disGetUnPlanPurchaseApplys(map);

        return R.ok().put("data", fatherGoodsEntities);
    }

    //
    @RequestMapping(value = "/saveToFillPrice", method = RequestMethod.POST)
    @ResponseBody
    public R saveToFillPrice (@RequestBody List<NxDepartmentOrdersEntity> depOrders) {
        for (NxDepartmentOrdersEntity ordersEntity : depOrders) {
                ordersEntity.setNxDoStatus(1);
                nxDepartmentOrdersService.update(ordersEntity);
        }
        return R.ok();
    }
    /**
     * 9-11
     * DISTRIBUTER
     * 保存订单的数量
     * @param depOrders 订单
     * @return ok
     */
    @RequestMapping(value = "/saveToFillWeight", method = RequestMethod.POST)
    @ResponseBody
    public R saveToFillWeight (@RequestBody List<NxDepartmentOrdersEntity> depOrders) {

        for (NxDepartmentOrdersEntity ordersEntity : depOrders) {
            ordersEntity.setNxDoStatus(2);
            nxDepartmentOrdersService.update(ordersEntity);
        }
        return R.ok();
    }


    /**
     * 9-11
     * DISTRIBUTER
     * 获取需要填写数量和价格的订单
     * @param depFatherId 群id
     * @return  订单
     */
    @RequestMapping(value = "/getToFillDepOrders", method = RequestMethod.POST)
    @ResponseBody
    public R getToFillDepOrders(Integer depFatherId, Integer which) {
        Map<String, Object> map = new HashMap<>();
        map.put("depFatherId", depFatherId);
        if(which == 0){
            map.put("arriveDate", formatWhatDay(0));
        }if(which == 1){
            map.put("arriveDate", formatWhatDay(1));
        }
        map.put("goodsType", 0);
        map.put("status", 3);

        List<NxDepartmentOrdersEntity> ordersEntities = nxDepartmentOrdersService.queryDisOrdersByParams(map);

        List<Map<String, Object>> mapList = new ArrayList<>();
        List<NxDepartmentEntity> entities = nxDepartmentService.querySubDepartments(depFatherId);

        if(entities.size() > 0){
            for (NxDepartmentEntity dep : entities) {
                Map<String, Object> mapDep = new HashMap<>();
                mapDep.put("depId", dep.getNxDepartmentId() );
                mapDep.put("depName", dep.getNxDepartmentName() );
                List<NxDepartmentOrdersEntity> depOrders = new ArrayList<>();
                for (NxDepartmentOrdersEntity order : ordersEntities) {
                    if(dep.getNxDepartmentId().equals(order.getNxDoDepartmentId())){
                        depOrders.add(order);
                    }
                }
                mapDep.put("depOrders", depOrders);
                if(depOrders.size() > 0){
                    mapList.add(mapDep);
                }
            }

            return R.ok().put("data", mapList);
        }else{
            return R.ok().put("data", ordersEntities);
        }

    }


    /**
     * PURCHASE,
     * @param depId 订货群id
     * @param disId 批发商id
     * @return 订货申请列表
     */
    @RequestMapping(value = "/purchaserGetDisOrders", method = RequestMethod.POST)
    @ResponseBody
    public R purchaserGetDisOrders (Integer depId, Integer disId, Integer arriveDate  ) {

        Map<String, Object> map = new HashMap<>();
        map.put("depFatherId", depId);
        map.put("disId", disId);
        map.put("orderBy", "time");
        map.put("status", 3);
        map.put("arriveDate", formatWhatDay(arriveDate));

        List<NxDepartmentOrdersEntity> ordersEntities = nxDepartmentOrdersService.queryDisOrdersByParams(map);
        //按每天显示订单
        Map<String, Object> stringObjectMap = countSwiperHeight((ordersEntities));

        //是否有送货单
//        Map<String, Object> map1 = new HashMap<>();
//        map1.put("disId", disId);
//        map1.put("depId", depId);
//        map1.put("statusEqual", 0);
//        List<NxDepartmentBillEntity> billEntityList = nxDepartmentBillService.queryBillsByParams(map1);
//        stringObjectMap.put("bills", billEntityList.size());

        return R.ok().put("data", stringObjectMap);
    }

    private Map<String, Object> countSwiperHeight (List<NxDepartmentOrdersEntity> ordersEntities ){
        Map<String, Object> map = new HashMap<>();
        Integer countRemark = 0;
        for (NxDepartmentOrdersEntity order : ordersEntities) {
            String nxDoRemark = order.getNxDoRemark();
            if (nxDoRemark.length() > 0){
                countRemark = countRemark + 1;
            }
        }
        map.put("remarkCount", countRemark);
        map.put("orderArr", ordersEntities);

        return map;
    }

    /**
     * PURCHASE,
     * //todo
     * @param depId 订货群id
     * @return 自采购商品
     */
    @RequestMapping(value = "/purchaserGetIndependentOrders",  method = RequestMethod.POST)
    @ResponseBody
    public R purchaserGetIndependentOrders (Integer depId, Integer arriveDate) {

        Map<String, Object> map = new HashMap<>();
        map.put("depFatherId", depId);
        map.put("goodsType", 1);
        map.put("status", 4);
        map.put("arriveDate", formatWhatDay(arriveDate));
        List<NxDepartmentOrdersEntity> ordersEntities = nxDepartmentOrdersService.queryDisOrdersByParams(map);
//        Map<String, Object> stringObjectMap = showOrderByEveryDay(ordersEntities);
        return R.ok().put("data", ordersEntities);
    }



    @RequestMapping(value = "/depGetApply/{depId}")
    @ResponseBody
    public R depGetApply(@PathVariable Integer depId) {
        List<Map<String, Object>> resultData = new ArrayList<>();
        //明天的数据
        Map<String, Object> map3 = new HashMap<>();
        map3.put("arriveDate", formatWhatDay(1));
        map3.put("depId", depId);
        map3.put("orderBy", "time");
        List<NxDepartmentOrdersEntity> ordersEntities3 = nxDepartmentOrdersService.queryDisOrdersByParams(map3);
        if ((ordersEntities3.size() > 0)){
            Map<String, Object> map1 =  depGetWhichApplys(depId, 1);
            map1.put("arr", ordersEntities3);
            resultData.add(map1);
        }
        //今天的数据
        Map<String, Object> map = new HashMap<>();
        map.put("arriveDate", formatWhatDay(0));
        map.put("depId", depId);
        map.put("orderBy", "time");
        List<NxDepartmentOrdersEntity> ordersEntities = nxDepartmentOrdersService.queryDisOrdersByParams(map);
        if ((ordersEntities.size() > 0)){
            Map<String, Object> map1 =  depGetWhichApplys(depId, 0);
            map1.put("arr", ordersEntities);
            resultData.add(map1);
        }

        return R.ok().put("data", resultData);
    }

    private Map<String, Object> depGetWhichApplys (Integer depId, Integer which) {

        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("whatDay", getWeek(which));
        dataMap.put("date", getJustHao(which));

        Map<String, Object> deliveryTotalMap = new HashMap<>();

       //统计配送待备货
        Map<String, Object> deliverymap = new HashMap<>();
        deliverymap.put("arriveDate", formatWhatDay(which));
        deliverymap.put("depId", depId);
        deliverymap.put("goodsType", 0);
        int deliverytotal =  nxDepartmentOrdersService.queryTotalByParams(deliverymap);

        Map<String, Object> waitmap = new HashMap<>();
        waitmap.put("arriveDate", formatWhatDay(which));
        waitmap.put("depId", depId);
        waitmap.put("goodsType", 0);
        waitmap.put("statusEqual", 0);
        int waittotal =  nxDepartmentOrdersService.queryTotalByParams(waitmap);

        Map<String, Object> finishmap = new HashMap<>();
        finishmap.put("arriveDate", formatWhatDay(which));
        finishmap.put("depId", depId);
        finishmap.put("goodsType", 0);
        finishmap.put("statusEqual", 3);
        int finishtotal =  nxDepartmentOrdersService.queryTotalByParams(finishmap);


        deliveryTotalMap.put("waitTotal", waittotal);
        deliveryTotalMap.put("deliveryingTotal", deliverytotal - waittotal - finishtotal);
        deliveryTotalMap.put("finishTotal", finishtotal);
        dataMap.put("delivery", deliveryTotalMap);


        Map<String, Object> purchaseTotalMap = new HashMap<>();


        //统计自采购
        Map<String, Object> purchasemap = new HashMap<>();
        purchasemap.put("arriveDate", formatWhatDay(which));
        purchasemap.put("depId", depId);
        purchasemap.put("goodsType", 1);
        int purchasetotal =  nxDepartmentOrdersService.queryTotalByParams(purchasemap);

        Map<String, Object> purmap = new HashMap<>();
        purmap.put("arriveDate", formatWhatDay(which));
        purmap.put("depId", depId);
        purmap.put("goodsType", 1);
        purmap.put("statusEqual", 0);
        int waitpurtotal =  nxDepartmentOrdersService.queryTotalByParams(purmap);

        Map<String, Object> finishPurmap = new HashMap<>();
        finishPurmap.put("arriveDate", formatWhatDay(which));
        finishPurmap.put("depId", depId);
        finishPurmap.put("goodsType", 1);
        finishPurmap.put("statusEqual", 3);
        int finishPurtotal =  nxDepartmentOrdersService.queryTotalByParams(finishPurmap);


        purchaseTotalMap.put("waitPurchaseTotal", waitpurtotal);
        purchaseTotalMap.put("purchasingTotal", purchasetotal - waitpurtotal - finishPurtotal);
        purchaseTotalMap.put("finishPurchaseTotal", finishPurtotal);
        dataMap.put("purchase", purchaseTotalMap);


        return dataMap;
    }



    /**
     * DISTRIBUTER
     * 批发商获取今日订货群和订单
     * @param disId 批发商id
     * @return 订货群
     */
    @RequestMapping(value = "/disGetTodayOrderCustomer/{disId}")
    @ResponseBody
    public R disGetTodayOrderCustomer(@PathVariable Integer disId) {

        List<Map<String, Object>> returnData = new ArrayList<>();

        //明天订货
        Map<String, Object> map2 = new HashMap<>();
        map2.put("disId", disId);
        map2.put("arriveDate", formatWhatDay(1));
        map2.put("status", 3);
        List<NxDepartmentEntity> departmentEntities2 =  nxDepartmentOrdersService.queryDistributerTodayDepartments(map2);

        if(departmentEntities2.size() > 0){
            System.out.println(departmentEntities2);
            Map<String, Object> tomorrowData = packageDisOrderByDep(departmentEntities2, 1);
            Map<String, Object> map1 = new HashMap<>();
            map1.put("disId", disId);
            map1.put("arriveDate", formatWhatDay(1));
            map1.put("equalBuyStatus", 0);
            List<NxDepartmentOrdersEntity> tomUnPurchaseApplys = nxDepartmentOrdersService.queryDisOrdersByParams(map1);
            tomorrowData.put("buyOrders", tomUnPurchaseApplys.size());
            returnData.add(tomorrowData);
        }


        //今天订货
        Map<String, Object> map1 = new HashMap<>();
        map1.put("disId", disId);
        map1.put("arriveDate", formatWhatDay(0));
        map1.put("status", 3);
        List<NxDepartmentEntity> departmentEntities =  nxDepartmentOrdersService.queryDistributerTodayDepartments(map1);
        Map<String, Object> todayData = packageDisOrderByDep(departmentEntities, 0);

        if(departmentEntities.size() > 0){
            System.out.println("===++++----------------" + departmentEntities.size());
            Map<String, Object> map3 = new HashMap<>();
            map3.put("disId", disId);
            map3.put("arriveDate", formatWhatDay(0));
            map3.put("equalBuyStatus", 0);
            List<NxDepartmentOrdersEntity> tomUnPurchaseApplys = nxDepartmentOrdersService.queryDisOrdersByParams(map3);
            todayData.put("buyOrders", tomUnPurchaseApplys.size());
            returnData.add(todayData);

        }


        return R.ok().put("data", returnData);
    }

    private   Map<String,Object>  packageDisOrderByDep( List<NxDepartmentEntity> departmentEntities, Integer which ) {
        Map<String, Object> map = new HashMap<>();
        map.put("week", getWeek(which) );
        map.put("hao", getJustHao(which) );
        map.put("arriveDate", formatWhatDay(which) );
        if(which.equals(0)){
            map.put("which", 0);
        }if(which.equals(1)){
            map.put("which", 1);
        }

        //根据部门是否有子部门组装部门订单
        //1,返回list
        List<Map<String,Object>> dataMap = new ArrayList<>();
        //2,有子部门的父部门
        TreeSet<NxDepartmentEntity> fatherDep = new TreeSet<>();
        //3，type是1的部门
        List<NxDepartmentEntity> subDepList = new ArrayList<>();

        for (NxDepartmentEntity dep : departmentEntities) {
            Integer fatherId = dep.getNxDepartmentFatherId();
            if(fatherId.equals(0)){
                //weightTotal
//                Map<String, Object> map1 = new HashMap<>();
//                map1.put("depFatherId", dep.getNxDepartmentId());
//                map1.put("arriveDate", formatWhatDay(which) );
//                map1.put("weightOrder", 1);
//                int  weightTotal =  nxDepartmentOrdersService.queryTotalByParams(map1);
                //pricTotal
//                Map<String, Object> map2 = new HashMap<>();
//                map2.put("depFatherId", dep.getNxDepartmentId());
//                map2.put("arriveDate", formatWhatDay(which) );
//                map2.put("priceOrder", 1);
//                int priceTotal =  nxDepartmentOrdersService.queryTotalByParams(map2);

                //未打印Total
//                Map<String, Object> map3 = new HashMap<>();
//                map3.put("depFatherId", dep.getNxDepartmentId());
//                map3.put("arriveDate", formatWhatDay(which) );
//                map3.put("statusEqual", 0);
//                int unWeighingTotal =  nxDepartmentOrdersService.queryTotalByParams(map3);

                Map<String, Object> depMap  = new HashMap<>();
                depMap.put("depHasSubs", 0);
                depMap.put("depId", dep.getNxDepartmentId());
                depMap.put("depName", dep.getNxDepartmentName());
                depMap.put("arrName", dep.getNxDepartmentAttrName());
                depMap.put("depOrders", dep.getNxDepartmentOrdersEntities());
                depMap.put("orderTotal", dep.getNxDepartmentOrdersEntities().size());
//                depMap.put("priceTotal", priceTotal);
//                depMap.put("weightTotal", weightTotal);
//                depMap.put("unWeighingTotal", unWeighingTotal);
                depMap.put("settleType", dep.getNxDepartmentSettleType());
                dataMap.add(depMap);
            }else{
                Integer nxDepartmentFatherId = dep.getNxDepartmentFatherId();
                NxDepartmentEntity departmentEntity1 = nxDepartmentService.queryObject(nxDepartmentFatherId);

                fatherDep.add(departmentEntity1);
                subDepList.add(dep);
            }
        }


        for (NxDepartmentEntity father : fatherDep) {
            Map<String, Object> fatherMap = new HashMap<>();
            fatherMap.put("depHasSubs",1);
            fatherMap.put("depId",father.getNxDepartmentId());
            fatherMap.put("depName", father.getNxDepartmentName());
            fatherMap.put("arrName", father.getNxDepartmentAttrName());
            fatherMap.put("settleType", father.getNxDepartmentSettleType());

            List<NxDepartmentEntity> subDeps = new ArrayList<>();

            //priceTotal
//            Map<String, Object> mapPrice = new HashMap<>();
//            mapPrice.put("depFatherId", father.getNxDepartmentId());
//            mapPrice.put("arriveDate", formatWhatDay(which) );
//            mapPrice.put("priceOrder", 1);
//            int priceTotalFather =  nxDepartmentOrdersService.queryTotalByParams(mapPrice);
//            fatherMap.put("priceTotal", priceTotalFather);
            //weightTotal
//            Map<String, Object> map3 = new HashMap<>();
//            map3.put("depFatherId", father.getNxDepartmentId());
//            map3.put("arriveDate", formatWhatDay(which) );
//            map3.put("weightOrder", 1);
//            int weightTotal =  nxDepartmentOrdersService.queryTotalByParams(map3);
//            fatherMap.put("weightTotal", weightTotal);
            //未打印Total
//            Map<String, Object> map4 = new HashMap<>();
//            map4.put("depFatherId", father.getNxDepartmentId());
//            map4.put("arriveDate", formatWhatDay(which) );
//            map4.put("statusEqual", 0);
//            int unWeighingTotal =  nxDepartmentOrdersService.queryTotalByParams(map4);
//            fatherMap.put("unWeighingTotal", unWeighingTotal);
            //quanbuTotal
//            Map<String, Object> map5 = new HashMap<>();
//            map5.put("depFatherId", father.getNxDepartmentId());
//            map5.put("arriveDate", formatWhatDay(which) );
//            map5.put("status", 3);
//            int ordersTotal =  nxDepartmentOrdersService.queryTotalByParams(map5);
//            fatherMap.put("orderTotal", ordersTotal);


            for (NxDepartmentEntity sub : subDepList) {
                if(father.getNxDepartmentId().equals(sub.getNxDepartmentFatherId())){
                    subDeps.add(sub);
                }
            }
            fatherMap.put("subDeps", subDeps);
            dataMap.add(fatherMap);
        }

        map.put("arr", dataMap);


        return map;
    }



    /**
     * PURCHASE,
     * 采购员复制自采购申请
     * @param depOrders 自采购申请
     * @return ok
     */
    @RequestMapping(value = "/purchaserCopyOrderContent", method = RequestMethod.POST)
    @ResponseBody
    public R purchaserCopyOrderContent (@RequestBody List<NxDepartmentOrdersEntity> depOrders) {
        for (NxDepartmentOrdersEntity ordersEntity : depOrders) {
            ordersEntity.setNxDoOperationTime(formatWhatTime(0));
            ordersEntity.setNxDoStatus(1);
            nxDepartmentOrdersService.update(ordersEntity);
        }
        return R.ok();
    }

    /**
     * PURCHASE,
     * 采购员完成自采购申请
     * @param depOrders 自采购申请
     * @return ok
     */
    @RequestMapping(value = "/purchaserFinishOrderContent", method = RequestMethod.POST)
    @ResponseBody
    public R purchaserFinishOrderContent (@RequestBody List<NxDepartmentOrdersEntity> depOrders) {
        for (NxDepartmentOrdersEntity ordersEntity : depOrders) {
            ordersEntity.setNxDoStatus(4);
            nxDepartmentOrdersService.update(ordersEntity);
        }
        return R.ok();
    }

    /**
     * ORDER,DISTRIBUTER
     * 添加订货申请
     * @param nxDepartmentOrders 订货申请
     * @return ok
     */
    @ResponseBody
    @RequestMapping("/save")
    public R save(@RequestBody NxDepartmentOrdersEntity nxDepartmentOrders) {
        nxDepartmentOrdersService.save(nxDepartmentOrders);
        return R.ok();
    }

    @ResponseBody
    @RequestMapping("/saveIndependent")
    public R saveIndependent(@RequestBody NxDepartmentOrdersEntity nxDepartmentOrders) {
        System.out.println(nxDepartmentOrders);
        nxDepartmentOrdersService.saveIndependent(nxDepartmentOrders);
        return R.ok();
    }


    /**
     * ORDER
     * 修改申请
     * @param nxDepartmentOrders 订货申请
     * @return ok
     */
    @ResponseBody
    @RequestMapping("/updateOrder")
    public R updateOrder(@RequestBody NxDepartmentOrdersEntity nxDepartmentOrders) {
        nxDepartmentOrdersService.update(nxDepartmentOrders);
        return R.ok();
    }

    /**
     * ORDER
     * 删除申请
     * @param nxDepartmentOrdersId 订货申请id
     * @return ok
     */
    @ResponseBody
    @RequestMapping("/delete/{nxDepartmentOrdersId}")
    public R delete(@PathVariable Integer nxDepartmentOrdersId) {
        nxDepartmentOrdersService.delete(nxDepartmentOrdersId);
        return R.ok();
    }


   //组装订货员的每日订单
    private Map<String, Object> showOrderByEveryDay(List<NxDepartmentOrdersEntity> ordersArr){
        List<Map<String, Object>> data = new ArrayList<>();
        TreeSet<NxDepartmentOrdersEntity> treeSet = new TreeSet<>();

        for (NxDepartmentOrdersEntity orders : ordersArr) {
            treeSet.add(orders);
        }
        Integer totalCount = 0;

        for (NxDepartmentOrdersEntity dateOrders : treeSet) {
            String nxDoArriveOnlyDate = dateOrders.getNxDoArriveOnlyDate();

            String nxDoArriveWhatDay = dateOrders.getNxDoArriveWhatDay();
            Map<String, Object> map1 = new HashMap<>();
            map1.put("date", nxDoArriveOnlyDate.substring(3,5));
            map1.put("whatDay",nxDoArriveWhatDay);
            Integer complate = 0;
            Integer preparing = 0;
            List<NxDepartmentOrdersEntity> arr = new ArrayList<>();

            for (NxDepartmentOrdersEntity ordersEntity: ordersArr) {
                if(ordersEntity.getNxDoArriveOnlyDate().equals(nxDoArriveOnlyDate)){
                    arr.add(ordersEntity);
                    if(ordersEntity.getNxDoStatus() > 0 ){
                        preparing = preparing + 1;
                    }
                    if(ordersEntity.getNxDoStatus() > 2 ){
                        complate = complate + 1;
                    }
                }
            }
            map1.put("preparing", preparing);
            map1.put("complate", complate);
            map1.put("total", arr.size());
            map1.put("arr", arr);
            data.add(map1);
            totalCount = totalCount + arr.size();

        }
        Map<String, Object> map2 = new HashMap<>();
        map2.put("arr",data );
        map2.put("totalCount", totalCount );
        return map2;
    }
}


//    @RequestMapping(value = "/departmentGetTodayOrders/{depId}")
//    @ResponseBody
//    public R departmentGetTodayOrders(@PathVariable Integer depId) {
//
//
//        List<NxDepartmentOrdersEntity> ordersEntities = nxDepartmentOrdersService.queryDepartmentTodayOrders(depId);
//        return R.ok().put("data", ordersEntities);
//    }






//
//     @RequestMapping(value = "/saveOrderArr", method = RequestMethod.POST)
//      @ResponseBody
//      public R saveOrderArr (@RequestBody List<NxDepartmentOrdersEntity> orders) {
//         System.out.println(orders);
//         for (NxDepartmentOrdersEntity ordersEntity : orders) {
//             nxDepartmentOrdersService.save(ordersEntity);
//         }
//
//
//        return R.ok();
//      }





//
//
//    /**
//     * 列表
//     */
//    @ResponseBody
//    @RequestMapping("/list")
//    @RequiresPermissions("nxdepartmentorders:list")
//    public R list(Integer page, Integer limit) {
//        Map<String, Object> map = new HashMap<>();
//        map.put("offset", (page - 1) * limit);
//        map.put("limit", limit);
//
//        //查询列表数据
//        List<NxDepartmentOrdersEntity> nxDepartmentOrdersList = nxDepartmentOrdersService.queryList(map);
//        int total = nxDepartmentOrdersService.queryTotal(map);
//
//        PageUtils pageUtil = new PageUtils(nxDepartmentOrdersList, total, limit, page);
//
//        return R.ok().put("page", pageUtil);
//    }
/**
 * 信息
 */
//    @ResponseBody
//    @RequestMapping("/info/{nxDepartmentOrdersId}")
//    @RequiresPermissions("nxdepartmentorders:info")
//    public R info(@PathVariable("nxDepartmentOrdersId") Integer nxDepartmentOrdersId) {
//        NxDepartmentOrdersEntity nxDepartmentOrders = nxDepartmentOrdersService.queryObject(nxDepartmentOrdersId);
//        return R.ok().put("nxDepartmentOrders", nxDepartmentOrders);
//    }



//
//
//        JSONArray jsonArray = JSONArray.fromObject(ordersEntities);
//        for (Object obj : jsonArray) {
//            JSONObject jsonObject2 = JSONObject.fromObject(obj);
//            NxDepartmentOrdersEntity ordersEntity = (NxDepartmentOrdersEntity) JSONObject.toBean(jsonObject2, NxDepartmentOrdersEntity.class);
//
//            ordersEntity.setNxDoStatus(1);
//            ordersEntity.setNxDoPickUserId(pickUserId);
//            nxDepartmentOrdersService.update(ordersEntity);
//
//        }