package final_exam.cf1;

public class RemoteControl {
    RemoteControlState remoteControlState;

    public RemoteControl() {
        this.remoteControlState = new OffState();
    }

    void power() {
        remoteControlState.onPower(this);
    }

    void setState(RemoteControlState state) {
        remoteControlState = state;
    }
}
