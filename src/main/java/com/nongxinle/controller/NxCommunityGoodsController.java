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

import static com.nongxinle.utils.DateUtils.*;
import static com.nongxinle.utils.PinYin4jUtils.*;


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
    @Autowired
    private NxCommunityPurchaseBatchService ncBatchService;
    @Autowired
    private NxRestrauntComGoodsService nxRestrauntComGoodsService;

//

    @RequestMapping(value = "/comGetDistributerComGoods", method = RequestMethod.POST)
    @ResponseBody
    public R comGetDistributerComGoods(Integer comId, Integer disId) {
        Map<String, Object> map = new HashMap<>();
        map.put("comId", comId);
        map.put("disId", disId);
        List<NxCommunityGoodsEntity> communityGoodsEntities = cgService.comQueryDisComGoodsByParams(map);

        return R.ok().put("data", communityGoodsEntities);
    }

    @RequestMapping(value = "/resManQueryComResGoodsInFatherId", method = RequestMethod.POST)
    @ResponseBody
    public R resManQueryComResGoodsInFatherId(Integer resFatherId, String searchStr,
                                              Integer comId, Integer goodsFatherId, Integer serviceLevel) {

        Map<String, Object> map = new HashMap<>();

        map.put("resFatherId", resFatherId);
        map.put("goodsFatherId", goodsFatherId);
        map.put("comId", comId);
        map.put("serviceLevel", serviceLevel);
        for (int i = 0; i < searchStr.length(); i++) {
            String str = searchStr.substring(i, i + 1);
            if (str.matches("[\u4E00-\u9FFF]")) {
                String pinyin = hanziToPinyin(searchStr);
                map.put("searchStr", searchStr);
                map.put("searchStrPinyin", pinyin);
            } else {
                map.put("searchPinyin", searchStr);
            }
        }

        List<NxCommunityGoodsEntity> goodsEntities = cgService.resManQueryComResGoodsQuickSearchStr(map);

        return R.ok().put("data", goodsEntities);
    }

    @RequestMapping(value = "/resManQueryComResGoods", method = RequestMethod.POST)
    @ResponseBody
    public R resManQueryComResGoods(Integer resFatherId, String searchStr, Integer comId, Integer serviceLevel) {

        Map<String, Object> map = new HashMap<>();

        map.put("resFatherId", resFatherId);
        map.put("comId", comId);
        map.put("serviceLevel", serviceLevel);
        for (int i = 0; i < searchStr.length(); i++) {
            String str = searchStr.substring(i, i + 1);
            if (str.matches("[\u4E00-\u9FFF]")) {
                String pinyin = hanziToPinyin(searchStr);
                map.put("searchStr", searchStr);
                map.put("searchStrPinyin", pinyin);
            } else {
                map.put("searchPinyin", searchStr);
            }
        }

        List<NxCommunityGoodsEntity> goodsEntities = cgService.resManQueryComResGoodsQuickSearchStr(map);

        return R.ok().put("data", goodsEntities);
    }


    @RequestMapping(value = "/getCgGoodsSubNamesByFatherId", method = RequestMethod.POST)
    @ResponseBody
    public R getCgGoodsSubNamesByFatherId(Integer fatherId, Integer level) {

        Map<String, Object> map = new HashMap<>();
        map.put("fathersFatherId", fatherId);
        map.put("level", level);
        List<NxCommunityFatherGoodsEntity> goodsEntities1 = cfgService.queryComFathersGoodsByParams(map);

        List<NxCommunityFatherGoodsEntity> newList = new ArrayList<>();

        for (NxCommunityFatherGoodsEntity fatherGoods : goodsEntities1) {
            StringBuilder builder = new StringBuilder();
            Map<String, Object> map1 = new HashMap<>();
            Integer communityFatherGoodsId = fatherGoods.getNxCommunityFatherGoodsId();
            map1.put("fatherId", communityFatherGoodsId);
            map1.put("serviceLevel", level);
            List<NxCommunityGoodsEntity> goodsEntities = cgService.queryCgSubNameByFatherId(map1);

            for (NxCommunityGoodsEntity goods : goodsEntities) {
                String nxGoodsName = goods.getNxCgGoodsName();
                builder.append(nxGoodsName);
                builder.append(',');
            }
            fatherGoods.setCgGoodsSubNames(builder.toString());
            newList.add(fatherGoods);
        }
        return R.ok().put("data", newList);
    }

    @RequestMapping(value = "/disPurchaseComGoods", method = RequestMethod.POST)
    @ResponseBody
    public R disPurchaseComGoods(@RequestBody List<NxDistributerGoodsEntity> disGoodsEntities) {

        NxCommunityPurchaseBatchEntity batchEntity = new NxCommunityPurchaseBatchEntity();
        batchEntity.setNxCpbPurchaseType(3);
        batchEntity.setNxCpbDate(formatWhatDate(0));
        batchEntity.setNxCpbCommunityId(disGoodsEntities.get(0).getNxCommunityGoodsEntity().getNxCgCommunityId());
        batchEntity.setNxCpbDistributerId(disGoodsEntities.get(0).getNxDgDistributerId());
        batchEntity.setNxCpbHour(formatWhatHour(0));
        batchEntity.setNxCpbMinute(formatWhatMinute(0));
        batchEntity.setNxCpbTime(formatWhatTime(0));
        batchEntity.setNxCpbStatus(0);
        batchEntity.setNxCpbComSellType(3);
        ncBatchService.save(batchEntity);

        for (NxDistributerGoodsEntity disGoods : disGoodsEntities) {
            NxCommunityPurchaseGoodsEntity purchaseGoodsEntity = new NxCommunityPurchaseGoodsEntity();
            purchaseGoodsEntity.setNxCpgBatchId(batchEntity.getNxCommunityPurchaseBatchId());
            purchaseGoodsEntity.setNxCpgCommunityId(disGoods.getNxCommunityGoodsEntity().getNxCgCommunityId());
            purchaseGoodsEntity.setNxCpgPurchaseType(3);
            purchaseGoodsEntity.setNxCpgComGoodsId(disGoods.getNxCommunityGoodsEntity().getNxCommunityGoodsId());
            purchaseGoodsEntity.setNxCpgComGoodsFatherId(disGoods.getNxCommunityGoodsEntity().getNxCgCfgGoodsFatherId());
            purchaseGoodsEntity.setNxCpgApplyDate(formatWhatDay(0));
            purchaseGoodsEntity.setNxCpgOrdersAmount(disGoods.getNxRestrauntOrdersEntities().size());
            purchaseGoodsEntity.setNxCpgStatus(0);
            nxCommunityPurchaseGoodsService.save(purchaseGoodsEntity);

            for (NxRestrauntOrdersEntity orders : disGoods.getNxRestrauntOrdersEntities()) {
                if (!orders.getNxRoWeight().equals("-1")) {
                    orders.setNxRoPurchaseGoodsId(purchaseGoodsEntity.getNxCommunityPurchaseGoodsId());
                    orders.setNxRoBuyStatus(1);
                    nxRestrauntOrdersService.update(orders);
                }
            }
        }
        return R.ok();
    }

    @RequestMapping(value = "/printSellOneComPurchaseGoods", method = RequestMethod.POST)
    @ResponseBody
    public R printSellOneComPurchaseGoods(@RequestBody List<NxCommunityGoodsEntity> communityGoodsEntities) {
        purchaseComGoodsByBuyType(communityGoodsEntities, 1, 1);
        return R.ok();
    }
    @RequestMapping(value = "/printSellTwoComPurchaseGoods", method = RequestMethod.POST)
    @ResponseBody
    public R printSellTwoComPurchaseGoods(@RequestBody List<NxCommunityGoodsEntity> communityGoodsEntities) {
        purchaseComGoodsByBuyType(communityGoodsEntities, 1, 2);
        return R.ok();
    }
    @RequestMapping(value = "/printSellThreeComPurchaseGoods", method = RequestMethod.POST)
    @ResponseBody
    public R printSellThreeComPurchaseGoods(@RequestBody List<NxCommunityGoodsEntity> communityGoodsEntities) {
        purchaseComGoodsByBuyType(communityGoodsEntities, 1, 3);
        return R.ok();
    }

    @RequestMapping(value = "/copySellOneComPurchaseGoods", method = RequestMethod.POST)
    @ResponseBody
    public R copySellOneComPurchaseGoods(@RequestBody List<NxCommunityGoodsEntity> communityGoodsEntities) {
        purchaseComGoodsByBuyType(communityGoodsEntities, 2, 1);

        return R.ok();
    }
    @RequestMapping(value = "/copySellTwoComPurchaseGoods", method = RequestMethod.POST)
    @ResponseBody
    public R copySellTwoComPurchaseGoods(@RequestBody List<NxCommunityGoodsEntity> communityGoodsEntities) {
        purchaseComGoodsByBuyType(communityGoodsEntities, 2, 2);

        return R.ok();
    }

    @RequestMapping(value = "/copySellThreeComPurchaseGoods", method = RequestMethod.POST)
    @ResponseBody
    public R copySellThreeComPurchaseGoods(@RequestBody List<NxCommunityGoodsEntity> communityGoodsEntities) {
        purchaseComGoodsByBuyType(communityGoodsEntities, 2, 3);

        return R.ok();
    }


    private void purchaseComGoodsByBuyType(List<NxCommunityGoodsEntity> communityGoodsEntities, Integer type, Integer sellType) {
        NxCommunityPurchaseBatchEntity batchEntity = new NxCommunityPurchaseBatchEntity();
        batchEntity.setNxCpbPurchaseType(type);
        batchEntity.setNxCpbDate(formatWhatDate(0));
        batchEntity.setNxCpbCommunityId(communityGoodsEntities.get(0).getNxCgCommunityId());
        batchEntity.setNxCpbHour(formatWhatHour(0));
        batchEntity.setNxCpbMinute(formatWhatMinute(0));
        batchEntity.setNxCpbTime(formatWhatTime(0));
        batchEntity.setNxCpbStatus(0);
        batchEntity.setNxCpbComSellType(sellType);
        ncBatchService.save(batchEntity);

        for (NxCommunityGoodsEntity comGoods : communityGoodsEntities) {
            NxCommunityPurchaseGoodsEntity purchaseGoodsEntity = new NxCommunityPurchaseGoodsEntity();
            System.out.println(batchEntity.getNxCommunityPurchaseBatchId() + "ididididi???");
            purchaseGoodsEntity.setNxCpgBatchId(batchEntity.getNxCommunityPurchaseBatchId());
            purchaseGoodsEntity.setNxCpgQuantity(comGoods.getNxCgPurchaseQuantity());
            purchaseGoodsEntity.setNxCpgStandard(comGoods.getNxCgGoodsStandardname());
            purchaseGoodsEntity.setNxCpgCommunityId(comGoods.getNxCgCommunityId());
            purchaseGoodsEntity.setNxCpgPurchaseType(1);
            purchaseGoodsEntity.setNxCpgComGoodsId(comGoods.getNxCommunityGoodsId());
            purchaseGoodsEntity.setNxCpgComGoodsFatherId(comGoods.getNxCgCfgGoodsFatherId());
            purchaseGoodsEntity.setNxCpgApplyDate(formatWhatDay(0));
            purchaseGoodsEntity.setNxCpgOrdersAmount(comGoods.getNxRestrauntOrdersEntities().size());
            purchaseGoodsEntity.setNxCpgStatus(0);
            purchaseGoodsEntity.setNxCpgBuyUserId(comGoods.getNxCgBuyPurchaseUserId());
            nxCommunityPurchaseGoodsService.save(purchaseGoodsEntity);
            for (NxRestrauntOrdersEntity orders : comGoods.getNxRestrauntOrdersEntities()) {
                orders.setNxRoPurchaseGoodsId(purchaseGoodsEntity.getNxCommunityPurchaseGoodsId());
                orders.setNxRoPurchaseUserId(purchaseGoodsEntity.getNxCpgBuyUserId());
                orders.setNxRoBuyStatus(1);
                nxRestrauntOrdersService.update(orders);
            }
        }

    }

