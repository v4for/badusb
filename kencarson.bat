Add-Type @"
using System;
using System.Runtime.InteropServices;

public class VolumeControl {
    [DllImport("user32.dll")]
    public static extern int SendMessageA(IntPtr hWnd, int Msg, IntPtr wParam, IntPtr lParam);
    
    public const int APPCOMMAND_VOLUME_UP = 0x0000A000;
    public const int WM_APPCOMMAND = 0x0319;
    
    public static void SetVolumeToMax() {
        for (int i = 0; i < 100; i++) {
            SendMessageA((IntPtr)0xffff, WM_APPCOMMAND, (IntPtr)0, (IntPtr)APPCOMMAND_VOLUME_UP);
        }
    }
}
"@

[VolumeControl]::SetVolumeToMax()

Start-Process chrome.exe '--new-window https://www.youtube.com/watch?v=Gbqa9n1XOes'

