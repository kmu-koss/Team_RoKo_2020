DIM I       AS BYTE
DIM J       AS BYTE
DIM MODE    AS BYTE
DIM A          AS BYTE
DIM A_old    AS BYTE
DIM B       AS BYTE
DIM C       AS BYTE
DIM ����ӵ�    AS BYTE
DIM �¿�ӵ�    AS BYTE
DIM �¿�ӵ�2    AS BYTE
DIM �������    AS BYTE
DIM ��������    AS BYTE
DIM ����üũ    AS BYTE
DIM ����ONOFF    AS BYTE
DIM ���̷�ONOFF AS BYTE
DIM ����յ�    AS INTEGER
DIM �����¿�    AS INTEGER
DIM ����� AS INTEGER
DIM ����� AS BYTE

DIM �Ѿ���Ȯ�� AS BYTE
DIM ����Ȯ��Ƚ�� AS BYTE
DIM ����Ƚ�� AS BYTE
DIM ����COUNT AS BYTE

DIM ���ܼ��Ÿ���  AS BYTE

DIM S11  AS BYTE
DIM S16  AS BYTE
'************************************************
DIM NO_0 AS BYTE
DIM NO_1 AS BYTE
DIM NO_2 AS BYTE
DIM NO_3 AS BYTE
DIM NO_4 AS BYTE

DIM NUM AS BYTE

DIM BUTTON_NO AS INTEGER
DIM SOUND_BUSY AS BYTE
DIM TEMP_INTEGER AS INTEGER

'**** ���⼾����Ʈ ���� ****
CONST �յڱ���AD��Ʈ = 0
CONST �¿����AD��Ʈ = 1
CONST ����Ȯ�νð� = 20  'ms

CONST ���ܼ�AD��Ʈ  = 4

CONST min = 61   '�ڷγѾ�������
CONST max = 107   '�����γѾ�������
CONST COUNT_MAX = 3

CONST �Ӹ��̵��ӵ� = 10
'************************************************
PTP SETON             '�����׷캰 ���������� ����
PTP ALLON            '��ü���� ������ ���� ����

DIR G6A,1,0,0,1,0,0      '����0~5��
DIR G6D,0,1,1,0,1,1      '����18~23��
DIR G6B,1,1,1,1,1,1      '����6~11��
DIR G6C,0,0,0,1,1,0      '����12~17��
'************************************************
OUT 52,0   '�Ӹ� LED �ѱ�

'***** �ʱ⼱�� '************************************************
������� = 0
����üũ = 0
����Ȯ��Ƚ�� = 0
����Ƚ�� = 1
����ONOFF = 0

DIM �Ӹ��¿�    AS INTEGER
DIM �Ӹ�����    AS INTEGER
CONST �¿쿵�� = 100
CONST ���Ͽ��� = 95
�Ӹ��¿� = �¿쿵��
�Ӹ����� = ���Ͽ���

'****�ʱ���ġ �ǵ��*****************************
TEMPO 230
'MUSIC "cdefgh"

SPEED 5
GOSUB MOTOR_ON

S11 = MOTORIN(11)
S16 = MOTORIN(16)

SERVO 11, 100
SERVO 16, S16

SERVO 16, 100

GOSUB �����ʱ��ڼ�
GOSUB �⺻�ڼ�

GOSUB ���̷�INIT
GOSUB ���̷�MID
GOSUB ���̷�ON

PRINT "VOLUME 200 !"
'PRINT "SOUND 12 !" '�ȳ��ϼ���

GOSUB All_motor_mode3

GOTO MAIN   '�ø��� ���� ��ƾ���� ����
'************************************************
������:
    TEMPO 220
    'MUSIC "O23EAB7EA>3#C"
    RETURN
������:
    TEMPO 220
    MUSIC "O38GD<BGD<BG"
    RETURN
������:
    TEMPO 250
    MUSIC "GFFF"
    RETURN
    '************************************************
MOTOR_ON: '����Ʈ�������ͻ�뼳��
    GOSUB MOTOR_GET
    MOTOR G6B
    DELAY 50
    MOTOR G6C
    DELAY 50
    MOTOR G6A
    DELAY 50
    MOTOR G6D
    ����ONOFF = 0
    GOSUB ������
    RETURN
    '************************************************
MOTOR_OFF:
    MOTOROFF G6B
    MOTOROFF G6C
    MOTOROFF G6A
    MOTOROFF G6D
    ����ONOFF = 1
    GOSUB MOTOR_GET
    GOSUB ������
    RETURN
    '************************************************
MOTOR_GET: '��ġ���ǵ��
    GETMOTORSET G6A,1,1,1,1,1,0
    GETMOTORSET G6B,1,1,1,0,0,1
    GETMOTORSET G6C,1,1,1,1,1,0
    GETMOTORSET G6D,1,1,1,1,1,0
    RETURN
    '************************************************
MOTOR_SET: '��ġ���ǵ��
    GETMOTORSET G6A,1,1,1,1,1,0
    GETMOTORSET G6B,1,1,1,0,0,1
    GETMOTORSET G6C,1,1,1,1,1,0
    GETMOTORSET G6D,1,1,1,1,1,0
    RETURN
    '************************************************
All_motor_Reset:
    MOTORMODE G6A,1,1,1,1,1,1
    MOTORMODE G6D,1,1,1,1,1,1
    MOTORMODE G6B,1,1,1,,,1
    MOTORMODE G6C,1,1,1,1,1
    RETURN
    '************************************************
All_motor_mode2:
    MOTORMODE G6A,2,2,2,2,2
    MOTORMODE G6D,2,2,2,2,2
    MOTORMODE G6B,2,2,2,,,2
    MOTORMODE G6C,2,2,2,2,2
    RETURN
    '************************************************
All_motor_mode3:
    MOTORMODE G6A,3,3,3,3,3
    MOTORMODE G6D,3,3,3,3,3
    MOTORMODE G6B,3,3,3,,,3
    MOTORMODE G6C,3,3,3,3,3
    RETURN
    '************************************************
Leg_motor_mode1:
    MOTORMODE G6A,1,1,1,1,1
    MOTORMODE G6D,1,1,1,1,1
    RETURN
    '************************************************
Leg_motor_mode2:
    MOTORMODE G6A,2,2,2,2,2
    MOTORMODE G6D,2,2,2,2,2
    RETURN
    '************************************************
Leg_motor_mode3:
    MOTORMODE G6A,3,3,3,3,3
    MOTORMODE G6D,3,3,3,3,3
    RETURN
    '************************************************
Leg_motor_mode4:
    MOTORMODE G6A,3,2,2,1,3
    MOTORMODE G6D,3,2,2,1,3
    RETURN
    '************************************************
Leg_motor_mode5:
    MOTORMODE G6A,3,2,2,1,2
    MOTORMODE G6D,3,2,2,1,2
    RETURN
    '************************************************
Arm_motor_mode1:
    MOTORMODE G6B,1,1,1,,,1
    MOTORMODE G6C,1,1,1,1,1
    RETURN
    '************************************************
Arm_motor_mode2:
    MOTORMODE G6B,2,2,2,,,2
    MOTORMODE G6C,2,2,2,2,2
    RETURN
    '************************************************
Arm_motor_mode3:
    MOTORMODE G6B,3,3,3,,,3
    MOTORMODE G6C,3,3,3,3,3
    RETURN
    '************************************************
�����ʱ��ڼ�:
    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6D,100,  76, 145,  93, 100, 100
    MOVE G6B,100,  35,  90,
    MOVE G6C,100,  35,  90, 190
    WAIT
    mode = 0
    RETURN
    '************************************************
����ȭ�ڼ�:
    MOVE G6A,98,  76, 145,  93, 101, 100
    MOVE G6D,98,  76, 145,  93, 101, 100
    MOVE G6B,100,  35,  90,
    MOVE G6C,100,  35,  90, 190
    WAIT
    mode = 0
    RETURN
    '******************************************
�⺻�ڼ�:
    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6D,100,  76, 145,  93, 100, 100
    MOVE G6B,100,  30,  80,
    MOVE G6C,100,  30,  80, 190
    WAIT
    mode = 0
    RETURN
    '******************************************
�⺻�ڼ�2:
    MOVE G6A,100,  76, 145,  93, 100, 100
    MOVE G6D,100,  76, 145,  93, 100, 100
    MOVE G6B,100,  30,  80,
    MOVE G6C,100,  30,  80, 190
    WAIT
    mode = 0
    RETURN
    '******************************************
�����ڼ�:
    MOVE G6A,100, 56, 182, 76, 100, 100
    MOVE G6D,100, 56, 182, 76, 100, 100
    MOVE G6B,100,  30,  80,
    MOVE G6C,100,  30,  80, 190
    WAIT
    mode = 2
    RETURN
    '******************************************
�����ڼ�:
    GOSUB ���̷�OFF
    MOVE G6A,100, 145,  28, 145, 100, 100
    MOVE G6D,100, 145,  28, 145, 100, 100
    MOVE G6B,100,  30,  80,
    MOVE G6C,100,  30,  80, 190
    WAIT
    mode = 1
    RETURN
    '******************************************
    '**** ���̷ΰ��� ���� ****
���̷�INIT:
    GYRODIR G6A, 0, 0, 1, 0,0
    GYRODIR G6D, 1, 0, 1, 0,0
    GYROSENSE G6A,200,150,30,150,0
    GYROSENSE G6D,200,150,30,150,0
    RETURN
    '***********************************************
    '**** ���̷ΰ��� ���� ****
���̷�MAX:
    GYROSENSE G6A,250,180,30,180,0
    GYROSENSE G6D,250,180,30,180,0

    RETURN
    '***********************************************
���̷�MID:
    GYROSENSE G6A,200,150,30,150,0
    GYROSENSE G6D,200,150,30,150,0

    RETURN
    '***********************************************
���̷�MIN:
    GYROSENSE G6A,200,100,30,100,0
    GYROSENSE G6D,200,100,30,100,0
    RETURN
    '***********************************************
���̷�ON:
    GYROSET G6A, 4, 3, 3, 3, 0
    GYROSET G6D, 4, 3, 3, 3, 0
    ���̷�ONOFF = 1
    RETURN
    '***********************************************
���̷�OFF:
    GYROSET G6A, 0, 0, 0, 0, 0
    GYROSET G6D, 0, 0, 0, 0, 0
    ���̷�ONOFF = 0
    RETURN
    '**********************************************
