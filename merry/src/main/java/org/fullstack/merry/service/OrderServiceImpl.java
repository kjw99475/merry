package org.fullstack.merry.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.fullstack.merry.mapper.NoticeMapper;
import org.fullstack.merry.mapper.OrderMapper;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Log4j2
@Service
@RequiredArgsConstructor
public class OrderServiceImpl implements OrderServiceIf {
    private final OrderMapper orderMapper;
    private final ModelMapper modelMapper;

    @Override
    public void order(String member_id, int order_total) {
        orderMapper.order(member_id, order_total);
    }

    @Override
    public int order_total(int[] lec_idx) {
        int result = orderMapper.order_total(lec_idx);
        return result;
    }
}
