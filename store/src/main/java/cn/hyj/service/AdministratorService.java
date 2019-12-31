package cn.hyj.service;

import cn.hyj.entity.Administrator;

/**
 * 管理员业务逻辑层
 */
public interface AdministratorService {

    //登录验证
    Administrator queryAdmin(String adminName,String password);

    //修改密码
    void changePassword(Integer id,String password);
}
