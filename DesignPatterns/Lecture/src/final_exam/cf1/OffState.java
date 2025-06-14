package final_exam.cf1;

public class OffState implements RemoteControlState {
    @Override
    public void onPower(RemoteControl remoteControl) {
        System.out.println("Power Off");
        remoteControl.setState(new OnState());
    }
}