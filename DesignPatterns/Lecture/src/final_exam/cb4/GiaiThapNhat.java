package final_exam.cb4;

import java.util.List;

public class GiaiThapNhat extends ThanhPhanChuoi {
    public GiaiThapNhat(String tenGiai, List<String> boSoTrungThuong) {
        super(tenGiai, boSoTrungThuong);
    }

    @Override
    public ThanhPhanChuoi thietLapKeTiep(ThanhPhanChuoi thietLap) {
        return null;
    }

    @Override
    public String doVeSo(String veSo) {
        for (String so : boSoTrungThuong) {
            if (so.equals(veSo)) {
                return "Trúng " + tenGiai + ": " + so;
            }
        }

        return "Không trúng giải " + tenGiai;
    }
}
