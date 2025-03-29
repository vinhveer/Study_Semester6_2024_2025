package structural.bridge.remote;

public class AdvancedRemote extends Remote {
    int currentVolume;

    public AdvancedRemote(Device device) {
        super(device);
    }

    public void mute() {
        if (device.getVolume() > 0) {
            currentVolume = device.getVolume();
            device.setVolume(0);
            System.out.println("Muted");
        } else {
            device.setVolume(currentVolume);
            System.out.println("Unmuted");
        }
    }
}
