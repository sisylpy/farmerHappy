package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 12-01 07:19
 */

import java.io.Serializable;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxRestrauntOrdersEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  饭馆订单id
	 */
	private Integer nxRestrauntOrdersId;
	/**
	 *  饭馆订单nx商品id
	 */
	private Integer nxRoNxGoodsId;
	/**
	 *  饭馆订单商品父id
	 */
	private Integer nxRoNxGoodsFatherId;
	/**
	 *  饭馆区域商品id
	 */
	private Integer nxRoComGoodsId;
	/**
	 *  区域父级商品id
	 */
	private Integer nxRoComGoodsFatherId;
	/**
	 *  饭馆id
	 */
	private Integer nxRoResComGoodsId;
	/**
	 *  饭馆商品价格
	 */
	private String nxRoResComGoodsPrice;
	/**
	 *  部门订单申请数量
	 */
	private String nxRoQuantity;
	/**
	 *  部门订单申请规格
	 */
	private String nxRoStandard;
	/**
	 *  部门订单申请备注
	 */
	private String nxRoRemark;
	/**
	 *  部门订单重量
	 */
	private String nxRoWeight;
	/**
	 *  部门订单商品单价
	 */
	private String nxRoPrice;
	/**
	 *  部门订单申请商品小计
	 */
	private String nxRoSubtotal;
	/**
	 *  部门订单部门id
	 */
	private Integer nxRoRestrauntId;
	/**
	 *  
	 */
	private Integer nxRoRestrauntFatherId;
	/**
	 *  部门订单批发商id
	 */
	private Integer nxRoCommunityId;
	/**
	 *  部门商品采购员id
	 */
	private Integer nxRoPurchaseUserId;
	/**
	 *  部门订单账单id
	 */
	private Integer nxRoBillId;
	/**
	 *  部门订单申请商品状态
	 */
	private Integer nxRoStatus;
	/**
	 *  部门订单订货用户id
	 */
	private Integer nxRoOrderUserId;
	/**
	 *  部门订单商品称重用户id
	 */
	private Integer nxRoPickUserId;
	/**
	 *  部门订单商品输入单价用户id
	 */
	private Integer nxRoAccountUserId;
	/**
	 *  部门订单商品进货状态
	 */
	private Integer nxRoBuyStatus;
	/**
	 *  部门订单申请时间
	 */
	private String nxRoApplyDate;
	/**
	 *  部门订单送达时间
	 */
	private String nxRoArriveDate;
	/**
	 *  订单采购商品id
	 */
	private Integer nxRoPurchaseGoodsId;
	/**
	 *  
	 */
	private String nxRoArriveOnlyDate;
	/**
	 *  
	 */
	private String nxRoApplyFullTime;
	/**
	 *  
	 */
	private String nxRoOperationTime;
	/**
	 *  星期几
	 */
	private String nxRoArriveWhatDay;
	/**
	 *  
	 */
	private Integer nxRoIsAgent;
	/**
	 *  本年第几周
	 */
	private Integer nxRoArriveWeeksYear;
	/**
	 *  
	 */
	private String nxRoApplyOnlyTime;

	private Integer nxRoSellType;
	private String nxRoExpectPrice;
	private String nxRoScale;

	private String nxRoCostPrice;
	private NxRestrauntUserEntity nxRestrauntUserEntity;
	private NxCommunityGoodsEntity nxCommunityGoodsEntity;
	private NxRestrauntComGoodsEntity nxRestrauntComGoodsEntity;
	private NxRestrauntEntity nxRestrauntEntity;

	private Boolean showDate = true;

	private Boolean  isWeeks = true;
	private Boolean hasChoice =  false;


}