RX_EXIT:

    ERX 4800, A, MAIN
    GOTO RX_EXIT
    '**********************************************
GOSUB_RX_EXIT:

    ERX 4800, A, GOSUB_RX_EXIT2
    GOTO GOSUB_RX_EXIT

GOSUB_RX_EXIT2:
    RETURN
    '****************************************
�ڷ��Ͼ��:
    HIGHSPEED SETOFF
    PTP SETON
    PTP ALLON

    GOSUB ���̷�OFF
    GOSUB All_motor_Reset

    SPEED 15
    GOSUB �⺻�ڼ�

    MOVE G6A,90, 130, 120,  80, 110, 100
    MOVE G6D,90, 130, 120,  80, 110, 100
    MOVE G6B,150, 160,  10, 100, 100, 100
    MOVE G6C,150, 160,  10, 190, 100, 100
    WAIT

    MOVE G6B,185, 160,  10, 100, 100, 100
    MOVE G6C,185, 160,  10, 190, 100, 100
    WAIT

    SPEED 12
    MOVE G6B,185,  50, 10,  100, 100, 100
    MOVE G6C,185,  50, 10,  190, 100, 100
    WAIT

    SPEED 10
    MOVE G6A, 80, 155,  80, 150, 150, 100
    MOVE G6D, 80, 155,  80, 150, 150, 100
    MOVE G6B,185,  20, 50,  100, 100, 100
    MOVE G6C,185,  20, 50,  190, 100, 100
    WAIT

    MOVE G6A, 75, 162,  55, 162, 155, 100
    MOVE G6D, 75, 162,  55, 162, 155, 100
    MOVE G6B,188,  10, 100, 100, 100, 100
    MOVE G6C,188,  10, 100, 190, 100, 100
    WAIT

    SPEED 10
    MOVE G6A, 60, 162,  30, 162, 145, 100
    MOVE G6D, 60, 162,  30, 162, 145, 100
    MOVE G6B,170,  10, 100, 100, 100, 100
    MOVE G6C,170,  10, 100, 190, 100, 100
    WAIT

    DELAY 200

    GOSUB Leg_motor_mode3
    MOVE G6A, 60, 150,  28, 155, 140, 100
    MOVE G6D, 60, 150,  28, 155, 140, 100
    MOVE G6B,150,  60,  90, 100, 100, 100
    MOVE G6C,150,  60,  90, 190, 100, 100
    WAIT

    MOVE G6A,100, 150,  28, 140, 100, 100
    MOVE G6D,100, 150,  28, 140, 100, 100
    MOVE G6B,130,  50,  85, 100, 100, 100
    MOVE G6C,130,  50,  85, 190, 100, 100
    WAIT
    DELAY 100

    MOVE G6A,100, 150,  33, 140, 100, 100
    MOVE G6D,100, 150,  33, 140, 100, 100
    WAIT
    SPEED 10
    GOSUB �⺻�ڼ�

    �Ѿ���Ȯ�� = 1

    DELAY 200
    GOSUB ���̷�ON

    RETURN
    '**********************************************
�������Ͼ��:
    HIGHSPEED SETOFF
    PTP SETON
    PTP ALLON

    GOSUB ���̷�OFF

    HIGHSPEED SETOFF

    GOSUB All_motor_Reset

    SPEED 15
    MOVE G6A,100, 35,  70, 130, 100,
    MOVE G6D,100, 35,  70, 130, 100,
    MOVE G6B,15,  140,  15
    MOVE G6C,15,  140,  15
    WAIT

    SPEED 12
    MOVE G6B,15,  100,  10
    MOVE G6C,15,  100,  10
    WAIT

    SPEED 12
    MOVE G6A,100, 136,  35, 80, 100,
    MOVE G6D,100, 136,  35, 80, 100,
    MOVE G6B,15,  15,  75
    MOVE G6C,15,  15,  75
    WAIT

    SPEED 10
    MOVE G6A,100, 165,  75, 20, 100,
    MOVE G6D,100, 165,  75, 20, 100,
    MOVE G6B,15,  20,  95
    MOVE G6C,15,  20,  95
    WAIT

    DELAY 200

    GOSUB Leg_motor_mode3

    SPEED 8
    MOVE G6A,100, 165,  85, 20, 100,
    MOVE G6D,100, 165,  85, 20, 100,
    MOVE G6B,130,  50,  60
    MOVE G6C,130,  50,  60
    WAIT

    SPEED 8
    MOVE G6A,100, 165,  85, 30, 100,
    MOVE G6D,100, 165,  85, 30, 100,
    WAIT

    SPEED 8
    MOVE G6A,100, 155,  45, 110, 100,
    MOVE G6D,100, 155,  45, 110, 100,
    MOVE G6B,130,  50,  60
    MOVE G6C,130,  50,  60
    WAIT

    SPEED 6
    MOVE G6A,100, 145,  45, 130, 100,
    MOVE G6D,100, 145,  45, 130, 100,
    WAIT

    SPEED 8
    GOSUB All_motor_mode2
    GOSUB �⺻�ڼ�
    �Ѿ���Ȯ�� = 1

    DELAY 200
    GOSUB ���̷�ON
    RETURN
    '**********************************************
�յڱ�������:
    FOR i = 0 TO COUNT_MAX
        A = AD(�յڱ���AD��Ʈ)   '���� �յ�
        IF A > 250 OR A < 5 THEN RETURN
        IF A > MIN AND A < MAX THEN RETURN
        DELAY ����Ȯ�νð�
    NEXT i

    IF A < MIN THEN
        GOSUB �����
    ELSEIF A > MAX THEN
        GOSUB �����
    ENDIF

    RETURN
    '**************************************************
�����:
    A = AD(�յڱ���AD��Ʈ)
    'IF A < MIN THEN GOSUB �������Ͼ��
    IF A < MIN THEN
        ETX  4800,16
        GOSUB �ڷ��Ͼ��

    ENDIF
    RETURN

�����:
    A = AD(�յڱ���AD��Ʈ)
    'IF A > MAX THEN GOSUB �ڷ��Ͼ��
    IF A > MAX THEN
        ETX  4800,15
        GOSUB �������Ͼ��
    ENDIF
    RETURN
    '**************************************************
�¿��������:
    FOR i = 0 TO COUNT_MAX
        B = AD(�¿����AD��Ʈ)   '���� �¿�
        IF B > 250 OR B < 5 THEN RETURN
        IF B > MIN AND B < MAX THEN RETURN
        DELAY ����Ȯ�νð�
    NEXT i

    IF B < MIN OR B > MAX THEN
        SPEED 8
        MOVE G6B,140,  40,  80
        MOVE G6C,140,  40,  80
        WAIT
        GOSUB �⺻�ڼ�
    ENDIF
    RETURN
    '************************************************
SOUND_PLAY_CHK:
    DELAY 60
    SOUND_BUSY = IN(46)
    IF SOUND_BUSY = 1 THEN GOTO SOUND_PLAY_CHK
    DELAY 50

    RETURN
    '************************************************
NUM_1_9:
    IF NUM = 1 THEN
        PRINT "1"
    ELSEIF NUM = 2 THEN
        PRINT "2"
    ELSEIF NUM = 3 THEN
        PRINT "3"
    ELSEIF NUM = 4 THEN
        PRINT "4"
    ELSEIF NUM = 5 THEN
        PRINT "5"
    ELSEIF NUM = 6 THEN
        PRINT "6"
    ELSEIF NUM = 7 THEN
        PRINT "7"
    ELSEIF NUM = 8 THEN
        PRINT "8"
    ELSEIF NUM = 9 THEN
        PRINT "9"
    ELSEIF NUM = 0 THEN
        PRINT "0"
    ENDIF

    RETURN
    '************************************************
NUM_TO_ARR:
    NO_4 =  BUTTON_NO / 10000
    TEMP_INTEGER = BUTTON_NO MOD 10000

    NO_3 =  TEMP_INTEGER / 1000
    TEMP_INTEGER = BUTTON_NO MOD 1000

    NO_2 =  TEMP_INTEGER / 100
    TEMP_INTEGER = BUTTON_NO MOD 100

    NO_1 =  TEMP_INTEGER / 10
    TEMP_INTEGER = BUTTON_NO MOD 10

    NO_0 =  TEMP_INTEGER

    RETURN
    '************************************************
Number_Play: '  BUTTON_NO = ���ڴ���

    GOSUB NUM_TO_ARR

    PRINT "NPL "
    '*************

    NUM = NO_4
    GOSUB NUM_1_9

    '*************
    NUM = NO_3
    GOSUB NUM_1_9

    '*************
    NUM = NO_2
    GOSUB NUM_1_9
    '*************
    NUM = NO_1
    GOSUB NUM_1_9
    '*************
    NUM = NO_0
    GOSUB NUM_1_9
    PRINT " !"

    ' GOSUB SOUND_PLAY_CHK
    '    PRINT "SND 16 !"
    '    GOSUB SOUND_PLAY_CHK
    RETURN
    '************************************************
    RETURN
    '************************************************
���ܼ��Ÿ�����Ȯ��:

    ���ܼ��Ÿ��� = AD(���ܼ�AD��Ʈ)

    IF ���ܼ��Ÿ��� > 50 THEN '50 = ���ܼ��Ÿ��� = 25cm
        'MUSIC "C"
        DELAY 200
    ENDIF

    RETURN
    '******************************************
������_���������:

    J = AD(���ܼ�AD��Ʈ)   '���ܼ��Ÿ��� �б�
    BUTTON_NO = J
    GOSUB Number_Play
    GOSUB SOUND_PLAY_CHK
    GOSUB GOSUB_RX_EXIT

    RETURN
    '************************************************
MAIN: '�󺧼���

    ETX 4800, 38 ' ���� ���� Ȯ�� �۽� ��

