package session_two.bai_tap_a5;

public class Chapter {
    private int id;
    private String title;

    public Chapter(int id, String title) {
        this.id = id;
        this.title = title;
    }

    @Override
    public String toString() {
        return "Chapter{" +
                "id=" + id +
                ", title='" + title + '\'' +
                '}';
    }
}
