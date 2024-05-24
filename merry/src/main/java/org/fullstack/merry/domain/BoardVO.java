package org.fullstack.merry.domain;

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
public class BoardVO {
    private int board_idx;
    private String board_title;
    private String board_content;
    private String board_writer;
    private LocalDate board_reg_date;
    private LocalDate board_modify_date;
    private int member_idx;
}
