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
public class OrderDTO {
    private int order_idx;
    private String member_id;
    private LocalDate order_date;
    private int order_total;
    private int lec_idx;
    private  int member_idx;
}
