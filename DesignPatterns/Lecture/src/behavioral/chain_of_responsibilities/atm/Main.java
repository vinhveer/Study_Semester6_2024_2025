package behavioral.chain_of_responsibilities.atm;

public class Main {
    public static void main(String[] args) {
        MenhGiaHandler m1 = new MenhGiaThapNhat(1000);
        MenhGiaHandler m2 = new MenhGia(2000);
        MenhGiaHandler m5 = new MenhGia(5000);
        MenhGiaHandler m10 = new MenhGia(10000);
        MenhGiaHandler m20 = new MenhGia(20000);
        MenhGiaHandler m50 = new MenhGia(50000);
        MenhGiaHandler m100 = new MenhGia(100000);
        MenhGiaHandler m200 = new MenhGia(200000);
        MenhGiaHandler m500 = new MenhGia(500000);

        m500.thietLapKeTiep(m200)
            .thietLapKeTiep(m100)
            .thietLapKeTiep(m50)
            .thietLapKeTiep(m20)
            .thietLapKeTiep(m10)
            .thietLapKeTiep(m5)
            .thietLapKeTiep(m2)
            .thietLapKeTiep(m1);

        m500.rutTien(728000);

        ChuoiMenhGiaVND chuoiMenhGiaVND = new ChuoiMenhGiaVND();
        chuoiMenhGiaVND.rutTien(234000, 50);
    }
}
