
;-------------------------------------------------------------------------------
;	Internal RAM layout
;-------------------------------------------------------------------------------

0x00: |0|0|0|0|0|0|0|0|d|d|d|d|d| | | |
0x10: | | | | | | | | | | | | | | | | |
0x20: |B|d|d|d|d|d|d|d|d|d|d|d|d|d|d|d|
0x30: |d|d|d|d|d|d|d|d|d|d|S|S|S|S|S|S|
0x40: |S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|
0x50: |S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|
0x60: |S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|
0x70: |S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|
0x80: |S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|
0x90: |S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|
0xA0: |S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|
0xB0: |S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|
0xC0: |S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|
0xD0: |S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|
0xE0: |S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|
0xF0: |S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|S|

0-3:Register Banks, B:Bits, d:Data, I:iRAM, S:Stack

;-------------------------------------------------------------------------------
;	Public labels
;-------------------------------------------------------------------------------

0x000D:	Function_000					(calls:   2, jumps:   0)
0x001D:	Function_001					(calls:   3, jumps:   0)
0x0207:	Function_002					(calls:   1, jumps:   0)
0x03A4:	Function_003					(calls:   1, jumps:   0)
0x04EA:	Function_004					(calls:   1, jumps:   0)
0x05A1:	Function_005					(calls:   7, jumps:   0)
0x05B0:	Function_006					(calls:   1, jumps:   0)
0x05B7:	Function_007					(calls:   4, jumps:   0)
0x05C6:	Function_008					(calls:   4, jumps:   0)
0x05CD:	Function_009					(calls:   3, jumps:   0)
0x05DC:	Function_010					(calls:   1, jumps:   0)
0x05E4:	Function_011					(calls:   2, jumps:   0)
0x05EB:	Function_012					(calls:   8, jumps:   0)
0x05F2:	Function_013					(calls:   2, jumps:   0)
0x060B:	Function_014					(calls:   4, jumps:   0)
0x0615:	Function_015					(calls:   3, jumps:   0)
0x0620:	Function_016					(calls:   4, jumps:   0)
0x0628:	Function_017					(calls:   4, jumps:   0)
0x0630:	Function_018					(calls:   2, jumps:   0)
0x063A:	Function_019					(calls:   1, jumps:   7)
0x0712:	Function_020					(calls:   2, jumps:   0)
0x0719:	Timer0_interrupt				(calls:   0, jumps:   1)
0x077A:	Function_021					(calls:   1, jumps:   0)
0x078F:	Function_022					(calls:   8, jumps:   2)
0x07B8:	Function_023					(calls:   2, jumps:   0)
0x07C5:	Function_024					(calls:   2, jumps:   0)
0x07D2:	Function_025					(calls:   2, jumps:   0)
0x07DF:	System_init					(calls:   0, jumps:   1)
0x07F6:	Timer1_interrupt				(calls:   0, jumps:   1)

;-------------------------------------------------------------------------------
;	SFR registers
;-------------------------------------------------------------------------------

0x80:	P0						(not used)
0x81:	SP						(used   1 times)
0x82:	DPL						(not used)
0x83:	DPH						(used   2 times)
0x87:	PCON						(not used)
0x88:	TCON						(not used)
0x89:	TMOD						(used   1 times)
0x8A:	TL0						(used   1 times)
0x8B:	TL1						(used   2 times)
0x8C:	TH0						(used   1 times)
0x8D:	TH1						(used   2 times)
0x90:	P1						(used   7 times)
0x98:	SCON						(not used)
0x99:	SBUF						(not used)
0xA0:	P2						(not used)
0xA8:	IE						(not used)
0xB0:	P3						(not used)
0xB8:	IP						(not used)
0xBB:							(used   1 times)
0xC8:	T2CON						(not used)
0xCA:	RCAP2L						(not used)
0xCB:	RCAP2H						(not used)
0xCC:	TL2						(not used)
0xCD:	TH2						(not used)
0xD0:	PSW						(used   2 times)
0xE0:	ACC						(used   5 times)
0xF0:	B						(used  43 times)

;-------------------------------------------------------------------------------
;	Special function bits
;-------------------------------------------------------------------------------

0x80:	P0_0						(not used)
0x81:	P0_1						(not used)
0x82:	P0_2						(not used)
0x83:	P0_3						(not used)
0x84:	P0_4						(not used)
0x85:	P0_5						(not used)
0x86:	P0_6						(not used)
0x87:	P0_7						(not used)
0x88:	IT0						(not used)
0x89:	IE0						(not used)
0x8A:	IT1						(not used)
0x8B:	IE1						(not used)
0x8C:	TR0						(used   1 times)
0x8D:	TF0						(not used)
0x8E:	TR1						(used  15 times)
0x8F:	TF1						(not used)
0x90:	P1_0						(not used)
0x91:	P1_1						(not used)
0x92:	P1_2						(not used)
0x93:	P1_3						(not used)
0x94:	P1_4						(not used)
0x95:	P1_5						(not used)
0x96:	P1_6						(not used)
0x97:	P1_7						(not used)
0x98:	RI						(not used)
0x99:	TI						(not used)
0x9A:	RB8						(not used)
0x9B:	TB8						(not used)
0x9C:	REN						(not used)
0x9D:	SM2						(not used)
0x9E:	SM1						(not used)
0x9F:	SM0						(not used)
0xA0:	P2_0						(not used)
0xA1:	P2_1						(not used)
0xA2:	P2_2						(not used)
0xA3:	P2_3						(not used)
0xA4:	P2_4						(not used)
0xA5:	P2_5						(not used)
0xA6:	P2_6						(not used)
0xA7:	P2_7						(not used)
0xA8:	EX0						(not used)
0xA9:	ET0						(used   1 times)
0xAA:	EX1						(not used)
0xAB:	ET1						(used   1 times)
0xAC:	ES						(not used)
0xAD:	ET2						(not used)
0xAF:	EA						(used   1 times)
0xB0:	RXD						(used   2 times)
0xB1:	TXD						(used   2 times)
0xB2:	INT0						(used   2 times)
0xB3:	INT1						(used   2 times)
0xB4:	T0						(used   4 times)
0xB5:	T1						(used   4 times)
0xB6:	WR						(not used)
0xB7:	RD						(used   2 times)
0xB8:	PX0						(not used)
0xB9:	PT0						(not used)
0xBA:	PX1						(not used)
0xBB:	PT1						(not used)
0xBC:	PS						(not used)
0xBD:	PT2						(not used)
0xC8:	CP_RL2						(not used)
0xC9:	C_T2						(not used)
0xCA:	TR2						(not used)
0xCB:	EXEN2						(not used)
0xCC:	TCLK						(not used)
0xCD:	RCLK						(not used)
0xCE:	EXF2						(not used)
0xCF:	TF2						(not used)
0xD0:	P						(not used)
0xD1:	F1						(not used)
0xD2:	OV						(not used)
0xD3:	RS0						(not used)
0xD4:	RS1						(not used)
0xD5:	F0						(not used)
0xD6:	AC						(not used)
0xD7:	CY						(not used)

;-------------------------------------------------------------------------------
;	Overlayable register banks
;-------------------------------------------------------------------------------

0x00:	REG_BANK_0

;-------------------------------------------------------------------------------
;	Internal RAM data
;-------------------------------------------------------------------------------

0x08:	variable_0x08					(used   2 times)
0x09:	variable_0x09					(used   4 times)
0x0A:	variable_0x0A					(used   4 times)
0x0B:	variable_0x0B					(used  14 times)
0x0C:	variable_0x0C					(used  14 times)
0x21:	variable_0x21					(used   3 times)
0x22:	variable_0x22					(used   8 times)
0x23:	variable_0x23					(used   8 times)
0x24:	variable_0x24					(used  10 times)
0x25:	variable_0x25					(used   4 times)
0x26:	variable_0x26					(used   5 times)
0x27:	variable_0x27					(used   4 times)
0x28:	variable_0x28					(used   3 times)
0x29:	variable_0x29					(used   4 times)
0x2A:	variable_0x2A					(used   2 times)
0x2B:	variable_0x2B					(used  13 times)
0x2C:	variable_0x2C					(used  31 times)
0x2D:	variable_0x2D					(used  23 times)
0x2E:	variable_0x2E					(used  11 times)
0x2F:	variable_0x2F					(used  47 times)
0x30:	variable_0x30					(used  15 times)
0x31:	variable_0x31					(used   8 times)
0x32:	variable_0x32					(used   8 times)
0x33:	variable_0x33					(used   4 times)
0x34:	variable_0x34					(used   8 times)
0x35:	variable_0x35					(used   5 times)
0x36:	variable_0x36					(used   3 times)
0x37:	variable_0x37					(used   4 times)
0x38:	variable_0x38					(used   5 times)
0x39:	variable_0x39					(used  10 times)
0x67:	variable_0x67					(used   1 times)

;-------------------------------------------------------------------------------
;	bit data
;-------------------------------------------------------------------------------

0x00:	bit_0x00					(used   5 times)
0x01:	bit_0x01					(used   4 times)
0x02:	bit_0x02					(used   4 times)
0x03:	bit_0x03					(used   4 times)
0x04:	bit_0x04					(used   1 times)
0x05:	bit_0x05					(used   4 times)
0x06:	bit_0x06					(used   7 times)

;-------------------------------------------------------------------------------
;	Stack: start=0x3A, size=198 bytes
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;	Indirectly addressable internal RAM data
;-------------------------------------------------------------------------------

0x7F:	iram_0x7F					(used   1 times)

;-------------------------------------------------------------------------------

0x0000: 02 07 DF	ljmp	System_init				; Jumps (forward) hither: 0x07DF

0x0003: FF		mov	R7, A					; R7 = ACC
0x0004: FF		mov	R7, A					; R7 = ACC
0x0005: FF		mov	R7, A					; R7 = ACC
0x0006: FF		mov	R7, A					; R7 = ACC
0x0007: FF		mov	R7, A					; R7 = ACC
0x0008: FF		mov	R7, A					; R7 = ACC
0x0009: FF		mov	R7, A					; R7 = ACC
0x000A: FF		mov	R7, A					; R7 = ACC
0x000B: E1 19		ajmp	Timer0_interrupt			; Jumps (forward) hither: 0x0719 (PC += 2, PC(10-0) = 0x0719)

;-------------------------------------------------------------------------------

Function_000:

0x000D: D1 28		acall	Function_017				; Calls (forward) this: 0x0628 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x0628)
0x000F: C2 B3		clr	INT1					; INT1 = L
0x0011: 7F 28		mov	R7, #0x28				; R7 = 0x28 {'('}
0x0013: 7E 00		mov	R6, #0x00				; R6 = 0x00 {'\0'}
0x0015: F1 8F		acall	Function_022				; Calls (forward) this: 0x078F (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x078F)
0x0017: D2 B3		setb	INT1					; INT1 = H
0x0019: 22		ret						; PCH = [SP--], PCL = [SP--]

0x001A: FF		mov	R7, A					; R7 = ACC
0x001B: E1 F6		ajmp	Timer1_interrupt			; Jumps (forward) hither: 0x07F6 (PC += 2, PC(10-0) = 0x07F6)

;-------------------------------------------------------------------------------

Function_001:

0x001D: E5 2F		mov	A, 0x2F					; ACC = [0x2F]
0x001F: 70 1D		jnz	Label_000				; If (ACC != 0) then jumps (forward) hither: 0x003E

0x0021: E5 30		mov	A, 0x30					; ACC = [0x30]
0x0023: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x0026: 84		div	AB					; ACC = ACC / B, B = ACC % B
0x0027: FF		mov	R7, A					; R7 = ACC
0x0028: E5 30		mov	A, 0x30					; ACC = [0x30]
0x002A: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x002D: 84		div	AB					; ACC = ACC / B, B = ACC % B
0x002E: E5 24		mov	A, 0x24					; ACC = [0x24]
0x0030: B1 B0		acall	Function_006				; Calls (forward) this: 0x05B0 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05B0)
0x0032: FB		mov	R3, A					; R3 = ACC
0x0033: E5 24		mov	A, 0x24					; ACC = [0x24]
0x0035: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x0038: 84		div	AB					; ACC = ACC / B, B = ACC % B
0x0039: 85 F0 0B	mov	R3<#1>, B				; R3<#1> = B
0x003C: F1 A4		acall	Label_174				; Calls (forward) this: 0x07A4 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x07A4)

Label_000:

0x003E: E5 2F		mov	A, 0x2F					; ACC = [0x2F]
0x0040: 70 02		jnz	Label_001				; If (ACC != 0) then jumps (forward) hither: 0x0044

0x0042: 41 06		ajmp	Label_042				; Jumps (forward) hither: 0x0206 (PC += 2, PC(10-0) = 0x0206)

Label_001:

0x0044: 14		dec	A					; --ACC
0x0045: B4 29 00	cjne	A, #0x29, Label_002			; If (ACC != 0x29 {')'}) then jumps (forward) hither: 0x0048

Label_002:

0x0048: 40 02		jc	Label_003				; If (CY == H) then jumps (forward) hither: 0x004C

0x004A: 41 06		ajmp	Label_042				; Jumps (forward) hither: 0x0206 (PC += 2, PC(10-0) = 0x0206)

Label_003:

0x004C: 90 00 56	mov	DPTR, #0x0056				; DPTR = 0x0056
0x004F: 25 E0		add	A, ACC					; ACC += ACC
0x0051: 50 02		jnc	Label_004				; If (CY == L) then jumps (forward) hither: 0x0055

0x0053: 05 83		inc	DPH					; ++DPH

Label_004:

0x0055: 73		jmp	@A+DPTR					; Jumps hither: [DPTR + ACC]

0x0056: 01 A8		ajmp	Label_005				; Jumps (forward) hither: 0x00A8 (PC += 2, PC(10-0) = 0x00A8)

