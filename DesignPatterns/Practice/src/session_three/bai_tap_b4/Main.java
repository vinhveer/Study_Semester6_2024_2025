package session_three.bai_tap_b4;

public class Main {
    public static void main(String[] args) {
        KeHoachChung keHoachChung = new KeHoachChung("Năm học 2022-2023");
        KeHoachChung keHoachChung1 = new KeHoachChung("Học kì 1");
        KeHoachChung keHoachChung2 = new KeHoachChung("Học kì 2");

        MonHoc java = new MonHoc("Java", 4, 510000);
        MonHoc c = new MonHoc("C", 3, 500000);
        MonHoc python = new MonHoc("Python", 3, 500000);
        MonHoc php = new MonHoc("PHP", 3, 500000);
        MonHoc html = new MonHoc("HTML", 2, 500000);
        MonHoc css = new MonHoc("CSS", 2, 500000);
        MonHoc javascript = new MonHoc("JavaScript", 3, 500000);

        keHoachChung1.them(java);
        keHoachChung1.them(c);
        keHoachChung1.them(python);

        keHoachChung2.them(php);
        keHoachChung2.them(html);
        keHoachChung2.them(css);
        keHoachChung2.them(javascript);

        keHoachChung.them(keHoachChung1);
        keHoachChung.them(keHoachChung2);

        System.out.println("Thông tin kế hoạch chung:" + keHoachChung.thongTin());
    }
}
