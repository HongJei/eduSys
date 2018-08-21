package com.lingnan.service.college;

import com.lingnan.bean.College;

import java.util.List;
import java.util.Map;

/**
 * Created By HongJei Lee on 2018/8/17
 */
public interface collegeService {

    List<College> findAll();

    int addCollege(College college);

    int delByColId(String college_no);

    int updateStatus(String college_no,int status);

    int delByColIds(int colIds[]);

    College getOneCol(String college_no);

    int updateCollege(College college);

}
