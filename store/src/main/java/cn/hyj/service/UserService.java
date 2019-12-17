package cn.hyj.service;


import cn.hyj.entity.User;

/**
 * 用户业务逻辑层
 *
 * @author Administrator
 *
 */
public interface UserService {
	/**
	 *
	 * @param username
	 *            用户名
	 * @param password
	 *            密码
	 * @return 用户/商家
	 */
	public User userLoginVerify(String username, String password);

	/**
	 * 用户/商家 注册
	 */
	public void userRegister(User user);

	/**
	 * 用户/商家 修改信息
	 */
	public void userUpdateInformation(User user);

	/**
	 * 按id查询用户信息
	 *
	 * @param userId
	 * @return
	 */
	public User queryUserInfoById(Integer userId);
	/**
	 * 查询用户邮箱是否存在
	 * @param email
	 * @return 存在为：false 不存在为：true
	 */
	public Boolean queryUserByEmail(String email);
	/**
	 * 查询用户名是否存在
	 * @param name
	 * @return 存在为：false 不存在为：true
	 */
	public Boolean queryUserByName(String name);
	/**
	 * 根据邮箱更新用户密码
	 * @param email
	 * @param password
	 */
	public void resettingUserPasswordByEmail(String email, String password);
}
