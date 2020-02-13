EESchema Schematic File Version 4
LIBS:Tesis2-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Shield alimentación ventilador"
Date "lun. 01 Julio 2019"
Rev ""
Comp "Universidad nacional de Colombia"
Comment1 "Circuito de alimentación para ventilador "
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 8950 1450 1    60   ~ 0
Vin
Text Label 9350 1450 1    60   ~ 0
IOREF
Text Label 8900 2500 0    60   ~ 0
A0
Text Label 8900 2600 0    60   ~ 0
A1
Text Label 8900 2700 0    60   ~ 0
A2
Text Label 8900 2800 0    60   ~ 0
A3
Text Label 10550 3000 0    60   ~ 0
0(Rx)
Text Label 10550 2800 0    60   ~ 0
2
Text Label 10550 2900 0    60   ~ 0
1(Tx)
Text Label 10550 2700 0    60   ~ 0
3(**)
Text Label 10550 2600 0    60   ~ 0
4
Text Label 10550 2500 0    60   ~ 0
5(**)
Text Label 10550 2400 0    60   ~ 0
6(**)
Text Label 10550 2300 0    60   ~ 0
7
Text Label 10550 2100 0    60   ~ 0
8
Text Label 10550 2000 0    60   ~ 0
9(**)
Text Label 10550 1900 0    60   ~ 0
10(**/SS)
Text Label 10550 1800 0    60   ~ 0
11(**/MOSI)
Text Label 10550 1700 0    60   ~ 0
12(MISO)
Text Label 10550 1600 0    60   ~ 0
13(SCK)
Text Label 10550 1400 0    60   ~ 0
AREF
NoConn ~ 9400 1600
Text Label 10550 1200 0    60   ~ 0
A5(SCL)
Text Notes 10850 1000 0    60   ~ 0
Holes
Text Notes 8550 750  0    60   ~ 0
Shield for Arduino that uses\nthe same pin disposition\nlike "Uno" board Rev 3.
$Comp
L Connector_Generic:Conn_01x08 P1
U 1 1 56D70129
P 9600 1900
F 0 "P1" H 9600 2350 50  0000 C CNN
F 1 "Power" V 9700 1900 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" V 9750 1900 20  0000 C CNN
F 3 "" H 9600 1900 50  0000 C CNN
	1    9600 1900
	1    0    0    -1  
$EndComp
Text Label 8650 1800 0    60   ~ 0
Reset
$Comp
L power:+3.3V #PWR01
U 1 1 56D70538
P 9150 1450
F 0 "#PWR01" H 9150 1300 50  0001 C CNN
F 1 "+3.3V" V 9150 1700 50  0000 C CNN
F 2 "" H 9150 1450 50  0000 C CNN
F 3 "" H 9150 1450 50  0000 C CNN
	1    9150 1450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 56D707BB
P 9050 1350
F 0 "#PWR02" H 9050 1200 50  0001 C CNN
F 1 "+5V" V 9050 1550 50  0000 C CNN
F 2 "" H 9050 1350 50  0000 C CNN
F 3 "" H 9050 1350 50  0000 C CNN
	1    9050 1350
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 P2
U 1 1 56D70DD8
P 9600 2700
F 0 "P2" H 9600 2300 50  0000 C CNN
F 1 "Analog" V 9700 2700 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x06" V 9750 2750 20  0000 C CNN
F 3 "" H 9600 2700 50  0000 C CNN
	1    9600 2700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P5
U 1 1 56D71177
P 10800 650
F 0 "P5" V 10900 650 50  0000 C CNN
F 1 "CONN_01X01" V 10900 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 10721 724 20  0000 C CNN
F 3 "" H 10800 650 50  0000 C CNN
	1    10800 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P6
U 1 1 56D71274
P 10900 650
F 0 "P6" V 11000 650 50  0000 C CNN
F 1 "CONN_01X01" V 11000 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 10900 650 20  0001 C CNN
F 3 "" H 10900 650 50  0000 C CNN
	1    10900 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P7
