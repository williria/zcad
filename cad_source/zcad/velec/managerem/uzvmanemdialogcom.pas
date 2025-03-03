{
*****************************************************************************
*                                                                           *
*  This file is part of the ZCAD                                            *
*                                                                           *
*  See the file COPYING.txt, included in this distribution,                 *
*  for details about the copyright.                                         *
*                                                                           *
*  This program is distributed in the hope that it will be useful,          *
*  but WITHOUT ANY WARRANTY; without even the implied warranty of           *
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                     *
*                                                                           *
*****************************************************************************
}
{**
@author(Vladimir Bobrov)
}
{$IFDEF FPC}
  {$CODEPAGE UTF8}
  {$MODE DELPHI}
{$ENDIF}
unit uzvmanemdialogcom;
{$INCLUDE zengineconfig.inc}

interface
uses
  SysUtils,
  uzcLog,
  uzccommandsabstract,uzccommandsimpl,uzccommandsmanager,
  uzeparsercmdprompt,uzegeometrytypes,
  uzcinterface,uzcdialogsfiles;

{resourcestring}//чтоб не засирать локализацию просто const
const
  RSCLParam='Нажми ${"э&[т]у",Keys[n],StrId[CLPIdUser1]} кнопку, ${"эт&[у]",Keys[e],100} или запусти ${"&[ф]айловый",Keys[a],StrId[CLPIdFileDialog]} диалог';

implementation

var
  clFileParam:CMDLinePromptParser.TGeneralParsedText=nil;

function generatorOnelineDiagramOneLevel_com(operands:TCommandOperands):TCommandResult;
var
  //inpt:String;
  gr:TGetResult;
  filename:string;
  p:GDBVertex;
begin
  if clFileParam=nil then
    clFileParam:=CMDLinePromptParser.GetTokens(RSCLParam);
  commandmanager.ChangeInputMode([IPEmpty,IPShortCuts],[]);
  commandmanager.SetPrompt(clFileParam);
  repeat
    //gr:=commandmanager.GetInput('',inpt);
    gr:=commandmanager.Get3DPoint('',p);
    case gr of
      GRId:case commandmanager.GetLastId of
             CLPIdUser1:ZCMsgCallBackInterface.TextMessage('GRId: CLPIdUser1',TMWOHistoryOut);
             CLPIdFileDialog:begin
               ZCMsgCallBackInterface.TextMessage('GRId: CLPIdFileDialog',TMWOHistoryOut);
               if SaveFileDialog(filename,'CSV',CSVFileFilter,'','Export data...') then begin
                 system.break;
               end;
             end;
             else ZCMsgCallBackInterface.TextMessage(format('GRId: %d',[commandmanager.GetLastId]),TMWOHistoryOut);
          end;
  GRNormal:ZCMsgCallBackInterface.TextMessage(format('GRNormal: %g,%g,%g',[p.x,p.y,p.z]),TMWOHistoryOut);
    end;
  until gr=GRCancel;
  result:=cmd_ok;
end;

initialization
  programlog.LogOutFormatStr('Unit "%s" initialization',[{$INCLUDE %FILE%}],LM_Info,UnitsInitializeLMId);
  CreateCommandFastObjectPlugin(@generatorOnelineDiagramOneLevel_com,'vGeneratorOneLine',CADWG,0);
finalization
  ProgramLog.LogOutFormatStr('Unit "%s" finalization',[{$INCLUDE %FILE%}],LM_Info,UnitsFinalizeLMId);
  if clFileParam<>nil then
    clFileParam.Free;
end.


