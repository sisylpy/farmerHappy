/**
 * java class
 *
 * @Author: peiyi li
 * @Date: 2020-05-22 08:50
 */


import com.github.wxpay.sdk.WXPay;
import com.github.wxpay.sdk.WXPayUtil;
import com.nongxinle.utils.MyWxPayConfig;
import com.nongxinle.utils.WxPayUtils;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.TimeZone;

import static com.nongxinle.utils.DateUtils.formatWhatDay;
import static com.nongxinle.utils.DateUtils.getWeek;

/**
 *@author lpy
 *@date 2020-05-22 08:50
 */


public class WxPay {

    public static void main(String[] args) throws Exception {


//        String s = new SimpleDateFormat("yyyyMMdd").format(new Date()).toString();
//        System.out.println(s);
//
//        String week = getWeek(2);
//        System.out.println(week);
//        System.out.println(formatWhatDay(0));
//        String nxRbTotal = "12.4";
//        float a = Float.parseFloat(nxRbTotal) * 100;
//        NumberFormat ddf1=NumberFormat.getNumberInstance() ;
//        ddf1.setMaximumFractionDigits(2);
//        String total = ddf1.format(a) ;
//        System.out.println(total);
//        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");//注意月份是MM
//
////        simpleDateFormat.setTimeZone(TimeZone.getTimeZone("GMT+8:00"));
//        Date date = simpleDateFormat.parse("2021-01-17");
//
//
//        System.out.println(date + "date!!!!!!!=========>>>>>>>>>>>>>>>>>>>");
//        String searchStr  = "凉薯" ;
//        for(int i=0;i<searchStr.length();i++){
//            String str = searchStr.substring(i, i+1);
//            boolean matches = str.matches("[\u4E00-\u9FFF]");
//            System.out.println(matches);
//        }

        BigDecimal limit =new BigDecimal("200");
        BigDecimal payToatl =new BigDecimal("20.5");
        int result =   payToatl.compareTo(limit);
        if(result < 0){
            payToatl = payToatl.add(limit);
        }
        System.out.println(payToatl);




    }


}
