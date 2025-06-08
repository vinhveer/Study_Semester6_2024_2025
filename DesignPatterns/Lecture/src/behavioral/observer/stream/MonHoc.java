package behavioral.observer.stream;

public class MonHoc {
    String maMonHoc;
    String tenMonHoc;

    public MonHoc(String maMonHoc, String tenMonHoc) {
        this.maMonHoc = maMonHoc;
        this.tenMonHoc = tenMonHoc;
    }

    @Override
    public String toString() {
        return "MonHoc{" +
                "maMonHoc='" + maMonHoc + '\'' +
                ", tenMonHoc='" + tenMonHoc + '\'' +
                '}';
    }
}
