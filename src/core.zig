pub const Mods = packed struct { ls: bool, rs: bool, lc: bool, rc: bool, la: bool, ra: bool, lg: bool, rg: bool };
pub const KeyCodeWithMods = struct { keycode: u8, mods: Mods };
pub const LayerWithMods = struct { layer: u8, mods: Mods };
