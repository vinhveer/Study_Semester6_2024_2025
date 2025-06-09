package final_exam.ca5;

public class TaiKhoan implements IATMListener {
    int soDuTKhoan;
    ATM atm;

    public TaiKhoan(int soDu, ATM atm) {
        this.soDuTKhoan = soDu;
        this.atm = atm;
    }

    public void dutThe() {
        this.atm.dutVao(this);
    }

    public void nhaThe() {
        this.atm.nhaRa();
    }

    @Override
    public int onKiemTrasoDu() {
        return soDuTKhoan;
    }

    @Override
    public void onNhanThongBao(int soDu, boolean status) {
        if (status) {
            soDuTKhoan = soDuTKhoan - soDu;
            System.out.println("Rút tiền thành công: " + soDu + "VND, số tiền còn lại: " + soDuTKhoan);
        } else {
            System.out.println("Rút tiền thất bại: " + soDuTKhoan + " không đủ cho giao dịch này");
        }
    }
}
