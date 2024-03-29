package com.chq.hms.validation;

import com.chq.hms.anno.AvailableStatus;
import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;

//ConstraintValidator<给哪个注解提供校验规则,校验的数据类型>
public class OrderStatusValidation implements ConstraintValidator<AvailableStatus, String> {
    /**
     * @param value                      将来要校验的数据
     * @param constraintValidatorContext context in which the constraint is evaluated
     * @return true:通过;false:不通过;
     */
    @Override
    public boolean isValid(String value, ConstraintValidatorContext constraintValidatorContext) {
        //提供校验规则
        if (value == null) {
            return false;
        }
        // 已取消就是退款了
        return value.equals("已预订") || value.equals("入住中") || value.equals("已退房") || value.equals("已取消");
    }
}

