package final_exam.cb4;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        ThanhPhanChuoi giaiEc = new GiaiThapNhat("Giải éc", List.of("494382"));
        ThanhPhanChuoi giaiNhat = new GiaiThuong("Giải nhất", List.of("493432"));
        ThanhPhanChuoi giaiNhi = new GiaiThuong("Giải nhì", List.of("423443"));

        giaiNhat.thietLapKeTiep(giaiNhi).thietLapKeTiep(giaiEc);

        System.out.println(giaiNhat.doVeSo("493432"));
    }
}
