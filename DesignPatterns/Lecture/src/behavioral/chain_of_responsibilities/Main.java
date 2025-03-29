package behavioral.chain_of_responsibilities;

public class Main {
    public static void main(String[] args) {
        NhanVienF88 nhanVienNhanHoSo = new NhanVienChoVayF88("Nhân viên nhận hồ sơ", "Nguyễn Văn A", 5_000_000);
        NhanVienF88 truongPhong = new NhanVienChoVayF88("Trưởng phòng", "Nguyễn Văn B", 20_000_000);
        NhanVienF88 phoPhong = new NhanVienChoVayF88("Phó phòng", "Nguyễn Văn C", 10_000_000);
        NhanVienF88 giamDoc = new NhanVienChoVayF88("Giám đốc", "Nguyễn Văn D", 50_000_000);
        NhanVienF88 chuTich = new ChuTich("Chủ tịch", "Nguyễn Văn E", 100_000_000);

        nhanVienNhanHoSo.capTren(phoPhong)
                .capTren(truongPhong)
                .capTren(giamDoc)
                .capTren(chuTich);

        nhanVienNhanHoSo.duyetChoVay(5_000_000);
        nhanVienNhanHoSo.duyetChoVay(10_000_000);
        nhanVienNhanHoSo.duyetChoVay(20_000_000);
        nhanVienNhanHoSo.duyetChoVay(50_000_000);
        nhanVienNhanHoSo.duyetChoVay(100_000_000);
        nhanVienNhanHoSo.duyetChoVay(105_000_000);
    }
}
