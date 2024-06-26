package org.fullstack.merry.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class OrderVO {
    private int order_idx;
    private String member_id;
    private LocalDate order_date;
    private int order_total;
    private String billing_type;
    private String order_state;
}
