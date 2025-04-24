package subject_management;

public class Main {
    public static void main(String[] args) {
        TimeLine namhoc1 = new TimeLine("Năm học 2024 - 2025");
        TimeLine nam1 = new TimeLine("Năm 1");
        TimeLine ky1 = new TimeLine("Kỳ 1");
        TimeLine ky2 = new TimeLine("Kỳ 2");

        // Thêm các môn kỳ 1
        ky1.addStudyPlan(new Subject("Thuật toán 1", 3, 300000));
        ky1.addStudyPlan(new Subject("Thuật toán 2", 4, 400000));
        ky1.addStudyPlan(new Subject("Thuật toán 3", 2, 200000));
        ky1.addStudyPlan(new Subject("Thuật toán 4", 5, 500000));

        // Thêm các môn kỳ 2
        ky2.addStudyPlan(new Subject("Học lại Thuật toán 1", 3, 300000));
        ky2.addStudyPlan(new Subject("Học lại Thuật toán 2", 4, 400000));
        ky2.addStudyPlan(new Subject("Học lại Thuật toán 3", 2, 200000));
        ky2.addStudyPlan(new Subject("Học lại Thuật toán 4", 5, 500000));

        nam1.addStudyPlan(ky1);
        nam1.addStudyPlan(ky2);

        namhoc1.addStudyPlan(nam1);

        System.out.println(namhoc1.getStudyPlanTree());
    }
}
