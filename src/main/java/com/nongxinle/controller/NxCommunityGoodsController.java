package com.nongxinle.controller;

/**
 * @author lpy
 * @date 2020-02-10 19:43:11
 */

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.*;
import com.nongxinle.service.*;
import com.nongxinle.utils.UploadFile;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

import static com.nongxinle.utils.PinYin4jUtils.getHeadStringByString;
import static com.nongxinle.utils.PinYin4jUtils.hanziToPinyin;


@RestController
@RequestMapping("api/nxcommunitygoods")
public class NxCommunityGoodsController {
    @Autowired
    private NxCommunityGoodsService cgService;

    @Autowired
    private NxCommunityStandardService dsService;

    @Autowired
    private NxCommunityFatherGoodsService cfgService;


    @Autowired
    private NxCommunityOrdersSubService nxCommunityOrdersSubService;
    @Autowired
    private NxGoodsService nxGoodsService;

    @Autowired
    private NxRestrauntOrdersService nxRestrauntOrdersService;
    @Autowired
    private NxCommunityPurchaseGoodsService nxCommunityPurchaseGoodsService;
    @Autowired
    private NxCommunityAliasService nxCommunityAliasService;



    /**
     *
     * @param searchStr 搜索字符串
     * @param comId 批发商id
     * @return 搜索结果
     */
    @RequestMapping(value = "/queryComGoodsByQuickSearch", method = RequestMethod.POST)
    @ResponseBody
    public R queryComGoodsByQuickSearch(String searchStr, String comId, Integer level) {

        System.out.println(searchStr);
        Map<String, Object> map = new HashMap<>();
        map.put("searchStr", searchStr);
        map.put("comId", comId);
        map.put("level", level);
        System.out.println(map);
        System.out.println("kkkkkkkkkmmmmmmm");
        List<NxCommunityGoodsEntity> goodsEntities = cgService.queryComGoodsQuickSearchStr(map);

        Map<String, Object> map2 = new HashMap<>();
        map2.put("comId", comId);
        String pinyin = hanziToPinyin(searchStr);
        map2.put("pinyin", pinyin);
        map2.put("level", level);

        List<NxCommunityGoodsEntity> comGoodsEntitiesPinyin = cgService.queryComGoodsQuickSearchPinyin(map2);
        Map<String, Object> mapData = new HashMap<>();

        if (goodsEntities.size() > 0) {
            mapData.put("str", goodsEntities);
            boolean b = comGoodsEntitiesPinyin.removeAll(goodsEntities);
            if (b) {
                mapData.put("pinyin", comGoodsEntitiesPinyin);
            }
        } else {
            mapData.put("str", goodsEntities);
            mapData.put("pinyin", comGoodsEntitiesPinyin);
        }
        return R.ok().put("data", mapData);
    }


