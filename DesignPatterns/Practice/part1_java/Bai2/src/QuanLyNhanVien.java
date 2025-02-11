import java.util.ArrayList;
import java.util.List;

public class QuanLyNhanVien implements IQuanLy{
    List<NhanVien> nhanViens = new ArrayList<NhanVien>();

    @Override
    public void them(NhanVien nhanVien) {
        nhanViens.add(nhanVien);
    }

    @Override
    public void inDanhSach() {
        for (NhanVien nhanVien : nhanViens) {
            System.out.println(nhanVien);
        }
    }
}
