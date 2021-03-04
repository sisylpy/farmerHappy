package com.nongxinle.controller;

/**
 * @author lpy
 * @date 12-01 08:51
 */

import java.util.*;

import com.nongxinle.entity.*;
import com.nongxinle.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;

import static com.nongxinle.utils.PinYin4jUtils.hanziToPinyin;


@RestController
@RequestMapping("api/nxrestrauntcomgoods")
public class NxRestrauntComGoodsController {
    @Autowired
    private NxRestrauntComGoodsService resComGoodsService;
    @Autowired
    private NxRestrauntService nxRestrauntService;
    @Autowired
    private NxRestrauntOrdersService nxRestrauntOrdersService;
    @Autowired
    private NxCommunityGoodsService cgService;


    @RequestMapping(value = "/orderUserQueryResComGoodsByQuickSearch", method = RequestMethod.POST)
    @ResponseBody
    public R orderUserQueryResComGoodsByQuickSearch(Integer resId, Integer userId, String searchStr) {
        System.out.println(searchStr);
        System.out.println(searchStr);
        Map<String, Object> map = new HashMap<>();
        Map<String, Object> map1 = new HashMap<>();

        map.put("userId", userId);
        map1.put("userId", userId);
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

        List<NxRestrauntComGoodsEntity> goodsEntities = resComGoodsService.orderUserQueryResComGoodsQuickSearchStr(map);
        List<NxRestrauntComGoodsEntity> userEntities = resComGoodsService.ordreUserQueryHistoryGoodsQuickSearchStr(map1);
        Map<String, Object> map3 = new HashMap<>();
        if (goodsEntities.size() > 0) {
            map3.put("resGoods", goodsEntities);
        } else {
            map3.put("resGoods", new ArrayList<>());
        }

        if (userEntities.size() > 0) {
            map3.put("userGoods", userEntities);
        } else {
            map3.put("userGoods", new ArrayList<>());
        }
        return R.ok().put("data", map3);
    }


    @RequestMapping(value = "/getOrderUserGoods/{userId}")
    @ResponseBody
    public R getOrderUserGoods(@PathVariable Integer userId) {

        Map<String, Object> map = new HashMap<>();
        map.put("userId", userId);
        List<NxCommunityFatherGoodsEntity> fatherGoodsEntities = resComGoodsService.queryOrderUserGoods(map);
        return R.ok().put("data", fatherGoodsEntities);
    }

    @RequestMapping(value = "/orderGetResGoods", method = RequestMethod.POST)
    @ResponseBody
    public R orderGetResGoods(Integer resId, Integer userId) {

        Map<String, Object> map = new HashMap<>();
        map.put("resFatherId", resId);
        map.put("userId", userId);
        List<NxCommunityFatherGoodsEntity> fatherGoodsEntities = resComGoodsService.queryOrderResGoods(map);

        return R.ok().put("data", fatherGoodsEntities);

    }


