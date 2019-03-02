package com.lanou.controller;

import com.github.pagehelper.PageInfo;
import com.lanou.pojo.Student;
import com.lanou.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    //没有传值给它默认值1
    //相当于向ress加值
    @RequestMapping("/index")
    public String index(Model model, @RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "count", defaultValue = "5") int count) {

        PageInfo<Student> pageInfo = studentService.findstudent(page, count);
        model.addAttribute("pageInfo", pageInfo);
        return "index";
    }

    @RequestMapping("/toindex")
    public String delect(Model model, @RequestParam(value = "id", defaultValue = "0") int id) {
        int row = studentService.deleteById(id);
        if (row != 1) {
            model.addAttribute("massage", "删除失败");
        }
        return "toIndex";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String insert(Model model, Student student) {
        int row = studentService.insert(student);
        if (row != 1) {
            model.addAttribute("massage", "添加失败");
        } else {
            model.addAttribute("massage", "添加成功");
        }
        return "toIndex";
    }

    @RequestMapping(value = "/toUpdate")
    public String selectById(Model model, @RequestParam(value = "id", defaultValue = "0") int id) {
        System.out.println(id);
        Student student = studentService.selectById(id);
        model.addAttribute("s",student);
        return "insert";
    }

    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String updateById(Model model, Student student,@RequestParam(value = "id", defaultValue = "0") int id) {
        System.out.println(student);
        int row = studentService.update(student);
        if (row != 1) {
            model.addAttribute("massage", "修改失败");
        }else {
            model.addAttribute("massage", "修改成功");
        }
        return "toIndex";
    }
}
