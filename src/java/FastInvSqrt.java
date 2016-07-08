import java.util.Scanner;

public class FastInvSqrt {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        while (scanner.hasNext()) {
            try {
                float x = Float.parseFloat(scanner.nextLine());
                System.out.printf("%f\n", fastInvSqrt(x));
            } catch (NumberFormatException e) {}
        }
    }

    public static float fastInvSqrt(float x) {
        int i = Float.floatToRawIntBits(x);
        float y = Float.intBitsToFloat(0x5f3759df - (i >> 1));
        return y * (1.5F - 0.5F * x * y * y);
    }

}
