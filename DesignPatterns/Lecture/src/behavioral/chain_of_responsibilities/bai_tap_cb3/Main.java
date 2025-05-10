package behavioral.chain_of_responsibilities.bai_tap_cb3;

public class Main {
    public static void main(String[] args) {
        BacThongThuong bac1 = new BacThongThuong();
        bac1.mucMin = 0;
        bac1.mucMax = 50;
        bac1.gia = 50;

        BacThongThuong bac2 = new BacThongThuong();
        bac2.mucMin = 51;
        bac2.mucMax = 100;
        bac2.gia = 100;

        BacThongThuong bac3 = new BacThongThuong();
        bac3.mucMin = 101;
        bac3.mucMax = 200;
        bac3.gia = 200;

        BacThongThuong bac4 = new BacThongThuong();
        bac4.mucMin = 201;
        bac4.mucMax = 300;
        bac4.gia = 300;

        BacThongThuong bac5 = new BacThongThuong();
        bac5.mucMin = 301;
        bac5.mucMax = 400;
        bac5.gia = 400;

        BacCaoNhat bacCaoNhat = new BacCaoNhat();
        bacCaoNhat.mucMin = 401;
        bacCaoNhat.mucMax = Integer.MAX_VALUE;
        bacCaoNhat.gia = 500;

        bac1.keTiep(bac2);
        bac2.keTiep(bac3);
        bac3.keTiep(bac4);
        bac4.keTiep(bac5);
        bac5.keTiep(bacCaoNhat);

        System.out.println(bac1.tinhTien(1000));
    }
}