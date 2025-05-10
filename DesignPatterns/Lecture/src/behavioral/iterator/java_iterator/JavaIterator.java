package behavioral.iterator.java_iterator;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class JavaIterator {
    public static void duyet(Iterator<Integer> iterator) {
        iterator.forEachRemaining(new ConsumerCC());
    }

    public static void main(String[] args) {
        List<Integer> list = new ArrayList<>(Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10));
        Iterator<Integer> iterator = list.iterator();

        while (iterator.hasNext()) System.out.println(iterator.next());

        System.out.println("---");
        list.iterator().forEachRemaining(integer -> System.out.println(integer));

        System.out.println("---");
        list.iterator().forEachRemaining(new ConsumerCC());

        System.out.println("---");
        duyet(list.iterator());
    }
}
