.pos 0x100
				# a[i] = a[i+1] + b[i+2]
				ld $i, r0				# r0 = address of i
				ld (r0), r0				# r0 = i
				ld $0x1, r1				# r1 = 1
				ld $0x2, r2				# r2 = 2
				add r0, r1				# r1 = i + 1
				add r0, r2				# r2 = i + 2
				ld $a, r3				# r3 = address of a
				ld (r3, r1, 4), r1		# r1 = a[i+1]
				ld $b, r4				# r4 = address of b
				ld (r3, r2, 4) , r2		# r2 = b[i+2]
				add r2, r1				# r1 = a[i+1] + b[i+2]
				st r1, (r3, r0, 4)		# a[i] = a[i+1] + b[i+2]
				
				# d[i] = a[i] + b[i]
				ld (r3, r0, 4), r1		# r1 = a[i]
				ld (r4, r0, 4), r2		# r2 = b[i]
				add r2, r1				# r1 = a[i] + b[i]
				ld $d, r5				# r5 = address of d
				ld (r5), r5				# r5 = d
				st r1, (r5, r0, 4)		# d[i] = a[i] + b[i]
				
				# d[i] = a[b[i]] + b[a[i]]
				ld (r3, r0, 4), r1		# r1 = a[i]
				ld (r4, r0, 4), r2		# r2 = b[i]
				ld (r1, r2, 4), r6		# r6 = a[b[i]]
				ld (r2, r1, 4), r7		# r7 = b[a[i]]
				add r7, r6				# r6 = a[b[i]] + b[a[i]]
				st r6, (r5, r0, 4)		# d[i] = a[b[i]] + b[a[i]]
				
				# d[b[i]] = b[a[i & 3] & 3] - a[b[i & 3] & 3] + d[i]
				ld $3, r6				# r6 = 3
				and r0, r6				# r6 = i & 3
				ld (r1, r6, 4), r3		# r3 = a[i & 3]
				ld (r2, r6, 4), r4		# r4 = b[i & 3]
				ld $3, r6				# r6 = 3
				and r6, r3				# r3 = a[i & 3] & 3
				and r6, r4				# r4 = b[i & 3] & 3
				ld (r2, r3, 4), r3		# r3 = b[a[i & 3] & 3]
				ld (r1, r4, 4), r4		# r4 = a[b[i & 3] & 3]
				not r4					# ~r4
				inc	r4					# r4 + 1
				add r3, r4				# b[a[i & 3] & 3] - a[b[i & 3] & 3]
				ld (r5, r0, 4), r3		# r3 = d[i]
				add r3, r4				# r4 = b[a[i & 3] & 3] - a[b[i & 3] & 3] + d[i]
				st r4, (r5, r2, 4)		# d[b[i]] = b[a[i & 3] & 3] - a[b[i & 3] & 3] + d[i]
				
				
				
				
				
				
				
				
				
				
				
				halt					#halt
				
				
				

.pos 0x1000
a:				.long 0x0				# a[0]
				.long 0x0				# a[1]
				.long 0x0				# a[2]
				.long 0x0				# a[3]
				.long 0x0				# a[4]
				.long 0x0				# a[5]
				.long 0x0				# a[6]
				.long 0x0				# a[7]
				.long 0x0				# a[8]
				
.pos 0x2000
b:				.long 0x0				# b[0]
				.long 0x0				# b[1]
				.long 0x0				# b[2]
				.long 0x0				# b[3]
				.long 0x0				# b[4]
				.long 0x0				# b[5]
				.long 0x0				# b[6]
				.long 0x0				# b[7]
				.long 0x0				# b[8]
				
.pos 0x3000
c:				.long 0x0				# c[0]
				.long 0x0				# c[1]
				.long 0x0				# c[2]
				.long 0x0				# c[3]
				.long 0x0				# c[4]
				.long 0x0				# c[5]
				.long 0x0				# c[6]
				.long 0x0				# c[7]
				.long 0x0				# c[8]
				
.pos 0x4000
d:				.long c 				# d

.pos 0x5000
i:				.long 0x0				# i