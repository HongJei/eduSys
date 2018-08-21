package com.lingnan.service.major;

import com.lingnan.bean.College;
import com.lingnan.bean.Major;

import java.util.List;
import java.util.Map;

/**
 * Created By HongJei Lee on 2018/8/17
 */
public interface majorService {

    List<Major> findAll();

    int addMajor(Major major);

    int delById(String major_no);

    int updateStatus(String major_no,int status);

    int delByIds(int array[]);

    Major getOneMajor(String major_no);

    int updateMajor(Major major);

}
