package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 02-24 09:47
 */

import com.nongxinle.entity.NxDistributerCommunityEntity;
import com.nongxinle.entity.NxDistributerEntity;

import java.util.List;


public interface NxDistributerCommunityDao extends BaseDao<NxDistributerCommunityEntity> {

    List<NxDistributerEntity> comQueryDistributer(Integer comId);
}
