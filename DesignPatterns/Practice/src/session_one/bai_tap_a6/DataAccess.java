package session_one.bai_tap_a6;

import java.util.ArrayList;
import java.util.List;

public class DataAccess {
    private static DataAccess instance;
    List<SanPham> danhSachSanPham;

    protected DataAccess() {
        danhSachSanPham = new ArrayList<>();
    }

    public static DataAccess getInstance() {
        if (instance == null) {
            instance = new DataAccess();
        }
        return instance;
    }

    public void themSanPham(SanPham sanPham) {
        danhSachSanPham.add(sanPham);
    }

    public void xoaSanPham(String maSanPham) {
        danhSachSanPham.removeIf(sanPham -> sanPham.getMaSanPham().equals(maSanPham));
    }

    public void suaSanPham(SanPham sanPham) {
        for (SanPham sp : danhSachSanPham) {
            if (sp.getMaSanPham().equals(sanPham.getMaSanPham())) {
                sp.setTenSanPham(sanPham.getTenSanPham());
                sp.setSoLuong(sanPham.getSoLuong());
                sp.setDonGia(sanPham.getDonGia());
                break;
            }
        }
    }
}
