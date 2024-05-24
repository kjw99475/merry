package org.fullstack.merry.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

import javax.validation.constraints.NotBlank;
import java.time.LocalDate;
@Log4j2
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BoardDTO {
    private int board_idx;
    @NotBlank
    private String board_title;
    @NotBlank
    private String board_content;
    private String board_writer;
    private LocalDate board_reg_date;
    private LocalDate board_modify_date;
    private int member_idx;
}
