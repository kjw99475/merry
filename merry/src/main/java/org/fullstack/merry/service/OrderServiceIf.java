package org.fullstack.merry.service;

public interface OrderServiceIf {
    void order(String member_id, int order_total);
    int order_total(int[] lec_idx);
}
