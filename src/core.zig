pub const Mods = packed struct { ls: bool = false, rs: bool = false, lc: bool = false, rc: bool = false, la: bool = false, ra: bool = false, lg: bool = false, rg: bool = false };
pub const KeyCodeWithMods = struct { keycode: u8, mods: Mods = Mods{} };
pub const LayerWithMods = struct { layer: u8, mods: Mods = Mods{} };

pub const KeyDef = struct {
    onTapEnter: u8, //function
    onTapExit: u8,
    onHoldEnter: u8,
    onHoldExit: u8,
};
pub const KeyCode_A = 0x15;
pub const Mod_LALT = Mods{ .la = true };
pub const Mod_LCTL_LALT = Mods{ .la = true };
