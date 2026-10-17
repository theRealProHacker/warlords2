; Windows installer (Inno Setup 6), built by .github/workflows/build.yml from PyInstaller's
; dist\warlords2:  iscc /DAppVersion=0.0.1 packaging\warlords2.iss  ->  dist\warlords2-windows-x64-setup.exe
;
; Installs per user by default (%LOCALAPPDATA%\Programs\Warlords II, no admin; the first page
; offers all users / Program Files).  After copying the program it runs
; `warlords2.exe --fetch-data {app}\Warlrd2`, which downloads the original game from the Internet
; Archive (warlords2/fetch.py); the program finds a Warlrd2 folder next to itself
; (paths.frozen_data).  If the download fails, setup still finishes and the game asks on its
; first start.  Saves and options live in %APPDATA%\warlords2 and stay on uninstall.

#ifndef AppVersion
  #define AppVersion "0.0.1"
#endif

[Setup]
AppId={{6F1D3C2A-8B4E-4F7A-9C55-2D7E1B0A9F31}
AppName=Warlords II
AppVersion={#AppVersion}
AppPublisher=warlords2
AppPublisherURL=https://github.com/theRealProHacker/warlords2
DefaultDirName={autopf}\Warlords II
DefaultGroupName=Warlords II
DisableProgramGroupPage=yes
PrivilegesRequired=lowest
PrivilegesRequiredOverridesAllowed=dialog
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
SetupIconFile=icon.ico
UninstallDisplayIcon={app}\warlords2.exe
OutputDir=..\dist
OutputBaseFilename=warlords2-windows-x64-setup
Compression=lzma2
SolidCompression=yes
WizardStyle=modern

[Files]
Source: "..\dist\warlords2\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{autoprograms}\Warlords II"; Filename: "{app}\warlords2.exe"
Name: "{autodesktop}\Warlords II"; Filename: "{app}\warlords2.exe"; Tasks: desktopicon

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"

[Run]
Filename: "{app}\warlords2.exe"; Description: "{cm:LaunchProgram,Warlords II}"; Flags: nowait postinstall skipifsilent

[UninstallDelete]
; the downloaded game files and the .part folder of an interrupted download
Type: filesandordirs; Name: "{app}\Warlrd2"
Type: filesandordirs; Name: "{app}\Warlrd2.part"

[Code]
procedure FetchGame;
var
  Code: Integer;
begin
  WizardForm.StatusLabel.Caption := 'Downloading the original game files from the Internet Archive...';
  WizardForm.ProgressGauge.Style := npbstMarquee;
  try
    if not Exec(ExpandConstant('{app}\warlords2.exe'),
                '--fetch-data "' + ExpandConstant('{app}\Warlrd2') + '"',
                ExpandConstant('{app}'), SW_HIDE, ewWaitUntilTerminated, Code) or (Code <> 0) then
      SuppressibleMsgBox('The game files could not be downloaded from the Internet Archive.' + #13#10 +
                         'Warlords II will ask for them on its first start.',
                         mbInformation, MB_OK, IDOK);
  finally
    WizardForm.ProgressGauge.Style := npbstNormal;
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssPostInstall then
    FetchGame;
end;
