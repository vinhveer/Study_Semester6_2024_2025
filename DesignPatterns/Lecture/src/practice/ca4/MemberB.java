package practice.ca4;

import java.util.ArrayList;
import java.util.List;

public class MemberB extends Member {
    List<News> news = new ArrayList<>();

    public MemberB(String name, Topic topic) {
        super(name, topic);
    }

    @Override
    public void insertListener(News n) {
        news.add(0, n);
        System.out.println(name);
        for (var t : news) {
            System.out.println(t.toString());
            System.out.println("---");
        }
    }

    @Override
    public void updateListener(News n) {

    }
}
