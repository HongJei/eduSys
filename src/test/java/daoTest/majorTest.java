package daoTest;

import com.lingnan.bean.College;
import com.lingnan.bean.Major;
import com.lingnan.dao.major.majorDao;
import com.lingnan.service.major.majorService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.Map;

/**
 * Created By HongJei Lee on 2018/8/20
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("/spring-main.xml")
public class majorTest {

    @Autowired
    private majorDao md;
    @Autowired
    private majorService ms;

    @Test
    public void updateStatus(){
        Map<String,Object> map = new HashMap<>();
        map.put("major_no",708);
        map.put("status",1);
        md.updateStatus(map);
    }

    @Test
    public void addMajor(){
        int major_no = 709;
        Major major = new Major("709","测试","07",1);
        for (int i = 0;i<5;i++){
            major_no++;
            ms.addMajor(major);
            major.setMajor_no(String.valueOf(major_no));
        }
    }

    @Test
    public void delById(){
        String id = "713";
        ms.delById(id);

    }

}
