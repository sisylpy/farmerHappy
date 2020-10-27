package com.nongxinle.controller;

/**
 * @author lpy
 * @date 07-30 23:58
 */

import java.util.*;

import com.nongxinle.entity.*;
import com.nongxinle.service.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;

import static com.nongxinle.utils.PinYin4jUtils.getHeadStringByString;
import static com.nongxinle.utils.PinYin4jUtils.hanziToPinyin;


@RestController
@RequestMapping("api/nxdepartmentdisgoods")
public class NxDepartmentDisGoodsController {
    @Autowired
    private NxDepartmentDisGoodsService nxDepartmentDisGoodsService;
    @Autowired
    private NxDistributerGoodsService nxDistributerGoodsService;
    @Autowired
    private NxDepartmentStandardService nxDepartmentStandardService;
    @Autowired
    private NxDistributerStandardService nxDistributerStandardService;
    @Autowired
    private NxDistributerDepartmentService nxDisDepartmentService;
    @Autowired
    private NxDepartmentOrdersService nxDepartmentOrdersService;

    @RequestMapping(value = "/queryDepDisGoodsByQuickSearch", method = RequestMethod.POST)
    @ResponseBody
    public R queryDepDisGoodsByQuickSearch (String searchStr, Integer depId  ) {

        Map<String, Object> map = new HashMap<>();
        map.put("depId", depId);
        map.put("searchStr", searchStr);
        TreeSet<NxDepartmentDisGoodsEntity> disGoodsEntities = nxDepartmentDisGoodsService.queryDepDisSearchStr(map);
//        List<NxDepartmentDisGoodsEntity> disGoodsEntities = nxDepartmentDisGoodsService.queryDepDisSearchStr(map);

        Map<String, Object> map2 = new HashMap<>();
        map2.put("depId", depId);
        String pinyin = hanziToPinyin(searchStr);
        map2.put("pinyin",  pinyin);

        List<NxDepartmentDisGoodsEntity> disGoodsEntitiesPinyin = nxDepartmentDisGoodsService.queryDepDisSearchPinyin(map2);
        Map<String, Object> mapData = new HashMap<>();

        if(disGoodsEntities.size() > 0){

            boolean b = disGoodsEntitiesPinyin.removeAll(disGoodsEntities);
            if(b) {
                mapData.put("pinyin", disGoodsEntitiesPinyin);
            }
        }else {
            mapData.put("pinyin", disGoodsEntitiesPinyin);
        }
        mapData.put("str", disGoodsEntities);

        return R.ok().put("data", mapData);
    }
    /**
     * DISTRIBUTER
     * 获取不是批发商商品的客户列表
     * @param disGoodsId 批发商商品id
     * @param disId 批发商id
     * @return 客户列表
     */
    @RequestMapping(value = "/getUnDisGoodsDepartments", method = RequestMethod.POST)
    @ResponseBody
    public R getUnDisGoodsDepartments(Integer disGoodsId, Integer disId) {
        //查询已经添加disGoods的客户
        List<NxDepartmentEntity> addGoodsCustomer = nxDepartmentDisGoodsService.queryDepartmentsByDisGoodsId(disGoodsId);
        //查询批发商的全部客户
        List<NxDepartmentEntity> allCustomer = nxDisDepartmentService.queryAllDisDepartments(disId);
        //去除已经添加disGoods的客户
        allCustomer.removeAll(addGoodsCustomer);
        //返回没有添加disGoods的客户
        return R.ok().put("data", allCustomer);
    }



    /**
     * PURCHASE,ORDER,DISTRIBUTER
     * 订货群获取自己群商品类别
     * @param depId 订货群id
     * @return 订货群商品类别列表
     */
    @RequestMapping(value = "/depGetDepDisGoodsCata/{depId}")
    @ResponseBody
    public R depGetDepDisGoodsCata(@PathVariable Integer depId) {
        List<NxDistributerFatherGoodsEntity> disGoodsEntities = nxDepartmentDisGoodsService.depGetDepDisGoodsCata(depId);
        return R.ok().put("data", disGoodsEntities);
    }

