package com.qutaole.sodirty.service;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

/**
 * 处理微信服务器发送过来的消息
 * Created by hzhuchuanqi on 2017/8/23.
 */
public interface CoreService {

    public String processRequest(HttpServletRequest request);
}
