package org.example.entity;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class SectorFormValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return SectorForm.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required.name", "Please enter the name");
        ValidationUtils.rejectIfEmpty(errors, "sectors", "required.sectors", "Please select at least one sector");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "acceptance", "required.acceptance", "Please check and accept the terms");
    }
}
