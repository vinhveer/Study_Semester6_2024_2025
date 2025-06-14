package final_exam.cb4;

import java.util.List;

public abstract class ThanhPhanChuoi {
    String tenGiai;
    List<String> boSoTrungThuong;

    public ThanhPhanChuoi(String tenGiai, List<String> boSoTrungThuong) {
        this.tenGiai = tenGiai;
        this.boSoTrungThuong = boSoTrungThuong;
    }

    public abstract ThanhPhanChuoi thietLapKeTiep(ThanhPhanChuoi thietLap);
    public abstract String doVeSo(String veSo);
}
