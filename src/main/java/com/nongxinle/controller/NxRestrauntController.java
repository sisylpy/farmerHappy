package com.nongxinle.controller;

/**
 * @author lpy
 * @date 11-30 15:31
 */

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.nongxinle.entity.*;
import com.nongxinle.service.*;
import com.nongxinle.utils.MyAPPIDConfig;
import com.nongxinle.utils.WeChatUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.utils.R;



@RestController
@RequestMapping("api/nxrestraunt")
public class NxRestrauntController {
    @Autowired
    private NxRestrauntService nxRestrauntService;
    @Autowired
    private NxRestrauntUserService nxRestrauntUserService;
    @Autowired
    private NxRestrauntOrdersService nxRestrauntOrdersService;
    @Autowired
    private NxCommunityUserService nxCommunityUserService;
    @Autowired
    private NxCommunityService nxCommunityService;

    private static final String KEY = "C5HBZ-KEIW2-JXXUJ-COLGS-FQO47-WWFAK";

    


    @RequestMapping(value = "/deliveryCompleteRestraunt", method = RequestMethod.POST)
    @ResponseBody
    public R deliveryCompleteRestraunt (@RequestBody NxRestrauntEntity restraunt ) {
        //更新订单
        Integer nxRestrauntId = restraunt.getNxRestrauntId();
        Map<String, Object> map = new HashMap<>();
        map.put("resId", nxRestrauntId);
        map.put("statusEqual", 3);
        List<NxRestrauntOrdersEntity> nxRestrauntOrdersEntities = nxRestrauntOrdersService.queryResOrdersByParams(map);
        for (NxRestrauntOrdersEntity ordersEntity: nxRestrauntOrdersEntities){
            ordersEntity.setNxRoStatus(4);
            nxRestrauntOrdersService.update(ordersEntity);
        }
        //更新司机
        Integer nxRestrauntDriverId = restraunt.getNxRestrauntDriverId();
        NxCommunityUserEntity nxCommunityUserEntity = nxCommunityUserService.queryObject(nxRestrauntDriverId);
        nxCommunityUserEntity.setNxCouWorkingStatus(0);
        nxCommunityUserService.update(nxCommunityUserEntity);
        //更新餐馆
        nxRestrauntService.update(restraunt);
        return R.ok();
    }

    @RequestMapping(value = "/getDriverDeliveryRestraunts/{userId}")
    @ResponseBody
    public R getDriverDeliveryRestraunts(@PathVariable Integer userId ) {

       List<NxRestrauntEntity> restrauntEntities =  nxRestrauntService.queryDriverRestraunts(userId);

        //获取出发点坐标
        StringBuilder stringBuilder = new StringBuilder();
        for (NxRestrauntEntity restraunt : restrauntEntities) {
            String nxRestrauntLat = restraunt.getNxRestrauntLat();
            String nxRestrauntLng = restraunt.getNxRestrauntLng();
            String item  = nxRestrauntLat + "," + nxRestrauntLng;
            stringBuilder.append(item + ";");
        }
        String substring = stringBuilder.substring(0, stringBuilder.length() - 1);


        NxCommunityUserEntity nxCommunityUserEntity = nxCommunityUserService.queryObject(userId);
        Integer communityId = nxCommunityUserEntity.getNxCouCommunityId();
        NxCommunityEntity nxCommunityEntity = nxCommunityService.queryObject(communityId);
        String fromLat = nxCommunityEntity.getNxCommunityLat();
        String fromLng = nxCommunityEntity.getNxCommunityLng();

        String from = fromLat + "," + fromLng;
        String urlString = "http://apis.map.qq.com/ws/distance/v1/optimal_order?mode=driving&from="
                + from + "&to=" + substring + "&key=" + KEY;
        // 发送请求，返回Json字符串
        String result = "";
        try {
            URL url = new URL(urlString);
            System.out.println(url);
            System.out.println("----");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setDoOutput(true);
            // 腾讯地图使用GET
            conn.setRequestMethod("GET");
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String line;
            // 获取地址解析结果
            System.out.println(in);
            while ((line = in.readLine()) != null) {
                result += line + "\n";
            }
            in.close();
        } catch (Exception e) {
            e.getMessage();
        }


//		// 转JSON格式
        JSONObject jsonObject = JSONObject.parseObject(result);
        String optimal_order = (String)jsonObject.getString("result");

        //获取排序
        String order = JSONObject.parseObject(optimal_order).getString("optimal_order");
        System.out.println(order);
        String substring2 = order.substring(0);
        String substring3 = substring2.substring(1, substring2.length() - 1);
        String[] split = substring3.split(",");

        List<NxRestrauntEntity> treeSet = new ArrayList<>();

        String elements = JSONObject.parseObject(optimal_order).getString("elements");
        List<NxRestrauntEntity> list = new ArrayList<>();
        list = JSONObject.parseArray(elements, NxRestrauntEntity.class);

        System.out.println(list);
        System.out.println("list");

        for(int i =0; i < split.length; i++){
            Integer integer = Integer.valueOf(split[i]);

            NxRestrauntEntity nxRestrauntEntity = restrauntEntities.get(integer - 1);
            NxRestrauntEntity listEnitity = list.get(i);
            System.out.println(listEnitity.getDistance()+ "distancececicicicici");
            System.out.println(listEnitity.getDuration() + "durationtitonttino");
            String distance = listEnitity.getDistance();
            String duration = listEnitity.getDuration();
            nxRestrauntEntity.setDistance(distance);
            nxRestrauntEntity.setDuration(duration);
            treeSet.add(nxRestrauntEntity);
        }
        return R.ok().put("data", treeSet);
    }


