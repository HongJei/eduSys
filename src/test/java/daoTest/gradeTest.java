package daoTest;

import com.lingnan.bean.College;
import com.lingnan.bean.Grade;
import com.lingnan.dao.college.collegeDao;
import com.lingnan.dao.grade.gradeDao;
import com.lingnan.service.college.collegeService;
import com.lingnan.service.grade.gradeService;
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
public class gradeTest {

    @Autowired
    private gradeService gs;
    @Autowired
    private gradeDao gd;

    @Test
    public void findAll(){
        List<Grade> all = gs.findAll();
        System.out.println("all = " + all);
    }


}
