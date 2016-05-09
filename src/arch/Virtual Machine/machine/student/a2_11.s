.pos 0x100
				#b = c + 10
				ld $0, r0				# r0 = 0
				ld $a, r1				# r1 = address of a
				ld $b, r2				# r2 = address of b
				ld $c, r3				# r3 = address of c
				ld (r3), r3				# r3 = c
				ld $10, r4				# r4 = 10
				add r4, r3				# r3 = c + 10
				st r3, (r2)				# b = c + 10
				
				#a[4] = a[4] + 4
				ld $4, r3				# r3 = 4
				ld (r1, r3, 4), r4		# r4 = a[4]
				add r3, r4				# r4 = a[4] + 4
				st r4 , (r1, r3, 4)		# a[4] = a[4] + 4
				
				#a[c] = a[8] + b + a[b & 0x7]
				ld (r2), r3				# r3 = b
				ld $7, r4				# r4 = 0x7
				and r3, r4				# r4 = b & 0x7
				ld (r1, r4, 4), r4		# r4 = a[b & 0x7]
				add r3, r4				# r4 = b + a[b & 0x7]
				ld $8, r5				# r5 = 0x8
				ld (r1, r5, 4), r5		# r5 = a[8]
				add r5, r4				# r4 = a[8] + b + a[b & 0x7]
				ld $c, r3				# r3 = address of c
				ld (r3), r3				# r3 = c
				st r4, (r1, r3, 4)		# a[c] = a[8] + b + a[b & 0x7]
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
				.long 8					# a[8]
				.long 0x0				# a[9]
				.long 0x0				# a[10]
				
.pos 0x2000
b:				.long 0x0				# b

.pos 0x3000
c:				.long 0x5				# c