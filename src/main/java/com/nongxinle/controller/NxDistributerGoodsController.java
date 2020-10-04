package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 07-27 17:38
 */

import java.util.*;

import com.nongxinle.entity.*;
import com.nongxinle.service.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;

import static com.nongxinle.utils.PinYin4jUtils.getHeadStringByString;
import static com.nongxinle.utils.PinYin4jUtils.hanziToPinyin;


@RestController
@RequestMapping("api/nxdistributergoods")
public class NxDistributerGoodsController {
	@Autowired
	private NxDistributerGoodsService dgService;

	@Autowired
	private NxStandardService standardService;

	@Autowired
	private NxGoodsService nxGoodsService;

	@Autowired
	private NxDistributerFatherGoodsService dgfService;

	@Autowired
	private NxDistributerStandardService dsService;

	@Autowired
	private NxDepartmentDisGoodsService nxDepDisGoodsService;



	@RequestMapping(value = "/canclePostDgnGoods", method = RequestMethod.POST)
	@ResponseBody
	public R canclePostDgnGoods (Integer disGoodsId,Integer disGoodsFatherId, Integer disId  ) {

		Map<String, Object> map1 = new HashMap<>();
		map1.put("disId", disId);
		map1.put("fatherId", disGoodsFatherId);
		//搜索fatherId下有几个disGoods
		List<NxDistributerGoodsEntity> totalDisGoods = dgService.queryDisGoodsByParams(map1);
		//如果disGoods的父类只有一个商品
		if(totalDisGoods.size() == 1){
			//父类Entity
			NxDistributerFatherGoodsEntity nxDistributerFatherGoodsEntity = dgfService.queryObject(disGoodsFatherId);
			//disGoods的grandId
			Integer grandId = nxDistributerFatherGoodsEntity.getNxDfgFathersFatherId();
			Map<String, Object> mapGrand = new HashMap<>();
			mapGrand.put("fathersFatherId", grandId);
			mapGrand.put("disId", disId);
			//搜索grand有几个兄弟
			List<NxDistributerFatherGoodsEntity> fatherGoodsEntities = dgfService.queryDisFatherGoodsByParams(mapGrand);
			if(fatherGoodsEntities.size() == 1){

				Integer nxDfgFathersFatherId = fatherGoodsEntities.get(0).getNxDfgFathersFatherId();
				NxDistributerFatherGoodsEntity grandEntity = dgfService.queryObject(nxDfgFathersFatherId);
				Integer greatGrandId = grandEntity.getNxDfgFathersFatherId();
				Map<String, Object> map = new HashMap<>();
				map.put("disId", disId);
				map.put("fathersFatherId", greatGrandId);
				List<NxDistributerFatherGoodsEntity> grandGoodsEntities =dgfService.queryDisFatherGoodsByParams(map);

				//如果grandFather也是只有一个，则删除greatGrandFather
				if(grandGoodsEntities.size() == 1){

					dgfService.delete(greatGrandId);
				}
				dgfService.delete(grandId);
			}
			dgfService.delete(disGoodsFatherId);
		}

		//删除订货单位
		List<NxDistributerStandardEntity> standardEntities = dsService.queryDisStandardByDisGoodsId(disGoodsId);
		if (standardEntities.size() > 0){
			for (NxDistributerStandardEntity disStandard : standardEntities) {
				dsService.delete(disStandard.getNxDistributerStandardId());
			}
		}


		int i = dgService.delete(disGoodsId);

		if(i == 1){
			return R.ok();
		}else {
			return R.error(-1, "删除失败");
		}
	}
	
	
	
