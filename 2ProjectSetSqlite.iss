; -------------------------------------------
; Inno Setup Script for ProjectSet Installer
; -------------------------------------------
[Setup]
; Basic installer settings
AppName=ProjectSet
AppVersion=1.0
DefaultDirName={autopf}\ProjectSet
DefaultGroupName=ProjectSet
OutputBaseFilename=ProjectSetInstaller
Compression=lzma
SolidCompression=yes

[Files]
; Merged executable that contains all your C# code and dependencies
Source: "C:\Users\ellie\source\repos\ProjectSet\bin\Release\ProjectSet.exe"; DestDir: "{app}"; Flags: ignoreversion
; (Optional) If you want to include a pre-populated SQLite file, uncomment the following line and update the path:
; Source: "C:\YourBuildFolder\projectset.sqlite"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
; Shortcut in the Start Menu
Name: "{group}\ProjectSet"; Filename: "{app}\ProjectSet.exe"
; Shortcut on the common Desktop
Name: "{commondesktop}\ProjectSet"; Filename: "{app}\ProjectSet.exe"; Tasks: desktopicon

[Run]
; Launch the application after installation (optional)
Filename: "{app}\ProjectSet.exe"; Description: "Launch ProjectSet"; Flags: nowait postinstall skipifsilent

[Code]
uses
  Registry, SysUtils;

const
  DotNet48Release = 528040;  // .NET Framework 4.8 release key

function RegQueryDWordValue(RootKey: Integer; SubKey, ValueName: String; var Value: Cardinal): Boolean;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_READ);
  try
    Reg.RootKey := RootKey;
    if Reg.OpenKeyReadOnly(SubKey) then
    begin
      Result := Reg.ValueExists(ValueName);
      if Result then
        Value := Reg.ReadInteger(ValueName)
      else
        Value := 0;
      Reg.CloseKey;
    end else
      Result := False;
  finally
    Reg.Free;
  end;
end;

function IsDotNet48Installed: Boolean;
var
  Release: Cardinal;
begin
  // Check the registry for .NET Framework 4.8+ using the Release key
  Result := RegQueryDWordValue(HKLM, 'SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full', 'Release', Release)
            and (Release >= DotNet48Release);
end;

function InitializeSetup(): Boolean;
begin
  if not IsDotNet48Installed then
  begin
    MsgBox('.NET Framework 4.8 or later is required to install ProjectSet.'#13#10 +
           'Please download and install it from Microsoft and then run this installer again.', mbError, MB_OK);
    Result := False;
  end
  else
    Result := True;
end;
