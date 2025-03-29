package session_three.bai_tap_b4;

public abstract class KeHoachHocTap {
    protected String ten;
    String prefix = "";

    public KeHoachHocTap(String ten) {
        this.ten = ten;
    }

    public abstract KeHoachHocTap them(KeHoachHocTap keHoachHocTap);
    public abstract void xoa(KeHoachHocTap keHoachHocTap);
    public abstract int getHocPhi();
    public abstract int getSoTinChi();
    public abstract String thongTin();
}
