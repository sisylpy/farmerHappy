package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 10-11 17:01
 */

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxDepartmentBillEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  
	 */
	private Integer nxDepartmentBillId;
	/**
	 *  
	 */
	private Integer nxDbDisId;
	/**
	 *  
	 */
	private Integer nxDbDepId;
	/**
	 *  
	 */
	private String nxDbTotal;
	/**
	 *  
	 */
	private Integer nxDbStatus;
	/**
	 *  
	 */
	private String nxDbTime;
	/**
	 *  
	 */
	private Integer nxDbIssueUserId;
	private String nxDbDate;

	private String nxDbMonth;
	private String nxDbWeek;
	private String nxDbTradeNo;
	private NxDistributerEntity distributerEntity;

	private List<NxDepartmentOrdersEntity>  nxDepartmentOrdersEntities;



}