    @RequestMapping(value = "/comUpdateCommunityGoods", method = RequestMethod.POST)
    @ResponseBody
    public R comUpdateCommunityGoods (@RequestBody NxCommunityGoodsEntity comGoods ) {

        //amount
        Integer nxCommunityGoodsId = comGoods.getNxCommunityGoodsId();
        NxCommunityGoodsEntity communityGoodsEntity = cgService.queryObject(nxCommunityGoodsId);

        Integer nxCgCfgGoodsFatherId = communityGoodsEntity.getNxCgCfgGoodsFatherId();
        NxCommunityFatherGoodsEntity fatherGoodsEntity = cfgService.queryObject(nxCgCfgGoodsFatherId);

        String nxCgGoodsPriceOld = communityGoodsEntity.getNxCgGoodsPrice();
        String nxCgGoodsTwoPriceOld = communityGoodsEntity.getNxCgGoodsTwoPrice();
        String nxCgGoodsThreePriceOLd = communityGoodsEntity.getNxCgGoodsThreePrice();

        String nxCgGoodsPrice = comGoods.getNxCgGoodsPrice();
        String nxCgGoodsTwoPrice = comGoods.getNxCgGoodsTwoPrice();
        String nxCgGoodsThreePrice = comGoods.getNxCgGoodsThreePrice();
       //
        if(nxCgGoodsPriceOld.equals("0") && !nxCgGoodsPrice.equals("0")){
            fatherGoodsEntity.setNxCfgPriceAmount(fatherGoodsEntity.getNxCfgPriceAmount() + 1);
        }
        if(!nxCgGoodsPriceOld.equals("0") && nxCgGoodsPrice.equals("0")){
            fatherGoodsEntity.setNxCfgPriceAmount(fatherGoodsEntity.getNxCfgPriceAmount() - 1);
        }
        //2
        if(nxCgGoodsTwoPriceOld.equals("0") && !nxCgGoodsTwoPrice.equals("0")){
            fatherGoodsEntity.setNxCfgPriceTwoAmount(fatherGoodsEntity.getNxCfgPriceTwoAmount() + 1);
        }
        if(!nxCgGoodsTwoPriceOld.equals("0") && nxCgGoodsTwoPrice.equals("0")){
            fatherGoodsEntity.setNxCfgPriceTwoAmount(fatherGoodsEntity.getNxCfgPriceTwoAmount() - 1);
        }
        //3
        if(nxCgGoodsThreePriceOLd.equals("0") && !nxCgGoodsThreePrice.equals("0")){
            fatherGoodsEntity.setNxCfgPriceThreeAmount(fatherGoodsEntity.getNxCfgPriceThreeAmount() + 1);
        }
        if(!nxCgGoodsThreePriceOLd.equals("0") && nxCgGoodsThreePrice.equals("0")){
            fatherGoodsEntity.setNxCfgPriceThreeAmount(fatherGoodsEntity.getNxCfgPriceThreeAmount() - 1);
        }

        cfgService.update(fatherGoodsEntity);

        //gengxin
        cgService.update(comGoods);

        return R.ok();
    }


    @RequestMapping(value = "/comGetGoodsDetail/{comGoodsId}")
    @ResponseBody
    public R comGetGoodsDetail(@PathVariable Integer comGoodsId) {

        //商品信息
        NxCommunityGoodsEntity comGoods = cgService.queryComGoodsDetail(comGoodsId);

        //每日订单
        Map<String, Object> map1 = new HashMap<>();
//        map1.put("comId", comGoods.getNxCgCommunityId());
        map1.put("comGoodsId", comGoodsId);
        List<NxRestrauntOrdersEntity> nxRestrauntOrdersEntities = nxRestrauntOrdersService.queryResOrdersForComGoods(map1);
        List<Map<String, Object>> orderMapList = new ArrayList<>();
        Map<String, Object> map4 = new HashMap<>();


//        for (int i = 1; i < nxRestrauntOrdersEntities.size(); i++) {
//            String nxDoApplyOnlyDate = nxRestrauntOrdersEntities.get(i - 1).getNxRoArriveOnlyDate();
//            if (nxDoApplyOnlyDate.equals(nxRestrauntOrdersEntities.get(i).getNxRoArriveOnlyDate())) {
//                nxRestrauntOrdersEntities.get(i).setShowDate(false);
//            }
//            Integer nxDoApplyWeeksYear = nxRestrauntOrdersEntities.get(i - 1).getNxRoArriveWeeksYear();
//            if (nxDoApplyWeeksYear.equals(nxRestrauntOrdersEntities.get(i).getNxRoArriveWeeksYear())) {
//                nxRestrauntOrdersEntities.get(i).setIsWeeks(false);
//            }
//        }

        //进货
        Map<String, Object> map2 = new HashMap<>();
//        map2.put("comId", comGoods.getNxCommunityGoodsId());
        map2.put("comGoodsId", comGoodsId);
        List<NxCommunityPurchaseGoodsEntity> disPurchaseGoods = nxCommunityPurchaseGoodsService.queryPurchaseForComGoods(map2);

        //客户
//        List<NxDepartmentEntity> entities = nxDepDisGoodsService.queryDepartmentsByDisGoodsId(disGoodsId);
        Map<String, Object> map = new HashMap<>();
        map.put("orderArr", nxRestrauntOrdersEntities);
        map.put("purchaseArr", disPurchaseGoods);

        map.put("goodsInfo", comGoods);
//        map.put("departmentArr", entities);


        return R.ok().put("data", map);
    }



