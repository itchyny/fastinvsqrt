import std.conv;
import std.stdio;
import std.string;

void main()
{
    string line;
    while ((line = readln()) !is null)
    {
        try
        {
            writeln(fastInvSqrt(to!float(chomp(line))));
        }
        catch (ConvException e) {}
    }
}

float fastInvSqrt(float x)
{
    int i = *cast(int*)(&x);
    i = 0x5f3759df - (i >> 1);
    float y = *cast(float*)(&i);
    return y * (1.5F - 0.5F * x * y * y);
}
