package cn.hyj.mapper;

import cn.hyj.entity.Administrator;

public interface AdministratorMapper {
    int insert(Administrator record);

    int insertSelective(Administrator record);
}