0x0058: 01 B0		ajmp	Label_006				; Jumps (forward) hither: 0x00B0 (PC += 2, PC(10-0) = 0x00B0)

0x005A: 01 B8		ajmp	Label_007				; Jumps (forward) hither: 0x00B8 (PC += 2, PC(10-0) = 0x00B8)

0x005C: 01 C0		ajmp	Label_008				; Jumps (forward) hither: 0x00C0 (PC += 2, PC(10-0) = 0x00C0)

0x005E: 01 C7		ajmp	Label_009				; Jumps (forward) hither: 0x00C7 (PC += 2, PC(10-0) = 0x00C7)

0x0060: 01 F1		ajmp	Label_013				; Jumps (forward) hither: 0x00F1 (PC += 2, PC(10-0) = 0x00F1)

0x0062: 01 F3		ajmp	Label_014				; Jumps (forward) hither: 0x00F3 (PC += 2, PC(10-0) = 0x00F3)

0x0064: 01 F5		ajmp	Label_015				; Jumps (forward) hither: 0x00F5 (PC += 2, PC(10-0) = 0x00F5)

0x0066: 21 4E		ajmp	Label_028				; Jumps (forward) hither: 0x014E (PC += 2, PC(10-0) = 0x014E)

0x0068: 21 01		ajmp	Label_017				; Jumps (forward) hither: 0x0101 (PC += 2, PC(10-0) = 0x0101)

0x006A: 21 03		ajmp	Label_018				; Jumps (forward) hither: 0x0103 (PC += 2, PC(10-0) = 0x0103)

0x006C: 21 05		ajmp	Label_019				; Jumps (forward) hither: 0x0105 (PC += 2, PC(10-0) = 0x0105)

0x006E: 21 4E		ajmp	Label_028				; Jumps (forward) hither: 0x014E (PC += 2, PC(10-0) = 0x014E)

0x0070: 21 07		ajmp	Label_020				; Jumps (forward) hither: 0x0107 (PC += 2, PC(10-0) = 0x0107)

0x0072: 21 27		ajmp	Label_025				; Jumps (forward) hither: 0x0127 (PC += 2, PC(10-0) = 0x0127)

0x0074: 21 34		ajmp	Label_026				; Jumps (forward) hither: 0x0134 (PC += 2, PC(10-0) = 0x0134)

0x0076: 21 41		ajmp	Label_027				; Jumps (forward) hither: 0x0141 (PC += 2, PC(10-0) = 0x0141)

0x0078: 21 4E		ajmp	Label_028				; Jumps (forward) hither: 0x014E (PC += 2, PC(10-0) = 0x014E)

0x007A: 41 06		ajmp	Label_042				; Jumps (forward) hither: 0x0206 (PC += 2, PC(10-0) = 0x0206)

0x007C: 21 5B		ajmp	Label_029				; Jumps (forward) hither: 0x015B (PC += 2, PC(10-0) = 0x015B)

0x007E: 21 61		ajmp	Label_030				; Jumps (forward) hither: 0x0161 (PC += 2, PC(10-0) = 0x0161)

0x0080: 21 8A		ajmp	Label_032				; Jumps (forward) hither: 0x018A (PC += 2, PC(10-0) = 0x018A)

0x0082: 21 AF		ajmp	Label_035				; Jumps (forward) hither: 0x01AF (PC += 2, PC(10-0) = 0x01AF)

0x0084: 21 B3		ajmp	Label_036				; Jumps (forward) hither: 0x01B3 (PC += 2, PC(10-0) = 0x01B3)

0x0086: 21 D3		ajmp	Label_038				; Jumps (forward) hither: 0x01D3 (PC += 2, PC(10-0) = 0x01D3)

0x0088: 41 06		ajmp	Label_042				; Jumps (forward) hither: 0x0206 (PC += 2, PC(10-0) = 0x0206)

0x008A: 41 06		ajmp	Label_042				; Jumps (forward) hither: 0x0206 (PC += 2, PC(10-0) = 0x0206)

0x008C: 41 06		ajmp	Label_042				; Jumps (forward) hither: 0x0206 (PC += 2, PC(10-0) = 0x0206)

0x008E: 41 06		ajmp	Label_042				; Jumps (forward) hither: 0x0206 (PC += 2, PC(10-0) = 0x0206)

0x0090: 01 F7		ajmp	Label_016				; Jumps (forward) hither: 0x00F7 (PC += 2, PC(10-0) = 0x00F7)

0x0092: 21 14		ajmp	Label_021				; Jumps (forward) hither: 0x0114 (PC += 2, PC(10-0) = 0x0114)

0x0094: 21 16		ajmp	Label_022				; Jumps (forward) hither: 0x0116 (PC += 2, PC(10-0) = 0x0116)

0x0096: 21 18		ajmp	Label_023				; Jumps (forward) hither: 0x0118 (PC += 2, PC(10-0) = 0x0118)

0x0098: 21 4E		ajmp	Label_028				; Jumps (forward) hither: 0x014E (PC += 2, PC(10-0) = 0x014E)

0x009A: 21 1A		ajmp	Label_024				; Jumps (forward) hither: 0x011A (PC += 2, PC(10-0) = 0x011A)

0x009C: 01 D3		ajmp	Label_011				; Jumps (forward) hither: 0x00D3 (PC += 2, PC(10-0) = 0x00D3)

0x009E: 01 E1		ajmp	Label_012				; Jumps (forward) hither: 0x00E1 (PC += 2, PC(10-0) = 0x00E1)

0x00A0: 41 06		ajmp	Label_042				; Jumps (forward) hither: 0x0206 (PC += 2, PC(10-0) = 0x0206)

0x00A2: 41 06		ajmp	Label_042				; Jumps (forward) hither: 0x0206 (PC += 2, PC(10-0) = 0x0206)

0x00A4: 21 E5		ajmp	Label_040				; Jumps (forward) hither: 0x01E5 (PC += 2, PC(10-0) = 0x01E5)

0x00A6: 21 F6		ajmp	Label_041				; Jumps (forward) hither: 0x01F6 (PC += 2, PC(10-0) = 0x01F6)

Label_005:

0x00A8: 85 30 2C	mov	0x2C, 0x30				; [0x2C] = [0x30]
0x00AB: 85 24 2D	mov	0x2D, 0x24				; [0x2D] = [0x24]
0x00AE: 80 1C		sjmp	Label_010				; Jumps (forward) hither: 0x00CC

Label_006:

0x00B0: 85 27 2C	mov	0x2C, 0x27				; [0x2C] = [0x27]
0x00B3: 85 21 2D	mov	0x2D, 0x21				; [0x2D] = [0x21]
0x00B6: 80 14		sjmp	Label_010				; Jumps (forward) hither: 0x00CC

Label_007:

0x00B8: 85 32 2C	mov	0x2C, 0x32				; [0x2C] = [0x32]
0x00BB: 85 2E 2D	mov	0x2D, 0x2E				; [0x2D] = [0x2E]
0x00BE: 80 0C		sjmp	Label_010				; Jumps (forward) hither: 0x00CC

Label_008:

0x00C0: E4		clr	A					; ACC = 0
0x00C1: F5 34		mov	0x34, A					; [0x34] = ACC
0x00C3: F5 31		mov	0x31, A					; [0x31] = ACC
0x00C5: 21 AF		ajmp	Label_035				; Jumps (forward) hither: 0x01AF (PC += 2, PC(10-0) = 0x01AF)

Label_009:

0x00C7: E4		clr	A					; ACC = 0
0x00C8: F5 2C		mov	0x2C, A					; [0x2C] = ACC
0x00CA: F5 2D		mov	0x2D, A					; [0x2D] = ACC

Label_010:

0x00CC: B1 A1		acall	Function_005				; Calls (forward) this: 0x05A1 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05A1)
0x00CE: FB		mov	R3, A					; R3 = ACC
0x00CF: E5 2D		mov	A, 0x2D					; ACC = [0x2D]
0x00D1: 21 DC		ajmp	Label_039				; Jumps (forward) hither: 0x01DC (PC += 2, PC(10-0) = 0x01DC)

Label_011:

0x00D3: A2 02		mov	C, 0x02					; CY = [0x02]
0x00D5: E4		clr	A					; ACC = 0
0x00D6: 33		rlc	A					; ACC[76543210] = ACC[6543210C], CY = ACC[7]
0x00D7: F5 0B		mov	R3<#1>, A				; R3<#1> = ACC
0x00D9: 7B 0A		mov	R3, #0x0A				; R3 = 0x0A {'\n'}
0x00DB: 7D 05		mov	R5, #0x05				; R5 = 0x05
0x00DD: 7F 06		mov	R7, #0x06				; R7 = 0x06
0x00DF: E1 A4		ajmp	Label_174				; Jumps (forward) hither: 0x07A4 (PC += 2, PC(10-0) = 0x07A4)

Label_012:

0x00E1: 85 29 2C	mov	0x2C, 0x29				; [0x2C] = [0x29]
0x00E4: B1 C6		acall	Function_008				; Calls (forward) this: 0x05C6 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05C6)
0x00E6: 85 F0 0B	mov	R3<#1>, B				; R3<#1> = B
0x00E9: 7B 0A		mov	R3, #0x0A				; R3 = 0x0A {'\n'}
0x00EB: 7D 05		mov	R5, #0x05				; R5 = 0x05
0x00ED: 7F 07		mov	R7, #0x07				; R7 = 0x07 {'\a'}
0x00EF: E1 A4		ajmp	Label_174				; Jumps (forward) hither: 0x07A4 (PC += 2, PC(10-0) = 0x07A4)

Label_013:

0x00F1: 80 34		sjmp	Label_025				; Jumps (forward) hither: 0x0127

Label_014:

0x00F3: 21 34		ajmp	Label_026				; Jumps (forward) hither: 0x0134 (PC += 2, PC(10-0) = 0x0134)

Label_015:

0x00F5: 21 41		ajmp	Label_027				; Jumps (forward) hither: 0x0141 (PC += 2, PC(10-0) = 0x0141)

Label_016:

0x00F7: B1 E4		acall	Function_011				; Calls (forward) this: 0x05E4 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05E4)
0x00F9: E5 23		mov	A, 0x23					; ACC = [0x23]
0x00FB: B1 DC		acall	Function_010				; Calls (forward) this: 0x05DC (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05DC)
0x00FD: E5 23		mov	A, 0x23					; ACC = [0x23]
0x00FF: 21 DC		ajmp	Label_039				; Jumps (forward) hither: 0x01DC (PC += 2, PC(10-0) = 0x01DC)

Label_017:

0x0101: 80 24		sjmp	Label_025				; Jumps (forward) hither: 0x0127

Label_018:

0x0103: 80 2F		sjmp	Label_026				; Jumps (forward) hither: 0x0134

Label_019:

0x0105: 21 41		ajmp	Label_027				; Jumps (forward) hither: 0x0141 (PC += 2, PC(10-0) = 0x0141)

Label_020:

0x0107: B1 A1		acall	Function_005				; Calls (forward) this: 0x05A1 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05A1)
0x0109: FB		mov	R3, A					; R3 = ACC
0x010A: B1 EB		acall	Function_012				; Calls (forward) this: 0x05EB (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05EB)
0x010C: 85 F0 0B	mov	R3<#1>, B				; R3<#1> = B
0x010F: 75 0C 06	mov	R4<#1>, #0x06				; R4<#1> = 0x06
0x0112: C1 3A		ajmp	Function_019				; Jumps (forward) hither: 0x063A (PC += 2, PC(10-0) = 0x063A)

Label_021:

0x0114: 80 11		sjmp	Label_025				; Jumps (forward) hither: 0x0127

Label_022:

0x0116: 80 1C		sjmp	Label_026				; Jumps (forward) hither: 0x0134

Label_023:

0x0118: 80 27		sjmp	Label_027				; Jumps (forward) hither: 0x0141

Label_024:

0x011A: B1 A1		acall	Function_005				; Calls (forward) this: 0x05A1 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05A1)
0x011C: FB		mov	R3, A					; R3 = ACC
0x011D: B1 EB		acall	Function_012				; Calls (forward) this: 0x05EB (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05EB)
0x011F: 85 F0 0B	mov	R3<#1>, B				; R3<#1> = B
0x0122: 75 0C 07	mov	R4<#1>, #0x07				; R4<#1> = 0x07 {'\a'}
0x0125: C1 3A		ajmp	Function_019				; Jumps (forward) hither: 0x063A (PC += 2, PC(10-0) = 0x063A)

Label_025:

0x0127: B1 A1		acall	Function_005				; Calls (forward) this: 0x05A1 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05A1)
0x0129: FB		mov	R3, A					; R3 = ACC
0x012A: B1 EB		acall	Function_012				; Calls (forward) this: 0x05EB (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05EB)
0x012C: 85 F0 0B	mov	R3<#1>, B				; R3<#1> = B
0x012F: 75 0C 01	mov	R4<#1>, #0x01				; R4<#1> = 0x01
0x0132: C1 3A		ajmp	Function_019				; Jumps (forward) hither: 0x063A (PC += 2, PC(10-0) = 0x063A)

Label_026:

0x0134: B1 A1		acall	Function_005				; Calls (forward) this: 0x05A1 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05A1)
0x0136: FB		mov	R3, A					; R3 = ACC
0x0137: B1 EB		acall	Function_012				; Calls (forward) this: 0x05EB (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05EB)
0x0139: 85 F0 0B	mov	R3<#1>, B				; R3<#1> = B
0x013C: 75 0C 02	mov	R4<#1>, #0x02				; R4<#1> = 0x02
0x013F: C1 3A		ajmp	Function_019				; Jumps (forward) hither: 0x063A (PC += 2, PC(10-0) = 0x063A)

