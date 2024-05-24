package mapper;

import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.domain.BoardVO;
import org.fullstack.merry.dto.PageRequestDTO;
import org.fullstack.merry.mapper.BoardMapper;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.List;

@Log4j2
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/root-context.xml")
public class jiwonTest {
    @Autowired (required = false)
    private BoardMapper boardMapper;

    @Test
    public void test() {
        PageRequestDTO pageRequestDTO = PageRequestDTO.builder()
                .page_size(10)
                .build();
        List<BoardVO> list = boardMapper.ListByPage(pageRequestDTO);
        log.info("result : >> " + list.toString());

    }

    @Test
    public void test2() {
        BoardVO boardVO = boardMapper.view(1);
        log.info("result : >> " + boardVO.toString());
    }

}
