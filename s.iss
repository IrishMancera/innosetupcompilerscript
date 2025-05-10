; Inno Setup Script for Work Tracker App
[Setup]
AppName=Work Tracker App
AppVersion=1.0
; The installer will install the app in Program Files (x86)
DefaultDirName={pf}\Work Tracker App
DefaultGroupName=Work Tracker App
OutputBaseFilename=WorkTrackerAppSetup
Compression=lzma
SolidCompression=yes
DisableProgramGroupPage=yes

[Files]
; Main executable
Source: "C:\Users\ellie\Downloads\MicroTask\dist\work tracker app.exe"; DestDir: "{app}"; Flags: ignoreversion
; Include the build folder and all its contents


[Icons]
Name: "{group}\Work Tracker App"; Filename: "{app}\work tracker app.exe"
Name: "{commondesktop}\Work Tracker App"; Filename: "{app}\work tracker app.exe"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop icon"; GroupDescription: "Additional icons:"; Flags: unchecked

[Run]
Filename: "{app}\work tracker app.exe"; Description: "Launch Work Tracker App"; Flags: nowait postinstall skipifsilent
