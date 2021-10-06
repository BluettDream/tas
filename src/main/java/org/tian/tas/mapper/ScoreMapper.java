package org.tian.tas.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.tian.tas.entity.Score;

/**
 * @Entity org.tian.tas.entity.Score
 */
@Mapper
public interface ScoreMapper extends BaseMapper<Score> {

    //根据课程编号和学生学号查询分数表信息
    Score selectByCNumAndSName(String courseNum,Integer studentNum);
}




