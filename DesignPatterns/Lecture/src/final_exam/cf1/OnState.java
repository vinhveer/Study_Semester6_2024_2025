package final_exam.cf1;

public class OnState implements RemoteControlState {
    @Override
    public void onPower(RemoteControl remoteControl) {
        System.out.println("Power on");
        remoteControl.setState(new OffState());
    }
}