	/**
	 * 添加批发商商品
	 * @param cgnGoods 批发商商品
	 * @return ok
	 */
	@RequestMapping(value = "/postDgnGoods", method = RequestMethod.POST)
	@ResponseBody
	public R postDgnGoods(@RequestBody NxDistributerGoodsEntity cgnGoods) {

		//queryGrandFatherId
		NxGoodsEntity fatherEntity = nxGoodsService.queryObject(cgnGoods.getNxDgNxFatherId());
		Integer grandFatherId = fatherEntity.getNxGoodsFatherId();
		cgnGoods.setNxDgNxGrandId(grandFatherId);
		NxGoodsEntity grandEntity = nxGoodsService.queryObject(grandFatherId);
		cgnGoods.setNxDgNxGrandName(grandEntity.getNxGoodsName());

		//queryGreatGrandFatherId
		Integer greatGrandFatherId = grandEntity.getNxGoodsFatherId();
		cgnGoods.setNxDgNxGreatGrandId(greatGrandFatherId);
		cgnGoods.setNxDgNxGreatGrandName(nxGoodsService.queryObject(greatGrandFatherId).getNxGoodsName());

		Integer nxDgDistributerId = cgnGoods.getNxDgDistributerId();

			// 3， 查询父类
			Integer nxDgNxFatherId = cgnGoods.getNxDgNxFatherId();
			Map<String, Object> map = new HashMap<>();
			map.put("disId", nxDgDistributerId);
			map.put("nxFatherId", nxDgNxFatherId);
			List<NxDistributerGoodsEntity> disGoodsEntities =  dgService.queryDisGoodsHasNxGoodsFather(map);

			if(disGoodsEntities.size() > 0){
				//直接加disGoods和disStandard,不需要加disFatherGoods
				//1，给父类商品的字段商品数量加1
				NxDistributerGoodsEntity disGoodsEntity = disGoodsEntities.get(0);

				//2，保存disId商品
				Integer nxDgDfgGoodsFatherId = disGoodsEntity.getNxDgDfgGoodsFatherId();
				cgnGoods.setNxDgDfgGoodsFatherId(nxDgDfgGoodsFatherId);
				//1 ，先保存disGoods
				dgService.save(cgnGoods);
				//
			}else{
				//添加fatherGoods的第一个级别
				NxDistributerFatherGoodsEntity dgf = new NxDistributerFatherGoodsEntity();
				dgf.setNxDfgDistributerId(cgnGoods.getNxDgDistributerId());
				dgf.setNxDfgFatherGoodsName(cgnGoods.getNxDgNxFatherName());
				dgf.setNxDfgFatherGoodsLevel(2);
				dgfService.save(dgf);
				//更新disGoods的fatherGoodsId
				Integer distributerFatherGoodsId = dgf.getNxDistributerFatherGoodsId();
				cgnGoods.setNxDgDfgGoodsFatherId(distributerFatherGoodsId);
				dgService.save(cgnGoods);
				//继续查询是否有GrandFather
				String grandName = cgnGoods.getNxDgNxGrandName();
				Map<String, Object> map2 = new HashMap<>();
				map2.put("disId", nxDgDistributerId);
				map2.put("fathersFatherName", grandName);
				List<NxDistributerFatherGoodsEntity> grandGoodsFather = dgfService.queryHasDisFathersFather(map2);
				if(grandGoodsFather.size() > 0){
					NxDistributerFatherGoodsEntity nxDistributerFatherGoodsEntity = grandGoodsFather.get(0);
					dgf.setNxDfgFathersFatherId(nxDistributerFatherGoodsEntity.getNxDistributerFatherGoodsId());
					dgfService.update(dgf);
				}else{

					//tianjiaGrand
					NxDistributerFatherGoodsEntity grand = new NxDistributerFatherGoodsEntity();
					String nxCgGrandFatherName = cgnGoods.getNxDgNxGrandName();
					grand.setNxDfgFatherGoodsName(nxCgGrandFatherName);
					grand.setNxDfgDistributerId(cgnGoods.getNxDgDistributerId());
					grand.setNxDfgFatherGoodsLevel(1);
					dgfService.save(grand);

					dgf.setNxDfgFathersFatherId(grand.getNxDistributerFatherGoodsId());
					dgfService.update(dgf);


					//查询是否有greatGrand
					String greatGrandName = cgnGoods.getNxDgNxGreatGrandName();
					Map<String, Object> map3 = new HashMap<>();
					map3.put("disId", nxDgDistributerId);
					map3.put("fathersFatherName", greatGrandName);
					List<NxDistributerFatherGoodsEntity> greatGrandGoodsFather = dgfService.queryHasDisFathersFather(map3);
					if(greatGrandGoodsFather.size() > 0){
						NxDistributerFatherGoodsEntity nxDistributerFatherGoodsEntity = greatGrandGoodsFather.get(0);
						Integer disFatherId = nxDistributerFatherGoodsEntity.getNxDistributerFatherGoodsId();
						grand.setNxDfgFathersFatherId(disFatherId);
						dgfService.update(grand);
					}else{
						NxDistributerFatherGoodsEntity greatGrand = new NxDistributerFatherGoodsEntity();
						String greatGrandName1 = cgnGoods.getNxDgNxGreatGrandName();
						greatGrand.setNxDfgFatherGoodsName(greatGrandName1);
						greatGrand.setNxDfgDistributerId(cgnGoods.getNxDgDistributerId());
						greatGrand.setNxDfgFatherGoodsLevel(0);
						dgfService.save(greatGrand);
						grand.setNxDfgFathersFatherId(greatGrand.getNxDistributerFatherGoodsId());
						dgfService.update(grand);
					}
				}

			}

			//2，保存dis规格
			Integer nxCgGoodsId = cgnGoods.getNxDistributerGoodsId();
			List<NxStandardEntity> ncsEntities = cgnGoods.getNxStandardEntities();
			for (NxStandardEntity standard : ncsEntities) {
				NxDistributerStandardEntity disStandards = new NxDistributerStandardEntity();
				disStandards.setNxDsDisGoodsId(nxCgGoodsId);
				disStandards.setNxDsStandardName(standard.getNxStandardName());
				disStandards.setNxDsStandardError(standard.getNxStandardError());
				disStandards.setNxDsStandardScale(standard.getNxStandardScale());
				disStandards.setNxDsStandardFilePath(standard.getNxStandardFilePath());
				disStandards.setNxDsStandardSort(standard.getNxStandardSort());
				dsService.save(disStandards);
			}
			return R.ok().put("data",cgnGoods);
		}




