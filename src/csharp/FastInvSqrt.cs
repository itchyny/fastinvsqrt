using System;

class FastInvSqrt
{

    public static void Main()
    {
        string line;
        float number;
        while ((line = Console.ReadLine()) != null)
        {
            if (float.TryParse(line, out number))
            {
                Console.WriteLine(fastInvSqrt(number));
            }
        }
    }

    unsafe public static float fastInvSqrt(float x)
    {
        int i = *(int*)&x;
        i = 0x5f3759df - (i >> 1);
        float y = *(float*)&i;
        return y * (1.5F - 0.5F * x * y * y);
    }

}