    /**
     * 批发商商品列表
     * @param fatherId 父类id
     * @return 批发商商品列表
     */
    @RequestMapping(value = "/resGetComGoodsListByLevel", method = RequestMethod.POST)
    @ResponseBody
    public R resGetComGoodsListByLevel(Integer fatherId, Integer serviceLevel,
                                          Integer limit, Integer page) {

        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("cgFatherId", fatherId);
        map.put("serviceLevel", serviceLevel);
        System.out.println(map);
        System.out.println("mapmapmapm------");
        List<NxCommunityGoodsEntity> goodsEntities1 = cgService.queryComGoodsByParams(map);

        Map<String, Object> map3 = new HashMap<>();
        map3.put("fatherId", fatherId );
        int total = cgService.queryTotalByFatherId(map3);
        PageUtils pageUtil = new PageUtils(goodsEntities1, total, limit, page);
        return R.ok().put("page", pageUtil);
    }

    /**
     * 批发商商品列表
     * @param fatherId 父类id
     * @return 批发商商品列表
     */
    @RequestMapping(value = "/comGetComGoodsListByFatherId", method = RequestMethod.POST)
    @ResponseBody
    public R comGetComGoodsListByFatherId(Integer fatherId, Integer type,
                                          Integer limit, Integer page) {

        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("cgFatherId", fatherId);
        map.put("type", type);
        System.out.println(map);
        System.out.println("mapmapmapm------");
        List<NxCommunityGoodsEntity> goodsEntities1 = cgService.queryComGoodsByParams(map);

        Map<String, Object> map3 = new HashMap<>();
        map3.put("fatherId", fatherId );
        int total = cgService.queryTotalByFatherId(map3);
        PageUtils pageUtil = new PageUtils(goodsEntities1, total, limit, page);
        return R.ok().put("page", pageUtil);
    }


