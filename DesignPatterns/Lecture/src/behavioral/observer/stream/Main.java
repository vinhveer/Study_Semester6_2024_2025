package behavioral.observer.stream;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        MyStream<List<MonHoc>> stream = new MyStream<>();
        DataAccess dataAccess = new DataAccess(stream);

        Client client1 = new Client(stream, "Client1");
        Client client2 = new Client(stream, "Client2");

        System.out.println("Lần 1");
        dataAccess.add(new MonHoc("TD001","Thể dục"));
        System.out.println("Lần 2");
        dataAccess.add(new MonHoc("TD002", "Học lại thể dục"));
    }
}
