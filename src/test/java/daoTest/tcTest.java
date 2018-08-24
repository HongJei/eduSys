package daoTest;

import com.lingnan.bean.College;
import com.lingnan.bean.Course;
import com.lingnan.bean.Teacher_Course;
import com.lingnan.dao.college.collegeDao;
import com.lingnan.dao.teacher_course.tcDao;
import com.lingnan.service.college.collegeService;
import com.lingnan.service.teacher_course.tcService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created By HongJei Lee on 2018/8/17
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring-main.xml")
public class tcTest {

    @Autowired
    private tcService tcs;
    @Autowired
    private tcDao tcd;

    @Test
    public void findAll(){
        List<Teacher_Course> all = tcd.findAll();
        System.out.println("all = " + all);
    }

    @Test
    public void addTC(){
        Teacher_Course teacher_course = new Teacher_Course("COM029","010001","2018-09-02",1,"测试",1);
        tcd.addTC(teacher_course);
    }

    @Test
    public void findById(){
        Teacher_Course byId = tcd.findById(146);
        System.out.println("byId = " + byId);
    }




}
