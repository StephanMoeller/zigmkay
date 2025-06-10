const std = @import("std");

/// This imports the separate Gmodule containing `root.zig`. Take a look in `build.zig` for details.
const lib = @import("zig_firmware_brainstorming_lib");

const core = @import("core.zig");
const keycodes = @import("keycodes.zig");

// Tap:
//  None
//  Fire Key + Mod
//  One shot layer shift + Mod
//  Permanent layer shift + Mod
//
// Hold:
//  None
//  Mod
//  Momentary layer + mod
//  => layer: ?u8, => enienienien-nmods: Mods
//
//

const KEYCOUNT = 32;
const base_layer =
    \\ Q     W <J> lg:R        P   B            k   l <æ> o <å> u   '
    \\ F  la:A <Z> lc:S <V> ls:T   G            m   n     e     i   y
    \\ Z     X        C        D   V            j   h     ,     .   -
    \\                               ENT    SPC  
    \\ combo: lu=ø
;
// zig fmt: off
const baseLayer = [_][KEYCOUNT]core.KeyCodeWithMods{
    [_]core.KeyCodeWithMods{ 
        o(Q),    o(W), o(R),  o(P),  o(B),           o(K),     o(L),    o(O),    o(U),  o(SQ),
        o(F),  _CA(A), o(S),  o(T),  o(G),           o(M),     o(N),    o(E),    o(I),   o(Y),
        o(Z),    o(X), o(C),  o(D),  o(V),           o(J),     o(H),  o(COM),  o(DOT), o(DASH),
                                       o(ENT),   o(SPC)
    }
};
// zig fmt: on

pub fn o(keycode: u8) core.KeyCodeWithMods {
    return core.KeyCodeWithMods{ .keycode = keycode };
}

const Foo = packed struct { a: u47, b: u20 };
pub fn main() !void {
    std.log.info("hey {any}", .{0});
}

fn Key(keycode: u8) core.KeyCodeWithMods {
    return core.KeyCodeWithMods{ .keycode = keycode };
}

// Core stuff
pub fn _CA(key: core.KeyCodeWithMods) core.KeyCodeWithMods {
    var copy = key;
    copy.mods.lc = true;
    copy.mods.la = true;
    return copy;
}
pub fn LS(key: core.KeyCodeWithMods) core.KeyCodeWithMods {
    var copy = key;
    copy.mods.ls = true;
    return copy;
}
pub fn LA(key: core.KeyCodeWithMods) core.KeyCodeWithMods {
    var copy = key;
    copy.mods.la = true;
    return copy;
}

pub const SQ: u8 = 0x15; // Single quote
pub const COM: u8 = 0x15; // Single quote
pub const DOT: u8 = 0x15; // Single quote
pub const DASH: u8 = 0x15; // Single quote
pub const SPC: u8 = 0x15; // Single quote
pub const ENT: u8 = 0x15; // Single quote
pub const A: u8 = 0x15;
pub const B: u8 = 0x15;
pub const C: u8 = 0x15;
pub const D: u8 = 0x15;
pub const E: u8 = 0x15;
pub const F: u8 = 0x15;
pub const G: u8 = 0x15;
pub const H: u8 = 0x15;
pub const I: u8 = 0x15;
pub const J: u8 = 0x15;
pub const K: u8 = 0x15;
pub const L: u8 = 0x15;
pub const M: u8 = 0x15;
pub const N: u8 = 0x15;
pub const O: u8 = 0x15;
pub const P: u8 = 0x15;
pub const Q: u8 = 0x15;
pub const R: u8 = 0x15;
pub const S: u8 = 0x15;
pub const T: u8 = 0x15;
pub const U: u8 = 0x15;
pub const V: u8 = 0x15;
pub const W: u8 = 0x15;
pub const X: u8 = 0x15;
pub const Y: u8 = 0x15;
pub const Z: u8 = 0x15;

pub const Ae: u8 = 0x15;
pub const Oe: u8 = 0x15;
pub const Aa: u8 = 0x15;
