package final_exam.tach_tu;

import java.util.ArrayList;
import java.util.List;

public class LoaiBoTuDung extends TokenizeDecorator {
    List<String> stopWords = new ArrayList<String>(List.of("và", "thì", "là"));

    public LoaiBoTuDung(ITokenize tokenize) {
        super(tokenize);
    }

    @Override
    public List<String> tokenize() {
        List<String> tokens = tokenize.tokenize();

        tokens.removeIf(token -> stopWords.contains(token));

        return tokens;
    }
}
