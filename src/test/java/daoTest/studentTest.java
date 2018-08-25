package daoTest;

import com.lingnan.bean.College;
import com.lingnan.bean.Student;
import com.lingnan.dao.college.collegeDao;
import com.lingnan.dao.student.studentDao;
import com.lingnan.service.college.collegeService;
import com.lingnan.service.student.studentService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created By HongJei Lee on 2018/8/17
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring-main.xml")
public class studentTest {

    @Autowired
    private studentDao sd;
    @Autowired
    private studentService ss;

    @Test
    public void updateStatus(){
        ss.updateStatus("201231000093 ",1);
    }

    @Test
    public void addStudent(){
        Student student = new Student("test","405","test","男","test","2018-08-09",1,"test","1","test","test");
        String j = "test";
        for (int i = 0;i<5;i++){
            ss.addStudent(student);
            j = j + String.valueOf(i);
            student.setRegister_no(j);
        }
    }

    @Test
    public void findById(){
        Student test2 = ss.findById("test2");
        System.out.println("test2.getS_address() = " + test2.getS_address());
    }
    @Test
    public void delById(){
        String test = ss.delById("test");
        System.out.println("test = " + test);
    }
}
