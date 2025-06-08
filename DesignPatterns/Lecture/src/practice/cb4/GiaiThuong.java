package practice.cb4;

import java.util.List;

public class GiaiThuong extends ThanhPhanChuoi {
    ThanhPhanChuoi keTiep;

    public GiaiThuong(String tenGiai, List<String> boSoTrungThuong) {
        super(tenGiai, boSoTrungThuong);
    }

    @Override
    public ThanhPhanChuoi thietLapKeTiep(ThanhPhanChuoi k) {
        this.keTiep = k;
        return this.keTiep;
    }

    @Override
    public String doVeSo(String veSo) {
        for (String s : boSoTrungThuong) {
            if (veSo.endsWith(s)) {
                return "Bạn đã trúng giải " + tenGiai;
            }
        }
        return this.keTiep.doVeSo(veSo);
    }
}
