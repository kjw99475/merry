package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.Common.FileUploadUtil;
import org.fullstack.merry.domain.lecture.ChapterVO;
import org.fullstack.merry.domain.lecture.QnaAnswerDTO;
import org.fullstack.merry.dto.*;
import org.fullstack.merry.dto.lecture.ChapterDTO;
import org.fullstack.merry.dto.lecture.LectureDTO;
import org.fullstack.merry.service.lecture.ChapterServiceIf;
import org.fullstack.merry.service.lecture.LectureServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/lecture")
public class LectureController {
    private final LectureServiceIf lectureService;
    private final ChapterServiceIf chapterService;

    @GetMapping("/regist")
    public void regist(HttpSession session, Model model) {

        int member_idx = (int) session.getAttribute("member_idx");
        String subject = lectureService.getSubject(member_idx);
        model.addAttribute("subject", subject);
    }

    @PostMapping("/regist")
    public String regist(@Valid LectureDTO lectureDTO,
                         BindingResult bindingResult,
                         RedirectAttributes redirectAttributes,
                         @RequestParam("lecImg") MultipartFile lecImg,
                         @RequestParam("chapVideos") List<MultipartFile> chapVideos,
                         HttpSession session,
                         Model model) {
        log.info("registPost");

//        if (bindingResult.hasErrors()) {
//            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
//            redirectAttributes.addFlashAttribute("lectureDTO", lectureDTO);
//            log.info("valid 오류");
//            return "redirect:/lecture/regist";
//        }

        String saveLecImg = "";
        if (lecImg != null && !lecImg.isEmpty()) {
            saveLecImg = FileUploadUtil.saveFile(lecImg, "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\lecture");
            lectureDTO.setLec_img(saveLecImg);
            lectureDTO.setLec_org_img(lecImg.getOriginalFilename());
        }

        int resultLectureIdx = lectureService.regist(lectureDTO);
        log.info("resultLecture: {}", resultLectureIdx);

        List<ChapterDTO> chapterDTOList = lectureDTO.getChapters();
        String saveChapVideo = "";
        if (chapterDTOList != null && !chapterDTOList.isEmpty()) {
            for (int i=0; i<chapterDTOList.size(); i++) {
                saveChapVideo = "";
                if (chapVideos != null && i < chapVideos.size() && !chapVideos.get(i).isEmpty()) {
                    saveChapVideo = FileUploadUtil.saveFile(chapVideos.get(i), "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\lecture");
                    chapterDTOList.get(i).setChap_video(saveChapVideo);
                    chapterDTOList.get(i).setChap_org_video(chapVideos.get(i).getOriginalFilename());
                    log.info(chapVideos.get(i).getOriginalFilename());
                }
                else {
                    log.info("동영상 이슈");
                    redirectAttributes.addFlashAttribute("errorVideo", "동영상을 넣어주세요.");
                    return "redirect:/lecture/regist";
                }
                chapterDTOList.get(i).setLec_idx(resultLectureIdx);
                chapterService.regist(chapterDTOList.get(i));
            }
        }

        log.info(chapterDTOList);

        return "redirect:/lecture/list";
    }

    @GetMapping("/view")
    public void view(@RequestParam(name="lec_idx", defaultValue = "0") int lec_idx, Model model) {
        log.info("view");
        LectureDTO lectureDTO = lectureService.view(lec_idx);
        List<ChapterVO> chapterDTOList = chapterService.chapterList(lec_idx);
        List<QnaDTO> qnaList = lectureService.qnaList(lec_idx);
        List<DataDTO> dataList = lectureService.dataList(lec_idx);
        List<NoticeDTO> noticeList = lectureService.noticeList(lec_idx);

        model.addAttribute("dataList", dataList);
        model.addAttribute("qnaList", qnaList);
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("lectureDTO", lectureDTO);
        model.addAttribute("ChapterList", chapterDTOList);
    }

