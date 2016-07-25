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

"for Squeak/Pharo Smalltalk

| fastInvSqrt |

fastInvSqrt := [:x |
   | y |
   y := Float fromIEEE32Bit: (16r5F3759DF - (x asFloat asIEEE32BitWord >> 1)).
   y * (1.5 - (0.5 * x * y * y))
].

#(100 10 1 0.1 0.01 0.0025) collect: fastInvSqrt

"