MAIN_2:
    GOSUB �յڱ�������
    GOSUB �¿��������
    GOSUB ���ܼ��Ÿ�����Ȯ��

    ERX 4800,A,MAIN_2

    A_old = A

    '**** �Էµ� A���� 0 �̸� MAIN �󺧷� ����
    '**** 1�̸� KEY1 ��, 2�̸� key2��... ���¹�
    ON A GOTO MAIN,KEY1,KEY2,KEY3,KEY4,KEY5,KEY6,KEY7,KEY8,KEY9,KEY10,KEY11,KEY12,KEY13,KEY14,KEY15,KEY16,KEY17,KEY18,KEY19,KEY20,KEY21,KEY22,KEY23,KEY24,KEY25,KEY26,KEY27,KEY28,KEY29,KEY30,KEY31,KEY32,KEY33,KEY34,KEY35,KEY36,KEY37,KEY38,KEY39,KEY40,KEY41,KEY42,KEY43,KEY44,KEY45,KEY46,KEY47,KEY48,KEY49,KEY50,KEY51,KEY52,KEY53,KEY54,KEY55,KEY56,KEY57,KEY58,KEY59,KEY60,KEY61,KEY62,KEY63,KEY64,KEY65,KEY66,KEY67,KEY68,KEY69,KEY70,KEY71,KEY72,KEY73,KEY74,KEY75,KEY76,KEY77,KEY78,KEY79,KEY80,KEY81,KEY82,KEY83,KEY84,KEY85,KEY86,KEY87,KEY88,KEY89,KEY90,KEY91,KEY92,KEY93,KEY94,KEY95,KEY96,KEY97,KEY98,KEY99,KEY100,KEY101,KEY102,KEY103,KEY104,KEY105,KEY106,KEY107,KEY108,KEY109,KEY110,KEY111,KEY112,KEY113,KEY114,KEY115,KEY116,KEY117,KEY118,KEY119,KEY120,KEY121,KEY122,KEY123,KEY124,KEY125,KEY126,KEY127,KEY128,KEY129,KEY130,KEY131,KEY132,KEY133,KEY134,KEY135,KEY136,KEY137,KEY138,KEY139,KEY140,KEY141,KEY142,KEY143,KEY144,KEY145,KEY146,KEY147,KEY148,KEY149,KEY150,KEY151,KEY152,KEY153,KEY154,KEY155,KEY156,KEY157,KEY158,KEY159,KEY160,KEY161,KEY162,KEY163,KEY164,KEY165,KEY166,KEY167,KEY168,KEY169,KEY170,KEY171,KEY172,KEY173,KEY174,KEY175,KEY176,KEY177,KEY178,KEY179,KEY180

    IF A > 100 AND A < 110 THEN
        BUTTON_NO = A - 100
        GOSUB Number_Play
        GOSUB SOUND_PLAY_CHK
        GOSUB GOSUB_RX_EXIT


    ELSEIF A = 250 THEN
        GOSUB All_motor_mode3
        SPEED 4
        MOVE G6A,100,  76, 145,  93, 100, 100
        MOVE G6D,100,  76, 145,  93, 100, 100
        MOVE G6B,100,  40,  90,
        MOVE G6C,100,  40,  90,
        WAIT
        DELAY 500
        SPEED 6
        GOSUB �⺻�ڼ�

    ENDIF

    GOTO MAIN
    '*******************************************
    '      MAIN �󺧷� ����
    '*******************************************
    '����
KEY1:
    ETX  4800,1
    GOTO ������1
    GOTO RX_EXIT
KEY2:
    ETX  4800,2
    GOTO ������5
    GOTO RX_EXIT
KEY3:
    ETX  4800,3
    GOTO RX_EXIT
KEY4:
    ETX  4800,4
    GOSUB ������10
    GOTO RX_EXIT
KEY5:
    ETX  4800,5
    GOTO ������20
    GOTO RX_EXIT
KEY6:
    ETX  4800,6
    GOTO ������45
    GOTO RX_EXIT
KEY7:
    ETX  4800,7
    GOTO ������60
    GOTO RX_EXIT
KEY8:
    ETX  4800,8
    GOTO ��������5
    GOTO RX_EXIT
KEY9:
    ETX  4800,9
    GOTO ��������10
    GOTO RX_EXIT
KEY10: '0
    ETX  4800,10
    GOTO ��������45
    GOTO RX_EXIT
KEY11: ' ��
    ETX  4800,11
    GOTO ������������
    GOTO RX_EXIT
KEY12: ' ��
    ETX  4800,12
    GOTO ������������
    GOTO RX_EXIT
KEY13: '��
    ETX  4800,13
    GOTO RX_EXIT
KEY14: ' ��
    ETX  4800,14
    GOTO RX_EXIT
KEY15: ' A
    ETX  4800,15
    GOTO RX_EXIT
KEY16: ' POWER
    ETX  4800,16
    GOSUB Leg_motor_mode3
    IF MODE = 0 THEN
        SPEED 10
        MOVE G6A,100, 140,  37, 145, 100, 100
        MOVE G6D,100, 140,  37, 145, 100, 100
        WAIT
    ENDIF
    SPEED 4
    GOSUB �����ڼ�
    GOSUB ������

    GOSUB MOTOR_GET
    GOSUB MOTOR_OFF

    GOSUB GOSUB_RX_EXIT
KEY16_1:
    IF ����ONOFF = 1  THEN
        OUT 52,1
        DELAY 200
        OUT 52,0
        DELAY 200
    ENDIF
    ERX 4800,A,KEY16_1
    ETX  4800,A

    '**** RX DATA Number Sound ********
    BUTTON_NO = A
    GOSUB Number_Play
    GOSUB SOUND_PLAY_CHK

    IF  A = 16 THEN    '�ٽ� �Ŀ���ư�� �����߸� ����
        GOSUB MOTOR_ON
        SPEED 10
        MOVE G6A,100, 140,  37, 145, 100, 100
        MOVE G6D,100, 140,  37, 145, 100, 100
        WAIT

        GOSUB �⺻�ڼ�2
        GOSUB ���̷�ON
        GOSUB All_motor_mode3
        GOTO RX_EXIT
    ENDIF

    GOSUB GOSUB_RX_EXIT
    GOTO KEY16_1

    GOTO RX_EXIT
KEY17: ' C
    ETX  4800,17
    GOTO RX_EXIT
KEY18: ' E
    ETX  4800,18
    'GOSUB ���̷�OFF
    GOSUB ������
KEY18_wait:
    ERX 4800,A,KEY18_wait

    IF  A = 26 THEN
        GOSUB ������
        GOSUB ���̷�ON
        GOTO RX_EXIT
    ENDIF

    GOTO KEY18_wait
    GOTO RX_EXIT
KEY19: ' P2
    ETX  4800,19
    GOTO RX_EXIT
KEY20: ' B
    ETX  4800,20
    GOTO RX_EXIT
KEY21: ' ��
    ETX  4800,21
    GOTO ��������3
    GOTO RX_EXIT
KEY22: ' *
    ETX  4800,22
    GOTO RX_EXIT
'��ġ���ڼ� �׽�Ʈ
KEY23: ' G
    ETX  4800,23
	GOTO ��ġ���ڼ���
    GOTO RX_EXIT
KEY24: ' #
    ETX  4800,24
    GOTO RX_EXIT
KEY25: ' P1
    ETX  4800,25
    GOTO RX_EXIT
KEY26: ' ��
    ETX  4800,26

    SPEED 5
    GOSUB �⺻�ڼ�2
    TEMPO 220
    MUSIC "cdfg"
    GOSUB �⺻�ڼ�
    GOTO RX_EXIT
KEY27: ' D
    ETX  4800,27
    GOTO RX_EXIT
KEY28: ' ��
    ETX 4800,28
    GOTO ��������3
    GOTO RX_EXIT
KEY29: ' ��
    ETX  4800,29
    GOTO �����߾�
    GOTO RX_EXIT
KEY30: ' ��
    ETX  4800,30
    GOTO ��������3
    GOTO RX_EXIT
KEY31: ' ��
    ETX  4800,31
    GOTO ��������3
    GOTO RX_EXIT
KEY32: ' F
    ETX  4800,32
    GOTO ��ġ���ڼ���
    GOTO RX_EXIT
    '***********************************
KEY33:
    ETX 4800,33
    GOTO RX_EXIT
KEY34:
    ETX 4800,34
    GOTO RX_EXIT
KEY35:
    ETX 4800,35
    GOTO RX_EXIT
KEY36:
    ETX 4800,36
    GOTO RX_EXIT
KEY37:
    ETX 4800,37
    GOTO RX_EXIT
KEY38:
    ETX 4800,38
    GOTO RX_EXIT
KEY39:
    ETX 4800,39
    GOTO RX_EXIT
KEY40:
    ETX 4800,40
    GOTO RX_EXIT
KEY41:
    ETX 4800,41
    GOTO RX_EXIT
KEY42:
    ETX 4800,42
    GOTO RX_EXIT
KEY43:
    ETX 4800,43
    GOTO RX_EXIT
KEY44:
    ETX 4800,44
    GOTO RX_EXIT
KEY45:
    ETX 4800,45
    GOTO RX_EXIT
KEY46:
    ETX 4800,46
    GOTO RX_EXIT
KEY47:
    ETX 4800,47
    GOTO RX_EXIT
KEY48:
    ETX 4800,48
    GOTO RX_EXIT
KEY49:
    ETX 4800,49
    GOTO RX_EXIT
KEY50:
    ETX 4800,50
    GOTO RX_EXIT
KEY51:
    ETX 4800,51
    GOTO RX_EXIT
KEY52:
    ETX 4800,52
    GOTO RX_EXIT
KEY53:
    ETX 4800,53
    GOTO RX_EXIT
KEY54:
    ETX 4800,54
    GOTO RX_EXIT
KEY55:
    ETX 4800,55
    GOTO RX_EXIT
KEY56:
    ETX 4800,56
    GOTO RX_EXIT
KEY57:
    ETX 4800,57
    GOTO RX_EXIT
KEY58:
    ETX 4800,58
    GOTO RX_EXIT
KEY59:
    ETX 4800,59
    GOTO RX_EXIT
KEY60:
    ETX 4800,60
    GOTO RX_EXIT
KEY61:
    ETX 4800,61
    GOTO RX_EXIT
KEY62:
    ETX 4800,62
    GOTO RX_EXIT
KEY63:
    ETX 4800,63
    GOTO RX_EXIT
KEY64:
    ETX 4800,64
    GOTO RX_EXIT
KEY65:
    ETX 4800,65
    GOTO RX_EXIT
KEY66:
    ETX 4800,66
    GOTO RX_EXIT
KEY67:
    ETX 4800,67
    GOTO RX_EXIT
KEY68:
    ETX 4800,68
    GOTO RX_EXIT
KEY69:
    ETX 4800,69
    GOTO RX_EXIT
KEY70:
    ETX 4800,70
    GOTO RX_EXIT
