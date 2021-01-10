package com.nongxinle.controller;

/**
 * @author lpy
 * @date 10-11 17:01
 */

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.NxDepartmentDisGoodsEntity;
import com.nongxinle.entity.NxDepartmentOrdersEntity;
import com.nongxinle.service.NxDepartmentDisGoodsService;
import com.nongxinle.service.NxDepartmentOrdersService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxDepartmentBillEntity;
import com.nongxinle.service.NxDepartmentBillService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;

//import static com.nongxinle.utils.CommonUtils.generateBillTradeNo;
import static com.nongxinle.utils.CommonUtils.generateBillTradeNo;
import static com.nongxinle.utils.CommonUtils.generateOutTradeNo;
import static com.nongxinle.utils.DateUtils.*;
import static com.nongxinle.utils.DateUtils.formatWhatMonth;


@RestController
@RequestMapping("api/nxdepartmentbill")
public class NxDepartmentBillController {
    @Autowired
    private NxDepartmentBillService nxDepartmentBillService;
    @Autowired
    private NxDepartmentOrdersService nxDepartmentOrdersService;
    @Autowired
    private NxDepartmentDisGoodsService nxDepartmentDisGoodsService;


    /**
     * 结账
     *
     * @param bills
     * @return
     */
    @RequestMapping(value = "/settleDepBills", method = RequestMethod.POST)
    @ResponseBody
    public R settleDepBills(@RequestBody List<NxDepartmentBillEntity> bills) {
        for (NxDepartmentBillEntity bill : bills) {
            bill.setNxDbStatus(1);
            nxDepartmentBillService.update(bill);
        }
        return R.ok();
    }

    /**
     * 批发商获取未结账账单
     *
     * @param disId 批发商id
     * @return 订单列表
     */
    @RequestMapping(value = "/disGetUnSettleAccountBills/{disId}")
    @ResponseBody
    public R disGetUnSettleAccountBills(@PathVariable Integer disId) {
        Map<String, Object> map = new HashMap<>();
        map.put("disId", disId);
        map.put("statusEqual", 0);
        List<NxDepartmentBillEntity> billEntityList = nxDepartmentBillService.queryBillsByParams(map);
        if(billEntityList.size() > 0){
            return R.ok().put("data", billEntityList);

        }else{
            return R.error();
        }
    }


    @RequestMapping(value = "/sellerAndBuyerGetAccountBills", method = RequestMethod.POST)
    @ResponseBody
    public R sellerAndBuyerGetAccountBills(Integer depFatherId, Integer disId) {

        Map<String, Object> stringObjectMap = queryAccountBillByMonth(disId, depFatherId, 0);
        Map<String, Object> lastObjectMap = queryAccountBillByMonth(disId, depFatherId, 1);
        Map<String, Object> lastTwoObjectMap = queryAccountBillByMonth(disId, depFatherId, 2);
        List<Map<String, Object>> dataMap = new ArrayList<>();
        dataMap.add(lastTwoObjectMap);
        dataMap.add(lastObjectMap);
        dataMap.add(stringObjectMap);


        //查询总账款金额
        Map<String, Object> map = new HashMap<>();
        map.put("depId", depFatherId);
        map.put("statusEqual", 0);
        List<NxDepartmentBillEntity> billEntityList = nxDepartmentBillService.queryBillsByParams(map);

        double total = 0.0;
        for (NxDepartmentBillEntity bill : billEntityList) {
            String nxDbTotal = bill.getNxDbTotal();
            Double aDouble = Double.valueOf(nxDbTotal);
            total = total + aDouble;

        }
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("arr", dataMap);
        resultMap.put("total", total);

        return R.ok().put("data", resultMap);
    }


    @RequestMapping(value = "/getBillApplys/{billId}")
    @ResponseBody
    public R getBillApplys(@PathVariable Integer billId) {
        NxDepartmentBillEntity salesBill = nxDepartmentBillService.querySalesBillApplys(billId);
        return R.ok().put("data", salesBill);
    }


    private Map<String, Object> queryAccountBillByMonth(Integer disId, Integer depFatherId, int which) {

        LocalDate today = LocalDate.now();
        today = today.minusMonths(which);
        DateTimeFormatter formatters = DateTimeFormatter.ofPattern("MM");
        String format = formatters.format(today);
        //本月的账单
        Map<String, Object> map = new HashMap<>();
        map.put("disId", disId);
        map.put("depId", depFatherId);
        map.put("month", format);
        map.put("status", 3);
        List<NxDepartmentBillEntity> billEntityList = nxDepartmentBillService.queryBillsByParams(map);

        //本月的未结账单数量
        Map<String, Object> map1 = new HashMap<>();
        map1.put("disId", disId);
        map1.put("depId", depFatherId);
        map1.put("statusEqual", 0);
        map1.put("month", format);
        int whichMonthUnSettleTotal = nxDepartmentBillService.queryTotalByParams(map1);
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("arr", billEntityList);
        dataMap.put("unSettleTotal", whichMonthUnSettleTotal);
        dataMap.put("month", format);

        return dataMap;
    }