    @ResponseBody
    @RequestMapping("/comSaveCommunityGoods")
    public R comSaveCommunityGoods(@RequestBody NxCommunityGoodsEntity nxCommunityGoodsEntity) {

        String goodsName = nxCommunityGoodsEntity.getNxCgGoodsName();
        String nxGoodsDetail = nxCommunityGoodsEntity.getNxCgGoodsDetail();
        String nxGoodsBrand = nxCommunityGoodsEntity.getNxCgGoodsBrand();

        Map<String, Object> map = new HashMap<>();
        map.put("goodsName", goodsName);
        map.put("goodsDetail", nxGoodsDetail);
        map.put("goodsBrand", nxGoodsBrand);
        List<NxGoodsEntity> goodsEntities = nxGoodsService.queryIfHasSameGoods(map);
        if (goodsEntities.size() > 0) {
            return R.error(-1, "已有相同商品");

        } else {

            //保存nxgoods
            NxGoodsEntity nxGoodsEntity = new NxGoodsEntity();
            nxGoodsEntity.setNxGoodsName(goodsName);
            nxGoodsEntity.setNxGoodsDetail(nxGoodsDetail);
            nxGoodsEntity.setNxGoodsBrand(nxGoodsBrand);
            String pinyin = hanziToPinyin(goodsName);
            String headPinyin = getHeadStringByString(goodsName, false, null);
            nxGoodsEntity.setNxGoodsPinyin(pinyin);
            nxGoodsEntity.setNxGoodsPy(headPinyin);
            nxGoodsEntity.setNxGoodsFatherId(nxCommunityGoodsEntity.getNxCgNxFatherId());
            nxGoodsEntity.setNxGoodsStandardname(nxCommunityGoodsEntity.getNxCgGoodsStandardname());
            nxGoodsEntity.setNxGoodsBrand(nxCommunityGoodsEntity.getNxCgGoodsBrand());
            nxGoodsEntity.setNxGoodsPlace(nxCommunityGoodsEntity.getNxCgGoodsPlace());
            nxGoodsService.save(nxGoodsEntity);

            //保存comGoods
            Integer nxGoodsId = nxGoodsEntity.getNxGoodsId();
            nxCommunityGoodsEntity.setNxCgNxGoodsId(nxGoodsId);
            nxCommunityGoodsEntity.setNxCgGoodsPinyin(pinyin);
            nxCommunityGoodsEntity.setNxCgGoodsPy(headPinyin);
            nxCommunityGoodsEntity.setNxCgNxGoodsId(nxGoodsId);
            NxCommunityGoodsEntity communityGoodsEntity = saveCommunityGoods(nxCommunityGoodsEntity);

            return R.ok().put("data", communityGoodsEntity.getNxCommunityGoodsId());

        }


    }
    private NxCommunityGoodsEntity saveCommunityGoods(NxCommunityGoodsEntity cgGoods) {

        //queryGrandFatherId
        NxGoodsEntity fatherEntity = nxGoodsService.queryObject(cgGoods.getNxCgNxFatherId());
        Integer grandFatherId = fatherEntity.getNxGoodsFatherId();
        cgGoods.setNxCgNxGrandId(grandFatherId);
        NxGoodsEntity grandEntity = nxGoodsService.queryObject(grandFatherId);
        cgGoods.setNxCgNxGrandName(grandEntity.getNxGoodsName());

        //queryGreatGrandFatherId
        Integer greatGrandFatherId = grandEntity.getNxGoodsFatherId();
        cgGoods.setNxCgNxGreatGrandId(greatGrandFatherId);
        cgGoods.setNxCgNxGreatGrandName(nxGoodsService.queryObject(greatGrandFatherId).getNxGoodsName());

        Integer communityId = cgGoods.getNxCgCommunityId();

        // 3， 查询父类
        Integer nxDgNxFatherId = cgGoods.getNxCgNxFatherId();
        Map<String, Object> map = new HashMap<>();
        map.put("comId", communityId);
        map.put("nxFatherId", nxDgNxFatherId);
        List<NxCommunityGoodsEntity> communityGoodsEntities = cgService.queryComGoodsHasNxGoodsFather(map);

        if (communityGoodsEntities.size() > 0) {
            NxCommunityGoodsEntity communityGoodsEntity = communityGoodsEntities.get(0);

            //直接加disGoods和disStandard,不需要加disFatherGoods
            //1，给父类商品的字段商品数量加1
            Integer nxDgDfgGoodsFatherId1 = communityGoodsEntity.getNxCgCfgGoodsFatherId();

            NxCommunityFatherGoodsEntity nxCommunityFatherGoodsEntity = cfgService.queryObject(nxDgDfgGoodsFatherId1);
            Integer nxDfgGoodsAmount = nxCommunityFatherGoodsEntity.getNxCfgGoodsAmount();
            nxCommunityFatherGoodsEntity.setNxCfgGoodsAmount(nxDfgGoodsAmount + 1);
            cfgService.update(nxCommunityFatherGoodsEntity);

            //2，保存disId商品
            Integer nxDgDfgGoodsFatherId = communityGoodsEntity.getNxCgCfgGoodsFatherId();
            cgGoods.setNxCgCfgGoodsFatherId(nxDgDfgGoodsFatherId);
            //1 ，先保存disGoods
            cgService.save(cgGoods);
            //
        } else {
            //添加fatherGoods的第一个级别
            NxCommunityFatherGoodsEntity cgf = new NxCommunityFatherGoodsEntity();
            cgf.setNxCfgCommunityId(cgGoods.getNxCommunityGoodsId());
            cgf.setNxCfgFatherGoodsName(cgGoods.getNxCgNxFatherName());
            cgf.setNxCfgFatherGoodsLevel(2);
            cgf.setNxCfgGoodsAmount(1);
            cgf.setNxCfgFatherGoodsColor(cgGoods.getNxCgNxGoodsFatherColor());
            cgf.setNxCfgNxGoodsId(cgGoods.getNxCgNxFatherId());
            cgf.setNxCfgCommunityId(cgGoods.getNxCgCommunityId());
            cgf.setNxCfgFatherGoodsImg(cgGoods.getNxCgNxFatherImg());
            cgf.setNxCfgPriceAmount(0);
            cgf.setNxCfgPriceTwoAmount(0);
            cgf.setNxCfgPriceThreeAmount(0);
            cfgService.save(cgf);
            //更新disGoods的fatherGoodsId
            Integer communityFatherGoodsId = cgf.getNxCommunityFatherGoodsId();
            cgGoods.setNxCgCfgGoodsFatherId(communityFatherGoodsId);
            cgService.save(cgGoods);
            //继续查询是否有GrandFather
            String grandName = cgGoods.getNxCgNxGrandName();
            Map<String, Object> map2 = new HashMap<>();
            map2.put("comId", communityId);
            map2.put("fathersFatherName", grandName);
            List<NxCommunityFatherGoodsEntity> grandGoodsFather = cfgService.queryHasComFathersFather(map2);
            if (grandGoodsFather.size() > 0) {
                NxCommunityFatherGoodsEntity communityFatherGoodsEntity = grandGoodsFather.get(0);
                cgf.setNxCfgFathersFatherId(communityFatherGoodsEntity.getNxCommunityFatherGoodsId());
                cfgService.update(cgf);
            } else {

                //tianjiaGrand
                NxCommunityFatherGoodsEntity grand = new NxCommunityFatherGoodsEntity();
                String nxCgGrandFatherName = cgGoods.getNxCgNxGrandName();
                grand.setNxCfgFatherGoodsName(nxCgGrandFatherName);
                grand.setNxCfgCommunityId(cgGoods.getNxCgCommunityId());
                grand.setNxCfgFatherGoodsLevel(1);
                grand.setNxCfgNxGoodsId(cgGoods.getNxCgNxGrandId());
                cfgService.save(grand);

                //todo
                cgf.setNxCfgFathersFatherId(grand.getNxCommunityFatherGoodsId());
                cfgService.update(cgf);


                //查询是否有greatGrand
                String greatGrandName = cgGoods.getNxCgNxGreatGrandName();
                Map<String, Object> map3 = new HashMap<>();
                map3.put("comId", communityId);
                map3.put("fathersFatherName", greatGrandName);
                List<NxCommunityFatherGoodsEntity> greatGrandGoodsFather = cfgService.queryHasComFathersFather(map3);
                if (greatGrandGoodsFather.size() > 0) {
                    NxCommunityFatherGoodsEntity NxCommunityFatherGoodsEntity = greatGrandGoodsFather.get(0);
                    Integer disFatherId = NxCommunityFatherGoodsEntity.getNxCommunityFatherGoodsId();
                    grand.setNxCfgFathersFatherId(disFatherId);
                    cfgService.update(grand);
                } else {
                    NxCommunityFatherGoodsEntity greatGrand = new NxCommunityFatherGoodsEntity();
                    String greatGrandName1 = cgGoods.getNxCgNxGreatGrandName();
                    greatGrand.setNxCfgFatherGoodsName(greatGrandName1);
                    greatGrand.setNxCfgCommunityId(cgGoods.getNxCgCommunityId());
                    greatGrand.setNxCfgFatherGoodsLevel(0);
                    greatGrand.setNxCfgNxGoodsId(cgGoods.getNxCgNxGreatGrandId());
                    cfgService.save(greatGrand);
                    grand.setNxCfgFathersFatherId(greatGrand.getNxCommunityFatherGoodsId());
                    cfgService.update(grand);
                }
            }
        }


        return cgGoods;
    }
    @RequestMapping(value = "/comGetIbookGoods", method = RequestMethod.POST)
    @ResponseBody
    public R comGetIbookGoods(Integer limit, Integer page, Integer fatherId, Integer comId) {
        Map<String, Object> map1 = new HashMap<>();
        map1.put("offset", (page - 1) * limit);
        map1.put("limit", limit);
        map1.put("fatherId", fatherId);
        List<NxGoodsEntity> nxGoodsEntities1 = nxGoodsService.queryNxGoodsByParams(map1);

        List<NxGoodsEntity> goodsEntities = new ArrayList<>();

        for (NxGoodsEntity goods : nxGoodsEntities1) {
            Map<String, Object> map = new HashMap<>();
            map.put("comId", comId);
            map.put("goodsId", goods.getNxGoodsId());
            List<NxCommunityGoodsEntity> dgGoods = cgService.queryAddCommunityNxGoods(map);

            if (dgGoods.size() > 0) {
                goods.setIsDownload(1);
                goods.setNxCommunityGoodsEntity(dgGoods.get(0));
                goodsEntities.add(goods);
            } else {
                goods.setIsDownload(0);
                goodsEntities.add(goods);
            }
        }

        int total = nxGoodsService.queryTotalByFatherId(fatherId);
        PageUtils pageUtil = new PageUtils(goodsEntities, total, limit, page);
        return R.ok().put("page", pageUtil);
    }

