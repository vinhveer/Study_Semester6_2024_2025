package subject_management;

public abstract class StudyPlan {
    String name;

    String prefix = "";

    public StudyPlan(String name) {
        this.name = name;
    }

    public abstract void addStudyPlan(StudyPlan studyPlan);
    public abstract void removeStudyPlan(StudyPlan studyPlan);
    public abstract String getStudyPlanTree();
    public abstract int getCredit();
    public abstract int getFee();
}
