package behavioral.chain_of_responsibilities.atm;

public abstract class ChuoiMenhGiaFactory {
    abstract MenhGiaHandler getChuoiMenhGia(int menhGia);

    public void rutTien(int soTien, int menhGiaCaoNhat) {
        MenhGiaHandler chuoiMenhGia = getChuoiMenhGia(menhGiaCaoNhat);

        if (chuoiMenhGia != null) {
            chuoiMenhGia.rutTien(soTien);
        }
    }
}