KEY71:
    ETX 4800,71
    GOTO RX_EXIT
KEY72:
    ETX 4800,72
    GOTO RX_EXIT
KEY73:
    ETX 4800,73
    GOTO RX_EXIT
KEY74:
    ETX 4800,74
    GOTO RX_EXIT
KEY75:
    ETX 4800,75
    GOTO RX_EXIT
KEY76:
    ETX 4800,76
    GOTO RX_EXIT
KEY77:
    ETX 4800,77
    GOTO RX_EXIT
KEY78:
    ETX 4800,78
    GOTO RX_EXIT
KEY79:
    ETX 4800,79
    GOTO RX_EXIT
KEY80:
    ETX 4800,80
    GOTO RX_EXIT
KEY81:
    ETX 4800,81
    GOTO RX_EXIT
KEY82:
    ETX 4800,82
    GOTO RX_EXIT
KEY83:
    ETX 4800,83
    GOTO RX_EXIT
KEY84:
    ETX 4800,84
    GOTO RX_EXIT
KEY85:
    ETX 4800,85
    GOTO RX_EXIT
KEY86:
    ETX 4800,86
    GOTO RX_EXIT
KEY87:
    ETX 4800,87
    GOTO RX_EXIT
KEY88:
    ETX 4800,88
    GOTO RX_EXIT
KEY89:
    ETX 4800,89
    GOTO RX_EXIT
KEY90:
    ETX 4800,90
    GOTO RX_EXIT
KEY91:
    ETX 4800,91
    GOTO RX_EXIT
KEY92:
    ETX 4800,92
    GOTO RX_EXIT
KEY93:
    ETX 4800,93
    GOTO RX_EXIT
KEY94:
    ETX 4800,94
    GOTO RX_EXIT
KEY95:
    ETX 4800,95
    GOTO RX_EXIT
KEY96:
    ETX 4800,96
    GOTO RX_EXIT
KEY97:
    ETX 4800,97
    GOTO RX_EXIT
KEY98:
    ETX 4800,98
    GOTO RX_EXIT
KEY99:
    ETX 4800,99
    GOSUB �⺻�ڼ�
    GOTO RX_EXIT
    '*************�ϸ�ũ
    '######### ------------------- KEY100-110 ��������
KEY100:
    ETX 4800,100
    ERX 4800,A,������������
    ����Ƚ��= A
    GOTO ������������
    GOTO RX_EXIT
KEY101:
    ETX 4800,101
	ERX 4800,A,������������
    ����Ƚ��= A
    GOTO ������������
    GOTO RX_EXIT
KEY102:
    ETX 4800,102
    ERX 4800,A,�����⺻����
    ����Ƚ��= A
    GOTO �����⺻����
    GOTO RX_EXIT
KEY103:
    ETX 4800,103
    ERX 4800,A,�����⺻����
    ����Ƚ��= A
    GOTO �����⺻����
    GOTO RX_EXIT
'---------------------------------
KEY104:
    ETX 4800,104
    GOTO RX_EXIT
KEY105:
    ETX 4800,105
    GOTO RX_EXIT
KEY106:
    ETX 4800,106
    GOTO RX_EXIT
KEY107:
    ETX 4800,107
    GOTO RX_EXIT
KEY108:
    ETX 4800,108
    GOTO RX_EXIT
KEY109:
    ETX 4800,109
    GOTO RX_EXIT
'##############--------------��ġ���ڼ�
KEY110:
    ETX 4800,110
    GOTO ��ġ���ڼ��� 
    GOTO RX_EXIT
KEY111:
    ETX 4800,111
    GOTO ��ġ���ڼ��� 
    GOTO RX_EXIT
'-------------------------------
KEY112:
    ETX 4800,112
    GOTO RX_EXIT
KEY113:
    ETX 4800,113
    GOTO RX_EXIT
KEY114:
    ETX 4800,114
    GOTO RX_EXIT
KEY115:
    ETX 4800,115
    GOTO RX_EXIT
KEY116:
    ETX 4800,116
    GOTO RX_EXIT
KEY117:
    ETX 4800,117
    GOTO RX_EXIT
    '######### ------------------- KEY118-119 ������
KEY118:
    ETX 4800,118
    GOTO �����ʿ�����
    GOTO RX_EXIT
KEY119:
    ETX 4800,119
    GOTO ���ʿ�����
    GOTO RX_EXIT
    '######### ------------------- KEY121-150 ��������
KEY120:
    ETX 4800,120
    GOTO �����߾�
    GOTO RX_EXIT
KEY121:
    ETX 4800,121
    GOTO ���������߾�
    GOTO RX_EXIT
KEY122:
    ETX 4800,122
    GOTO �����¿��߾�
    GOTO RX_EXIT
KEY123:
    ETX 4800,123
    GOTO RX_EXIT
KEY124:
    ETX 4800,124
    GOTO ��������3
    GOTO RX_EXIT
KEY125:
    ETX 4800,125
    GOTO ��������6
    GOTO RX_EXIT
KEY126:
    ETX 4800,126
    GOTO ��������9
    GOTO RX_EXIT
KEY127:
    ETX 4800,127
    GOTO ��ȭ���̵�
    GOTO RX_EXIT
KEY128:
    ETX 4800,128
    GOTO RX_EXIT
KEY129:
    ETX 4800,129
    GOTO ��������3
    GOTO RX_EXIT
KEY130:
    ETX 4800,130
    GOTO ��������6
    GOTO RX_EXIT
KEY131:
    ETX 4800,131
    GOTO ��������9
    GOTO RX_EXIT
KEY132:
    ETX 4800,132
    GOTO ��ȭ���̵�
    GOTO RX_EXIT
KEY133:
    ETX 4800,133
    GOTO RX_EXIT
KEY134:
    ETX 4800,134
    GOTO ��������3
    GOTO RX_EXIT
KEY135:
    ETX 4800,135
    GOTO ��������6
    GOTO RX_EXIT
KEY136:
    ETX 4800,136
    GOTO ��ȭ���̵�
    GOTO RX_EXIT
KEY137:
    ETX 4800,137
    GOTO RX_EXIT
KEY138:
    ETX 4800,138
    GOTO ��������3
    GOTO RX_EXIT
KEY139:
    ETX 4800,139
    GOTO ��������6
    GOTO RX_EXIT
KEY140:
    ETX 4800,140
    GOTO ��ȭ���̵�
    GOTO RX_EXIT
'-------------------------------------
KEY141:
    ETX 4800,141
    GOTO ��������45
    GOTO RX_EXIT
KEY142:
    ETX 4800,142
    GOTO ��������45
    GOTO RX_EXIT
KEY143:
    ETX 4800,143
    GOTO RX_EXIT
KEY144:
    ETX 4800,144
    GOTO RX_EXIT
'####-----------------------�����ȹ���
KEY145:
    ETX 4800,145
    GOSUB �����ȳ�����
    GOTO RX_EXIT
KEY146:
    ETX 4800,146
    GOSUB �����ȵ��ƿ���
    GOTO RX_EXIT
KEY147:
    ETX 4800,147
    GOTO RX_EXIT
KEY148:
    ETX 4800,148
    GOTO RX_EXIT
KEY149:
    ETX 4800,149
    GOTO RX_EXIT
KEY150:
    ETX 4800,150
    GOTO RX_EXIT
    '######### ------------------- KEY151-160 �� ȸ��
KEY151:
    ETX 4800,151
    GOTO ��������5
    GOTO RX_EXIT
KEY152:
    ETX 4800,152
    GOTO ��������10
    GOTO RX_EXIT
KEY153:
    ETX 4800,153
    GOTO ��������20
    GOTO RX_EXIT
KEY154:
    ETX 4800,154
    GOTO ��������45
    GOTO RX_EXIT
KEY155:
    ETX 4800,155
    GOTO ��������60
    GOTO RX_EXIT
KEY156:
    ETX 4800,156
    GOTO ������5
    GOTO RX_EXIT
KEY157:
    ETX 4800,157
    GOTO ������10
    GOTO RX_EXIT
KEY158:
    ETX 4800,158
    GOTO ������20
    GOTO RX_EXIT
KEY159:
    ETX 4800,159
    GOTO ������45
    GOTO RX_EXIT
KEY160:
    ETX 4800,160
    GOTO ������60
    GOTO RX_EXIT
'--------------------------------
KEY161:
    ETX 4800,161
    GOTO RX_EXIT
KEY162:
    ETX 4800,162
    GOTO RX_EXIT
KEY163:
    ETX 4800,163
    GOTO RX_EXIT
KEY164:
    ETX 4800,164
    GOTO RX_EXIT
KEY165:
    ETX 4800,165
    GOTO RX_EXIT
KEY166:
    ETX 4800,166
    GOTO RX_EXIT
KEY167:
    ETX 4800,167
    GOTO RX_EXIT
KEY168:
    ETX 4800,168
    GOTO RX_EXIT
KEY169:
    ETX 4800,169
    GOTO RX_EXIT
    '####### --------------------- KEY170-189 �¿�����
    '���ð������� ���Ƿ� ���������Ƿ� ���� ������ ��
    '#### ������(->) --------------
KEY170:
    ETX 4800,170
    GOTO ������1  '�� ġ��
    GOTO RX_EXIT
KEY171:
    ETX 4800,171
    GOTO ������2  '�ɱ� �� ����
    GOTO RX_EXIT
KEY172:
    ETX 4800,172
    GOTO ������3    '������ ���� �� ���ϰ�
    GOTO RX_EXIT
KEY173:
    ETX 4800,173
    GOTO ������4   '������ ġ��
    GOTO RX_EXIT
KEY174:
    ETX 4800,174
    GOTO ������5      '���� ġ��
    GOTO RX_EXIT
    '#### ������(<-) --------------
KEY175:
    ETX 4800,175
    GOTO ������1  '�� ġ��
    GOTO RX_EXIT
KEY176:
    ETX 4800,176
    GOTO ������2  '�ɱ� �� ����
    GOTO RX_EXIT
KEY177:
    ETX 4800,177
    GOTO ������3    '������ ���� �� ���ϰ�
    GOTO RX_EXIT
KEY178:
    ETX 4800,178
    GOTO ������4    '������ ġ��
    GOTO RX_EXIT
KEY179:
    ETX 4800,179
    GOTO ��Ȧ�ο���ġ��
    GOTO RX_EXIT
    '####### --------------------- KEY180 ����
