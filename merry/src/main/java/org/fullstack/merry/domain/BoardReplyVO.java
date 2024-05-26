package org.fullstack.merry.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.NotEmpty;
import java.time.LocalDate;

@Log4j2
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardReplyVO {
    private int reply_idx;
    private String reply_comment;
    private String reply_writer;
    private LocalDate reply_reg_date;
    private LocalDate reply_modify_date;
    private int board_idx;
}
