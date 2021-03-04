package com.nongxinle.service.impl;

import com.nongxinle.entity.NxDistributerEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.nongxinle.dao.NxDistributerCommunityDao;
import com.nongxinle.entity.NxDistributerCommunityEntity;
import com.nongxinle.service.NxDistributerCommunityService;



@Service("nxDistributerCommunityService")
public class NxDistributerCommunityServiceImpl implements NxDistributerCommunityService {
	@Autowired
	private NxDistributerCommunityDao nxDistributerCommunityDao;



    @Override
    public List<NxDistributerEntity> comQueryDistributer(Integer comId) {
        return nxDistributerCommunityDao.comQueryDistributer(comId);
    }
}