//
//    @RequestMapping(value = "/orderComGoodsForResOrders", method = RequestMethod.POST)
//    @ResponseBody
//    public R orderComGoodsForResOrders (@RequestBody  List<NxCommunityGoodsEntity> comGoods) {
//        for (NxCommunityGoodsEntity goods : comGoods) {
//            String nxCgPurchaseQuantity = goods.getNxCgPurchaseQuantity();
//            List<NxRestrauntOrdersEntity> nxRestrauntOrdersEntities = goods.getNxRestrauntOrdersEntities();
//            for (NxRestrauntOrdersEntity orders : nxRestrauntOrdersEntities) {
//                orders.setNxRoBuyStatus(1);
//                nxRestrauntOrdersService.update(orders);
//            }
//        }
//
//
//        return R.ok();
//    }


    /**
     * @param searchStr 搜索字符串
     * @param comId     批发商id
     * @return 搜索结果
     */
    @RequestMapping(value = "/queryComGoodsByQuickSearch", method = RequestMethod.POST)
    @ResponseBody
    public R queryComGoodsByQuickSearch(String searchStr, String comId) {

        System.out.println(searchStr);
        Map<String, Object> map = new HashMap<>();
        map.put("comId", comId);

        for (int i = 0; i < searchStr.length(); i++) {
            String str = searchStr.substring(i, i + 1);
            if (str.matches("[\u4E00-\u9FFF]")) {
                String pinyin = hanziToPinyin(searchStr);
                map.put("searchStr", searchStr);
                map.put("searchStrPinyin", pinyin);
            } else {
                map.put("searchPinyin", searchStr);
            }
        }

        List<NxCommunityGoodsEntity> goodsEntities = cgService.queryComGoodsQuickSearchStr(map);
        if (goodsEntities.size() > 0) {
            return R.ok().put("data", goodsEntities);
        }
        return R.error(-1, "没有商品");
    }


    /**
     * @param searchStr 搜索字符串
     * @param comId     批发商id
     * @return 搜索结果
     */
    @RequestMapping(value = "/resQueryComGoodsByQuickSearch", method = RequestMethod.POST)
    @ResponseBody
    public R resQueryComGoodsByQuickSearch(String searchStr, String comId, Integer level, Integer resId) {

        System.out.println(searchStr);
        Map<String, Object> map = new HashMap<>();
        Map<String, Object> map1 = new HashMap<>();

        map.put("comId", comId);
        map.put("level", level);
        map.put("resFatherId", resId);
        map1.put("resFatherId", resId);

        for (int i = 0; i < searchStr.length(); i++) {
            String str = searchStr.substring(i, i + 1);
            if (str.matches("[\u4E00-\u9FFF]")) {
                String pinyin = hanziToPinyin(searchStr);
                map.put("searchStr", searchStr);
                map.put("searchStrPinyin", pinyin);
                map1.put("searchStr", searchStr);
                map1.put("searchStrPinyin", pinyin);
            } else {
                map.put("searchPinyin", searchStr);
                map1.put("searchPinyin", searchStr);
            }
        }

        List<NxCommunityGoodsEntity> goodsEntities = cgService.resQueryComGoodsQuickSearchStr(map);
        List<NxRestrauntComGoodsEntity> resEntities = nxRestrauntComGoodsService.queryHistoryGoodsQuickSearchStr(map1);
        Map<String, Object> map3 = new HashMap<>();
        if (goodsEntities.size() > 0) {
            map3.put("com", goodsEntities);
        } else {
            map3.put("com", new ArrayList<>());
        }

        if (resEntities.size() > 0) {
            map3.put("res", resEntities);
        } else {
            map3.put("res", new ArrayList<>());
        }
        return R.ok().put("data", map3);
    }


    @RequestMapping(value = "/disUpdateComGoodsBuyingPrice", method = RequestMethod.POST)
    @ResponseBody
    public R disUpdateComGoodsBuyingPrice(@RequestBody NxDistributerGoodsEntity disGoods) {
        //update comGoods --cgBuyingPrice
        NxCommunityGoodsEntity nxCommunityGoodsEntity = disGoods.getNxCommunityGoodsEntity();
        cgService.update(nxCommunityGoodsEntity);
        //update resOrders
        List<NxRestrauntOrdersEntity> nxRestrauntOrdersEntities = disGoods.getNxRestrauntOrdersEntities();
        for (NxRestrauntOrdersEntity orders : nxRestrauntOrdersEntities) {
            orders.setNxRoCostPrice(nxCommunityGoodsEntity.getNxCgBuyingPrice());
            nxRestrauntOrdersService.update(orders);
        }

        return R.ok();
    }

    @RequestMapping(value = "/comUpdateCommunityGoods", method = RequestMethod.POST)
    @ResponseBody
    public R comUpdateCommunityGoods(@RequestBody NxCommunityGoodsEntity comGoods) {


        //old
        Integer nxCommunityGoodsId = comGoods.getNxCommunityGoodsId();
        NxCommunityGoodsEntity communityGoodsEntity = cgService.queryObject(nxCommunityGoodsId);
        Integer nxCgCfgGoodsFatherId = communityGoodsEntity.getNxCgCfgGoodsFatherId();
        NxCommunityFatherGoodsEntity fatherGoodsEntity = cfgService.queryObject(nxCgCfgGoodsFatherId);
        String nxCgGoodsPriceOld = communityGoodsEntity.getNxCgGoodsPrice();
        String nxCgGoodsTwoPriceOld = communityGoodsEntity.getNxCgGoodsTwoPrice();
        String nxCgGoodsThreePriceOLd = communityGoodsEntity.getNxCgGoodsThreePrice();

        //new
        String nxCgGoodsPrice = comGoods.getNxCgGoodsPrice();
        String nxCgGoodsTwoPrice = comGoods.getNxCgGoodsTwoPrice();
        String nxCgGoodsThreePrice = comGoods.getNxCgGoodsThreePrice();
        //
        if (nxCgGoodsPriceOld.equals("0") && !nxCgGoodsPrice.equals("0")) {
            fatherGoodsEntity.setNxCfgPriceAmount(fatherGoodsEntity.getNxCfgPriceAmount() + 1);
        }
        if (!nxCgGoodsPriceOld.equals("0") && nxCgGoodsPrice.equals("0")) {
            fatherGoodsEntity.setNxCfgPriceAmount(fatherGoodsEntity.getNxCfgPriceAmount() - 1);
        }
        //2
        if (nxCgGoodsTwoPriceOld.equals("0") && !nxCgGoodsTwoPrice.equals("0")) {
            fatherGoodsEntity.setNxCfgPriceTwoAmount(fatherGoodsEntity.getNxCfgPriceTwoAmount() + 1);
        }
        if (!nxCgGoodsTwoPriceOld.equals("0") && nxCgGoodsTwoPrice.equals("0")) {
            fatherGoodsEntity.setNxCfgPriceTwoAmount(fatherGoodsEntity.getNxCfgPriceTwoAmount() - 1);
        }
        //3
        if (nxCgGoodsThreePriceOLd.equals("0") && !nxCgGoodsThreePrice.equals("0")) {
            fatherGoodsEntity.setNxCfgPriceThreeAmount(fatherGoodsEntity.getNxCfgPriceThreeAmount() + 1);
        }
        if (!nxCgGoodsThreePriceOLd.equals("0") && nxCgGoodsThreePrice.equals("0")) {
            fatherGoodsEntity.setNxCfgPriceThreeAmount(fatherGoodsEntity.getNxCfgPriceThreeAmount() - 1);
        }

        cfgService.update(fatherGoodsEntity);
        //gengxin
        cgService.update(comGoods);

        //修改供货商
        if(comGoods.getNxCgSellType() == 3){
            Map<String, Object> map = new HashMap<>();
            map.put("comId", comGoods.getNxCgCommunityId());
            map.put("comGoodsId", comGoods.getNxCommunityGoodsId());
            map.put("status", 1);
            List<NxRestrauntOrdersEntity> ordersEntities = nxRestrauntOrdersService.queryResOrdersByParams(map);
            for (NxRestrauntOrdersEntity orders : ordersEntities) {
                orders.setNxRoComDistributerGoodsId(comGoods.getNxCgDistributerGoodsId());
                orders.setNxRoComDistributerId(comGoods.getNxCgDistributerId());
                orders.setNxRoCostPrice(comGoods.getNxCgBuyingPrice());
                nxRestrauntOrdersService.update(orders);
            }
        }

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
     *
     * @param fatherId 父类id
     * @return 批发商商品列表
     */
    @RequestMapping(value = "/resGetComGoodsListByLevel", method = RequestMethod.POST)
    @ResponseBody
    public R resGetComGoodsListByLevel(Integer fatherId, Integer serviceLevel,
                                       Integer limit, Integer page, Integer resId) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("cgFatherId", fatherId);
        map.put("serviceLevel", serviceLevel);
        map.put("resFatherId", resId);
        List<NxCommunityGoodsEntity> goodsEntities1 = cgService.queryComGoodsByParams(map);

        Map<String, Object> map3 = new HashMap<>();
        map3.put("fatherId", fatherId);
        map3.put("serviceLevel", serviceLevel);

        int total = cgService.queryTotalByFatherId(map3);
        PageUtils pageUtil = new PageUtils(goodsEntities1, total, limit, page);
        return R.ok().put("page", pageUtil);
    }

    /**
     * 批发商商品列表
     *
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
        List<NxCommunityGoodsEntity>  goodsEntities1 ;
        if(type.equals(3)){
            goodsEntities1 = cgService.queryComGoodsWithSupplierByParams(map);

        }else {
            goodsEntities1 = cgService.queryComGoodsByParams(map);
        }


        Map<String, Object> map3 = new HashMap<>();
        map3.put("fatherId", fatherId);
        map3.put("type", type);
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
        String nxCgGoodsStandardname = nxCommunityGoodsEntity.getNxCgGoodsStandardname();

        Map<String, Object> map = new HashMap<>();
        map.put("goodsName", goodsName);
        map.put("goodsDetail", nxGoodsDetail);
        map.put("goodsBrand", nxGoodsBrand);
        map.put("goodsStandard", nxCgGoodsStandardname);
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

//            NxCommunityGoodsEntity communityGoodsEntity = saveCommunityGoods(nxCommunityGoodsEntity);
            NxCommunityGoodsEntity communityGoodsEntity = saveCommunityGoods(nxCommunityGoodsEntity);

            updatePriceAmount(nxCommunityGoodsEntity);
            return R.ok().put("data", communityGoodsEntity.getNxCommunityGoodsId());

        }


    }

    private NxCommunityGoodsEntity saveCommunityGoods(NxCommunityGoodsEntity cgGoods) {

        cgGoods.setNxCgDistributerId(-1);
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
                grand.setNxCfgFatherGoodsColor(cgGoods.getNxCgNxGoodsFatherColor());
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
                    greatGrand.setNxCfgFatherGoodsColor(cgGoods.getNxCgNxGoodsFatherColor());
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
    public R queryGoodsWithPinyin(@RequestBody NxCommunityGoodsEntity goodsEntity) {
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
    public R getStockGoods(Integer limit, Integer page, Integer nxCommunityId) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("nxCommunityId", nxCommunityId);
        List<NxCommunityGoodsEntity> entities = cgService.queryStockGoods(map);

        int total = cgService.queryTotalByFatherId(map);

        PageUtils pageUtil = new PageUtils(entities, total, limit, page);
        return R.ok().put("page", pageUtil);
    }


    @RequestMapping(value = "/getDistributerGoods", method = RequestMethod.POST)
    @ResponseBody
    public R getDistributerGoods(Integer limit, Integer page, Integer nxDistributerId) {
        System.out.println("daole zheli");
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("nxDistributerId", nxDistributerId);
        List<NxCommunityGoodsEntity> entities = cgService.queryDistributerGoods(map);

        int total = cgService.queryTotalByFatherId(map);
        PageUtils pageUtil = new PageUtils(entities, total, limit, page);
        return R.ok().put("page", pageUtil);
    }


    @RequestMapping(value = "/getCommunityGoodsDetail/{communityGoodsId}")
    @ResponseBody
    public R cust(@PathVariable Integer communityGoodsId) {
        NxCommunityGoodsEntity communityGoodsEntity = cgService.queryObject(communityGoodsId);
        return R.ok().put("data", communityGoodsEntity);
    }


    @RequestMapping(value = "/purchaseDisGoods", method = RequestMethod.POST)
    @ResponseBody
    public R purchaseDisGoods(Integer purchaseUserId, String disGoodsEntities) {

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

    @RequestMapping(value = "/updateDistributerGoods", method = RequestMethod.POST)
    @ResponseBody
    public R updateDistributerGoods(@RequestParam("file") MultipartFile file,
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

    @RequestMapping(value = "/comDeleteGoods/{comGoodsId}")
    @ResponseBody
    public R comDeleteGoods(@PathVariable Integer comGoodsId) {
        // standard
        List<NxCommunityStandardEntity> comGoodsStandards = dsService.queryComGoodsStandards(comGoodsId);
        if (comGoodsStandards.size() > 0) {
            for (NxCommunityStandardEntity stand : comGoodsStandards) {
                dsService.delete(stand.getNxCommunityStandardId());
            }
        }

        // alais
        List<NxCommunityAliasEntity> communityAliasEntities = nxCommunityAliasService.queryComAliasByComGoodsId(comGoodsId);
        if (communityAliasEntities.size() > 0) {
            for (NxCommunityAliasEntity aliasEntity : communityAliasEntities) {
                nxCommunityAliasService.delete(aliasEntity.getNxCommunityAliasId());
            }
        }

        //update fatherCommGoods
        NxCommunityGoodsEntity communityGoodsEntity = cgService.queryObject(comGoodsId);
        Integer nxCgCfgGoodsFatherId = communityGoodsEntity.getNxCgCfgGoodsFatherId();
        NxCommunityFatherGoodsEntity fatherGoodsEntity = cfgService.queryObject(nxCgCfgGoodsFatherId);
        String nxCgGoodsPrice = communityGoodsEntity.getNxCgGoodsPrice();
        String nxCgGoodsTwoPrice = communityGoodsEntity.getNxCgGoodsTwoPrice();
        String nxCgGoodsThreePrice = communityGoodsEntity.getNxCgGoodsThreePrice();
        if (!nxCgGoodsPrice.equals("0")) {
            fatherGoodsEntity.setNxCfgPriceAmount(fatherGoodsEntity.getNxCfgPriceAmount() - 1);
            cfgService.update(fatherGoodsEntity);
        }
        if (!nxCgGoodsTwoPrice.equals("0")) {
            fatherGoodsEntity.setNxCfgPriceTwoAmount(fatherGoodsEntity.getNxCfgPriceTwoAmount() - 1);
            cfgService.update(fatherGoodsEntity);
        }
        if (!nxCgGoodsThreePrice.equals("0")) {
            fatherGoodsEntity.setNxCfgPriceThreeAmount(fatherGoodsEntity.getNxCfgPriceThreeAmount() - 1);
            cfgService.update(fatherGoodsEntity);
        }

        //delete
        cgService.delete(comGoodsId);

        return R.ok();
    }

    /**
     * 添加批发商商品
     *
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

    private void updatePriceAmount(NxCommunityGoodsEntity cgGoods) {
        Integer nxCgCfgGoodsFatherId = cgGoods.getNxCgCfgGoodsFatherId();
        NxCommunityFatherGoodsEntity fatherGoodsEntity = cfgService.queryObject(nxCgCfgGoodsFatherId);

        String nxCgGoodsPrice = cgGoods.getNxCgGoodsPrice();
        String nxCgGoodsTwoPrice = cgGoods.getNxCgGoodsTwoPrice();
        String nxCgGoodsThreePrice = cgGoods.getNxCgGoodsThreePrice();
        if (!nxCgGoodsPrice.equals("null") && !nxCgGoodsPrice.equals("0")) {
            fatherGoodsEntity.setNxCfgPriceAmount(fatherGoodsEntity.getNxCfgPriceAmount() + 1);
        }
        System.out.println(cgGoods.getNxCgGoodsTwoPrice() + "getTwoPricieiciieieiieeii");
        if (!nxCgGoodsTwoPrice.equals("null") && !nxCgGoodsTwoPrice.equals("0")) {
            fatherGoodsEntity.setNxCfgPriceTwoAmount(fatherGoodsEntity.getNxCfgPriceTwoAmount() + 1);
        }
        if (!nxCgGoodsThreePrice.equals("null") && !nxCgGoodsThreePrice.equals("0")) {
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
