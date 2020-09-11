package com.nongxinle.entity;

/**
 * 
 * @author lpy
 * @date 06-25 22:52
 */

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Objects;

import jdk.nashorn.internal.ir.IndexNode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Setter@Getter@ToString

public class NxDistributerPurchaseBatchEntity implements Serializable, Comparable {
	private static final long serialVersionUID = 1L;
	
	/**
	 *  批发商进货批次id
	 */
	private Integer nxDistributerPurchaseBatchId;
	/**
	 *  批发商进货批次状态
	 */
	private Integer nxDpbStatus;
	/**
	 *  批发商进货批次类型
	 */
	private Integer nxDpbType;
	/**
	 *  批发商进货批次时间
	 */
	private String nxDpbTime;
	/**
	 *  批发商进货采购员id
	 */
	private Integer nxDpbPurUserId;

	private Integer nxDpbDistributerId;

	private String nxDpbDate;
	private String nxDpbHour;
	private String nxDpbMinute;

	private String groupDate;

	List<NxDistributerPurchaseBatchEntity> nxDPBEntities;
	List<NxDistributerPurchaseGoodsEntity> nxDPGEntities;
	private NxDistributerUserEntity nxDistributerUserEntity;

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		NxDistributerPurchaseBatchEntity entity = (NxDistributerPurchaseBatchEntity) o;
		return Objects.equals(nxDistributerPurchaseBatchId, entity.nxDistributerPurchaseBatchId) &&
				Objects.equals(nxDpbStatus, entity.nxDpbStatus) &&
				Objects.equals(nxDpbType, entity.nxDpbType) &&
				Objects.equals(nxDpbTime, entity.nxDpbTime) &&
				Objects.equals(nxDpbPurUserId, entity.nxDpbPurUserId) &&
				Objects.equals(nxDpbDistributerId, entity.nxDpbDistributerId) &&
				Objects.equals(nxDpbDate, entity.nxDpbDate) &&
				Objects.equals(nxDpbHour, entity.nxDpbHour) &&
				Objects.equals(nxDpbMinute, entity.nxDpbMinute) &&
				Objects.equals(groupDate, entity.groupDate) &&
				Objects.equals(nxDPBEntities, entity.nxDPBEntities) &&
				Objects.equals(nxDPGEntities, entity.nxDPGEntities);
	}

	@Override
	public int hashCode() {
		return Objects.hash(nxDistributerPurchaseBatchId, nxDpbStatus, nxDpbType, nxDpbTime, nxDpbPurUserId, nxDpbDistributerId, nxDpbDate, nxDpbHour, nxDpbMinute, groupDate, nxDPBEntities, nxDPGEntities);
	}

	@Override
	public int compareTo(Object o) {
		if (o instanceof NxCommunityGoodsEntity) {
			NxDistributerPurchaseBatchEntity e = (NxDistributerPurchaseBatchEntity) o;
			return this.nxDistributerPurchaseBatchId.compareTo(e.nxDistributerPurchaseBatchId);
		}
		return 0;
	}
}
