package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 12-13 09:47
 */

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

import com.github.wxpay.sdk.WXPay;
import com.nongxinle.entity.NxCommunityOrdersEntity;
import com.nongxinle.entity.NxDepartmentBillEntity;
import com.nongxinle.entity.NxRestrauntOrdersEntity;
import com.nongxinle.service.NxRestrauntOrdersService;
import com.nongxinle.utils.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxRestrauntBillEntity;
import com.nongxinle.service.NxRestrauntBillService;

import javax.servlet.http.HttpServletRequest;

import static com.nongxinle.utils.DateUtils.*;


@RestController
@RequestMapping("api/nxrestrauntbill")
public class NxRestrauntBillController {
	@Autowired
	private NxRestrauntBillService nxRestrauntBillService;


	@RequestMapping(value = "/getRestrauntBillApplys/{billId}")
	@ResponseBody
	public R getRestrauntBillApplys(@PathVariable Integer billId) {
        NxRestrauntBillEntity billEntity =  nxRestrauntBillService.queryRestrauntBillApplys(billId);
	    return R.ok().put("data", billEntity);
	}




	//
	@RequestMapping(value = "/restrauntAndComGetAccountBills", method = RequestMethod.POST)
	@ResponseBody
	public R restrauntAndComGetAccountBills(Integer resFatherId, Integer comId) {

		Map<String, Object> stringObjectMap = queryAccountBillByMonth(comId, resFatherId, 0);
		Map<String, Object> lastObjectMap = queryAccountBillByMonth(comId, resFatherId, 1);
		Map<String, Object> lastTwoObjectMap = queryAccountBillByMonth(comId, resFatherId, 2);
		List<Map<String, Object>> dataMap = new ArrayList<>();
		dataMap.add(lastTwoObjectMap);
		dataMap.add(lastObjectMap);
		dataMap.add(stringObjectMap);


		//查询总账款金额
		Map<String, Object> map = new HashMap<>();
		map.put("resFatherId", resFatherId);
		map.put("statusEqual", 0);
		List<NxRestrauntBillEntity> billEntityList = nxRestrauntBillService.queryRestrauntBillsByParams(map);

		double total = 0.0;
		for (NxRestrauntBillEntity bill : billEntityList) {
			String nxDbTotal = bill.getNxRbTotal();
			Double aDouble = Double.valueOf(nxDbTotal);
			total = total + aDouble;

		}
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("arr", dataMap);
		resultMap.put("total", total);

		return R.ok().put("data", resultMap);
	}

	private Map<String, Object> queryAccountBillByMonth(Integer comId, Integer resFatherId, int which) {

		LocalDate today = LocalDate.now();
		today = today.minusMonths(which);
		DateTimeFormatter formatters = DateTimeFormatter.ofPattern("MM");
		String format = formatters.format(today);
		//本月的账单
		Map<String, Object> map = new HashMap<>();
		map.put("comId", comId);
		map.put("resFatherId", resFatherId);
		map.put("month", format);
		map.put("status", 3);
		List<NxRestrauntBillEntity> billEntityList = nxRestrauntBillService.queryRestrauntBillsByParams(map);

		//本月的未结账单数量
		Map<String, Object> map1 = new HashMap<>();
		map1.put("comId", comId);
		map1.put("resFatherId", resFatherId);
		map1.put("statusEqual", 0);
		map1.put("month", format);
		int whichMonthUnSettleTotal = nxRestrauntBillService.queryTotalRestrauntBillByParams(map1);
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("arr", billEntityList);
		dataMap.put("unSettleTotal", whichMonthUnSettleTotal);
		dataMap.put("month", format);

		return dataMap;
	}

	@RequestMapping(value = "/restrauntAndComGetSalesBills", method = RequestMethod.POST)
	@ResponseBody
	public R restrauntAndComGetSalesBills(Integer resFatherId, Integer comId) {

		System.out.println(resFatherId + "adddd");
		Map<String, Object> stringObjectMap = querySalesBillByMonth(comId, resFatherId, 0);
		Map<String, Object> lastObjectMap = querySalesBillByMonth(comId, resFatherId, 1);
		Map<String, Object> lastTwoObjectMap = querySalesBillByMonth(comId, resFatherId, 2);
		List<Map<String, Object>> dataMap = new ArrayList<>();
		dataMap.add(lastTwoObjectMap);
		dataMap.add(lastObjectMap);
		dataMap.add(stringObjectMap);
		return R.ok().put("data", dataMap);

	}

	private Map<String, Object> querySalesBillByMonth(Integer comId, Integer resFatherId, int which) {

		LocalDate today = LocalDate.now();
		today = today.minusMonths(which);
		DateTimeFormatter formatters = DateTimeFormatter.ofPattern("MM");
		String format = formatters.format(today);
		//本月的账单
		Map<String, Object> map = new HashMap<>();
		map.put("comId", comId);
		map.put("resId", resFatherId);
		map.put("month", format);
		map.put("statusEqual", 99);
		List<NxRestrauntBillEntity> billEntityList = nxRestrauntBillService.queryRestrauntBillsByParams(map);

		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("arr", billEntityList);
		dataMap.put("month", format);

		return dataMap;
	}


	@ResponseBody
	@RequestMapping("/restrauntCashPay")
	public R restrauntCashPay(@RequestBody NxRestrauntBillEntity billEntity, HttpServletRequest request) {

		billEntity.setNxRbStatus(0);
		billEntity.setNxRbStatus(1);
		billEntity.setNxRbTime(formatWhatTime(0));
		billEntity.setNxRbMonth(formatWhatMonth(0));
		billEntity.setNxRbDate(formatWhatDate(0));

		Integer billId =  nxRestrauntBillService.restrauntCashPay(billEntity);

		MyWxRestrauntPayConfig config = new MyWxRestrauntPayConfig();

		SortedMap<String, String> params = new TreeMap<>();
		params.put("appid", config.getAppID());
		params.put("mch_id", config.getMchID());
		params.put("nonce_str", CommonUtils.generateUUID());
		params.put("body", "腾讯充值中心-QQ会员充值21");
		params.put("out_trade_no", CommonUtils.generateOutTradeNo());
		params.put("fee_type", "CNY");
		params.put("total_fee", "2");
		params.put("spbill_create_ip", "123.12.12.123");
		params.put("notify_url", "http://www.example.com/wxpay/notify");
		params.put("trade_type", "JSAPI");
		params.put("product_id", "12");
		params.put("openid", "oGPb94p_PbTX6DPpDIy0WA7mEuPM");

		//map转xml
		try {
			WXPay wxpay = new WXPay(config);
			long time = System.currentTimeMillis();
			String tString = String.valueOf(time/1000);
			Map<String, String> resp = wxpay.unifiedOrder(params);
			System.out.println(resp);
			System.out.println("enennenen3333");
			SortedMap<String, String> reMap = new TreeMap<>();
			reMap.put("appId", config.getAppID());
			reMap.put("nonceStr", resp.get("nonce_str"));
			reMap.put("package", "prepay_id=" + resp.get("prepay_id"));
			reMap.put("signType", "MD5");
			reMap.put("timeStamp", tString);
			String s = WxPayUtils.creatSign(reMap, config.getKey());
			reMap.put("paySign", s);
			return R.ok().put("map", reMap);


		} catch (Exception e) {
			e.printStackTrace();
		}
		return R.ok();
	}



	
}
