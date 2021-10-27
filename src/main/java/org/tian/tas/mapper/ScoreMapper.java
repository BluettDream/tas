package org.tian.tas.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.tian.tas.entity.Score;
import org.tian.tas.entity.vo.ScoreReportVO;

import java.util.List;

/**
 * @Entity org.tian.tas.entity.Score
 */
@Mapper
public interface ScoreMapper extends BaseMapper<Score> {

    //根据课程编号和学生学号查询分数表信息
    Score selectByCNumAndSName(String courseNum,Integer studentNum);

    //获取学生成绩信息
    List<ScoreReportVO> selectScoreReport(Integer studentNum, Integer teacherNum);

    //根据id更新成绩
    Boolean updateById(Integer id,Double score);

    //查询学生平均分
    Double selectAverageScore(Integer studentNum,Integer teacherNum);
}




