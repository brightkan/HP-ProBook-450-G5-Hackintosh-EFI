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