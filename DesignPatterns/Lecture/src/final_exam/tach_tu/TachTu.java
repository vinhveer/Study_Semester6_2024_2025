package final_exam.tach_tu;

import java.util.List;

public class TachTu implements ITokenize {
    String str;

    public TachTu(String str) {
        this.str = str;
    }

    @Override
    public List<String> tokenize() {
        return List.of(str.split(" "));
    }
}
