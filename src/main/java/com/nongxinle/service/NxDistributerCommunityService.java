package com.nongxinle.service;

/**
 * 
 *
 * @author lpy
 * @date 02-24 09:47
 */

import com.nongxinle.entity.NxDistributerCommunityEntity;
import com.nongxinle.entity.NxDistributerEntity;

import java.util.List;
import java.util.Map;

public interface NxDistributerCommunityService {

    List<NxDistributerEntity> comQueryDistributer(Integer comId);
}
