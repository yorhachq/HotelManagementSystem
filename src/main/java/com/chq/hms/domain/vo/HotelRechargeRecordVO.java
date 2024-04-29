package com.chq.hms.domain.vo;

import com.chq.hms.domain.HotelRechargeRecord;
import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper = true)
@Data
public class HotelRechargeRecordVO extends HotelRechargeRecord {
    private String username;
    private String phone;
    private String email;
}
