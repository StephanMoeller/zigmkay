pub const Mods = packed struct { ls: bool = false, rs: bool = false, lc: bool = false, rc: bool = false, la: bool = false, ra: bool = false, lg: bool = false, rg: bool = false };
pub const KeyCodeWithMods = struct { keycode: u8, mods: Mods = Mods{} };
pub const LayerWithMods = struct { layer: u8, mods: Mods = Mods{} };

// TapEnter
// TapExit
// HoldEnter
// HoldExit

pub const KeyDef = struct {
    keycode: u8,
    mods: Mods = Mods{},
    //onTap: u8, //function
    //onHoldEnter: u8,
    //onHoldExit: u8,
    layer: u8 = 0x0,
};
pub const KeyCode_A = 0x15;
