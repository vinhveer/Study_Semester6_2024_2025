package practice.ca4;

import java.util.ArrayList;
import java.util.List;

public class Topic {
    List<ITopicListener> listeners = new ArrayList<>();
    List<News> news = new ArrayList<>();

    int id = 0;

    public void attach(ITopicListener listener) {
        listeners.add(listener);
    }

    public void detach(ITopicListener listener) {
        listeners.remove(listener);
    }

    public void insert(String content) {
        News n = new News(++id, content);
        news.add(n);
        for (ITopicListener listener : listeners) {
            listener.insertListener(n);
        }
    }
}
