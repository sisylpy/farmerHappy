package com.nongxinle.dao;

/**
 * 
 *
 * @author lpy
 * @date 11-30 15:31
 */

import com.nongxinle.entity.NxRestrauntUserEntity;

import java.util.List;


public interface NxRestrauntUserDao extends BaseDao<NxRestrauntUserEntity> {

    NxRestrauntUserEntity queryResUserByOpenId(String openid);

    List<NxRestrauntUserEntity> queryAllResUsersByResId(Integer resId);
}