    @RequestMapping(value = "/chainManEditComGoods", method = RequestMethod.POST)
    @ResponseBody
    public R chainManEditComGoods(@RequestBody NxCommunityGoodsEntity comGoods) {

        List<NxRestrauntEntity> nxRestrauntEntities = comGoods.getNxRestrauntEntities();
        for (NxRestrauntEntity res : nxRestrauntEntities) {
            System.out.println(res.getIsSelected() + "......///////??????????");
            if (res.getIsSelected()) {
                Integer nxRestrauntFatherId = res.getNxRestrauntId();
                Integer nxCommunityGoodsId = comGoods.getNxCommunityGoodsId();
                Map<String, Object> map = new HashMap<>();
                map.put("resFatherId", nxRestrauntFatherId);
                map.put("comGoodsId", nxCommunityGoodsId);
                List<NxRestrauntComGoodsEntity> nxRestrauntComGoodsEntities = resComGoodsService.queryResComGoodsByParams(map);
                System.out.println("isisisisissellelelelelel---------");
                System.out.println(nxRestrauntComGoodsEntities);
                if (nxRestrauntComGoodsEntities.size() == 0) {
                    NxRestrauntComGoodsEntity resComGoods = new NxRestrauntComGoodsEntity();
                    resComGoods.setNxRcgRestrauntFatherId(res.getNxRestrauntId());
                    resComGoods.setNxRcgComGoodsId(nxCommunityGoodsId);
                    resComGoods.setNxRcgComGoodsFatherId(comGoods.getNxCgCfgGoodsFatherId());
                    resComGoods.setNxRcgComGoodsName(comGoods.getNxCgGoodsName());
                    resComGoods.setNxRcgComGoodsPinyin(comGoods.getNxCgGoodsPinyin());
                    resComGoods.setNxRcgComGoodsPy(comGoods.getNxCgGoodsPy());
                    resComGoods.setNxRcgComGoodsStandardname(comGoods.getNxCgGoodsStandardname());
                    resComGoods.setNxRcgComGoodsDetail(comGoods.getNxCgGoodsDetail());
                    resComGoods.setNxRcgComGoodsBrand(comGoods.getNxCgGoodsBrand());
                    resComGoods.setNxRcgComGoodsPlace(comGoods.getNxCgGoodsPlace());
                    resComGoodsService.save(resComGoods);
                }
            }else{
                Integer nxRestrauntFatherId = res.getNxRestrauntId();
                Integer nxCommunityGoodsId = comGoods.getNxCommunityGoodsId();
                Map<String, Object> map = new HashMap<>();
                map.put("resFatherId", nxRestrauntFatherId);
                map.put("comGoodsId", nxCommunityGoodsId);
                List<NxRestrauntComGoodsEntity> nxRestrauntComGoodsEntities = resComGoodsService.queryResComGoodsByParams(map);
                System.out.println("isNOtselelelelnototntototo");
                System.out.println(nxRestrauntComGoodsEntities);
                if(nxRestrauntComGoodsEntities.size() > 0){
                    for (NxRestrauntComGoodsEntity com:nxRestrauntComGoodsEntities) {
                        resComGoodsService.delete(com.getNxRestrauntComGoodsId());
                    }
                }
            }

        }


        return R.ok();
    }

    @RequestMapping(value = "/chainManAddComGoods", method = RequestMethod.POST)
    @ResponseBody
    public R chainManAddComGoods(@RequestBody List<NxRestrauntComGoodsEntity> comGoodsEntities) {
        for (NxRestrauntComGoodsEntity comGoods : comGoodsEntities) {
            resComGoodsService.save(comGoods);
        }
        return R.ok();
    }

    @RequestMapping(value = "/resManAddComGoods", method = RequestMethod.POST)
    @ResponseBody
    public R resManAddComGoods(@RequestBody NxRestrauntComGoodsEntity resComGoods) {
        resComGoodsService.save(resComGoods);
        return R.ok().put("data", resComGoods);
    }

    @RequestMapping(value = "/cancleResComGoods/{resComGoodsId}")
    @ResponseBody
    public R cancleResComGoods(@PathVariable Integer resComGoodsId) {

        //是否有订单
        NxRestrauntComGoodsEntity nxRestrauntComGoodsEntity = resComGoodsService.queryObject(resComGoodsId);
        Integer nxRcgRestrauntFatherId = nxRestrauntComGoodsEntity.getNxRcgRestrauntFatherId();
        Integer nxRcgComGoodsId = nxRestrauntComGoodsEntity.getNxRcgComGoodsId();
        Map<String, Object> map = new HashMap<>();
        map.put("resFatherId", nxRcgRestrauntFatherId);
        map.put("comGoodsId", nxRcgComGoodsId);
        map.put("status", 4);
        List<NxRestrauntOrdersEntity> ordersEntities = nxRestrauntOrdersService.queryResOrdersByParams(map);
        if (ordersEntities.size() == 0) {
            //删除店铺商品
            //删除部门个人商品
            Map<String, Object> map1 = new HashMap<>();
            map1.put("comGoodsId", nxRcgComGoodsId);
            map1.put("resFatherId", nxRcgRestrauntFatherId);
            resComGoodsService.deleteResComGoods(map1);

            return R.ok();

        } else {
            return R.error(-1, "此商品下有订单");
        }
    }


