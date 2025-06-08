package practice.ca4;

public class News {
    int id;
    String content;

    public News(int id, String content) {
        this.id = id;
        this.content = content;
    }

    @Override
    public String toString() {
        return "News{" +
                "id=" + id +
                ", content='" + content + '\'' +
                '}';
    }
}
