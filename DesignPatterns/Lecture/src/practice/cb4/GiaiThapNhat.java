package practice.cb4;

import java.util.List;

public class GiaiThapNhat extends ThanhPhanChuoi {
    public GiaiThapNhat(String tenGiai, List<String> boSoTrungThuong) {
        super(tenGiai, boSoTrungThuong);
    }

    @Override
    public ThanhPhanChuoi thietLapKeTiep(ThanhPhanChuoi k) {
        return null;
    }

    @Override
    public String doVeSo(String veSo) {
        for (String s : boSoTrungThuong) {
            if (veSo.endsWith(s)) {
                return "Bạn đã trúng giải " + tenGiai;
            }
        }
        return "Chúc bạn may mắn lần sau";
    }
}
