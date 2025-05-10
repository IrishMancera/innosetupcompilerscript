; Inno Setup Script for Work Tracker App
[Setup]
AppName=Work Tracker App
AppVersion=1.0
DefaultDirName={pf}\Work Tracker App
DefaultGroupName=Work Tracker App
OutputBaseFilename=WorkTrackerAppSetup
Compression=lzma
SolidCompression=yes
DisableProgramGroupPage=yes

[Files]
; Main executable from PyInstaller (adjust filename if necessary)
Source: "C:\Users\ellie\Downloads\MicroTask\dist\work tracker app.exe"; DestDir: "{app}"; Flags: ignoreversion
; Optionally, include additional resources if you have a "build" folder:
Source: "C:\Users\ellie\Downloads\MicroTask\build"; DestDir: "{app}\build"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\Work Tracker App"; Filename: "{app}\work_tracker_app.exe"
Name: "{commondesktop}\Work Tracker App"; Filename: "{app}\work_tracker_app.exe"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "Create a &desktop icon"; GroupDescription: "Additional icons:"; Flags: unchecked

[Run]
Filename: "{app}\work_tracker_app.exe"; Description: "Launch Work Tracker App"; Flags: nowait postinstall skipifsilent
