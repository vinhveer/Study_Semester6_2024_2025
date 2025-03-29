package behavioral.observer.ca5;

class TaiKhoan implements TheoDoiATM {
    private int soDu;
    private ATM atm;

    public TaiKhoan(int soDu, ATM atm) {
        this.soDu = soDu;
        this.atm = atm;
    }

    public void duaTheVaoATM() {
        atm.nhanThe(this);
    }

    public void rutThe() {
        atm.traThe();
    }

    @Override
    public boolean kiemTraSoDu(int soTienRut) {
        return soDu >= soTienRut;
    }

    @Override
    public void nhanThongBao(int soTienRut, boolean thanhCong) {
        if (thanhCong) {
            soDu -= soTienRut;
            System.out.println("Rút tiền thành công. Số dư còn lại: " + soDu);
        } else {
            System.out.println("Rút tiền thất bại. Số dư không đủ. Số dư hiện tại: " + soDu);
        }
    }
}
