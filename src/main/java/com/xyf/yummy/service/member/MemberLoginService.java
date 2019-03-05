package com.xyf.yummy.service.member;

import com.xyf.yummy.model.MemberLog;

/**
 * @你大爷: XYF
 * @author: lenovo XYF
 * @Date: 2019/2/25
 * @Time: 16:35
 * @Package: com.xyf.yummy.service.member
 */
public interface MemberLoginService {


    /**
     *
     * @param log
     * @return
     */
    boolean register(MemberLog log);


    /**
     *
     * @param email
     * @return
     */
    String getKey(String email);

    /**
     *
     * @param log
     * @return
     */
    String login(MemberLog log);

    /**
     *
     * @param email
     */
    void cancelAccount(String email);

}
