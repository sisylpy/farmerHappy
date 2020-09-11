package com.nongxinle.controller;

/**
 * @author lpy
 * @date 06-21 21:51
 */

import java.util.*;

import com.nongxinle.entity.*;
import com.nongxinle.service.*;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;

import static com.nongxinle.utils.DateUtils.*;


@RestController
@RequestMapping("api/nxdepartmentorders")
public class NxDepartmentOrdersController {
    @Autowired
    private NxDepartmentOrdersService nxDepartmentOrdersService;

    @Autowired
    private NxGoodsService nxGoodsService;

    @Autowired
    private NxDepartmentService nxDepartmentService;

//    @Autowired
    private NxDistributerPurchaseGoodsService nxDisPurGoodsService;

    @Autowired
    private NxStandardService nxStandardService;




    /**
     * 9.13
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
        map.put("type", 0);
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
        List<NxDepartmentOrdersEntity> ordersEntities = nxDepartmentOrdersService.queryDisOrdersByParams(map);
        //按每天显示订单
        Map<String, Object> stringObjectMap = showOrderByEveryDay((ordersEntities));
        return R.ok().put("data", stringObjectMap);
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
        List<NxDepartmentOrdersEntity> ordersEntities = nxDepartmentOrdersService.queryDisOrdersByParams(map);
        //按每天显示订单
        Map<String, Object> stringObjectMap = showOrderByEveryDay((ordersEntities));
        return R.ok().put("data", stringObjectMap);
    }


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
            ordersEntity.setNxDoStatus(3);
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



//==========================================


    @RequestMapping(value = "/departmentGetTodayOrders/{depId}")
    @ResponseBody
    public R departmentGetTodayOrders(@PathVariable Integer depId) {


        List<NxDepartmentOrdersEntity> ordersEntities = nxDepartmentOrdersService.queryDepartmentTodayOrders(depId);
        return R.ok().put("data", ordersEntities);
    }







     @RequestMapping(value = "/saveOrderArr", method = RequestMethod.POST)
      @ResponseBody
      public R saveOrderArr (@RequestBody List<NxDepartmentOrdersEntity> orders) {
         System.out.println(orders);
         for (NxDepartmentOrdersEntity ordersEntity : orders) {
             nxDepartmentOrdersService.save(ordersEntity);
         }


        return R.ok();
      }



     @RequestMapping(value = "/saveDepartmentOrderFillContent", method = RequestMethod.POST)
      @ResponseBody
      public R saveDepartmentOrderFillContent (@RequestBody List<NxDepartmentOrdersEntity> depOrders) {

         for (NxDepartmentOrdersEntity ordersEntity : depOrders) {
             System.out.println(ordersEntity);
             ordersEntity.setNxDoStatus(2);
             nxDepartmentOrdersService.update(ordersEntity);

         }
        return R.ok();
      }




    /**
     * 批发商首页接口
     *
     * @param
     * @return 分配拣货员列表
     */
//    @RequestMapping(value = "/disGetIndexData/{disId}")
//    @ResponseBody
//    public R disGetIndexData(@PathVariable Integer disId) {
//        System.out.println(disId + "kkdkjfdka");
//        Map<String, Object> list = nxDepartmentOrdersService.queryDistributerIndexData(disId);
//        return R.ok().put("data", list);
//    }


    @RequestMapping(value = "/distributionWeighing", method = RequestMethod.POST)
    @ResponseBody
    public R distributionWeighing(@RequestBody List<NxDepartmentOrdersEntity> ordersEntities) {

        for (NxDepartmentOrdersEntity orders : ordersEntities) {
            orders.setNxDoStatus(1);
            nxDepartmentOrdersService.update(orders);
        }
        return R.ok();
    }





