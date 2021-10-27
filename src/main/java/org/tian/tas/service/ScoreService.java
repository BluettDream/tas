package org.tian.tas.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.tian.tas.entity.Score;
import org.tian.tas.entity.vo.ScoreReportVO;

import java.util.List;

/**
 *
 */
public interface ScoreService extends IService<Score> {

    //根据课程编号和学生学号查询分数表信息
    Score selectByCNumAndSName(String courseNum, Integer studentNum);

    //获取学生成绩信息
    List<ScoreReportVO> selectScoreReport(Integer studentNum, Integer teacherNum);

    //根据id更新成绩
    Boolean updateById(Integer id,Double score);

    Double selectAverageScore(Integer studentNum,Integer teacherNum);
}