    @RequestMapping(value = "/chainManGetComGoods", method = RequestMethod.POST)
    @ResponseBody
    public R chainManGetComGoods(Integer limit, Integer page, String ids, Integer fatherId,
                                 Integer serviceLevel) {
        String[] arr = ids.split(",");
        System.out.println(Arrays.toString(arr));
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("cgFatherId", fatherId);
        map.put("serviceLevel", serviceLevel);
        map.put("ids", arr);
        List<NxCommunityGoodsEntity> goodsEntities1 = cgService.queryChainComResGoodsByParams(map);

        Map<String, Object> map3 = new HashMap<>();
        map3.put("fatherId", fatherId);
        map3.put("serviceLevel", serviceLevel);

        int total = cgService.queryTotalByFatherId(map3);
        PageUtils pageUtil = new PageUtils(goodsEntities1, total, limit, page);
        return R.ok().put("page", pageUtil);
    }


    @RequestMapping(value = "/resManGetComGoods", method = RequestMethod.POST)
    @ResponseBody
    public R resManGetComGoods(Integer limit, Integer page, Integer resId, Integer fatherId,
                               Integer serviceLevel) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("cgFatherId", fatherId);
        map.put("serviceLevel", serviceLevel);
        map.put("resFatherId", resId);
        List<NxCommunityGoodsEntity> goodsEntities1 = cgService.queryComResGoodsByParams(map);

        Map<String, Object> map3 = new HashMap<>();
        map3.put("fatherId", fatherId);
        map3.put("serviceLevel", serviceLevel);
        map3.put("resFatherId", resId);

        int total = cgService.queryTotalByFatherId(map3);
        PageUtils pageUtil = new PageUtils(goodsEntities1, total, limit, page);
        return R.ok().put("page", pageUtil);
    }


    @RequestMapping(value = "/resGetHistoryGoods/{resId}")
    @ResponseBody
    public R resGetHistoryGoods(@PathVariable Integer resId) {

        NxRestrauntEntity nxRestrauntEntity = nxRestrauntService.queryObject(resId);
        Integer serviceLevel = nxRestrauntEntity.getNxRestrauntServiceLevel();


        Map<String, Object> map = new HashMap<>();
        map.put("resId", resId);
        map.put("level", serviceLevel);
        List<NxCommunityFatherGoodsEntity> fatherGoodsEntities = resComGoodsService.queryHistoryGoods(map);

        return R.ok().put("data", fatherGoodsEntities);

    }


    @RequestMapping(value = "/resGetResGoods", method = RequestMethod.POST)
    @ResponseBody
    public R resGetResGoods(Integer limit, Integer page, Integer resId, Integer fatherId) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("resId", resId);
        map.put("fatherId", fatherId);
        List<NxRestrauntComGoodsEntity> goodsEntities = resComGoodsService.queryResGoodsByFatherId(map);

//		for (NxRestrauntComGoodsEntity resComGoods : goodsEntities) {
//			Integer comGoodsId = resComGoods.getNxRestrauntComGoodsId();
//			List<NxCommunityStandardEntity> standardEntities = nxCommunityStandardService.queryComGoodsStandards(comGoodsId);
//			resComGoods.setNxCommunityStandardEntities(standardEntities);
//		}

        Map<String, Object> map3 = new HashMap<>();
        map3.put("resFatherId", resId);
        map3.put("fatherId", fatherId);
        int total = resComGoodsService.queryComGoodsTotal(map3);
        PageUtils pageUtil = new PageUtils(goodsEntities, total, limit, page);
        return R.ok().put("page", pageUtil);
    }


    @RequestMapping(value = "/resGetResComGoodsCata/{resId}")
    @ResponseBody
    public R resGetResComGoodsCata(@PathVariable Integer resId) {

        NxRestrauntEntity nxRestrauntEntity = nxRestrauntService.queryObject(resId);
        Integer nxRestrauntServiceLevel = nxRestrauntEntity.getNxRestrauntServiceLevel();
        Map<String, Object> map = new HashMap<>();
        map.put("resId", resId);
        map.put("level", nxRestrauntServiceLevel);

        System.out.println(map);
        System.out.println("heereemapd");

        List<NxCommunityFatherGoodsEntity> disGoodsEntities = resComGoodsService.resGetResComGoodsCata(map);
        return R.ok().put("data", disGoodsEntities);
    }


}
