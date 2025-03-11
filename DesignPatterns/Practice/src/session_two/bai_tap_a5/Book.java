package session_two.bai_tap_a5;

import java.util.List;

public class Book {
    private String title;
    private int numberOfPages;
    private String author;
    private List<Chapter> chapters;

    public Book(Builder builder) {
        this.title = builder.title;
        this.numberOfPages = builder.numberOfPages;
        this.author = builder.author;
        this.chapters = builder.chapters;
    }

    @Override
    public String toString() {
        return "Book{" +
                "title='" + title + '\'' +
                ", numberOfPages=" + numberOfPages +
                ", author='" + author + '\'' +
                ", chapters=" + chapters +
                '}';
    }

    public static class Builder {
        private String title;
        private int numberOfPages;
        private String author;
        private List<Chapter> chapters;

        public Builder buildTitle(String title) {
            this.title = title;
            return this;
        }

        public Builder buildNumberOfPages(int numberOfPages) {
            this.numberOfPages = numberOfPages;
            return this;
        }

        public Builder buildAuthor(String author) {
            this.author = author;
            return this;
        }

        public Builder buildChapters(List<Chapter> chapters) {
            this.chapters = chapters;
            return this;
        }

        public Book build() {
            return new Book(this);
        }
    }
}
