package org.tian.tas.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.tian.tas.entity.Score;
import org.tian.tas.entity.vo.ScoreReportVO;
import org.tian.tas.mapper.ScoreMapper;
import org.tian.tas.service.ScoreService;

import java.util.List;

/**
 *
 */
@Service
public class ScoreServiceImpl extends ServiceImpl<ScoreMapper, Score>
    implements ScoreService{

    @Autowired
    private ScoreMapper scoreMapper;

    @Override
    public Score selectByCNumAndSName(String courseNum, Integer studentNum) {
        return scoreMapper.selectByCNumAndSName(courseNum,studentNum);
    }

    @Override
    public List<ScoreReportVO> selectScoreReport(Integer studentNum, Integer teacherNum) {
        return scoreMapper.selectScoreReport(studentNum,teacherNum);
    }

    @Override
    public Boolean updateById(Integer id, Double score) {
        return scoreMapper.updateById(id,score);
    }
}




