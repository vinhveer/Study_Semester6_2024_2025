package behavioral.observer.player;

public class Dashboard implements IPlayerDataListener {
    PlayerData playerData;

    public Dashboard(PlayerData playerData) {
        this.playerData = playerData;
    }

    @Override
    public void listen(PlayerData data) {
        System.out.println(data.toString());
    }
}
