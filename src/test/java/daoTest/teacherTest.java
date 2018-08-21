package daoTest;

import com.lingnan.bean.Teacher;
import com.lingnan.dao.teacher.teacherDao;
import com.lingnan.service.teacher.teacherService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

/**
 * Created By HongJei Lee on 2018/8/21
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring-main.xml")
public class teacherTest {

    @Autowired
    private teacherDao td;
    @Autowired
    private teacherService ts;
    
    @Test
    public void findAll(){
        List<Teacher> all = ts.findAll();
        System.out.println("all = " + all);
    }

}
