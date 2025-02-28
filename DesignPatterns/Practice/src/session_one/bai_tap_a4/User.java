package session_one.bai_tap_a4;

public class User {
    private String name;

    public User(String name) {
        this.name = name;
    }

    public void voteFor(Candidate candidate) {
        Election election = Election.getInstance();
        election.vote(this, candidate);
    }

    public String getName() {
        return name;
    }
}
