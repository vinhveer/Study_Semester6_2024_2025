package structural.decorator.bai_tap_b2;

import java.util.List;

abstract class TokenDecorator implements ITokenize {
    protected ITokenize tokenizer;

    public TokenDecorator(ITokenize tokenizer) {
        this.tokenizer = tokenizer;
    }

    @Override
    public List<String> tokenize() {
        return tokenizer.tokenize();
    }
}