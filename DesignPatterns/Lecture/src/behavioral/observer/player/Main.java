package behavioral.observer.player;

public class Main {
    public static void main(String[] args) {
        PlayerData playerData = new PlayerData(9, 4, 10);
        IPlayerDataListener dashboard = new Dashboard(playerData);

        playerData.setThoiGian(10);
        dashboard.listen(playerData);

        playerData.setGrade(8);
        dashboard.listen(playerData);
    }
}
