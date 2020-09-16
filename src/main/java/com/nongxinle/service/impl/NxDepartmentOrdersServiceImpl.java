package com.nongxinle.service.impl;

import com.alibaba.fastjson.JSON;
//import com.nongxinle.dao.NxDepartmentGoodsDao;
import com.nongxinle.dao.NxDepartmentUserDao;
import com.nongxinle.dao.NxDistributerUserDao;
import com.nongxinle.entity.*;
import com.nongxinle.service.*;
import com.nongxinle.utils.HttpUtils;
import com.sun.source.util.Trees;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

import com.nongxinle.dao.NxDepartmentOrdersDao;

import static com.nongxinle.utils.DateUtils.*;


@Service("nxDepartmentOrdersService")
public class NxDepartmentOrdersServiceImpl implements NxDepartmentOrdersService {
	@Autowired
	private NxDepartmentOrdersDao nxDepartmentOrdersDao;

	@Autowired
	private NxDistributerUserDao nxDistributerUserDao;
//	@Autowired
//	private NxDistributerPurchaseGoodsService nxDPGService;
	@Autowired
	private NxDepartmentService nxDepartmentService;
	@Autowired
	private NxDistributerUserService nxDistributerUserService;

	@Override
	public List<NxDepartmentOrdersEntity> queryDisOrdersByParams(Map<String, Object> map) {

		return nxDepartmentOrdersDao.queryDisOrdersByParams(map);
	}

	@Override
	public List<NxDepartmentEntity> queryDistributerTodayOrders(Integer disId) {
		return nxDepartmentOrdersDao.queryDistributerTodayOrders(disId);
	}
	
	@Override
	public void save(NxDepartmentOrdersEntity nxDepartmentOrders){

		nxDepartmentOrders.setNxDoStatus(0);
		nxDepartmentOrders.setNxDoBuyStatus(0);
		nxDepartmentOrders.setNxDoApplyDate(formatWhatDay(0));
		nxDepartmentOrders.setNxDoApplyOnlyDate(formatWhatDate(0));
		nxDepartmentOrders.setNxDoApplyOnlyTime(formatWhatTime(0));
		nxDepartmentOrders.setNxDoArriveDate(formatWhatDay(1));
		nxDepartmentOrdersDao.save(nxDepartmentOrders);

		//如果是加急订单，则给批发商发送微信通知
		if(nxDepartmentOrders.getIsNotice()){
			Integer nxDoDepartmentId = nxDepartmentOrders.getNxDoDepartmentId();
			NxDepartmentEntity nxDepartmentEntity = nxDepartmentService.queryObject(nxDoDepartmentId);
			String depName = "";
			Integer fatherId = nxDepartmentEntity.getNxDepartmentFatherId();
			if(fatherId.equals(0)){
				depName = nxDepartmentEntity.getNxDepartmentName();
			}else{
				NxDepartmentEntity fatherDep = nxDepartmentService.queryObject(fatherId);
				String nxDepartmentName = fatherDep.getNxDepartmentName();
				depName = depName + "." + nxDepartmentName;
			}

			String token = getToken();

			Integer disId = nxDepartmentOrders.getNxDoDistributerId();
			List<NxDistributerUserEntity> disUsers = nxDistributerUserService.queryUser(disId);
			for (NxDistributerUserEntity user : disUsers) {
				String nxDiuWxOpenId = user.getNxDiuWxOpenId();

				Map<String,Object> param = new HashMap<>();
				param.put("touser", nxDiuWxOpenId);
				param.put("template_id","-iBBaNT5xYhTafwt6WHjlYuKCcU9-PkpfPAvEv5g91Y");
				param.put("page","/pages/order/order");
				param.put("miniprogram_state","developer");

				Map<String,Object> data = new HashMap<>();
				data.put("time2", new Value(formatWhatDayTime(0)));
				data.put("thing6", new Value(depName));

				param.put("data",data);

				// 注意检查参数的格式，很容易出现问题
				System.out.println("param:" + JSON.toJSONString(param));

				String url = "https://api.weixin.qq.com/cgi-bin/message/subscribe/send?access_token=" + token;
				Map result = HttpUtils.post(url, param);
				System.out.println("result=" + result);

			}
		}
	}

	@Override
	public List<NxDistributerFatherGoodsEntity>  disGetUnPlanPurchaseApplys(Integer disId) {
		return nxDepartmentOrdersDao.disGetUnPlanPurchaseApplys(disId);
	}



//	///////////





	@Override
	public void update(NxDepartmentOrdersEntity nxDepartmentOrders){
		nxDepartmentOrdersDao.update(nxDepartmentOrders);
	}

	@Override
	public void delete(Integer nxDepartmentOrdersId){
		nxDepartmentOrdersDao.delete(nxDepartmentOrdersId);
	}

	@Override
	public void deleteBatch(Integer[] nxDepartmentOrdersIds){
		nxDepartmentOrdersDao.deleteBatch(nxDepartmentOrdersIds);
	}

	@Override
	public NxDepartmentOrdersEntity queryObject(Integer nxDepartmentOrdersId){
		return nxDepartmentOrdersDao.queryObject(nxDepartmentOrdersId);
	}
	
	@Override
	public List<NxDepartmentOrdersEntity> queryList(Map<String, Object> map){
		return nxDepartmentOrdersDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxDepartmentOrdersDao.queryTotal(map);
	}





	private String getToken(){
		String url = "https://api.weixin.qq.com/cgi-bin/token?appid=wxbc686226ccc443f1&secret=cefb0c474497e74879687862b0d8733e&grant_type=client_credential";
		String result = HttpUtils.get(url);
		Map<String,Object> map = JSON.parseObject(result);
		String access_token = map.get("access_token").toString();
		return access_token;
	}




//	@Override
//	public List<NxDepartmentOrdersEntity> disGetUnPlanPurchaseGoodsByFatherGoodsId(Integer nxGoodsId) {
//		return nxDepartmentOrdersDao.disGetUnPlanPurchaseGoodsByFatherGoodsId(nxGoodsId);
//	}

    @Override
    public List<NxDepartmentOrdersEntity> queryToFillDepOrders(Map<String, Object> map) {

		return nxDepartmentOrdersDao.queryKindsOfOrders(map);
    }



//	@Override
//	public List<NxDepartmentOrdersEntity> queryDepartmentTodayOrders(Integer depId) {
//		return nxDepartmentOrdersDao.queryDepartmentTodayOrders(depId);
//	}


//	@Override
	public Integer queryNewOrders(Integer nxDepartmentId) {
		return nxDepartmentOrdersDao.queryNewOrders(nxDepartmentId);
	}
//
//    @Override
    public Integer queryFatherNewOrders(Integer nxDepartmentId) {

		return nxDepartmentOrdersDao.queryFatherNewOrders(nxDepartmentId);
	}


}
