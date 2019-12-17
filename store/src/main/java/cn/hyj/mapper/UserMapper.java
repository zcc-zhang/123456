package cn.hyj.mapper;

import cn.hyj.entity.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    User userLoginVerify(@Param("username")String username,@Param("password")String password);

    int deleteByPrimaryKey(Integer userId);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}