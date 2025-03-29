package behavioral.state.remote_control;

public class OffState implements IRemoteState {
    @Override
    public void handle(RemoteControl remoteControl) {
        System.out.println("TV is off");
        remoteControl.setState(new OnState());
    }
}
