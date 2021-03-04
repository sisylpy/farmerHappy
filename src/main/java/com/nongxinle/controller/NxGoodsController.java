package com.nongxinle.controller;

/**
 * @author lpy
 * @date 2020-02-10 19:43:11
 */

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nongxinle.entity.NxCommunityGoodsEntity;
import com.nongxinle.entity.NxStandardEntity;
import com.nongxinle.service.NxCommunityGoodsService;
import com.nongxinle.service.NxStandardService;
import com.nongxinle.utils.UploadFile;
import org.apache.commons.io.IOUtils;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.nongxinle.entity.NxGoodsEntity;
import com.nongxinle.service.NxGoodsService;
import com.nongxinle.utils.PageUtils;
import com.nongxinle.utils.R;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static com.nongxinle.utils.PinYin4jUtils.*;


@RestController
@RequestMapping("api/nxgoods")
public class NxGoodsController {
    @Autowired
    private NxGoodsService nxGoodsService;

    @Autowired
    private NxCommunityGoodsService dgService;

    @Autowired
    private NxStandardService standardService;


    /**
     * ADMIN
     * 获取nxGoods树
     *
     * @return nxGoods大类
     */
    @RequestMapping(value = "/adminGetGoodsTree")
    @ResponseBody
    public R adminGetGoodsTree() {
        List<NxGoodsEntity> entities = nxGoodsService.queryGoodsTree();

        return R.ok().put("data", entities);
    }

    @RequestMapping(value = "/adminGetNxGoodsByFatherId", method = RequestMethod.POST)
    @ResponseBody
    public R adminGetNxGoodsByFatherId(Integer limit, Integer page, Integer fatherId) {
        Map<String, Object> map = new HashMap<>();
        map.put("offset", (page - 1) * limit);
        map.put("limit", limit);
        map.put("fatherId", fatherId);

        List<NxGoodsEntity> nxGoodsEntities = nxGoodsService.queryNxGoodsByParams(map);
        int total = nxGoodsService.queryTotalByFatherId(fatherId);
        PageUtils pageUtil = new PageUtils(nxGoodsEntities, total, limit, page);

        return R.ok().put("page", pageUtil);
    }


    /**
     * 删除nxGoods
     *
     * @param goodsId goodsId
     * @return ok
     */
    @RequestMapping(value = "/deleteGoods/{goodsId}")
    @ResponseBody
    public R deleteGoods(@PathVariable Integer goodsId) {
        nxGoodsService.delete(goodsId);
        return R.ok();
    }


    /**
     * 查询nxGoods
     *
     * @param nxGoodsId id
     * @return nxGoods
     */
    @RequestMapping(value = "/getNxGoodsInfo/{nxGoodsId}")
    @ResponseBody
    public R getNxGoodsInfo(@PathVariable Integer nxGoodsId) {
        return R.ok().put("data", nxGoodsService.queryObject(nxGoodsId));
    }

    /**
     * 更新商品
     *
     * @param goods nxGoods
     * @return ok
     */
    @RequestMapping(value = "/editNxGoods", method = RequestMethod.POST)
    @ResponseBody
    public R editNxGoods(@RequestBody NxGoodsEntity goods) {
        String goodsName = goods.getNxGoodsName();

        String pinyin = hanziToPinyin(goodsName);
        String headPinyin = getHeadStringByString(goodsName, false, null);
        goods.setNxGoodsPinyin(pinyin);
        goods.setNxGoodsPy(headPinyin);
        nxGoodsService.update(goods);

        //修改comGoods

        return R.ok();
    }


    /**
     * 保存商品
     *
     * @param goods nxGoods
     * @return ok
     */
    @RequestMapping(value = "/saveNxGoods", method = RequestMethod.POST)
    @ResponseBody
    public R saveNxGoods(@RequestBody NxGoodsEntity goods) {
        String goodsName = goods.getNxGoodsName();
        String nxGoodsDetail = goods.getNxGoodsDetail();
        String nxGoodsBrand = goods.getNxGoodsBrand();

        Map<String, Object> map = new HashMap<>();
        map.put("goodsName", goodsName);
        map.put("goodsDetail", nxGoodsDetail);
        map.put("goodsBrand", nxGoodsBrand);
        List<NxGoodsEntity> goodsEntities = nxGoodsService.queryIfHasSameGoods(map);
        if (goodsEntities.size() > 0) {
            return R.error(-1, "已有相同商品");
        } else {
            String pinyin = hanziToPinyin(goodsName);
            String headPinyin = getHeadStringByString(goodsName, false, null);
            goods.setNxGoodsPinyin(pinyin);
            goods.setNxGoodsPy(headPinyin);
            nxGoodsService.save(goods);
            return R.ok();
        }
    }


