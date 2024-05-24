package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.Common.FileUploadUtil;
import org.fullstack.merry.domain.lecture.ChapterVO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;
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
                        FileUploadUtil.deleteFile(chapList.get(j).getChap_video(), "D:\\java4\\merry\\merry\\src\\main\\webapp\\resources\\uploads\\lecture");
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
    public String String (@RequestParam("lec_idx") int lec_idx, Model model) {
        lectureService.delete(lec_idx);
        return "redirect:/lecture/view?lec_idx=" + lec_idx;
    }

}