U 1 1 56D712A8
P 11000 650
F 0 "P7" V 11100 650 50  0000 C CNN
F 1 "CONN_01X01" V 11100 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" V 11000 650 20  0001 C CNN
F 3 "" H 11000 650 50  0000 C CNN
	1    11000 650 
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P8
U 1 1 56D712DB
P 11100 650
F 0 "P8" V 11200 650 50  0000 C CNN
F 1 "CONN_01X01" V 11200 650 50  0001 C CNN
F 2 "Socket_Arduino_Uno:Arduino_1pin" H 11024 572 20  0000 C CNN
F 3 "" H 11100 650 50  0000 C CNN
	1    11100 650 
	0    -1   -1   0   
$EndComp
NoConn ~ 10800 850 
NoConn ~ 10900 850 
NoConn ~ 11000 850 
NoConn ~ 11100 850 
$Comp
L Connector_Generic:Conn_01x08 P4
U 1 1 56D7164F
P 10000 2600
F 0 "P4" H 10000 2100 50  0000 C CNN
F 1 "Digital" V 10100 2600 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x08" V 10150 2550 20  0000 C CNN
F 3 "" H 10000 2600 50  0000 C CNN
	1    10000 2600
	-1   0    0    -1  
$EndComp
Wire Notes Line
	8525 825  9925 825 
Wire Notes Line
	9925 825  9925 475 
Wire Wire Line
	9350 1450 9350 1700
Wire Wire Line
	9350 1700 9400 1700
Wire Wire Line
	9400 1900 9150 1900
Wire Wire Line
	9400 2000 9050 2000
Wire Wire Line
	9400 2300 8950 2300
Wire Wire Line
	8950 2300 8950 1450
Wire Wire Line
	9050 2000 9050 1350
Wire Wire Line
	9150 1900 9150 1550
Wire Wire Line
	9400 2500 8900 2500
Wire Wire Line
	9400 2600 8900 2600
Wire Wire Line
	9400 2700 8900 2700
Wire Wire Line
	9400 2800 8900 2800
Wire Wire Line
	9400 2900 8900 2900
Wire Wire Line
	9400 3000 8900 3000
$Comp
L Connector_Generic:Conn_01x10 P3
U 1 1 56D721E0
P 10000 1600
F 0 "P3" H 10000 2150 50  0000 C CNN
F 1 "Digital" V 10100 1600 50  0000 C CNN
F 2 "Socket_Arduino_Uno:Socket_Strip_Arduino_1x10" V 10150 1600 20  0000 C CNN
F 3 "" H 10000 1600 50  0000 C CNN
	1    10000 1600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10200 2100 10550 2100
Wire Wire Line
	10200 2000 10550 2000
Wire Wire Line
	10200 1900 10550 1900
Wire Wire Line
	10200 1800 10550 1800
Wire Wire Line
	10200 1700 10550 1700
Wire Wire Line
	10200 1600 10550 1600
Wire Wire Line
	10200 1400 10550 1400
Wire Wire Line
	10200 1300 10550 1300
Wire Wire Line
	10200 1200 10550 1200
Wire Wire Line
	10200 3000 10550 3000
Wire Wire Line
	10200 2900 10550 2900
Wire Wire Line
	10200 2800 10550 2800
Wire Wire Line
	10200 2700 10550 2700
Wire Wire Line
	10200 2600 10550 2600
Wire Wire Line
	10200 2500 10550 2500
Wire Wire Line
	10200 2400 10550 2400
Wire Wire Line
	10200 2300 10550 2300
Wire Notes Line
	8500 500  8500 3450
Wire Notes Line
	8500 3450 11200 3450
Wire Wire Line
	9400 1800 8650 1800
Text Notes 9700 1600 0    60   ~ 0
1
Wire Notes Line
	11200 1000 10700 1000
Wire Notes Line
	10700 1000 10700 500 
$Comp
L Device:R R2
U 1 1 5D1AF8F1
P 2450 4900
F 0 "R2" V 2243 4900 50  0000 C CNN
F 1 "220" V 2334 4900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2380 4900 50  0001 C CNN
F 3 "~" H 2450 4900 50  0001 C CNN
	1    2450 4900
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5D1B0326
P 6350 4750
F 0 "R1" H 6420 4796 50  0000 L CNN
F 1 "220" H 6420 4705 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6280 4750 50  0001 C CNN
F 3 "~" H 6350 4750 50  0001 C CNN
	1    6350 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C3
