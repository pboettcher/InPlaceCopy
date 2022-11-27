program InPlaceCopy;

uses
  TntSystem, TntSysUtils, Windows, SysUtils;

function Yes(txt: WideString): Boolean;
begin
  Result := MessageBoxW(0, PWideChar(txt), nil, MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES;
end;

function WideExtractFilePathWithoutExt(const FileName: WideString): WideString;
var
  i: Integer;
begin
  i := WideLastDelimiter('.\:', FileName);
  if (i > 0) and (FileName[i] = '.') then
    Result := Copy(FileName, 1, i - 1) else
    Result := '';
end;

procedure Main();
var
  filePath, baseCopyPath, iStr, fileCopyPath: WideString;
  i: Integer;
  quiet: Boolean;
begin
  if ParamCount() < 1 then
    Exit;
  filePath := WideParamStr(1);
  quiet := (ParamCount() >= 2) and (WideLowerCase(ParamStr(2)) = '/quiet');
  if not WideFileExists(filePath) then
    Exit;
  baseCopyPath := WideExtractFilePathWithoutExt(filePath) + WideString(' - copy%s') + WideExtractFileExt(filePath);
  for i := 0 to MaxInt do begin
    if i = 0 then
      iStr := ''
    else
      iStr := IntToStr(i);
    fileCopyPath := WideFormat(baseCopyPath, [iStr]);
    if not WideFileExists(fileCopyPath) then begin
      if quiet or Yes(WideFormat('Make a file copy as "%s"?', [fileCopyPath])) then
        CopyFileW(PWideChar(filePath), PWideChar(fileCopyPath), True);
      Exit;
    end;
  end;
end;

begin
  Main();
end.
