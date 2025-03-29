package behavioral.state.remote_control;

public class RemoteControl {
    private IRemoteState state;

    public RemoteControl() {
        this.state = new OffState();
    }

    public void powerPress() {
        state.handle(this);
    }

    public void setState(IRemoteState state) {
        this.state = state;
    }
}
