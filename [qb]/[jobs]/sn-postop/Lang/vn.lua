local Translations = {
    error = {
        ["nogroup"] = "Hãy tạo một nhóm trước khi làm",
        ["overmem"] = "Quá nhiều người trong nhóm rồi!",
        ["timeout"] = "Hãy nghỉ ngơi một xíu rồi quay lại!",
        ["vehicle"] = "Bạn đã có phương tiện",
        ["far"]     = "Bạn quá xa điểm giao hàng",
        ["camhang"] = "Bạn không thể lấy thêm vật phẩm",
        ["driver"]  = "Bạn phải ngồi ghế lái",
        ["diffveh"] = "Đây không phải xe của chúng tôi",
        ["job"]     = "Bạn phải là quản lý của PostOp",
        ["job1"]     = "Hãy đi gặp quản lý để nhận việc",
        ["item"]    = "Bạn không có vật phẩm",
        ["duty"] =  "Hãy hoàn thành nốt chuyến hàng của bạn",
        ["ownjob"] = "Bạn đã có một công việc rồi mà",
        ["errorjob"] = "Bạn không phải nhân viên của chúng tôi",
        ["leader"] = "Bạn phải là trưởng nhóm"
    },
    info = {
        ["wait"] = "Đang tìm kiếm địa điểm",
        ["label"] = "Hãy giao hàng đến %{value}",
        ["status"] = "Còn %{value}/%{value2} thùng hàng",
        ["vehicle"] = "[G] - Trả phương tiện",
        ["drop"] = "Địa điểm giao hàng",
        ["store"] = "Cửa hàng",
        ["company"] = "Vận Tải PostOP",
        ["gara"] = "Trả xe",
        ["next"] = "Hãy đi đến điểm tiếp theo",
        ["input"] = "Số XaloPay",
        ["submit"] = "Xác Nhận",
    },
    success = {
        ["done"]  = "Giao hàng xong rồi, hãy về trả xe để nhận tiền công",
        ["money"] = "Bạn đã nhận được %{value} $",
    },
    target = {
        ["prime"]   = "Bưu Kiện Nhỏ",
        ["express"] = "Chuyển Phát Nhanh",
        ["freight"] = "Vận Tải Nặng",
        ["take"]    = "Lấy đồ",
        ["give"]    = "Giao đồ",
        ["duty"] = "Xin việc",
        ["offduty"] = "Nghỉ việc",
    },
    icon = {
        ["duty"] = "fa-solid fa-user",
        ["give"] = "fa-solid fa-hand",
        ["take"] = "fa-solid fa-box",
        ["offduty"] = "fa-solid fa-user",
        ["prime"] = "fa-solid fa-truck",
        ["express"] = "fa-solid fa-truck-fast",
        ["freight"] = "fa-solid fa-truck-moving"
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})