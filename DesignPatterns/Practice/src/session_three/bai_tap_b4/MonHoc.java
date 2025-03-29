package session_three.bai_tap_b4;

public class MonHoc extends KeHoachHocTap {
    int soTinChi;
    int hocPhi;

    public MonHoc(String ten, int soTinChi, int hocPhi) {
        super(ten);
        this.soTinChi = soTinChi;
        this.hocPhi = hocPhi;
    }

    @Override
    public KeHoachHocTap them(KeHoachHocTap keHoachHocTap) {
        return null;
    }

    @Override
    public void xoa(KeHoachHocTap keHoachHocTap) {

    }

    @Override
    public int getHocPhi() {
        return this.hocPhi;
    }

    @Override
    public int getSoTinChi() {
        return this.soTinChi * hocPhi;
    }

    @Override
    public String thongTin() {
        StringBuilder builder = new StringBuilder();
        builder.append(this.prefix)
                .append(this.ten)
                .append(", số tín chỉ: ")
                .append(this.soTinChi)
                .append(", học phí: ")
                .append(this.hocPhi)
                .append("\n");
        return builder.toString();
    }
}