     @RequestMapping(value = "/queryGoodsWithPinyin", method = RequestMethod.POST)
      @ResponseBody
      public R queryGoodsWithPinyin (@RequestBody NxCommunityGoodsEntity goodsEntity) {
         System.out.println("haiiahfiai");
         System.out.println(goodsEntity);
         System.out.println(goodsEntity.getNxCgGoodsPinyin());
         Integer nxCgCommunityId = goodsEntity.getNxCgCommunityId();
         Map<String, Object> map = new HashMap<>();
         map.put("nxCgCommunityId", nxCgCommunityId);
         map.put("pinyin", goodsEntity.getNxCgGoodsPinyin());
         List<NxCommunityGoodsEntity> entities = cgService.queryCommunityGoodsWithPinyin(map);
        return R.ok().put("data", entities);
      }








     @RequestMapping(value = "/getStockGoods", method = RequestMethod.POST)
      @ResponseBody
      public R getStockGoods (Integer limit, Integer page, Integer nxCommunityId) {
         Map<String, Object> map = new HashMap<>();
         map.put("offset", (page - 1) * limit);
         map.put("limit", limit);
         map.put("nxCommunityId", nxCommunityId);
         List<NxCommunityGoodsEntity> entities = cgService.queryStockGoods(map);

         int total = cgService.queryTotalByFatherId(map);

         PageUtils pageUtil = new PageUtils(entities, total, limit, page);
         return R.ok().put("page",pageUtil);
      }





