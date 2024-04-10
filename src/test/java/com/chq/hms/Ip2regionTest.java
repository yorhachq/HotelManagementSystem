package com.chq.hms;

import cn.hutool.log.StaticLog;
import net.dreamlu.mica.ip2region.core.Ip2regionSearcher;
import net.dreamlu.mica.ip2region.core.IpInfo;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class Ip2regionTest {

    @Autowired
    Ip2regionSearcher regionSearcher;

    @Test
    public void test() {
        IpInfo ipInfo =regionSearcher.memorySearch("101.226.67.0    ");
        assert ipInfo != null;
        StaticLog.info("IpInfo:{}",ipInfo);
        StaticLog.info("getCountry:{}",ipInfo.getCountry());
        StaticLog.info("getRegion:{}",ipInfo.getRegion());
        StaticLog.info("getProvince:{}",ipInfo.getProvince());
        StaticLog.info("getCity:{}",ipInfo.getCity());
        StaticLog.info("getIsp:{}",ipInfo.getIsp());
        StaticLog.info("getAddressAndIsp:{}",ipInfo.getAddressAndIsp());
    }
}
