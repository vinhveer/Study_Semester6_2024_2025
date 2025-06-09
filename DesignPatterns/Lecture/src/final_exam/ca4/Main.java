package final_exam.ca4;

public class Main {
    public static void main(String[] args) {
        Topic luaDao = new Topic();

        Member member1 = new MemberA("Trá", luaDao);
        Member member2 = new MemberB("Loz Hiếu lỏ", luaDao);

        News luaDao1 = new News(1, "Chích điện");
        News luaDao2 = new News(2, "Chích");

        luaDao.insert(luaDao1);
        luaDao.insert(luaDao2);
    }
}
