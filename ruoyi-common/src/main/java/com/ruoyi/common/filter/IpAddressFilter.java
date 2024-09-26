package com.ruoyi.common.filter;

import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.ip.IpUtils;
import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.List;

public class IpAddressFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException
    {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException
    {
        String requestIp = IpUtils.getIpAddr();
//        System.out.println("requestIp : " + requestIp );
//        //TODO 本地执行请注释掉这段代码
//        if(StringUtils.equals(requestIp,"127.0.0.1")){
//            // 如果请求头不存在或值不正确，可以返回错误响应
//            HttpServletResponse httpResponse = (HttpServletResponse) response;
//            httpResponse.setStatus(HttpServletResponse.SC_PROXY_AUTHENTICATION_REQUIRED);
//            httpResponse.setCharacterEncoding("utf-8");
//            httpResponse.getWriter().write("网站维护中！！！");
//            return; // 阻止链中的下一个过滤器或servlet执行
//        }

//        String requestCity = getAddressCity(requestIp);
//        List<String> noAllowedCities = Arrays.asList("深圳市","广州市","韶关市");
//
//        if(noAllowedCities.contains(requestCity)){
//            // 如果请求头不存在或值不正确，可以返回错误响应
//            HttpServletResponse httpResponse = (HttpServletResponse) response;
//            httpResponse.setStatus(HttpServletResponse.SC_PROXY_AUTHENTICATION_REQUIRED);
//            httpResponse.setCharacterEncoding("utf-8");
//            httpResponse.getWriter().write("网站维护中！！！");
//            return; // 阻止链中的下一个过滤器或servlet执行
//        }
        chain.doFilter(request, response);
    }


    /**
     * 通过调用接口根据ip获取归属地
     */
    public String getAddressCity(String ip) {
        try {
            URL realUrl = new URL("https://restapi.amap.com/v3/ip?ip=" + ip + "&key=47853865f4a1f0095852f0e0debec6d7");
//            URL realUrl = new URL("https://restapi.amap.com/v3/ip?ip=14.127.255.255&key=47853865f4a1f0095852f0e0debec6d7");
            HttpURLConnection conn = (HttpURLConnection) realUrl.openConnection();
            conn.setRequestMethod("GET");
            conn.setUseCaches(false);
            conn.setReadTimeout(6000);
            conn.setConnectTimeout(6000);
            conn.setInstanceFollowRedirects(false);
            int code = conn.getResponseCode();
            StringBuilder sb = new StringBuilder();
            String ipaddrCity = "";
            if (code == 200) {
                InputStream in = conn.getInputStream();
                BufferedReader reader = new BufferedReader(new InputStreamReader(in));
                String line;
                while ((line = reader.readLine()) != null) {
                    sb.append(line);
                }
                JSONObject resultJson = JSONObject.parseObject(sb.toString());
                if(resultJson != null){
                    ipaddrCity = resultJson.getString("city");
                }
            }
            return ipaddrCity;
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }
}
