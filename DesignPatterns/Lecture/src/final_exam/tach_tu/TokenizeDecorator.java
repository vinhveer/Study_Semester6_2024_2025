package final_exam.tach_tu;

import java.util.List;

public abstract class TokenizeDecorator implements ITokenize {
    ITokenize tokenize;

    public TokenizeDecorator(ITokenize tokenize) {
        this.tokenize = tokenize;
    }

    @Override
    public abstract List<String> tokenize();
}
