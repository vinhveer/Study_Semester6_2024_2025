package behavioral.iterator.java_iterator;
import java.util.function.Consumer;

public class ConsumerCC implements Consumer<Object> {
    @Override
    public void accept(Object t) {
        System.out.println(t);
    }
}