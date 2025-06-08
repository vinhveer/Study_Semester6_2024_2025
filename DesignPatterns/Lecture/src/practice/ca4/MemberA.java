package practice.ca4;

public class MemberA extends Member {
    public MemberA(String name, Topic topic) {
        super(name, topic);
    }

    @Override
    public void insertListener(News n) {
        System.out.println(name);
        System.out.println(n.toString());
    }

    @Override
    public void updateListener(News n) {

    }
}
