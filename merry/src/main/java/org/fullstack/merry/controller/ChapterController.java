package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.Common.FileUploadUtil;
import org.fullstack.merry.domain.lecture.ChapterVO;
import org.fullstack.merry.service.lecture.ChapterServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/chapter")
public class ChapterController {
    private final ChapterServiceIf chapterService;

    @RequestMapping(value="/delete", method= RequestMethod.POST, produces = "application/text;charset=UTF-8")
    @ResponseBody
    public String deleteChapter(@RequestParam int chap_idx) {
        ChapterVO chapterVO = chapterService.view(chap_idx);
        FileUploadUtil.deleteFile(chapterVO.getChap_video(), "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\lecture");
        String result = String.valueOf(chapterService.realDelete(chap_idx));
        return result;
    }
}
