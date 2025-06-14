package final_exam.tach_tu;

import java.util.ArrayList;
import java.util.List;

public class LoaiBoDauCau extends TokenizeDecorator {
    public LoaiBoDauCau(ITokenize tokenize) {
        super(tokenize);
    }

    @Override
    public List<String> tokenize() {
        List<String> tokens = tokenize.tokenize();
        List<String> result = new ArrayList<>();

        System.out.println("Đang loại bỏ dấu câu");

        for (String token : tokens) {
            String cleanToken = token.replaceAll("[.,;:!?()\\[\\]{}'\"]+", "");
            if (!cleanToken.isEmpty()) {
                result.add(cleanToken);
            }
        }

        return result;
    }
}
