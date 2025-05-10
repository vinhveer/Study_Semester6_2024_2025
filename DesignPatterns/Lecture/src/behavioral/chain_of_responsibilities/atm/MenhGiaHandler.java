package behavioral.chain_of_responsibilities.atm;

public abstract class MenhGiaHandler {
    int giaTri;

    public MenhGiaHandler(int giaTri) {
        this.giaTri = giaTri;
    }

    public int getGiaTri() {
        return giaTri;
    }

    public MenhGiaHandler thietLapKeTiep(MenhGiaHandler menhGiaHandlerKeTiep) {
        menhGiaHandlerKeTiep.giaTri = this.giaTri;
        return menhGiaHandlerKeTiep;
    }

    public abstract void rutTien(int soTien);
}
