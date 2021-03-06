package com.xyf.yummy.model;

import com.xyf.yummy.entity.Address;
import com.xyf.yummy.model.enums.MerchantTypeEnum;
import com.xyf.yummy.model.enums.MerchantVerEnum;

/**
 * @你大爷: XYF
 * @author: lenovo XYF
 * @Date: 2019/2/26
 * @Time: 16:46
 * @Package: com.xyf.yummy.model
 */
public class MerchantInfo {
    private String name;
    private MerchantTypeEnum type;
    private Address address;
    private MerchantVerEnum verEnum;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public MerchantTypeEnum getType() {
        return type;
    }

    public void setType(MerchantTypeEnum type) {
        this.type = type;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public MerchantVerEnum getVerEnum() {
        return verEnum;
    }

    public void setVerEnum(MerchantVerEnum verEnum) {
        this.verEnum = verEnum;
    }
}
