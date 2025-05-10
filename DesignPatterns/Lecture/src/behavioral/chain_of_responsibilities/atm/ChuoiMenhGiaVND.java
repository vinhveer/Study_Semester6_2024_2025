package behavioral.chain_of_responsibilities.atm;

import java.awt.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ChuoiMenhGiaVND extends ChuoiMenhGiaFactory {
    @Override
    MenhGiaHandler getChuoiMenhGia(int menhGia) {
        List<Integer> list = new ArrayList<>(Arrays.asList(1, 2, 5, 10, 20, 50, 100, 200, 500));

        if (list.contains(menhGia)) {
            MenhGiaHandler head = new MenhGia(menhGia);

            for (int i = list.indexOf(menhGia); i < list.size() - 1; i++) {
                head = head.thietLapKeTiep(new MenhGia(list.get(i + 1)));
            }

            return head;
        } else {
            return null;
        }
    }

    @Override
    public void rutTien(int soTien, int menhGiaCaoNhat) {
        super.rutTien(soTien, menhGiaCaoNhat);
    }
}
