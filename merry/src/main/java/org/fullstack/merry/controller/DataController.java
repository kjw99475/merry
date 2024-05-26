package org.fullstack.merry.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.Common.FileUploadUtil;
import org.fullstack.merry.dto.DataDTO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.dto.PageResponseDTO;
import org.fullstack.merry.service.DataServiceIf;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Log4j2
@Controller
@RequestMapping(value="/data")
@RequiredArgsConstructor
public class DataController {
    private final DataServiceIf dataServiceIf;

    //    ===================== data start ==============================
    @GetMapping("/list")
    public void GETdataList(@Valid PageRequestDTO pageRequestDTO,
                            BindingResult bindingResult,
                            RedirectAttributes redirectAttributes,
                            Model model) {
        if(bindingResult.hasErrors()){
            log.info("dataController >> list Error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
        }
        pageRequestDTO.setPage_block_size(10);

        PageResponseDTO<DataDTO> responseDTO = dataServiceIf.ListByPage(pageRequestDTO);

        model.addAttribute("responseDTO", responseDTO);
    }

    @GetMapping("/view")
    public void GETdataView(@RequestParam(name="data_idx") int data_idx,
                            Model model
    ) {
        DataDTO dataDTO = dataServiceIf.view(data_idx);
        model.addAttribute("dataDTO", dataDTO);
        log.info("dataDTO >> " + dataDTO);
    }

    @GetMapping("/download")
    public void downloadData(int data_idx,
                             HttpServletResponse resp,
                             HttpServletRequest req
    ) {
        DataDTO dataDTO = dataServiceIf.view(data_idx);

        FileUploadUtil.download(req, resp, dataDTO.getData_org_file_name(), dataDTO.getData_save_file_name(), "uploads\\data");
    }

    @RequestMapping(value = "/deleteFile", method = RequestMethod.POST, produces = "application/text;charset=UTF-8")
    @ResponseBody
    public String DatadeleteFilePOST(@RequestParam int data_idx) {
        DataDTO dataDTO = dataServiceIf.view(data_idx);
        log.info("dataDTO >>> " + dataDTO.getData_save_file_name());
        FileUploadUtil.deleteFile(dataDTO.getData_save_file_name(), "uploads\\data");
        dataDTO.setData_org_file_name("");
        dataDTO.setData_save_file_name("");
        dataServiceIf.modify(dataDTO);
        log.info("dataDTO >>> " + dataDTO.getData_save_file_name());
        return "ok";
    }


    @GetMapping("/regist")
    public void GETdataRegist(
    ) {

    }

    @PostMapping("/regist")
    public String POSTdataregist(@Valid DataDTO dataDTO
            , BindingResult bindingResult
            , @RequestParam("file") MultipartFile multipartFile
            , HttpServletRequest request
            , RedirectAttributes redirectAttributes
            , Model model
    ) {
        log.info("DataController >> regist : " + dataDTO);

        if(bindingResult.hasErrors()){
            log.info("DataController >> list Error");
            redirectAttributes.addFlashAttribute("dataDTO", dataDTO);
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());

            return "redirect:/data/regist";
        }
        String saveFileName = "";
        if(multipartFile!= null && !multipartFile.isEmpty()) {
            saveFileName = FileUploadUtil.saveFile(multipartFile, "uploads\\data");
            dataDTO.setData_org_file_name(multipartFile.getOriginalFilename());
            dataDTO.setData_save_file_name(saveFileName);
        }

        int result = dataServiceIf.regist(dataDTO);

        if(result > 0) {
            log.info("등록 성공 ===============");
            return "redirect:/data/list";
        } else {
            log.info("등록 실패 ===============");
            return "redirect:/data/regist";
        }
    }

    @GetMapping("/modify")
    public void GETdataModify(@RequestParam(name="data_idx") int data_idx,
                              Model model
    ) {
        DataDTO dataDTO = dataServiceIf.view(data_idx);
        model.addAttribute("dataDTO", dataDTO);
        log.info("dataDTO >> " + dataDTO);
    }

    @PostMapping("/modify")
    public String POSTdataModify(@Valid DataDTO dataDTO
            , BindingResult bindingResult
            , HttpServletRequest request
            , RedirectAttributes redirectAttributes
            , @RequestParam(value = "upload", defaultValue = "") String upload
            , @RequestParam(value = "upload2", defaultValue = "") String upload2
            , @RequestParam("file") MultipartFile file
            , Model model
    ) {
        if(bindingResult.hasErrors()){
            log.info("DataController >> list Error");
            redirectAttributes.addFlashAttribute("dataDTO", dataDTO);
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());

            return "redirect:/data/modify?data_idx=" + dataDTO.getData_idx();
        }
        String saveFileName = "";

        if(file!= null && !file.isEmpty()) {
            saveFileName = FileUploadUtil.saveFile(file, "uploads\\data");
            dataDTO.setData_org_file_name(file.getOriginalFilename());
            dataDTO.setData_save_file_name(saveFileName);
            FileUploadUtil.deleteFile(upload2, "uploads\\data");
        } else {
            dataDTO.setData_org_file_name(upload);
            dataDTO.setData_save_file_name(upload2);
        }

        int result = dataServiceIf.modify(dataDTO);

        if(result > 0) {
            log.info("수정 성공 ===============");
            return "redirect:/data/view?data_idx=" + dataDTO.getData_idx();
        } else {
            log.info("수정 실패 ===============");
            return "redirect:/data/modify?data_idx=" + dataDTO.getData_idx();
        }
    }

    @PostMapping("/delete")
    public String POSTdataDelete(int data_idx) {
        int result = dataServiceIf.delete(data_idx);
        if(result > 0) {
            log.info("삭제 성공 ===============");
            return "redirect:/data/list";
        }
        else {
            log.info("삭제 실패 ===============");
            return "redirect:/data/view?data_idx=" + data_idx;
        }
    }
    //    ===================== data end ==============================
}
