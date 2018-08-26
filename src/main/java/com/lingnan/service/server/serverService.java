package com.lingnan.service.server;

import com.lingnan.bean.Server;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created By HongJei Lee on 2018/8/26
 */
public interface serverService {

    String setIP(HttpServletRequest request);

    List<Server> findAll();

}
