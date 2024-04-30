package com.chq.hms.controller.client;

import com.chq.hms.anno.OperationLog;
import com.chq.hms.domain.HotelRoomType;
import com.chq.hms.domain.Result;
import com.chq.hms.domain.vo.PageBean;
import com.chq.hms.service.HotelRoomTypeService;
import com.chq.hms.util.IpAddrUtil;
import jakarta.servlet.http.HttpServletRequest;
import net.dreamlu.mica.ip2region.core.Ip2regionSearcher;
import net.dreamlu.mica.ip2region.core.IpInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

import static com.chq.hms.util.WeatherUtil.weatherInfo;

@RestController
@RequestMapping("/client")
public class ClientHomeController {
    @Autowired
    private HotelRoomTypeService hotelRoomTypeService;
    @Autowired
    private Ip2regionSearcher ip2regionSearcher;


    // 获取客户端IP地址的归属地
    @OperationLog("系统功能：获取酒店首页信息")
    @GetMapping("/hotelInfo")
    public Result<Object> getHotelInfo() {
        Map<String, Object> data = Map.of(
                "name", "Elysian Nest 悦巢酒店",
                "description", "悦巢酒店是一家集商务、休闲、娱乐为一体的五星级酒店,拥有各种类型的豪华客房和套房,配备先进的会议设施和完善的餐饮服务,是商务出行和休闲度假的理想选择。",
                "features", List.of(
                        "五星级酒店服务",
                        "多种房型选择",
                        "高级会议设施",
                        "丰富的餐饮选择"
                ),
                "images", List.of(
                        "https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/gallery/hotel-exterior-day-shot-high.jpg",
                        "https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/gallery/3-bed-residence-dining-area-2-edited.jpg",
                        "https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/gallery/ballroom-dining-setup-closeup.jpg",
                        "https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/gallery/dinner.jpg",
                        "https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/gallery/enigma-terrace-night-shot.jpg",
                        "https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/gallery/gazebo-high.jpg",
                        "https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/gallery/giardino-terrace-morning-shot-2.jpg",
                        "https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/gallery/hotel-night-shot.jpg",
                        "https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/gallery/imperial-suite-pool-and-jacuzzi-low-res.jpg",
                        "https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/gallery/la-vita-bar.jpg",
                        "https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/gallery/lp-festive-high-tea-mosaico.jpg",
                        "https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/gallery/pre-function.jpg",
                        "https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/gallery/pvd-pool.jpg",
                        "https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/gallery/signature-suite-dining-area.jpg",
                        "https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/gallery/signature-suite-living-area.jpg",
                        "https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/gallery/spa.jpg",
                        "https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/gallery/vanitas-table-setup-1600.jpg",
                        "https://yorha-chq-picture.oss-cn-shanghai.aliyuncs.com/elysian-nest/gallery/vanitas3.jpg"
                ),
                "address", "江西省赣州市章贡区悦巢大道101号",
                "phone", "010-88888888",
                "email", "yorha_chq@163.com",
                "wechat", "YoRHa_CHQ"
        );
        return Result.success(data);
    }

    /**
     * 酒店房型列表
     *
     * @param pageNum  当前页码
     * @param pageSize 每页条数
     * @param keyword  搜索关键词(非必须)
     * @return pageBean
     */
    @OperationLog("数据获取：酒店房间类型列表")
    @GetMapping("/hotelRoomTypeList")
    public Result<PageBean<HotelRoomType>> getHotelRoomTypes(
            @RequestParam(defaultValue = "1") Integer pageNum,
            @RequestParam(defaultValue = "50") Integer pageSize,
            @RequestParam(required = false) String keyword,
            @RequestParam(defaultValue = "room_type_id") String orderBy,
            @RequestParam(defaultValue = "asc") String orderType
    ) {
        PageBean<HotelRoomType> pageBean = hotelRoomTypeService.getHotelRoomTypes(pageNum, pageSize, keyword, orderBy, orderType);
        return Result.success(pageBean);
    }

    // 加载天气信息
    @OperationLog("系统功能：获取实时天气")
    @GetMapping("/weather")
    public Result<Object> getWeather(HttpServletRequest request) {
        IpInfo ipInfo = ip2regionSearcher.memorySearch(IpAddrUtil.getIpAddr(request));
        if (ipInfo == null) return Result.error("IP获取失败!");
        Map<String, String> weatherInfo;
        // 使用了JSONUtil.parse(),将JSON字符串直接解析为JSON对象,避免在将JSON字符串作为数据传输时进行不必要的转义
        if (ipInfo.getRegion() != null) {
            weatherInfo = weatherInfo(ipInfo.getRegion());
        } else if (ipInfo.getCity() != null) {
            weatherInfo = weatherInfo(ipInfo.getCity());
        } else if (ipInfo.getProvince() != null) {
            weatherInfo = weatherInfo(ipInfo.getProvince());
        } else if (ipInfo.getCountry() != null) {
            weatherInfo = weatherInfo(ipInfo.getCountry());
        } else {
            return Result.error("获取天气信息失败!");
        }
        return Result.success(weatherInfo);
    }
}