    /**
     * 搜索ibook
     *
     * @param str 搜索词
     * @return 搜索结果
     */
    @RequestMapping(value = "/queryGoodsByQuickSearch/{str}")
    @ResponseBody
    public R queryGoodsByQuickSearch(@PathVariable String str) {
        List<NxGoodsEntity> goodsEntities = nxGoodsService.queryQuickSearchNxGoods(str);
        return R.ok().put("data", goodsEntities);
    }

    /**
     * 在类别下搜索商品
     *
     * @param fatherId  父级id
     * @param searchStr 搜索词
     * @return 批发商商品
     */
    @RequestMapping(value = "/queryCategoryGoodsByQuickSearch", method = RequestMethod.POST)
    @ResponseBody
    public R queryCategoryGoodsByQuickSearch(Integer fatherId, String searchStr) {
        System.out.println(searchStr + "seachstrrr");
        Map<String, Object> map = new HashMap<>();
        map.put("fatherId", fatherId);
        map.put("searchStr", searchStr);
        List<NxGoodsEntity> goodsEntities = nxGoodsService.queryQuickSearchNxCategoryGoods(map);
        return R.ok().put("data", goodsEntities);
    }


    /**
     * ok
     * 获取ibook书皮数据
     *
     * @return 封皮数据
     */
    @RequestMapping(value = "/getiBookCover")
    @ResponseBody
    public R getiBookCover() {

        List<NxGoodsEntity> nxGoodsEntities = nxGoodsService.getiBookCoverData();

        for (NxGoodsEntity goods : nxGoodsEntities) {
            if (goods.getNxGoodsId().equals(1)) {
                goods.setColor("#20afb8");
            }
            if (goods.getNxGoodsId().equals(2)) {
                goods.setColor("#f5c832");
            }
            if (goods.getNxGoodsId().equals(3)) {
                goods.setColor("#3cc36e");
            }
            if (goods.getNxGoodsId().equals(4)) {
                goods.setColor("#1ebaee");
            }
            if (goods.getNxGoodsId().equals(5)) {
                goods.setColor("#f09628");
            }
            if (goods.getNxGoodsId().equals(6)) {
                goods.setColor("#f05a32");
            }
            if (goods.getNxGoodsId().equals(7)) {
                goods.setColor("#20afb8");
            }
            if (goods.getNxGoodsId().equals(8)) {
                goods.setColor("#969696");
            }
        }

        return R.ok().put("data", nxGoodsEntities);
    }


    /**
     * ibook大类列表
     *
     * @param fatherId 父级id
     * @return 商品列表
     */
    @RequestMapping(value = "/getGoodsSubNamesByFatherId/{fatherId}")
    @ResponseBody
    public R getGoodsSubNamesByFatherid(@PathVariable Integer fatherId) {

        Map<String, Object> map = new HashMap<>();
        map.put("fatherId", fatherId);
        List<NxGoodsEntity> goodsEntities1 = nxGoodsService.queryNxGoodsOrderByGoodsId(map);

        List<NxGoodsEntity> newList = new ArrayList<>();

        for (NxGoodsEntity fatherGoods : goodsEntities1) {
            StringBuilder builder = new StringBuilder();

            List<NxGoodsEntity> goodsEntities = nxGoodsService.querySubNameByFatherId(fatherGoods.getNxGoodsId());
            for (NxGoodsEntity goods : goodsEntities) {
                String nxGoodsName = goods.getNxGoodsName();
                builder.append(nxGoodsName);
                builder.append(',');
            }
            fatherGoods.setNxGoodsSubNames(builder.toString());
            newList.add(fatherGoods);
        }


        return R.ok().put("data", newList);
    }


    @RequestMapping(value = "/adminGetTypeGoodsCata/{type}")
    @ResponseBody
    public R adminGetTypeGoodsCata(@PathVariable Integer type) {
        List<NxGoodsEntity> goodsEntities = nxGoodsService.queryGoodsCataByType(type);
        return R.ok().put("data", goodsEntities);
    }


