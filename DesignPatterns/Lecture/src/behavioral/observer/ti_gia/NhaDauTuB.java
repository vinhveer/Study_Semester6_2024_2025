package behavioral.observer.ti_gia;

public class NhaDauTuB extends NhaDauTu {
    public NhaDauTuB(TiGia tiGia, String ten) {
        super(tiGia, ten);
    }

    @Override
    public void capNhat(float delta) {
        if (delta >= 0)
            System.out.println(ten + ": Mua vào");
        else
            System.out.println(ten + ": Bán ra");
    }
}
