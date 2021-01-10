package com.nongxinle.service.impl;

import com.nongxinle.dao.NxRestrauntUserDao;
import com.nongxinle.entity.*;
import com.nongxinle.service.NxCommunityRestrauantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxRestrauntDao;
import com.nongxinle.service.NxRestrauntService;

import static com.nongxinle.utils.DateUtils.formatWhatDay;


@Service("nxRestrauntService")
public class NxRestrauntServiceImpl implements NxRestrauntService {
    @Autowired
    private NxRestrauntDao nxRestrauntDao;
    @Autowired
    private NxRestrauntUserDao nxRestrauntUserDao;
    @Autowired
    private NxCommunityRestrauantService nxCommunityRestrauantService;


    @Override
    public NxRestrauntEntity queryObject(Integer nxRestrauntId) {
        return nxRestrauntDao.queryObject(nxRestrauntId);
    }

    @Override
    public List<NxRestrauntEntity> queryList(Map<String, Object> map) {
        return nxRestrauntDao.queryList(map);
    }

    @Override
    public int queryTotal(Map<String, Object> map) {
        return nxRestrauntDao.queryTotal(map);
    }

    @Override
    public void save(NxRestrauntEntity nxRestraunt) {
        nxRestrauntDao.save(nxRestraunt);
    }

    @Override
    public void update(NxRestrauntEntity nxRestraunt) {
        nxRestrauntDao.update(nxRestraunt);
    }

    @Override
    public void delete(Integer nxRestrauntId) {
        nxRestrauntDao.delete(nxRestrauntId);
    }

    @Override
    public void deleteBatch(Integer[] nxRestrauntIds) {
        nxRestrauntDao.deleteBatch(nxRestrauntIds);
    }

    @Override
    public Integer saveNewRestraunt(NxRestrauntEntity res) {
        //1.保存餐馆
        nxRestrauntDao.save(res);

        String nxRestrauntIdStr = res.getNxRestrauntId().toString();
        int strLen = nxRestrauntIdStr.length();
        if (strLen < 4) {
            while (strLen < 4) {
                StringBuffer sb = new StringBuffer();
                sb.append("0").append(nxRestrauntIdStr);// 左补0
				nxRestrauntIdStr = sb.toString();
                strLen = nxRestrauntIdStr.length();
            }
        }
        res.setNxRestrauntNumber(nxRestrauntIdStr);
        nxRestrauntDao.update(res);


//		//2，保存用户
		Integer nxRestrauntId = res.getNxRestrauntId();
		NxRestrauntUserEntity nxRestrauntUserEntity = res.getNxRestrauntUserEntity();
        nxRestrauntUserEntity.setNxRuRestaurantId(nxRestrauntId);
        nxRestrauntUserEntity.setNxRuRestaurantFatherId(nxRestrauntId);
        nxRestrauntUserEntity.setNxRuJoinDate(formatWhatDay(0));
        nxRestrauntUserEntity.setNxRuComId(res.getNxRestrauntComId());
        nxRestrauntUserDao.save(nxRestrauntUserEntity);

        if (res.getNxRestrauntEntities().size() > 0) {
            //3,保存部门
            List<NxRestrauntEntity> nxRestrauntEntities = res.getNxRestrauntEntities();
            for (NxRestrauntEntity subRes : nxRestrauntEntities) {
                subRes.setNxRestrauntFatherId(nxRestrauntId);
                subRes.setNxRestrauntComId(res.getNxRestrauntComId());
                nxRestrauntDao.save(subRes);
            }
        }

        //3, 保存订货群的批发商
        Integer nxRestrauntComId = res.getNxRestrauntComId();
        NxCommunityRestrauantEntity entity = new NxCommunityRestrauantEntity();
        entity.setNxCrCommunityId(nxRestrauntComId);
        entity.setNxCrRestaruantId(nxRestrauntId);
        nxCommunityRestrauantService.save(entity);

        return nxRestrauntUserEntity.getNxRestrauntUserId();
    }

    @Override
    public Map<String, Object> queryResAndUserInfo(Integer resUserId) {

        //订货群信息
        NxRestrauntUserEntity nxRestrauntUserEntity = nxRestrauntUserDao.queryObject(resUserId);
        //用户信息
        Integer restaurantId = nxRestrauntUserEntity.getNxRuRestaurantId();
        NxRestrauntEntity nxRestrauntEntity = nxRestrauntDao.queryResInfo(restaurantId);

        //返回
        Map<String, Object> map = new HashMap<>();
        map.put("userInfo", nxRestrauntUserEntity);
        map.put("resInfo", nxRestrauntEntity);
        return map;
    }

    @Override
    public List<NxRestrauntEntity> queryPrepareDeliveryRestraunts(Integer comId) {

        return nxRestrauntDao.queryPrepareDeliveryRestraunts(comId);
    }

    @Override
    public List<NxRestrauntEntity> queryDriverRestraunts(Integer userId) {

        return nxRestrauntDao.queryDriverRestraunts(userId);
    }


}