    @RequestMapping(value = "/getAddCommunityGoods", method = RequestMethod.POST)
    @ResponseBody
    public R getAddCommunityGoods(Integer limit, Integer page, Integer fatherId, Integer communityId) {
        System.out.println("hen");
        Map<String, Object> map1 = new HashMap<>();
        map1.put("offset", (page - 1) * limit);
        map1.put("limit", limit);
        map1.put("fatherId", fatherId);
        List<NxGoodsEntity> nxGoodsEntities1 = nxGoodsService.queryNxGoodsByParams(map1);

        List<NxGoodsEntity> goodsEntities = new ArrayList<>();

        for (NxGoodsEntity goods : nxGoodsEntities1) {
            Map<String, Object> map = new HashMap<>();
            map.put("communityId", communityId);
            map.put("goodsId", goods.getNxGoodsId());
            List<NxCommunityGoodsEntity> dgGoods = dgService.queryCommunityDownloadGoods(map);
            Integer nxGoodsId = goods.getNxGoodsId();
            List<NxStandardEntity> standardEntities = standardService.queryGoodsStandardListByGoodId(nxGoodsId);
            goods.setNxGoodsStandardEntities(standardEntities);

            if (dgGoods.size() > 0) {
                goods.setIsDownload(1);
                goodsEntities.add(goods);
            } else {
                goods.setIsDownload(0);
                goodsEntities.add(goods);
            }
        }

        int total = nxGoodsService.queryTotalByFatherId(fatherId);
        PageUtils pageUtil = new PageUtils(goodsEntities, total, limit, page);
        return R.ok().put("page", pageUtil);
    }


    /**
     * ok
     * sign获取电子牌商品
     * @param limit 最大
     * @param page 第几页
     * @param fatherId 上级id
     * @return 商品
     * todo 暂停disGoods的概念
     */
//    @RequestMapping(value = "/getIbookGoodsByFatherId", method = RequestMethod.POST)
//    @ResponseBody
//    public R getGoodsByFatherId(Integer limit, Integer page, Integer fatherId, Integer disId) {
//
//        List<NxGoodsEntity> nxGoodsEntities1 = queryByFatherIdwithLimit(limit, page, fatherId);
//
//        List<NxGoodsEntity> goodsEntities = new ArrayList<>();
//
//        for (NxGoodsEntity goods : nxGoodsEntities1) {
//            Map<String, Object> map = new HashMap<>();
//            map.put("disId", disId);
//            map.put("goodsId", goods.getNxGoodsId());
//           List<NxCommunityGoodsEntity> dgGoods = dgService.queryDisDownloadGoods(map);
//            Integer nxGoodsId = goods.getNxGoodsId();
//            List<NxStandardEntity> standardEntities =  standardService.queryGoodsStandardListByGoodId(nxGoodsId);
//            goods.setNxGoodsStandardEntities(standardEntities);
//
//            if(dgGoods.size() > 0) {
//               goods.setIsDownload(1);
//               goodsEntities.add(goods);
//           }else {
//               goods.setIsDownload(0);
//               goodsEntities.add(goods);
//           }
//        }
//
//        int total = nxGoodsService.queryTotalByFatherId(fatherId);
//        PageUtils pageUtil = new PageUtils(goodsEntities, total, limit, page);
//
//        return R.ok().put("page", pageUtil);
//
//    }


    /**
     * todo testPage
     *
     * @param fatherId
     * @return
     */
    @RequestMapping(value = "/getiBookFatherGoodsAndInitPage/{fatherId}")
    @ResponseBody
    public R nxGoodsCateList(@PathVariable Integer fatherId) {
        List<NxGoodsEntity> nxGoodsEntities = nxGoodsService.getAllFatherGoods(fatherId);

        NxGoodsEntity nxGoodsEntity = nxGoodsEntities.get(0);
        Integer nxGoodsId = nxGoodsEntity.getNxGoodsId();
        List<NxGoodsEntity> nxGoodsEntities1 = queryList(nxGoodsId);
        Map<String, Object> map = new HashMap<>();
        map.put("fatherList", nxGoodsEntities);
        map.put("initGoods", nxGoodsEntities1);
        return R.ok().put("data", map);
    }


