package behavioral.chain_of_responsibilities.atm;

public class MenhGia extends MenhGiaHandler {
    MenhGiaHandler menhGiaHandlerKeTiep;

    public MenhGia(int giaTri) {
        super(giaTri);
    }

    @Override
    public MenhGiaHandler thietLapKeTiep(MenhGiaHandler menhGiaHandlerKeTiep) {
        this.menhGiaHandlerKeTiep = menhGiaHandlerKeTiep;
        return menhGiaHandlerKeTiep;
    }

    @Override
    public void rutTien(int soTien) {
        int soTo = soTien / this.giaTri;
        int soDu = soTien % this.giaTri;

        if (soTo > 0) {
            System.out.println(soTo + " * " + giaTri);
        }

        if (soDu > 0) {
            menhGiaHandlerKeTiep.rutTien(soDu);
        }
    }
}
