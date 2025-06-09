package final_exam.ca5;

public class ATM {
    IATMListener listener;

    void dutVao(IATMListener listener) {
        this.listener = listener;
    }

    void nhaRa() {
        this.listener = null;
    }

    void rutTien(int soTienRut) {
        int soDuConLai = this.listener.onKiemTrasoDu();

        if (soTienRut > soDuConLai) {
            this.listener.onNhanThongBao(soDuConLai, false);
            this.nhaRa();
        } else {
            this.listener.onNhanThongBao(soTienRut, true);
            this.nhaRa();
        }
    }
}
