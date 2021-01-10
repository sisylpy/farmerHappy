package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 11-28 21:17
 */

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxECommerceSupplierEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  批发商供货商id
	 */
	private Integer nxCommerceSupplierId;
	/**
	 *  批发商id
	 */
	private Integer nxCsCommerceId;
	/**
	 *  供货商id
	 */
	private Integer nxCsSupplierId;

	private NxSupplierEntity nxSupplierEntity;

}
