package com.nongxinle.service.impl;

import com.nongxinle.entity.*;
import com.nongxinle.service.NxCommunityGoodsService;
import com.nongxinle.service.NxRestrauntComGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import com.nongxinle.dao.NxRestrauntOrdersDao;
import com.nongxinle.service.NxRestrauntOrdersService;

import static com.nongxinle.utils.DateUtils.*;


@Service("nxRestrauntOrdersService")
public class NxRestrauntOrdersServiceImpl implements NxRestrauntOrdersService {
	@Autowired
	private NxRestrauntOrdersDao nxRestrauntOrdersDao;
	@Autowired
	private NxRestrauntComGoodsService rcgService;
	@Autowired
	private NxCommunityGoodsService cgService;
	
	@Override
	public NxRestrauntOrdersEntity queryObject(Integer nxRestrauntOrdersId){
		return nxRestrauntOrdersDao.queryObject(nxRestrauntOrdersId);
	}
	
	@Override
	public List<NxRestrauntOrdersEntity> queryList(Map<String, Object> map){
		return nxRestrauntOrdersDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxRestrauntOrdersDao.queryTotal(map);
	}
	
	@Override
	public void save(NxRestrauntOrdersEntity nxRestrauntOrders){


		//判断是否是部门商品
		Integer comGoodsId = nxRestrauntOrders.getNxRoComGoodsId();
		Integer restaruantId = nxRestrauntOrders.getNxRoRestrauntId();
		//查询部门还是订货群是否添加过此商品
		Map<String, Object> map = new HashMap<>();
		map.put("resId", restaruantId);
		map.put("comGoodsId", comGoodsId);
		List<NxRestrauntComGoodsEntity> resComGoodsEntities = rcgService.queryResComGoodsByParams(map);
		if(resComGoodsEntities.size() == 0 ){
			//添加部门商品
			NxCommunityGoodsEntity communityGoodsEntity = cgService.queryObject(comGoodsId);
			String nxCgGoodsName = communityGoodsEntity.getNxCgGoodsName();
			//
			NxRestrauntComGoodsEntity resComGoodsEntity = new NxRestrauntComGoodsEntity();
			resComGoodsEntity.setNxRcgComGoodsName(nxCgGoodsName);
			resComGoodsEntity.setNxRcgComGoodsId(comGoodsId);
			resComGoodsEntity.setNxRcgComGoodsFatherId(communityGoodsEntity.getNxCgCfgGoodsFatherId());
			resComGoodsEntity.setNxRcgComGoodsPinyin(communityGoodsEntity.getNxCgGoodsPinyin());
			resComGoodsEntity.setNxRcgComGoodsPy(communityGoodsEntity.getNxCgGoodsPy());
			resComGoodsEntity.setNxRcgComGoodsStandardname(communityGoodsEntity.getNxCgGoodsStandardname());
			resComGoodsEntity.setNxRcgRestrauntId(nxRestrauntOrders.getNxRoRestrauntId());
			resComGoodsEntity.setNxRcgRestrauntFatherId(nxRestrauntOrders.getNxRoRestrauntFatherId());
			resComGoodsEntity.setNxRcgOrderQuantity(nxRestrauntOrders.getNxRoQuantity());
			resComGoodsEntity.setNxRcgOrderStandard(nxRestrauntOrders.getNxRoStandard());
			resComGoodsEntity.setNxRcgOrderRemark(nxRestrauntOrders.getNxRoRemark());
			resComGoodsEntity.setNxRcgOrderDate(formatWhatDay(0));
			resComGoodsEntity.setNxRcgOrderUserId(nxRestrauntOrders.getNxRoOrderUserId());
			rcgService.save(resComGoodsEntity);
			Integer nxDepartmentDisGoodsId = resComGoodsEntity.getNxRestrauntComGoodsId();
			nxRestrauntOrders.setNxRoResComGoodsId(nxDepartmentDisGoodsId);
		}else {
			Integer nxRestrauntComGoodsId = resComGoodsEntities.get(0).getNxRestrauntComGoodsId();
			nxRestrauntOrders.setNxRoResComGoodsId(nxRestrauntComGoodsId);
			//
			NxRestrauntComGoodsEntity nxRestrauntComGoodsEntity = rcgService.queryObject(nxRestrauntComGoodsId);
			nxRestrauntComGoodsEntity.setNxRcgOrderQuantity(nxRestrauntOrders.getNxRoQuantity());
			nxRestrauntComGoodsEntity.setNxRcgOrderStandard(nxRestrauntOrders.getNxRoStandard());
			nxRestrauntComGoodsEntity.setNxRcgOrderRemark(nxRestrauntOrders.getNxRoRemark());
			nxRestrauntComGoodsEntity.setNxRcgOrderDate(formatWhatDay(0));
			rcgService.update(nxRestrauntComGoodsEntity);
		}

		nxRestrauntOrders.setNxRoStatus(0);
		nxRestrauntOrders.setNxRoBuyStatus(0);
		nxRestrauntOrders.setNxRoApplyDate(formatWhatDay(0));
		nxRestrauntOrders.setNxRoApplyFullTime(formatWhatYearDayTime(0));
		nxRestrauntOrders.setNxRoApplyOnlyTime(formatWhatTime(0));
		nxRestrauntOrdersDao.save(nxRestrauntOrders);

//		nxDepartmentOrdersDao.save(nxDepartmentOrders);


	}
	
