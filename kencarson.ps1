
# volume.ps1
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class Volume {
    [DllImport("user32.dll")]
    public static extern int SendMessageW(IntPtr hWnd, int msg, int wParam, int lParam);
    public const int WM_APPCOMMAND = 0x0319;
    public const int APPCOMMAND_VOLUME_UP = 0x000a;
    public static void VolumeUp() {
        SendMessageW((IntPtr)0xffff, WM_APPCOMMAND, 0, APPCOMMAND_VOLUME_UP * 0x10000);
    }
}
"@
[Volume]::VolumeUp()

start "chrome.exe" https://www.youtube.com/watch?v=dQw4w9WgXcQ
