package practice.ca4;

public class Main {
    public static void main(String[] args) {
        Topic topic = new Topic();
        Member vinh = new MemberA("Vinh", topic);
        Member nguyen = new MemberB("Nguyen", topic);

        topic.insert("Hom nay la ngay nghi hoc");
        topic.insert("Hom nay la ngay hoc bu");


    }
}
