package structural.bridge.remote;

public class Remote {
    Device device;

    public Remote(Device device) {
        this.device = device;
    }

    public void togglePower() {
        if (device.isEnabled()) {
            device.disable();
        } else {
            device.enable();
        }
    }

    public void volumeUp() {
        device.setVolume(device.getVolume() < 100 ? device.getVolume() + 1 : device.getVolume());
    }

    public void volumeDown() {
        device.setVolume(device.getVolume() > 0 ? device.getVolume() - 1 : device.getVolume());
    }

    public void channelUp() {
        device.setChannel(device.getChannel() + 1);
    }

    public void channelDown() {
        device.setChannel(device.getChannel() - 1);
    }
}