    @GetMapping("/list")
    public void list(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes,  Model model) {
        if (bindingResult.hasErrors()) {
            log.info("LectureController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }

        PageResponseDTO<LectureDTO> responseDTO = lectureService.lectureList(pageRequestDTO);
        model.addAttribute("responseDTO", responseDTO);
    }

    @GetMapping("/modify")
    public void modify(@RequestParam(name="lec_idx", defaultValue = "0") int lec_idx, Model model) {
        LectureDTO lectureDTO = lectureService.view(lec_idx);
        List<ChapterVO> chapterDTOList = chapterService.chapterList(lec_idx);
        model.addAttribute("lectureDTO", lectureDTO);
        model.addAttribute("ChapterList", chapterDTOList);
    }

    @PostMapping("/modify")
    public String modify(@Valid LectureDTO lectureDTO,
                         BindingResult bindingResult,
                         RedirectAttributes redirectAttributes,
                         @RequestParam(value = "upload", defaultValue = "") String upload,
                         @RequestParam(value = "upload2", defaultValue = "") String upload2,
                         @RequestParam("lecImg") MultipartFile lecImg,
                         @RequestParam("chapVideos") List<MultipartFile> chapVideos,
                         HttpSession session,
                         Model model) {

//        if (bindingResult.hasErrors()) {
//            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
//            redirectAttributes.addFlashAttribute("lectureDTO", lectureDTO);
//            log.info("valid 오류");
//            return "redirect:/lecture/regist";
//        }



        String saveLecImg = "";
        if (lecImg != null && !lecImg.isEmpty()) {
            saveLecImg = FileUploadUtil.saveFile(lecImg, "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\lecture");
            FileUploadUtil.deleteFile(upload2, "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\lecture");
            lectureDTO.setLec_img(saveLecImg);
            lectureDTO.setLec_org_img(lecImg.getOriginalFilename());
        } else {
            lectureDTO.setLec_img(upload2);
            lectureDTO.setLec_org_img(upload);
        }

        int resultLectureIdx = lectureService.modify(lectureDTO);
        log.info("resultLecture: {}", resultLectureIdx);

        List<ChapterVO> chapList = chapterService.chapterList(lectureDTO.getLec_idx());

        List<ChapterDTO> chapterDTOList = lectureDTO.getChapters();
        String saveChapVideo = "";
        List<String> videoList = new ArrayList<String>();
        List<String> saveVideoList = new ArrayList<>();

        for (int i=0; i<chapList.size(); i++) {
            videoList.add(chapList.get(i).getChap_org_video());
            saveVideoList.add(chapList.get(i).getChap_video());
        }

        if (chapterDTOList != null && !chapterDTOList.isEmpty()) {


            chapterService.modifyAndDelete(lectureDTO.getLec_idx());

            for (int i=0; i<chapterDTOList.size(); i++) {
                saveChapVideo = "";
                if (chapVideos != null && i < chapVideos.size() && !chapVideos.get(i).isEmpty()) {
                    for (int j=0; j<chapList.size(); j++) {
                        if (i == j) {
                            FileUploadUtil.deleteFile(chapList.get(j).getChap_video(), "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\lecture");
                        }
                    }

                    saveChapVideo = FileUploadUtil.saveFile(chapVideos.get(i), "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\lecture");
                    chapterDTOList.get(i).setChap_video(saveChapVideo);
                    chapterDTOList.get(i).setChap_org_video(chapVideos.get(i).getOriginalFilename());
                }
                else {
                    for (int j=0; j<chapList.size(); j++) {
                        chapterDTOList.get(j).setChap_video(saveVideoList.get(j));
                        chapterDTOList.get(j).setChap_org_video(videoList.get(j));
                    }

                }
                chapterDTOList.get(i).setLec_idx(lectureDTO.getLec_idx());
                chapterService.regist(chapterDTOList.get(i));
            }
        }

        log.info(chapterDTOList);

        return "redirect:/lecture/view?lec_idx=" + lectureDTO.getLec_idx();
    }

    @PostMapping("/delete")
    public String String (@RequestParam(name="lec_idx", defaultValue = "0") int lec_idx, Model model) {
        lectureService.delete(lec_idx);
        return "redirect:/lecture/view?lec_idx=" + lec_idx;
    }

    @GetMapping("/data/list")
    public void dataListGET(@RequestParam(name="lec_idx", defaultValue = "0") int lec_idx,
                            Model model) {
        List<DataDTO> dataList = lectureService.dataList(lec_idx);
        model.addAttribute("lec_idx", lec_idx);
        model.addAttribute("dataList", dataList);
    }

    @GetMapping("/notice/list")
    public void noticeListGET(@RequestParam(name="lec_idx", defaultValue = "0") int lec_idx,
                              Model model) {
        List<NoticeDTO> noticeList = lectureService.noticeList(lec_idx);
        model.addAttribute("lec_idx", lec_idx);
        model.addAttribute("noticeList", noticeList);
    }

    @GetMapping("/qna/list")
    public void qnaListGET(@RequestParam(name="lec_idx", defaultValue = "0") int lec_idx,
                           Model model) {
        List<QnaDTO> qnaList = lectureService.qnaList(lec_idx);
        model.addAttribute("lec_idx", lec_idx);
        model.addAttribute("qnaList", qnaList);
    }

    @GetMapping("/qna/regist")
    public void qnaRegistGET(@RequestParam(name="lec_idx", defaultValue = "0") int lec_idx,
                             Model model) {
        LectureDTO lectureDTO = lectureService.view(lec_idx);
        model.addAttribute("lectureDTO", lectureDTO);
    }

    @PostMapping("/qna/regist")
    public String qnaRegistPOST(@Valid QnaDTO qnaDTO,
                                BindingResult bindingResult,
                                RedirectAttributes redirectAttributes,
                                Model model) {
        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaDTO", qnaDTO);
            return "redirect:/lecture/qna/regist?lec_idx="+qnaDTO.getQna_lec_idx();
        }

        int result = lectureService.registQna(qnaDTO);

        if (result > 0) {
            return "redirect:/lecture/qna/list?lec_idx="+qnaDTO.getQna_lec_idx();
        }
        else {
            return "redirect:/lecture/qna/regist?lec_idx="+qnaDTO.getQna_lec_idx();
        }

    }
    @GetMapping("/qna/modify")
    public void modifyQna(@RequestParam(name = "qna_idx", defaultValue="0") int qna_idx,
                          HttpSession session,
                          Model model) {
        QnaDTO qnaDTO = lectureService.viewQna(qna_idx);
        model.addAttribute("qnaDTO", qnaDTO);
    }

    @PostMapping("/qna/modify")
    public String modifyQna(@Valid QnaDTO qnaDTO,
                           BindingResult bindingResult,
                           RedirectAttributes redirectAttributes,
                           Model model) {

        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaDTO", qnaDTO);

            return "redirect:/lecture/qna/modify?qna_idx=" + qnaDTO.getQna_idx();
        }

        int result = lectureService.modifyQna(qnaDTO);

        if (result > 0) {
            return "redirect:/lecture/qna/view?qna_idx=" + qnaDTO.getQna_idx();
        }
        else {
            return "redirect:/lecture/qna/modify?qna_idx=" + qnaDTO.getQna_idx();
        }

    }