Label_027:

0x0141: B1 A1		acall	Function_005				; Calls (forward) this: 0x05A1 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05A1)
0x0143: FB		mov	R3, A					; R3 = ACC
0x0144: B1 EB		acall	Function_012				; Calls (forward) this: 0x05EB (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05EB)
0x0146: 85 F0 0B	mov	R3<#1>, B				; R3<#1> = B
0x0149: 75 0C 03	mov	R4<#1>, #0x03				; R4<#1> = 0x03
0x014C: C1 3A		ajmp	Function_019				; Jumps (forward) hither: 0x063A (PC += 2, PC(10-0) = 0x063A)

Label_028:

0x014E: B1 A1		acall	Function_005				; Calls (forward) this: 0x05A1 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05A1)
0x0150: FB		mov	R3, A					; R3 = ACC
0x0151: B1 EB		acall	Function_012				; Calls (forward) this: 0x05EB (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05EB)
0x0153: 85 F0 0B	mov	R3<#1>, B				; R3<#1> = B
0x0156: 75 0C 04	mov	R4<#1>, #0x04				; R4<#1> = 0x04
0x0159: C1 3A		ajmp	Function_019				; Jumps (forward) hither: 0x063A (PC += 2, PC(10-0) = 0x063A)

Label_029:

0x015B: B1 CD		acall	Function_009				; Calls (forward) this: 0x05CD (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05CD)
0x015D: E5 2E		mov	A, 0x2E					; ACC = [0x2E]
0x015F: 21 DC		ajmp	Label_039				; Jumps (forward) hither: 0x01DC (PC += 2, PC(10-0) = 0x01DC)

Label_030:

0x0161: 30 06 20	jnb	0x06, Label_031				; If ([0x06] == L) then jumps (forward) hither: 0x0184

0x0164: C2 06		clr	0x06					; [0x06] = L
0x0166: 15 2E		dec	0x2E					; --[0x2E]
0x0168: E5 2E		mov	A, 0x2E					; ACC = [0x2E]
0x016A: B4 FF 17	cjne	A, #0xFF, Label_031			; If (ACC != 0xFF) then jumps (forward) hither: 0x0184

0x016D: 75 2E 3B	mov	0x2E, #0x3B				; [0x2E] = 0x3B {';'}
0x0170: 15 32		dec	0x32					; --[0x32]
0x0172: E5 32		mov	A, 0x32					; ACC = [0x32]
0x0174: B4 FF 0D	cjne	A, #0xFF, Label_031			; If (ACC != 0xFF) then jumps (forward) hither: 0x0184

0x0177: E4		clr	A					; ACC = 0
0x0178: F5 32		mov	0x32, A					; [0x32] = ACC
0x017A: F5 2E		mov	0x2E, A					; [0x2E] = ACC
0x017C: 75 35 01	mov	0x35, #0x01				; [0x35] = 0x01
0x017F: D2 8E		setb	TR1					; TR1 = H
0x0181: 75 2F 16	mov	0x2F, #0x16				; [0x2F] = 0x16

Label_031:

0x0184: B1 CD		acall	Function_009				; Calls (forward) this: 0x05CD (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05CD)
0x0186: E5 2E		mov	A, 0x2E					; ACC = [0x2E]
0x0188: 21 DC		ajmp	Label_039				; Jumps (forward) hither: 0x01DC (PC += 2, PC(10-0) = 0x01DC)

Label_032:

0x018A: E5 35		mov	A, 0x35					; ACC = [0x35]
0x018C: D3		setb	C					; CY = H
0x018D: 94 00		subb	A, #0x00				; ACC -= 0x00 + CY {'\0'}
0x018F: 40 11		jc	Label_033				; If (CY == H) then jumps (forward) hither: 0x01A2

0x0191: E5 35		mov	A, 0x35					; ACC = [0x35]
0x0193: 94 07		subb	A, #0x07				; ACC -= 0x07 + CY {'\a'}
0x0195: 50 0B		jnc	Label_033				; If (CY == L) then jumps (forward) hither: 0x01A2

0x0197: D2 8E		setb	TR1					; TR1 = H
0x0199: 30 06 0D	jnb	0x06, Label_034				; If ([0x06] == L) then jumps (forward) hither: 0x01A9

0x019C: C2 06		clr	0x06					; [0x06] = L
0x019E: 05 35		inc	0x35					; ++[0x35]
0x01A0: 80 07		sjmp	Label_034				; Jumps (forward) hither: 0x01A9

Label_033:

0x01A2: E4		clr	A					; ACC = 0
0x01A3: F5 2F		mov	0x2F, A					; [0x2F] = ACC
0x01A5: F5 2B		mov	0x2B, A					; [0x2B] = ACC
0x01A7: C2 8E		clr	TR1					; TR1 = L

Label_034:

0x01A9: B1 CD		acall	Function_009				; Calls (forward) this: 0x05CD (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05CD)
0x01AB: E5 2E		mov	A, 0x2E					; ACC = [0x2E]
0x01AD: 80 2D		sjmp	Label_039				; Jumps (forward) hither: 0x01DC

Label_035:

0x01AF: B1 F2		acall	Function_013				; Calls (forward) this: 0x05F2 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05F2)
0x01B1: 80 29		sjmp	Label_039				; Jumps (forward) hither: 0x01DC

Label_036:

0x01B3: 30 06 19	jnb	0x06, Label_037				; If ([0x06] == L) then jumps (forward) hither: 0x01CF

0x01B6: C2 06		clr	0x06					; [0x06] = L
0x01B8: 05 31		inc	0x31					; ++[0x31]
0x01BA: E5 31		mov	A, 0x31					; ACC = [0x31]
0x01BC: B4 3C 10	cjne	A, #0x3C, Label_037			; If (ACC != 0x3C {'<'}) then jumps (forward) hither: 0x01CF

0x01BF: E4		clr	A					; ACC = 0
0x01C0: F5 31		mov	0x31, A					; [0x31] = ACC
0x01C2: 05 34		inc	0x34					; ++[0x34]
0x01C4: E5 34		mov	A, 0x34					; ACC = [0x34]
0x01C6: B4 64 06	cjne	A, #0x64, Label_037			; If (ACC != 0x64 {'d'}) then jumps (forward) hither: 0x01CF

0x01C9: 75 34 63	mov	0x34, #0x63				; [0x34] = 0x63 {'c'}
0x01CC: 75 2F 17	mov	0x2F, #0x17				; [0x2F] = 0x17

Label_037:

0x01CF: B1 F2		acall	Function_013				; Calls (forward) this: 0x05F2 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05F2)
0x01D1: 80 09		sjmp	Label_039				; Jumps (forward) hither: 0x01DC

Label_038:

0x01D3: B1 E4		acall	Function_011				; Calls (forward) this: 0x05E4 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05E4)
0x01D5: AD F0		mov	R5, B					; R5 = B
0x01D7: B1 C6		acall	Function_008				; Calls (forward) this: 0x05C6 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05C6)
0x01D9: FB		mov	R3, A					; R3 = ACC
0x01DA: E5 2C		mov	A, 0x2C					; ACC = [0x2C]

Label_039:

0x01DC: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x01DF: 84		div	AB					; ACC = ACC / B, B = ACC % B
0x01E0: 85 F0 0B	mov	R3<#1>, B				; R3<#1> = B
0x01E3: E1 A4		ajmp	Label_174				; Jumps (forward) hither: 0x07A4 (PC += 2, PC(10-0) = 0x07A4)

Label_040:

0x01E5: A2 02		mov	C, 0x02					; CY = [0x02]
0x01E7: E4		clr	A					; ACC = 0
0x01E8: 33		rlc	A					; ACC[76543210] = ACC[6543210C], CY = ACC[7]
0x01E9: F5 0B		mov	R3<#1>, A				; R3<#1> = ACC
0x01EB: 75 0C 04	mov	R4<#1>, #0x04				; R4<#1> = 0x04
0x01EE: 7B 0A		mov	R3, #0x0A				; R3 = 0x0A {'\n'}
0x01F0: 7D 05		mov	R5, #0x05				; R5 = 0x05
0x01F2: 7F 06		mov	R7, #0x06				; R7 = 0x06
0x01F4: C1 3A		ajmp	Function_019				; Jumps (forward) hither: 0x063A (PC += 2, PC(10-0) = 0x063A)

Label_041:

0x01F6: B1 C6		acall	Function_008				; Calls (forward) this: 0x05C6 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05C6)
0x01F8: 85 F0 0B	mov	R3<#1>, B				; R3<#1> = B
0x01FB: 75 0C 04	mov	R4<#1>, #0x04				; R4<#1> = 0x04
0x01FE: 7B 0A		mov	R3, #0x0A				; R3 = 0x0A {'\n'}
0x0200: 7D 05		mov	R5, #0x05				; R5 = 0x05
0x0202: 7F 07		mov	R7, #0x07				; R7 = 0x07 {'\a'}
0x0204: D1 3A		acall	Function_019				; Calls (forward) this: 0x063A (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x063A)

Label_042:

0x0206: 22		ret						; PCH = [SP--], PCL = [SP--]

;-------------------------------------------------------------------------------

Function_002:

0x0207: D2 B5		setb	T1					; T1 = H
0x0209: 30 B5 02	jnb	T1, Label_043				; If (T1 == L) then jumps (forward) hither: 0x020E

0x020C: 61 A3		ajmp	Label_092				; Jumps (forward) hither: 0x03A3 (PC += 2, PC(10-0) = 0x03A3)

Label_043:

0x020E: 7F 01		mov	R7, #0x01				; R7 = 0x01
0x0210: 7E 00		mov	R6, #0x00				; R6 = 0x00 {'\0'}
0x0212: F1 8F		acall	Function_022				; Calls (forward) this: 0x078F (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x078F)
0x0214: 30 B5 02	jnb	T1, Label_044				; If (T1 == L) then jumps (forward) hither: 0x0219

0x0217: 61 A3		ajmp	Label_092				; Jumps (forward) hither: 0x03A3 (PC += 2, PC(10-0) = 0x03A3)

Label_044:

0x0219: E5 2F		mov	A, 0x2F					; ACC = [0x2F]
0x021B: B4 2A 00	cjne	A, #0x2A, Label_045			; If (ACC != 0x2A {'*'}) then jumps (forward) hither: 0x021E

Label_045:

0x021E: 40 02		jc	Label_046				; If (CY == H) then jumps (forward) hither: 0x0222

0x0220: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

Label_046:

0x0222: 90 02 28	mov	DPTR, #0x0228				; DPTR = 0x0228
0x0225: 25 E0		add	A, ACC					; ACC += ACC
0x0227: 73		jmp	@A+DPTR					; Jumps (forward) hither: [DPTR + ACC]

Jumptable_000:

0x0228: 41 7C		ajmp	Label_047				; Jumps (forward) hither: 0x027C (PC += 2, PC(10-0) = 0x027C)

0x022A: 41 83		ajmp	Label_048				; Jumps (forward) hither: 0x0283 (PC += 2, PC(10-0) = 0x0283)

0x022C: 41 85		ajmp	Label_049				; Jumps (forward) hither: 0x0285 (PC += 2, PC(10-0) = 0x0285)

0x022E: 41 8C		ajmp	Label_050				; Jumps (forward) hither: 0x028C (PC += 2, PC(10-0) = 0x028C)

0x0230: 41 93		ajmp	Label_051				; Jumps (forward) hither: 0x0293 (PC += 2, PC(10-0) = 0x0293)

0x0232: 41 9A		ajmp	Label_052				; Jumps (forward) hither: 0x029A (PC += 2, PC(10-0) = 0x029A)

0x0234: 41 AA		ajmp	Label_054				; Jumps (forward) hither: 0x02AA (PC += 2, PC(10-0) = 0x02AA)

0x0236: 41 B4		ajmp	Label_056				; Jumps (forward) hither: 0x02B4 (PC += 2, PC(10-0) = 0x02B4)

0x0238: 41 BE		ajmp	Label_058				; Jumps (forward) hither: 0x02BE (PC += 2, PC(10-0) = 0x02BE)

0x023A: 41 C6		ajmp	Label_060				; Jumps (forward) hither: 0x02C6 (PC += 2, PC(10-0) = 0x02C6)

0x023C: 41 CD		ajmp	Label_062				; Jumps (forward) hither: 0x02CD (PC += 2, PC(10-0) = 0x02CD)

0x023E: 41 D7		ajmp	Label_064				; Jumps (forward) hither: 0x02D7 (PC += 2, PC(10-0) = 0x02D7)

0x0240: 41 E1		ajmp	Label_066				; Jumps (forward) hither: 0x02E1 (PC += 2, PC(10-0) = 0x02E1)

0x0242: 41 E9		ajmp	Label_068				; Jumps (forward) hither: 0x02E9 (PC += 2, PC(10-0) = 0x02E9)

0x0244: 41 EB		ajmp	Label_069				; Jumps (forward) hither: 0x02EB (PC += 2, PC(10-0) = 0x02EB)

0x0246: 61 19		ajmp	Label_078				; Jumps (forward) hither: 0x0319 (PC += 2, PC(10-0) = 0x0319)

0x0248: 61 23		ajmp	Label_079				; Jumps (forward) hither: 0x0323 (PC += 2, PC(10-0) = 0x0323)

0x024A: 61 2E		ajmp	Label_080				; Jumps (forward) hither: 0x032E (PC += 2, PC(10-0) = 0x032E)

0x024C: 61 3A		ajmp	Label_082				; Jumps (forward) hither: 0x033A (PC += 2, PC(10-0) = 0x033A)

0x024E: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

0x0250: 61 5B		ajmp	Label_084				; Jumps (forward) hither: 0x035B (PC += 2, PC(10-0) = 0x035B)

