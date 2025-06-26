pub const Mods = packed struct { ls: bool = false, rs: bool = false, lc: bool = false, rc: bool = false, la: bool = false, ra: bool = false, lg: bool = false, rg: bool = false };
pub const KeyCodeWithMods = struct { keycode: u8, mods: Mods = Mods{} };
pub const LayerWithMods = struct { layer: u8, mods: Mods = Mods{} };
pub const KeyDef = struct {
    keycode: u8,
    keycodeMods: Mods = Mods{},
    mods: Mods = Mods{},
    //onTap: u8, //function
    //onHoldEnter: u8,
    //onHoldExit: u8,
    layer: u8 = 0x0,
};
pub fn PinConfig(comptime colCount: usize, comptime rowCount: usize) type {
    return struct {
        colPins: [colCount]u8,

        rowPins: [rowCount]u8,
    };
}

pub fn KeyboardType(comptime layerCount: usize, comptime keyCount: usize, comptime colCount: usize, comptime rowCount: usize) type {
    return struct {
        keymap: [layerCount][keyCount]KeyDef,
        layerCount: usize = layerCount,
        keyCount: usize = keyCount,
        pinConfig: PinConfig(colCount, rowCount),
    };
}

pub const ScanSettings = struct { debounce_ms: u8 };
pub fn scan(settings: ScanSettings) u8 {}
