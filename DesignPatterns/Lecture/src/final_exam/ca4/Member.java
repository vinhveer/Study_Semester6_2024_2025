package final_exam.ca4;

public abstract class Member implements ITopicListener {
    String name;
    Topic topic;

    public Member(String name, Topic topic) {
        this.name = name;
        this.topic = topic;

        this.topic.attach(this);
    }
}
