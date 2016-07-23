Imports System
Imports System.IO

Public Class FastInvSqrt

    Shared Sub Main(args As String())
        Dim s As String = Console.ReadLine()
        Dim x As Single
        While s IsNot Nothing
            If Single.TryParse(s, x)
                Console.WriteLine(fastInvSqrt(x))
            End If
            s = Console.ReadLine()
        End While
    End Sub

    Shared Function fastInvSqrt(x As Single) As Single
        Dim i As Integer = BitConverter.ToInt32(BitConverter.GetBytes(x), 0)
        i = &H5f3759df - (i >> 1)
        Dim y As Single = BitConverter.ToSingle(BitConverter.GetBytes(i), 0)
        Return y * (1.5 - 0.5 * x * y * y)
    End Function

End Class