0x0252: 61 50		ajmp	Label_083				; Jumps (forward) hither: 0x0350 (PC += 2, PC(10-0) = 0x0350)

0x0254: 61 5B		ajmp	Label_084				; Jumps (forward) hither: 0x035B (PC += 2, PC(10-0) = 0x035B)

0x0256: 61 62		ajmp	Label_085				; Jumps (forward) hither: 0x0362 (PC += 2, PC(10-0) = 0x0362)

0x0258: 61 67		ajmp	Label_086				; Jumps (forward) hither: 0x0367 (PC += 2, PC(10-0) = 0x0367)

0x025A: 61 73		ajmp	Label_087				; Jumps (forward) hither: 0x0373 (PC += 2, PC(10-0) = 0x0373)

0x025C: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

0x025E: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

0x0260: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

0x0262: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

0x0264: 41 C8		ajmp	Label_061				; Jumps (forward) hither: 0x02C8 (PC += 2, PC(10-0) = 0x02C8)

0x0266: 41 EF		ajmp	Label_070				; Jumps (forward) hither: 0x02EF (PC += 2, PC(10-0) = 0x02EF)

0x0268: 41 FE		ajmp	Label_072				; Jumps (forward) hither: 0x02FE (PC += 2, PC(10-0) = 0x02FE)

0x026A: 61 0B		ajmp	Label_074				; Jumps (forward) hither: 0x030B (PC += 2, PC(10-0) = 0x030B)

0x026C: 61 13		ajmp	Label_076				; Jumps (forward) hither: 0x0313 (PC += 2, PC(10-0) = 0x0313)

0x026E: 61 15		ajmp	Label_077				; Jumps (forward) hither: 0x0315 (PC += 2, PC(10-0) = 0x0315)

0x0270: 41 A2		ajmp	Label_053				; Jumps (forward) hither: 0x02A2 (PC += 2, PC(10-0) = 0x02A2)

0x0272: 61 5B		ajmp	Label_084				; Jumps (forward) hither: 0x035B (PC += 2, PC(10-0) = 0x035B)

0x0274: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

0x0276: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

0x0278: 61 89		ajmp	Label_088				; Jumps (forward) hither: 0x0389 (PC += 2, PC(10-0) = 0x0389)

0x027A: 61 8D		ajmp	Label_089				; Jumps (forward) hither: 0x038D (PC += 2, PC(10-0) = 0x038D)

Label_047:

0x027C: 75 2B 01	mov	0x2B, #0x01				; [0x2B] = 0x01
0x027F: 05 2F		inc	0x2F					; ++[0x2F]
0x0281: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

Label_048:

0x0283: 80 0E		sjmp	Label_051				; Jumps (forward) hither: 0x0293

Label_049:

0x0285: 75 2B 03	mov	0x2B, #0x03				; [0x2B] = 0x03
0x0288: 05 2F		inc	0x2F					; ++[0x2F]
0x028A: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

Label_050:

0x028C: 75 2B 04	mov	0x2B, #0x04				; [0x2B] = 0x04
0x028F: 05 2F		inc	0x2F					; ++[0x2F]
0x0291: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

Label_051:

0x0293: 75 2B 02	mov	0x2B, #0x02				; [0x2B] = 0x02
0x0296: 05 2F		inc	0x2F					; ++[0x2F]
0x0298: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

Label_052:

0x029A: 75 2B 01	mov	0x2B, #0x01				; [0x2B] = 0x01
0x029D: 75 2F 24	mov	0x2F, #0x24				; [0x2F] = 0x24 {'$'}
0x02A0: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

Label_053:

0x02A2: 75 2B 01	mov	0x2B, #0x01				; [0x2B] = 0x01
0x02A5: 75 2F 25	mov	0x2F, #0x25				; [0x2F] = 0x25 {'%'}
0x02A8: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

Label_054:

0x02AA: D1 20		acall	Function_016				; Calls (forward) this: 0x0620 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x0620)
0x02AC: 94 18		subb	A, #0x18				; ACC -= 0x18 + CY
0x02AE: 50 02		jnc	Label_055				; If (CY == L) then jumps (forward) hither: 0x02B2

0x02B0: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

Label_055:

0x02B2: 41 F7		ajmp	Label_071				; Jumps (forward) hither: 0x02F7 (PC += 2, PC(10-0) = 0x02F7)

Label_056:

0x02B4: B1 B7		acall	Function_007				; Calls (forward) this: 0x05B7 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05B7)
0x02B6: D1 15		acall	Function_015				; Calls (forward) this: 0x0615 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x0615)
0x02B8: 50 02		jnc	Label_057				; If (CY == L) then jumps (forward) hither: 0x02BC

0x02BA: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

Label_057:

0x02BC: 61 06		ajmp	Label_073				; Jumps (forward) hither: 0x0306 (PC += 2, PC(10-0) = 0x0306)

Label_058:

0x02BE: D1 0B		acall	Function_014				; Calls (forward) this: 0x060B (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x060B)
0x02C0: 50 02		jnc	Label_059				; If (CY == L) then jumps (forward) hither: 0x02C4

0x02C2: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

Label_059:

0x02C4: 61 32		ajmp	Label_081				; Jumps (forward) hither: 0x0332 (PC += 2, PC(10-0) = 0x0332)

Label_060:

0x02C6: 61 3A		ajmp	Label_082				; Jumps (forward) hither: 0x033A (PC += 2, PC(10-0) = 0x033A)

Label_061:

0x02C8: E4		clr	A					; ACC = 0
0x02C9: F5 23		mov	0x23, A					; [0x23] = ACC
0x02CB: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

Label_062:

0x02CD: D1 20		acall	Function_016				; Calls (forward) this: 0x0620 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x0620)
0x02CF: 94 18		subb	A, #0x18				; ACC -= 0x18 + CY
0x02D1: 50 02		jnc	Label_063				; If (CY == L) then jumps (forward) hither: 0x02D5

0x02D3: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

Label_063:

0x02D5: 80 20		sjmp	Label_071				; Jumps (forward) hither: 0x02F7

Label_064:

0x02D7: B1 B7		acall	Function_007				; Calls (forward) this: 0x05B7 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05B7)
0x02D9: D1 15		acall	Function_015				; Calls (forward) this: 0x0615 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x0615)
0x02DB: 50 02		jnc	Label_065				; If (CY == L) then jumps (forward) hither: 0x02DF

0x02DD: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

Label_065:

0x02DF: 80 25		sjmp	Label_073				; Jumps (forward) hither: 0x0306

Label_066:

0x02E1: D1 0B		acall	Function_014				; Calls (forward) this: 0x060B (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x060B)
0x02E3: 50 02		jnc	Label_067				; If (CY == L) then jumps (forward) hither: 0x02E7

0x02E5: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

Label_067:

0x02E7: 61 32		ajmp	Label_081				; Jumps (forward) hither: 0x0332 (PC += 2, PC(10-0) = 0x0332)

Label_068:

0x02E9: 61 3A		ajmp	Label_082				; Jumps (forward) hither: 0x033A (PC += 2, PC(10-0) = 0x033A)

Label_069:

0x02EB: B2 01		cpl	0x01					; [0x01] = ~[0x01]
0x02ED: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

Label_070:

0x02EF: D1 20		acall	Function_016				; Calls (forward) this: 0x0620 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x0620)
0x02F1: 94 18		subb	A, #0x18				; ACC -= 0x18 + CY
0x02F3: 50 02		jnc	Label_071				; If (CY == L) then jumps (forward) hither: 0x02F7

0x02F5: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

Label_071:

0x02F7: B1 C6		acall	Function_008				; Calls (forward) this: 0x05C6 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05C6)
0x02F9: 85 F0 2C	mov	0x2C, B					; [0x2C] = B
0x02FC: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

Label_072:

0x02FE: B1 B7		acall	Function_007				; Calls (forward) this: 0x05B7 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05B7)
0x0300: D1 15		acall	Function_015				; Calls (forward) this: 0x0615 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x0615)
0x0302: 50 02		jnc	Label_073				; If (CY == L) then jumps (forward) hither: 0x0306

0x0304: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

Label_073:

0x0306: 75 2C 14	mov	0x2C, #0x14				; [0x2C] = 0x14
0x0309: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

Label_074:

0x030B: D1 0B		acall	Function_014				; Calls (forward) this: 0x060B (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x060B)
0x030D: 50 02		jnc	Label_075				; If (CY == L) then jumps (forward) hither: 0x0311

0x030F: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

Label_075:

0x0311: 80 1F		sjmp	Label_081				; Jumps (forward) hither: 0x0332

Label_076:

0x0313: 80 25		sjmp	Label_082				; Jumps (forward) hither: 0x033A

Label_077:

0x0315: B2 05		cpl	0x05					; [0x05] = ~[0x05]
0x0317: 61 9C		ajmp	Label_091				; Jumps (forward) hither: 0x039C (PC += 2, PC(10-0) = 0x039C)

Label_078:

0x0319: D1 20		acall	Function_016				; Calls (forward) this: 0x0620 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x0620)
0x031B: 94 64		subb	A, #0x64				; ACC -= 0x64 + CY {'d'}
0x031D: 40 7D		jc	Label_091				; If (CY == H) then jumps (forward) hither: 0x039C

0x031F: 74 9C		mov	A, #0x9C				; ACC = 0x9C
0x0321: 61 98		ajmp	Label_090				; Jumps (forward) hither: 0x0398 (PC += 2, PC(10-0) = 0x0398)

Label_079:

0x0323: B1 B7		acall	Function_007				; Calls (forward) this: 0x05B7 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05B7)
0x0325: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x0328: A4		mul	AB					; B:ACC = ACC * B
0x0329: 2F		add	A, R7					; ACC += R7
0x032A: F5 2C		mov	0x2C, A					; [0x2C] = ACC
0x032C: 80 6E		sjmp	Label_091				; Jumps (forward) hither: 0x039C

Label_080:

0x032E: D1 0B		acall	Function_014				; Calls (forward) this: 0x060B (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x060B)
0x0330: 40 6A		jc	Label_091				; If (CY == H) then jumps (forward) hither: 0x039C

Label_081:

0x0332: 74 C4		mov	A, #0xC4				; ACC = 0xC4
0x0334: 25 2D		add	A, 0x2D					; ACC += [0x2D]
0x0336: F5 2D		mov	0x2D, A					; [0x2D] = ACC
0x0338: 80 62		sjmp	Label_091				; Jumps (forward) hither: 0x039C

Label_082:

0x033A: B1 EB		acall	Function_012				; Calls (forward) this: 0x05EB (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05EB)
0x033C: E5 F0		mov	A, B					; ACC = B
0x033E: 04		inc	A					; ++ACC
0x033F: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x0342: 84		div	AB					; ACC = ACC / B, B = ACC % B
0x0343: AF F0		mov	R7, B					; R7 = B
0x0345: B1 EB		acall	Function_012				; Calls (forward) this: 0x05EB (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x05EB)
0x0347: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x034A: A4		mul	AB					; B:ACC = ACC * B
0x034B: 2F		add	A, R7					; ACC += R7
0x034C: F5 2D		mov	0x2D, A					; [0x2D] = ACC
0x034E: 80 4C		sjmp	Label_091				; Jumps (forward) hither: 0x039C

Label_083:

0x0350: 85 2C 32	mov	0x32, 0x2C				; [0x32] = [0x2C]
0x0353: 85 2D 2E	mov	0x2E, 0x2D				; [0x2E] = [0x2D]
0x0356: 75 2F 15	mov	0x2F, #0x15				; [0x2F] = 0x15
0x0359: 80 41		sjmp	Label_091				; Jumps (forward) hither: 0x039C

Label_084:

0x035B: E4		clr	A					; ACC = 0
0x035C: F5 2F		mov	0x2F, A					; [0x2F] = ACC
0x035E: F5 2B		mov	0x2B, A					; [0x2B] = ACC
0x0360: 80 3A		sjmp	Label_091				; Jumps (forward) hither: 0x039C

Label_085:

0x0362: E4		clr	A					; ACC = 0
0x0363: F5 2F		mov	0x2F, A					; [0x2F] = ACC
0x0365: 80 35		sjmp	Label_091				; Jumps (forward) hither: 0x039C

Label_086:

0x0367: 75 2F 18	mov	0x2F, #0x18				; [0x2F] = 0x18
0x036A: E4		clr	A					; ACC = 0
0x036B: F5 34		mov	0x34, A					; [0x34] = ACC
0x036D: F5 31		mov	0x31, A					; [0x31] = ACC
0x036F: F5 2A		mov	0x2A, A					; [0x2A] = ACC
0x0371: 80 29		sjmp	Label_091				; Jumps (forward) hither: 0x039C

Label_087:

0x0373: 05 2C		inc	0x2C					; ++[0x2C]
0x0375: E5 2C		mov	A, 0x2C					; ACC = [0x2C]
0x0377: B4 64 22	cjne	A, #0x64, Label_091			; If (ACC != 0x64 {'d'}) then jumps (forward) hither: 0x039C

0x037A: E4		clr	A					; ACC = 0
0x037B: F5 2C		mov	0x2C, A					; [0x2C] = ACC
0x037D: 05 2D		inc	0x2D					; ++[0x2D]
0x037F: E5 2D		mov	A, 0x2D					; ACC = [0x2D]
0x0381: B4 64 18	cjne	A, #0x64, Label_091			; If (ACC != 0x64 {'d'}) then jumps (forward) hither: 0x039C

0x0384: E4		clr	A					; ACC = 0
0x0385: F5 2D		mov	0x2D, A					; [0x2D] = ACC
0x0387: 80 13		sjmp	Label_091				; Jumps (forward) hither: 0x039C

Label_088:

0x0389: B2 02		cpl	0x02					; [0x02] = ~[0x02]
0x038B: 80 0F		sjmp	Label_091				; Jumps (forward) hither: 0x039C