     @RequestMapping(value = "/getSupplierGoods", method = RequestMethod.POST)
      @ResponseBody
      public R getSupplierGoods (Integer limit, Integer page, Integer nxSupplierId ) {
         System.out.println("daole zheli");
         Map<String, Object> map = new HashMap<>();
         map.put("offset", (page - 1) * limit);
         map.put("limit", limit);
         map.put("nxSupplierId", nxSupplierId);
         List<NxCommunityGoodsEntity> entities = cgService.querySupplierGoods(map);

         int total = cgService.queryTotalByFatherId(map);

         PageUtils pageUtil = new PageUtils(entities, total, limit, page);
        return R.ok().put("page", pageUtil);
      }






    @RequestMapping(value = "/getCommunityGoodsDetail/{communityGoodsId}")
    @ResponseBody
    public R cust(@PathVariable Integer communityGoodsId ) {
        System.out.println(communityGoodsId);
        NxCommunityGoodsEntity communityGoodsEntity = cgService.queryObject(communityGoodsId);
        return R.ok().put("data", communityGoodsEntity);

    }




     @RequestMapping(value = "/purchaseDisGoods", method = RequestMethod.POST)
      @ResponseBody
      public R purchaseDisGoods (Integer purchaseUserId, String disGoodsEntities ) {

         System.out.println("enenne" + disGoodsEntities);

         JSONArray jsonArray = JSONArray.fromObject(disGoodsEntities);
         for (Object obj : jsonArray) {
             JSONObject jsonObject2 = JSONObject.fromObject(obj);
             NxCommunityGoodsEntity distributerGoodsEntity = (NxCommunityGoodsEntity) JSONObject.toBean(jsonObject2, NxCommunityGoodsEntity.class);

             distributerGoodsEntity.setNxCgBuyStatus(2);
             distributerGoodsEntity.setNxCgBuyPurchaseUserId(purchaseUserId);
             cgService.update(distributerGoodsEntity);

             JSONArray jsonArray1 = JSONArray.fromObject(distributerGoodsEntity.getNxOrdersSubEntities());
             for (Object obj1 :
                     jsonArray1) {
                 JSONObject jsonObject = JSONObject.fromObject(obj1);
                 NxCommunityOrdersSubEntity subEntity = (NxCommunityOrdersSubEntity) JSONObject.toBean(jsonObject, NxCommunityOrdersSubEntity.class);
                 System.out.println("kkkkk" + subEntity);
                 subEntity.setNxCosBuyStatus(2);
                 subEntity.setNxCosPurchaseUserId(purchaseUserId);
                 nxCommunityOrdersSubService.update(subEntity);
             }
         }
         return R.ok();
      }









//
//    //todo
//     @RequestMapping(value = "/updateDgGoods", method = RequestMethod.POST)
//      @ResponseBody
//      public R updateDgGoods (@RequestBody NxCommunityGoodsEntity cgGoods) {
////         Integer dgDistributeId = dgGoods.getNxCgDistributeId();
////         dsService.deleteByDisId(dgDistributeId);
//
//
//         Integer nxCommunityGoodsId = cgGoods.getNxCommunityGoodsId();
//         NxCommunityGoodsEntity communityGoodsEntity = cgService.queryObject(nxCommunityGoodsId);
//
//
//
//         List<NxStandardEntity> dgStandardList = cgGoods.getDgStandardList();
//
//         for (NxStandardEntity standard : dgStandardList) {
//             NxCommunityStandardEntity entity = new NxCommunityStandardEntity();
//             entity.setNxCsCommGoodsId(cgGoods.getNxCommunityGoodsId());
//             dsService.save(entity);
//         }
//
//         cgService.update(cgGoods);
//
//         return R.ok();
//      }

