package final_exam.cb4;

import java.util.List;

public class GiaiThuong extends ThanhPhanChuoi {
    ThanhPhanChuoi keTiep;

    public GiaiThuong(String tenGiai, List<String> boSoTrungThuong) {
        super(tenGiai, boSoTrungThuong);
    }

    @Override
    public ThanhPhanChuoi thietLapKeTiep(ThanhPhanChuoi thietLap) {
        this.keTiep = thietLap;
        return thietLap;
    }

    @Override
    public String doVeSo(String veSo) {
        for (String so : boSoTrungThuong) {
            if (so.equals(veSo)) {
                return "Trúng " + tenGiai + ": " + so;
            }
        }

        return keTiep.doVeSo(veSo);
    }
}
