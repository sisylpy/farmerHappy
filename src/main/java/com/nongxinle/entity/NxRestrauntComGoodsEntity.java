package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 12-01 08:51
 */

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxRestrauntComGoodsEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  
	 */
	private Integer nxRestrauntComGoodsId;
	/**
	 *  
	 */
	private Integer nxRcgRestrauntFatherId;
	/**
	 *  
	 */
	private Integer nxRcgRestrauntId;
	/**
	 *  
	 */
	private Integer nxRcgComGoodsId;
	/**
	 *  
	 */
	private Integer nxRcgComGoodsFatherId;
	/**
	 *  
	 */
	private String nxRcgComGoodsName;
	/**
	 *  
	 */
	private String nxRcgComGoodsPinyin;
	/**
	 *  
	 */
	private String nxRcgComGoodsPy;
	/**
	 *  
	 */
	private String nxRcgComGoodsStandardname;
	/**
	 *  
	 */
	private String nxRcgComGoodsDetail;
	/**
	 *  
	 */
	private String nxRcgComGoodsBrand;
	/**
	 *  
	 */
	private String nxRcgComGoodsPlace;
	/**
	 *  
	 */
	private String nxRcgOrderPrice;
	/**
	 *  
	 */
	private String nxRcgOrderDate;
	/**
	 *  
	 */
	private String nxRcgOrderRemark;
	/**
	 *  
	 */
	private String nxRcgOrderQuantity;
	/**
	 *  
	 */
	private String nxRcgOrderStandard;
	private NxCommunityGoodsEntity nxCommunityGoodsEntity;
	private List<NxCommunityStandardEntity> nxCommunityStandardEntities;
	private List<NxRestrauntOrdersEntity> nxRestrauntOrdersEntities;

}
