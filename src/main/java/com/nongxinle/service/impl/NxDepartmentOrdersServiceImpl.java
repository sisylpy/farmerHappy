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
	private NxDepartmentDisGoodsService nxDepartmentDisGoodsService;
	@Autowired
	private NxDistributerGoodsService dgService;

	@Autowired
	private NxDepartmentService nxDepartmentService;
	@Autowired
	private NxDistributerUserService nxDistributerUserService;

	@Override
	public List<NxDepartmentOrdersEntity> queryDisOrdersByParams(Map<String, Object> map) {

		return nxDepartmentOrdersDao.queryDisOrdersByParams(map);
	}

	@Override
	public List<NxDepartmentEntity> queryDistributerTodayDepartments(Map<String, Object> map) {
		return nxDepartmentOrdersDao.queryDistributerTodayDepartments(map);
	}

	
	@Override
	public void save(NxDepartmentOrdersEntity nxDepartmentOrders){

		//判断是否是部门商品
		Integer doDisGoodsId = nxDepartmentOrders.getNxDoDisGoodsId();
		Integer nxDoDepartmentId1 = nxDepartmentOrders.getNxDoDepartmentId();
		//查询部门还是订货群是否添加过此商品
		Map<String, Object> map = new HashMap<>();
		map.put("depId", nxDoDepartmentId1);
		map.put("disGoodsId", doDisGoodsId);
		List<NxDepartmentDisGoodsEntity> disGoodsEntities = nxDepartmentDisGoodsService.queryDepDisGoodsByParams(map);
		Integer nxDoGoodsType = nxDepartmentOrders.getNxDoGoodsType();
		if(disGoodsEntities.size() == 0  && nxDoGoodsType == 0){
			//添加部门商品
			NxDistributerGoodsEntity nxDistributerGoodsEntity = dgService.queryObject(doDisGoodsId);
			String nxDgGoodsName = nxDistributerGoodsEntity.getNxDgGoodsName();
			//
			NxDepartmentDisGoodsEntity disGoodsEntity = new NxDepartmentDisGoodsEntity();
			disGoodsEntity.setNxDdgDepGoodsName(nxDgGoodsName);
			disGoodsEntity.setNxDdgDisGoodsId(doDisGoodsId);
			disGoodsEntity.setNxDdgDisGoodsFatherId(nxDistributerGoodsEntity.getNxDgDfgGoodsFatherId());
			disGoodsEntity.setNxDdgDepGoodsPinyin(nxDistributerGoodsEntity.getNxDgGoodsPinyin());
			disGoodsEntity.setNxDdgDepGoodsPy(nxDistributerGoodsEntity.getNxDgGoodsPy());
			disGoodsEntity.setNxDdgDepGoodsStandardname(nxDistributerGoodsEntity.getNxDgGoodsStandardname());
			disGoodsEntity.setNxDdgDepartmentId(nxDepartmentOrders.getNxDoDepartmentId());
			disGoodsEntity.setNxDdgDepartmentFatherId(nxDepartmentOrders.getNxDoDepartmentFatherId());
			disGoodsEntity.setNxDdgOrderQuantity(nxDepartmentOrders.getNxDoQuantity());
			disGoodsEntity.setNxDdgOrderStandard(nxDepartmentOrders.getNxDoStandard());
			disGoodsEntity.setNxDdgOrderRemark(nxDepartmentOrders.getNxDoRemark());
			disGoodsEntity.setNxDdgOrderDate(formatWhatDay(0));
			nxDepartmentDisGoodsService.save(disGoodsEntity);
			Integer nxDepartmentDisGoodsId = disGoodsEntity.getNxDepartmentDisGoodsId();
			nxDepartmentOrders.setNxDoDepDisGoodsId(nxDepartmentDisGoodsId);
		}else {
			Integer nxDepartmentDisGoodsId = disGoodsEntities.get(0).getNxDepartmentDisGoodsId();
			nxDepartmentOrders.setNxDoDepDisGoodsId(nxDepartmentDisGoodsId);
			//
			NxDepartmentDisGoodsEntity disGoodsEntity = nxDepartmentDisGoodsService.queryObject(nxDepartmentDisGoodsId);
			disGoodsEntity.setNxDdgOrderQuantity(nxDepartmentOrders.getNxDoQuantity());
			disGoodsEntity.setNxDdgOrderStandard(nxDepartmentOrders.getNxDoStandard());
			disGoodsEntity.setNxDdgOrderRemark(nxDepartmentOrders.getNxDoRemark());
			disGoodsEntity.setNxDdgOrderDate(formatWhatDay(0));
			nxDepartmentDisGoodsService.update(disGoodsEntity);
		}

		nxDepartmentOrders.setNxDoStatus(0);
		nxDepartmentOrders.setNxDoBuyStatus(0);
		nxDepartmentOrders.setNxDoApplyDate(formatWhatDay(0));
		nxDepartmentOrders.setNxDoApplyFullTime(formatWhatYearDayTime(0));
		nxDepartmentOrders.setNxDoApplyOnlyTime(formatWhatTime(0));
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
	public List<NxDistributerFatherGoodsEntity>  disGetUnPlanPurchaseApplys(Map<String, Object> map) {
		return nxDepartmentOrdersDao.disGetUnPlanPurchaseApplys(map);
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
	public int queryTotalByParams(Map<String, Object> map) {
		return nxDepartmentOrdersDao.queryTotalByParams(map);
	}

	@Override
	public void saveIndependent(NxDepartmentOrdersEntity nxDepartmentOrders) {

		nxDepartmentOrders.setNxDoStatus(0);
		nxDepartmentOrders.setNxDoBuyStatus(0);
		nxDepartmentOrders.setNxDoApplyDate(formatWhatDay(0));
		nxDepartmentOrders.setNxDoApplyFullTime(formatWhatYearDayTime(0));
		nxDepartmentOrders.setNxDoApplyOnlyTime(formatWhatTime(0));
		nxDepartmentOrdersDao.save(nxDepartmentOrders);

	}

//    @Override
//    public List<NxDepartmentOrdersEntity> queryDepChainOrdersByParams(Map<String, Object> map) {
//
//		return nxDepartmentOrdersDao.queryDepChainOrdersByParams(map);
//    }



    @Override
	public NxDepartmentOrdersEntity queryObject(Integer nxDepartmentOrdersId){
		return nxDepartmentOrdersDao.queryObject(nxDepartmentOrdersId);
	}
	
	@Override
	public List<NxDepartmentOrdersEntity> queryList(Map<String, Object> map){
		return nxDepartmentOrdersDao.queryList(map);
	}
	


	private String getToken(){
		String url = "https://api.weixin.qq.com/cgi-bin/token?appid=wxbc686226ccc443f1&secret=cefb0c474497e74879687862b0d8733e&grant_type=client_credential";
		String result = HttpUtils.get(url);
		Map<String,Object> map = JSON.parseObject(result);
		String access_token = map.get("access_token").toString();
		return access_token;
	}





    @Override
    public List<NxDepartmentOrdersEntity> queryOrdersForDisGoods(Map<String, Object> map1) {

		return nxDepartmentOrdersDao.queryOrdersForDisGoods(map1);
    }


}
