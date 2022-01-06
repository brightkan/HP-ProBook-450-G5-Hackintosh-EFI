# HP ProBook 450 G5

OpenCore setup for running Hackintosh on HP ProBook 450 G5

### Laptop Specifications:
- Intel i7-8550U (8) @ 1.80GHz CPU 
- Intel HD 620 Graphics
- 8GB DDR4-2400 MHz RAM
- 15.6 Full HD Display
- Synaptics PS2 TouchPad
- Intel Dual Band Wi-Fi and Bluetooth Card
- 2 USB 3.0 Ports, 1 USB 2.0 Port
- HDMI Port
- SD Card Reader


### BIOS Setup:
- Enable Embedded LAN Controller
- Disable Fast Boot
- Disable Power On when AC Detected
- Disable Power On when Lid is Opened
- Disable Secure Boot
- Disable Legacy Boot
- Enable Turbo Boost
- Enable Hyperthreading
- Enable Multi Processor
- Enable VT-x
- Disable Wake on LAN
- Video Memory Size: 64MB
- Enable Runtime Power Management
- Disable Extended Idle Power States
- Enable Deep Sleep
- Disable Wake when Lid is Opened
- Disable Wake on USB
- Enable Power Control

### What works:
- macOS 12.2 Monterey
- UEFI booting via OpenCore
- Built-in keyboard (with special function keys)
- Built-in trackpad (Full gestures)
- Audio Control Hotkeys
- HDMI Video and Audio
- Integrated Camera
- Wifi, Ethernet and Bluetooth
- Native audio with AppleALC, including headphone
- Built-in mic
- Native power management
- Battery status
- USB 3.0 Ports
- Audio on internal speaker and headphone
- Sleep and Wake 

## TouchPad and Gesture
```swift
/*
 * Find USTP:          55 53 54 50 08
 * Replace XSTP:       58 53 54 50 08
 */
DefinitionBlock("", "SSDT", 2, "hack", "I2Cpatch", 0)
{
    External (_SB_.PCI0.I2C1, DeviceObj)
    External (_SB_.PCI0.I2C1.TPD0, DeviceObj)
    External (SDM1, FieldUnitObj)
    External (GPEN, FieldUnitObj)

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            GPEN = One
            SDM1 = Zero
        }

        Scope (_SB.PCI0.I2C1)
        {
            If (_OSI ("Darwin"))
            {
                Name (USTP, One)
            }

            Scope (TPD0)
            {
                If (_OSI ("Darwin"))
                {
                    Name (OSYS, 0x07DC)
                }
            }
        }
    }
}
```
#### Thanks to:
- https://dortania.github.io/OpenCore-Install-Guide/
