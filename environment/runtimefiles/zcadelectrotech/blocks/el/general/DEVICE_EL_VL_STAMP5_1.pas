unit DEVICE_EL_VL_STAMP5_1;

interface

uses system,devices;
usescopy blocktype;
usescopy objname;

var

T2:String;(*'Шифр'*)
T3:String;(*'Проект'*)
T5:String;(*'Разрешение'*)

implementation

begin

BTY_TreeCoord:='PLAN_EM_Штамп';
Device_Type:=TDT_SilaPotr;
Device_Class:=TDC_Shell;

NMO_Name:='ШТ0';
NMO_BaseName:='ШТ';
NMO_Suffix:='??';

T2:='??';
T3:='??';
T5:='??';

end.