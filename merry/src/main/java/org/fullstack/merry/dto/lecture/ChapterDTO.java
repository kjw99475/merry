package org.fullstack.merry.dto.lecture;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ChapterDTO {
    private int chap_idx;
    private String chap_title;
    private String chap_video;
    private String chap_org_video;
    private String chap_time;
//    private String chap_min;
//    private  String chap_second;
    private int lec_idx;
    private String chap_status;

//    public String getChap_time() {
//        return chap_min + " : " + chap_second;
//    }
}

