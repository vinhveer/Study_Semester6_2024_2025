package practice.state_pattern;

public class Main {
    public static void main(String[] args) {
        ThueBao tb = new ThueBao("Vinh", 8, new NormalState());
        tb.napTien(120000);
        tb.inThongTin();

        tb.goiDien(10);
    }
}
