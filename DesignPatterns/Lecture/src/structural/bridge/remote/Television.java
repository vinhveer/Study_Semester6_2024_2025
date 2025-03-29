package structural.bridge.remote;

public class Television implements Device {
    boolean state = false;
    int volume = 0;

    @Override
    public boolean isEnabled() {
        return state;
    }

    @Override
    public void enable() {
        state = true;
        System.out.println("Television is on");
    }

    @Override
    public void disable() {
        state = false;
        System.out.println("Television is off");
    }

    @Override
    public int getVolume() {
        return volume;
    }

    @Override
    public void setVolume(int volume) {
        this.volume = volume;
    }

    @Override
    public int getChannel() {
        return 0;
    }

    @Override
    public void setChannel(int channel) {

    }
}
