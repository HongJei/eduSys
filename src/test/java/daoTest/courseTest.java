package daoTest;

import com.lingnan.bean.College;
import com.lingnan.bean.Course;
import com.lingnan.dao.college.collegeDao;
import com.lingnan.dao.course.courseDao;
import com.lingnan.service.college.collegeService;
import com.lingnan.service.course.courseService;
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
public class courseTest {
    
    @Autowired
    private courseService cs;
    @Autowired
    private courseDao cd;

    @Test
    public void findById(){
        String course_no = "SSSSS1";
        Course byId = cd.findById(course_no);
        System.out.println("byId = " + byId);

    }


}