	/**
	 * 批发商商品列表
	 * @param fatherId 父类id
	 * @return 批发商商品列表
	 */
	@RequestMapping(value = "/disGetDisGoodsListByFatherId", method = RequestMethod.POST)
	@ResponseBody
	public R  disGetDisGoodsListByFatherId (Integer  fatherId, Integer disId) {

		Map<String, Object> map = new HashMap<>();
		map.put("fatherId", fatherId);
		map.put("disId", disId);
		List<NxDistributerGoodsEntity> goodsEntities1 = dgService.queryDisGoodsByParams(map);
		return R.ok().put("data", goodsEntities1);
	}

	/**
	 * ibook获取含有批发商信息的商品列表
	 * @param limit 每页商品数量
	 * @param page 第几页
	 * @param fatherId 商品父级id
	 * @param disId 批发商id
	 * @return ibook商品列表
	 */

	@RequestMapping(value = "/disGetIbookGoods", method = RequestMethod.POST)
	@ResponseBody
	public R disGetIbookGoods (Integer limit, Integer page, Integer fatherId, Integer disId ) {
		System.out.println("hen");
		Map<String, Object> map1 = new HashMap<>();
		map1.put("offset", (page - 1) * limit);
		map1.put("limit", limit);
		map1.put("fatherId", fatherId);
		List<NxGoodsEntity> nxGoodsEntities1 = nxGoodsService.queryNxGoodsByParams(map1);

		List<NxGoodsEntity> goodsEntities = new ArrayList<>();

		for (NxGoodsEntity goods : nxGoodsEntities1) {
			Map<String, Object> map = new HashMap<>();
			map.put("disId", disId);
			map.put("goodsId", goods.getNxGoodsId());
			List<NxDistributerGoodsEntity> dgGoods = dgService.queryAddDistributerNxGoods(map);

			if(dgGoods.size() > 0) {
				goods.setIsDownload(1);
				goods.setNxDistributerGoodsEntity(dgGoods.get(0));
				goodsEntities.add(goods);
			}else {
				goods.setIsDownload(0);
				goodsEntities.add(goods);
			}
		}

		int total = nxGoodsService.queryTotalByFatherId(fatherId);
		PageUtils pageUtil = new PageUtils(goodsEntities, total, limit, page);
		return R.ok().put("page", pageUtil);
	}


