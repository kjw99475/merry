package org.fullstack.merry.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;

@Log4j2
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderDetailDTO {
    private int idx;
    private int order_idx;
    private int lec_idx;
    private String view_check;
    private String return_yn;

    private int member_idx;
    
    private String lec_title;
    private String lec_content;
    private int lec_price;
}
