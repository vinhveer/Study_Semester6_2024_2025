package behavioral.observer.stream;

import java.util.ArrayList;
import java.util.List;

public class MyStream<T> {
    List<IMyStreamListener<T>> listeners = new ArrayList<>();

    // Attach
    public void addListener(IMyStreamListener<T> listener) {
        listeners.add(listener);
    }

    // Detach
    public void removeListener(IMyStreamListener<T> listener) {
        listeners.remove(listener);
    }

    // Notify
    public void addEvent(T t) {
        for (IMyStreamListener<T> listener : listeners) {
            listener.listen(t);
        }
    }
}