	/**
	 * 批发商商品详细
	 * @param disGoodsId 批发商商品id
	 * @return 含有客户的商品
	 */
	@RequestMapping(value = "/disGetGoodsDetail/{disGoodsId}")
	@ResponseBody
	public R disGetGoodsDetail(@PathVariable Integer disGoodsId) {
		NxDistributerGoodsEntity disGoods =  dgService.queryDisGoodsDetail(disGoodsId);

		List<NxDepartmentEntity> entities = nxDepDisGoodsService.queryDepartmentsByDisGoodsId(disGoodsId);
		Map<String, Object> map = new HashMap<>();
		map.put("goodsInfo", disGoods);
		map.put("departmentArr", entities);

		return R.ok().put("data", map);
	}



	/**
	 *
	 * @param str 搜索字符串
	 * @param disId 批发商id
	 * @return 搜索结果
	 */
	@RequestMapping(value = "/queryDisGoodsByQuickSearch", method = RequestMethod.POST)
	@ResponseBody
	public R queryDisGoodsByQuickSearch(String str, String disId) {
		System.out.println(str);
		Map<String, Object> map = new HashMap<>();
		map.put("str", str);
		map.put("disId", disId);
		List<NxDistributerGoodsEntity> goodsEntities = dgService.queryQuickSearch(map);
		return R.ok().put("data", goodsEntities);
	}


	@ResponseBody
	@RequestMapping("/disGoodsUpdate")
	public R update(@RequestBody NxDistributerGoodsEntity nxDistributerGoods){
		dgService.update(nxDistributerGoods);
		return R.ok();
	}


	@ResponseBody
	@RequestMapping("/disSaveDisGoods")
	public R disSaveDisGoods(@RequestBody NxDistributerGoodsEntity nxDistributerGoods){
		String nxDgGoodsName = nxDistributerGoods.getNxDgGoodsName();
		String pinyin = hanziToPinyin(nxDgGoodsName);
		String headPinyin = getHeadStringByString(nxDgGoodsName, false, null);
		nxDistributerGoods.setNxDgGoodsPinyin(pinyin);
		nxDistributerGoods.setNxDgGoodsPy(headPinyin);
		dgService.save(nxDistributerGoods);
		Integer distributerGoodsId = nxDistributerGoods.getNxDistributerGoodsId();
		List<NxDistributerStandardEntity> distributerStandardEntities = nxDistributerGoods.getDistributerStandardEntities();
		for (NxDistributerStandardEntity standard : distributerStandardEntities) {
			standard.setNxDsDisGoodsId(distributerGoodsId);
			dsService.save(standard);
		}

		return R.ok();
	}


	/**
	 * 列表
	 */
//	@ResponseBody
//	@RequestMapping("/list")
//	@RequiresPermissions("nxdistributergoods:list")
//	public R list(Integer page, Integer limit){
//		Map<String, Object> map = new HashMap<>();
//		map.put("offset", (page - 1) * limit);
//		map.put("limit", limit);
//
//		//查询列表数据
//		List<NxDistributerGoodsEntity> nxDistributerGoodsList = dgService.queryList(map);
//		int total = dgService.queryTotal(map);
//
//		PageUtils pageUtil = new PageUtils(nxDistributerGoodsList, total, limit, page);
//
//		return R.ok().put("page", pageUtil);
//	}
//
//
//	/**
//	 * 信息
//	 */
//	@ResponseBody
//	@RequestMapping("/info/{nxDistributerGoodsId}")
//	@RequiresPermissions("nxdistributergoods:info")
//	public R info(@PathVariable("nxDistributerGoodsId") Integer nxDistributerGoodsId){
//		NxDistributerGoodsEntity nxDistributerGoods = dgService.queryObject(nxDistributerGoodsId);
//
//		return R.ok().put("nxDistributerGoods", nxDistributerGoods);
//	}
	

	
//	/**
//	 * 删除
//	 */
//	@ResponseBody
//	@RequestMapping("/delete")
//	@RequiresPermissions("nxdistributergoods:delete")
//	public R delete(@RequestBody Integer[] nxDistributerGoodsIds){
//		dgService.deleteBatch(nxDistributerGoodsIds);
//
//		return R.ok();
//	}
	
}