Label_089:

0x038D: 05 2C		inc	0x2C					; ++[0x2C]
0x038F: E5 2C		mov	A, 0x2C					; ACC = [0x2C]
0x0391: C3		clr	C					; CY = L
0x0392: 94 0A		subb	A, #0x0A				; ACC -= 0x0A + CY {'\n'}
0x0394: 40 06		jc	Label_091				; If (CY == H) then jumps (forward) hither: 0x039C

0x0396: 74 F6		mov	A, #0xF6				; ACC = 0xF6

Label_090:

0x0398: 25 2C		add	A, 0x2C					; ACC += [0x2C]
0x039A: F5 2C		mov	0x2C, A					; [0x2C] = ACC

Label_091:

0x039C: 20 B5 04	jb	T1, Label_092				; If (T1 == H) then jumps (forward) hither: 0x03A3

0x039F: 11 1D		acall	Function_001				; Calls (backward) this: 0x001D (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x001D)
0x03A1: 80 F9		sjmp	Label_091				; Jumps (backward) hither: 0x039C

Label_092:

0x03A3: 22		ret						; PCH = [SP--], PCL = [SP--]

;-------------------------------------------------------------------------------

Function_003:

0x03A4: D2 B4		setb	T0					; T0 = H
0x03A6: 30 B4 02	jnb	T0, Label_093				; If (T0 == L) then jumps (forward) hither: 0x03AB

0x03A9: 81 E9		ajmp	Label_131				; Jumps (forward) hither: 0x04E9 (PC += 2, PC(10-0) = 0x04E9)

Label_093:

0x03AB: 7F 01		mov	R7, #0x01				; R7 = 0x01
0x03AD: 7E 00		mov	R6, #0x00				; R6 = 0x00 {'\0'}
0x03AF: F1 8F		acall	Function_022				; Calls (forward) this: 0x078F (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x078F)
0x03B1: 30 B4 02	jnb	T0, Label_094				; If (T0 == L) then jumps (forward) hither: 0x03B6

0x03B4: 81 E9		ajmp	Label_131				; Jumps (forward) hither: 0x04E9 (PC += 2, PC(10-0) = 0x04E9)

Label_094:

0x03B6: C2 8E		clr	TR1					; TR1 = L
0x03B8: 75 25 0B	mov	0x25, #0x0B				; [0x25] = 0x0B
0x03BB: 75 26 B9	mov	0x26, #0xB9				; [0x26] = 0xB9
0x03BE: E5 2F		mov	A, 0x2F					; ACC = [0x2F]
0x03C0: 14		dec	A					; --ACC
0x03C1: B4 29 00	cjne	A, #0x29, Label_095			; If (ACC != 0x29 {')'}) then jumps (forward) hither: 0x03C4

Label_095:

0x03C4: 40 02		jc	Label_096				; If (CY == H) then jumps (forward) hither: 0x03C8

0x03C6: 81 E2		ajmp	Label_130				; Jumps (forward) hither: 0x04E2 (PC += 2, PC(10-0) = 0x04E2)

Label_096:

0x03C8: 90 03 D2	mov	DPTR, #0x03D2				; DPTR = 0x03D2
0x03CB: 25 E0		add	A, ACC					; ACC += ACC
0x03CD: 50 02		jnc	Label_097				; If (CY == L) then jumps (forward) hither: 0x03D1

0x03CF: 05 83		inc	DPH					; ++DPH

Label_097:

0x03D1: 73		jmp	@A+DPTR					; Jumps hither: [DPTR + ACC]

0x03D2: 81 24		ajmp	Label_098				; Jumps (forward) hither: 0x0424 (PC += 2, PC(10-0) = 0x0424)

0x03D4: 81 29		ajmp	Label_099				; Jumps (forward) hither: 0x0429 (PC += 2, PC(10-0) = 0x0429)

0x03D6: 81 87		ajmp	Label_115				; Jumps (forward) hither: 0x0487 (PC += 2, PC(10-0) = 0x0487)

0x03D8: 81 B0		ajmp	Label_122				; Jumps (forward) hither: 0x04B0 (PC += 2, PC(10-0) = 0x04B0)

0x03DA: 81 C6		ajmp	Label_125				; Jumps (forward) hither: 0x04C6 (PC += 2, PC(10-0) = 0x04C6)

0x03DC: 81 2E		ajmp	Label_100				; Jumps (forward) hither: 0x042E (PC += 2, PC(10-0) = 0x042E)

0x03DE: 81 32		ajmp	Label_101				; Jumps (forward) hither: 0x0432 (PC += 2, PC(10-0) = 0x0432)

0x03E0: 81 36		ajmp	Label_102				; Jumps (forward) hither: 0x0436 (PC += 2, PC(10-0) = 0x0436)

0x03E2: 81 3A		ajmp	Label_103				; Jumps (forward) hither: 0x043A (PC += 2, PC(10-0) = 0x043A)

0x03E4: 81 4D		ajmp	Label_105				; Jumps (forward) hither: 0x044D (PC += 2, PC(10-0) = 0x044D)

0x03E6: 81 51		ajmp	Label_106				; Jumps (forward) hither: 0x0451 (PC += 2, PC(10-0) = 0x0451)

0x03E8: 81 55		ajmp	Label_107				; Jumps (forward) hither: 0x0455 (PC += 2, PC(10-0) = 0x0455)

0x03EA: 81 59		ajmp	Label_108				; Jumps (forward) hither: 0x0459 (PC += 2, PC(10-0) = 0x0459)

0x03EC: 81 63		ajmp	Label_109				; Jumps (forward) hither: 0x0463 (PC += 2, PC(10-0) = 0x0463)

0x03EE: 81 8C		ajmp	Label_116				; Jumps (forward) hither: 0x048C (PC += 2, PC(10-0) = 0x048C)

0x03F0: 81 90		ajmp	Label_117				; Jumps (forward) hither: 0x0490 (PC += 2, PC(10-0) = 0x0490)

0x03F2: 81 94		ajmp	Label_118				; Jumps (forward) hither: 0x0494 (PC += 2, PC(10-0) = 0x0494)

0x03F4: 81 98		ajmp	Label_119				; Jumps (forward) hither: 0x0498 (PC += 2, PC(10-0) = 0x0498)

0x03F6: 81 98		ajmp	Label_119				; Jumps (forward) hither: 0x0498 (PC += 2, PC(10-0) = 0x0498)

0x03F8: 81 A6		ajmp	Label_120				; Jumps (forward) hither: 0x04A6 (PC += 2, PC(10-0) = 0x04A6)

0x03FA: 81 AB		ajmp	Label_121				; Jumps (forward) hither: 0x04AB (PC += 2, PC(10-0) = 0x04AB)

0x03FC: 81 84		ajmp	Label_114				; Jumps (forward) hither: 0x0484 (PC += 2, PC(10-0) = 0x0484)

0x03FE: 81 BC		ajmp	Label_123				; Jumps (forward) hither: 0x04BC (PC += 2, PC(10-0) = 0x04BC)

0x0400: 81 C1		ajmp	Label_124				; Jumps (forward) hither: 0x04C1 (PC += 2, PC(10-0) = 0x04C1)

0x0402: 81 84		ajmp	Label_114				; Jumps (forward) hither: 0x0484 (PC += 2, PC(10-0) = 0x0484)

0x0404: 81 E2		ajmp	Label_130				; Jumps (forward) hither: 0x04E2 (PC += 2, PC(10-0) = 0x04E2)

0x0406: 81 E2		ajmp	Label_130				; Jumps (forward) hither: 0x04E2 (PC += 2, PC(10-0) = 0x04E2)

0x0408: 81 E2		ajmp	Label_130				; Jumps (forward) hither: 0x04E2 (PC += 2, PC(10-0) = 0x04E2)

0x040A: 81 E2		ajmp	Label_130				; Jumps (forward) hither: 0x04E2 (PC += 2, PC(10-0) = 0x04E2)

0x040C: 81 48		ajmp	Label_104				; Jumps (forward) hither: 0x0448 (PC += 2, PC(10-0) = 0x0448)

0x040E: 81 6E		ajmp	Label_110				; Jumps (forward) hither: 0x046E (PC += 2, PC(10-0) = 0x046E)

0x0410: 81 72		ajmp	Label_111				; Jumps (forward) hither: 0x0472 (PC += 2, PC(10-0) = 0x0472)

0x0412: 81 76		ajmp	Label_112				; Jumps (forward) hither: 0x0476 (PC += 2, PC(10-0) = 0x0476)

0x0414: 81 7A		ajmp	Label_113				; Jumps (forward) hither: 0x047A (PC += 2, PC(10-0) = 0x047A)

0x0416: 81 84		ajmp	Label_114				; Jumps (forward) hither: 0x0484 (PC += 2, PC(10-0) = 0x0484)

0x0418: 81 D0		ajmp	Label_126				; Jumps (forward) hither: 0x04D0 (PC += 2, PC(10-0) = 0x04D0)

0x041A: 81 D5		ajmp	Label_127				; Jumps (forward) hither: 0x04D5 (PC += 2, PC(10-0) = 0x04D5)

0x041C: 81 E2		ajmp	Label_130				; Jumps (forward) hither: 0x04E2 (PC += 2, PC(10-0) = 0x04E2)

0x041E: 81 E2		ajmp	Label_130				; Jumps (forward) hither: 0x04E2 (PC += 2, PC(10-0) = 0x04E2)

0x0420: 81 84		ajmp	Label_114				; Jumps (forward) hither: 0x0484 (PC += 2, PC(10-0) = 0x0484)

0x0422: 81 DA		ajmp	Label_128				; Jumps (forward) hither: 0x04DA (PC += 2, PC(10-0) = 0x04DA)

Label_098:

0x0424: 75 2F 06	mov	0x2F, #0x06				; [0x2F] = 0x06
0x0427: 81 E2		ajmp	Label_130				; Jumps (forward) hither: 0x04E2 (PC += 2, PC(10-0) = 0x04E2)

Label_099:

0x0429: 75 2F 0A	mov	0x2F, #0x0A				; [0x2F] = 0x0A {'\n'}
0x042C: 81 E2		ajmp	Label_130				; Jumps (forward) hither: 0x04E2 (PC += 2, PC(10-0) = 0x04E2)

Label_100:

0x042E: 05 2F		inc	0x2F					; ++[0x2F]
0x0430: 81 E2		ajmp	Label_130				; Jumps (forward) hither: 0x04E2 (PC += 2, PC(10-0) = 0x04E2)

Label_101:

0x0432: 05 2F		inc	0x2F					; ++[0x2F]
0x0434: 81 E2		ajmp	Label_130				; Jumps (forward) hither: 0x04E2 (PC += 2, PC(10-0) = 0x04E2)

Label_102:

0x0436: 05 2F		inc	0x2F					; ++[0x2F]
0x0438: 81 E2		ajmp	Label_130				; Jumps (forward) hither: 0x04E2 (PC += 2, PC(10-0) = 0x04E2)

Label_103:

0x043A: 85 2C 30	mov	0x30, 0x2C				; [0x30] = [0x2C]
0x043D: 85 2D 24	mov	0x24, 0x2D				; [0x24] = [0x2D]
0x0440: E4		clr	A					; ACC = 0
0x0441: F5 23		mov	0x23, A					; [0x23] = ACC
0x0443: 75 2F 1E	mov	0x2F, #0x1E				; [0x2F] = 0x1E
0x0446: 81 E2		ajmp	Label_130				; Jumps (forward) hither: 0x04E2 (PC += 2, PC(10-0) = 0x04E2)

Label_104:

0x0448: E4		clr	A					; ACC = 0
0x0449: F5 23		mov	0x23, A					; [0x23] = ACC
0x044B: 81 DE		ajmp	Label_129				; Jumps (forward) hither: 0x04DE (PC += 2, PC(10-0) = 0x04DE)

Label_105:

0x044D: 05 2F		inc	0x2F					; ++[0x2F]
0x044F: 81 E2		ajmp	Label_130				; Jumps (forward) hither: 0x04E2 (PC += 2, PC(10-0) = 0x04E2)

Label_106:

0x0451: 05 2F		inc	0x2F					; ++[0x2F]
0x0453: 81 E2		ajmp	Label_130				; Jumps (forward) hither: 0x04E2 (PC += 2, PC(10-0) = 0x04E2)

Label_107:

0x0455: 05 2F		inc	0x2F					; ++[0x2F]
0x0457: 81 E2		ajmp	Label_130				; Jumps (forward) hither: 0x04E2 (PC += 2, PC(10-0) = 0x04E2)

Label_108:

0x0459: 85 2C 27	mov	0x27, 0x2C				; [0x27] = [0x2C]
0x045C: 85 2D 21	mov	0x21, 0x2D				; [0x21] = [0x2D]
0x045F: 05 2F		inc	0x2F					; ++[0x2F]
0x0461: 80 7F		sjmp	Label_130				; Jumps (forward) hither: 0x04E2

Label_109:

0x0463: 75 2F 1F	mov	0x2F, #0x1F				; [0x2F] = 0x1F
0x0466: 85 33 2C	mov	0x2C, 0x33				; [0x2C] = [0x33]
0x0469: 85 28 2D	mov	0x2D, 0x28				; [0x2D] = [0x28]
0x046C: 80 74		sjmp	Label_130				; Jumps (forward) hither: 0x04E2

Label_110:

0x046E: 05 2F		inc	0x2F					; ++[0x2F]
0x0470: 80 70		sjmp	Label_130				; Jumps (forward) hither: 0x04E2

Label_111:

0x0472: 05 2F		inc	0x2F					; ++[0x2F]
0x0474: 80 6C		sjmp	Label_130				; Jumps (forward) hither: 0x04E2

Label_112:

