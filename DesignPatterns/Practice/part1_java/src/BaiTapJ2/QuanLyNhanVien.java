package BaiTapJ2;

import java.util.ArrayList;
import java.util.List;

public class QuanLyNhanVien implements IQuanLy {
    List<NhanVien> nhanVienList = new ArrayList<NhanVien>();

    @Override
    public void them(NhanVien nv) {
        nhanVienList.add(nv);
    }

    @Override
    public void inDS() {
        int index = 0;
        for (NhanVien nhanVien : nhanVienList) {
            index++;
            System.out.println("Nhân viên " + index);
            System.out.println(nhanVien.toString());
        }
    }
}
