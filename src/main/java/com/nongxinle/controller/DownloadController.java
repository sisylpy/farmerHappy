package com.nongxinle.controller;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

@Controller
public class DownloadController {


    @RequestMapping(value = "/wx/downLoadNumber1/{value}")
    public ResponseEntity downLoadNumber1 (@PathVariable String value, HttpSession session) throws Exception {

        System.out.println("nihao");

        //1,获取文件路径
        ServletContext servletContext = session.getServletContext();
        String realPath = servletContext.getRealPath("numberRecord/" + value + ".mp3");

        System.out.println("kaknakreailpathaaa" + value);
        System.out.println(realPath);

        //2,把文件读取程序当中
        InputStream io = new FileInputStream(realPath);
        byte[] body = new byte[io.available()];
        io.read(body);

        //3,创建相应头
        HttpHeaders httpHeaders = new HttpHeaders();
        System.out.println(httpHeaders);
        httpHeaders.add("Content-Disposition","attachment; filename=" +  value +".mp3");
        httpHeaders.add("Content-Type","audio/mpeg");
        ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(body, httpHeaders, HttpStatus.OK);
        System.out.println("---0000000=-========" +httpHeaders);
        System.out.println(responseEntity);
        return responseEntity;


    }



    @RequestMapping(value = "/wx/downLoadNumber/{value}")
    public ResponseEntity<byte[]> downLoadNumber (@PathVariable String value, HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        File file = null;
        HttpHeaders headers =null;

        System.out.println("nihao");

        //1,获取文件路径
        ServletContext servletContext = session.getServletContext();
        String realPath = servletContext.getRealPath("numberRecord/" + value + ".mp3");

        System.out.println("kaknakreailpathaaa" + value);
        System.out.println(realPath);

        try {
            System.out.println(realPath);//myfiles
            file =new File(realPath);
            //请求头
            headers =new HttpHeaders();
            String filename = value + ".mp3";
            String fileName1 =new String(filename.getBytes("UTF-8"),"iso-8859-1");//解决文件名乱码
            //通知浏览器以attachment（下载方式）打开图片
            headers.setContentDispositionFormData("attachment",fileName1);
            //application/octet-stream二进制流数据（最常见的文件下载）。
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),headers, HttpStatus.OK);

    }


    @RequestMapping(value = "/wx/downLoadImg/{value}")
    public ResponseEntity downLoadImg (@PathVariable String value, HttpSession session) throws Exception {

        System.out.println("nihao");

        //1,获取文件路径
        ServletContext servletContext = session.getServletContext();
        String realPath = servletContext.getRealPath("uploadImage/r.jpg");


        //2,把文件读取程序当中
        InputStream io = new FileInputStream(realPath);
        byte[] body = new byte[io.available()];
        io.read(body);
      
        //3,创建相应头
        HttpHeaders httpHeaders = new HttpHeaders();
        System.out.println(httpHeaders);

        httpHeaders.add("Content-Disposition","attachment; filename=" +  value +".jpg");
        httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);

        ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(body, httpHeaders, HttpStatus.OK);

        return responseEntity;
    }



}
