package com.lingnan.dao.server;

import com.lingnan.bean.Major;
import com.lingnan.bean.Server;

import java.util.List;
import java.util.Map;

/**
 * Created By HongJei Lee on 2018/8/19
 */
public interface serverDao {

    int newIP(Server server);

    List<Server> findAll();

}
