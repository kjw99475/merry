package org.fullstack.merry.domain.lecture;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class QnaAnswerDTO {
    private int qna_idx;
    private String qna_answer;
}