    @RequestMapping(value = "/getFatherGoods/{fatherId}")
    @ResponseBody
    public R getFatherGoods(@PathVariable Integer fatherId) {
        Map<String, Object> map = new HashMap<>();
        map.put("fatherId", fatherId);

        //查询列表数据
        List<NxGoodsEntity> nxGoodsEntities = nxGoodsService.queryListWithFatherId(map);
        return R.ok().put("data",nxGoodsEntities) ;

    }
    public List<NxGoodsEntity> queryList(Integer fatherId) {
        Map<String, Object> map = new HashMap<>();
//        map.put("offset", 0);
//        map.put("limit", 20);
        map.put("fatherId", fatherId);

        //查询列表数据
        List<NxGoodsEntity> nxGoodsEntities = nxGoodsService.queryListWithFatherId(map);
        return nxGoodsEntities;

    }

    /**
     * todo testData
     * @param page
     * @param limit
     * @return
     */
//    @ResponseBody
//    @RequestMapping(value = "/getCatalogue", method = RequestMethod.POST)
//    public R getCatalogue(Integer page, Integer limit) {
//        Map<String, Object> map = new HashMap<>();
//        map.put("offset", (page - 1) * limit);
//        map.put("limit", limit);
//        List<NxGoodsEntity> nxGoodsEntities1 = nxGoodsService.queryList(map);
//        for (NxGoodsEntity goods : nxGoodsEntities1) {
//            List<NxGoodsEntity> nxGoodsEntityList = goods.getNxGoodsEntityList();
//            for (NxGoodsEntity goods2: nxGoodsEntityList) {
//                String nxGoodsFile = goods2.getNxGoodsFile();
//                System.out.println(nxGoodsFile + "------");
//            }
//        }
//
//
//        return R.ok().put("data", nxGoodsEntities1);
//
//    }

