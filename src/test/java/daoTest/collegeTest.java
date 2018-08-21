package daoTest;

import com.lingnan.bean.College;
import com.lingnan.dao.college.collegeDao;
import com.lingnan.service.college.collegeService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Array;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created By HongJei Lee on 2018/8/17
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring-main.xml")
public class collegeTest {

    ApplicationContext context;
    @Autowired
    private collegeService cs;
    @Autowired
    private collegeDao cd;



    @Test
    public void findAll(){
        List<College> all = cs.findAll();
        System.out.println("all = " + all);
    }

    @Test
    public void addCollege(){
        int college_no = 13;
        College college = new College("13","测试",11,11,1,1);
        for (int i = 0;i<5;i++){
            college_no++;
            cs.addCollege(college);
            college.setCollege_no(String.valueOf(college_no));
        }
    }
    
    @Test
    public void delByColId(){
        System.out.println("cs.delByColId(111111) = " + cs.delByColId("15"));
    }

    @Test
    public void updateStatus(){
        System.out.println("cs.updateStatus(1,0) = " + cs.updateStatus("1",0));
    }

    @Test
    public void delByIds(){
        int colIds[] = new int[5];
        colIds[0] = 15;
        colIds[1] = 16;
        colIds[2] = 17;
        colIds[3] = 18;
        colIds[4] = 19;
        cd.delByColIds(colIds);
    }

    @Test
    public void doUpdate(){
        College college = new College("16","测试更新",11,11,1,1);
        cd.updateCollege(college);
    }


}