    /**
     * PURCHASER
     * 采购员获取批发商商品，显示群是否添加
     * @param limit 每页商品数量
     * @param page 第几页
     * @param fatherId 商品父级id
     * @param depFatherId 订货群id
     * @param disId 批发商id
     * @return 批发商商品包含是否订货群下载
     */
    @RequestMapping(value = "/depGetDisGoods", method = RequestMethod.POST)
    @ResponseBody
    public R depGetDisGoods(Integer limit, Integer page, Integer fatherId, Integer depFatherId, Integer disId) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("fatherId", fatherId);
        map.put("disId", disId);

        List<NxDistributerGoodsEntity> disGoods = nxDistributerGoodsService.queryDisGoodsByParams(map);

//        List<NxDistributerGoodsEntity> goodsEntities = new ArrayList<>();
//        for (NxDistributerGoodsEntity goods : disGoods) {
//            //查询部门商品是否添加了配送商商品
//            Map<String, Object> map1 = new HashMap<>();
//            map1.put("depFatherId", depFatherId);
//            map1.put("disGoodsId", goods.getNxDistributerGoodsId());
//            List<NxDepartmentDisGoodsEntity> ddgGoods = nxDepartmentDisGoodsService.queryAddDisDepGoods(map1);
//            if (ddgGoods.size() > 0) {
//                goods.setIsDownload(1);
//                goods.setDepartmentDisGoodsEntity(ddgGoods.get(0));
//                goodsEntities.add(goods);
//            } else {
//                goods.setIsDownload(0);
//                goodsEntities.add(goods);
//            }
//        }

        Map<String, Object> map3 = new HashMap<>();
        map3.put("disId", disId );
        map3.put("fatherId", fatherId );
		int total = nxDistributerGoodsService.queryDisGoodsTotal(map3);


		//查询depGoods数量
//        Map<String, Object> map4 = new HashMap<>();
//        map4.put("depFatherId", depFatherId);
//        map4.put("disGoodsFatherId", fatherId);
//        List<NxDepartmentDisGoodsEntity> disGoodsEntities = nxDepartmentDisGoodsService.queryDepDisGoodsByParams(map4);
        Map<String, Object> map5 = new HashMap<>();
        map5.put("arr", disGoods);
//        map5.put("amount", disGoodsEntities.size());
        List<Map<String, Object>> mapList = new ArrayList<>();
        mapList.add(map5);