KEY180:
    ETX 4800,180
    GOTO ����
    GOTO RX_EXIT

'#---------------------------------------------------------------------------------#
'#                                				
'#                                     �Լ��� �ۼ�			
'#                                				
'#---------------------------------------------------------------------------------#

'-----------------------------------------------------------------------
'				# ���� �Լ�				
'-----------------------------------------------------------------------

'### ------------------- ������ �Լ� ------------------- ###
������1:
    SPEED 8
    MOVE G6A,97,  76, 145,  93, 100, 100
    MOVE G6D,97,  76, 145,  93, 100, 100
    MOVE G6B,100,  35,  90,
    MOVE G6C,100,  130,  10, 10
    WAIT

    MOVE G6C,145,  130,  10, 10
    WAIT

    MOVE G6C,145,  60,  10, 10
    WAIT

    MOVE G6C,135,  40,  30, 10
    WAIT

    MOVE G6C,140,  10,  80, 10
    WAIT

    DELAY 400

    MOVE G6B,100,  35,  90,
    MOVE G6C,140,  10,  70, 10
    WAIT

    '**** ���ð��� ******
    SPEED 1
    MOVE G6C,140,  30,  100, 10
    WAIT
    DELAY 1000
    '******************

    SPEED 8
    MOVE G6C,135,  50,  60, 190
    WAIT

    GOSUB �⺻�ڼ�
    'RETURN
    '----------------------------------------
������2:
    SPEED 8
    MOVE G6A,97,  76, 145,  93, 100, 100
    MOVE G6D,97,  76, 145,  93, 100, 100
    MOVE G6B,100,  35,  90,
    MOVE G6C,100,  130,  10, 10
    WAIT
    MOVE G6C,145,  130,  10, 10
    WAIT
    MOVE G6C,145,  60,  10, 10
    WAIT
    MOVE G6C,135,  40,  30, 10
    WAIT
    MOVE G6C,140,  10,  80, 10
    WAIT
    DELAY 400
    MOVE G6B,100,  35,  90,
    MOVE G6C,140,  10,  70, 10
    WAIT
    '**** ���ð��� ******
    SPEED 3
    MOVE G6C,140,  30,  100, 10
    WAIT
    DELAY 1000
    '******************
    SPEED 8
    MOVE G6C,135,  50,  60, 190
    WAIT
    GOSUB �⺻�ڼ�
    'RETURN
    '----------------------------------------

������3:
    SPEED 8
    MOVE G6A,97,  76, 145,  93, 100, 100
    MOVE G6D,97,  76, 145,  93, 100, 100
    MOVE G6B,100,  35,  90,
    MOVE G6C,100,  130,  10, 10
    WAIT
    MOVE G6C,145,  130,  10, 10
    WAIT
    MOVE G6C,145,  60,  10, 10
    WAIT
    MOVE G6C,135,  40,  30, 10
    WAIT
    MOVE G6C,140,  10,  80, 10
    WAIT
    DELAY 400
    MOVE G6B,100,  35,  90,
    MOVE G6C,140,  10,  70, 10
    WAIT
    '**** ���ð��� ******
    SPEED 5
    MOVE G6C,140,  30,  100, 10
    WAIT
    DELAY 1000
    '******************
    SPEED 8
    MOVE G6C,135,  50,  60, 190
    WAIT
    GOSUB �⺻�ڼ�
    'RETURN
    '----------------------------------------

������4:
    SPEED 8
    MOVE G6A,97,  76, 145,  93, 100, 100
    MOVE G6D,97,  76, 145,  93, 100, 100
    MOVE G6B,100,  35,  90,
    MOVE G6C,100,  130,  10, 10
    WAIT
    MOVE G6C,145,  130,  10, 10
    WAIT
    MOVE G6C,145,  60,  10, 10
    WAIT
    MOVE G6C,135,  40,  30, 10
    WAIT
    MOVE G6C,140,  10,  80, 10
    WAIT
    DELAY 400
    MOVE G6B,100,  35,  90,
    MOVE G6C,140,  10,  70, 10
    WAIT
    '**** ���ð��� ******
    SPEED 7
    MOVE G6C,140,  30,  100, 10
    WAIT
    DELAY 1000
    '******************
    SPEED 8
    MOVE G6C,135,  50,  60, 190
    WAIT
    GOSUB �⺻�ڼ�
    'RETURN
    '----------------------------------------

������5:
    SPEED 8
    MOVE G6A,97,  76, 145,  93, 100, 100
    MOVE G6D,97,  76, 145,  93, 100, 100
    MOVE G6B,100,  35,  90,
    MOVE G6C,100,  130,  10, 10
    WAIT
    MOVE G6C,145,  130,  10, 10
    WAIT
    MOVE G6C,145,  60,  10, 10
    WAIT
    MOVE G6C,135,  40,  30, 10
    WAIT
    MOVE G6C,140,  10,  80, 10
    WAIT
    DELAY 400
    MOVE G6B,100,  35,  90,
    MOVE G6C,140,  10,  70, 10
    WAIT
    '**** ���ð��� ******
    SPEED 9
    MOVE G6C,140,  30,  100, 10
    WAIT
    DELAY 1000
    '******************
    SPEED 8
    MOVE G6C,135,  50,  60, 190
    WAIT
    GOSUB �⺻�ڼ�
    'RETURN

    '### ------------------- ������ �Լ� ------------------- ###
������1:
    GOSUB All_motor_mode3

    SPEED 8
    MOVE G6A,97,  76, 145,  93, 100, 100
    MOVE G6D,97,  76, 145,  93, 100, 100
    MOVE G6B,100,  35,  90,
    MOVE G6C,150,  100,  10, 10
    WAIT

    MOVE G6C,135,  20,  90, 10
    WAIT

    DELAY 400
    WAIT

    SPEED 6
    MOVE G6C,135,  10,  80, 10
    WAIT
    DELAY 1000

    SPEED 8
    MOVE G6C,135,  100,  10, 10
    WAIT

    MOVE G6C,135,  50,  60, 190
    WAIT


    GOSUB �⺻�ڼ�
    'RETURN
    GOTO RX_EXIT
    '----------------------------------------
������2:
    GOSUB All_motor_mode3

    SPEED 8
    MOVE G6A,97,  76, 145,  93, 100, 100
    MOVE G6D,97,  76, 145,  93, 100, 100
    MOVE G6B,100,  35,  90,
    MOVE G6C,150,  100,  10, 10
    WAIT

    MOVE G6C,135,  20,  90, 10
    WAIT
    DELAY 400
    SPEED 6
    MOVE G6C,135,  10,  70, 25
    WAIT
    DELAY 1000

    SPEED 8
    MOVE G6C,135,  100,  10, 10
    WAIT

    MOVE G6C,135,  50,  60, 190
    WAIT
    GOSUB �⺻�ڼ�
    'RETURN
    GOTO RX_EXIT
    '----------------------------------------
������3:
    GOSUB All_motor_mode3
    SPEED 8
    MOVE G6A,97,  76, 145,  93, 100, 100
    MOVE G6D,97,  76, 145,  93, 100, 100
    MOVE G6B,100,  35,  90,
    MOVE G6C,150,  100,  10, 10
    WAIT

    MOVE G6C,135,  20,  90, 10
    WAIT
    DELAY 400
    SPEED 9
    MOVE G6C,135,  10,  60, 25
    WAIT
    DELAY 1000

    SPEED 8
    MOVE G6C,135,  100,  10, 10
    WAIT

    MOVE G6C,135,  50,  60, 190
    WAIT

    GOSUB �⺻�ڼ�
    'RETURN
    GOTO RX_EXIT
    '----------------------------------------
������4:
    'MUSIC "cdg"
    'RETURN
    GOTO RX_EXIT
    '----------------------------------------
��Ȧ�ο���ġ��:
    GOSUB All_motor_mode3

    SPEED 8
    MOVE G6A,97,  76, 145,  93, 100, 100
    MOVE G6D,97,  76, 145,  93, 100, 100
    MOVE G6B,100,  35,  90,
    MOVE G6C,150,  100,  10, 10
    WAIT

    MOVE G6C,135,  20,  90, 10
    WAIT

    SPEED 6
    MOVE G6C,135,  20,  85, 10
    WAIT
    DELAY 1000

    SPEED 8
    MOVE G6C,135,  100,  10, 10
    WAIT

    MOVE G6C,135,  50,  60, 190
    WAIT

    GOSUB �⺻�ڼ�
    GOTO RX_EXIT
    '#### --------------��巹�� �� �������� �Լ� ------------------- ####
    DIM ��巹������ġ AS BYTE
    ��巹������ġ = 0

�¾�巹��:
    GOSUB All_motor_mode3

    SPEED 8
    MOVE G6A,97,  76, 145,  93, 100, 100
    MOVE G6D,97,  76, 145,  93, 100, 100
    MOVE G6B,100,  35,  90,
    MOVE G6C,150,  100,  10, 10
    WAIT

    MOVE G6C,135,  20,  90, 10
    WAIT

    ��巹������ġ = 1
    GOTO RX_EXIT
    '----------------------------------------
����������1:
    IF ��巹������ġ = 1 THEN
        SPEED 6
        MOVE G6C,135,  10,  80, 10
        WAIT
        DELAY 1000

        SPEED 8
        MOVE G6C,135,  100,  10, 10
        WAIT

        MOVE G6C,135,  50,  60, 190
        WAIT

        ��巹������ġ=0

        GOSUB �⺻�ڼ�
    ELSE
        ��巹������ġ=0
    ENDIF
    GOTO RX_EXIT

����������2:
    IF ��巹������ġ = 1 THEN
        SPEED 6
        MOVE G6C,135,  10,  70, 25
        WAIT
        DELAY 1000

        SPEED 8
        MOVE G6C,135,  100,  10, 10
        WAIT

        MOVE G6C,135,  50,  60, 190
        WAIT

        ��巹������ġ=0

        GOSUB �⺻�ڼ�
    ELSE
        ��巹������ġ=0
    ENDIF
    GOTO RX_EXIT

����������3:
    IF ��巹������ġ = 1 THEN
        SPEED 9
        MOVE G6C,135,  10,  60, 25
        WAIT
        DELAY 1000

        SPEED 8
        MOVE G6C,135,  100,  10, 10
        WAIT

        MOVE G6C,135,  50,  60, 190
        WAIT

        ��巹������ġ=0

        GOSUB �⺻�ڼ�
    ELSE
        ��巹������ġ=0
    ENDIF
    GOTO RX_EXIT
    '--------------------------------------------------------
