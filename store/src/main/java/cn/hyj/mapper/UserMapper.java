package cn.hyj.mapper;

import cn.hyj.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    //登录验证
    User userLoginVerify(@Param("username")String username,@Param("password")String password);

    //查询邮箱
    Boolean queryUserByEmail(String email);

    // 根据邮箱更新用户密码
    public void resettingUserPasswordByEmail(String email, String password);

    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}