    @RequestMapping(value = "/disGetToPlanPurchaseGoods/{disId}")
    @ResponseBody
    public R disGetToPlanPurchaseGoods(@PathVariable Integer disId) {


        TreeSet<NxGoodsEntity> fatherEntityTreeSet = new TreeSet<>();
        List<NxDepartmentOrdersEntity> ordersEntities = nxDepartmentOrdersService.disGetUnPlanPurchaseApplys(disId);
        List<Map<String, Object>> resultData = new ArrayList<>();


        //1, 查询父级商品列表
        for (NxDepartmentOrdersEntity order : ordersEntities) {
            Integer nxDoNxGoodsId = order.getNxDoNxGoodsFatherId();
            System.out.println(nxDoNxGoodsId + "fatherididiidid");
            NxGoodsEntity fatherGoodsEntity = nxGoodsService.queryObject(nxDoNxGoodsId);
            fatherEntityTreeSet.add(fatherGoodsEntity);
        }

        for (NxGoodsEntity fatherGoods : fatherEntityTreeSet) {
            Map<String, Object> map = new HashMap<>();

            Integer nxGoodsId = fatherGoods.getNxGoodsId();
            String nxGoodsName = fatherGoods.getNxGoodsName();
            map.put("fatherGoodsId", nxGoodsId);
            map.put("fatherGoodsName", nxGoodsName);

            List<Map<String, Object>> goodsList = new ArrayList<>();
            List<Map<String, Object>> purList = new ArrayList<>();
            TreeSet<NxGoodsEntity> nxGoodsEntityTreeSet = new TreeSet<>();
            for (NxDepartmentOrdersEntity orders : ordersEntities) {
                if (fatherGoods.getNxGoodsId().equals(orders.getNxDoNxGoodsFatherId())) {
                    //todo
//                    nxGoodsEntityTreeSet.add(orders.getNxGoodsEntity());
                }
            }

            for (NxGoodsEntity goodsEntity : nxGoodsEntityTreeSet) {
                Map<String, Object> mapSub = new HashMap<>();


                mapSub.put("goodsName", goodsEntity.getNxGoodsName());
                mapSub.put("standardName", goodsEntity.getNxGoodsStandardname());
                mapSub.put("goodsId", goodsEntity.getNxGoodsId());

                Integer nxGoodsId1 = goodsEntity.getNxGoodsId();

                List<NxStandardEntity> standardEntities = nxStandardService.queryList(nxGoodsId1);
                mapSub.put("standardArr", standardEntities);
                mapSub.put("selectAmount", 0);
                List<Map<String, Object>> mapList = new ArrayList<>();
                mapSub.put("purchaseQuantity",mapList);


                List<NxDepartmentOrdersEntity> orders = nxDepartmentOrdersService.disGetUnPlanPurchaseGoodsByFatherGoodsId(nxGoodsId1);
                mapSub.put("orders", orders);
                goodsList.add(mapSub);

                Map<String, Object> search = new HashMap<>();
                map.put("disId", disId);
                map.put("goodsId", goodsEntity.getNxGoodsId());

//                List<NxDistributerPurchaseGoodsEntity> disPurGoodsEntities = nxDisPurGoodsService.queryPurchaseGoodsByGoodsId(map);
//                mapSub.put("purchase",disPurGoodsEntities);


            }
            map.put("goodsList", goodsList);
            map.put("purchaseList", purList);
            resultData.add(map);

        }


        return R.ok().put("data", resultData);
    }





    /**
     * 列表
     */
    @ResponseBody
    @RequestMapping("/list")
    @RequiresPermissions("nxdepartmentorders:list")
    public R list(Integer page, Integer limit) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);

        //查询列表数据
        List<NxDepartmentOrdersEntity> nxDepartmentOrdersList = nxDepartmentOrdersService.queryList(map);
        int total = nxDepartmentOrdersService.queryTotal(map);

        PageUtils pageUtil = new PageUtils(nxDepartmentOrdersList, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{nxDepartmentOrdersId}")
    @RequiresPermissions("nxdepartmentorders:info")
    public R info(@PathVariable("nxDepartmentOrdersId") Integer nxDepartmentOrdersId) {
        NxDepartmentOrdersEntity nxDepartmentOrders = nxDepartmentOrdersService.queryObject(nxDepartmentOrdersId);

        return R.ok().put("nxDepartmentOrders", nxDepartmentOrders);
    }



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
                    if(ordersEntity.getNxDoStatus() > 3 ){
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