    @GetMapping("/qna/view")
    public void viewQnaGET(@RequestParam(name = "qna_idx", defaultValue="0") int qna_idx,
                        HttpSession session,
                        Model model) {
        QnaDTO qnaDTO = lectureService.viewQna(qna_idx);
        model.addAttribute("qnaDTO", qnaDTO);
    }

    @GetMapping("/qna/delete")
    public String deleteQnaGET(@RequestParam(name="qna_idx", defaultValue = "0") int qna_idx) {
        QnaDTO qnaDTO = lectureService.viewQna(qna_idx);
        int lec_idx = qnaDTO.getQna_lec_idx();
        lectureService.deleteQna(qna_idx);
        return "redirect:/lecture/qna/list?lec_idx="+lec_idx;
    }

    @GetMapping("/qna/teacherWrite")
    public void registAdminGET(@RequestParam(name = "qna_idx", defaultValue="0") int qna_idx,
                               HttpSession session,
                               Model model) {
        QnaDTO qnaDTO = lectureService.viewQna(qna_idx);
        model.addAttribute("qnaDTO", qnaDTO);
    }

    @PostMapping("/qna/teacherWrite")
    public String registAdminPOST(@Valid QnaAnswerDTO qnaAnswerDTO,
                                  BindingResult bindingResult,
                                  RedirectAttributes redirectAttributes,
                                  @RequestParam(name = "qna_idx", defaultValue="0") int qna_idx,
                                  Model model) {



        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaAnswerDTO", qnaAnswerDTO);

            return "redirect:/lecture/qna/teacherWrite?qna_idx=" + qna_idx;
        }

        int result = lectureService.registTeacher(qnaAnswerDTO);
        if (result > 0) {
            return "redirect:/lecture/qna/view?qna_idx=" + qna_idx;
        }

        else {
            return "redirect:/lecture/qna/teacherWrite?qna_idx=" + qna_idx;
        }

    }


    @GetMapping("/qna/teacherModify")
    public void modifyAdminGET(@RequestParam(name = "qna_idx", defaultValue="0") int qna_idx,
                               HttpSession session,
                               Model model) {
        QnaDTO qnaDTO = lectureService.viewQna(qna_idx);
        model.addAttribute("qnaDTO", qnaDTO);
    }

    @PostMapping("/qna/teacherModify")
    public String modifyAdminPOST(@Valid QnaAnswerDTO qnaAnswerDTO,
                                  BindingResult bindingResult,
                                  RedirectAttributes redirectAttributes,
                                  @RequestParam(name = "qna_idx", defaultValue="0") int qna_idx,
                                  Model model) {



        if (bindingResult.hasErrors()) {
            log.info("Errors");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("qnaAnswerDTO", qnaAnswerDTO);

            return "redirect:/lecture/qna/teacherWrite?qna_idx=" + qna_idx;
        }

        int result = lectureService.modifyTeacher(qnaAnswerDTO);
        if (result > 0) {
            return "redirect:/lecture/qna/view?qna_idx=" + qna_idx;
        }

        else {
            return "redirect:/lecture/qna/teacherWrite?qna_idx=" + qna_idx;
        }

    }

    @GetMapping("/qna/teacherDelete")
    public String deleteAdminGET(@RequestParam(name = "qna_idx", defaultValue="0") int qna_idx) {
        lectureService.deleteTeacher(qna_idx);
        return "redirect:/lecture/qna/view?qna_idx=" + qna_idx;
    }


}
