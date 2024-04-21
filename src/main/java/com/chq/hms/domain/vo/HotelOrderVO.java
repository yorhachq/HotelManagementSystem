package com.chq.hms.domain.vo;

import com.chq.hms.domain.HotelOrder;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 酒店订单视图对象
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class HotelOrderVO extends HotelOrder {
    private String username;
    private String phone;
    private String gender;
    private Integer roomNumber;
    private String typeName;
    private Integer days;
}
