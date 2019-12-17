package cn.hyj.service.impl;

import cn.hyj.entity.User;
import cn.hyj.mapper.UserMapper;
import cn.hyj.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 用户业务逻辑实现层
 *
 * @author Administrator
 *
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User userLoginVerify(String username, String password) {
        return userMapper.userLoginVerify(username,password);
    }

    @Override
    public void userRegister(User user) {
        userMapper.insert(user);
    }

    @Override
    public void userUpdateInformation(User user) {

    }

    @Override
    public User queryUserInfoById(Integer userId) {
        return null;
    }

    @Override
    public Boolean queryUserByEmail(String email) {
        return null;
    }

    @Override
    public Boolean queryUserByName(String name) {
        return null;
    }

    @Override
    public void resettingUserPasswordByEmail(String email, String password) {

    }
}
