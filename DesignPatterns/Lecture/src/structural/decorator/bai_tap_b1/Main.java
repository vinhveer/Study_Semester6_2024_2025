package structural.decorator.bai_tap_b1;

public class Main {
    public static void main(String[] args) {
        BieuThucDonGian donGian = new BieuThucDonGian(100);
        Cong cong = new Cong(donGian, 100);
        Cong cong1 = new Cong(cong, 100);
        Tru tru = new Tru(cong1, 100);
        Nhan nhan = new Nhan(tru, 100);
        Chia chia = new Chia(nhan, 2);

        System.out.println(chia.bieuThuc() + " = " + chia.giaTri());
    }
}
