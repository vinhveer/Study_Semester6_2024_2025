package final_exam.ca4;

import java.util.ArrayList;
import java.util.List;

public class MemberB extends Member {
    List<News> receivedNews = new ArrayList<>();

    public MemberB(String name, Topic topic) {
        super(name, topic);
    }

    @Override
    public void onInsert(News news) {
        System.out.println(name);
        receivedNews.add(news);
        for (News news1 : receivedNews) {
            System.out.println(news1.toString());
        }
    }

    @Override
    public void onUpdate(News news) {
        System.out.println(name);
        receivedNews.remove(news);
        for (News news1 : receivedNews) {
            System.out.println(news1.toString());
        }
    }
}
