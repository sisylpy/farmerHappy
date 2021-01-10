package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 11-28 21:17
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.NxSupplierEntity;
import com.nongxinle.service.NxSupplierService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxECommerceSupplierEntity;
import com.nongxinle.service.NxECommerceSupplierService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxecommercesupplier")
public class NxECommerceSupplierController {
	@Autowired
	private NxECommerceSupplierService nxECommerceSupplierService;

	@Autowired
	private NxSupplierService nxSupplierService;



	@RequestMapping(value = "/saveComSupplier", method = RequestMethod.POST)
	@ResponseBody
	public R saveComSupplier (@RequestBody NxECommerceSupplierEntity comSupplier) {

		//save ecommerceSupplier
		nxECommerceSupplierService.save(comSupplier);
		// save supplier
		NxSupplierEntity nxSupplierEntity = comSupplier.getNxSupplierEntity();
		nxSupplierService.save(nxSupplierEntity);
		// update ecommerceSupplier
		Integer nxSupplierId = nxSupplierEntity.getNxSupplierId();
		comSupplier.setNxCsSupplierId(nxSupplierId);

		nxECommerceSupplierService.update(comSupplier);

		return R.ok();
	}


	@RequestMapping(value = "/editComSupplier", method = RequestMethod.POST)
	@ResponseBody
	public R editComSupplier (@RequestBody NxSupplierEntity supplier) {
		nxSupplierService.update(supplier);
		return R.ok();
	}



	@RequestMapping(value = "/getCommerceSupplier/{commerceId}")
	@ResponseBody
	public R comGetCommerceSupplier(@PathVariable Integer commerceId) {
	    List<NxSupplierEntity> supplierEntities  = nxECommerceSupplierService.queryCommerceSupplierByComId(commerceId);
	    return R.ok().put("data", supplierEntities);
	}
	
}
