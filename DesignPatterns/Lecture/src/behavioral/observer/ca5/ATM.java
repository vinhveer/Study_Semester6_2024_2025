package behavioral.observer.ca5;


class ATM {
    private TheoDoiATM theATM;

    public void nhanThe(TheoDoiATM atm) {
        this.theATM = atm;
        System.out.println("Thẻ đã được đưa vào ATM.");
    }

    public void traThe() {
        System.out.println("Thẻ đã được trả lại.");
        this.theATM = null;
    }

    public void rutTien(int soTien) {
        if (theATM == null) {
            System.out.println("Không có thẻ trong ATM.");
            return;
        }
        boolean thanhCong = theATM.kiemTraSoDu(soTien);
        theATM.nhanThongBao(soTien, thanhCong);
    }
}