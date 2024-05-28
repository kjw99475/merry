package org.fullstack.merry.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.dto.DataDTO;
import org.fullstack.merry.dto.lecture.LectureDTO;
import org.fullstack.merry.mapper.NoticeMapper;
import org.fullstack.merry.mapper.OrderMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Log4j2
@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderServiceIf {
    private final OrderMapper orderMapper;
    private final ModelMapper modelMapper;

    @Override
    public void order(String member_id, int order_total, String lec_idx) {
        orderMapper.order(member_id, order_total);
        int order_idx = orderMapper.getorderidx(member_id);
        orderMapper.order_detail(order_idx, lec_idx);
        orderMapper.cartout(member_id, lec_idx);
    }

    @Override
    public int order_total(String lec_idx) {
        int result = orderMapper.order_total(lec_idx);
        return result;
    }

    @Override
    public List<LectureDTO> orderlist(String lec_idx) {
        List<LectureDTO> orderlist = orderMapper.orderlist(lec_idx).stream()
                .map(vo->modelMapper.map(vo, LectureDTO.class))
                .collect(Collectors.toList());
        return orderlist;
    }

    @Override
    public void cartout(String member_id, String lec_idx) {
        orderMapper.cartout(member_id, lec_idx);
    }
}
