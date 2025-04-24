package subject_management;

import java.util.ArrayList;
import java.util.List;

public class TimeLine extends StudyPlan {
    List<StudyPlan> studyPlans = new ArrayList<>();

    public TimeLine(String name) {
        super(name);
    }

    @Override
    public void addStudyPlan(StudyPlan studyPlan) {
        studyPlans.add(studyPlan);
    }

    @Override
    public void removeStudyPlan(StudyPlan studyPlan) {
        studyPlans.remove(studyPlan);
    }

    @Override
    public String getStudyPlanTree() {
        StringBuilder studyPlanTree = new StringBuilder();

        studyPlanTree.append(this.prefix)
                .append(this.name);

        for (StudyPlan studyPlan : studyPlans) {
            studyPlan.prefix = this.prefix + "  ";
            studyPlanTree.append("\n").append(studyPlan.getStudyPlanTree());

            studyPlan.prefix = "";
        }

        return studyPlanTree.toString();
    }

    @Override
    public int getCredit() {
        return 0;
    }

    @Override
    public int getFee() {
        return 0;
    }
}
