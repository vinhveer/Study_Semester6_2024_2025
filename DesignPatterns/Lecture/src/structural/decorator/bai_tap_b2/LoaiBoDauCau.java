package structural.decorator.bai_tap_b2;

import java.util.ArrayList;
import java.util.List;

class LoaiBoDauCau extends TokenDecorator {
    public LoaiBoDauCau(ITokenize tokenizer) {
        super(tokenizer);
    }

    @Override
    public List<String> tokenize() {
        List<String> tokens = tokenizer.tokenize();
        List<String> result = new ArrayList<>();

        for (String token : tokens) {
            // Loại bỏ các dấu câu thông dụng
            String cleanToken = token.replaceAll("[.,;:!?()\\[\\]{}'\"]+", "");

            // Chỉ thêm vào kết quả nếu token không rỗng sau khi xử lý
            if (!cleanToken.isEmpty()) {
                result.add(cleanToken);
            }
        }

        return result;
    }
}