       @RequestMapping(value = "/updateSupplierGoods", method = RequestMethod.POST)
        @ResponseBody
        public R updateSupplierGoods (@RequestParam("file") MultipartFile file,
                                   @RequestParam("nxCommunityGoodsId") Integer nxCommunityGoodsId,
                                   @RequestParam("nxCgBuyingPrice") String nxCgBuyingPrice,
                                   HttpSession session) {
           //1,上传图片
           String newUploadName = "uploadImage";
           String realPath = UploadFile.upload(session, newUploadName, file);

           String filename = file.getOriginalFilename();
           String filePath = newUploadName + "/" + filename;



           NxCommunityGoodsEntity communityGoodsEntity = cgService.queryObject(nxCommunityGoodsId);

           communityGoodsEntity.setNxCgBuyingPrice(nxCgBuyingPrice);
           communityGoodsEntity.setNxCgNxGoodsFilePath(filePath);

           cgService.update(communityGoodsEntity);

          return R.ok();
        }




    @RequestMapping(value = "/getCommunityGoods", method = RequestMethod.POST)
    @ResponseBody
    public R getCommunityGoods(Integer limit, Integer page, Integer nxCommunityFatherGoodsId) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("nxCommunityFatherGoodsId", nxCommunityFatherGoodsId);

        //查询列表数据
        List<NxCommunityGoodsEntity> dgGoodsLit = cgService.queryCommunityGoods(map);

        int total = cgService.queryTotalByFatherId(map);

