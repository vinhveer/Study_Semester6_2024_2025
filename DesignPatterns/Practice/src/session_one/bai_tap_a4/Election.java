package session_one.bai_tap_a4;

import java.util.HashSet;
import java.util.Set;

public class Election {
    private static Election instance;
    private int joeBidenVoteCount;
    private int donaldTrumpVoteCount;
    private Set<String> votedUsers;

    private Election() {
        this.joeBidenVoteCount = 0;
        this.donaldTrumpVoteCount = 0;
        this.votedUsers = new HashSet<>();
    }

    public static Election getInstance() {
        if (instance == null) {
            instance = new Election();
        }
        return instance;
    }

    public void vote(User user, Candidate candidate) {
        if (votedUsers.contains(user.getName())) {
            System.out.println("User " + user.getName() + " has already voted");
            return;
        }

        votedUsers.add(user.getName());

        switch (candidate) {
            case JOE_BIDEN:
                joeBidenVoteCount++;
                break;
            case DONALD_TRUMP:
                donaldTrumpVoteCount++;
                break;
            default:
                System.out.println("Invalid candidate");
        }
    }

    public void printResult() {
        System.out.println("Joe Biden: " + joeBidenVoteCount);
        System.out.println("Donald Trump: " + donaldTrumpVoteCount);
    }
}
