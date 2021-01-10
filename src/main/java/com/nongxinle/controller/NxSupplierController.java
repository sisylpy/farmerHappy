package com.nongxinle.controller;

/**
 * 
 *
 * @author lpy
 * @date 05-11 11:26
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxSupplierEntity;
import com.nongxinle.service.NxSupplierService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;


@RestController
@RequestMapping("api/nxsupplier")
public class NxSupplierController {

	@Autowired
	private NxSupplierService nxSupplierService;


	@RequestMapping(value = "/saveSupplier", method = RequestMethod.POST)
	@ResponseBody
	public R saveSuppiler (@RequestBody NxSupplierEntity supplier) {
	    nxSupplierService.save(supplier);
	    return R.ok();
	}


	@RequestMapping(value = "/editSupplier", method = RequestMethod.POST)
	@ResponseBody
	public R editSupplier (@RequestBody NxSupplierEntity supplier) {
	    nxSupplierService.update(supplier);
	    return R.ok();
	}


}
