package org.tian.tas.entity.bo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author tianmh
 * @date create by 2021/10/29 10:42
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class EveryMonthMessageBO {
    private int month;
    private Integer value;
}
