package org.fullstack.merry.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Calendar {
    private int id;
    private String groupId;
    private String title;
    private String writer;
    private String content;
    private String start;
    private String end;
    private boolean allday;
    private String textColor;
    private String backgroundColor;
//    private String borderColor;
}