	@Override
	public void update(NxRestrauntOrdersEntity nxRestrauntOrders){
		nxRestrauntOrdersDao.update(nxRestrauntOrders);
	}
	
	@Override
	public void delete(Integer nxRestrauntOrdersId){
		nxRestrauntOrdersDao.delete(nxRestrauntOrdersId);
	}
	
	@Override
	public void deleteBatch(Integer[] nxRestrauntOrdersIds){
		nxRestrauntOrdersDao.deleteBatch(nxRestrauntOrdersIds);
	}

    @Override
    public TreeSet<NxRestrauntEntity> queryCommunityTodayRestruants(Map<String, Object> map1) {
        return nxRestrauntOrdersDao.queryCommunityTodayRestruants(map1);
    }

    @Override
    public List<NxRestrauntOrdersEntity> queryResOrdersByParams(Map<String, Object> map3) {

		return nxRestrauntOrdersDao.queryResOrdersByParams(map3);
    }

    @Override
    public int queryResOrdersTotalByParams(Map<String, Object> map1) {
        return nxRestrauntOrdersDao.queryResOrdersTotalByParams(map1);
    }


    @Override
    public List<NxCommunityFatherGoodsEntity> comGetUnPlanPurchaseApplys(Map<String, Object> map) {

		return nxRestrauntOrdersDao.comGetUnPlanPurchaseApplys(map);
    }

    @Override
    public List<NxRestrauntOrdersEntity> queryResOrdersForComGoods(Map<String, Object> map1) {
        return nxRestrauntOrdersDao.queryResOrdersForComGoods(map1);
    }

    @Override
    public List<NxCommunityFatherGoodsEntity> queryResOrdersByComStockGoodsType(Map<String, Object> map2) {
        return nxRestrauntOrdersDao.queryResOrdersByComStockGoodsType(map2);
    }

    @Override
    public List<NxDistributerEntity> queryResOrdersByComDistributerGoodsType(Map<String, Object> map2) {

		return nxRestrauntOrdersDao.queryResOrdersByComDistributerGoodsType(map2);
    }

    @Override
    public List<NxCommunityFatherGoodsEntity> queryTodayComGoodsType(Map<String, Object> map1) {

		return nxRestrauntOrdersDao.queryTodayComGoodsType(map1);
    }

	@Override
	public List<NxCommunityGoodsEntity> queryOrderGoodsByFatherId(Map<String, Object> map) {
		return nxRestrauntOrdersDao.queryOrderGoodsByFatherId(map);
	}

    @Override
    public List<NxRestrauntOrdersEntity> queryComDeliveryResOrdersByParams(Map<String, Object> map) {

		return nxRestrauntOrdersDao.queryComDeliveryResOrdersByParams(map);

    }

    @Override
    public TreeSet<NxRestrauntEntity> queryDeliveryResByParams(Map<String, Object> map1) {

		return nxRestrauntOrdersDao.queryDeliveryResByParams(map1);
    }

    @Override
    public int queryOrderComGoodsTodayTotal(Map<String, Object> map) {

		return nxRestrauntOrdersDao.queryOrderComGoodsTodayTotal(map);
    }

    @Override
    public TreeSet<NxRestrauntOrdersEntity> queryUnCostDate(Map<String, Object> map) {

		return nxRestrauntOrdersDao.queryUnCostDate(map);
    }

    @Override
    public TreeSet<NxCommunityPurchaseBatchEntity> queryBuyingBatchGoods(Map<String, Object> map) {

		return nxRestrauntOrdersDao.queryBuyingBatchGoods(map);
    }

    @Override
    public TreeSet<NxRestrauntEntity> queryTodayComRestrauant(Map<String, Object> map) {

		return nxRestrauntOrdersDao.queryTodayComRestrauant(map);
    }

    @Override
    public List<NxDistributerGoodsEntity> queryDistributerGoodsWithResOrdersByParams(Map<String, Object> map3) {
        return nxRestrauntOrdersDao.queryDistributerGoodsWithResOrdersByParams(map3);
    }

    @Override
    public List<NxCommunityEntity> queryDistributerTodayCommunity(Map<String, Object> map3) {

		return nxRestrauntOrdersDao.queryDistributerTodayCommunity(map3);
    }

    @Override
    public List<NxRestrauntOrdersEntity> queryResChainOrdersByParams(Map<String, Object> map) {

		return nxRestrauntOrdersDao.queryResChainOrdersByParams(map);
    }

//    @Override
//    public List<NxDepartmentOrdersEntity> queryDepChainOrdersByParams(Map<String, Object> map) {
//
//		return nxRestrauntOrdersDao.queryDepChainOrdersByParams(map);
//    }


}