U 1 1 5D1B2300
P 5350 3650
F 0 "C3" H 5468 3696 50  0000 L CNN
F 1 "470uF" H 5468 3605 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 5388 3500 50  0001 C CNN
F 3 "~" H 5350 3650 50  0001 C CNN
	1    5350 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5D1B2A85
P 4500 3650
F 0 "C1" H 4615 3696 50  0000 L CNN
F 1 "47nF" H 4615 3605 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D10.5mm_W5.0mm_P7.50mm" H 4538 3500 50  0001 C CNN
F 3 "~" H 4500 3650 50  0001 C CNN
	1    4500 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 5D1B4109
P 4900 3650
F 0 "C2" H 5015 3696 50  0000 L CNN
F 1 "470nF" H 5015 3605 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D10.5mm_W5.0mm_P7.50mm" H 4938 3500 50  0001 C CNN
F 3 "~" H 4900 3650 50  0001 C CNN
	1    4900 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C4
U 1 1 5D1B4574
P 6350 3650
F 0 "C4" H 6468 3696 50  0000 L CNN
F 1 "100uF" H 6468 3605 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 6388 3500 50  0001 C CNN
F 3 "~" H 6350 3650 50  0001 C CNN
	1    6350 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C5
U 1 1 5D1B499F
P 6800 3650
F 0 "C5" H 6915 3696 50  0000 L CNN
F 1 "100nF" H 6915 3605 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D10.5mm_W5.0mm_P7.50mm" H 6838 3500 50  0001 C CNN
F 3 "~" H 6800 3650 50  0001 C CNN
	1    6800 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5D1B4E22
P 7250 3650
F 0 "C6" H 7365 3696 50  0000 L CNN
F 1 "10nF" H 7365 3605 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D10.5mm_W5.0mm_P7.50mm" H 7288 3500 50  0001 C CNN
F 3 "~" H 7250 3650 50  0001 C CNN
	1    7250 3650
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U1
U 1 1 5D1B5482
P 5900 3400
F 0 "U1" H 5900 3642 50  0000 C CNN
F 1 "L7805" H 5900 3551 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 5925 3250 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 5900 3350 50  0001 C CNN
	1    5900 3400
	1    0    0    -1  
$EndComp
$Comp
L Driver_FET:MC33152 U3
U 1 1 5D1BF2B0
P 7150 5100
F 0 "U3" H 7150 5681 50  0000 C CNN
F 1 "MC33152" H 7150 5590 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 7150 4800 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/MC34152-D.PDF" H 7150 4800 50  0001 C CNN
	1    7150 5100
	1    0    0    -1  
$EndComp
$Comp
L Motor:Fan M1
U 1 1 5D1C0870
P 8700 4350
F 0 "M1" H 8858 4446 50  0000 L CNN
F 1 "Fan" H 8858 4355 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 8700 4360 50  0001 C CNN
F 3 "~" H 8700 4360 50  0001 C CNN
	1    8700 4350
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_NMOS_GDS Q2
U 1 1 5D1C3A93
P 8050 5000
F 0 "Q2" H 8256 5046 50  0000 L CNN
F 1 "IRF630" H 8256 4955 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 8250 5100 50  0001 C CNN
F 3 "~" H 8050 5000 50  0001 C CNN
	1    8050 5000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5D1C60EB
P 7800 2650
F 0 "J1" V 7764 2462 50  0000 R CNN
F 1 "Fuente" V 7673 2462 50  0000 R CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 7800 2650 50  0001 C CNN
F 3 "~" H 7800 2650 50  0001 C CNN
	1    7800 2650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6350 3500 6350 3400
Wire Wire Line
	6350 3400 6200 3400
Wire Wire Line
	6800 3500 6800 3400
Wire Wire Line
	6800 3400 6350 3400
Connection ~ 6350 3400
Wire Wire Line
	7250 3500 7250 3400
Wire Wire Line
	7250 3400 6800 3400
Connection ~ 6800 3400
Wire Wire Line
	5350 3500 5350 3400
Wire Wire Line
	5350 3400 5600 3400
