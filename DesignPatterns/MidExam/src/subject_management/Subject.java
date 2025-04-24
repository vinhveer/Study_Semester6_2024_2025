package subject_management;

public class Subject extends StudyPlan {
    int credit;
    int fee;

    public Subject(String name, int credit, int fee) {
        super(name);
        this.credit = credit;
        this.fee = fee;
    }

    @Override
    public void addStudyPlan(StudyPlan studyPlan) {}

    @Override
    public void removeStudyPlan(StudyPlan studyPlan) {}

    @Override
    public String getStudyPlanTree() {
        return this.prefix + this.name;
    }

    @Override
    public int getCredit() {
        return this.credit;
    }

    @Override
    public int getFee() {
        return this.fee;
    }
}