        PageUtils pageUtil = new PageUtils(dgGoodsLit, total, limit, page);
        return R.ok().put("page", pageUtil);
    }


    /**
     * 添加批发商商品
     * @param cgGoods 批发商商品
     * @return ok
     */
    @RequestMapping(value = "/postCgGoods", method = RequestMethod.POST)
    @ResponseBody
    public R postCgGoods(@RequestBody NxCommunityGoodsEntity cgGoods) {

        //判断是否已经下载
        Integer nxDgNxGoodsId = cgGoods.getNxCgNxGoodsId();
        Integer communityId = cgGoods.getNxCgCommunityId();
        Map<String, Object> map7 = new HashMap<>();
        map7.put("comId", communityId);
        map7.put("goodsId", nxDgNxGoodsId);
        List<NxCommunityGoodsEntity> communityGoodsEntities = cgService.queryComGoodsByParams(map7);

        if (communityGoodsEntities.size() > 0) {
            return R.error(-1, "已经下载");
        } else {

            NxCommunityGoodsEntity nxDistributerGoodsEntity = saveCommunityGoods(cgGoods);

            //2，保存com规格bieming
            Integer nxCgGoodsId = cgGoods.getNxCommunityGoodsId();
            //2.1
            List<NxStandardEntity> ncsEntities = cgGoods.getDgStandardList();
            if (ncsEntities.size() > 0) {
                for (NxStandardEntity standard : ncsEntities) {
                    NxCommunityStandardEntity communityStandardEntity = new NxCommunityStandardEntity();
                    communityStandardEntity.setNxCsCommGoodsId(nxCgGoodsId);
                    communityStandardEntity.setNxCsStandardName(standard.getNxStandardName());
                    communityStandardEntity.setNxCsStandardError(standard.getNxStandardError());
                    communityStandardEntity.setNxCsStandardScale(standard.getNxStandardScale());
                    communityStandardEntity.setNxCsStandardFilePath(standard.getNxStandardFilePath());
                    communityStandardEntity.setNxCsStandardSort(standard.getNxStandardSort());
                    dsService.save(communityStandardEntity);
                }
            }

            //2.2
            List<NxAliasEntity> aliasEntities = cgGoods.getNxAliasEntities();
            if (aliasEntities.size() > 0) {
                for (NxAliasEntity aliasEntity : aliasEntities) {
                    NxCommunityAliasEntity disAlias = new NxCommunityAliasEntity();
                    disAlias.setNxCaComGoodsId(nxCgGoodsId);
                    disAlias.setNxCaAliasName(aliasEntity.getNxAliasName());
                    nxCommunityAliasService.save(disAlias);
                }
            }

            //3.3 修改father价格商品的个数
            updatePriceAmount(cgGoods);

            return R.ok().put("data", nxDistributerGoodsEntity);
        }
    }

    private void updatePriceAmount(NxCommunityGoodsEntity cgGoods){
        Integer nxCgCfgGoodsFatherId = cgGoods.getNxCgCfgGoodsFatherId();
        NxCommunityFatherGoodsEntity fatherGoodsEntity = cfgService.queryObject(nxCgCfgGoodsFatherId);

        String nxCgGoodsPrice = cgGoods.getNxCgGoodsPrice();
        String nxCgGoodsTwoPrice = cgGoods.getNxCgGoodsTwoPrice();
        String nxCgGoodsThreePrice = cgGoods.getNxCgGoodsThreePrice();
        if(!nxCgGoodsPrice.equals("null") && !nxCgGoodsPrice.equals("0")){
            fatherGoodsEntity.setNxCfgPriceAmount(fatherGoodsEntity.getNxCfgPriceAmount() + 1);
        }
        System.out.println(cgGoods.getNxCgGoodsTwoPrice() + "getTwoPricieiciieieiieeii");
        if(!nxCgGoodsTwoPrice.equals("null") && !nxCgGoodsTwoPrice.equals("0")){
            fatherGoodsEntity.setNxCfgPriceTwoAmount(fatherGoodsEntity.getNxCfgPriceTwoAmount() + 1);
        }
        if(!nxCgGoodsThreePrice.equals("null") && !nxCgGoodsThreePrice.equals("0")){
            fatherGoodsEntity.setNxCfgPriceThreeAmount(fatherGoodsEntity.getNxCfgPriceThreeAmount() + 1);
        }
        cfgService.update(fatherGoodsEntity);

    }



    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping("/info/{cgGoodsId}")
//    @RequiresPermissions("nxdistributergoods:info")
    public R info(@PathVariable("cgGoodsId") Integer cgGoodsId) {
        NxCommunityGoodsEntity communityGoodsEntity = cgService.queryObject(cgGoodsId);

        return R.ok().put("data", communityGoodsEntity);
    }



}