Wire Wire Line
	4900 3500 4900 3400
Wire Wire Line
	4900 3400 5350 3400
Connection ~ 5350 3400
Wire Wire Line
	4500 3500 4500 3400
Wire Wire Line
	4500 3400 4900 3400
Connection ~ 4900 3400
Wire Wire Line
	4500 3800 4500 3950
Wire Wire Line
	4500 3950 4900 3950
Wire Wire Line
	4900 3950 4900 3800
Wire Wire Line
	4900 3950 5350 3950
Wire Wire Line
	5350 3950 5350 3800
Connection ~ 4900 3950
Wire Wire Line
	5350 3950 5900 3950
Wire Wire Line
	5900 3950 5900 3700
Connection ~ 5350 3950
Wire Wire Line
	6350 3800 6350 3950
Wire Wire Line
	6350 3950 5900 3950
Connection ~ 5900 3950
Wire Wire Line
	6800 3800 6800 3950
Wire Wire Line
	6800 3950 6350 3950
Connection ~ 6350 3950
Wire Wire Line
	7250 3800 7250 3950
Wire Wire Line
	7250 3950 6800 3950
Connection ~ 6800 3950
Wire Wire Line
	5900 4900 6000 4900
Wire Wire Line
	6000 4900 6000 4800
Wire Wire Line
	6000 4800 5900 4800
Wire Wire Line
	6000 4800 6000 4300
Wire Wire Line
	6000 4300 6350 4300
Wire Wire Line
	6350 4300 6350 4600
Connection ~ 6000 4800
Wire Wire Line
	7600 3400 7250 3400
Connection ~ 7250 3400
Wire Wire Line
	5900 5000 6350 5000
Wire Wire Line
	6350 5000 6350 4900
Wire Wire Line
	6750 5000 6350 5000
Connection ~ 6350 5000
Wire Wire Line
	6350 4300 6350 4100
Wire Wire Line
	6350 4100 7600 4100
Wire Wire Line
	7600 4100 7600 3400
Connection ~ 6350 4300
Wire Wire Line
	7550 5000 7850 5000
Wire Wire Line
	8150 4800 8150 4650
Wire Wire Line
	8700 4550 8700 4650
Wire Wire Line
	8700 4650 8150 4650
Connection ~ 8150 4650
Wire Wire Line
	8150 4650 8150 4500
Wire Wire Line
	8150 3800 8700 3800
Wire Wire Line
	8700 3800 8700 4050
Wire Wire Line
	7150 4700 7150 4400
Wire Wire Line
	5900 5100 6350 5100
Wire Wire Line
	6350 5100 6350 5650
Wire Wire Line
	6350 5650 7150 5650
Wire Wire Line
	7150 5650 7150 5500
Wire Wire Line
	6350 5650 6350 5800
Connection ~ 6350 5650
Wire Wire Line
	8150 3800 8150 3650
Connection ~ 8150 3800
Wire Wire Line
	8150 5200 8150 5800
Wire Wire Line
	4500 3400 4500 3200
Connection ~ 4500 3400
Wire Wire Line
	2900 4900 2600 4900
NoConn ~ 6750 5200
NoConn ~ 7550 5200
$Comp
L power:+12V #PWR0103
U 1 1 5D216D39
P 7150 4400
F 0 "#PWR0103" H 7150 4250 50  0001 C CNN
F 1 "+12V" H 7165 4573 50  0000 C CNN
F 2 "" H 7150 4400 50  0001 C CNN
F 3 "" H 7150 4400 50  0001 C CNN
	1    7150 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0104
U 1 1 5D217542
P 8150 3650
F 0 "#PWR0104" H 8150 3500 50  0001 C CNN
F 1 "+12V" H 8165 3823 50  0000 C CNN
F 2 "" H 8150 3650 50  0001 C CNN
F 3 "" H 8150 3650 50  0001 C CNN
	1    8150 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0105
U 1 1 5D217A2C
P 4500 3200
F 0 "#PWR0105" H 4500 3050 50  0001 C CNN
F 1 "+12V" H 4515 3373 50  0000 C CNN
F 2 "" H 4500 3200 50  0001 C CNN
F 3 "" H 4500 3200 50  0001 C CNN
	1    4500 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 4050 5900 3950