    /**
     * 导出excel
     *
     * @param response
     */
    @RequestMapping("/downloadExcel")
    @ResponseBody
    public void downloadExcel(HttpServletResponse response, HttpServletRequest request) {

        String fatherId = request.getParameter("fatherId");
        System.out.println("fatherIdfatherId"+fatherId);

        try {
            Map<String, Object> map = new HashMap<>();
            map.put("fatherId", fatherId);
            List<NxGoodsEntity> ckGoodsEntities = nxGoodsService.queryNxGoodsByParams(map);
            HSSFWorkbook wb = new HSSFWorkbook();
            NxGoodsEntity nxGoodsEntity = nxGoodsService.queryObject(Integer.valueOf(fatherId));
            String nxGoodsName = nxGoodsEntity.getNxGoodsName();
            HSSFSheet sheet = wb.createSheet(nxGoodsName);

            //设置表头
            HSSFRow row = sheet.createRow(0);

            row.createCell(0).setCellValue("商品id");
            row.createCell(1).setCellValue("商品名称");
            row.createCell(2).setCellValue("父级id");
            row.createCell(3).setCellValue("规格");
            row.createCell(12).setCellValue("商品排序");

            //设置表体
            HSSFRow goodsRow = null;
            for (int i = 0; i < ckGoodsEntities.size(); i++) {
                NxGoodsEntity ckGoodsEntity = ckGoodsEntities.get(i);
                goodsRow = sheet.createRow(i + 1);
                goodsRow.createCell(0).setCellValue(ckGoodsEntity.getNxGoodsId());
                goodsRow.createCell(1).setCellValue(ckGoodsEntity.getNxGoodsName());
                goodsRow.createCell(2).setCellValue(ckGoodsEntity.getNxGoodsFatherId());
                goodsRow.createCell(3).setCellValue(ckGoodsEntity.getNxGoodsStandardname());
//                goodsRow.createCell(4).setCellValue(ckGoodsEntity.getNxGoodsSort());

            }


            String fileName = new String("导出商品.xls".getBytes("utf-8"), "iso8859-1");
            response.setHeader("content-Disposition", "attachment; filename =" + fileName);
            wb.write(response.getOutputStream());

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 下载导入商品的Excel模版
     *
     * @param response no
     * @param session  获取保存文件路径
     */
    @RequestMapping(value = "/downloadExcelTMP", method = RequestMethod.GET)
    @ResponseBody
    public void downloadExcelTMP(HttpServletResponse response, HttpSession session) {

        FileInputStream is = null;

        try {
            String fileName = new String("商品模版.xls".getBytes("utf-8"), "iso8859-1");
            response.setHeader("content-Disposition", "attachment; filename =" + fileName);

            ServletContext servletContext = session.getServletContext();
            String realPath = servletContext.getRealPath("statics/goodsTML.xls");

            is = new FileInputStream(realPath);

            IOUtils.copy(is, response.getOutputStream());

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            if (is != null) {
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }

    /**
     * ok
     * 导入商品
     *
     * @param file    xls文件
     * @param session http
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/uploadExcel", produces = "text/html;charset=UTF-8")
    @ResponseBody
    public R uploadExcel(@RequestParam("file") MultipartFile file,
                         HttpSession session) throws Exception {
        System.out.println(file.getName());
        HSSFWorkbook wb = new HSSFWorkbook(file.getInputStream());

        HSSFSheet sheet = null;
        for (int j = 0; j < wb.getNumberOfSheets(); j++) {
            sheet = wb.getSheetAt(j);

            int lastRowNum = sheet.getLastRowNum();

            Row goodsRow = null;

            for (int i = 1; i <= lastRowNum; i++) {

                goodsRow = sheet.getRow(i);
                NxGoodsEntity goods = new NxGoodsEntity();
                String goodsName = (String) getCellValue(goodsRow.getCell(1));
                String pinyin = hanziToPinyin(goodsName);
                String headPinyin = getHeadStringByString(goodsName, false, null);
                goods.setNxGoodsPinyin(pinyin);
                goods.setNxGoodsPy(headPinyin);

                goods.setNxGoodsSort((Integer) getCellValue(goodsRow.getCell(0)));
                goods.setNxGoodsName((String) getCellValue(goodsRow.getCell(1)));
                goods.setNxGoodsFatherId((Integer) getCellValue(goodsRow.getCell(2)));
                goods.setNxGoodsStandardname((String) getCellValue(goodsRow.getCell(3)));
                goods.setNxGoodsPlace((String) getCellValue(goodsRow.getCell(4)));
                goods.setNxGoodsBrand((String) getCellValue(goodsRow.getCell(5)));

                nxGoodsService.save(goods);
            }
        }

        return R.ok();

    }


    private Object getCellValue(Cell cell) {

        switch (cell.getCellType()) {
            case STRING:
                return cell.getRichStringCellValue().getString();
            case NUMERIC:
                if (DateUtil.isCellDateFormatted(cell)) {
                    return cell.getDateCellValue();
                } else {
                    double numericCellValue = cell.getNumericCellValue();
                    String s = String.valueOf(numericCellValue);
                    int i1 = Integer.parseInt(s.replace(".0", ""));
                    return i1;
                }
            case BOOLEAN:
                return cell.getBooleanCellValue();
            case FORMULA:
                return cell.getCellFormula();
        }

        return cell;

    }


    /**
     * wait
     * ============
     */

    /**
     * 信息
     */
    @ResponseBody
    @RequestMapping(value = "/info/{nxGoodsId}")
    public R info(@PathVariable Integer nxGoodsId) {
        NxGoodsEntity nxGoods = nxGoodsService.queryObject(nxGoodsId);
        return R.ok().put("data", nxGoods);
    }

    /**
     * 保存
     */
    @ResponseBody
    @RequestMapping(value = "/save", produces = "text/html;charset=UTF-8")
//    @RequiresPermissions("nxgoods:save")
    public R save(@RequestParam("file") MultipartFile file, @RequestParam("nxGoodsName") String goodsName,
                  @RequestParam("nxGoodsStandardName") String nxGoodsStandardName,
                  @RequestParam("nxGoodsId") Integer nxGoodsId, @RequestParam("nxGoodsFatherId") Integer nxGoodsFatherId,
                  HttpSession session) {
        System.out.println("hahhah");
        System.out.println(file);
        System.out.println(goodsName);
        System.out.println(nxGoodsStandardName);

        System.out.println(nxGoodsId);

        //1,上传图片
        String newUploadName = "goodsImage";
        String realPath = UploadFile.upload(session, newUploadName, file);

        String filename = file.getOriginalFilename();
        String filePath = newUploadName + "/" + filename;

        if (nxGoodsId.equals(-1)) {
            NxGoodsEntity goodsEntity = new NxGoodsEntity();
            goodsEntity.setNxGoodsFile(filePath);
            goodsEntity.setNxGoodsName(goodsName);
            goodsEntity.setNxGoodsStandardname(nxGoodsStandardName);
            goodsEntity.setNxGoodsFatherId(nxGoodsFatherId);
            nxGoodsService.save(goodsEntity);
        } else {

        }

        return R.ok();
    }


}
