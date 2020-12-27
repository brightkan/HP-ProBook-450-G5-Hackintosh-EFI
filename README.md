# HP-ProBook-450-G5-OpenCore

OpenCore setup for running Hackintosh on HP ProBook 450 G5

### Laptop Specifications:
- Intel i7-8550U (8) @ 1.80GHz CPU 
- Intel HD 620 Graphics
- 8GB DDR4-2133MHz RAM
- 15.6 Full HD Display
- Synaptics PS2 TouchPad
- Intel Dual Band Wi-Fi and Bluetooth Card
- 2 USB 3.0 Ports, 1 USB 2.0 Port
- HDMI Port
- SD Card Reader


### BIOS Setup:
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
- macOS Big Sur 11.0.1 20B50
- UEFI booting via OpenCore
- Built-in keyboard (with special function keys)
- Built-in trackpad (basic gestures)
- Audio Control Hotkeys
- HDMI Video and Audio
- Integrated Camera
- Wifi 
- Native audio with AppleALC, including headphone
- Built-in mic
- Native power management
- Battery status
- USB 3.0 Ports
- Audio on internal speaker and headphone
- Sleep and Wake

### What doesn't work:
- Ethernet
- Brighteness
- Intel card Bluetooth 

### Credits
- null-x/HP-ProBook-450-G3-Hackintosh

#### Thanks to:
- https://dortania.github.io/OpenCore-Install-Guide/
