package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 07-27 17:38
 */

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxDistributerGoodsEntity implements Serializable, Comparable  {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  社区商品id
	 */
	private Integer nxDistributerGoodsId;
	/**
	 *  批发商id
	 */
	private Integer nxDgDistributerId;
	/**
	 *  商品状态
	 */
	private Integer nxDgGoodsStatus;
	/**
	 *  是否称重
	 */
	private Integer nxDgGoodsIsWeight;
	/**
	 *  批发商商品父类id
	 */
	private Integer nxDgDfgGoodsFatherId;
	/**
	 *  购买热度
	 */
	private Integer nxDgNxGoodsId;
	/**
	 *  采购数量
	 */
	private Integer nxDgNxFatherId;
	private String nxDgNxFatherImg;
	private String nxDgNxFatherName;

	private Integer nxDgNxGrandId;
	private String nxDgNxGrandName;
	private Integer nxDgNxGreatGrandId;
	private String nxDgNxGreatGrandName;

	/**
	 *
	 */
	private String nxDgNxGoodsFatherImg;
	/**
	 *  商品名称
	 */
	private String nxDgGoodsName;
	/**
	 *  商品详细
	 */
	private String nxDgGoodsDetail;
	private String nxDgGoodsBrand;
	private String nxDgGoodsPlace;
	/**
	 *  商品规格
	 */
	private String nxDgGoodsStandardname;

	private String nxDgGoodsStandardWeight;
	/**
	 *  社区商品拼音
	 */
	private String nxDgGoodsPinyin;
	/**
	 *  社区商品拼音简拼
	 */
	private String nxDgGoodsPy;


	private Integer nxDgPullOff;

	private String nxDgNxGoodsFatherColor;



	//private Integer nxDgGoodsStock;

//	private Integer nxFatherId;
//	private Integer nxGrandId;
//	private Integer nxGreatGrandId;

	private NxGoodsEntity nxGoodsEntity;

	private List<NxDistributerStandardEntity> distributerStandardEntities;

	private List<NxStandardEntity> nxStandardEntities;
	private List<NxAliasEntity> nxAliasEntities;

	private List<NxDepartmentStandardEntity> nxDepartmentStandardEntities;

	private Integer isDownload;

	private List<NxDepartmentOrdersEntity> nxDepartmentOrdersEntities;
	private List<NxRestrauntOrdersEntity> nxRestrauntOrdersEntities;

	private NxDepartmentDisGoodsEntity departmentDisGoodsEntity;
	private NxCommunityGoodsEntity nxCommunityGoodsEntity;

	@Override
	public int compareTo(Object o) {
		if (o instanceof NxDistributerGoodsEntity) {
			NxDistributerGoodsEntity e = (NxDistributerGoodsEntity) o;
			return this.nxDistributerGoodsId.compareTo(e.nxDistributerGoodsId);
		}
		return 0;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		NxDistributerGoodsEntity that = (NxDistributerGoodsEntity) o;
		return Objects.equals(nxDistributerGoodsId, that.nxDistributerGoodsId);
	}

	@Override
	public int hashCode() {
		return Objects.hash(nxDistributerGoodsId);
	}
}
