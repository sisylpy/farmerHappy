package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 11-30 15:31
 */

import com.nongxinle.entity.NxCommunityRestrauantEntity;
import com.nongxinle.entity.NxRestrauntEntity;

import java.util.List;


public interface NxCommunityRestrauantDao extends BaseDao<NxCommunityRestrauantEntity> {

    List<NxRestrauntEntity> queryRestrauntsByComId(Integer comId);
}
