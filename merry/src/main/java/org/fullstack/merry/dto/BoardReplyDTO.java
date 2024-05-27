package org.fullstack.merry.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotEmpty;
import java.time.LocalDate;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardReplyDTO {
    private int reply_idx;
    @NotEmpty
    private String reply_comment;
    @NotEmpty
    private String reply_writer;
    private LocalDate reply_reg_date;
    private LocalDate reply_modify_date;
    private int board_idx;
    private int member_idx;
}