���巹��:
    GOSUB All_motor_mode3

    SPEED 8
    MOVE G6A,97,  76, 145,  93, 100, 100
    MOVE G6D,97,  76, 145,  93, 100, 100
    MOVE G6B,100,  35,  90,
    MOVE G6C,150,  100,  10, 10
    WAIT

    MOVE G6C,135,  40,  40, 10
    WAIT

    MOVE G6C,135,  10,  80, 10
    WAIT

    ��巹������ġ = 1
    GOTO RX_EXIT
    '----------------------------------------
����������:
    IF ��巹������ġ = 1 THEN
        SPEED 6
        MOVE G6C,140,  30,  100, 10
        WAIT
        DELAY 1000

        SPEED 8

        MOVE G6C,135,  50,  60, 190
        WAIT

        ��巹������ġ=0

        GOSUB �⺻�ڼ�
    ELSE
        ��巹������ġ=0
    ENDIF
    GOTO RX_EXIT
'-----------------------------------------------------------------------
'				# ���� �Լ�				
'-----------------------------------------------------------------------
'#########  ------------ ������������------------- #############
������������:
    ����COUNT = 0
    GOSUB All_motor_mode3
    SPEED 7
    HIGHSPEED SETON

    IF ������� = 0 THEN
        ������� = 1
        MOVE G6A,95,  76, 147,  93, 101
        MOVE G6D,101,  76, 147,  93, 98
        MOVE G6B,100
        MOVE G6C,100
        WAIT

        GOTO ������������_1
    ELSE
        ������� = 0
        MOVE G6D,95,  76, 147,  93, 101
        MOVE G6A,101,  76, 147,  93, 98
        MOVE G6B,100
        MOVE G6C,100
        WAIT

        GOTO ������������_4
    ENDIF

������������_1:
    MOVE G6A,95,  90, 125, 100, 104
    MOVE G6D,104,  77, 147,  93,  102
    MOVE G6B, 85
    MOVE G6C,115
    WAIT

������������_2:
    MOVE G6A,103,   73, 140, 103,  100
    MOVE G6D, 95,  85, 147,  85, 102
    WAIT

    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0

        GOTO RX_EXIT
    ENDIF

    ����COUNT = ����COUNT + 1
    IF ����COUNT > ����Ƚ�� THEN  GOTO ������������_2_stop

    ERX 4800,A,������������_4
    IF A <> A_old THEN
������������_2_stop:
        MOVE G6D,95,  90, 125, 95, 104
        MOVE G6A,104,  76, 145,  91,  102
        MOVE G6C, 100
        MOVE G6B,100
        WAIT
        HIGHSPEED SETOFF
        SPEED 15
        GOSUB ����ȭ�ڼ�
        SPEED 5
        GOSUB �⺻�ڼ�2

        GOTO RX_EXIT
    ENDIF

������������_4:
    MOVE G6D,95,  95, 120, 100, 104
    MOVE G6A,104,  77, 147,  93,  102
    MOVE G6C, 85
    MOVE G6B,115
    WAIT

������������_5:
    MOVE G6D,103,    73, 140, 103,  100
    MOVE G6A, 95,  85, 147,  85, 102
    WAIT

    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO RX_EXIT
    ENDIF

    ����COUNT = ����COUNT + 1
    IF ����COUNT > ����Ƚ�� THEN  GOTO ������������_5_stop

    ERX 4800,A,������������_1
    IF A <> A_old THEN

������������_5_stop:
        MOVE G6A,95,  90, 125, 95, 104
        MOVE G6D,104,  76, 145,  91,  102
        MOVE G6B, 100
        MOVE G6C,100
        WAIT
        HIGHSPEED SETOFF
        SPEED 15
        GOSUB ����ȭ�ڼ�
        SPEED 5
        GOSUB �⺻�ڼ�2

        GOTO RX_EXIT
    ENDIF
    GOTO ������������_1

'#########  ------------ ������������------------- #############
������������:
    GOSUB All_motor_mode3
    �Ѿ���Ȯ�� = 0
    ����COUNT = 0
    SPEED 7
    HIGHSPEED SETON

    IF ������� = 0 THEN
        ������� = 1
        MOVE G6A,95,  76, 145,  93, 101
        MOVE G6D,101,  76, 145,  93, 98
        MOVE G6B,100
        MOVE G6C,100
        WAIT

        GOTO ������������_1
    ELSE
        ������� = 0
        MOVE G6D,95,  76, 145,  93, 101
        MOVE G6A,101,  76, 145,  93, 98
        MOVE G6B,100
        MOVE G6C,100
        WAIT

        GOTO ������������_4
    ENDIF

������������_1:
    MOVE G6D,104,  76, 147,  93,  102
    MOVE G6A,95,  95, 120, 95, 104
    MOVE G6B,115
    MOVE G6C,85
    WAIT

������������_2:
    MOVE G6A, 103,  79, 147,  89, 100
    MOVE G6D,95,   65, 147, 103,  102
    WAIT

    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO RX_EXIT
    ENDIF
    ����COUNT = ����COUNT + 1
    IF ����COUNT > ����Ƚ�� THEN  GOTO ������������_2_stop

    ERX 4800,A, ������������_4
    IF A <> A_old THEN

������������_2_stop:
        MOVE G6D,95,  85, 130, 100, 104
        MOVE G6A,104,  77, 146,  93,  102
        MOVE G6C, 100
        MOVE G6B,100
        WAIT

        'SPEED 15
        GOSUB ����ȭ�ڼ�
        HIGHSPEED SETOFF
        SPEED 5
        GOSUB �⺻�ڼ�2

        'DELAY 400
        GOTO RX_EXIT
    ENDIF

������������_4:
    MOVE G6A,104,  76, 147,  93,  102
    MOVE G6D,95,  95, 120, 95, 104
    MOVE G6C,115
    MOVE G6B,85
    WAIT

������������_5:
    MOVE G6D, 103,  79, 147,  89, 100
    MOVE G6A,95,   65, 147, 103,  102
    WAIT
    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO RX_EXIT
    ENDIF

    ����COUNT = ����COUNT + 1
    IF ����COUNT > ����Ƚ�� THEN  GOTO ������������_5_stop

    ERX 4800,A, ������������_1
    IF A <> A_old THEN

������������_5_stop:
        MOVE G6A,95,  85, 130, 100, 104
        MOVE G6D,104,  77, 146,  93,  102
        MOVE G6B, 100
        MOVE G6C,100
        WAIT

        'SPEED 15
        GOSUB ����ȭ�ڼ�
        HIGHSPEED SETOFF
        SPEED 5
        GOSUB �⺻�ڼ�2

        'DELAY 400
        GOTO RX_EXIT
    ENDIF

    GOTO ������������_1


'############ ---------------- ������ ----------------############ 
�����ʿ�����:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2

    SPEED 12
    MOVE G6D, 95,  90, 125, 100, 107, 100
    MOVE G6A,107,  77, 147,  93, 107 , 100
    WAIT

    SPEED 12
    MOVE G6D, 102,  77, 147, 93, 100, 100
    MOVE G6A,90,  80, 140,  95, 107, 100
    WAIT

    SPEED 12
    MOVE G6D,95,  76, 147,  93, 98, 100
    MOVE G6A,95,  76, 147,  93, 98, 100
    WAIT

    SPEED 3
    GOSUB �⺻�ڼ�2

    GOTO RX_EXIT

���ʿ�����:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2

    SPEED 12
    MOVE G6A, 95,  90, 125, 100, 104, 100
    MOVE G6D,105,  76, 146,  93, 104, 100
    WAIT

    SPEED 12
    MOVE G6A, 102,  76, 146, 93, 100, 100
    MOVE G6D,90,  80, 140,  95, 107, 100
    WAIT

    SPEED 12
    MOVE G6A,95,  76, 146,  93, 98, 100
    MOVE G6D,95,  76, 146,  93, 98, 100
    WAIT

    SPEED 3
    GOSUB �⺻�ڼ�2

    GOTO RX_EXIT
'-----------------------------------------------------------------------
'				# ���� �Լ�				
'-----------------------------------------------------------------------
'DIM �Ӹ��¿�    AS INTEGER
'DIM �Ӹ�����    AS INTEGER
'CONST �¿쿵�� = 100
'CONST ���Ͽ��� = 95
'�Ӹ��¿� = �¿쿵��
'�Ӹ����� = ���Ͽ���
'# ----------------- �߾� ���߱� ------------------- #
�����߾�:
    SPEED 3
    �Ӹ����� = ���Ͽ���
    �Ӹ��¿� = �¿쿵��
    SERVO 11,�Ӹ��¿�
    SERVO 16,�Ӹ�����
    GOTO RX_EXIT

���������߾�:
    SPEED 3
    �Ӹ����� = ���Ͽ���
    SERVO 16,�Ӹ�����
    GOTO RX_EXIT

�����¿��߾�:
    SPEED 3
    �Ӹ��¿� = �¿쿵��
    SERVO 11,�Ӹ��¿�
    GOTO RX_EXIT

'# -------------------- ���� �̵� ----------------------- #
��������3:
    SPEED 3
    �Ӹ����� = �Ӹ����� - 3
    SERVO 16, �Ӹ�����
    GOTO RX_EXIT

��������6:
    SPEED 3
    �Ӹ����� = �Ӹ����� - 6
    SERVO 16, �Ӹ�����
    GOTO RX_EXIT

��������9:
    SPEED 3
    �Ӹ����� = �Ӹ����� - 9
    SERVO 16, �Ӹ�����
    GOTO RX_EXIT

��ȭ���̵�:
    SPEED 3
    �Ӹ����� = �Ӹ����� - 30
    SERVO 16, �Ӹ�����
    GOTO RX_EXIT
'------------------------
��������3:
    SPEED 3
    �Ӹ�����= �Ӹ����� + 3
    SERVO 16, �Ӹ�����
    GOTO RX_EXIT

��������6:
    SPEED 3
    �Ӹ�����= �Ӹ����� + 6
    SERVO 16, �Ӹ�����
    GOTO RX_EXIT

��������9:
    SPEED 3
    �Ӹ�����= �Ӹ����� + 9
    SERVO 16, �Ӹ�����
    GOTO RX_EXIT

