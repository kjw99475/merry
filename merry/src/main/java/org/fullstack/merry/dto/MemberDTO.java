package org.fullstack.merry.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MemberDTO {
    private int member_idx;
    @NotBlank(message = "아이디는 필수 입력사항입니다.")
    @Pattern(regexp = "^[a-z0-9]{4,16}", message = "4~16자의 영어 소문자 및 숫자만 입력이 가능합니다.")
    private String member_id;
    @NotBlank(message = "이름은 필수 입력사항입니다.")
    private String name;
    @NotBlank(message = "비밀번호는 필수 입력사항입니다.")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,}", message = "8자 이상의 영문 소문자, 숫자, 특수문자를 조합해 주세요.")
    private String pwd;
    @NotBlank(message = "이메일은 필수 입력사항입니다.")
    @Pattern(regexp = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$", message = "email@email.com 형식으로 입력해주세요")
    private String email;
    @NotBlank(message = "생년월일은 필수 입력사항입니다.")
    private String birthday;
    @NotBlank(message = "주소는 필수 입력사항입니다.")
    private String addr;
    private String addr_detail;
    @NotNull(message = "우편번호는 필수 입력사항입니다.")
    private int zipcode;
    @NotBlank(message = "핸드폰번호는 필수 입력사항입니다")
    private String phone;
    private LocalDate reg_date;
    private LocalDate modify_date;
    private String member_type;
    private String member_state;
    private String subject;


    private String phone_0;
    private String phone_1;
    private String phone_2;

    private String email_id;
    private String email_domain;
    public String getPhone_0(String phone) {return phone.substring(0, 3);}
    public String getPhone_1(String phone) {
        if (phone.length() == 12) {
            return phone.substring(phone.indexOf("-") + 1, phone.indexOf("-") + 4);
        } else {
            return phone.substring(phone.indexOf("-") + 1, phone.indexOf("-") + 5);
        }
    }
    public String getPhone_2(String phone) {
        return phone.substring(phone.lastIndexOf("-") + 1);
    }

    public void setPhone(String phone_0, String phone_1, String phone_2) {
        this.phone = phone_0 + "-" + phone_1 + "-" + phone_2;
    }

    public String getEmail_id(String email) {
        return email.split("@")[0];
    }
    public String getEmail_domain(String email) {
        return email.split("@")[1];
    }
    public void setEmail(String email_id, String email_domain) {
        this.email = email_id + "@" + email_domain;
    }

}