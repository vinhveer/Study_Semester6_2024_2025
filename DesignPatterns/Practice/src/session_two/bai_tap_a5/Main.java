package session_two.bai_tap_a5;

import java.util.Arrays;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        Chapter chapter1 = new Chapter(1, "Chapter 1");
        Chapter chapter2 = new Chapter(2, "Chapter 2");
        Chapter chapter3 = new Chapter(3, "Chapter 3");

        List<Chapter> chapters = Arrays.asList(chapter1, chapter2, chapter3);

        Book book = new Book.Builder()
                .buildTitle("Example Book")
                .buildAuthor("John Doe")
                .buildNumberOfPages(100)
                .buildChapters(chapters)
                .build();

        System.out.println(book.toString());
    }
}
