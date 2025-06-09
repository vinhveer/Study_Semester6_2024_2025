package final_exam.ca4;

public class News {
    int id;
    String title;

    public News(int id, String title) {
        this.id = id;
        this.title = title;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", title='" + title + '\'' +
                '}';
    }
}
