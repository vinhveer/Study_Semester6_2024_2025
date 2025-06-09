package final_exam.ca4;

public class MemberA extends Member {
    public MemberA(String name, Topic topic) {
        super(name, topic);
    }

    @Override
    public void onInsert(News news) {
        System.out.println(name + " inserted " + news.toString());
    }

    @Override
    public void onUpdate(News news) {
        System.out.println(name + " updated " + news.toString());
    }
}
