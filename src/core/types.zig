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
pub fn PinConfig(comptime length: usize, arr: [length]u8) type {
    return struct { pins: @TypeOf(arr) };
}

pub fn KeyboardType(comptime layerCount: usize, comptime keyCount: usize) type {
    return struct {
        keymap: [layerCount][keyCount]KeyDef,
        layerCount: usize = layerCount,
        keyCount: usize = keyCount,
    };
}
