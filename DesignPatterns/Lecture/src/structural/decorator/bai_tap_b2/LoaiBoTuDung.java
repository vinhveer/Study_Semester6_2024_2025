package structural.decorator.bai_tap_b2;

import java.util.ArrayList;
import java.util.List;

class LoaiBoTuDung extends TokenDecorator {
    private final List<String> tuDungs = List.of("và", "của", "cho", "trong", "với", "các", "những");

    public LoaiBoTuDung(ITokenize tokenizer) {
        super(tokenizer);
    }

    @Override
    public List<String> tokenize() {
        List<String> tokens = tokenizer.tokenize();
        List<String> result = new ArrayList<>();

        for (String token : tokens) {
            if (!tuDungs.contains(token.toLowerCase())) {
                result.add(token);
            }
        }

        return result;
    }
}
