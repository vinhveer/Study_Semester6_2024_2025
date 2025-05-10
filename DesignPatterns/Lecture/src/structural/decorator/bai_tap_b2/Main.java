package structural.decorator.bai_tap_b2;

public class Main {
    public static void main(String[] args) {
        String text = "Hôm nay trời đẹp, tôi muốn đi dạo trong công viên!";

        ITokenize basicTokenizer = new TachTu(text);

        System.out.println("Kết quả tách từ cơ bản:");
        System.out.println(basicTokenizer.tokenize());
        ITokenize noPunctuationTokenizer = new LoaiBoDauCau(basicTokenizer);
        System.out.println("\nKết quả sau khi loại bỏ dấu câu:");
        System.out.println(noPunctuationTokenizer.tokenize());
        ITokenize completeTokenizer = new LoaiBoTuDung(noPunctuationTokenizer);
        System.out.println("\nKết quả sau khi loại bỏ từ dừng và dấu câu:");
        System.out.println(completeTokenizer.tokenize());
    }
}
