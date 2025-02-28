package session_one.bai_tap_a6;

public class UI {
    DataAccess dataAccess = DataAccess.getInstance();

//    public UI() {
//        dataAccess = dataAccess.getInstance();
//    }

    public UI(String type) {
        dataAccess = DataAccessFactory.getDataAccess(type);
    }

    public void themSanPham(SanPham sanPham) {
        dataAccess.themSanPham(sanPham);
    }

    public void xoaSanPham(String maSanPham) {
        dataAccess.xoaSanPham(maSanPham);
    }

    public void suaSanPham(SanPham sanPham) {
        dataAccess.suaSanPham(sanPham);
    }

    public void hienThiSanPham() {
        for (SanPham sanPham : dataAccess.danhSachSanPham) {
            System.out.println("Mã sản phẩm: " + sanPham.getMaSanPham());
            System.out.println("Tên sản phẩm: " + sanPham.getTenSanPham());
            System.out.println("Số lượng: " + sanPham.getSoLuong());
            System.out.println("Đơn giá: " + sanPham.getDonGia());
            System.out.println();
        }
    }
}
