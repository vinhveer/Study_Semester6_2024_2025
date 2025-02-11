public class Main {
    public static void main(String[] args) {
        // Tạo 1 sinh viên IT (Chuyển số nguyên thành float)
        SinhVienIT sv2 = new SinhVienIT("Trần Văn B", 9.0f, 7.0f, 8.0f);

        // Tạo 1 sinh viên Biz (Chuyển số nguyên thành float)
        SinhVienBiz sv3 = new SinhVienBiz("Lê Thị C", 8.0f, 7.0f);

        // In thông tin sinh viên
        sv2.inThongTin();
        System.out.println("------------------------");
        sv3.inThongTin();
    }
}
