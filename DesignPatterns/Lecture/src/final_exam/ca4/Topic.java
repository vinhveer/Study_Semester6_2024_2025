package final_exam.ca4;

import java.util.ArrayList;
import java.util.List;

public class Topic {
    List<ITopicListener> listeners = new ArrayList<ITopicListener>();
    List<News> listNews = new ArrayList<News>();

    public void attach(ITopicListener listener) {
        listeners.add(listener);
    }

    public void detach(ITopicListener listener) {
        listeners.remove(listener);
    }

    public void insert(News news) {
        listNews.add(news);
        for (var listener : listeners) {
            listener.onInsert(news);
        }
    }

    public void update(News news) {
        for (var currentNews : listNews) {
            if (currentNews.id == news.id) {
                listNews.remove(currentNews);
                listNews.add(news);
            } else {
                System.out.println(news.id + " don't match");
            }
        }

        for (var listener : listeners) {
            listener.onUpdate(news);
        }
    }
}
