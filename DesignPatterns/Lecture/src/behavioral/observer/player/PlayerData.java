package behavioral.observer.player;

public class PlayerData {
    int thoiGian;
    int countDown;
    int grade;

    public PlayerData(int thoiGian, int countDown, int grade) {
        this.thoiGian = thoiGian;
        this.countDown = countDown;
        this.grade = grade;
    }

    IPlayerDataListener playerDataListener;

    public void setThoiGian(int thoiGian) {
        this.thoiGian = thoiGian;
    }

    public void setCountDown(int countDown) {
        this.countDown = countDown;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public void addListener(IPlayerDataListener listener) {
        this.playerDataListener = listener;
    }

    public void addEvent() {
        playerDataListener.listen(this);
    }

    @Override
    public String toString() {
        return "PlayerData{" +
                "thoiGian='" + thoiGian + '\'' +
                ", countDown=" + countDown +
                ", grade=" + grade +
                ", playerDataListener=" + playerDataListener +
                '}';
    }
}
