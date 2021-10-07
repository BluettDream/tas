package org.tian.tas.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author TianMH
 * @date 2021/10/7 17:37
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ScoreReport {
    private Integer id;
    private String realName;
    private String courseName;
    private Double score;
    private String studentClass;
}
