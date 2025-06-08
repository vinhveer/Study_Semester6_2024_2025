package behavioral.observer.stream;

public interface IMyStreamListener<T> {
    void listen(T t);
}
