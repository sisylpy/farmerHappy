package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 05-09 21:11
 */

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxDistributerCommunityEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  批发商社区id
	 */
	private Integer nxDcId;
	/**
	 *  
	 */
	private Integer nxDcCommunityId;
	/**
	 *  
	 */
	private Integer nxDcDistributerId;

	private NxCommunityEntity nxCommunityEntity;

}
