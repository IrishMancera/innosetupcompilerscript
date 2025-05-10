; -------------------------------------------------------
; Inno Setup Script for ProjectSet Installer
; -------------------------------------------------------

[Setup]
AppName=ProjectSet
AppVersion=1.0
DefaultDirName={autopf}\ProjectSet
DefaultGroupName=ProjectSet
OutputBaseFilename=ProjectSetInstaller
Compression=lzma
SolidCompression=yes

[Files]
; Include all files from the published folder.
Source: "C:\Users\ellie\source\repos\ProjectSet\bin\Release\net8.0-windows\win-x64\*"; DestDir: "{app}"; Flags: recursesubdirs createallsubdirs ignoreversion

[Icons]
; Create a Start Menu shortcut.
Name: "{group}\ProjectSet"; Filename: "{app}\ProjectSet.exe"
; Create a Desktop shortcut.
Name: "{commondesktop}\ProjectSet"; Filename: "{app}\ProjectSet.exe"

[Run]
; Optionally launch the application after installation.
Filename: "{app}\ProjectSet.exe"; Description: "Launch ProjectSet"; Flags: nowait postinstall

[Code]
function InitializeSetup(): Boolean;
begin
  // Since the app is self-contained with .NET 8, no additional .NET check is required.
  Result := True;
end;
