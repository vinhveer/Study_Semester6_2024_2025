package session_three.bai_tap_b4;

import java.util.ArrayList;
import java.util.List;

public class KeHoachChung extends KeHoachHocTap {
    List<KeHoachHocTap> keHoachHocTaps = new ArrayList<>();

    public KeHoachChung(String ten) {
        super(ten);
    }

    @Override
    public KeHoachHocTap them(KeHoachHocTap keHoachHocTap) {
        keHoachHocTaps.add(keHoachHocTap);
        return keHoachHocTap;
    }

    @Override
    public void xoa(KeHoachHocTap keHoachHocTap) {
        keHoachHocTaps.remove(keHoachHocTap);
    }

    @Override
    public int getHocPhi() {
        int hocPhi = 0;
        for (var keHoachHocTap : keHoachHocTaps) {
            hocPhi += keHoachHocTap.getHocPhi();
        }

        return hocPhi;
    }

    @Override
    public int getSoTinChi() {
        int soTinChi = 0;

        for (var keHoachHocTap : keHoachHocTaps) {
            soTinChi += keHoachHocTap.getSoTinChi();
        }

        return soTinChi;
    }

    @Override
    public String thongTin() {
        StringBuilder builder = new StringBuilder();
        builder.append("Ke hoach hoc tap chung: ").append(ten).append("\n");

        for (var keHoachHocTap : keHoachHocTaps) {
            builder.append(keHoachHocTap.thongTin());
        }

        return builder.toString();
    }
}