��ȭ���̵�:
    SPEED 3
    �Ӹ����� = �Ӹ����� + 30
    SERVO 16, �Ӹ�����
    GOTO RX_EXIT
'--------------------
��������45:
    SPEED 3
    �Ӹ�����= �Ӹ����� -45
    SERVO 16, �Ӹ�����
    GOTO RX_EXIT

��������45:
    SPEED 3
    �Ӹ�����= �Ӹ����� +45
    SERVO 16, �Ӹ�����
    GOTO RX_EXIT
'--------------------
��������3:
    SPEED 3
    �Ӹ��¿�= �Ӹ��¿� - 3
    SERVO 11, �Ӹ��¿�
    GOTO RX_EXIT

��������6:
    SPEED 3
    �Ӹ��¿�= �Ӹ��¿� - 6
    SERVO 11, �Ӹ��¿�
    GOTO RX_EXIT

��ȭ���̵�:
    SPEED 3
    �Ӹ��¿�= �Ӹ��¿� - 30
    SERVO 11, �Ӹ��¿�
    GOTO RX_EXIT
'-----------------------
��������3:
    SPEED 3
    �Ӹ��¿�= �Ӹ��¿� + 3
    SERVO 11, �Ӹ��¿�
    GOTO RX_EXIT

��������6:
    SPEED 3
    �Ӹ��¿�= �Ӹ��¿� + 6
    SERVO 11, �Ӹ��¿�
    GOTO RX_EXIT

��ȭ���̵�:
    SPEED 3
    �Ӹ��¿�= �Ӹ��¿� + 30
    SERVO 11, �Ӹ��¿�
    GOTO RX_EXIT

'-----------------------------------------------------------------------
'				# �� �Լ�				
'-----------------------------------------------------------------------
������5:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2
    SPEED 5
    MOVE G6A,100,  81, 145,  88, 106, 100
    MOVE G6D,94,  71, 145, 98, 100, 100
    WAIT

    SPEED 12
    MOVE G6A,97,  81, 145,  88, 104, 100
    MOVE G6D,91,  71, 145, 98, 96, 100
    WAIT

    SPEED 6
    MOVE G6A,101,  76, 146,  93, 98, 100
    MOVE G6D,101,  76, 146,  93, 98, 100
    WAIT

    GOSUB �⺻�ڼ�2
    GOTO RX_EXIT

������10:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2
    SPEED 5
    MOVE G6A,100,  86, 145,  83, 106, 100
    MOVE G6D,94,  66, 145, 103, 100, 100
    WAIT

    SPEED 12
    MOVE G6A,97,  86, 145,  83, 104, 100
    MOVE G6D,91,  66, 145, 103, 96, 100
    WAIT

    SPEED 6
    MOVE G6A,101,  76, 146,  93, 98, 100
    MOVE G6D,101,  76, 146,  93, 98, 100
    WAIT

    GOSUB �⺻�ڼ�2
    GOTO RX_EXIT

������20:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2
    SPEED 8
    MOVE G6A,95,  96, 145,  73, 108, 100
    MOVE G6D,91,  56, 145,  113, 102, 100
    WAIT

    SPEED 12
    MOVE G6A,91,  96, 145,  73, 108, 100
    MOVE G6D,88,  56, 145,  113, 102, 100
    WAIT
    SPEED 6
    MOVE G6A,101,  76, 146,  93, 98, 100
    MOVE G6D,101,  76, 146,  93, 98, 100
    WAIT

    GOSUB �⺻�ڼ�2

    GOTO RX_EXIT

������45:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2

    SPEED 10
    MOVE G6A,95,  106, 145,  63, 108, 100
    MOVE G6D,91,  46, 145,  123, 102, 100
    WAIT

    SPEED 12
    MOVE G6A,91,  106, 145,  63, 108, 100
    MOVE G6D,88,  46, 145,  123, 102, 100
    WAIT

    SPEED 8
    GOSUB �⺻�ڼ�2

    GOTO RX_EXIT

������60:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2

    SPEED 15
    MOVE G6A,95,  116, 145,  53, 108, 100
    MOVE G6D,91,  36, 145,  133, 102, 100
    WAIT

    SPEED 15
    MOVE G6A,91,  116, 145,  53, 108, 100
    MOVE G6D,88,  36, 145,  133, 102, 100
    WAIT

    SPEED 10
    GOSUB �⺻�ڼ�2

    GOTO RX_EXIT
'-----------------------------------------------------------------------
��������5:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2
    SPEED 5
    MOVE G6A,97,  71, 145,  98, 103, 100
    MOVE G6D,97,  81, 145,  88, 103, 100
    WAIT

    SPEED 12
    MOVE G6A,94,  71, 145,  98, 101, 100
    MOVE G6D,94,  81, 145,  88, 101, 100
    WAIT
    SPEED 6
    MOVE G6A,101,  76, 146,  93, 98, 100
    MOVE G6D,101,  76, 146,  93, 98, 100
    WAIT

    GOSUB �⺻�ڼ�2

    GOTO RX_EXIT
��������10:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2
    SPEED 5
    MOVE G6A,97,  66, 145,  103, 103, 100
    MOVE G6D,97,  86, 145,  83, 103, 100
    WAIT

    SPEED 12
    MOVE G6A,94,  66, 145,  103, 101, 100
    MOVE G6D,94,  86, 145,  83, 101, 100
    WAIT
    SPEED 6
    MOVE G6A,101,  76, 146,  93, 98, 100
    MOVE G6D,101,  76, 146,  93, 98, 100
    WAIT

    GOSUB �⺻�ڼ�2

    GOTO RX_EXIT

��������20:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2
    SPEED 8
    MOVE G6A,95,  56, 145,  113, 105, 100
    MOVE G6D,95,  96, 145,  73, 105, 100
    WAIT

    SPEED 12
    MOVE G6A,93,  56, 145,  113, 105, 100
    MOVE G6D,93,  96, 145,  73, 105, 100
    WAIT

    SPEED 6
    MOVE G6A,101,  76, 146,  93, 98, 100
    MOVE G6D,101,  76, 146,  93, 98, 100

    WAIT

    GOSUB �⺻�ڼ�2

    GOTO RX_EXIT

��������45:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2

    SPEED 10
    MOVE G6A,95,  46, 145,  123, 105, 100
    MOVE G6D,95,  106, 145,  63, 105, 100
    WAIT

    SPEED 12
    MOVE G6A,93,  46, 145,  123, 105, 100
    MOVE G6D,93,  106, 145,  63, 105, 100
    WAIT

    SPEED 8
    GOSUB �⺻�ڼ�2

    GOTO RX_EXIT

��������60:
    MOTORMODE G6A,3,3,3,3,2
    MOTORMODE G6D,3,3,3,3,2

    SPEED 15
    MOVE G6A,95,  36, 145,  133, 105, 100
    MOVE G6D,95,  116, 145,  53, 105, 100
    WAIT

    SPEED 15
    MOVE G6A,90,  36, 145,  133, 105, 100
    MOVE G6D,90,  116, 145,  53, 105, 100
    WAIT

    SPEED 10
    GOSUB �⺻�ڼ�2

    GOTO RX_EXIT
'-----------------------------------------------------------------------
'				# �����Ӵ�				
'-----------------------------------------------------------------------
����:
    GOSUB �⺻�ڼ�
    GOSUB Arm_motor_mode3
    GOSUB Leg_motor_mode2
    SPEED 15
    MOVE G6A,100,  76, 145,  93, 100
    MOVE G6D,100,  76, 145,  93, 100
    MOVE G6B,100,  180,  120
    'MOVE G6C,100,  180,  120
    WAIT	'

    SPEED 10
    FOR i = 1 TO 3'

        MOVE G6B,100,  145,  100
        'MOVE G6C,100,  145,  100
        WAIT

        MOVE G6B,100,  180,  130
        'MOVE G6C,100,  180,  130
        WAIT	
    NEXT i
    DELAY 200
    SPEED 8
    GOSUB �⺻�ڼ�
    GOSUB All_motor_Reset
    GOTO RX_EXIT


'����������
��ġ���ڼ���:
    GOSUB �⺻�ڼ�
    GOSUB All_motor_Reset
    
    FOR i = 1 TO 4
        MOTORMODE G6A,3,3,3,3,2
    	MOTORMODE G6D,3,3,3,3,2

    	SPEED 12
    	MOVE G6D, 95,  90, 125, 100, 107, 100
    	MOVE G6A,107,  77, 147,  93, 107 , 100
    	WAIT
	
    	SPEED 12
    	MOVE G6D, 102,  77, 147, 93, 100, 100
    	MOVE G6A,90,  80, 140,  95, 107, 100
    	WAIT
	
    	SPEED 12
    	MOVE G6D,95,  76, 147,  93, 98, 100
    	MOVE G6A,95,  76, 147,  93, 98, 100
    	WAIT
	
    	SPEED 3
    	GOSUB �⺻�ڼ�2
    NEXT i
    
    FOR j = 1 TO 4
	    MOTORMODE G6A,3,3,3,3,2
	    MOTORMODE G6D,3,3,3,3,2
	
    	SPEED 10
    	MOVE G6A,95,  106, 145,  63, 108, 100
	    MOVE G6D,91,  46, 145,  123, 102, 100
	    WAIT
	
	    SPEED 12
	    MOVE G6A,91,  106, 145,  63, 108, 100
	    MOVE G6D,88,  46, 145,  123, 102, 100
	    WAIT
	
    	SPEED 8
    	GOSUB �⺻�ڼ�2
    NEXT j
    
    FOR i = 1 TO 4
        MOTORMODE G6A,3,3,3,3,2
    	MOTORMODE G6D,3,3,3,3,2

    	SPEED 12
    	MOVE G6D, 95,  90, 125, 100, 107, 100
    	MOVE G6A,107,  77, 147,  93, 107 , 100
    	WAIT
	
    	SPEED 12
    	MOVE G6D, 102,  77, 147, 93, 100, 100
    	MOVE G6A,90,  80, 140,  95, 107, 100
    	WAIT
	
    	SPEED 12
    	MOVE G6D,95,  76, 147,  93, 98, 100
    	MOVE G6A,95,  76, 147,  93, 98, 100
    	WAIT
	
    	SPEED 3
    	GOSUB �⺻�ڼ�2
    NEXT i
    
    
    GOTO RX_EXIT
    