$Comp
L 6N137:6N137F U2
U 1 1 5D1AEFDB
P 2900 4800
F 0 "U2" H 4400 5187 60  0000 C CNN
F 1 "6N137F" H 4400 5081 60  0000 C CNN
F 2 "6N137:6N137F" H 4400 5040 60  0001 C CNN
F 3 "" H 2900 4800 60  0000 C CNN
	1    2900 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 5000 2900 5000
Wire Wire Line
	2300 4900 2100 4900
$Comp
L power:+12V #PWR0107
U 1 1 5D233DF0
P 7800 3000
F 0 "#PWR0107" H 7800 2850 50  0001 C CNN
F 1 "+12V" H 7815 3173 50  0000 C CNN
F 2 "" H 7800 3000 50  0001 C CNN
F 3 "" H 7800 3000 50  0001 C CNN
	1    7800 3000
	-1   0    0    1   
$EndComp
Wire Wire Line
	7800 2850 7800 3000
Text Label 2100 4900 2    60   ~ 0
10(**/SS)
Wire Wire Line
	2100 5000 2100 6200
Wire Wire Line
	2100 6200 11100 6200
Wire Wire Line
	11100 6200 11100 1500
Text Label 10550 1300 0    60   ~ 0
A4(SDA)
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 5D1CB5BF
P 8150 1850
F 0 "J2" V 8114 1662 50  0000 R CNN
F 1 "ASensor2" V 8023 1662 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 8150 1850 50  0001 C CNN
F 3 "~" H 8150 1850 50  0001 C CNN
	1    8150 1850
	-1   0    0    1   
$EndComp
Wire Wire Line
	8350 1750 8600 1750
Wire Wire Line
	8600 1750 8600 1550
Wire Wire Line
	8600 1550 9150 1550
Connection ~ 9150 1550
Wire Wire Line
	9150 1550 9150 1450
Wire Wire Line
	8350 1850 8750 1850
Wire Wire Line
	8750 1850 8750 2100
$Comp
L power:GNDPWR #PWR0101
U 1 1 5D1F0827
P 8050 2900
F 0 "#PWR0101" H 8050 2700 50  0001 C CNN
F 1 "GNDPWR" H 8054 2746 50  0000 C CNN
F 2 "" H 8050 2850 50  0001 C CNN
F 3 "" H 8050 2850 50  0001 C CNN
	1    8050 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 2900 8050 2850
Wire Wire Line
	7900 2850 8050 2850
$Comp
L power:GNDPWR #PWR0102
U 1 1 5D20111F
P 8150 5800
F 0 "#PWR0102" H 8150 5600 50  0001 C CNN
F 1 "GNDPWR" H 8154 5646 50  0000 C CNN
F 2 "" H 8150 5750 50  0001 C CNN
F 3 "" H 8150 5750 50  0001 C CNN
	1    8150 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GNDPWR #PWR0106
U 1 1 5D202205
P 6350 5800
F 0 "#PWR0106" H 6350 5600 50  0001 C CNN
F 1 "GNDPWR" H 6354 5646 50  0000 C CNN
F 2 "" H 6350 5750 50  0001 C CNN
F 3 "" H 6350 5750 50  0001 C CNN
	1    6350 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GNDPWR #PWR0108
U 1 1 5D202E25
P 5900 4050
F 0 "#PWR0108" H 5900 3850 50  0001 C CNN
F 1 "GNDPWR" H 5904 3896 50  0000 C CNN
F 2 "" H 5900 4000 50  0001 C CNN
F 3 "" H 5900 4000 50  0001 C CNN
	1    5900 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 1500 11100 1500
Wire Wire Line
	8750 2100 9400 2100
$Comp
L Device:D D1
U 1 1 5D20204E
P 8150 4350
F 0 "D1" V 8104 4429 50  0000 L CNN
F 1 "D" V 8195 4429 50  0000 L CNN
F 2 "Diode_THT:D_5W_P12.70mm_Horizontal" H 8150 4350 50  0001 C CNN
F 3 "~" H 8150 4350 50  0001 C CNN
	1    8150 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	8150 3800 8150 4200
$EndSCHEMATC
