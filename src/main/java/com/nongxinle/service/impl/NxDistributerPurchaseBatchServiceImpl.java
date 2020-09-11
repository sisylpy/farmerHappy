package com.nongxinle.service.impl;

import com.nongxinle.entity.NxDepartmentOrdersEntity;
import com.nongxinle.entity.NxDistributerPurchaseGoodsEntity;
import com.nongxinle.service.NxDepartmentOrdersService;
import com.nongxinle.service.NxDistributerPurchaseGoodsService;
import com.nongxinle.utils.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDistributerPurchaseBatchDao;
import com.nongxinle.entity.NxDistributerPurchaseBatchEntity;
import com.nongxinle.service.NxDistributerPurchaseBatchService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import static com.nongxinle.utils.CommonUtils.generateUUID;
import static com.nongxinle.utils.DateUtils.*;


@Service("nxDistributerPurchaseBatchService")
public class NxDistributerPurchaseBatchServiceImpl implements NxDistributerPurchaseBatchService {
	@Autowired
	private NxDistributerPurchaseBatchDao nxDistributerPurchaseBatchDao;



	@Autowired
	private NxDepartmentOrdersService nxDepartmentOrdersService;

	@Autowired
	private NxDistributerPurchaseGoodsService nxDisPurchaseGoodsService;

	
	@Override
	public NxDistributerPurchaseBatchEntity queryObject(Integer nxDistributerPurchaseBatchId){

		return nxDistributerPurchaseBatchDao.queryObject(nxDistributerPurchaseBatchId);
	}
	
	@Override
	public List<NxDistributerPurchaseBatchEntity> queryList(Map<String, Object> map){
		return nxDistributerPurchaseBatchDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return nxDistributerPurchaseBatchDao.queryTotal(map);
	}
	
	@Override
	public Integer save(NxDistributerPurchaseBatchEntity nxDistributerPurchaseBatch){
		nxDistributerPurchaseBatch.setNxDpbStatus(0);
		nxDistributerPurchaseBatch.setNxDpbDate(formatWhatDate(0));
		nxDistributerPurchaseBatch.setNxDpbHour(formatWhatHour(0));
		nxDistributerPurchaseBatch.setNxDpbMinute(formatWhatMinute(0));
		nxDistributerPurchaseBatch.setNxDpbTime(formatWhatDayTime(0));

		nxDistributerPurchaseBatchDao.save(nxDistributerPurchaseBatch);
		Integer nxDPBatchId = nxDistributerPurchaseBatch.getNxDistributerPurchaseBatchId();

		List<NxDistributerPurchaseGoodsEntity> purchaseGoodsEntities = nxDistributerPurchaseBatch.getNxDPGEntities();


		for (NxDistributerPurchaseGoodsEntity purGoods : purchaseGoodsEntities) {
				Integer nxDistributerPurchaseGoodsId = purGoods.getNxDistributerPurchaseGoodsId();
				NxDistributerPurchaseGoodsEntity purchaseGoodsEntity = nxDisPurchaseGoodsService.queryObject(nxDistributerPurchaseGoodsId);
				purchaseGoodsEntity.setNxDpgBatchId(nxDPBatchId);
				purchaseGoodsEntity.setNxDpgPurchaseType(nxDistributerPurchaseBatch.getNxDpbType());
				purchaseGoodsEntity.setNxDpgStatus(2);
				purchaseGoodsEntity.setNxDpgBuyUserId(nxDistributerPurchaseBatch.getNxDpbPurUserId());
				System.out.println(purchaseGoodsEntity);
				purchaseGoodsEntity.setNxDpgTime(formatWhatTime(0));
			nxDisPurchaseGoodsService.update(purchaseGoodsEntity);

				List<NxDepartmentOrdersEntity> nxDepartmentOrdersEntities = purGoods.getNxDepartmentOrdersEntities();
				for (NxDepartmentOrdersEntity order : nxDepartmentOrdersEntities) {
					order.setNxDoPurchaseGoodsId(nxDistributerPurchaseGoodsId);
					order.setNxDoBuyStatus(2);
					nxDepartmentOrdersService.update(order);
				 }
			}

		return nxDPBatchId;

	}
	
	@Override
	public void update(NxDistributerPurchaseBatchEntity nxDistributerPurchaseBatch){
		nxDistributerPurchaseBatchDao.update(nxDistributerPurchaseBatch);
	}
	
	@Override
	public void delete(String nxDpbUuid){
		nxDistributerPurchaseBatchDao.delete(nxDpbUuid);
	}
	
	@Override
	public void deleteBatch(String[] nxDpbUuids){
		nxDistributerPurchaseBatchDao.deleteBatch(nxDpbUuids);
	}

	@Override
	public List<NxDistributerPurchaseBatchEntity> queryDisPurchaseBatch(Map<String, Object> map) {
		return nxDistributerPurchaseBatchDao.queryDisPurchaseBatch(map);
	}

    @Override
    public void deleteBatchId(Integer purchaseBatchId) {
        nxDistributerPurchaseBatchDao.delateBatchId(purchaseBatchId);
	   List<NxDistributerPurchaseGoodsEntity> purGoods = 	nxDisPurchaseGoodsService.queryPurchaseGoodsByBatchId(purchaseBatchId);
		for (NxDistributerPurchaseGoodsEntity goods :
				purGoods) {
			Integer nxDistributerPurchaseGoodsId = goods.getNxDistributerPurchaseGoodsId();

			System.out.println("cometoupdatlele");
			NxDistributerPurchaseGoodsEntity nxDistributerPurchaseGoodsEntity = nxDisPurchaseGoodsService.queryObject(nxDistributerPurchaseGoodsId);
			nxDistributerPurchaseGoodsEntity.setNxDpgPurchaseType(-1);
			nxDistributerPurchaseGoodsEntity.setNxDpgStatus(0);
			nxDisPurchaseGoodsService.update(nxDistributerPurchaseGoodsEntity);
		}
    }


}
