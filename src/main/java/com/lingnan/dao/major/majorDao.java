package com.lingnan.dao.major;

import com.lingnan.bean.College;
import com.lingnan.bean.Major;

import java.util.List;
import java.util.Map;

/**
 * Created By HongJei Lee on 2018/8/19
 */
public interface majorDao {

    List<Major> findAll();

    int addMajor(Major major);

    int delById(String major_no);

    int updateStatus(Map<String,Object> map);

    int delByIds(int array[]);

    Major getOneMajor(String major_no);

    int updateMajor(Major major);
}
