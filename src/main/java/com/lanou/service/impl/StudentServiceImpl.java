package com.lanou.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.lanou.dao.StudentDao;
import com.lanou.pojo.Student;
import com.lanou.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.xml.crypto.Data;
import java.util.Date;
import java.util.List;

/**
 * @author zhaohongliang
 */
@Service
@Transactional
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentDao studentDao;

    @Override
    public PageInfo<Student> findstudent(int page, int count) {
        PageHelper.startPage(page, count);
        List<Student> studentList = studentDao.selectAll();
        PageInfo<Student> pageInfo = new PageInfo<>(studentList);
        return pageInfo;
    }

    @Override
    public int deleteById(int id) {
        int row = studentDao.deleteByPrimaryKey(id);
        return row;
    }

    @Override
    public int insert(Student student) {
        int row = studentDao.insert(student);
        return row;
    }

    @Override
    public Student selectById(int id) {
        Student student = studentDao.selectByPrimaryKey(id);
        return student;
    }

    @Override
    public int update(Student student) {
        System.out.println(student);
        int row = studentDao.updateByPrimaryKey(student);
        return row;
    }


}
