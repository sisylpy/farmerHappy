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
    private NxDepartmentDisGoodsService nxDepartmentDisGoodsService;



    @RequestMapping(value = "/disGetDepTodayOrders")
    @ResponseBody
    public R disGetDepTodayOrders (Integer disId,    Integer depFatherId, Integer depId) {
        System.out.println(disId + "sisisiis");
        Map<String, Object> map = new HashMap<>();
        map.put("disId", disId);
        map.put("depFatherId", depId);
        map.put("depId", depFatherId);
        map.put("status", 4);

       List<NxDepartmentOrdersEntity> ordersEntities =  nxDepartmentOrdersService.queryDisOrdersByParams(map);

        return R.ok().put("data", ordersEntities);
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
     * @param disId 批发商id
     * @return 批发商父类商品
     */
    @RequestMapping(value = "/disGetToPlanPurchaseGoods/{disId}")
    @ResponseBody
    public R disGetToPlanPurchaseGoods(@PathVariable Integer disId) {
        List<NxDistributerFatherGoodsEntity> fatherGoodsEntities = nxDepartmentOrdersService.disGetUnPlanPurchaseApplys(disId);

        return R.ok().put("data", fatherGoodsEntities);
    }

    //
    @RequestMapping(value = "/saveToFillPrice", method = RequestMethod.POST)
    @ResponseBody
    public R saveToFillPrice (@RequestBody List<NxDepartmentOrdersEntity> depOrders) {

        for (NxDepartmentOrdersEntity ordersEntity : depOrders) {
//            ordersEntity.setNxDoStatus(2);
            String nxDoPrice = ordersEntity.getNxDoPrice();
            Integer nxDoDepDisGoodsId = ordersEntity.getNxDoDepDisGoodsId();
            NxDepartmentDisGoodsEntity nxDepartmentDisGoodsEntity = nxDepartmentDisGoodsService.queryObject(nxDoDepDisGoodsId);
            nxDepartmentDisGoodsEntity.setNxDdgDepGoodsPrice(nxDoPrice);
            nxDepartmentDisGoodsEntity.setNxDdgDepGoodsPriceDate(formatWhatDate(0));

            nxDepartmentDisGoodsService.update(nxDepartmentDisGoodsEntity);

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
//            ordersEntity.setNxDoStatus(2);
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
    public R getToFillDepOrders(Integer depFatherId) {
        Map<String, Object> map = new HashMap<>();
        map.put("depFatherId", depFatherId);
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
    public R purchaserGetDisOrders (Integer depId, Integer disId  ) {

        Map<String, Object> map = new HashMap<>();
        map.put("depFatherId", depId);
        map.put("disId", disId);
        map.put("status", 3);
        map.put("orderBy", "time");

        List<NxDepartmentOrdersEntity> ordersEntities = nxDepartmentOrdersService.queryDisOrdersByParams(map);
        //按每天显示订单
        Map<String, Object> stringObjectMap = countSwiperHeight((ordersEntities));
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
     * @param depId 订货群id
     * @return 自采购商品
     */
    @RequestMapping(value = "/purchaserGetIndependentOrders/{depId}")
    @ResponseBody
    public R purchaserGetIndependentOrders (@PathVariable Integer depId) {

        Map<String, Object> map = new HashMap<>();
        map.put("depFatherId", depId);
        map.put("goodsType", 1);
        map.put("status", 4);

        List<NxDepartmentOrdersEntity> ordersEntities = nxDepartmentOrdersService.queryDisOrdersByParams(map);
        Map<String, Object> stringObjectMap = showOrderByEveryDay(ordersEntities);
        return R.ok().put("data", stringObjectMap);
    }

    /**
     * ORDER,
     * 订货用户查询申请
     * @param weeks 订货用户
     * @return 订单列表
     */
    @RequestMapping(value = "/depGetWeeksApply", method = RequestMethod.POST)
    @ResponseBody
    public R depGetWeeksApply(Integer weeks, Integer depId) {
        String date = formatWhatDate(-weeks);
        Map<String, Object> map = new HashMap<>();
        map.put("onlyDate", date);
        map.put("depId", depId);
        map.put("orderBy", "time");
        List<NxDepartmentOrdersEntity> ordersEntities = nxDepartmentOrdersService.queryDisOrdersByParams(map);
        //按每天显示订单
        Map<String, Object> stringObjectMap = showOrderByEveryDay((ordersEntities));
        return R.ok().put("data", stringObjectMap);
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

        Map<String, Object> map = new HashMap<>();
        map.put("disId", disId);
        List<NxDepartmentEntity> departmentEntities =  nxDepartmentOrdersService.queryDistributerTodayOrders(disId);

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
                Map<String, Object> depMap  = new HashMap<>();
                depMap.put("depHasSubs", 0);
                depMap.put("depId", dep.getNxDepartmentId());
                depMap.put("depName", dep.getNxDepartmentName());
                depMap.put("depOrders", dep.getNxDepartmentOrdersEntities());
                Integer newOrders =  nxDepartmentOrdersService.queryNewOrders(dep.getNxDepartmentId());
                depMap.put("newOrders", newOrders);
                dataMap.add(depMap);

            }else{
                Integer nxDepartmentFatherId = dep.getNxDepartmentFatherId();
                NxDepartmentEntity departmentEntity = nxDepartmentService.queryObject(nxDepartmentFatherId);
                fatherDep.add(departmentEntity);
                subDepList.add(dep);
            }
        }

        for (NxDepartmentEntity father : fatherDep) {
            Map<String, Object> fatherMap = new HashMap<>();
            fatherMap.put("depHasSubs",1);
            fatherMap.put("depId",father.getNxDepartmentId());
            fatherMap.put("depName", father.getNxDepartmentName());
            Integer newOrders =  nxDepartmentOrdersService.queryFatherNewOrders(father.getNxDepartmentId());
            fatherMap.put("newOrders", newOrders);
            List<NxDepartmentEntity> subDeps = new ArrayList<>();

            for (NxDepartmentEntity sub : subDepList) {
                if(father.getNxDepartmentId().equals(sub.getNxDepartmentFatherId())){
                    subDeps.add(sub);
                }
            }
            fatherMap.put("subDeps", subDeps);
            dataMap.add(fatherMap);
        }

        return R.ok().put("data", dataMap);
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
            String nxDoApplyOnlyDate = dateOrders.getNxDoApplyOnlyDate();

            String nxDoApplyWhatDay = dateOrders.getNxDoApplyWhatDay();
            Map<String, Object> map1 = new HashMap<>();
            map1.put("date", nxDoApplyOnlyDate);
            map1.put("whatDay",nxDoApplyWhatDay);
            Integer complate = 0;
            List<NxDepartmentOrdersEntity> arr = new ArrayList<>();

            for (NxDepartmentOrdersEntity ordersEntity: ordersArr) {
                if(ordersEntity.getNxDoApplyOnlyDate().equals(nxDoApplyOnlyDate)){
                    arr.add(ordersEntity);
                    if(ordersEntity.getNxDoStatus() == 1 ){
                        complate = complate + 1;
                    }
                }
            }
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