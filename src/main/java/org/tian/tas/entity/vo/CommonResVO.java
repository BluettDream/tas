package org.tian.tas.entity.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author tianmh
 * @date create by 2021/10/22 11:35
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommonResVO<T> implements Serializable {
    private static final long serialVersionUID = 121851813139103990L;
    private Integer code;   //浏览器标识码
    private String status;  //浏览器状态
    private T data;         //数据

    public CommonResVO(Integer code, String status) {
        this.code = code;
        this.status = status;
    }
}
