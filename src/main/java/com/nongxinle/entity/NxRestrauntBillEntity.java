package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 12-13 09:47
 */

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxRestrauntBillEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  
	 */
	private Integer nxRestrauntBillId;
	/**
	 *  
	 */
	private Integer nxRbComId;
	/**
	 *  
	 */
	private Integer nxRbRestrauntId;
	/**
	 *  
	 */
	private Integer nxRbDriverUserId;
	/**
	 *  
	 */
	private String nxRbTotal;
	/**
	 *  
	 */
	private Integer nxRbStatus;
	/**
	 *  
	 */
	private String nxRbTime;
	/**
	 *  
	 */
	private Integer nxRbIssueUserId;
	/**
	 *  
	 */
	private String nxRbDate;
	/**
	 *  
	 */
	private String nxRbMonth;
	/**
	 *  
	 */
	private String nxRbWeek;
	/**
	 *  
	 */
	private String nxRbTradeNo;

	List<NxRestrauntOrdersEntity> nxRestrauntOrdersEntities;

}
