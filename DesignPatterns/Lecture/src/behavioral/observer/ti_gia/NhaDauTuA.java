package behavioral.observer.ti_gia;

public class NhaDauTuA extends NhaDauTu {
    public NhaDauTuA(TiGia tiGia, String ten) {
        super(tiGia, ten);
    }

    @Override
    public void capNhat(float delta) {
        if (delta >= 0)
            System.out.println(ten + ": Bán ra");
        else
            System.out.println(ten + ": Mua vào");
    }
}
