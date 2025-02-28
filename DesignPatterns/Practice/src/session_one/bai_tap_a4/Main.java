package session_one.bai_tap_a4;

public class Main {
    public static void main(String[] args) {
        User user1 = new User("user1");
        User user2 = new User("user2");
        User user3 = new User("user3");
        user1.voteFor(Candidate.DONALD_TRUMP);
        user2.voteFor(Candidate.JOE_BIDEN);
        user3.voteFor(Candidate.JOE_BIDEN);
        Election.getInstance().printResult();

        user1.voteFor(Candidate.JOE_BIDEN);
        user2.voteFor(Candidate.JOE_BIDEN);
    }
}
