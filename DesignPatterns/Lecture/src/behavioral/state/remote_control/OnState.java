package behavioral.state.remote_control;

public class OnState implements IRemoteState {
    @Override
    public void handle(RemoteControl remoteControl) {
        System.out.println("TV is on");
        remoteControl.setState(new OffState());
    }
}