        PageUtils pageUtil = new PageUtils(mapList, total, limit, page);
        return R.ok().put("page", pageUtil);
    }


    @RequestMapping(value = "/deleteDepDisGoods/{depDisGoodsId}")
    @ResponseBody
    public R deleteDepDisGoods(@PathVariable Integer depDisGoodsId) {
        System.out.println(depDisGoodsId + "depdisgoodsid....");
        Map<String, Object> map = new HashMap<>();
        map.put("depDisGoodsId", depDisGoodsId);
        map.put("status", 4 );
        List<NxDepartmentOrdersEntity> ordersEntities = nxDepartmentOrdersService.queryDisOrdersByParams(map);
        if (ordersEntities.size() > 0){
            return R.error(-1,"此商品下有订单");
        }else {
            nxDepartmentDisGoodsService.delete(depDisGoodsId);
            return R.ok();
        }
    }

    /**
     * PURCHASE
     * 保存群商品
     * @param nxDepartmentDisGoods 群商品
     * @return ok
     */

    @RequestMapping("/saveDepDisGoods")
    public R saveDepDisGoods(@RequestBody NxDepartmentDisGoodsEntity nxDepartmentDisGoods) {

        //判断是否已经下载nxDdgDepartmentFatherId
        Integer nxDdgDepartmentId = nxDepartmentDisGoods.getNxDdgDepartmentFatherId();
        Integer nxDdgDisGoodsId = nxDepartmentDisGoods.getNxDdgDisGoodsId();
        Map<String, Object> map = new HashMap<>();
        map.put("depFatherId", nxDdgDepartmentId);
        map.put("disGoodsId", nxDdgDisGoodsId);
        List<NxDepartmentDisGoodsEntity> disGoodsEntities =   nxDepartmentDisGoodsService.queryDepDisGoodsByParams(map);

        if(disGoodsEntities.size() > 0){
            return R.error(-1, "已经下载");
        }else{
            nxDepartmentDisGoodsService.save(nxDepartmentDisGoods);

            Integer nxDepDisGoodsId = nxDepartmentDisGoods.getNxDepartmentDisGoodsId();
            List<NxDepartmentStandardEntity> nxDepStandardEntities = nxDepartmentDisGoods.getNxDepStandardEntities();
            if(nxDepStandardEntities.size() > 0){
                for (NxDepartmentStandardEntity standard : nxDepStandardEntities) {
                    standard.setNxDdsDdsGoodsId(nxDepDisGoodsId);
                    nxDepartmentStandardService.save(standard);
                }
            }
            return R.ok().put("data", nxDepartmentDisGoods);
        }

    }

    /**
     * DISTRIBUTE,
     * 批发商添加disGoods的订货群
     * @param depDisGoods 批发商商品
     * @return ok
     */
    @RequestMapping(value = "/disSaveDepartDisGoods", method = RequestMethod.POST)
    @ResponseBody
    public R disSaveDepartDisGoods (@RequestBody NxDepartmentDisGoodsEntity depDisGoods  ) {
        Integer nxDdgDisGoodsId = depDisGoods.getNxDdgDisGoodsId();
        NxDistributerGoodsEntity nxDisGoodsEntity = nxDistributerGoodsService.queryObject(nxDdgDisGoodsId);
        depDisGoods.setNxDdgDepGoodsName(nxDisGoodsEntity.getNxDgGoodsName());
        depDisGoods.setNxDdgDepGoodsDetail(nxDisGoodsEntity.getNxDgGoodsDetail());
        depDisGoods.setNxDdgDepGoodsBrand(nxDisGoodsEntity.getNxDgGoodsBrand());
        depDisGoods.setNxDdgDepGoodsPinyin(nxDisGoodsEntity.getNxDgGoodsPinyin());
        depDisGoods.setNxDdgDepGoodsPy(nxDisGoodsEntity.getNxDgGoodsPy());
        depDisGoods.setNxDdgDisGoodsFatherId(nxDisGoodsEntity.getNxDgDfgGoodsFatherId());

        nxDepartmentDisGoodsService.save(depDisGoods);

        Integer nxDepartmentDisGoodsId = depDisGoods.getNxDepartmentDisGoodsId();
        //批发商订货规格
        List<NxDistributerStandardEntity>  standardEntities = nxDistributerStandardService.queryDisStandardByDisGoodsId(depDisGoods.getNxDdgDisGoodsId());
        if(standardEntities.size() > 0){
            for (NxDistributerStandardEntity disEntities : standardEntities) {
                NxDepartmentStandardEntity depstandard = new NxDepartmentStandardEntity();
                depstandard.setNxDdsStandardName(disEntities.getNxDsStandardName());
                depstandard.setNxDdsDdsGoodsId(nxDepartmentDisGoodsId);
                nxDepartmentStandardService.save(depstandard);
            }
        }
        return R.ok();
    }

    /**
     * ORDER
     * 订货员获取配送商品
     * @param limit 每页显示商品数
     * @param page 第几页
     * @param depId 群id
     * @param fatherId 批发商商品父级id
     * @return 群商品列表
     */
    @RequestMapping(value = "/depGetDepGoods", method = RequestMethod.POST)
    @ResponseBody
    public R depGetDepGoods(Integer limit, Integer page,Integer depId, Integer fatherId) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("depId", depId);
        map.put("fatherId", fatherId);
        List<NxDepartmentDisGoodsEntity> goodsEntities = nxDepartmentDisGoodsService.queryDepGoodsByFatherId(map);

        for (NxDepartmentDisGoodsEntity disGoods : goodsEntities) {
            Integer nxDepartmentDisGoodsId = disGoods.getNxDepartmentDisGoodsId();
            List<NxDepartmentStandardEntity> standardEntities = nxDepartmentStandardService.queryDepGoodsStandards(nxDepartmentDisGoodsId);
            disGoods.setNxDepStandardEntities(standardEntities);
        }

        Map<String, Object> map3 = new HashMap<>();
        map3.put("depFatherId", depId);
        map3.put("fatherId", fatherId );
        int total = nxDepartmentDisGoodsService.queryDepGoodsTotal(map3);
        PageUtils pageUtil = new PageUtils(goodsEntities, total, limit, page);
        return R.ok().put("page", pageUtil);
    }













}
