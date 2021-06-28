DefinitionBlock ("", "SSDT", 2, "ACDT", "_UIAC", 0)
{
    Device(UIAC)
    {
        Name(_HID, "UIA00000")

        Name(RMCF, Package()
        {
            // XHC (8086_a2af)
            "XHC", Package()
            {
                "port-count", Buffer() { 0x18, 0x00, 0x00, 0x00 },
                "ports", Package()
                {
                      "HS03", Package()
                      {
                          "name", Buffer() { "HS03" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x03, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "Yellow USB 3.0 Left" },
                      },
                      "HS04", Package()
                      {
                          "name", Buffer() { "HS04" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x04, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "Yellow USB 3.0 Right" },
                      },
                      "HS05", Package()
                      {
                          "name", Buffer() { "HS05" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x05, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "Blue USB 3.0 Left" },
                      },
                      "HS06", Package()
                      {
                          "name", Buffer() { "HS06" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x06, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "Blue USB 3.0 Right" },
                      },
                      "HS07", Package()
                      {
                          "name", Buffer() { "HS07" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x07, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "Case USB 3.0 Left" },
                      },
                      "HS08", Package()
                      {
                          "name", Buffer() { "HS08" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x08, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "Case USB 3.0 Right" },
                      },
                      "HS11", Package()
                      {
                          "name", Buffer() { "HS11" },
                          "UsbConnector", 255,
                          "port", Buffer() { 0x0B, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "Fenvi T919 Bluetooth 4.0" },
                      },
                      "HS13", Package()
                      {
                          "name", Buffer() { "HS13" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x0D, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "Black USB 2.0 Left" },
                      },
                      "HS14", Package()
                      {
                          "name", Buffer() { "HS14" },
                          "UsbConnector", 0,
                          "port", Buffer() { 0x0E, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "Black USB 2.0 Right" },
                      },
                      "SS03", Package()
                      {
                          "name", Buffer() { "SS03" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x13, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "Yellow USB 3.0 Left" },
                      },
                      "SS04", Package()
                      {
                          "name", Buffer() { "SS04" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x14, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "Yellow USB 3.0 Right" },
                      },
                      "SS05", Package()
                      {
                          "name", Buffer() { "SS05" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x15, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "Blue USB 3.0 Left" },
                      },
                      "SS06", Package()
                      {
                          "name", Buffer() { "SS06" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x16, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "Blue USB 3.0 Right" },
                      },
                      "SS07", Package()
                      {
                          "name", Buffer() { "SS07" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x17, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "Case USB 3.0 Right" },
                      },
                      "SS08", Package()
                      {
                          "name", Buffer() { "SS08" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x18, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "Case USB 3.0 Left" },
                      },
                },
            },
            // PXSX (1b21_2142)
            "PXSX", Package()
            {
                "port-count", Buffer() { 0x04, 0x00, 0x00, 0x00 },
                "ports", Package()
                {
                      "HS01", Package()
                      {
                          "name", Buffer() { "HS01" },
                          "UsbConnector", 9,
                          "port", Buffer() { 0x03, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "Rear USB 3.2 Type C, 2.0 personality" },
                      },
                      "HS02", Package()
                      {
                          "name", Buffer() { "HS02" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x04, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "Rear USB 3.2 Type A, 2.0 personality" },
                      },
                      "SS01", Package()
                      {
                          "name", Buffer() { "SS01" },
                          "UsbConnector", 9,
                          "port", Buffer() { 0x01, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "Rear USB 3.2 Type C, 3.0 personality" },
                      },
                      "SS02", Package()
                      {
                          "name", Buffer() { "SS02" },
                          "UsbConnector", 3,
                          "port", Buffer() { 0x02, 0x00, 0x00, 0x00 },
                          "Comment", Buffer() { "Rear USB 3.2 Type A, 3.0 personality" },
                      },
                },
            },
        })
    }
}
