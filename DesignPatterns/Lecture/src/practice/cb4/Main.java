package practice.cb4;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        ThanhPhanChuoi db = new GiaiThuong("Giải đặc biệt",
                new ArrayList<>(List.of("834744")));

        ThanhPhanChuoi db1 = new GiaiThuong("Giải nhất",
                new ArrayList<>(List.of("83744")));

        ThanhPhanChuoi db2 = new GiaiThuong("Giải nhì",
                new ArrayList<>(List.of("83474")));

        ThanhPhanChuoi db3 = new GiaiThuong("Giải ba",
                new ArrayList<>(List.of("34744", "38822")));

        ThanhPhanChuoi db4 = new GiaiThuong("Giải khuyến khích",
                new ArrayList<>(List.of("83444", "32432", "23234", "43342", "34444")));

        ThanhPhanChuoi giaiTam = new GiaiThapNhat("Giải tám",
                new ArrayList<>(List.of("56")));

        db.thietLapKeTiep(db1)
            .thietLapKeTiep(db2)
            .thietLapKeTiep(db3)
            .thietLapKeTiep(db4)
            .thietLapKeTiep(giaiTam);

        System.out.println(db.doVeSo("32432"));
    }
}
