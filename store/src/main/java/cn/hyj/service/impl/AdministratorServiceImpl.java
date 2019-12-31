package cn.hyj.service.impl;

import cn.hyj.entity.Administrator;
import cn.hyj.mapper.AdministratorMapper;
import cn.hyj.service.AdministratorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 管理员业务逻辑实现层
 */
@Service
public class AdministratorServiceImpl implements AdministratorService{

    @Autowired
    private AdministratorMapper administratorMapper;

    @Override
    public Administrator queryAdmin(String adminName, String password) {
        //登录验证
        return administratorMapper.queryAdmin(adminName,password);
    }

    @Override
    public void changePassword(Integer id,String password) {
        //修改密码
        administratorMapper.changePassword(id,password);
    }
}

