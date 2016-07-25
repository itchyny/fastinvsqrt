| fastInvSqrt |

fastInvSqrt := [:x |
	| bytes i y |
	bytes := ByteArray new: 4.
	i := bytes floatAt: 1 put: x asFloat; intAt: 1.
	i := 16r5F3759DF - (i bitShift: -1).
	y := bytes intAt: 1 put: i; floatAt: 1.
	y * (1.5 - (0.5 * x * y * y))
].

[stdin atEnd] whileFalse: [
	(fastInvSqrt value: stdin nextLine asNumber) displayNl
]
