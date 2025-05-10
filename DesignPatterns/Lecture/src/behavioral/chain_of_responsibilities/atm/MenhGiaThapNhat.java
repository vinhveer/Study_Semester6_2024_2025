package behavioral.chain_of_responsibilities.atm;

public class MenhGiaThapNhat extends MenhGiaHandler {
    public MenhGiaThapNhat(int giaTri) {
        super(giaTri);
    }

    @Override
    public MenhGiaHandler thietLapKeTiep(MenhGiaHandler menhGiaHandlerKeTiep) {
        return null;
    }

    @Override
    public void rutTien(int soTien) {
        int soTo = soTien / this.giaTri;
        System.out.println(soTo + " * " + giaTri);
    }
}
