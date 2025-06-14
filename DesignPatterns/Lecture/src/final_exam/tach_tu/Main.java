package final_exam.tach_tu;

import java.util.List;

public class Main {
    public static void main(String[] args) {
        ITokenize word = new TachTu("Hôm nay là thứ , bảy thì và");

        List<String> words = word.tokenize();

        word = new LoaiBoDauCau(word);
        words = word.tokenize();

        word = new LoaiBoTuDung(word);
        words = word.tokenize();
        for (String word1 : words) {
            System.out.println(word1);
        }
    }
}
