package com.lingnan.dao.college;

import com.lingnan.bean.College;

import java.util.List;
import java.util.Map;

/**
 * Created By HongJei Lee on 2018/8/17
 */
public interface collegeDao {

    List<College> findAll();

    int addCollege(College college);

    int delByColId(String college_no);

    int updateStatus(Map<String,Object> map);

    int delByColIds(int array[]);

    College getOneCol(String college_no);

    int updateCollege(College college);
}