'������
��ġ���ڼ���:
    GOSUB �⺻�ڼ�
    GOSUB All_motor_Reset
    
    FOR i = 1 TO 4
    	MOTORMODE G6A,3,3,3,3,2
    	MOTORMODE G6D,3,3,3,3,2

    	SPEED 12
    	MOVE G6A, 95,  90, 125, 100, 104, 100
    	MOVE G6D,105,  76, 146,  93, 104, 100
    	WAIT

    	SPEED 12
    	MOVE G6A, 102,  76, 146, 93, 100, 100
    	MOVE G6D,90,  80, 140,  95, 107, 100
    	WAIT

    	SPEED 12
    	MOVE G6A,95,  76, 146,  93, 98, 100
    	MOVE G6D,95,  76, 146,  93, 98, 100
    	WAIT

    	SPEED 3
    	GOSUB �⺻�ڼ�2
    NEXT i
    
    FOR j = 1 TO 4
    	MOTORMODE G6A,3,3,3,3,2
    	MOTORMODE G6D,3,3,3,3,2

    	SPEED 10
    	MOVE G6A,95,  46, 145,  123, 105, 100
    	MOVE G6D,95,  106, 145,  63, 105, 100
    	WAIT

    	SPEED 12
    	MOVE G6A,93,  46, 145,  123, 105, 100
    	MOVE G6D,93,  106, 145,  63, 105, 100
    	WAIT

    	SPEED 8
    	GOSUB �⺻�ڼ�2
    NEXT j
    
    FOR i = 1 TO 4
    	MOTORMODE G6A,3,3,3,3,2
    	MOTORMODE G6D,3,3,3,3,2

    	SPEED 12
    	MOVE G6A, 95,  90, 125, 100, 104, 100
    	MOVE G6D,105,  76, 146,  93, 104, 100
    	WAIT

    	SPEED 12
    	MOVE G6A, 102,  76, 146, 93, 100, 100
    	MOVE G6D,90,  80, 140,  95, 107, 100
    	WAIT

    	SPEED 12
    	MOVE G6A,95,  76, 146,  93, 98, 100
    	MOVE G6D,95,  76, 146,  93, 98, 100
    	WAIT

    	SPEED 3
    	GOSUB �⺻�ڼ�2
    NEXT i
    
    GOTO RX_EXIT


�����⺻����:
    ����COUNT = 0
    ����ӵ� = 13
    �¿�ӵ� = 4
    �Ѿ���Ȯ�� = 0

    GOSUB Leg_motor_mode3

    IF ������� = 0 THEN
        ������� = 1

        SPEED 4

        MOVE G6A, 88,  74, 144,  95, 110
        MOVE G6D,108,  76, 146,  93,  96
        MOVE G6B,100
        MOVE G6C,100
        WAIT

        SPEED 10'

        MOVE G6A, 90, 90, 120, 105, 110,100
        MOVE G6D,110,  76, 147,  93,  96,100
        MOVE G6B,90
        MOVE G6C,110
        WAIT

        GOTO �����⺻����1
    ELSE
        ������� = 0

        SPEED 4

        MOVE G6D,  88,  74, 144,  95, 110
        MOVE G6A, 108,  76, 146,  93,  96
        MOVE G6C, 100
        MOVE G6B, 100
        WAIT

        SPEED 10

        MOVE G6D, 90, 90, 120, 105, 110,100
        MOVE G6A,110,  76, 147,  93,  96,100
        MOVE G6C,90
        MOVE G6B,110
        WAIT

        GOTO �����⺻����2	
    ENDIF

�����⺻����1:
    ETX 4800,11 '�����ڵ带 ����
    SPEED ����ӵ�

    MOVE G6A, 86,  56, 145, 115, 110
    MOVE G6D,108,  76, 147,  93,  96
    WAIT

    SPEED �¿�ӵ�
    GOSUB Leg_motor_mode3

    MOVE G6A,110,  76, 147, 93,  96
    MOVE G6D,86, 100, 145,  69, 110
    WAIT

    SPEED ����ӵ�

    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO MAIN
    ENDIF

    ERX 4800,A, �����⺻����2
    IF A = 11 THEN
        GOTO �����⺻����2
    ELSE
        ' GOSUB Leg_motor_mode3

        MOVE G6A,112,  76, 146,  93, 96,100
        MOVE G6D,90, 100, 100, 115, 110,100
        MOVE G6B,110
        MOVE G6C,90
        WAIT
        HIGHSPEED SETOFF

        SPEED 8
        MOVE G6A, 106,  76, 146,  93,  96,100		
        MOVE G6D,  88,  71, 152,  91, 106,100
        MOVE G6B, 100
        MOVE G6C, 100
        WAIT	

        SPEED 2
        GOSUB �⺻�ڼ�2

        GOTO RX_EXIT
    ENDIF
    '**********

�����⺻����2:
    MOVE G6A,110,  76, 147,  93, 96,100
    MOVE G6D,90, 90, 120, 105, 110,100
    MOVE G6B,110
    MOVE G6C,90
    WAIT

�����⺻����3:
    ETX 4800,11 '�����ڵ带 ����

    SPEED ����ӵ�

    MOVE G6D, 86,  56, 145, 115, 110
    MOVE G6A,108,  76, 147,  93,  96
    WAIT

    SPEED �¿�ӵ�
    MOVE G6D,110,  76, 147, 93,  96
    MOVE G6A,86, 100, 145,  69, 110
    WAIT

    SPEED ����ӵ�

    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO MAIN
    ENDIF
    
    ����COUNT = ����COUNT + 1
    IF ����COUNT > ����Ƚ�� THEN  GOTO �����⺻����_stop

    ERX 4800,A, �����⺻����4
    IF A = 11 THEN
        GOTO �����⺻����4
    ELSE
�����⺻����_stop:
        MOVE G6A, 90, 100, 100, 115, 110,100
        MOVE G6D,112,  76, 146,  93,  96,100
        MOVE G6B,90
        MOVE G6C,110
        WAIT
        HIGHSPEED SETOFF
        SPEED 8

        MOVE G6D, 106,  76, 146,  93,  96,100		
        MOVE G6A,  88,  71, 152,  91, 106,100
        MOVE G6C, 100
        MOVE G6B, 100
        WAIT	
        SPEED 2
        GOSUB �⺻�ڼ�2

        GOTO RX_EXIT
    ENDIF

�����⺻����4:
    '�޹ߵ��10
    MOVE G6A,90, 90, 120, 105, 110,100
    MOVE G6D,110,  76, 146,  93,  96,100
    MOVE G6B, 90
    MOVE G6C,110
    WAIT

    GOTO �����⺻����1
    
'------------------------------------------------------------------    
�����⺻����:
    �Ѿ���Ȯ�� = 0
    ����ӵ� = 12
    �¿�ӵ� = 4
    GOSUB Leg_motor_mode3


    IF ������� = 0 THEN
        ������� = 1

        SPEED 4
        MOVE G6A, 88,  71, 152,  91, 110
        MOVE G6D,108,  76, 145,  93,  96
        MOVE G6B,100
        MOVE G6C,100
        WAIT

        SPEED 10
        MOVE G6A, 90, 100, 100, 115, 110
        MOVE G6D,110,  76, 145,  93,  96
        MOVE G6B,90
        MOVE G6C,110
        WAIT

        GOTO ��������_����_1   
    ELSE
        ������� = 0

        SPEED 4
        MOVE G6D,  85,  71, 152,  91, 110
        MOVE G6A, 108,  76, 146,  93,  96
        MOVE G6C, 100
        MOVE G6B, 100
        WAIT

        SPEED 10
        MOVE G6D, 90, 100, 100, 115, 110
        MOVE G6A,112,  76, 146,  93,  96
        MOVE G6C,90
        MOVE G6B,110
        WAIT

        GOTO ��������_����_2

    ENDIF

��������_����_1:
    ETX 4800,12 '�����ڵ带 ����
    SPEED ����ӵ�

    MOVE G6D,110,  76, 146, 93,  96
    MOVE G6A,90, 98, 146,  69, 110
    WAIT

    SPEED �¿�ӵ�
    MOVE G6D, 90,  60, 137, 120, 110
    MOVE G6A,107,  85, 137,  93,  96
    WAIT

    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO RX_EXIT
    ENDIF

    SPEED 11

    MOVE G6D,90, 90, 120, 105, 110
    MOVE G6A,112,  76, 146,  93, 96
    MOVE G6B,110
    MOVE G6C,90
    WAIT

    ERX 4800,A, ��������_����_2
    IF A <> A_old THEN
��������_����_1_EXIT:
        HIGHSPEED SETOFF
        SPEED 5

        MOVE G6A, 108,  76, 146,  93,  96      
        MOVE G6D,  85,  72, 148,  91, 106
        MOVE G6B, 100
        MOVE G6C, 100
        WAIT   

        SPEED 3
        GOSUB �⺻�ڼ�2
        GOTO RX_EXIT
    ENDIF

��������_����_2:
    ETX 4800,12 '�����ڵ带 ����
    SPEED ����ӵ�
    MOVE G6A,112,  76, 146, 93,  96
    MOVE G6D,90, 98, 146,  69, 110
    WAIT

    SPEED �¿�ӵ�
    MOVE G6A, 90,  60, 137, 120, 110
    MOVE G6D,107  85, 137,  93,  96
    WAIT

    GOSUB �յڱ�������
    IF �Ѿ���Ȯ�� = 1 THEN
        �Ѿ���Ȯ�� = 0
        GOTO RX_EXIT
    ENDIF

    SPEED 11
    MOVE G6A,90, 90, 120, 105, 110
    MOVE G6D,110,  76, 146,  93,  96
    MOVE G6B, 90
    MOVE G6C,110
    WAIT

    ERX 4800,A, ��������_����_1
    IF A <> A_old THEN
��������_����_2_EXIT:
        HIGHSPEED SETOFF
        SPEED 5

        MOVE G6D, 106,  76, 146,  93,  96      
        MOVE G6A,  85,  72, 148,  91, 106
        MOVE G6B, 100
        MOVE G6C, 100
        WAIT   

        SPEED 3
        GOSUB �⺻�ڼ�2
        GOTO RX_EXIT
    ENDIF     
    GOTO ��������_����_1


�����ȳ�����:
	MOVE G6C,100,  30,  80, 190,
	WAIT
	RETURN
	
�����ȵ��ƿ���:'�⺻�ڼ� �ȷ�
	MOVE G6C,100,  30,  80, 190
	WAIT
	RETURN