0x0476: 05 2F		inc	0x2F					; ++[0x2F]
0x0478: 80 68		sjmp	Label_130				; Jumps (forward) hither: 0x04E2

Label_113:

0x047A: 85 2C 33	mov	0x33, 0x2C				; [0x33] = [0x2C]
0x047D: 85 2D 28	mov	0x28, 0x2D				; [0x28] = [0x2D]
0x0480: 05 2F		inc	0x2F					; ++[0x2F]
0x0482: 80 5E		sjmp	Label_130				; Jumps (forward) hither: 0x04E2

Label_114:

0x0484: E4		clr	A					; ACC = 0
0x0485: 80 57		sjmp	Label_129				; Jumps (forward) hither: 0x04DE

Label_115:

0x0487: 75 2F 0F	mov	0x2F, #0x0F				; [0x2F] = 0x0F
0x048A: 80 56		sjmp	Label_130				; Jumps (forward) hither: 0x04E2

Label_116:

0x048C: 05 2F		inc	0x2F					; ++[0x2F]
0x048E: 80 52		sjmp	Label_130				; Jumps (forward) hither: 0x04E2

Label_117:

0x0490: 05 2F		inc	0x2F					; ++[0x2F]
0x0492: 80 4E		sjmp	Label_130				; Jumps (forward) hither: 0x04E2

Label_118:

0x0494: 05 2F		inc	0x2F					; ++[0x2F]
0x0496: 80 4A		sjmp	Label_130				; Jumps (forward) hither: 0x04E2

Label_119:

0x0498: 85 2C 32	mov	0x32, 0x2C				; [0x32] = [0x2C]
0x049B: 85 2D 2E	mov	0x2E, 0x2D				; [0x2E] = [0x2D]
0x049E: 75 2F 14	mov	0x2F, #0x14				; [0x2F] = 0x14
0x04A1: E4		clr	A					; ACC = 0
0x04A2: F5 35		mov	0x35, A					; [0x35] = ACC
0x04A4: 80 3C		sjmp	Label_130				; Jumps (forward) hither: 0x04E2

Label_120:

0x04A6: 75 2F 15	mov	0x2F, #0x15				; [0x2F] = 0x15
0x04A9: 80 37		sjmp	Label_130				; Jumps (forward) hither: 0x04E2

Label_121:

0x04AB: 75 2F 14	mov	0x2F, #0x14				; [0x2F] = 0x14
0x04AE: 80 32		sjmp	Label_130				; Jumps (forward) hither: 0x04E2

Label_122:

0x04B0: 75 2F 17	mov	0x2F, #0x17				; [0x2F] = 0x17
0x04B3: E4		clr	A					; ACC = 0
0x04B4: F5 34		mov	0x34, A					; [0x34] = ACC
0x04B6: F5 31		mov	0x31, A					; [0x31] = ACC
0x04B8: F5 2A		mov	0x2A, A					; [0x2A] = ACC
0x04BA: 80 26		sjmp	Label_130				; Jumps (forward) hither: 0x04E2

Label_123:

0x04BC: 75 2F 18	mov	0x2F, #0x18				; [0x2F] = 0x18
0x04BF: 80 21		sjmp	Label_130				; Jumps (forward) hither: 0x04E2

Label_124:

0x04C1: 75 2F 17	mov	0x2F, #0x17				; [0x2F] = 0x17
0x04C4: 80 1C		sjmp	Label_130				; Jumps (forward) hither: 0x04E2

Label_125:

0x04C6: 75 2F 19	mov	0x2F, #0x19				; [0x2F] = 0x19
0x04C9: E4		clr	A					; ACC = 0
0x04CA: F5 2C		mov	0x2C, A					; [0x2C] = ACC
0x04CC: F5 2D		mov	0x2D, A					; [0x2D] = ACC
0x04CE: 80 12		sjmp	Label_130				; Jumps (forward) hither: 0x04E2

Label_126:

0x04D0: 75 2F 28	mov	0x2F, #0x28				; [0x2F] = 0x28 {'('}
0x04D3: 80 0D		sjmp	Label_130				; Jumps (forward) hither: 0x04E2

Label_127:

0x04D5: 75 2F 29	mov	0x2F, #0x29				; [0x2F] = 0x29 {')'}
0x04D8: 80 08		sjmp	Label_130				; Jumps (forward) hither: 0x04E2

Label_128:

0x04DA: 85 2C 29	mov	0x29, 0x2C				; [0x29] = [0x2C]
0x04DD: E4		clr	A					; ACC = 0

Label_129:

0x04DE: F5 2F		mov	0x2F, A					; [0x2F] = ACC
0x04E0: F5 2B		mov	0x2B, A					; [0x2B] = ACC

Label_130:

0x04E2: 20 B4 04	jb	T0, Label_131				; If (T0 == H) then jumps (forward) hither: 0x04E9

0x04E5: 11 1D		acall	Function_001				; Calls (backward) this: 0x001D (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x001D)
0x04E7: 80 F9		sjmp	Label_130				; Jumps (backward) hither: 0x04E2

Label_131:

0x04E9: 22		ret						; PCH = [SP--], PCL = [SP--]

;-------------------------------------------------------------------------------

Function_004:

0x04EA: E5 27		mov	A, 0x27					; ACC = [0x27]
0x04EC: B5 30 06	cjne	A, 0x30, Label_132			; If (ACC != [0x30]) then jumps (forward) hither: 0x04F5

0x04EF: E5 21		mov	A, 0x21					; ACC = [0x21]
0x04F1: 65 24		xrl	A, 0x24					; ACC |= [0x24]
0x04F3: 60 0A		jz	Label_133				; If (ACC == 0) then jumps (forward) hither: 0x04FF

Label_132:

0x04F5: E5 33		mov	A, 0x33					; ACC = [0x33]
0x04F7: B5 30 17	cjne	A, 0x30, Label_135			; If (ACC != [0x30]) then jumps (forward) hither: 0x0511

0x04FA: E5 28		mov	A, 0x28					; ACC = [0x28]
0x04FC: B5 24 12	cjne	A, 0x24, Label_135			; If (ACC != [0x24]) then jumps (forward) hither: 0x0511

Label_133:

0x04FF: 20 01 03	jb	0x01, Label_134				; If ([0x01] == H) then jumps (forward) hither: 0x0505

0x0502: 30 05 0E	jnb	0x05, Label_136				; If ([0x05] == L) then jumps (forward) hither: 0x0513

Label_134:

0x0505: 20 00 0B	jb	0x00, Label_136				; If ([0x00] == H) then jumps (forward) hither: 0x0513

0x0508: E4		clr	A					; ACC = 0
0x0509: F5 25		mov	0x25, A					; [0x25] = ACC
0x050B: F5 26		mov	0x26, A					; [0x26] = ACC
0x050D: D2 00		setb	0x00					; [0x00] = H
0x050F: 80 02		sjmp	Label_136				; Jumps (forward) hither: 0x0513

Label_135:

0x0511: C2 00		clr	0x00					; [0x00] = L

Label_136:

0x0513: E5 24		mov	A, 0x24					; ACC = [0x24]
0x0515: 70 2E		jnz	Label_139				; If (ACC != 0) then jumps (forward) hither: 0x0545

0x0517: E5 30		mov	A, 0x30					; ACC = [0x30]
0x0519: C3		clr	C					; CY = L
0x051A: 94 07		subb	A, #0x07				; ACC -= 0x07 + CY {'\a'}
0x051C: 40 27		jc	Label_139				; If (CY == H) then jumps (forward) hither: 0x0545

0x051E: E5 30		mov	A, 0x30					; ACC = [0x30]
0x0520: D3		setb	C					; CY = H
0x0521: 94 16		subb	A, #0x16				; ACC -= 0x16 + CY
0x0523: 50 20		jnc	Label_139				; If (CY == L) then jumps (forward) hither: 0x0545

0x0525: 30 02 1F	jnb	0x02, Label_140				; If ([0x02] == L) then jumps (forward) hither: 0x0547

0x0528: 20 03 1C	jb	0x03, Label_140				; If ([0x03] == H) then jumps (forward) hither: 0x0547

0x052B: E5 30		mov	A, 0x30					; ACC = [0x30]
0x052D: 94 0C		subb	A, #0x0C				; ACC -= 0x0C + CY {'\f'}
0x052F: 40 08		jc	Label_137				; If (CY == H) then jumps (forward) hither: 0x0539

0x0531: E5 30		mov	A, 0x30					; ACC = [0x30]
0x0533: 24 F4		add	A, #0xF4				; ACC += 0xF4
0x0535: F5 36		mov	0x36, A					; [0x36] = ACC
0x0537: 80 03		sjmp	Label_138				; Jumps (forward) hither: 0x053C

Label_137:

0x0539: 85 30 36	mov	0x36, 0x30				; [0x36] = [0x30]

Label_138:

0x053C: E4		clr	A					; ACC = 0
0x053D: F5 37		mov	0x37, A					; [0x37] = ACC
0x053F: F5 38		mov	0x38, A					; [0x38] = ACC
0x0541: D2 03		setb	0x03					; [0x03] = H
0x0543: 80 02		sjmp	Label_140				; Jumps (forward) hither: 0x0547

Label_139:

0x0545: C2 03		clr	0x03					; [0x03] = L

Label_140:

0x0547: 30 00 1F	jnb	0x00, Label_142				; If ([0x00] == L) then jumps (forward) hither: 0x0569

0x054A: C3		clr	C					; CY = L
0x054B: E5 26		mov	A, 0x26					; ACC = [0x26]
0x054D: 94 D0		subb	A, #0xD0				; ACC -= 0xD0 + CY
0x054F: E5 25		mov	A, 0x25					; ACC = [0x25]
0x0551: 94 07		subb	A, #0x07				; ACC -= 0x07 + CY {'\a'}
0x0553: 50 14		jnc	Label_142				; If (CY == L) then jumps (forward) hither: 0x0569

0x0555: E5 39		mov	A, 0x39					; ACC = [0x39]
0x0557: 94 05		subb	A, #0x05				; ACC -= 0x05 + CY
0x0559: 50 0C		jnc	Label_141				; If (CY == L) then jumps (forward) hither: 0x0567

0x055B: D2 8E		setb	TR1					; TR1 = H
0x055D: 05 26		inc	0x26					; ++[0x26]
0x055F: E5 26		mov	A, 0x26					; ACC = [0x26]
0x0561: 70 06		jnz	Label_142				; If (ACC != 0) then jumps (forward) hither: 0x0569

0x0563: 05 25		inc	0x25					; ++[0x25]
0x0565: 80 02		sjmp	Label_142				; Jumps (forward) hither: 0x0569

Label_141:

0x0567: C2 8E		clr	TR1					; TR1 = L

Label_142:

0x0569: 30 03 34	jnb	0x03, Label_145				; If ([0x03] == L) then jumps (forward) hither: 0x05A0

0x056C: E5 36		mov	A, 0x36					; ACC = [0x36]
0x056E: 75 F0 1B	mov	B, #0x1B				; B = 0x1B {'\e'}
0x0571: A4		mul	AB					; B:ACC = ACC * B
0x0572: FF		mov	R7, A					; R7 = ACC
0x0573: AE F0		mov	R6, B					; R6 = B
0x0575: C3		clr	C					; CY = L
0x0576: E5 38		mov	A, 0x38					; ACC = [0x38]
0x0578: 9F		subb	A, R7					; ACC -= R7 + CY
0x0579: E5 37		mov	A, 0x37					; ACC = [0x37]
0x057B: 9E		subb	A, R6					; ACC -= R6 + CY
0x057C: 50 14		jnc	Label_144				; If (CY == L) then jumps (forward) hither: 0x0592

0x057E: E5 39		mov	A, 0x39					; ACC = [0x39]
0x0580: 94 02		subb	A, #0x02				; ACC -= 0x02 + CY
0x0582: 50 0C		jnc	Label_143				; If (CY == L) then jumps (forward) hither: 0x0590

0x0584: D2 8E		setb	TR1					; TR1 = H
0x0586: 05 38		inc	0x38					; ++[0x38]
0x0588: E5 38		mov	A, 0x38					; ACC = [0x38]
0x058A: 70 06		jnz	Label_144				; If (ACC != 0) then jumps (forward) hither: 0x0592

0x058C: 05 37		inc	0x37					; ++[0x37]
0x058E: 80 02		sjmp	Label_144				; Jumps (forward) hither: 0x0592

Label_143:

0x0590: C2 8E		clr	TR1					; TR1 = L

Label_144:

0x0592: 20 00 0B	jb	0x00, Label_145				; If ([0x00] == H) then jumps (forward) hither: 0x05A0

0x0595: C3		clr	C					; CY = L
0x0596: E5 38		mov	A, 0x38					; ACC = [0x38]
0x0598: 9F		subb	A, R7					; ACC -= R7 + CY
0x0599: E5 37		mov	A, 0x37					; ACC = [0x37]
0x059B: 9E		subb	A, R6					; ACC -= R6 + CY
0x059C: 40 02		jc	Label_145				; If (CY == H) then jumps (forward) hither: 0x05A0

0x059E: C2 8E		clr	TR1					; TR1 = L

Label_145:

0x05A0: 22		ret						; PCH = [SP--], PCL = [SP--]

;-------------------------------------------------------------------------------

Function_005:

0x05A1: E5 2C		mov	A, 0x2C					; ACC = [0x2C]
0x05A3: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x05A6: 84		div	AB					; ACC = ACC / B, B = ACC % B
0x05A7: FF		mov	R7, A					; R7 = ACC
0x05A8: E5 2C		mov	A, 0x2C					; ACC = [0x2C]
0x05AA: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x05AD: 84		div	AB					; ACC = ACC / B, B = ACC % B
0x05AE: E5 2D		mov	A, 0x2D					; ACC = [0x2D]

