package cn.hyj.mapper;

import cn.hyj.entity.Administrator;
import org.apache.ibatis.annotations.Param;

public interface AdministratorMapper {

    /**
     * 登录验证
     * @param adminName
     * @param password
     * @return
     */
    Administrator queryAdmin(@Param("adminName") String adminName,@Param("password") String password);

    //修改密码
    void changePassword(@Param("id") Integer id,@Param("password") String password);

    int insert(Administrator record);

    int insertSelective(Administrator record);
}