package com.lanou.service;

import com.github.pagehelper.PageInfo;
import com.lanou.pojo.Student;

import java.util.Date;

public interface StudentService {

    PageInfo<Student> findstudent(int page, int count);

    int deleteById(int id);

    int insert(Student student);

    Student selectById(int id);

    int update(Student student);
}