;-------------------------------------------------------------------------------

Function_006:

0x05B0: AD F0		mov	R5, B					; R5 = B
0x05B2: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x05B5: 84		div	AB					; ACC = ACC / B, B = ACC % B
0x05B6: 22		ret						; PCH = [SP--], PCL = [SP--]

;-------------------------------------------------------------------------------

Function_007:

0x05B7: E5 2C		mov	A, 0x2C					; ACC = [0x2C]
0x05B9: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x05BC: 84		div	AB					; ACC = ACC / B, B = ACC % B
0x05BD: E5 F0		mov	A, B					; ACC = B
0x05BF: 04		inc	A					; ++ACC
0x05C0: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x05C3: 84		div	AB					; ACC = ACC / B, B = ACC % B
0x05C4: AF F0		mov	R7, B					; R7 = B

;-------------------------------------------------------------------------------

Function_008:

0x05C6: E5 2C		mov	A, 0x2C					; ACC = [0x2C]
0x05C8: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x05CB: 84		div	AB					; ACC = ACC / B, B = ACC % B
0x05CC: 22		ret						; PCH = [SP--], PCL = [SP--]

;-------------------------------------------------------------------------------

Function_009:

0x05CD: E5 32		mov	A, 0x32					; ACC = [0x32]
0x05CF: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x05D2: 84		div	AB					; ACC = ACC / B, B = ACC % B
0x05D3: FF		mov	R7, A					; R7 = ACC
0x05D4: E5 32		mov	A, 0x32					; ACC = [0x32]
0x05D6: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x05D9: 84		div	AB					; ACC = ACC / B, B = ACC % B
0x05DA: E5 2E		mov	A, 0x2E					; ACC = [0x2E]

;-------------------------------------------------------------------------------

Function_010:

0x05DC: AD F0		mov	R5, B					; R5 = B
0x05DE: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x05E1: 84		div	AB					; ACC = ACC / B, B = ACC % B
0x05E2: FB		mov	R3, A					; R3 = ACC
0x05E3: 22		ret						; PCH = [SP--], PCL = [SP--]

;-------------------------------------------------------------------------------

Function_011:

0x05E4: E5 2D		mov	A, 0x2D					; ACC = [0x2D]
0x05E6: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x05E9: 84		div	AB					; ACC = ACC / B, B = ACC % B
0x05EA: FF		mov	R7, A					; R7 = ACC

;-------------------------------------------------------------------------------

Function_012:

0x05EB: E5 2D		mov	A, 0x2D					; ACC = [0x2D]
0x05ED: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x05F0: 84		div	AB					; ACC = ACC / B, B = ACC % B
0x05F1: 22		ret						; PCH = [SP--], PCL = [SP--]

;-------------------------------------------------------------------------------

Function_013:

0x05F2: E5 34		mov	A, 0x34					; ACC = [0x34]
0x05F4: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x05F7: 84		div	AB					; ACC = ACC / B, B = ACC % B
0x05F8: FF		mov	R7, A					; R7 = ACC
0x05F9: E5 34		mov	A, 0x34					; ACC = [0x34]
0x05FB: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x05FE: 84		div	AB					; ACC = ACC / B, B = ACC % B
0x05FF: AD F0		mov	R5, B					; R5 = B
0x0601: E5 31		mov	A, 0x31					; ACC = [0x31]
0x0603: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x0606: 84		div	AB					; ACC = ACC / B, B = ACC % B
0x0607: FB		mov	R3, A					; R3 = ACC
0x0608: E5 31		mov	A, 0x31					; ACC = [0x31]
0x060A: 22		ret						; PCH = [SP--], PCL = [SP--]

;-------------------------------------------------------------------------------

Function_014:

0x060B: 74 0A		mov	A, #0x0A				; ACC = 0x0A {'\n'}
0x060D: 25 2D		add	A, 0x2D					; ACC += [0x2D]
0x060F: F5 2D		mov	0x2D, A					; [0x2D] = ACC
0x0611: C3		clr	C					; CY = L
0x0612: 94 3C		subb	A, #0x3C				; ACC -= 0x3C + CY {'<'}
0x0614: 22		ret						; PCH = [SP--], PCL = [SP--]

;-------------------------------------------------------------------------------

Function_015:

0x0615: 75 F0 0A	mov	B, #0x0A				; B = 0x0A {'\n'}
0x0618: A4		mul	AB					; B:ACC = ACC * B
0x0619: 2F		add	A, R7					; ACC += R7
0x061A: F5 2C		mov	0x2C, A					; [0x2C] = ACC
0x061C: C3		clr	C					; CY = L
0x061D: 94 18		subb	A, #0x18				; ACC -= 0x18 + CY
0x061F: 22		ret						; PCH = [SP--], PCL = [SP--]

;-------------------------------------------------------------------------------

Function_016:

0x0620: 74 0A		mov	A, #0x0A				; ACC = 0x0A {'\n'}
0x0622: 25 2C		add	A, 0x2C					; ACC += [0x2C]
0x0624: F5 2C		mov	0x2C, A					; [0x2C] = ACC
0x0626: C3		clr	C					; CY = L
0x0627: 22		ret						; PCH = [SP--], PCL = [SP--]

;-------------------------------------------------------------------------------

Function_017:

0x0628: EF		mov	A, R7					; ACC = R7
0x0629: 90 07 EB	mov	DPTR, #0x07EB				; DPTR = 0x07EB
0x062C: 93		movc	A, @A+DPTR				; ACC = ROM[DPTR + ACC]
0x062D: F5 90		mov	P1, A					; P1 = ACC
0x062F: 22		ret						; PCH = [SP--], PCL = [SP--]

;-------------------------------------------------------------------------------

Function_018:

0x0630: 75 8C 3C	mov	TH0, #0x3C				; TH0 = 0x3C {'<'}
0x0633: E5 29		mov	A, 0x29					; ACC = [0x29]
0x0635: 24 BA		add	A, #0xBA				; ACC += 0xBA
0x0637: F5 8A		mov	TL0, A					; TL0 = ACC
0x0639: 22		ret						; PCH = [SP--], PCL = [SP--]

;-------------------------------------------------------------------------------

Function_019:

0x063A: 8F 08		mov	R0<#1>, R7				; R0<#1> = R7
0x063C: 8D 09		mov	R1<#1>, R5				; R1<#1> = R5
0x063E: 8B 0A		mov	R2<#1>, R3				; R2<#1> = R3
0x0640: D1 D0		acall	Label_160				; Calls (forward) this: 0x06D0 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x06D0)
0x0642: E5 0C		mov	A, R4<#1>				; ACC = R4<#1>
0x0644: B4 01 09	cjne	A, #0x01, Label_146			; If (ACC != 0x01) then jumps (forward) hither: 0x0650

0x0647: E5 39		mov	A, 0x39					; ACC = [0x39]
0x0649: C3		clr	C					; CY = L
0x064A: 94 05		subb	A, #0x05				; ACC -= 0x05 + CY
0x064C: 50 06		jnc	Label_147				; If (CY == L) then jumps (forward) hither: 0x0654

0x064E: 80 00		sjmp	Label_146				; Jumps (forward) hither: 0x0650

Label_146:

0x0650: AF 08		mov	R7, R0<#1>				; R7 = R0<#1>
0x0652: F1 C5		acall	Function_024				; Calls (forward) this: 0x07C5 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x07C5)

Label_147:

0x0654: E5 0C		mov	A, R4<#1>				; ACC = R4<#1>
0x0656: B4 02 09	cjne	A, #0x02, Label_148			; If (ACC != 0x02) then jumps (forward) hither: 0x0662

0x0659: E5 39		mov	A, 0x39					; ACC = [0x39]
0x065B: C3		clr	C					; CY = L
0x065C: 94 05		subb	A, #0x05				; ACC -= 0x05 + CY
0x065E: 50 06		jnc	Label_149				; If (CY == L) then jumps (forward) hither: 0x0666

0x0660: 80 00		sjmp	Label_148				; Jumps (forward) hither: 0x0662

Label_148:

0x0662: AF 09		mov	R7, R1<#1>				; R7 = R1<#1>
0x0664: F1 D2		acall	Function_025				; Calls (forward) this: 0x07D2 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x07D2)

Label_149:

0x0666: E5 0C		mov	A, R4<#1>				; ACC = R4<#1>
0x0668: B4 03 09	cjne	A, #0x03, Label_150			; If (ACC != 0x03) then jumps (forward) hither: 0x0674

0x066B: E5 39		mov	A, 0x39					; ACC = [0x39]
0x066D: C3		clr	C					; CY = L
0x066E: 94 05		subb	A, #0x05				; ACC -= 0x05 + CY
0x0670: 50 06		jnc	Label_151				; If (CY == L) then jumps (forward) hither: 0x0678

0x0672: 80 00		sjmp	Label_150				; Jumps (forward) hither: 0x0674

Label_150:

0x0674: AF 0A		mov	R7, R2<#1>				; R7 = R2<#1>
0x0676: F1 B8		acall	Function_023				; Calls (forward) this: 0x07B8 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x07B8)

Label_151:

0x0678: E5 0C		mov	A, R4<#1>				; ACC = R4<#1>
0x067A: B4 04 09	cjne	A, #0x04, Label_152			; If (ACC != 0x04) then jumps (forward) hither: 0x0686

0x067D: E5 39		mov	A, 0x39					; ACC = [0x39]
0x067F: C3		clr	C					; CY = L
0x0680: 94 05		subb	A, #0x05				; ACC -= 0x05 + CY
0x0682: 50 06		jnc	Label_153				; If (CY == L) then jumps (forward) hither: 0x068A

0x0684: 80 00		sjmp	Label_152				; Jumps (forward) hither: 0x0686

Label_152:

0x0686: AF 0B		mov	R7, R3<#1>				; R7 = R3<#1>
0x0688: 11 0D		acall	Function_000				; Calls (backward) this: 0x000D (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x000D)

Label_153:

0x068A: E5 0C		mov	A, R4<#1>				; ACC = R4<#1>
0x068C: 64 06		xrl	A, #0x06				; ACC ^= 0x06
0x068E: 70 26		jnz	Label_157				; If (ACC != 0) then jumps (forward) hither: 0x06B6

0x0690: E5 22		mov	A, 0x22					; ACC = [0x22]
0x0692: D3		setb	C					; CY = H
0x0693: 94 01		subb	A, #0x01				; ACC -= 0x01 + CY
0x0695: 50 05		jnc	Label_154				; If (CY == L) then jumps (forward) hither: 0x069C

0x0697: 30 01 02	jnb	0x01, Label_154				; If ([0x01] == L) then jumps (forward) hither: 0x069C

0x069A: D2 8E		setb	TR1					; TR1 = H

Label_154:

0x069C: E5 22		mov	A, 0x22					; ACC = [0x22]
0x069E: D3		setb	C					; CY = H
0x069F: 94 01		subb	A, #0x01				; ACC -= 0x01 + CY
0x06A1: 50 04		jnc	Label_155				; If (CY == L) then jumps (forward) hither: 0x06A7

0x06A3: 7F 01		mov	R7, #0x01				; R7 = 0x01
0x06A5: 80 02		sjmp	Label_156				; Jumps (forward) hither: 0x06A9

Label_155:

0x06A7: 7F 00		mov	R7, #0x00				; R7 = 0x00 {'\0'}

Label_156:

0x06A9: C3		clr	C					; CY = L
0x06AA: EF		mov	A, R7					; ACC = R7
0x06AB: 64 80		xrl	A, #0x80				; ACC ^= 0x80
0x06AD: 94 85		subb	A, #0x85				; ACC -= 0x85 + CY
0x06AF: 50 05		jnc	Label_157				; If (CY == L) then jumps (forward) hither: 0x06B6

0x06B1: 20 01 02	jb	0x01, Label_157				; If ([0x01] == H) then jumps (forward) hither: 0x06B6

0x06B4: C2 8E		clr	TR1					; TR1 = L

Label_157:

0x06B6: E5 0C		mov	A, R4<#1>				; ACC = R4<#1>
0x06B8: B4 07 14	cjne	A, #0x07, Label_159			; If (ACC != 0x07 {'\a'}) then jumps (forward) hither: 0x06CF

0x06BB: E5 22		mov	A, 0x22					; ACC = [0x22]
0x06BD: B4 01 05	cjne	A, #0x01, Label_158			; If (ACC != 0x01) then jumps (forward) hither: 0x06C5

0x06C0: 30 05 02	jnb	0x05, Label_158				; If ([0x05] == L) then jumps (forward) hither: 0x06C5

0x06C3: D2 8E		setb	TR1					; TR1 = H

Label_158:

0x06C5: E5 22		mov	A, 0x22					; ACC = [0x22]
0x06C7: B4 01 05	cjne	A, #0x01, Label_159			; If (ACC != 0x01) then jumps (forward) hither: 0x06CF

0x06CA: 20 05 02	jb	0x05, Label_159				; If ([0x05] == H) then jumps (forward) hither: 0x06CF

0x06CD: C2 8E		clr	TR1					; TR1 = L

Label_159:

0x06CF: 22		ret						; PCH = [SP--], PCL = [SP--]

Label_160:

0x06D0: E5 2F		mov	A, 0x2F					; ACC = [0x2F]
0x06D2: 70 11		jnz	Label_162				; If (ACC != 0) then jumps (forward) hither: 0x06E5

0x06D4: E5 39		mov	A, 0x39					; ACC = [0x39]
0x06D6: C3		clr	C					; CY = L
0x06D7: 94 05		subb	A, #0x05				; ACC -= 0x05 + CY
0x06D9: 50 05		jnc	Label_161				; If (CY == L) then jumps (forward) hither: 0x06E0

