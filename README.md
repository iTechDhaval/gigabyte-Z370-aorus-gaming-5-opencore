# Gigabyte Z370 AORUS Gaming 5 - Hackintosh Build

## System Configuration
* 1x Intel - Core i7-8700K 3.2GHz 6-Core Processor
* 1x Gigabyte - Z370 AORUS Gaming 5 (rev. 1.0) ATX LGA1151 Motherboard
* 1x Crucial Ballistix Sport LT - RED 32GB (2 x 16GB) * DDR4-2400 Memory CL16 BLS16G4D240FSE
* 1x Samsung - 970 EVO 250GB M.2-2280 Solid State Drive
* 1x Samsung - 970 EVO 1TB M.2-2280 Solid State Drive
* 1x Seagate - Barracuda 2 TB 3.5" 7200RPM Internal Hard * Drive
* 1x Gigabyte - AORUS Radeon RX 580 8GB Graphic Cards
* 1x Corsair - 200R ATX Mid Tower Case
* 1x Corsair - RMx 850 W 80+ Gold Certified Fully Modular ATX Power Supply
* 1x Fenvi T919 - MQUPIN Fenvi T919 Desktop Wireless WiFi Adapter for macOS PC WiFi Card Continuity & Handoff BCM94360CD Native Airport WiFi & BT 4.0 1750Mbps 5GHz/2.4GHz 3x3 MIMO abgn+ac Beamforming+ WLAN PCI-E Card

## What works
- [x] iMessage/Facetime (Needs proper SMBIOS: iMac19,1)
- [x] Audio (Needs kexts: AppleALC.kext)
- [x] Display Port & HDMI Audio (Needs a small patch, see below)
- [x] Graphics RX 580 (Out of the box)
- [x] Sleep & Deep Sleep (Out of the box, including FANs turned off)
- [x] Shutdown (motherboard leds turn off as well)
- [x] Fenvi T919 Bluetooth and Wifi (Out of the box - need to activate on board USB port HS11 and disable HS02)
- [x] Ethernet (Needs kext)
- [x] Wifi OnBoard Adapter (Needs kexts: AirportItlwm.kext)
- [x] Bluetooth OnBoard Adapter (Need kext)
- [x] USB 2.0 & 3.0 & 3.1 & Type-C
- [x] [All continuity features with Fenvi T919](https://support.apple.com/en-ca/guide/mac-help/mchl1d734309/mac)

## Gathering Files
- [LiLu](https://github.com/acidanthera/Lilu/releases)
- [VirtualSMC](https://github.com/acidanthera/VirtualSMC/releases)
- [WhateverGreen](https://github.com/acidanthera/WhateverGreen/releases)
- [AppleALC](https://github.com/acidanthera/AppleALC/releases)
- [IntelMausi](https://github.com/acidanthera/IntelMausi/releases)

#### Wireless OnBoard (Optional)
- [Intel WiFi](https://github.com/OpenIntelWireless/itlwm/releases)
- [Intel Bluetooth](https://github.com/OpenIntelWireless/IntelBluetoothFirmware/releases)

## What does not work
* Wifi from the Motherboard

#### BIOS SETTINGS
* Save & Exit → Load Optimized Defaults
* BIOS → Fast Boot : Disabled
* BIOS → CSM Support : Disabled (You might get a blackscreen otherwise with * RX 580)
* Peripherals → Trusted Computing → Security Device Support : Disable
* Peripherals → Network Stack Configuration → Network Stack : Disabled
* Peripherals → USB Configuration → Legacy USB Support : Auto
* Peripherals → USB Configuration → XHCI Hand-off : Enabled (Extremely * important)
* Chipset → Vt-d : Disabled
* Chipset → Internal Graphics : Enabled. (Reboot BIOS then next options * will appear)
* Chipset → DMVT Pre-Allocated : 128M
* Chipset → DMVT Total Gfx Mem : 256M
* Chipset → Wake on LAN Enable : Disabled
* Chipset → IOAPIC 24-119 Entries : Enabled
* Power → Erp : Enabled (Fix shutdown & motherboard leds not powering off)


## USB Port Mapping

### Folder Structure
* `EFI`: Main folder to EFI drive for MacOS Big Sur 11.2
* `USBPortMapExports`: All exported files to map USB ports.

### Motherboard USB Details

#### Chipset+ASMedia® USB 3.1 Gen 2 Controller:
1. 1 x USB Type-C™ port on the back panel, with USB 3.1 Gen 2 support
2. 1 x USB 3.1 Gen 2 Type-A port (red) on the back panel

#### Chipset:
1. 1 x USB Type-C™ port with USB 3.1 Gen 1 support, available through the internal USB header
2. 6 x USB 3.1 Gen 1 ports (4 ports on the back panel, 2 ports available through the internal USB header)
3. 6 x USB 2.0/1.1 ports (2 ports on the back panel, 4 ports available through the internal USB headers)


### BIOS F12+ Hack
## CFG Lock

I followed [OpenCore CFG Lock guide](https://dortania.github.io/OpenCore-Post-Install/misc/msr-lock.html) to identify and reset it. You can simply skip to next step, I have included for more advance read.

### Checking via VerifyMsrE2

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

### Disabling CFG Lock

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


### Troubleshooting

#### Back side USB Type C port is not working

1. Reset BIOS Settings
2. Disable CFG Lock
3. Reboot
