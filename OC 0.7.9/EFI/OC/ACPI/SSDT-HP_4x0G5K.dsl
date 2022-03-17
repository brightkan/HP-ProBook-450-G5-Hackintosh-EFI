/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLWljSsX.aml, Wed Mar 16 20:46:43 2022
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x0000091E (2334)
 *     Revision         0x02
 *     Checksum         0x8E
 *     OEM ID           "Hack"
 *     OEM Table ID     "HP4x0G5K"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "Hack", "HP4x0G5K", 0x00000000)
{
    External (_PR_.PR00, ProcessorObj)
    External (_SB_.AC__, DeviceObj)
    External (_SB_.PCI0, DeviceObj)
    External (_SB_.PCI0.GFX0, DeviceObj)
    External (_SB_.PCI0.I2C1, DeviceObj)
    External (_SB_.PCI0.I2C1.TPD0, DeviceObj)
    External (_SB_.PCI0.LPCB, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_.CRZN, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.DTMP, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.ECMX, MutexObj)
    External (_SB_.PCI0.LPCB.EC0_.ECRG, IntObj)
    External (_SB_.PCI0.LPCB.EC0_.FRDC, FieldUnitObj)
    External (_SB_.PCI0.LPCB.EC0_.TEMP, FieldUnitObj)
    External (_SB_.PCI0.LPCB.HPET, DeviceObj)
    External (_SB_.PCI0.LPCB.PS2K, DeviceObj)
    External (_SB_.PCI0.RP01.PXSX, DeviceObj)
    External (_SB_.PCI0.SBUS, DeviceObj)
    External (_SB_.PCI0.XHC_, DeviceObj)
    External (_SB_.PCI0.XHC_.PMEE, FieldUnitObj)
    External (GPEN, FieldUnitObj)
    External (HPTE, IntObj)
    External (SDM1, FieldUnitObj)
    External (STAS, FieldUnitObj)
    External (USWE, FieldUnitObj)
    External (WOLE, FieldUnitObj)
    External (XPRW, MethodObj)    // 2 Arguments

    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            HPTE = Zero
            STAS = One
            GPEN = One
            SDM1 = Zero
            WOLE = Zero
        }

        Scope (_PR)
        {
            Scope (PR00)
            {
                If (_OSI ("Darwin"))
                {
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }

                        Return (Package (0x02)
                        {
                            "plugin-type", 
                            One
                        })
                    }
                }
            }
        }

        Scope (_SB)
        {
            Scope (AC)
            {
                If (_OSI ("Darwin"))
                {
                    Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                    {
                        0x1C, 
                        0x03
                    })
                }
            }

            Device (SMCD)
            {
                Name (_HID, "FAN00000")  // _HID: Hardware ID
                Name (TACH, Package (0x02)
                {
                    "System Fan", 
                    "FAN0"
                })
                Name (TEMP, Package (0x04)
                {
                    "CPU Heatsink", 
                    "TCPU", 
                    "Ambient", 
                    "TAMB"
                })
                Method (FAN0, 0, Serialized)
                {
                    If (!\_SB.PCI0.LPCB.EC0.ECRG)
                    {
                        Return (Zero)
                    }

                    Local0 = \_SB.PCI0.LPCB.EC0.FRDC /* External reference */
                    If (Local0)
                    {
                        Local0 = ((0x0003C000 + (Local0 >> One)) / Local0)
                    }

                    If ((0x03C4 == Local0))
                    {
                        Return (Zero)
                    }

                    Return (Local0)
                }

                Method (TCPU, 0, Serialized)
                {
                    If (!\_SB.PCI0.LPCB.EC0.ECRG)
                    {
                        Return (Zero)
                    }

                    Acquire (\_SB.PCI0.LPCB.EC0.ECMX, 0xFFFF)
                    \_SB.PCI0.LPCB.EC0.CRZN = One
                    Local0 = \_SB.PCI0.LPCB.EC0.DTMP /* External reference */
                    Release (\_SB.PCI0.LPCB.EC0.ECMX)
                    Return (Local0)
                }

                Method (TAMB, 0, Serialized)
                {
                    If (!\_SB.PCI0.LPCB.EC0.ECRG)
                    {
                        Return (Zero)
                    }

                    Acquire (\_SB.PCI0.LPCB.EC0.ECMX, 0xFFFF)
                    \_SB.PCI0.LPCB.EC0.CRZN = 0x04
                    Local0 = \_SB.PCI0.LPCB.EC0.TEMP /* External reference */
                    Release (\_SB.PCI0.LPCB.EC0.ECMX)
                    Return (Local0)
                }
            }

            Scope (PCI0)
            {
                Scope (GFX0)
                {
                    Device (PNLF)
                    {
                        Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
                        Name (_CID, "backlight")  // _CID: Compatible ID
                        Name (_UID, 0x10)  // _UID: Unique ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (0x0B)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }
                }

                Scope (I2C1)
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

                Scope (LPCB)
                {
                    Device (ALS0)
                    {
                        Name (_HID, "ACPI0008" /* Ambient Light Sensor Device */)  // _HID: Hardware ID
                        Name (_CID, "smc-als")  // _CID: Compatible ID
                        Name (_ALI, 0x012C)  // _ALI: Ambient Light Illuminance
                        Name (_ALR, Package (0x01)  // _ALR: Ambient Light Response
                        {
                            Package (0x02)
                            {
                                0x64, 
                                0x012C
                            }
                        })
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }

                    Device (DMAC)
                    {
                        Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
                        Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                        {
                            IO (Decode16,
                                0x0000,             // Range Minimum
                                0x0000,             // Range Maximum
                                0x01,               // Alignment
                                0x20,               // Length
                                )
                            IO (Decode16,
                                0x0081,             // Range Minimum
                                0x0081,             // Range Maximum
                                0x01,               // Alignment
                                0x11,               // Length
                                )
                            IO (Decode16,
                                0x0093,             // Range Minimum
                                0x0093,             // Range Maximum
                                0x01,               // Alignment
                                0x0D,               // Length
                                )
                            IO (Decode16,
                                0x00C0,             // Range Minimum
                                0x00C0,             // Range Maximum
                                0x01,               // Alignment
                                0x20,               // Length
                                )
                            DMA (Compatibility, NotBusMaster, Transfer8_16, )
                                {4}
                        })
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }

                    Device (EC)
                    {
                        Name (_HID, "ACID0001")  // _HID: Hardware ID
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }

                    Scope (PS2K)
                    {
                        If (_OSI ("Darwin"))
                        {
                            Name (RMCF, Package (0x04)
                            {
                                "Synaptics TouchPad", 
                                Package (0x02)
                                {
                                    "DynamicEWMode", 
                                    ">y"
                                }, 

                                "Keyboard", 
                                Package (0x04)
                                {
                                    "Function Keys Special", 
                                    Package (0x0F)
                                    {
                                        Package (0x00){}, 
                                        "3b=3b", 
                                        "3e=3e", 
                                        "3f=3f", 
                                        "40=40", 
                                        "42=42", 
                                        "43=43", 
                                        "44=44", 
                                        "e05f=e05f", 
                                        "e06e=e06e", 
                                        "e012=e012", 
                                        "e017=e017", 
                                        "e02e=e02e", 
                                        "e030=e030", 
                                        "e001=e001"
                                    }, 

                                    "Function Keys Standard", 
                                    Package (0x0F)
                                    {
                                        Package (0x00){}, 
                                        "3b=e05f", 
                                        "3e=e06e", 
                                        "3f=e012", 
                                        "40=e017", 
                                        "42=e02e", 
                                        "43=e030", 
                                        "44=e001", 
                                        "e05f=3b", 
                                        "e06e=3e", 
                                        "e012=3f", 
                                        "e017=40", 
                                        "e02e=42", 
                                        "e030=43", 
                                        "e001=44"
                                    }
                                }
                            })
                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                            {
                                If (!Arg2)
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03                                             // .
                                    })
                                }

                                Return (Package (0x04)
                                {
                                    "RM,oem-id", 
                                    "HPQOEM", 
                                    "RM,oem-table-id", 
                                    "ProBook-102"
                                })
                            }
                        }
                    }
                }

                Device (MCHC)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }

                Scope (SBUS)
                {
                    Device (BUS0)
                    {
                        Name (_CID, "smbus")  // _CID: Compatible ID
                        Name (_ADR, Zero)  // _ADR: Address
                        Device (DVL0)
                        {
                            Name (_ADR, 0x57)  // _ADR: Address
                            Name (_CID, "diagsvault")  // _CID: Compatible ID
                            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                            {
                                If (!Arg2)
                                {
                                    Return (Buffer (One)
                                    {
                                         0x57                                             // W
                                    })
                                }

                                Return (Package (0x02)
                                {
                                    "address", 
                                    0x57
                                })
                            }
                        }

                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (_OSI ("Darwin"))
                            {
                                Return (0x0F)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                    }
                }

                Device (SRAM)
                {
                    Name (_ADR, 0x00140002)  // _ADR: Address
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (_OSI ("Darwin"))
                        {
                            Return (0x0F)
                        }
                        Else
                        {
                            Return (Zero)
                        }
                    }
                }
            }

            Device (USBX)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg2 == Zero))
                    {
                        Return (Buffer (One)
                        {
                             0x03                                             // .
                        })
                    }

                    Return (Package (0x04)
                    {
                        "kUSBSleepPortCurrentLimit", 
                        0x0BB8, 
                        "kUSBWakePortCurrentLimit", 
                        0x0BB8
                    })
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
            }
        }

        Method (GPRW, 2, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                If ((0x6D == Arg0))
                {
                    Return (Package (0x02)
                    {
                        0x6D, 
                        Zero
                    })
                }

                If ((0x0D == Arg0))
                {
                    Return (Package (0x02)
                    {
                        0x0D, 
                        Zero
                    })
                }
            }

            Return (XPRW (Arg0, Arg1))
        }
    }
}