0x06DB: 75 90 01	mov	P1, #0x01				; P1 = 0x01
0x06DE: 80 2B		sjmp	Label_166				; Jumps (forward) hither: 0x070B

Label_161:

0x06E0: 75 90 FE	mov	P1, #0xFE				; P1 = 0xFE
0x06E3: 80 26		sjmp	Label_166				; Jumps (forward) hither: 0x070B

Label_162:

0x06E5: E5 2B		mov	A, 0x2B					; ACC = [0x2B]
0x06E7: B4 01 06	cjne	A, #0x01, Label_163			; If (ACC != 0x01) then jumps (forward) hither: 0x06F0

0x06EA: 75 90 FE	mov	P1, #0xFE				; P1 = 0xFE
0x06ED: 12 07 12	lcall	Function_020				; Calls (forward) this: 0x0712 (PC += 3, [++SP] = PCL, [++SP] = PCH, PC = 0x0712)

Label_163:

0x06F0: E5 2B		mov	A, 0x2B					; ACC = [0x2B]
0x06F2: B4 02 03	cjne	A, #0x02, Label_164			; If (ACC != 0x02) then jumps (forward) hither: 0x06F8

0x06F5: 75 90 01	mov	P1, #0x01				; P1 = 0x01

Label_164:

0x06F8: E5 2B		mov	A, 0x2B					; ACC = [0x2B]
0x06FA: B4 03 06	cjne	A, #0x03, Label_165			; If (ACC != 0x03) then jumps (forward) hither: 0x0703

0x06FD: 75 90 BE	mov	P1, #0xBE				; P1 = 0xBE
0x0700: 12 07 12	lcall	Function_020				; Calls (forward) this: 0x0712 (PC += 3, [++SP] = PCL, [++SP] = PCH, PC = 0x0712)

Label_165:

0x0703: E5 2B		mov	A, 0x2B					; ACC = [0x2B]
0x0705: B4 04 09	cjne	A, #0x04, Label_167			; If (ACC != 0x04) then jumps (forward) hither: 0x0711

0x0708: 75 90 DE	mov	P1, #0xDE				; P1 = 0xDE

Label_166:

0x070B: 7F 28		mov	R7, #0x28				; R7 = 0x28 {'('}
0x070D: 7E 00		mov	R6, #0x00				; R6 = 0x00 {'\0'}
0x070F: F1 8F		acall	Function_022				; Calls (forward) this: 0x078F (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x078F)

Label_167:

0x0711: 22		ret						; PCH = [SP--], PCL = [SP--]

;-------------------------------------------------------------------------------

Function_020:

0x0712: 7F 28		mov	R7, #0x28				; R7 = 0x28 {'('}
0x0714: 7E 00		mov	R6, #0x00				; R6 = 0x00 {'\0'}
0x0716: F1 8F		acall	Function_022				; Calls (forward) this: 0x078F (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x078F)
0x0718: 22		ret						; PCH = [SP--], PCL = [SP--]

;-------------------------------------------------------------------------------

Timer0_interrupt:

0x0719: C0 E0		push	ACC					; ++SP, [SP] = ACC
0x071B: C0 D0		push	PSW					; ++SP, [SP] = PSW
0x071D: D1 30		acall	Function_018				; Calls (backward) this: 0x0630 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x0630)
0x071F: 05 22		inc	0x22					; ++[0x22]
0x0721: E5 22		mov	A, 0x22					; ACC = [0x22]
0x0723: 64 02		xrl	A, #0x02				; ACC ^= 0x02
0x0725: 70 32		jnz	Label_168				; If (ACC != 0) then jumps (forward) hither: 0x0759

0x0727: F5 22		mov	0x22, A					; [0x22] = ACC
0x0729: D2 04		setb	0x04					; [0x04] = H
0x072B: 05 39		inc	0x39					; ++[0x39]
0x072D: E5 39		mov	A, 0x39					; ACC = [0x39]
0x072F: 64 0A		xrl	A, #0x0A				; ACC ^= 0x0A {'\n'}
0x0731: 70 26		jnz	Label_168				; If (ACC != 0) then jumps (forward) hither: 0x0759

0x0733: C2 8E		clr	TR1					; TR1 = L
0x0735: D2 B7		setb	RD					; RD = H
0x0737: F5 39		mov	0x39, A					; [0x39] = ACC
0x0739: D2 06		setb	0x06					; [0x06] = H
0x073B: 05 23		inc	0x23					; ++[0x23]
0x073D: E5 23		mov	A, 0x23					; ACC = [0x23]
0x073F: B4 3C 17	cjne	A, #0x3C, Label_168			; If (ACC != 0x3C {'<'}) then jumps (forward) hither: 0x0759

0x0742: 75 23 00	mov	0x23, #0x00				; [0x23] = 0x00 {'\0'}
0x0745: 05 24		inc	0x24					; ++[0x24]
0x0747: E5 24		mov	A, 0x24					; ACC = [0x24]
0x0749: B4 3C 0D	cjne	A, #0x3C, Label_168			; If (ACC != 0x3C {'<'}) then jumps (forward) hither: 0x0759

0x074C: 75 24 00	mov	0x24, #0x00				; [0x24] = 0x00 {'\0'}
0x074F: 05 30		inc	0x30					; ++[0x30]
0x0751: E5 30		mov	A, 0x30					; ACC = [0x30]
0x0753: B4 18 03	cjne	A, #0x18, Label_168			; If (ACC != 0x18) then jumps (forward) hither: 0x0759

0x0756: 75 30 00	mov	0x30, #0x00				; [0x30] = 0x00 {'\0'}

Label_168:

0x0759: D0 D0		pop	PSW					; PSW = [SP], --SP
0x075B: D0 E0		pop	ACC					; ACC = [SP], --SP
0x075D: 32		reti						; PCH = [SP--], PCL = [SP--]

Label_169:

0x075E: 75 29 05	mov	0x29, #0x05				; [0x29] = 0x05
0x0761: 75 30 0C	mov	0x30, #0x0C				; [0x30] = 0x0C {'\f'}
0x0764: 75 27 06	mov	0x27, #0x06				; [0x27] = 0x06
0x0767: 75 33 16	mov	0x33, #0x16				; [0x33] = 0x16
0x076A: C2 8E		clr	TR1					; TR1 = L
0x076C: F1 7A		acall	Function_021				; Calls (forward) this: 0x077A (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x077A)
0x076E: D2 8C		setb	TR0					; TR0 = H

Label_170:

0x0770: 11 1D		acall	Function_001				; Calls (backward) this: 0x001D (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x001D)
0x0772: 51 07		acall	Function_002				; Calls (backward) this: 0x0207 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x0207)
0x0774: 71 A4		acall	Function_003				; Calls (backward) this: 0x03A4 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x03A4)
0x0776: 91 EA		acall	Function_004				; Calls (backward) this: 0x04EA (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x04EA)
0x0778: 80 F6		sjmp	Label_170				; Jumps (backward) hither: 0x0770

;-------------------------------------------------------------------------------

Function_021:

0x077A: 75 89 11	mov	TMOD, #0x11				; TMOD = 0x11
0x077D: D1 30		acall	Function_018				; Calls (backward) this: 0x0630 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x0630)
0x077F: 75 8D FE	mov	TH1, #0xFE				; TH1 = 0xFE
0x0782: 75 8B CA	mov	TL1, #0xCA				; TL1 = 0xCA
0x0785: D2 AF		setb	EA					; EA = H
0x0787: D2 A9		setb	ET0					; ET0 = H
0x0789: D2 AB		setb	ET1					; ET1 = H
0x078B: E4		clr	A					; ACC = 0
0x078C: F5 22		mov	0x22, A					; [0x22] = ACC
0x078E: 22		ret						; PCH = [SP--], PCL = [SP--]

;-------------------------------------------------------------------------------

Function_022:

0x078F: D3		setb	C					; CY = H
0x0790: EF		mov	A, R7					; ACC = R7
0x0791: 94 00		subb	A, #0x00				; ACC -= 0x00 + CY {'\0'}
0x0793: EE		mov	A, R6					; ACC = R6
0x0794: 94 00		subb	A, #0x00				; ACC -= 0x00 + CY {'\0'}
0x0796: 40 0B		jc	Label_173				; If (CY == H) then jumps (forward) hither: 0x07A3

Label_171:

0x0798: 7D 13		mov	R5, #0x13				; R5 = 0x13

Label_172:

0x079A: DD FE		djnz	R5, Label_172				; If (--R5 != 0) then jumps hither: 0x079A (waiting loop)

0x079C: EF		mov	A, R7					; ACC = R7
0x079D: 1F		dec	R7					; --R7
0x079E: 70 EF		jnz	Function_022				; If (ACC != 0) then jumps (backward) hither: 0x078F

0x07A0: 1E		dec	R6					; --R6
0x07A1: 80 EC		sjmp	Function_022				; Jumps (backward) hither: 0x078F

Label_173:

0x07A3: 22		ret						; PCH = [SP--], PCL = [SP--]

Label_174:

0x07A4: 8D 09		mov	R1<#1>, R5				; R1<#1> = R5
0x07A6: 8B 0A		mov	R2<#1>, R3				; R2<#1> = R3
0x07A8: F1 C5		acall	Function_024				; Calls (forward) this: 0x07C5 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x07C5)
0x07AA: AF 09		mov	R7, R1<#1>				; R7 = R1<#1>
0x07AC: F1 D2		acall	Function_025				; Calls (forward) this: 0x07D2 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x07D2)
0x07AE: AF 0A		mov	R7, R2<#1>				; R7 = R2<#1>
0x07B0: F1 B8		acall	Function_023				; Calls (forward) this: 0x07B8 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x07B8)
0x07B2: AF 0B		mov	R7, R3<#1>				; R7 = R3<#1>
0x07B4: 11 0D		acall	Function_000				; Calls (backward) this: 0x000D (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x000D)
0x07B6: C1 D0		ajmp	Label_160				; Jumps (backward) hither: 0x06D0 (PC += 2, PC(10-0) = 0x06D0)

;-------------------------------------------------------------------------------

Function_023:

0x07B8: D1 28		acall	Function_017				; Calls (backward) this: 0x0628 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x0628)
0x07BA: C2 B2		clr	INT0					; INT0 = L
0x07BC: 7F 28		mov	R7, #0x28				; R7 = 0x28 {'('}
0x07BE: 7E 00		mov	R6, #0x00				; R6 = 0x00 {'\0'}
0x07C0: F1 8F		acall	Function_022				; Calls (backward) this: 0x078F (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x078F)
0x07C2: D2 B2		setb	INT0					; INT0 = H
0x07C4: 22		ret						; PCH = [SP--], PCL = [SP--]

;-------------------------------------------------------------------------------

Function_024:

0x07C5: D1 28		acall	Function_017				; Calls (backward) this: 0x0628 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x0628)
0x07C7: C2 B0		clr	RXD					; RXD = L
0x07C9: 7F 28		mov	R7, #0x28				; R7 = 0x28 {'('}
0x07CB: 7E 00		mov	R6, #0x00				; R6 = 0x00 {'\0'}
0x07CD: F1 8F		acall	Function_022				; Calls (backward) this: 0x078F (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x078F)
0x07CF: D2 B0		setb	RXD					; RXD = H
0x07D1: 22		ret						; PCH = [SP--], PCL = [SP--]

;-------------------------------------------------------------------------------

Function_025:

0x07D2: D1 28		acall	Function_017				; Calls (backward) this: 0x0628 (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x0628)
0x07D4: C2 B1		clr	TXD					; TXD = L
0x07D6: 7F 28		mov	R7, #0x28				; R7 = 0x28 {'('}
0x07D8: 7E 00		mov	R6, #0x00				; R6 = 0x00 {'\0'}
0x07DA: F1 8F		acall	Function_022				; Calls (backward) this: 0x078F (PC += 2, [++SP] = PCL, [++SP] = PCH, PC(10-0) = 0x078F)
0x07DC: D2 B1		setb	TXD					; TXD = H
0x07DE: 22		ret						; PCH = [SP--], PCL = [SP--]

;-------------------------------------------------------------------------------

System_init:

0x07DF: 78 7F		mov	R0, #0x7F				; R0 = 0x7F {'^?'}
0x07E1: E4		clr	A					; ACC = 0

Label_175:

0x07E2: F6		mov	@R0, A					; [R0] = ACC
0x07E3: D8 FD		djnz	R0, Label_175				; If (--R0 != 0) then jumps (backward) hither: 0x07E2

0x07E5: 75 81 39	mov	SP, #0x39				; SP = 0x39 {'9'}
0x07E8: 02 07 5E	ljmp	Label_169				; Jumps (backward) hither: 0x075E

Label_176:

0x07EB: FD		mov	R5, A					; R5 = ACC
0x07EC: 25 BB		add	A, 0xBB					; ACC += [0xBB]
0x07EE: AF 67		mov	R7, 0x67				; R7 = [0x67]
0x07F0: CF		xch	A, R7					; ACC <-> R7
0x07F1: DF A5		djnz	R7, Label_171				; If (--R7 != 0) then jumps (backward) hither: 0x0798

0x07F3: FF		mov	R7, A					; R7 = ACC
0x07F4: EF		mov	A, R7					; ACC = R7
0x07F5: 03		rr	A					; ACC[76543210] = ACC[07654321]

;-------------------------------------------------------------------------------

Timer1_interrupt:

0x07F6: 75 8D FE	mov	TH1, #0xFE				; TH1 = 0xFE
0x07F9: 75 8B CA	mov	TL1, #0xCA				; TL1 = 0xCA
0x07FC: B2 B7		cpl	RD					; RD = ~RD
0x07FE: 32		reti						; PCH = [SP--], PCL = [SP--]

0x07FF: FF		mov	R7, A					; R7 = ACC

0x0800: -- -- --
  ....  -- -- --
0xFFFF: -- -- --
