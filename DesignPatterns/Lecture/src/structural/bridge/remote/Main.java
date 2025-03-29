package structural.bridge.remote;

public class Main {
    public static void main(String[] args) {
        AdvancedRemote advancedRemote = new AdvancedRemote(new Television());

        advancedRemote.togglePower();
        for (int i = 0; i <= 10; i++) {
            advancedRemote.volumeUp();
        }
        advancedRemote.mute();
        advancedRemote.mute();
    }
}
