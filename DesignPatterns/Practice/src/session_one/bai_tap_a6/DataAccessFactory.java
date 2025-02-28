package session_one.bai_tap_a6;

public class DataAccessFactory {
    public static DataAccess getDataAccess(String type) {
        if (type.equals("type1")) {
            return DataAccessType1.getInstance();
        } else if (type.equals("type2")) {
            return DataAccessType2.getInstance();
        }
        return null;
    }
}

class DataAccessType1 extends DataAccess {
    private static DataAccessType1 instance;

    private DataAccessType1() {
        super();
    }

    public static DataAccessType1 getInstance() {
        if (instance == null) {
            instance = new DataAccessType1();
        }
        return instance;
    }
}

class DataAccessType2 extends DataAccess {
    private static DataAccessType2 instance;

    private DataAccessType2() {
        super();
    }

    public static DataAccessType2 getInstance() {
        if (instance == null) {
            instance = new DataAccessType2();
        }
        return instance;
    }
}
