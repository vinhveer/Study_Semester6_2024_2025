package behavioral.observer.ti_gia;

import java.util.ArrayList;
import java.util.List;

public class TiGia {
    List<TheoDoiTiGia> nhaDauTus = new ArrayList<>();

    public void dangKy(TheoDoiTiGia nhaDauTu) {
        nhaDauTus.add(nhaDauTu);
    }

    public void huyDangKy(TheoDoiTiGia nhaDauTu) {
        nhaDauTus.remove(nhaDauTu);
    }

    public void thongBao(float delta) {
        for (var nhaDauTu : nhaDauTus) {
            nhaDauTu.capNhat(delta);
        }
    }
}
