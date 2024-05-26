package org.fullstack.merry.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CartVO {
    private int cart_idx;
    private String member_id;
    private int lec_idx ;
    private String lec_title;
    private int lec_price;
    private String lec_img;
}
