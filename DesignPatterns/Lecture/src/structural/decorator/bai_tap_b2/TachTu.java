package structural.decorator.bai_tap_b2;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

class TachTu implements ITokenize {
    private String s;

    public TachTu(String s) {
        this.s = s;
    }

    @Override
    public List<String> tokenize() {
        if (s == null || s.isEmpty()) {
            return new ArrayList<>();
        }

        // Tách từ theo khoảng trắng
        String[] tokens = s.split("\\s+");
        return Arrays.asList(tokens);
    }
}