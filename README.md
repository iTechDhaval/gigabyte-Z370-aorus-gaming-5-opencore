# USB Port Mapping

## Folder Structure
* `EFI`: Main folder to EFI drive for MacOS Big Sur 11.2
* `USBPortMapExports`: All exported files to map USB ports.

## Motherboard USB Details

### Chipset+ASMedia® USB 3.1 Gen 2 Controller:
1. 1 x USB Type-C™ port on the back panel, with USB 3.1 Gen 2 support
2. 1 x USB 3.1 Gen 2 Type-A port (red) on the back panel

### Chipset:
1. 1 x USB Type-C™ port with USB 3.1 Gen 1 support, available through the internal USB header
2. 6 x USB 3.1 Gen 1 ports (4 ports on the back panel, 2 ports available through the internal USB header)
3. 6 x USB 2.0/1.1 ports (2 ports on the back panel, 4 ports available through the internal USB headers)

# CFG Lock

I followed [OpenCore CFG Lock guide](https://dortania.github.io/OpenCore-Post-Install/misc/msr-lock.html) to identify and reset it. You can simply skip to next step, I have included for more advance read.

## Checking via VerifyMsrE2

To start, download [VerifyMsrE2](https://github.com/acidanthera/OpenCorePkg/releases) (opens new window) and add this tool inside EFI/OC/Tools and config.plist(this can be done with ProperTree's snapshot function(ie. Cmd+R)). Next, boot OpenCore and select the VerifyMsrE2.efi entry. This should provide you one of the following:
> VerifyMsrE2 is included in the EFI folder.

CFG-Lock is enabled:
```
This firmware has LOCKED MSR 0xE2 register!
```
CFG-Lock is disabled:
```
This firmware has UNLOCKED MSR 0xE2 register!
```
For the former, please continue here: Disabling CFG Lock.

For the latter, you don't need to do any CFG-Lock patches and can simply disable `Kernel -> Quirks -> AppleCpuPmCfgLock` and `Kernel -> Quirks -> AppleXcpmCfgLock`.

| Quirk | Enabled |
| :--- | :--- |
| AppleCpuPmCfgLock | No/False |
| AppleXcpmCfgLock | No/False |

## Disabling CFG Lock

So you've created the EFI folder but you can't still boot without unlocking before CFG Lock. In order to do this you'll need the following:

Inside your EFI/OC/Tools folder and config.plist, add the following tool(this can be done with ProperTree's snapshot function(ie. Cmd+R)):

* [Modified GRUB Shell](https://github.com/datasone/grub-mod-setup_var/releases)
> Modified GRUB Shell is included in the EFI folder

1. `Gigabyte Z370 Aorus Gaming 5` board is using `0x5A4` offset to manage CFG Lock status.

2. Run the Modified GRUB Shell and write the following command:

```
setup_var 0x5A4 0x00
```

4. At this point, run either `reset` in the shell or simply reboot your machine. And with that, you should have `CFG Lock` unlocked! To verify, you can run over the methods listed at [Checking if your firmware supports CFG Lock unlocking](#Checking-via-VerifyMsrE2) to verify whether the variable was set correctly then finally disable `Kernel -> Quirks -> AppleCpuPmCfgLock` and `Kernel -> Quirks -> AppleXcpmCfgLock`.

| Quirk | Enabled |
| :--- | :--- |
| AppleCpuPmCfgLock | No/False |
| AppleXcpmCfgLock | No/False |


## Troubleshooting

### Back side USB Type C port is not working

1. Reset BIOS Settings
2. Disable CFG Lock
3. Reboot