    @RequestMapping(value = "/getPrepareDeliveryRestraunts/{comId}")
    @ResponseBody
    public R getPrepareDeliveryRestraunts(@PathVariable Integer comId) {
        List<NxRestrauntEntity> restrauntEntities = nxRestrauntService.queryPrepareDeliveryRestraunts(comId);
        return R.ok().put("data", restrauntEntities);
    }


    @RequestMapping(value = "/deliveryRestraunts", method = RequestMethod.POST)
    @ResponseBody
    public R deliveryRestraunts (@RequestBody List<NxRestrauntEntity> restraunts) {
        //更新司机状态
        NxRestrauntEntity nxRestrauntEntity = restraunts.get(0);
        Integer nxRestrauntDriverId = nxRestrauntEntity.getNxRestrauntDriverId();
        NxCommunityUserEntity nxCommunityUserEntity = nxCommunityUserService.queryObject(nxRestrauntDriverId);
        nxCommunityUserEntity.setNxCouWorkingStatus(1);
        nxCommunityUserService.update(nxCommunityUserEntity);
        //修改餐馆状态
        for (NxRestrauntEntity res : restraunts) {
            nxRestrauntService.update(res);
        }
        return R.ok();
    }

    @RequestMapping(value = "/saveDeliveryGoods", method = RequestMethod.POST)
    @ResponseBody
    public R saveDeliveryGoods (@RequestBody NxRestrauntEntity restraunt) {
        nxRestrauntService.update(restraunt);
        List<NxRestrauntOrdersEntity> nxRestrauntOrdersEntities = restraunt.getNxRestrauntOrdersEntities();
        for (NxRestrauntOrdersEntity orders : nxRestrauntOrdersEntities) {
            orders.setNxRoStatus(3);
            nxRestrauntOrdersService.update(orders);
        }
        return R.ok();
    }

    /**
     * PURCHASE
     * 采购员注册
     * @param res 订货群
     * @return 群信息
     */
    @RequestMapping(value = "/restrauntRegiste", method = RequestMethod.POST)
    @ResponseBody
    public R restrauntRegiste(@RequestBody NxRestrauntEntity res) {
//wxApp
        MyAPPIDConfig myAPPIDConfig = new MyAPPIDConfig();

        NxRestrauntUserEntity nxRestrauntUserEntity = res.getNxRestrauntUserEntity();
        String url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + myAPPIDConfig.getRestrauntAppID() +
                "&secret=" + myAPPIDConfig.getRestrauntScreat() + "&js_code=" + nxRestrauntUserEntity.getNxRuCode() + "&grant_type=authorization_code";
        // 发送请求，返回Json字符串
        String str = WeChatUtil.httpRequest(url, "GET", null);
        // 转成Json对象 获取openid
        JSONObject jsonObject = JSONObject.parseObject(str);

        // 我们需要的openid，在一个小程序中，openid是唯一的
        String openid = jsonObject.get("openid").toString();
        NxRestrauntUserEntity nxResUserEntity = nxRestrauntUserService.queryResUserByOpenId(openid);

        if (nxResUserEntity == null) {
            res.getNxRestrauntUserEntity().setNxRuWxOpenId(openid);
            Integer resUserId = nxRestrauntService.saveNewRestraunt(res);

            if (resUserId != null) {
                Map<String, Object> stringObjectMap = nxRestrauntService.queryResAndUserInfo(resUserId);
                return R.ok().put("data", stringObjectMap);
            }
            return R.error(-1, "注册失败");
        } else {
            return R.error(-1, "此微信号已注册过采购员");
        }

    }


    /**
     *
     * 微信小程序扫描二维码校验文件
     * @return 校验内容
     */
    @RequestMapping(value = "/P6Khh4cKmX.txt")
    @ResponseBody
    public String resRegist( ) {
        return "9513a724a3a311899c561d1264e07457";
    }


    @RequestMapping(value = "/updateRestraunt", method = RequestMethod.POST)
    @ResponseBody
    public R updateRestraunt (@RequestBody NxRestrauntEntity restruant ) {
        nxRestrauntService.update(restruant);
        return R.ok();
    }


}