    /**
     * 现金账单
     *
     * @param disId
     * @return
     */
    @RequestMapping(value = "/sellerAndBuyerGetSalesBills", method = RequestMethod.POST)
    @ResponseBody
    public R sellerAndBuyerGetSalesBills(Integer depFatherId, Integer disId) {

        Map<String, Object> stringObjectMap = querySalesBillByMonth(disId, depFatherId, 0);
        Map<String, Object> lastObjectMap = querySalesBillByMonth(disId, depFatherId, 1);
        Map<String, Object> lastTwoObjectMap = querySalesBillByMonth(disId, depFatherId, 2);
        List<Map<String, Object>> dataMap = new ArrayList<>();
        dataMap.add(lastTwoObjectMap);
        dataMap.add(lastObjectMap);
        dataMap.add(stringObjectMap);
        return R.ok().put("data", dataMap);

    }

    private Map<String, Object> querySalesBillByMonth(Integer disId, Integer depFatherId, int which) {

        LocalDate today = LocalDate.now();
        today = today.minusMonths(which);
        DateTimeFormatter formatters = DateTimeFormatter.ofPattern("MM");
        String format = formatters.format(today);
        //本月的账单
        Map<String, Object> map = new HashMap<>();
        map.put("disId", disId);
        map.put("depId", depFatherId);
        map.put("month", format);
        map.put("statusEqual", 99);
        List<NxDepartmentBillEntity> billEntityList = nxDepartmentBillService.queryBillsByParams(map);

        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("arr", billEntityList);
        dataMap.put("month", format);

        return dataMap;
    }


    @RequestMapping(value = "/saveAccountBill", method = RequestMethod.POST)
    @ResponseBody
    public R saveAccountBill(@RequestBody NxDepartmentBillEntity nxDepartmentBill) {
        String nxDbDisId = nxDepartmentBill.getNxDbDisId().toString();
        List<NxDepartmentOrdersEntity> nxDepartmentOrdersEntities = nxDepartmentBill.getNxDepartmentOrdersEntities();
        nxDepartmentBill.setNxDbStatus(0);
        nxDepartmentBill.setNxDbDate(formatWhatDay(0));
        nxDepartmentBill.setNxDbTime(formatWhatYearDayTime(0));
        nxDepartmentBill.setNxDbMonth(formatWhatMonth(0));
        nxDepartmentBill.setNxDbWeek(getWeek(0));
        nxDepartmentBillService.save(nxDepartmentBill);
        for (NxDepartmentOrdersEntity orders : nxDepartmentOrdersEntities) {
            orders.setNxDoStatus(3);
            orders.setNxDoBillId(nxDepartmentBill.getNxDepartmentBillId());
            nxDepartmentOrdersService.update(orders);
            String nxDoPrice = orders.getNxDoPrice();
            String nxDoWeight = orders.getNxDoWeight();
            if (nxDoPrice != null && nxDoWeight != null) {
                Integer nxDoDepDisGoodsId = orders.getNxDoDepDisGoodsId();
                NxDepartmentDisGoodsEntity nxDepartmentDisGoodsEntity = nxDepartmentDisGoodsService.queryObject(nxDoDepDisGoodsId);
                nxDepartmentDisGoodsEntity.setNxDdgOrderPrice(nxDoPrice);
                nxDepartmentDisGoodsService.update(nxDepartmentDisGoodsEntity);
            }
        }
        return R.ok();
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping("/saveSalesBill")
    public R saveSalesBill(@RequestBody NxDepartmentBillEntity nxDepartmentBill) {
        String areaCode = "1" + nxDepartmentBill.getNxDbDisId();
        List<NxDepartmentOrdersEntity> nxDepartmentOrdersEntities = nxDepartmentBill.getNxDepartmentOrdersEntities();
        nxDepartmentBill.setNxDbStatus(99);
        nxDepartmentBill.setNxDbDate(formatWhatDay(0));
        nxDepartmentBill.setNxDbTime(formatWhatYearDayTime(0));
        nxDepartmentBill.setNxDbMonth(formatWhatMonth(0));
        nxDepartmentBill.setNxDbWeek(getWeek(0));
        nxDepartmentBill.setNxDbTradeNo(generateBillTradeNo(areaCode));
        nxDepartmentBillService.save(nxDepartmentBill);
        for (NxDepartmentOrdersEntity orders : nxDepartmentOrdersEntities) {
            orders.setNxDoStatus(3);
            orders.setNxDoBillId(nxDepartmentBill.getNxDepartmentBillId());
            nxDepartmentOrdersService.update(orders);
            String nxDoPrice = orders.getNxDoPrice();
            if (nxDoPrice != null && !nxDoPrice.equals("0.0")) {
                Integer nxDoDepDisGoodsId = orders.getNxDoDepDisGoodsId();
                NxDepartmentDisGoodsEntity nxDepartmentDisGoodsEntity = nxDepartmentDisGoodsService.queryObject(nxDoDepDisGoodsId);
                nxDepartmentDisGoodsEntity.setNxDdgOrderPrice(nxDoPrice);
                nxDepartmentDisGoodsService.update(nxDepartmentDisGoodsEntity);
            }
        }
        return R.ok();
    }

    /**
     * 修改
     */
    @ResponseBody
    @RequestMapping("/update")
    @RequiresPermissions("nxdepartmentbill:update")
    public R update(@RequestBody NxDepartmentBillEntity nxDepartmentBill) {
        nxDepartmentBillService.update(nxDepartmentBill);

        return R.ok();
    }


}
