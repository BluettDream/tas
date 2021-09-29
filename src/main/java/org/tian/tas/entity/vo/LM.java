package org.tian.tas.entity.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author blue
 * @date 2021/9/29 12:53
 */
@Data
@NoArgsConstructor
public class LM {
    private Integer id;
    private String sender;
    private String receiver;
    private String date;
    private String title;
    private String content;
}
