pub const __builtin_bswap16 = @import("std").zig.c_builtins.__builtin_bswap16;
pub const __builtin_bswap32 = @import("std").zig.c_builtins.__builtin_bswap32;
pub const __builtin_bswap64 = @import("std").zig.c_builtins.__builtin_bswap64;
pub const __builtin_signbit = @import("std").zig.c_builtins.__builtin_signbit;
pub const __builtin_signbitf = @import("std").zig.c_builtins.__builtin_signbitf;
pub const __builtin_popcount = @import("std").zig.c_builtins.__builtin_popcount;
pub const __builtin_ctz = @import("std").zig.c_builtins.__builtin_ctz;
pub const __builtin_clz = @import("std").zig.c_builtins.__builtin_clz;
pub const __builtin_sqrt = @import("std").zig.c_builtins.__builtin_sqrt;
pub const __builtin_sqrtf = @import("std").zig.c_builtins.__builtin_sqrtf;
pub const __builtin_sin = @import("std").zig.c_builtins.__builtin_sin;
pub const __builtin_sinf = @import("std").zig.c_builtins.__builtin_sinf;
pub const __builtin_cos = @import("std").zig.c_builtins.__builtin_cos;
pub const __builtin_cosf = @import("std").zig.c_builtins.__builtin_cosf;
pub const __builtin_exp = @import("std").zig.c_builtins.__builtin_exp;
pub const __builtin_expf = @import("std").zig.c_builtins.__builtin_expf;
pub const __builtin_exp2 = @import("std").zig.c_builtins.__builtin_exp2;
pub const __builtin_exp2f = @import("std").zig.c_builtins.__builtin_exp2f;
pub const __builtin_log = @import("std").zig.c_builtins.__builtin_log;
pub const __builtin_logf = @import("std").zig.c_builtins.__builtin_logf;
pub const __builtin_log2 = @import("std").zig.c_builtins.__builtin_log2;
pub const __builtin_log2f = @import("std").zig.c_builtins.__builtin_log2f;
pub const __builtin_log10 = @import("std").zig.c_builtins.__builtin_log10;
pub const __builtin_log10f = @import("std").zig.c_builtins.__builtin_log10f;
pub const __builtin_abs = @import("std").zig.c_builtins.__builtin_abs;
pub const __builtin_labs = @import("std").zig.c_builtins.__builtin_labs;
pub const __builtin_llabs = @import("std").zig.c_builtins.__builtin_llabs;
pub const __builtin_fabs = @import("std").zig.c_builtins.__builtin_fabs;
pub const __builtin_fabsf = @import("std").zig.c_builtins.__builtin_fabsf;
pub const __builtin_floor = @import("std").zig.c_builtins.__builtin_floor;
pub const __builtin_floorf = @import("std").zig.c_builtins.__builtin_floorf;
pub const __builtin_ceil = @import("std").zig.c_builtins.__builtin_ceil;
pub const __builtin_ceilf = @import("std").zig.c_builtins.__builtin_ceilf;
pub const __builtin_trunc = @import("std").zig.c_builtins.__builtin_trunc;
pub const __builtin_truncf = @import("std").zig.c_builtins.__builtin_truncf;
pub const __builtin_round = @import("std").zig.c_builtins.__builtin_round;
pub const __builtin_roundf = @import("std").zig.c_builtins.__builtin_roundf;
pub const __builtin_strlen = @import("std").zig.c_builtins.__builtin_strlen;
pub const __builtin_strcmp = @import("std").zig.c_builtins.__builtin_strcmp;
pub const __builtin_object_size = @import("std").zig.c_builtins.__builtin_object_size;
pub const __builtin___memset_chk = @import("std").zig.c_builtins.__builtin___memset_chk;
pub const __builtin_memset = @import("std").zig.c_builtins.__builtin_memset;
pub const __builtin___memcpy_chk = @import("std").zig.c_builtins.__builtin___memcpy_chk;
pub const __builtin_memcpy = @import("std").zig.c_builtins.__builtin_memcpy;
pub const __builtin_expect = @import("std").zig.c_builtins.__builtin_expect;
pub const __builtin_nanf = @import("std").zig.c_builtins.__builtin_nanf;
pub const __builtin_huge_valf = @import("std").zig.c_builtins.__builtin_huge_valf;
pub const __builtin_inff = @import("std").zig.c_builtins.__builtin_inff;
pub const __builtin_isnan = @import("std").zig.c_builtins.__builtin_isnan;
pub const __builtin_isinf = @import("std").zig.c_builtins.__builtin_isinf;
pub const __builtin_isinf_sign = @import("std").zig.c_builtins.__builtin_isinf_sign;
pub const __has_builtin = @import("std").zig.c_builtins.__has_builtin;
pub const __builtin_assume = @import("std").zig.c_builtins.__builtin_assume;
pub const __builtin_unreachable = @import("std").zig.c_builtins.__builtin_unreachable;
pub const __builtin_constant_p = @import("std").zig.c_builtins.__builtin_constant_p;
pub const __builtin_mul_overflow = @import("std").zig.c_builtins.__builtin_mul_overflow;
pub const struct___va_list_tag_1 = extern struct {
    gp_offset: c_uint = @import("std").mem.zeroes(c_uint),
    fp_offset: c_uint = @import("std").mem.zeroes(c_uint),
    overflow_arg_area: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    reg_save_area: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const __builtin_va_list = [1]struct___va_list_tag_1;
pub const __gnuc_va_list = __builtin_va_list;
pub const __u_char = u8;
pub const __u_short = c_ushort;
pub const __u_int = c_uint;
pub const __u_long = c_ulong;
pub const __int8_t = i8;
pub const __uint8_t = u8;
pub const __int16_t = c_short;
pub const __uint16_t = c_ushort;
pub const __int32_t = c_int;
pub const __uint32_t = c_uint;
pub const __int64_t = c_long;
pub const __uint64_t = c_ulong;
pub const __int_least8_t = __int8_t;
pub const __uint_least8_t = __uint8_t;
pub const __int_least16_t = __int16_t;
pub const __uint_least16_t = __uint16_t;
pub const __int_least32_t = __int32_t;
pub const __uint_least32_t = __uint32_t;
pub const __int_least64_t = __int64_t;
pub const __uint_least64_t = __uint64_t;
pub const __quad_t = c_long;
pub const __u_quad_t = c_ulong;
pub const __intmax_t = c_long;
pub const __uintmax_t = c_ulong;
pub const __dev_t = c_ulong;
pub const __uid_t = c_uint;
pub const __gid_t = c_uint;
pub const __ino_t = c_ulong;
pub const __ino64_t = c_ulong;
pub const __mode_t = c_uint;
pub const __nlink_t = c_ulong;
pub const __off_t = c_long;
pub const __off64_t = c_long;
pub const __pid_t = c_int;
pub const __fsid_t = extern struct {
    __val: [2]c_int = @import("std").mem.zeroes([2]c_int),
};
pub const __clock_t = c_long;
pub const __rlim_t = c_ulong;
pub const __rlim64_t = c_ulong;
pub const __id_t = c_uint;
pub const __time_t = c_long;
pub const __useconds_t = c_uint;
pub const __suseconds_t = c_long;
pub const __suseconds64_t = c_long;
pub const __daddr_t = c_int;
pub const __key_t = c_int;
pub const __clockid_t = c_int;
pub const __timer_t = ?*anyopaque;
pub const __blksize_t = c_long;
pub const __blkcnt_t = c_long;
pub const __blkcnt64_t = c_long;
pub const __fsblkcnt_t = c_ulong;
pub const __fsblkcnt64_t = c_ulong;
pub const __fsfilcnt_t = c_ulong;
pub const __fsfilcnt64_t = c_ulong;
pub const __fsword_t = c_long;
pub const __ssize_t = c_long;
pub const __syscall_slong_t = c_long;
pub const __syscall_ulong_t = c_ulong;
pub const __loff_t = __off64_t;
pub const __caddr_t = [*c]u8;
pub const __intptr_t = c_long;
pub const __socklen_t = c_uint;
pub const __sig_atomic_t = c_int;
const union_unnamed_2 = extern union {
    __wch: c_uint,
    __wchb: [4]u8,
};
pub const __mbstate_t = extern struct {
    __count: c_int = @import("std").mem.zeroes(c_int),
    __value: union_unnamed_2 = @import("std").mem.zeroes(union_unnamed_2),
};
pub const struct__G_fpos_t = extern struct {
    __pos: __off_t = @import("std").mem.zeroes(__off_t),
    __state: __mbstate_t = @import("std").mem.zeroes(__mbstate_t),
};
pub const __fpos_t = struct__G_fpos_t;
pub const struct__G_fpos64_t = extern struct {
    __pos: __off64_t = @import("std").mem.zeroes(__off64_t),
    __state: __mbstate_t = @import("std").mem.zeroes(__mbstate_t),
};
pub const __fpos64_t = struct__G_fpos64_t;
pub const struct__IO_marker = opaque {};
pub const _IO_lock_t = anyopaque;
pub const struct__IO_codecvt = opaque {};
pub const struct__IO_wide_data = opaque {};
pub const struct__IO_FILE = extern struct {
    _flags: c_int = @import("std").mem.zeroes(c_int),
    _IO_read_ptr: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_read_end: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_read_base: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_write_base: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_write_ptr: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_write_end: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_buf_base: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_buf_end: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_save_base: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_backup_base: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _IO_save_end: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    _markers: ?*struct__IO_marker = @import("std").mem.zeroes(?*struct__IO_marker),
    _chain: [*c]struct__IO_FILE = @import("std").mem.zeroes([*c]struct__IO_FILE),
    _fileno: c_int = @import("std").mem.zeroes(c_int),
    _flags2: c_int = @import("std").mem.zeroes(c_int),
    _old_offset: __off_t = @import("std").mem.zeroes(__off_t),
    _cur_column: c_ushort = @import("std").mem.zeroes(c_ushort),
    _vtable_offset: i8 = @import("std").mem.zeroes(i8),
    _shortbuf: [1]u8 = @import("std").mem.zeroes([1]u8),
    _lock: ?*_IO_lock_t = @import("std").mem.zeroes(?*_IO_lock_t),
    _offset: __off64_t = @import("std").mem.zeroes(__off64_t),
    _codecvt: ?*struct__IO_codecvt = @import("std").mem.zeroes(?*struct__IO_codecvt),
    _wide_data: ?*struct__IO_wide_data = @import("std").mem.zeroes(?*struct__IO_wide_data),
    _freeres_list: [*c]struct__IO_FILE = @import("std").mem.zeroes([*c]struct__IO_FILE),
    _freeres_buf: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    __pad5: usize = @import("std").mem.zeroes(usize),
    _mode: c_int = @import("std").mem.zeroes(c_int),
    _unused2: [20]u8 = @import("std").mem.zeroes([20]u8),
};
pub const __FILE = struct__IO_FILE;
pub const FILE = struct__IO_FILE;
pub const cookie_read_function_t = fn (?*anyopaque, [*c]u8, usize) callconv(.c) __ssize_t;
pub const cookie_write_function_t = fn (?*anyopaque, [*c]const u8, usize) callconv(.c) __ssize_t;
pub const cookie_seek_function_t = fn (?*anyopaque, [*c]__off64_t, c_int) callconv(.c) c_int;
pub const cookie_close_function_t = fn (?*anyopaque) callconv(.c) c_int;
pub const struct__IO_cookie_io_functions_t = extern struct {
    read: ?*const cookie_read_function_t = @import("std").mem.zeroes(?*const cookie_read_function_t),
    write: ?*const cookie_write_function_t = @import("std").mem.zeroes(?*const cookie_write_function_t),
    seek: ?*const cookie_seek_function_t = @import("std").mem.zeroes(?*const cookie_seek_function_t),
    close: ?*const cookie_close_function_t = @import("std").mem.zeroes(?*const cookie_close_function_t),
};
pub const cookie_io_functions_t = struct__IO_cookie_io_functions_t;
pub const va_list = __gnuc_va_list;
pub const off_t = __off_t;
pub const fpos_t = __fpos_t;
pub extern var stdin: [*c]FILE;
pub extern var stdout: [*c]FILE;
pub extern var stderr: [*c]FILE;
pub extern fn remove(__filename: [*c]const u8) c_int;
pub extern fn rename(__old: [*c]const u8, __new: [*c]const u8) c_int;
pub extern fn renameat(__oldfd: c_int, __old: [*c]const u8, __newfd: c_int, __new: [*c]const u8) c_int;
pub extern fn fclose(__stream: [*c]FILE) c_int;
pub extern fn tmpfile() [*c]FILE;
pub extern fn tmpnam([*c]u8) [*c]u8;
pub extern fn tmpnam_r(__s: [*c]u8) [*c]u8;
pub extern fn tempnam(__dir: [*c]const u8, __pfx: [*c]const u8) [*c]u8;
pub extern fn fflush(__stream: [*c]FILE) c_int;
pub extern fn fflush_unlocked(__stream: [*c]FILE) c_int;
pub extern fn fopen(__filename: [*c]const u8, __modes: [*c]const u8) [*c]FILE;
pub extern fn freopen(noalias __filename: [*c]const u8, noalias __modes: [*c]const u8, noalias __stream: [*c]FILE) [*c]FILE;
pub extern fn fdopen(__fd: c_int, __modes: [*c]const u8) [*c]FILE;
pub extern fn fopencookie(noalias __magic_cookie: ?*anyopaque, noalias __modes: [*c]const u8, __io_funcs: cookie_io_functions_t) [*c]FILE;
pub extern fn fmemopen(__s: ?*anyopaque, __len: usize, __modes: [*c]const u8) [*c]FILE;
pub extern fn open_memstream(__bufloc: [*c][*c]u8, __sizeloc: [*c]usize) [*c]FILE;
pub extern fn setbuf(noalias __stream: [*c]FILE, noalias __buf: [*c]u8) void;
pub extern fn setvbuf(noalias __stream: [*c]FILE, noalias __buf: [*c]u8, __modes: c_int, __n: usize) c_int;
pub extern fn setbuffer(noalias __stream: [*c]FILE, noalias __buf: [*c]u8, __size: usize) void;
pub extern fn setlinebuf(__stream: [*c]FILE) void;
pub extern fn fprintf(noalias __stream: [*c]FILE, noalias __format: [*c]const u8, ...) c_int;
pub extern fn printf(__format: [*c]const u8, ...) c_int;
pub extern fn sprintf(noalias __s: [*c]u8, noalias __format: [*c]const u8, ...) c_int;
pub inline fn vfprintf(noalias arg___stream: [*c]FILE, noalias arg___fmt: [*c]const u8, arg___ap: [*c]struct___va_list_tag_1) c_int {
    var __stream = arg___stream;
    _ = &__stream;
    var __fmt = arg___fmt;
    _ = &__fmt;
    var __ap = arg___ap;
    _ = &__ap;
    return __vfprintf_chk(__stream, @as(c_int, 2) - @as(c_int, 1), __fmt, __ap);
}
pub inline fn vprintf(noalias arg___fmt: [*c]const u8, arg___ap: [*c]struct___va_list_tag_1) c_int {
    var __fmt = arg___fmt;
    _ = &__fmt;
    var __ap = arg___ap;
    _ = &__ap;
    return __vfprintf_chk(stdout, @as(c_int, 2) - @as(c_int, 1), __fmt, __ap);
}
// /usr/include/x86_64-linux-gnu/bits/stdio2.h:44:10: warning: TODO implement function '__builtin___vsprintf_chk' in std.zig.c_builtins

// /usr/include/x86_64-linux-gnu/bits/stdio2.h:41:8: warning: unable to translate function, demoted to extern
pub extern fn vsprintf(noalias arg___s: [*c]u8, noalias arg___fmt: [*c]const u8, arg___ap: [*c]struct___va_list_tag_1) c_int;
pub extern fn snprintf(noalias __s: [*c]u8, __maxlen: c_ulong, noalias __format: [*c]const u8, ...) c_int;
// /usr/include/x86_64-linux-gnu/bits/stdio2.h:68:10: warning: TODO implement function '__builtin___vsnprintf_chk' in std.zig.c_builtins

// /usr/include/x86_64-linux-gnu/bits/stdio2.h:65:8: warning: unable to translate function, demoted to extern
pub extern fn vsnprintf(noalias arg___s: [*c]u8, arg___n: c_ulong, noalias arg___fmt: [*c]const u8, arg___ap: [*c]struct___va_list_tag_1) c_int;
pub extern fn vasprintf(noalias __ptr: [*c][*c]u8, noalias __f: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn __asprintf(noalias __ptr: [*c][*c]u8, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn asprintf(noalias __ptr: [*c][*c]u8, noalias __fmt: [*c]const u8, ...) c_int;
pub inline fn vdprintf(arg___fd: c_int, noalias arg___fmt: [*c]const u8, arg___ap: [*c]struct___va_list_tag_1) c_int {
    var __fd = arg___fd;
    _ = &__fd;
    var __fmt = arg___fmt;
    _ = &__fmt;
    var __ap = arg___ap;
    _ = &__ap;
    return __vdprintf_chk(__fd, @as(c_int, 2) - @as(c_int, 1), __fmt, __ap);
}
pub extern fn dprintf(__fd: c_int, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn fscanf(noalias __stream: [*c]FILE, noalias __format: [*c]const u8, ...) c_int;
pub extern fn scanf(noalias __format: [*c]const u8, ...) c_int;
pub extern fn sscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, ...) c_int;
pub const _Float32 = f32;
pub const _Float64 = f64;
pub const _Float32x = f64;
pub const _Float64x = c_longdouble;
pub extern fn vfscanf(noalias __s: [*c]FILE, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn vscanf(noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn vsscanf(noalias __s: [*c]const u8, noalias __format: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn fgetc(__stream: [*c]FILE) c_int;
pub extern fn getc(__stream: [*c]FILE) c_int;
pub fn getchar() callconv(.c) c_int {
    return getc(stdin);
}
pub fn getc_unlocked(arg___fp: [*c]FILE) callconv(.c) c_int {
    var __fp = arg___fp;
    _ = &__fp;
    return if (__builtin_expect(@as(c_long, @intFromBool(__fp.*._IO_read_ptr >= __fp.*._IO_read_end)), @as(c_long, @bitCast(@as(c_long, @as(c_int, 0))))) != 0) __uflow(__fp) else @as(c_int, @bitCast(@as(c_uint, @as([*c]u8, @ptrCast(@alignCast(blk: {
        const ref = &__fp.*._IO_read_ptr;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }))).*)));
}
pub fn getchar_unlocked() callconv(.c) c_int {
    return if (__builtin_expect(@as(c_long, @intFromBool(stdin.*._IO_read_ptr >= stdin.*._IO_read_end)), @as(c_long, @bitCast(@as(c_long, @as(c_int, 0))))) != 0) __uflow(stdin) else @as(c_int, @bitCast(@as(c_uint, @as([*c]u8, @ptrCast(@alignCast(blk: {
        const ref = &stdin.*._IO_read_ptr;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }))).*)));
}
pub fn fgetc_unlocked(arg___fp: [*c]FILE) callconv(.c) c_int {
    var __fp = arg___fp;
    _ = &__fp;
    return if (__builtin_expect(@as(c_long, @intFromBool(__fp.*._IO_read_ptr >= __fp.*._IO_read_end)), @as(c_long, @bitCast(@as(c_long, @as(c_int, 0))))) != 0) __uflow(__fp) else @as(c_int, @bitCast(@as(c_uint, @as([*c]u8, @ptrCast(@alignCast(blk: {
        const ref = &__fp.*._IO_read_ptr;
        const tmp = ref.*;
        ref.* += 1;
        break :blk tmp;
    }))).*)));
}
pub extern fn fputc(__c: c_int, __stream: [*c]FILE) c_int;
pub extern fn putc(__c: c_int, __stream: [*c]FILE) c_int;
pub fn putchar(arg___c: c_int) callconv(.c) c_int {
    var __c = arg___c;
    _ = &__c;
    return putc(__c, stdout);
}
pub fn fputc_unlocked(arg___c: c_int, arg___stream: [*c]FILE) callconv(.c) c_int {
    var __c = arg___c;
    _ = &__c;
    var __stream = arg___stream;
    _ = &__stream;
    return if (__builtin_expect(@as(c_long, @intFromBool(__stream.*._IO_write_ptr >= __stream.*._IO_write_end)), @as(c_long, @bitCast(@as(c_long, @as(c_int, 0))))) != 0) __overflow(__stream, @as(c_int, @bitCast(@as(c_uint, @as(u8, @bitCast(@as(i8, @truncate(__c)))))))) else @as(c_int, @bitCast(@as(c_uint, @as(u8, @bitCast(blk: {
        const tmp = @as(u8, @bitCast(@as(i8, @truncate(__c))));
        (blk_1: {
            const ref = &__stream.*._IO_write_ptr;
            const tmp_2 = ref.*;
            ref.* += 1;
            break :blk_1 tmp_2;
        }).* = tmp;
        break :blk tmp;
    })))));
}
pub fn putc_unlocked(arg___c: c_int, arg___stream: [*c]FILE) callconv(.c) c_int {
    var __c = arg___c;
    _ = &__c;
    var __stream = arg___stream;
    _ = &__stream;
    return if (__builtin_expect(@as(c_long, @intFromBool(__stream.*._IO_write_ptr >= __stream.*._IO_write_end)), @as(c_long, @bitCast(@as(c_long, @as(c_int, 0))))) != 0) __overflow(__stream, @as(c_int, @bitCast(@as(c_uint, @as(u8, @bitCast(@as(i8, @truncate(__c)))))))) else @as(c_int, @bitCast(@as(c_uint, @as(u8, @bitCast(blk: {
        const tmp = @as(u8, @bitCast(@as(i8, @truncate(__c))));
        (blk_1: {
            const ref = &__stream.*._IO_write_ptr;
            const tmp_2 = ref.*;
            ref.* += 1;
            break :blk_1 tmp_2;
        }).* = tmp;
        break :blk tmp;
    })))));
}
pub fn putchar_unlocked(arg___c: c_int) callconv(.c) c_int {
    var __c = arg___c;
    _ = &__c;
    return if (__builtin_expect(@as(c_long, @intFromBool(stdout.*._IO_write_ptr >= stdout.*._IO_write_end)), @as(c_long, @bitCast(@as(c_long, @as(c_int, 0))))) != 0) __overflow(stdout, @as(c_int, @bitCast(@as(c_uint, @as(u8, @bitCast(@as(i8, @truncate(__c)))))))) else @as(c_int, @bitCast(@as(c_uint, @as(u8, @bitCast(blk: {
        const tmp = @as(u8, @bitCast(@as(i8, @truncate(__c))));
        (blk_1: {
            const ref = &stdout.*._IO_write_ptr;
            const tmp_2 = ref.*;
            ref.* += 1;
            break :blk_1 tmp_2;
        }).* = tmp;
        break :blk tmp;
    })))));
}
pub extern fn getw(__stream: [*c]FILE) c_int;
pub extern fn putw(__w: c_int, __stream: [*c]FILE) c_int;
pub inline fn fgets(noalias arg___s: [*c]u8, arg___n: c_int, noalias arg___stream: [*c]FILE) [*c]u8 {
    var __s = arg___s;
    _ = &__s;
    var __n = arg___n;
    _ = &__n;
    var __stream = arg___stream;
    _ = &__stream;
    var sz: usize = __builtin_object_size(@as(?*const anyopaque, @ptrCast(__s)), @intFromBool(@as(c_int, 2) > @as(c_int, 1)));
    _ = &sz;
    if (((__builtin_constant_p(sz) != 0) and (sz == @as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 1)))))) or ((((@as(@TypeOf(__n), @bitCast(@as(c_int, 0))) < @as(@TypeOf(__n), @bitCast(-@as(c_int, 1)))) or ((__builtin_constant_p(__n) != 0) and (__n > @as(c_int, 0)))) and (__builtin_constant_p(@as(c_ulong, @bitCast(@as(c_long, __n))) <= (sz / @sizeOf(u8))) != 0)) and (@as(c_ulong, @bitCast(@as(c_long, __n))) <= (sz / @sizeOf(u8))))) return __fgets_alias(__s, __n, __stream);
    if ((((@as(@TypeOf(__n), @bitCast(@as(c_int, 0))) < @as(@TypeOf(__n), @bitCast(-@as(c_int, 1)))) or ((__builtin_constant_p(__n) != 0) and (__n > @as(c_int, 0)))) and (__builtin_constant_p(@as(c_ulong, @bitCast(@as(c_long, __n))) <= (sz / @sizeOf(u8))) != 0)) and !(@as(c_ulong, @bitCast(@as(c_long, __n))) <= (sz / @sizeOf(u8)))) return __fgets_chk_warn(__s, sz, __n, __stream);
    return __fgets_chk(__s, sz, __n, __stream);
}
pub extern fn __getdelim(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, __delimiter: c_int, noalias __stream: [*c]FILE) __ssize_t;
pub extern fn getdelim(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, __delimiter: c_int, noalias __stream: [*c]FILE) __ssize_t;
pub extern fn getline(noalias __lineptr: [*c][*c]u8, noalias __n: [*c]usize, noalias __stream: [*c]FILE) __ssize_t;
pub extern fn fputs(noalias __s: [*c]const u8, noalias __stream: [*c]FILE) c_int;
pub extern fn puts(__s: [*c]const u8) c_int;
pub extern fn ungetc(__c: c_int, __stream: [*c]FILE) c_int;
pub inline fn fread(arg___ptr: ?*anyopaque, arg___size: c_ulong, arg___n: c_ulong, arg___stream: [*c]FILE) c_ulong {
    var __ptr = arg___ptr;
    _ = &__ptr;
    var __size = arg___size;
    _ = &__size;
    var __n = arg___n;
    _ = &__n;
    var __stream = arg___stream;
    _ = &__stream;
    var sz: usize = __builtin_object_size(__ptr, @as(c_int, 0));
    _ = &sz;
    if (((__builtin_constant_p(sz) != 0) and (sz == @as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 1)))))) or ((((@as(@TypeOf(__n), @bitCast(@as(c_long, @as(c_int, 0)))) < @as(@TypeOf(__n), @bitCast(@as(c_long, -@as(c_int, 1))))) or ((__builtin_constant_p(__n) != 0) and (__n > @as(usize, @bitCast(@as(c_long, @as(c_int, 0))))))) and (__builtin_constant_p(@as(c_ulong, @bitCast(__n)) <= (sz / __size)) != 0)) and (@as(c_ulong, @bitCast(__n)) <= (sz / __size)))) return __fread_alias(__ptr, __size, __n, __stream);
    if ((((@as(@TypeOf(__n), @bitCast(@as(c_long, @as(c_int, 0)))) < @as(@TypeOf(__n), @bitCast(@as(c_long, -@as(c_int, 1))))) or ((__builtin_constant_p(__n) != 0) and (__n > @as(usize, @bitCast(@as(c_long, @as(c_int, 0))))))) and (__builtin_constant_p(@as(c_ulong, @bitCast(__n)) <= (sz / __size)) != 0)) and !(@as(c_ulong, @bitCast(__n)) <= (sz / __size))) return __fread_chk_warn(__ptr, sz, __size, __n, __stream);
    return __fread_chk(__ptr, sz, __size, __n, __stream);
}
pub extern fn fwrite(__ptr: ?*const anyopaque, __size: c_ulong, __n: c_ulong, __s: [*c]FILE) c_ulong;
pub inline fn fread_unlocked(noalias arg___ptr: ?*anyopaque, arg___size: usize, arg___n: usize, noalias arg___stream: [*c]FILE) usize {
    var __ptr = arg___ptr;
    _ = &__ptr;
    var __size = arg___size;
    _ = &__size;
    var __n = arg___n;
    _ = &__n;
    var __stream = arg___stream;
    _ = &__stream;
    var sz: usize = __builtin_object_size(__ptr, @as(c_int, 0));
    _ = &sz;
    if (((__builtin_constant_p(sz) != 0) and (sz == @as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 1)))))) or ((((@as(@TypeOf(__n), @bitCast(@as(c_long, @as(c_int, 0)))) < @as(@TypeOf(__n), @bitCast(@as(c_long, -@as(c_int, 1))))) or ((__builtin_constant_p(__n) != 0) and (__n > @as(usize, @bitCast(@as(c_long, @as(c_int, 0))))))) and (__builtin_constant_p(@as(c_ulong, @bitCast(__n)) <= (sz / __size)) != 0)) and (@as(c_ulong, @bitCast(__n)) <= (sz / __size)))) {
        if ((((__builtin_constant_p(__size) != 0) and (__builtin_constant_p(__n) != 0)) and ((__size | __n) < (@as(usize, @bitCast(@as(c_long, @as(c_int, 1)))) << @intCast((@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 8)))) *% @sizeOf(usize)) / @as(c_ulong, @bitCast(@as(c_long, @as(c_int, 2)))))))) and ((__size *% __n) <= @as(usize, @bitCast(@as(c_long, @as(c_int, 8)))))) {
            var __cnt: usize = __size *% __n;
            _ = &__cnt;
            var __cptr: [*c]u8 = @as([*c]u8, @ptrCast(@alignCast(__ptr)));
            _ = &__cptr;
            if (__cnt == @as(usize, @bitCast(@as(c_long, @as(c_int, 0))))) return 0;
            while (__cnt > @as(usize, @bitCast(@as(c_long, @as(c_int, 0))))) : (__cnt -%= 1) {
                var __c: c_int = getc_unlocked(__stream);
                _ = &__c;
                if (__c == -@as(c_int, 1)) break;
                (blk: {
                    const ref = &__cptr;
                    const tmp = ref.*;
                    ref.* += 1;
                    break :blk tmp;
                }).* = @as(u8, @bitCast(@as(i8, @truncate(__c))));
            }
            return @as(usize, @bitCast(@divExact(@as(c_long, @bitCast(@intFromPtr(__cptr) -% @intFromPtr(@as([*c]u8, @ptrCast(@alignCast(__ptr)))))), @sizeOf(u8)))) / __size;
        }
        return __fread_unlocked_alias(__ptr, __size, __n, __stream);
    }
    if ((((@as(@TypeOf(__n), @bitCast(@as(c_long, @as(c_int, 0)))) < @as(@TypeOf(__n), @bitCast(@as(c_long, -@as(c_int, 1))))) or ((__builtin_constant_p(__n) != 0) and (__n > @as(usize, @bitCast(@as(c_long, @as(c_int, 0))))))) and (__builtin_constant_p(@as(c_ulong, @bitCast(__n)) <= (sz / __size)) != 0)) and !(@as(c_ulong, @bitCast(__n)) <= (sz / __size))) return __fread_unlocked_chk_warn(__ptr, sz, __size, __n, __stream);
    return __fread_unlocked_chk(__ptr, sz, __size, __n, __stream);
}
pub extern fn fwrite_unlocked(noalias __ptr: ?*const anyopaque, __size: usize, __n: usize, noalias __stream: [*c]FILE) usize;
pub extern fn fseek(__stream: [*c]FILE, __off: c_long, __whence: c_int) c_int;
pub extern fn ftell(__stream: [*c]FILE) c_long;
pub extern fn rewind(__stream: [*c]FILE) void;
pub extern fn fseeko(__stream: [*c]FILE, __off: __off_t, __whence: c_int) c_int;
pub extern fn ftello(__stream: [*c]FILE) __off_t;
pub extern fn fgetpos(noalias __stream: [*c]FILE, noalias __pos: [*c]fpos_t) c_int;
pub extern fn fsetpos(__stream: [*c]FILE, __pos: [*c]const fpos_t) c_int;
pub extern fn clearerr(__stream: [*c]FILE) void;
pub extern fn feof(__stream: [*c]FILE) c_int;
pub extern fn ferror(__stream: [*c]FILE) c_int;
pub extern fn clearerr_unlocked(__stream: [*c]FILE) void;
pub fn feof_unlocked(arg___stream: [*c]FILE) callconv(.c) c_int {
    var __stream = arg___stream;
    _ = &__stream;
    return @intFromBool((__stream.*._flags & @as(c_int, 16)) != @as(c_int, 0));
}
pub fn ferror_unlocked(arg___stream: [*c]FILE) callconv(.c) c_int {
    var __stream = arg___stream;
    _ = &__stream;
    return @intFromBool((__stream.*._flags & @as(c_int, 32)) != @as(c_int, 0));
}
pub extern fn perror(__s: [*c]const u8) void;
pub extern fn fileno(__stream: [*c]FILE) c_int;
pub extern fn fileno_unlocked(__stream: [*c]FILE) c_int;
pub extern fn pclose(__stream: [*c]FILE) c_int;
pub extern fn popen(__command: [*c]const u8, __modes: [*c]const u8) [*c]FILE;
pub extern fn ctermid(__s: [*c]u8) [*c]u8;
pub extern fn flockfile(__stream: [*c]FILE) void;
pub extern fn ftrylockfile(__stream: [*c]FILE) c_int;
pub extern fn funlockfile(__stream: [*c]FILE) void;
pub extern fn __uflow([*c]FILE) c_int;
pub extern fn __overflow([*c]FILE, c_int) c_int;
pub extern fn __sprintf_chk(noalias __s: [*c]u8, __flag: c_int, __slen: usize, noalias __format: [*c]const u8, ...) c_int;
pub extern fn __vsprintf_chk(noalias __s: [*c]u8, __flag: c_int, __slen: usize, noalias __format: [*c]const u8, __ap: [*c]struct___va_list_tag_1) c_int;
pub extern fn __snprintf_chk(noalias __s: [*c]u8, __n: usize, __flag: c_int, __slen: usize, noalias __format: [*c]const u8, ...) c_int;
pub extern fn __vsnprintf_chk(noalias __s: [*c]u8, __n: usize, __flag: c_int, __slen: usize, noalias __format: [*c]const u8, __ap: [*c]struct___va_list_tag_1) c_int;
pub extern fn __fprintf_chk(noalias __stream: [*c]FILE, __flag: c_int, noalias __format: [*c]const u8, ...) c_int;
pub extern fn __printf_chk(__flag: c_int, noalias __format: [*c]const u8, ...) c_int;
pub extern fn __vfprintf_chk(noalias __stream: [*c]FILE, __flag: c_int, noalias __format: [*c]const u8, __ap: [*c]struct___va_list_tag_1) c_int;
pub extern fn __vprintf_chk(__flag: c_int, noalias __format: [*c]const u8, __ap: [*c]struct___va_list_tag_1) c_int;
pub extern fn __dprintf_chk(__fd: c_int, __flag: c_int, noalias __fmt: [*c]const u8, ...) c_int;
pub extern fn __vdprintf_chk(__fd: c_int, __flag: c_int, noalias __fmt: [*c]const u8, __arg: [*c]struct___va_list_tag_1) c_int;
pub extern fn __fgets_alias(noalias __s: [*c]u8, __n: c_int, noalias __stream: [*c]FILE) [*c]u8;
pub extern fn __fgets_chk_warn(noalias __s: [*c]u8, __size: usize, __n: c_int, noalias __stream: [*c]FILE) [*c]u8;
pub extern fn __fgets_chk(noalias __s: [*c]u8, __size: usize, __n: c_int, noalias __stream: [*c]FILE) [*c]u8;
pub extern fn __fread_alias(noalias __ptr: ?*anyopaque, __size: usize, __n: usize, noalias __stream: [*c]FILE) usize;
pub extern fn __fread_chk_warn(noalias __ptr: ?*anyopaque, __ptrlen: usize, __size: usize, __n: usize, noalias __stream: [*c]FILE) usize;
pub extern fn __fread_chk(noalias __ptr: ?*anyopaque, __ptrlen: usize, __size: usize, __n: usize, noalias __stream: [*c]FILE) usize;
pub extern fn __fread_unlocked_alias(noalias __ptr: ?*anyopaque, __size: usize, __n: usize, noalias __stream: [*c]FILE) usize;
pub extern fn __fread_unlocked_chk_warn(noalias __ptr: ?*anyopaque, __ptrlen: usize, __size: usize, __n: usize, noalias __stream: [*c]FILE) usize;
pub extern fn __fread_unlocked_chk(noalias __ptr: ?*anyopaque, __ptrlen: usize, __size: usize, __n: usize, noalias __stream: [*c]FILE) usize;
pub const xmlChar = u8;
pub extern fn xmlStrdup(cur: [*c]const xmlChar) [*c]xmlChar;
pub extern fn xmlStrndup(cur: [*c]const xmlChar, len: c_int) [*c]xmlChar;
pub extern fn xmlCharStrndup(cur: [*c]const u8, len: c_int) [*c]xmlChar;
pub extern fn xmlCharStrdup(cur: [*c]const u8) [*c]xmlChar;
pub extern fn xmlStrsub(str: [*c]const xmlChar, start: c_int, len: c_int) [*c]xmlChar;
pub extern fn xmlStrchr(str: [*c]const xmlChar, val: xmlChar) [*c]const xmlChar;
pub extern fn xmlStrstr(str: [*c]const xmlChar, val: [*c]const xmlChar) [*c]const xmlChar;
pub extern fn xmlStrcasestr(str: [*c]const xmlChar, val: [*c]const xmlChar) [*c]const xmlChar;
pub extern fn xmlStrcmp(str1: [*c]const xmlChar, str2: [*c]const xmlChar) c_int;
pub extern fn xmlStrncmp(str1: [*c]const xmlChar, str2: [*c]const xmlChar, len: c_int) c_int;
pub extern fn xmlStrcasecmp(str1: [*c]const xmlChar, str2: [*c]const xmlChar) c_int;
pub extern fn xmlStrncasecmp(str1: [*c]const xmlChar, str2: [*c]const xmlChar, len: c_int) c_int;
pub extern fn xmlStrEqual(str1: [*c]const xmlChar, str2: [*c]const xmlChar) c_int;
pub extern fn xmlStrQEqual(pref: [*c]const xmlChar, name: [*c]const xmlChar, str: [*c]const xmlChar) c_int;
pub extern fn xmlStrlen(str: [*c]const xmlChar) c_int;
pub extern fn xmlStrcat(cur: [*c]xmlChar, add: [*c]const xmlChar) [*c]xmlChar;
pub extern fn xmlStrncat(cur: [*c]xmlChar, add: [*c]const xmlChar, len: c_int) [*c]xmlChar;
pub extern fn xmlStrncatNew(str1: [*c]const xmlChar, str2: [*c]const xmlChar, len: c_int) [*c]xmlChar;
pub extern fn xmlStrPrintf(buf: [*c]xmlChar, len: c_int, msg: [*c]const u8, ...) c_int;
pub extern fn xmlStrVPrintf(buf: [*c]xmlChar, len: c_int, msg: [*c]const u8, ap: [*c]struct___va_list_tag_1) c_int;
pub extern fn xmlGetUTF8Char(utf: [*c]const u8, len: [*c]c_int) c_int;
pub extern fn xmlCheckUTF8(utf: [*c]const u8) c_int;
pub extern fn xmlUTF8Strsize(utf: [*c]const xmlChar, len: c_int) c_int;
pub extern fn xmlUTF8Strndup(utf: [*c]const xmlChar, len: c_int) [*c]xmlChar;
pub extern fn xmlUTF8Strpos(utf: [*c]const xmlChar, pos: c_int) [*c]const xmlChar;
pub extern fn xmlUTF8Strloc(utf: [*c]const xmlChar, utfchar: [*c]const xmlChar) c_int;
pub extern fn xmlUTF8Strsub(utf: [*c]const xmlChar, start: c_int, len: c_int) [*c]xmlChar;
pub extern fn xmlUTF8Strlen(utf: [*c]const xmlChar) c_int;
pub extern fn xmlUTF8Size(utf: [*c]const xmlChar) c_int;
pub extern fn xmlUTF8Charcmp(utf1: [*c]const xmlChar, utf2: [*c]const xmlChar) c_int;
pub const xmlInputReadCallback = ?*const fn (?*anyopaque, [*c]u8, c_int) callconv(.c) c_int;
pub const xmlInputCloseCallback = ?*const fn (?*anyopaque) callconv(.c) c_int;
pub const xmlCharEncodingInputFunc = ?*const fn ([*c]u8, [*c]c_int, [*c]const u8, [*c]c_int) callconv(.c) c_int;
pub const xmlCharEncodingOutputFunc = ?*const fn ([*c]u8, [*c]c_int, [*c]const u8, [*c]c_int) callconv(.c) c_int;
pub const struct__xmlCharEncodingHandler = extern struct {
    name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    input: xmlCharEncodingInputFunc = @import("std").mem.zeroes(xmlCharEncodingInputFunc),
    output: xmlCharEncodingOutputFunc = @import("std").mem.zeroes(xmlCharEncodingOutputFunc),
};
pub const xmlCharEncodingHandler = struct__xmlCharEncodingHandler;
pub const xmlCharEncodingHandlerPtr = [*c]xmlCharEncodingHandler;
pub const struct__xmlBuf = opaque {};
pub const xmlBuf = struct__xmlBuf;
pub const xmlBufPtr = ?*xmlBuf;
pub const struct__xmlParserInputBuffer = extern struct {
    context: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    readcallback: xmlInputReadCallback = @import("std").mem.zeroes(xmlInputReadCallback),
    closecallback: xmlInputCloseCallback = @import("std").mem.zeroes(xmlInputCloseCallback),
    encoder: xmlCharEncodingHandlerPtr = @import("std").mem.zeroes(xmlCharEncodingHandlerPtr),
    buffer: xmlBufPtr = @import("std").mem.zeroes(xmlBufPtr),
    raw: xmlBufPtr = @import("std").mem.zeroes(xmlBufPtr),
    compressed: c_int = @import("std").mem.zeroes(c_int),
    @"error": c_int = @import("std").mem.zeroes(c_int),
    rawconsumed: c_ulong = @import("std").mem.zeroes(c_ulong),
};
pub const xmlParserInputBuffer = struct__xmlParserInputBuffer;
pub const xmlParserInputBufferPtr = [*c]xmlParserInputBuffer;
pub const struct__xmlOutputBuffer = opaque {};
pub const xmlOutputBuffer = struct__xmlOutputBuffer;
pub const xmlOutputBufferPtr = ?*xmlOutputBuffer;
pub const xmlParserInputDeallocate = ?*const fn ([*c]xmlChar) callconv(.c) void;
pub const struct__xmlDtd = extern struct {
    _private: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    type: xmlElementType = @import("std").mem.zeroes(xmlElementType),
    name: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    children: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    last: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    parent: [*c]struct__xmlDoc = @import("std").mem.zeroes([*c]struct__xmlDoc),
    next: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    prev: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    doc: [*c]struct__xmlDoc = @import("std").mem.zeroes([*c]struct__xmlDoc),
    notations: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    elements: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    attributes: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    entities: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    ExternalID: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    SystemID: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    pentities: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const xmlNsType = xmlElementType;
pub const struct__xmlNs = extern struct {
    next: [*c]struct__xmlNs = @import("std").mem.zeroes([*c]struct__xmlNs),
    type: xmlNsType = @import("std").mem.zeroes(xmlNsType),
    href: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    prefix: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    _private: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    context: [*c]struct__xmlDoc = @import("std").mem.zeroes([*c]struct__xmlDoc),
};
pub const struct__xmlDict_3 = opaque {};
pub const struct__xmlDoc = extern struct {
    _private: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    type: xmlElementType = @import("std").mem.zeroes(xmlElementType),
    name: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    children: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    last: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    parent: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    next: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    prev: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    doc: [*c]struct__xmlDoc = @import("std").mem.zeroes([*c]struct__xmlDoc),
    compression: c_int = @import("std").mem.zeroes(c_int),
    standalone: c_int = @import("std").mem.zeroes(c_int),
    intSubset: [*c]struct__xmlDtd = @import("std").mem.zeroes([*c]struct__xmlDtd),
    extSubset: [*c]struct__xmlDtd = @import("std").mem.zeroes([*c]struct__xmlDtd),
    oldNs: [*c]struct__xmlNs = @import("std").mem.zeroes([*c]struct__xmlNs),
    version: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    encoding: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    ids: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    refs: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    URL: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    charset: c_int = @import("std").mem.zeroes(c_int),
    dict: ?*struct__xmlDict_3 = @import("std").mem.zeroes(?*struct__xmlDict_3),
    psvi: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    parseFlags: c_int = @import("std").mem.zeroes(c_int),
    properties: c_int = @import("std").mem.zeroes(c_int),
};
pub const xmlNs = struct__xmlNs;
pub const struct__xmlAttr = extern struct {
    _private: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    type: xmlElementType = @import("std").mem.zeroes(xmlElementType),
    name: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    children: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    last: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    parent: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    next: [*c]struct__xmlAttr = @import("std").mem.zeroes([*c]struct__xmlAttr),
    prev: [*c]struct__xmlAttr = @import("std").mem.zeroes([*c]struct__xmlAttr),
    doc: [*c]struct__xmlDoc = @import("std").mem.zeroes([*c]struct__xmlDoc),
    ns: [*c]xmlNs = @import("std").mem.zeroes([*c]xmlNs),
    atype: xmlAttributeType = @import("std").mem.zeroes(xmlAttributeType),
    psvi: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const struct__xmlNode = extern struct {
    _private: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    type: xmlElementType = @import("std").mem.zeroes(xmlElementType),
    name: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    children: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    last: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    parent: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    next: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    prev: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    doc: [*c]struct__xmlDoc = @import("std").mem.zeroes([*c]struct__xmlDoc),
    ns: [*c]xmlNs = @import("std").mem.zeroes([*c]xmlNs),
    content: [*c]xmlChar = @import("std").mem.zeroes([*c]xmlChar),
    properties: [*c]struct__xmlAttr = @import("std").mem.zeroes([*c]struct__xmlAttr),
    nsDef: [*c]xmlNs = @import("std").mem.zeroes([*c]xmlNs),
    psvi: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    line: c_ushort = @import("std").mem.zeroes(c_ushort),
    extra: c_ushort = @import("std").mem.zeroes(c_ushort),
};
pub const struct__xmlEntity = extern struct {
    _private: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    type: xmlElementType = @import("std").mem.zeroes(xmlElementType),
    name: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    children: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    last: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    parent: [*c]struct__xmlDtd = @import("std").mem.zeroes([*c]struct__xmlDtd),
    next: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    prev: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    doc: [*c]struct__xmlDoc = @import("std").mem.zeroes([*c]struct__xmlDoc),
    orig: [*c]xmlChar = @import("std").mem.zeroes([*c]xmlChar),
    content: [*c]xmlChar = @import("std").mem.zeroes([*c]xmlChar),
    length: c_int = @import("std").mem.zeroes(c_int),
    etype: xmlEntityType = @import("std").mem.zeroes(xmlEntityType),
    ExternalID: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    SystemID: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    nexte: [*c]struct__xmlEntity = @import("std").mem.zeroes([*c]struct__xmlEntity),
    URI: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    owner: c_int = @import("std").mem.zeroes(c_int),
    flags: c_int = @import("std").mem.zeroes(c_int),
    expandedSize: c_ulong = @import("std").mem.zeroes(c_ulong),
};
pub const xmlEntity = struct__xmlEntity;
pub const xmlEntityPtr = [*c]xmlEntity;
pub const struct__xmlParserInput = extern struct {
    buf: xmlParserInputBufferPtr = @import("std").mem.zeroes(xmlParserInputBufferPtr),
    filename: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    directory: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    base: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    cur: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    end: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    length: c_int = @import("std").mem.zeroes(c_int),
    line: c_int = @import("std").mem.zeroes(c_int),
    col: c_int = @import("std").mem.zeroes(c_int),
    consumed: c_ulong = @import("std").mem.zeroes(c_ulong),
    free: xmlParserInputDeallocate = @import("std").mem.zeroes(xmlParserInputDeallocate),
    encoding: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    version: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    standalone: c_int = @import("std").mem.zeroes(c_int),
    id: c_int = @import("std").mem.zeroes(c_int),
    parentConsumed: c_ulong = @import("std").mem.zeroes(c_ulong),
    entity: xmlEntityPtr = @import("std").mem.zeroes(xmlEntityPtr),
};
pub const xmlParserInput = struct__xmlParserInput;
pub const xmlParserInputPtr = [*c]xmlParserInput;
pub const internalSubsetSAXFunc = ?*const fn (?*anyopaque, [*c]const xmlChar, [*c]const xmlChar, [*c]const xmlChar) callconv(.c) void;
pub const isStandaloneSAXFunc = ?*const fn (?*anyopaque) callconv(.c) c_int;
pub const hasInternalSubsetSAXFunc = ?*const fn (?*anyopaque) callconv(.c) c_int;
pub const hasExternalSubsetSAXFunc = ?*const fn (?*anyopaque) callconv(.c) c_int;
pub const resolveEntitySAXFunc = ?*const fn (?*anyopaque, [*c]const xmlChar, [*c]const xmlChar) callconv(.c) xmlParserInputPtr;
pub const getEntitySAXFunc = ?*const fn (?*anyopaque, [*c]const xmlChar) callconv(.c) xmlEntityPtr;
pub const entityDeclSAXFunc = ?*const fn (?*anyopaque, [*c]const xmlChar, c_int, [*c]const xmlChar, [*c]const xmlChar, [*c]xmlChar) callconv(.c) void;
pub const notationDeclSAXFunc = ?*const fn (?*anyopaque, [*c]const xmlChar, [*c]const xmlChar, [*c]const xmlChar) callconv(.c) void;
pub const struct__xmlEnumeration = extern struct {
    next: [*c]struct__xmlEnumeration = @import("std").mem.zeroes([*c]struct__xmlEnumeration),
    name: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
};
pub const xmlEnumeration = struct__xmlEnumeration;
pub const xmlEnumerationPtr = [*c]xmlEnumeration;
pub const attributeDeclSAXFunc = ?*const fn (?*anyopaque, [*c]const xmlChar, [*c]const xmlChar, c_int, c_int, [*c]const xmlChar, xmlEnumerationPtr) callconv(.c) void;
pub const struct__xmlElementContent = extern struct {
    type: xmlElementContentType = @import("std").mem.zeroes(xmlElementContentType),
    ocur: xmlElementContentOccur = @import("std").mem.zeroes(xmlElementContentOccur),
    name: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    c1: [*c]struct__xmlElementContent = @import("std").mem.zeroes([*c]struct__xmlElementContent),
    c2: [*c]struct__xmlElementContent = @import("std").mem.zeroes([*c]struct__xmlElementContent),
    parent: [*c]struct__xmlElementContent = @import("std").mem.zeroes([*c]struct__xmlElementContent),
    prefix: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
};
pub const xmlElementContent = struct__xmlElementContent;
pub const xmlElementContentPtr = [*c]xmlElementContent;
pub const elementDeclSAXFunc = ?*const fn (?*anyopaque, [*c]const xmlChar, c_int, xmlElementContentPtr) callconv(.c) void;
pub const unparsedEntityDeclSAXFunc = ?*const fn (?*anyopaque, [*c]const xmlChar, [*c]const xmlChar, [*c]const xmlChar, [*c]const xmlChar) callconv(.c) void;
pub const struct__xmlSAXLocator = extern struct {
    getPublicId: ?*const fn (?*anyopaque) callconv(.c) [*c]const xmlChar = @import("std").mem.zeroes(?*const fn (?*anyopaque) callconv(.c) [*c]const xmlChar),
    getSystemId: ?*const fn (?*anyopaque) callconv(.c) [*c]const xmlChar = @import("std").mem.zeroes(?*const fn (?*anyopaque) callconv(.c) [*c]const xmlChar),
    getLineNumber: ?*const fn (?*anyopaque) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn (?*anyopaque) callconv(.c) c_int),
    getColumnNumber: ?*const fn (?*anyopaque) callconv(.c) c_int = @import("std").mem.zeroes(?*const fn (?*anyopaque) callconv(.c) c_int),
};
pub const xmlSAXLocator = struct__xmlSAXLocator;
pub const xmlSAXLocatorPtr = [*c]xmlSAXLocator;
pub const setDocumentLocatorSAXFunc = ?*const fn (?*anyopaque, xmlSAXLocatorPtr) callconv(.c) void;
pub const startDocumentSAXFunc = ?*const fn (?*anyopaque) callconv(.c) void;
pub const endDocumentSAXFunc = ?*const fn (?*anyopaque) callconv(.c) void;
pub const startElementSAXFunc = ?*const fn (?*anyopaque, [*c]const xmlChar, [*c][*c]const xmlChar) callconv(.c) void;
pub const endElementSAXFunc = ?*const fn (?*anyopaque, [*c]const xmlChar) callconv(.c) void;
pub const referenceSAXFunc = ?*const fn (?*anyopaque, [*c]const xmlChar) callconv(.c) void;
pub const charactersSAXFunc = ?*const fn (?*anyopaque, [*c]const xmlChar, c_int) callconv(.c) void;
pub const ignorableWhitespaceSAXFunc = ?*const fn (?*anyopaque, [*c]const xmlChar, c_int) callconv(.c) void;
pub const processingInstructionSAXFunc = ?*const fn (?*anyopaque, [*c]const xmlChar, [*c]const xmlChar) callconv(.c) void;
pub const commentSAXFunc = ?*const fn (?*anyopaque, [*c]const xmlChar) callconv(.c) void;
pub const warningSAXFunc = ?*const fn (?*anyopaque, [*c]const u8, ...) callconv(.c) void;
pub const errorSAXFunc = ?*const fn (?*anyopaque, [*c]const u8, ...) callconv(.c) void;
pub const fatalErrorSAXFunc = ?*const fn (?*anyopaque, [*c]const u8, ...) callconv(.c) void;
pub const getParameterEntitySAXFunc = ?*const fn (?*anyopaque, [*c]const xmlChar) callconv(.c) xmlEntityPtr;
pub const cdataBlockSAXFunc = ?*const fn (?*anyopaque, [*c]const xmlChar, c_int) callconv(.c) void;
pub const externalSubsetSAXFunc = ?*const fn (?*anyopaque, [*c]const xmlChar, [*c]const xmlChar, [*c]const xmlChar) callconv(.c) void;
pub const startElementNsSAX2Func = ?*const fn (?*anyopaque, [*c]const xmlChar, [*c]const xmlChar, [*c]const xmlChar, c_int, [*c][*c]const xmlChar, c_int, c_int, [*c][*c]const xmlChar) callconv(.c) void;
pub const endElementNsSAX2Func = ?*const fn (?*anyopaque, [*c]const xmlChar, [*c]const xmlChar, [*c]const xmlChar) callconv(.c) void;
pub const struct__xmlError = extern struct {
    domain: c_int = @import("std").mem.zeroes(c_int),
    code: c_int = @import("std").mem.zeroes(c_int),
    message: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    level: xmlErrorLevel = @import("std").mem.zeroes(xmlErrorLevel),
    file: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    line: c_int = @import("std").mem.zeroes(c_int),
    str1: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    str2: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    str3: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    int1: c_int = @import("std").mem.zeroes(c_int),
    int2: c_int = @import("std").mem.zeroes(c_int),
    ctxt: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    node: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const xmlError = struct__xmlError;
pub const xmlErrorPtr = [*c]xmlError;
pub const xmlStructuredErrorFunc = ?*const fn (?*anyopaque, xmlErrorPtr) callconv(.c) void;
pub const struct__xmlSAXHandler = extern struct {
    internalSubset: internalSubsetSAXFunc = @import("std").mem.zeroes(internalSubsetSAXFunc),
    isStandalone: isStandaloneSAXFunc = @import("std").mem.zeroes(isStandaloneSAXFunc),
    hasInternalSubset: hasInternalSubsetSAXFunc = @import("std").mem.zeroes(hasInternalSubsetSAXFunc),
    hasExternalSubset: hasExternalSubsetSAXFunc = @import("std").mem.zeroes(hasExternalSubsetSAXFunc),
    resolveEntity: resolveEntitySAXFunc = @import("std").mem.zeroes(resolveEntitySAXFunc),
    getEntity: getEntitySAXFunc = @import("std").mem.zeroes(getEntitySAXFunc),
    entityDecl: entityDeclSAXFunc = @import("std").mem.zeroes(entityDeclSAXFunc),
    notationDecl: notationDeclSAXFunc = @import("std").mem.zeroes(notationDeclSAXFunc),
    attributeDecl: attributeDeclSAXFunc = @import("std").mem.zeroes(attributeDeclSAXFunc),
    elementDecl: elementDeclSAXFunc = @import("std").mem.zeroes(elementDeclSAXFunc),
    unparsedEntityDecl: unparsedEntityDeclSAXFunc = @import("std").mem.zeroes(unparsedEntityDeclSAXFunc),
    setDocumentLocator: setDocumentLocatorSAXFunc = @import("std").mem.zeroes(setDocumentLocatorSAXFunc),
    startDocument: startDocumentSAXFunc = @import("std").mem.zeroes(startDocumentSAXFunc),
    endDocument: endDocumentSAXFunc = @import("std").mem.zeroes(endDocumentSAXFunc),
    startElement: startElementSAXFunc = @import("std").mem.zeroes(startElementSAXFunc),
    endElement: endElementSAXFunc = @import("std").mem.zeroes(endElementSAXFunc),
    reference: referenceSAXFunc = @import("std").mem.zeroes(referenceSAXFunc),
    characters: charactersSAXFunc = @import("std").mem.zeroes(charactersSAXFunc),
    ignorableWhitespace: ignorableWhitespaceSAXFunc = @import("std").mem.zeroes(ignorableWhitespaceSAXFunc),
    processingInstruction: processingInstructionSAXFunc = @import("std").mem.zeroes(processingInstructionSAXFunc),
    comment: commentSAXFunc = @import("std").mem.zeroes(commentSAXFunc),
    warning: warningSAXFunc = @import("std").mem.zeroes(warningSAXFunc),
    @"error": errorSAXFunc = @import("std").mem.zeroes(errorSAXFunc),
    fatalError: fatalErrorSAXFunc = @import("std").mem.zeroes(fatalErrorSAXFunc),
    getParameterEntity: getParameterEntitySAXFunc = @import("std").mem.zeroes(getParameterEntitySAXFunc),
    cdataBlock: cdataBlockSAXFunc = @import("std").mem.zeroes(cdataBlockSAXFunc),
    externalSubset: externalSubsetSAXFunc = @import("std").mem.zeroes(externalSubsetSAXFunc),
    initialized: c_uint = @import("std").mem.zeroes(c_uint),
    _private: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    startElementNs: startElementNsSAX2Func = @import("std").mem.zeroes(startElementNsSAX2Func),
    endElementNs: endElementNsSAX2Func = @import("std").mem.zeroes(endElementNsSAX2Func),
    serror: xmlStructuredErrorFunc = @import("std").mem.zeroes(xmlStructuredErrorFunc),
};
pub const xmlDoc = struct__xmlDoc;
pub const xmlDocPtr = [*c]xmlDoc;
pub const xmlNode = struct__xmlNode;
pub const xmlNodePtr = [*c]xmlNode;
pub const struct__xmlParserNodeInfo = extern struct {
    node: [*c]const struct__xmlNode = @import("std").mem.zeroes([*c]const struct__xmlNode),
    begin_pos: c_ulong = @import("std").mem.zeroes(c_ulong),
    begin_line: c_ulong = @import("std").mem.zeroes(c_ulong),
    end_pos: c_ulong = @import("std").mem.zeroes(c_ulong),
    end_line: c_ulong = @import("std").mem.zeroes(c_ulong),
};
pub const xmlParserNodeInfo = struct__xmlParserNodeInfo;
pub const struct__xmlParserNodeInfoSeq = extern struct {
    maximum: c_ulong = @import("std").mem.zeroes(c_ulong),
    length: c_ulong = @import("std").mem.zeroes(c_ulong),
    buffer: [*c]xmlParserNodeInfo = @import("std").mem.zeroes([*c]xmlParserNodeInfo),
};
pub const xmlParserNodeInfoSeq = struct__xmlParserNodeInfoSeq;
pub const xmlValidityErrorFunc = ?*const fn (?*anyopaque, [*c]const u8, ...) callconv(.c) void;
pub const xmlValidityWarningFunc = ?*const fn (?*anyopaque, [*c]const u8, ...) callconv(.c) void;
pub const struct__xmlValidState = opaque {};
pub const xmlValidState = struct__xmlValidState;
pub const struct__xmlValidCtxt = extern struct {
    userData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    @"error": xmlValidityErrorFunc = @import("std").mem.zeroes(xmlValidityErrorFunc),
    warning: xmlValidityWarningFunc = @import("std").mem.zeroes(xmlValidityWarningFunc),
    node: xmlNodePtr = @import("std").mem.zeroes(xmlNodePtr),
    nodeNr: c_int = @import("std").mem.zeroes(c_int),
    nodeMax: c_int = @import("std").mem.zeroes(c_int),
    nodeTab: [*c]xmlNodePtr = @import("std").mem.zeroes([*c]xmlNodePtr),
    flags: c_uint = @import("std").mem.zeroes(c_uint),
    doc: xmlDocPtr = @import("std").mem.zeroes(xmlDocPtr),
    valid: c_int = @import("std").mem.zeroes(c_int),
    vstate: ?*xmlValidState = @import("std").mem.zeroes(?*xmlValidState),
    vstateNr: c_int = @import("std").mem.zeroes(c_int),
    vstateMax: c_int = @import("std").mem.zeroes(c_int),
    vstateTab: ?*xmlValidState = @import("std").mem.zeroes(?*xmlValidState),
    am: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    state: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const xmlValidCtxt = struct__xmlValidCtxt;
pub const xmlDict = struct__xmlDict_3;
pub const xmlDictPtr = ?*xmlDict;
pub const struct__xmlStartTag = opaque {};
pub const xmlStartTag = struct__xmlStartTag;
pub const struct__xmlHashTable = opaque {};
pub const xmlHashTable = struct__xmlHashTable;
pub const xmlHashTablePtr = ?*xmlHashTable;
pub const xmlAttr = struct__xmlAttr;
pub const xmlAttrPtr = [*c]xmlAttr;
pub const struct__xmlParserCtxt = extern struct {
    sax: [*c]struct__xmlSAXHandler = @import("std").mem.zeroes([*c]struct__xmlSAXHandler),
    userData: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    myDoc: xmlDocPtr = @import("std").mem.zeroes(xmlDocPtr),
    wellFormed: c_int = @import("std").mem.zeroes(c_int),
    replaceEntities: c_int = @import("std").mem.zeroes(c_int),
    version: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    encoding: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    standalone: c_int = @import("std").mem.zeroes(c_int),
    html: c_int = @import("std").mem.zeroes(c_int),
    input: xmlParserInputPtr = @import("std").mem.zeroes(xmlParserInputPtr),
    inputNr: c_int = @import("std").mem.zeroes(c_int),
    inputMax: c_int = @import("std").mem.zeroes(c_int),
    inputTab: [*c]xmlParserInputPtr = @import("std").mem.zeroes([*c]xmlParserInputPtr),
    node: xmlNodePtr = @import("std").mem.zeroes(xmlNodePtr),
    nodeNr: c_int = @import("std").mem.zeroes(c_int),
    nodeMax: c_int = @import("std").mem.zeroes(c_int),
    nodeTab: [*c]xmlNodePtr = @import("std").mem.zeroes([*c]xmlNodePtr),
    record_info: c_int = @import("std").mem.zeroes(c_int),
    node_seq: xmlParserNodeInfoSeq = @import("std").mem.zeroes(xmlParserNodeInfoSeq),
    errNo: c_int = @import("std").mem.zeroes(c_int),
    hasExternalSubset: c_int = @import("std").mem.zeroes(c_int),
    hasPErefs: c_int = @import("std").mem.zeroes(c_int),
    external: c_int = @import("std").mem.zeroes(c_int),
    valid: c_int = @import("std").mem.zeroes(c_int),
    validate: c_int = @import("std").mem.zeroes(c_int),
    vctxt: xmlValidCtxt = @import("std").mem.zeroes(xmlValidCtxt),
    instate: xmlParserInputState = @import("std").mem.zeroes(xmlParserInputState),
    token: c_int = @import("std").mem.zeroes(c_int),
    directory: [*c]u8 = @import("std").mem.zeroes([*c]u8),
    name: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    nameNr: c_int = @import("std").mem.zeroes(c_int),
    nameMax: c_int = @import("std").mem.zeroes(c_int),
    nameTab: [*c][*c]const xmlChar = @import("std").mem.zeroes([*c][*c]const xmlChar),
    nbChars: c_long = @import("std").mem.zeroes(c_long),
    checkIndex: c_long = @import("std").mem.zeroes(c_long),
    keepBlanks: c_int = @import("std").mem.zeroes(c_int),
    disableSAX: c_int = @import("std").mem.zeroes(c_int),
    inSubset: c_int = @import("std").mem.zeroes(c_int),
    intSubName: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    extSubURI: [*c]xmlChar = @import("std").mem.zeroes([*c]xmlChar),
    extSubSystem: [*c]xmlChar = @import("std").mem.zeroes([*c]xmlChar),
    space: [*c]c_int = @import("std").mem.zeroes([*c]c_int),
    spaceNr: c_int = @import("std").mem.zeroes(c_int),
    spaceMax: c_int = @import("std").mem.zeroes(c_int),
    spaceTab: [*c]c_int = @import("std").mem.zeroes([*c]c_int),
    depth: c_int = @import("std").mem.zeroes(c_int),
    entity: xmlParserInputPtr = @import("std").mem.zeroes(xmlParserInputPtr),
    charset: c_int = @import("std").mem.zeroes(c_int),
    nodelen: c_int = @import("std").mem.zeroes(c_int),
    nodemem: c_int = @import("std").mem.zeroes(c_int),
    pedantic: c_int = @import("std").mem.zeroes(c_int),
    _private: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    loadsubset: c_int = @import("std").mem.zeroes(c_int),
    linenumbers: c_int = @import("std").mem.zeroes(c_int),
    catalogs: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    recovery: c_int = @import("std").mem.zeroes(c_int),
    progressive: c_int = @import("std").mem.zeroes(c_int),
    dict: xmlDictPtr = @import("std").mem.zeroes(xmlDictPtr),
    atts: [*c][*c]const xmlChar = @import("std").mem.zeroes([*c][*c]const xmlChar),
    maxatts: c_int = @import("std").mem.zeroes(c_int),
    docdict: c_int = @import("std").mem.zeroes(c_int),
    str_xml: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    str_xmlns: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    str_xml_ns: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    sax2: c_int = @import("std").mem.zeroes(c_int),
    nsNr: c_int = @import("std").mem.zeroes(c_int),
    nsMax: c_int = @import("std").mem.zeroes(c_int),
    nsTab: [*c][*c]const xmlChar = @import("std").mem.zeroes([*c][*c]const xmlChar),
    attallocs: [*c]c_int = @import("std").mem.zeroes([*c]c_int),
    pushTab: ?*xmlStartTag = @import("std").mem.zeroes(?*xmlStartTag),
    attsDefault: xmlHashTablePtr = @import("std").mem.zeroes(xmlHashTablePtr),
    attsSpecial: xmlHashTablePtr = @import("std").mem.zeroes(xmlHashTablePtr),
    nsWellFormed: c_int = @import("std").mem.zeroes(c_int),
    options: c_int = @import("std").mem.zeroes(c_int),
    dictNames: c_int = @import("std").mem.zeroes(c_int),
    freeElemsNr: c_int = @import("std").mem.zeroes(c_int),
    freeElems: xmlNodePtr = @import("std").mem.zeroes(xmlNodePtr),
    freeAttrsNr: c_int = @import("std").mem.zeroes(c_int),
    freeAttrs: xmlAttrPtr = @import("std").mem.zeroes(xmlAttrPtr),
    lastError: xmlError = @import("std").mem.zeroes(xmlError),
    parseMode: xmlParserMode = @import("std").mem.zeroes(xmlParserMode),
    nbentities: c_ulong = @import("std").mem.zeroes(c_ulong),
    sizeentities: c_ulong = @import("std").mem.zeroes(c_ulong),
    nodeInfo: [*c]xmlParserNodeInfo = @import("std").mem.zeroes([*c]xmlParserNodeInfo),
    nodeInfoNr: c_int = @import("std").mem.zeroes(c_int),
    nodeInfoMax: c_int = @import("std").mem.zeroes(c_int),
    nodeInfoTab: [*c]xmlParserNodeInfo = @import("std").mem.zeroes([*c]xmlParserNodeInfo),
    input_id: c_int = @import("std").mem.zeroes(c_int),
    sizeentcopy: c_ulong = @import("std").mem.zeroes(c_ulong),
    endCheckState: c_int = @import("std").mem.zeroes(c_int),
    nbErrors: c_ushort = @import("std").mem.zeroes(c_ushort),
    nbWarnings: c_ushort = @import("std").mem.zeroes(c_ushort),
};
pub const xmlParserCtxt = struct__xmlParserCtxt;
pub const xmlParserCtxtPtr = [*c]xmlParserCtxt;
pub const xmlSAXHandler = struct__xmlSAXHandler;
pub const xmlSAXHandlerPtr = [*c]xmlSAXHandler;
pub const XML_BUFFER_ALLOC_DOUBLEIT: c_int = 0;
pub const XML_BUFFER_ALLOC_EXACT: c_int = 1;
pub const XML_BUFFER_ALLOC_IMMUTABLE: c_int = 2;
pub const XML_BUFFER_ALLOC_IO: c_int = 3;
pub const XML_BUFFER_ALLOC_HYBRID: c_int = 4;
pub const XML_BUFFER_ALLOC_BOUNDED: c_int = 5;
pub const xmlBufferAllocationScheme = c_uint;
pub const struct__xmlBuffer = extern struct {
    content: [*c]xmlChar = @import("std").mem.zeroes([*c]xmlChar),
    use: c_uint = @import("std").mem.zeroes(c_uint),
    size: c_uint = @import("std").mem.zeroes(c_uint),
    alloc: xmlBufferAllocationScheme = @import("std").mem.zeroes(xmlBufferAllocationScheme),
    contentIO: [*c]xmlChar = @import("std").mem.zeroes([*c]xmlChar),
};
pub const xmlBuffer = struct__xmlBuffer;
pub const xmlBufferPtr = [*c]xmlBuffer;
pub extern fn xmlBufContent(buf: ?*const xmlBuf) [*c]xmlChar;
pub extern fn xmlBufEnd(buf: xmlBufPtr) [*c]xmlChar;
pub extern fn xmlBufUse(buf: xmlBufPtr) usize;
pub extern fn xmlBufShrink(buf: xmlBufPtr, len: usize) usize;
pub const XML_ELEMENT_NODE: c_int = 1;
pub const XML_ATTRIBUTE_NODE: c_int = 2;
pub const XML_TEXT_NODE: c_int = 3;
pub const XML_CDATA_SECTION_NODE: c_int = 4;
pub const XML_ENTITY_REF_NODE: c_int = 5;
pub const XML_ENTITY_NODE: c_int = 6;
pub const XML_PI_NODE: c_int = 7;
pub const XML_COMMENT_NODE: c_int = 8;
pub const XML_DOCUMENT_NODE: c_int = 9;
pub const XML_DOCUMENT_TYPE_NODE: c_int = 10;
pub const XML_DOCUMENT_FRAG_NODE: c_int = 11;
pub const XML_NOTATION_NODE: c_int = 12;
pub const XML_HTML_DOCUMENT_NODE: c_int = 13;
pub const XML_DTD_NODE: c_int = 14;
pub const XML_ELEMENT_DECL: c_int = 15;
pub const XML_ATTRIBUTE_DECL: c_int = 16;
pub const XML_ENTITY_DECL: c_int = 17;
pub const XML_NAMESPACE_DECL: c_int = 18;
pub const XML_XINCLUDE_START: c_int = 19;
pub const XML_XINCLUDE_END: c_int = 20;
pub const xmlElementType = c_uint;
pub const struct__xmlNotation = extern struct {
    name: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    PublicID: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    SystemID: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
};
pub const xmlNotation = struct__xmlNotation;
pub const xmlNotationPtr = [*c]xmlNotation;
pub const XML_ATTRIBUTE_CDATA: c_int = 1;
pub const XML_ATTRIBUTE_ID: c_int = 2;
pub const XML_ATTRIBUTE_IDREF: c_int = 3;
pub const XML_ATTRIBUTE_IDREFS: c_int = 4;
pub const XML_ATTRIBUTE_ENTITY: c_int = 5;
pub const XML_ATTRIBUTE_ENTITIES: c_int = 6;
pub const XML_ATTRIBUTE_NMTOKEN: c_int = 7;
pub const XML_ATTRIBUTE_NMTOKENS: c_int = 8;
pub const XML_ATTRIBUTE_ENUMERATION: c_int = 9;
pub const XML_ATTRIBUTE_NOTATION: c_int = 10;
pub const xmlAttributeType = c_uint;
pub const XML_ATTRIBUTE_NONE: c_int = 1;
pub const XML_ATTRIBUTE_REQUIRED: c_int = 2;
pub const XML_ATTRIBUTE_IMPLIED: c_int = 3;
pub const XML_ATTRIBUTE_FIXED: c_int = 4;
pub const xmlAttributeDefault = c_uint;
pub const struct__xmlAttribute = extern struct {
    _private: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    type: xmlElementType = @import("std").mem.zeroes(xmlElementType),
    name: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    children: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    last: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    parent: [*c]struct__xmlDtd = @import("std").mem.zeroes([*c]struct__xmlDtd),
    next: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    prev: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    doc: [*c]struct__xmlDoc = @import("std").mem.zeroes([*c]struct__xmlDoc),
    nexth: [*c]struct__xmlAttribute = @import("std").mem.zeroes([*c]struct__xmlAttribute),
    atype: xmlAttributeType = @import("std").mem.zeroes(xmlAttributeType),
    def: xmlAttributeDefault = @import("std").mem.zeroes(xmlAttributeDefault),
    defaultValue: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    tree: xmlEnumerationPtr = @import("std").mem.zeroes(xmlEnumerationPtr),
    prefix: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    elem: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
};
pub const xmlAttribute = struct__xmlAttribute;
pub const xmlAttributePtr = [*c]xmlAttribute;
pub const XML_ELEMENT_CONTENT_PCDATA: c_int = 1;
pub const XML_ELEMENT_CONTENT_ELEMENT: c_int = 2;
pub const XML_ELEMENT_CONTENT_SEQ: c_int = 3;
pub const XML_ELEMENT_CONTENT_OR: c_int = 4;
pub const xmlElementContentType = c_uint;
pub const XML_ELEMENT_CONTENT_ONCE: c_int = 1;
pub const XML_ELEMENT_CONTENT_OPT: c_int = 2;
pub const XML_ELEMENT_CONTENT_MULT: c_int = 3;
pub const XML_ELEMENT_CONTENT_PLUS: c_int = 4;
pub const xmlElementContentOccur = c_uint;
pub const XML_ELEMENT_TYPE_UNDEFINED: c_int = 0;
pub const XML_ELEMENT_TYPE_EMPTY: c_int = 1;
pub const XML_ELEMENT_TYPE_ANY: c_int = 2;
pub const XML_ELEMENT_TYPE_MIXED: c_int = 3;
pub const XML_ELEMENT_TYPE_ELEMENT: c_int = 4;
pub const xmlElementTypeVal = c_uint;
pub const struct__xmlElement = extern struct {
    _private: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    type: xmlElementType = @import("std").mem.zeroes(xmlElementType),
    name: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    children: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    last: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    parent: [*c]struct__xmlDtd = @import("std").mem.zeroes([*c]struct__xmlDtd),
    next: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    prev: [*c]struct__xmlNode = @import("std").mem.zeroes([*c]struct__xmlNode),
    doc: [*c]struct__xmlDoc = @import("std").mem.zeroes([*c]struct__xmlDoc),
    etype: xmlElementTypeVal = @import("std").mem.zeroes(xmlElementTypeVal),
    content: xmlElementContentPtr = @import("std").mem.zeroes(xmlElementContentPtr),
    attributes: xmlAttributePtr = @import("std").mem.zeroes(xmlAttributePtr),
    prefix: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    contModel: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const xmlElement = struct__xmlElement;
pub const xmlElementPtr = [*c]xmlElement;
pub const xmlNsPtr = [*c]xmlNs;
pub const xmlDtd = struct__xmlDtd;
pub const xmlDtdPtr = [*c]xmlDtd;
pub const struct__xmlID = extern struct {
    next: [*c]struct__xmlID = @import("std").mem.zeroes([*c]struct__xmlID),
    value: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    attr: xmlAttrPtr = @import("std").mem.zeroes(xmlAttrPtr),
    name: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    lineno: c_int = @import("std").mem.zeroes(c_int),
    doc: [*c]struct__xmlDoc = @import("std").mem.zeroes([*c]struct__xmlDoc),
};
pub const xmlID = struct__xmlID;
pub const xmlIDPtr = [*c]xmlID;
pub const struct__xmlRef = extern struct {
    next: [*c]struct__xmlRef = @import("std").mem.zeroes([*c]struct__xmlRef),
    value: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    attr: xmlAttrPtr = @import("std").mem.zeroes(xmlAttrPtr),
    name: [*c]const xmlChar = @import("std").mem.zeroes([*c]const xmlChar),
    lineno: c_int = @import("std").mem.zeroes(c_int),
};
pub const xmlRef = struct__xmlRef;
pub const xmlRefPtr = [*c]xmlRef;
pub const XML_DOC_WELLFORMED: c_int = 1;
pub const XML_DOC_NSVALID: c_int = 2;
pub const XML_DOC_OLD10: c_int = 4;
pub const XML_DOC_DTDVALID: c_int = 8;
pub const XML_DOC_XINCLUDE: c_int = 16;
pub const XML_DOC_USERBUILT: c_int = 32;
pub const XML_DOC_INTERNAL: c_int = 64;
pub const XML_DOC_HTML: c_int = 128;
pub const xmlDocProperties = c_uint;
pub const xmlDOMWrapCtxt = struct__xmlDOMWrapCtxt;
pub const xmlDOMWrapCtxtPtr = [*c]xmlDOMWrapCtxt;
pub const xmlDOMWrapAcquireNsFunction = ?*const fn (xmlDOMWrapCtxtPtr, xmlNodePtr, [*c]const xmlChar, [*c]const xmlChar) callconv(.c) xmlNsPtr;
pub const struct__xmlDOMWrapCtxt = extern struct {
    _private: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    type: c_int = @import("std").mem.zeroes(c_int),
    namespaceMap: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    getNsForNodeFunc: xmlDOMWrapAcquireNsFunction = @import("std").mem.zeroes(xmlDOMWrapAcquireNsFunction),
};
pub extern fn xmlValidateNCName(value: [*c]const xmlChar, space: c_int) c_int;
pub extern fn xmlValidateQName(value: [*c]const xmlChar, space: c_int) c_int;
pub extern fn xmlValidateName(value: [*c]const xmlChar, space: c_int) c_int;
pub extern fn xmlValidateNMToken(value: [*c]const xmlChar, space: c_int) c_int;
pub extern fn xmlBuildQName(ncname: [*c]const xmlChar, prefix: [*c]const xmlChar, memory: [*c]xmlChar, len: c_int) [*c]xmlChar;
pub extern fn xmlSplitQName2(name: [*c]const xmlChar, prefix: [*c][*c]xmlChar) [*c]xmlChar;
pub extern fn xmlSplitQName3(name: [*c]const xmlChar, len: [*c]c_int) [*c]const xmlChar;
pub extern fn xmlSetBufferAllocationScheme(scheme: xmlBufferAllocationScheme) void;
pub extern fn xmlGetBufferAllocationScheme() xmlBufferAllocationScheme;
pub extern fn xmlBufferCreate() xmlBufferPtr;
pub extern fn xmlBufferCreateSize(size: usize) xmlBufferPtr;
pub extern fn xmlBufferCreateStatic(mem: ?*anyopaque, size: usize) xmlBufferPtr;
pub extern fn xmlBufferResize(buf: xmlBufferPtr, size: c_uint) c_int;
pub extern fn xmlBufferFree(buf: xmlBufferPtr) void;
pub extern fn xmlBufferDump(file: [*c]FILE, buf: xmlBufferPtr) c_int;
pub extern fn xmlBufferAdd(buf: xmlBufferPtr, str: [*c]const xmlChar, len: c_int) c_int;
pub extern fn xmlBufferAddHead(buf: xmlBufferPtr, str: [*c]const xmlChar, len: c_int) c_int;
pub extern fn xmlBufferCat(buf: xmlBufferPtr, str: [*c]const xmlChar) c_int;
pub extern fn xmlBufferCCat(buf: xmlBufferPtr, str: [*c]const u8) c_int;
pub extern fn xmlBufferShrink(buf: xmlBufferPtr, len: c_uint) c_int;
pub extern fn xmlBufferGrow(buf: xmlBufferPtr, len: c_uint) c_int;
pub extern fn xmlBufferEmpty(buf: xmlBufferPtr) void;
pub extern fn xmlBufferContent(buf: [*c]const xmlBuffer) [*c]const xmlChar;
pub extern fn xmlBufferDetach(buf: xmlBufferPtr) [*c]xmlChar;
pub extern fn xmlBufferSetAllocationScheme(buf: xmlBufferPtr, scheme: xmlBufferAllocationScheme) void;
pub extern fn xmlBufferLength(buf: [*c]const xmlBuffer) c_int;
pub extern fn xmlCreateIntSubset(doc: xmlDocPtr, name: [*c]const xmlChar, ExternalID: [*c]const xmlChar, SystemID: [*c]const xmlChar) xmlDtdPtr;
pub extern fn xmlNewDtd(doc: xmlDocPtr, name: [*c]const xmlChar, ExternalID: [*c]const xmlChar, SystemID: [*c]const xmlChar) xmlDtdPtr;
pub extern fn xmlGetIntSubset(doc: [*c]const xmlDoc) xmlDtdPtr;
pub extern fn xmlFreeDtd(cur: xmlDtdPtr) void;
pub extern fn xmlNewNs(node: xmlNodePtr, href: [*c]const xmlChar, prefix: [*c]const xmlChar) xmlNsPtr;
pub extern fn xmlFreeNs(cur: xmlNsPtr) void;
pub extern fn xmlFreeNsList(cur: xmlNsPtr) void;
pub extern fn xmlNewDoc(version: [*c]const xmlChar) xmlDocPtr;
pub extern fn xmlFreeDoc(cur: xmlDocPtr) void;
pub extern fn xmlNewDocProp(doc: xmlDocPtr, name: [*c]const xmlChar, value: [*c]const xmlChar) xmlAttrPtr;
pub extern fn xmlNewProp(node: xmlNodePtr, name: [*c]const xmlChar, value: [*c]const xmlChar) xmlAttrPtr;
pub extern fn xmlNewNsProp(node: xmlNodePtr, ns: xmlNsPtr, name: [*c]const xmlChar, value: [*c]const xmlChar) xmlAttrPtr;
pub extern fn xmlNewNsPropEatName(node: xmlNodePtr, ns: xmlNsPtr, name: [*c]xmlChar, value: [*c]const xmlChar) xmlAttrPtr;
pub extern fn xmlFreePropList(cur: xmlAttrPtr) void;
pub extern fn xmlFreeProp(cur: xmlAttrPtr) void;
pub extern fn xmlCopyProp(target: xmlNodePtr, cur: xmlAttrPtr) xmlAttrPtr;
pub extern fn xmlCopyPropList(target: xmlNodePtr, cur: xmlAttrPtr) xmlAttrPtr;
pub extern fn xmlCopyDtd(dtd: xmlDtdPtr) xmlDtdPtr;
pub extern fn xmlCopyDoc(doc: xmlDocPtr, recursive: c_int) xmlDocPtr;
pub extern fn xmlNewDocNode(doc: xmlDocPtr, ns: xmlNsPtr, name: [*c]const xmlChar, content: [*c]const xmlChar) xmlNodePtr;
pub extern fn xmlNewDocNodeEatName(doc: xmlDocPtr, ns: xmlNsPtr, name: [*c]xmlChar, content: [*c]const xmlChar) xmlNodePtr;
pub extern fn xmlNewNode(ns: xmlNsPtr, name: [*c]const xmlChar) xmlNodePtr;
pub extern fn xmlNewNodeEatName(ns: xmlNsPtr, name: [*c]xmlChar) xmlNodePtr;
pub extern fn xmlNewChild(parent: xmlNodePtr, ns: xmlNsPtr, name: [*c]const xmlChar, content: [*c]const xmlChar) xmlNodePtr;
pub extern fn xmlNewDocText(doc: [*c]const xmlDoc, content: [*c]const xmlChar) xmlNodePtr;
pub extern fn xmlNewText(content: [*c]const xmlChar) xmlNodePtr;
pub extern fn xmlNewDocPI(doc: xmlDocPtr, name: [*c]const xmlChar, content: [*c]const xmlChar) xmlNodePtr;
pub extern fn xmlNewPI(name: [*c]const xmlChar, content: [*c]const xmlChar) xmlNodePtr;
pub extern fn xmlNewDocTextLen(doc: xmlDocPtr, content: [*c]const xmlChar, len: c_int) xmlNodePtr;
pub extern fn xmlNewTextLen(content: [*c]const xmlChar, len: c_int) xmlNodePtr;
pub extern fn xmlNewDocComment(doc: xmlDocPtr, content: [*c]const xmlChar) xmlNodePtr;
pub extern fn xmlNewComment(content: [*c]const xmlChar) xmlNodePtr;
pub extern fn xmlNewCDataBlock(doc: xmlDocPtr, content: [*c]const xmlChar, len: c_int) xmlNodePtr;
pub extern fn xmlNewCharRef(doc: xmlDocPtr, name: [*c]const xmlChar) xmlNodePtr;
pub extern fn xmlNewReference(doc: [*c]const xmlDoc, name: [*c]const xmlChar) xmlNodePtr;
pub extern fn xmlCopyNode(node: xmlNodePtr, recursive: c_int) xmlNodePtr;
pub extern fn xmlDocCopyNode(node: xmlNodePtr, doc: xmlDocPtr, recursive: c_int) xmlNodePtr;
pub extern fn xmlDocCopyNodeList(doc: xmlDocPtr, node: xmlNodePtr) xmlNodePtr;
pub extern fn xmlCopyNodeList(node: xmlNodePtr) xmlNodePtr;
pub extern fn xmlNewTextChild(parent: xmlNodePtr, ns: xmlNsPtr, name: [*c]const xmlChar, content: [*c]const xmlChar) xmlNodePtr;
pub extern fn xmlNewDocRawNode(doc: xmlDocPtr, ns: xmlNsPtr, name: [*c]const xmlChar, content: [*c]const xmlChar) xmlNodePtr;
pub extern fn xmlNewDocFragment(doc: xmlDocPtr) xmlNodePtr;
pub extern fn xmlGetLineNo(node: [*c]const xmlNode) c_long;
pub extern fn xmlGetNodePath(node: [*c]const xmlNode) [*c]xmlChar;
pub extern fn xmlDocGetRootElement(doc: [*c]const xmlDoc) xmlNodePtr;
pub extern fn xmlGetLastChild(parent: [*c]const xmlNode) xmlNodePtr;
pub extern fn xmlNodeIsText(node: [*c]const xmlNode) c_int;
pub extern fn xmlIsBlankNode(node: [*c]const xmlNode) c_int;
pub extern fn xmlDocSetRootElement(doc: xmlDocPtr, root: xmlNodePtr) xmlNodePtr;
pub extern fn xmlNodeSetName(cur: xmlNodePtr, name: [*c]const xmlChar) void;
pub extern fn xmlAddChild(parent: xmlNodePtr, cur: xmlNodePtr) xmlNodePtr;
pub extern fn xmlAddChildList(parent: xmlNodePtr, cur: xmlNodePtr) xmlNodePtr;
pub extern fn xmlReplaceNode(old: xmlNodePtr, cur: xmlNodePtr) xmlNodePtr;
pub extern fn xmlAddPrevSibling(cur: xmlNodePtr, elem: xmlNodePtr) xmlNodePtr;
pub extern fn xmlAddSibling(cur: xmlNodePtr, elem: xmlNodePtr) xmlNodePtr;
pub extern fn xmlAddNextSibling(cur: xmlNodePtr, elem: xmlNodePtr) xmlNodePtr;
pub extern fn xmlUnlinkNode(cur: xmlNodePtr) void;
pub extern fn xmlTextMerge(first: xmlNodePtr, second: xmlNodePtr) xmlNodePtr;
pub extern fn xmlTextConcat(node: xmlNodePtr, content: [*c]const xmlChar, len: c_int) c_int;
pub extern fn xmlFreeNodeList(cur: xmlNodePtr) void;
pub extern fn xmlFreeNode(cur: xmlNodePtr) void;
pub extern fn xmlSetTreeDoc(tree: xmlNodePtr, doc: xmlDocPtr) void;
pub extern fn xmlSetListDoc(list: xmlNodePtr, doc: xmlDocPtr) void;
pub extern fn xmlSearchNs(doc: xmlDocPtr, node: xmlNodePtr, nameSpace: [*c]const xmlChar) xmlNsPtr;
pub extern fn xmlSearchNsByHref(doc: xmlDocPtr, node: xmlNodePtr, href: [*c]const xmlChar) xmlNsPtr;
pub extern fn xmlGetNsList(doc: [*c]const xmlDoc, node: [*c]const xmlNode) [*c]xmlNsPtr;
pub extern fn xmlSetNs(node: xmlNodePtr, ns: xmlNsPtr) void;
pub extern fn xmlCopyNamespace(cur: xmlNsPtr) xmlNsPtr;
pub extern fn xmlCopyNamespaceList(cur: xmlNsPtr) xmlNsPtr;
pub extern fn xmlSetProp(node: xmlNodePtr, name: [*c]const xmlChar, value: [*c]const xmlChar) xmlAttrPtr;
pub extern fn xmlSetNsProp(node: xmlNodePtr, ns: xmlNsPtr, name: [*c]const xmlChar, value: [*c]const xmlChar) xmlAttrPtr;
pub extern fn xmlGetNoNsProp(node: [*c]const xmlNode, name: [*c]const xmlChar) [*c]xmlChar;
pub extern fn xmlGetProp(node: [*c]const xmlNode, name: [*c]const xmlChar) [*c]xmlChar;
pub extern fn xmlHasProp(node: [*c]const xmlNode, name: [*c]const xmlChar) xmlAttrPtr;
pub extern fn xmlHasNsProp(node: [*c]const xmlNode, name: [*c]const xmlChar, nameSpace: [*c]const xmlChar) xmlAttrPtr;
pub extern fn xmlGetNsProp(node: [*c]const xmlNode, name: [*c]const xmlChar, nameSpace: [*c]const xmlChar) [*c]xmlChar;
pub extern fn xmlStringGetNodeList(doc: [*c]const xmlDoc, value: [*c]const xmlChar) xmlNodePtr;
pub extern fn xmlStringLenGetNodeList(doc: [*c]const xmlDoc, value: [*c]const xmlChar, len: c_int) xmlNodePtr;
pub extern fn xmlNodeListGetString(doc: xmlDocPtr, list: [*c]const xmlNode, inLine: c_int) [*c]xmlChar;
pub extern fn xmlNodeListGetRawString(doc: [*c]const xmlDoc, list: [*c]const xmlNode, inLine: c_int) [*c]xmlChar;
pub extern fn xmlNodeSetContent(cur: xmlNodePtr, content: [*c]const xmlChar) void;
pub extern fn xmlNodeSetContentLen(cur: xmlNodePtr, content: [*c]const xmlChar, len: c_int) void;
pub extern fn xmlNodeAddContent(cur: xmlNodePtr, content: [*c]const xmlChar) void;
pub extern fn xmlNodeAddContentLen(cur: xmlNodePtr, content: [*c]const xmlChar, len: c_int) void;
pub extern fn xmlNodeGetContent(cur: [*c]const xmlNode) [*c]xmlChar;
pub extern fn xmlNodeBufGetContent(buffer: xmlBufferPtr, cur: [*c]const xmlNode) c_int;
pub extern fn xmlBufGetNodeContent(buf: xmlBufPtr, cur: [*c]const xmlNode) c_int;
pub extern fn xmlNodeGetLang(cur: [*c]const xmlNode) [*c]xmlChar;
pub extern fn xmlNodeGetSpacePreserve(cur: [*c]const xmlNode) c_int;
pub extern fn xmlNodeSetLang(cur: xmlNodePtr, lang: [*c]const xmlChar) void;
pub extern fn xmlNodeSetSpacePreserve(cur: xmlNodePtr, val: c_int) void;
pub extern fn xmlNodeGetBase(doc: [*c]const xmlDoc, cur: [*c]const xmlNode) [*c]xmlChar;
pub extern fn xmlNodeSetBase(cur: xmlNodePtr, uri: [*c]const xmlChar) void;
pub extern fn xmlRemoveProp(cur: xmlAttrPtr) c_int;
pub extern fn xmlUnsetNsProp(node: xmlNodePtr, ns: xmlNsPtr, name: [*c]const xmlChar) c_int;
pub extern fn xmlUnsetProp(node: xmlNodePtr, name: [*c]const xmlChar) c_int;
pub extern fn xmlBufferWriteCHAR(buf: xmlBufferPtr, string: [*c]const xmlChar) void;
pub extern fn xmlBufferWriteChar(buf: xmlBufferPtr, string: [*c]const u8) void;
pub extern fn xmlBufferWriteQuotedString(buf: xmlBufferPtr, string: [*c]const xmlChar) void;
pub extern fn xmlReconciliateNs(doc: xmlDocPtr, tree: xmlNodePtr) c_int;
pub extern fn xmlIsXHTML(systemID: [*c]const xmlChar, publicID: [*c]const xmlChar) c_int;
pub extern fn xmlGetDocCompressMode(doc: [*c]const xmlDoc) c_int;
pub extern fn xmlSetDocCompressMode(doc: xmlDocPtr, mode: c_int) void;
pub extern fn xmlGetCompressMode() c_int;
pub extern fn xmlSetCompressMode(mode: c_int) void;
pub extern fn xmlDOMWrapNewCtxt() xmlDOMWrapCtxtPtr;
pub extern fn xmlDOMWrapFreeCtxt(ctxt: xmlDOMWrapCtxtPtr) void;
pub extern fn xmlDOMWrapReconcileNamespaces(ctxt: xmlDOMWrapCtxtPtr, elem: xmlNodePtr, options: c_int) c_int;
pub extern fn xmlDOMWrapAdoptNode(ctxt: xmlDOMWrapCtxtPtr, sourceDoc: xmlDocPtr, node: xmlNodePtr, destDoc: xmlDocPtr, destParent: xmlNodePtr, options: c_int) c_int;
pub extern fn xmlDOMWrapRemoveNode(ctxt: xmlDOMWrapCtxtPtr, doc: xmlDocPtr, node: xmlNodePtr, options: c_int) c_int;
pub extern fn xmlDOMWrapCloneNode(ctxt: xmlDOMWrapCtxtPtr, sourceDoc: xmlDocPtr, node: xmlNodePtr, clonedNode: [*c]xmlNodePtr, destDoc: xmlDocPtr, destParent: xmlNodePtr, deep: c_int, options: c_int) c_int;
pub extern fn xmlChildElementCount(parent: xmlNodePtr) c_ulong;
pub extern fn xmlNextElementSibling(node: xmlNodePtr) xmlNodePtr;
pub extern fn xmlFirstElementChild(parent: xmlNodePtr) xmlNodePtr;
pub extern fn xmlLastElementChild(parent: xmlNodePtr) xmlNodePtr;
pub extern fn xmlPreviousElementSibling(node: xmlNodePtr) xmlNodePtr;
pub const xmlFreeFunc = ?*const fn (?*anyopaque) callconv(.c) void;
pub const xmlMallocFunc = ?*const fn (usize) callconv(.c) ?*anyopaque;
pub const xmlReallocFunc = ?*const fn (?*anyopaque, usize) callconv(.c) ?*anyopaque;
pub const xmlStrdupFunc = ?*const fn ([*c]const u8) callconv(.c) [*c]u8;
pub extern fn xmlMemSetup(freeFunc: xmlFreeFunc, mallocFunc: xmlMallocFunc, reallocFunc: xmlReallocFunc, strdupFunc: xmlStrdupFunc) c_int;
pub extern fn xmlMemGet(freeFunc: [*c]xmlFreeFunc, mallocFunc: [*c]xmlMallocFunc, reallocFunc: [*c]xmlReallocFunc, strdupFunc: [*c]xmlStrdupFunc) c_int;
pub extern fn xmlGcMemSetup(freeFunc: xmlFreeFunc, mallocFunc: xmlMallocFunc, mallocAtomicFunc: xmlMallocFunc, reallocFunc: xmlReallocFunc, strdupFunc: xmlStrdupFunc) c_int;
pub extern fn xmlGcMemGet(freeFunc: [*c]xmlFreeFunc, mallocFunc: [*c]xmlMallocFunc, mallocAtomicFunc: [*c]xmlMallocFunc, reallocFunc: [*c]xmlReallocFunc, strdupFunc: [*c]xmlStrdupFunc) c_int;
pub extern fn xmlInitMemory() c_int;
pub extern fn xmlCleanupMemory() void;
pub extern fn xmlMemSize(ptr: ?*anyopaque) usize;
pub extern fn xmlMemUsed() c_int;
pub extern fn xmlMemBlocks() c_int;
pub extern fn xmlMemDisplay(fp: [*c]FILE) void;
pub extern fn xmlMemDisplayLast(fp: [*c]FILE, nbBytes: c_long) void;
pub extern fn xmlMemShow(fp: [*c]FILE, nr: c_int) void;
pub extern fn xmlMemoryDump() void;
pub extern fn xmlMemMalloc(size: usize) ?*anyopaque;
pub extern fn xmlMemRealloc(ptr: ?*anyopaque, size: usize) ?*anyopaque;
pub extern fn xmlMemFree(ptr: ?*anyopaque) void;
pub extern fn xmlMemoryStrdup(str: [*c]const u8) [*c]u8;
pub extern fn xmlMallocLoc(size: usize, file: [*c]const u8, line: c_int) ?*anyopaque;
pub extern fn xmlReallocLoc(ptr: ?*anyopaque, size: usize, file: [*c]const u8, line: c_int) ?*anyopaque;
pub extern fn xmlMallocAtomicLoc(size: usize, file: [*c]const u8, line: c_int) ?*anyopaque;
pub extern fn xmlMemStrdupLoc(str: [*c]const u8, file: [*c]const u8, line: c_int) [*c]u8;
pub const struct__xmlMutex = opaque {};
pub const xmlMutex = struct__xmlMutex;
pub const xmlMutexPtr = ?*xmlMutex;
pub const struct__xmlRMutex = opaque {};
pub const xmlRMutex = struct__xmlRMutex;
pub const xmlRMutexPtr = ?*xmlRMutex;
pub const ptrdiff_t = c_long;
pub const wchar_t = c_int;
pub const max_align_t = extern struct {
    __clang_max_align_nonce1: c_longlong align(8) = @import("std").mem.zeroes(c_longlong),
    __clang_max_align_nonce2: c_longdouble align(16) = @import("std").mem.zeroes(c_longdouble),
};
pub extern fn xmlInitializeDict() c_int;
pub extern fn xmlDictCreate() xmlDictPtr;
pub extern fn xmlDictSetLimit(dict: xmlDictPtr, limit: usize) usize;
pub extern fn xmlDictGetUsage(dict: xmlDictPtr) usize;
pub extern fn xmlDictCreateSub(sub: xmlDictPtr) xmlDictPtr;
pub extern fn xmlDictReference(dict: xmlDictPtr) c_int;
pub extern fn xmlDictFree(dict: xmlDictPtr) void;
pub extern fn xmlDictLookup(dict: xmlDictPtr, name: [*c]const xmlChar, len: c_int) [*c]const xmlChar;
pub extern fn xmlDictExists(dict: xmlDictPtr, name: [*c]const xmlChar, len: c_int) [*c]const xmlChar;
pub extern fn xmlDictQLookup(dict: xmlDictPtr, prefix: [*c]const xmlChar, name: [*c]const xmlChar) [*c]const xmlChar;
pub extern fn xmlDictOwns(dict: xmlDictPtr, str: [*c]const xmlChar) c_int;
pub extern fn xmlDictSize(dict: xmlDictPtr) c_int;
pub extern fn xmlDictCleanup() void;
pub const xmlHashDeallocator = ?*const fn (?*anyopaque, [*c]const xmlChar) callconv(.c) void;
pub const xmlHashCopier = ?*const fn (?*anyopaque, [*c]const xmlChar) callconv(.c) ?*anyopaque;
pub const xmlHashScanner = ?*const fn (?*anyopaque, ?*anyopaque, [*c]const xmlChar) callconv(.c) void;
pub const xmlHashScannerFull = ?*const fn (?*anyopaque, ?*anyopaque, [*c]const xmlChar, [*c]const xmlChar, [*c]const xmlChar) callconv(.c) void;
pub extern fn xmlHashCreate(size: c_int) xmlHashTablePtr;
pub extern fn xmlHashCreateDict(size: c_int, dict: xmlDictPtr) xmlHashTablePtr;
pub extern fn xmlHashFree(table: xmlHashTablePtr, f: xmlHashDeallocator) void;
pub extern fn xmlHashDefaultDeallocator(entry: ?*anyopaque, name: [*c]const xmlChar) void;
pub extern fn xmlHashAddEntry(table: xmlHashTablePtr, name: [*c]const xmlChar, userdata: ?*anyopaque) c_int;
pub extern fn xmlHashUpdateEntry(table: xmlHashTablePtr, name: [*c]const xmlChar, userdata: ?*anyopaque, f: xmlHashDeallocator) c_int;
pub extern fn xmlHashAddEntry2(table: xmlHashTablePtr, name: [*c]const xmlChar, name2: [*c]const xmlChar, userdata: ?*anyopaque) c_int;
pub extern fn xmlHashUpdateEntry2(table: xmlHashTablePtr, name: [*c]const xmlChar, name2: [*c]const xmlChar, userdata: ?*anyopaque, f: xmlHashDeallocator) c_int;
pub extern fn xmlHashAddEntry3(table: xmlHashTablePtr, name: [*c]const xmlChar, name2: [*c]const xmlChar, name3: [*c]const xmlChar, userdata: ?*anyopaque) c_int;
pub extern fn xmlHashUpdateEntry3(table: xmlHashTablePtr, name: [*c]const xmlChar, name2: [*c]const xmlChar, name3: [*c]const xmlChar, userdata: ?*anyopaque, f: xmlHashDeallocator) c_int;
pub extern fn xmlHashRemoveEntry(table: xmlHashTablePtr, name: [*c]const xmlChar, f: xmlHashDeallocator) c_int;
pub extern fn xmlHashRemoveEntry2(table: xmlHashTablePtr, name: [*c]const xmlChar, name2: [*c]const xmlChar, f: xmlHashDeallocator) c_int;
pub extern fn xmlHashRemoveEntry3(table: xmlHashTablePtr, name: [*c]const xmlChar, name2: [*c]const xmlChar, name3: [*c]const xmlChar, f: xmlHashDeallocator) c_int;
pub extern fn xmlHashLookup(table: xmlHashTablePtr, name: [*c]const xmlChar) ?*anyopaque;
pub extern fn xmlHashLookup2(table: xmlHashTablePtr, name: [*c]const xmlChar, name2: [*c]const xmlChar) ?*anyopaque;
pub extern fn xmlHashLookup3(table: xmlHashTablePtr, name: [*c]const xmlChar, name2: [*c]const xmlChar, name3: [*c]const xmlChar) ?*anyopaque;
pub extern fn xmlHashQLookup(table: xmlHashTablePtr, name: [*c]const xmlChar, prefix: [*c]const xmlChar) ?*anyopaque;
pub extern fn xmlHashQLookup2(table: xmlHashTablePtr, name: [*c]const xmlChar, prefix: [*c]const xmlChar, name2: [*c]const xmlChar, prefix2: [*c]const xmlChar) ?*anyopaque;
pub extern fn xmlHashQLookup3(table: xmlHashTablePtr, name: [*c]const xmlChar, prefix: [*c]const xmlChar, name2: [*c]const xmlChar, prefix2: [*c]const xmlChar, name3: [*c]const xmlChar, prefix3: [*c]const xmlChar) ?*anyopaque;
pub extern fn xmlHashCopy(table: xmlHashTablePtr, f: xmlHashCopier) xmlHashTablePtr;
pub extern fn xmlHashSize(table: xmlHashTablePtr) c_int;
pub extern fn xmlHashScan(table: xmlHashTablePtr, f: xmlHashScanner, data: ?*anyopaque) void;
pub extern fn xmlHashScan3(table: xmlHashTablePtr, name: [*c]const xmlChar, name2: [*c]const xmlChar, name3: [*c]const xmlChar, f: xmlHashScanner, data: ?*anyopaque) void;
pub extern fn xmlHashScanFull(table: xmlHashTablePtr, f: xmlHashScannerFull, data: ?*anyopaque) void;
pub extern fn xmlHashScanFull3(table: xmlHashTablePtr, name: [*c]const xmlChar, name2: [*c]const xmlChar, name3: [*c]const xmlChar, f: xmlHashScannerFull, data: ?*anyopaque) void;
pub const XML_ERR_NONE: c_int = 0;
pub const XML_ERR_WARNING: c_int = 1;
pub const XML_ERR_ERROR: c_int = 2;
pub const XML_ERR_FATAL: c_int = 3;
pub const xmlErrorLevel = c_uint;
pub const XML_FROM_NONE: c_int = 0;
pub const XML_FROM_PARSER: c_int = 1;
pub const XML_FROM_TREE: c_int = 2;
pub const XML_FROM_NAMESPACE: c_int = 3;
pub const XML_FROM_DTD: c_int = 4;
pub const XML_FROM_HTML: c_int = 5;
pub const XML_FROM_MEMORY: c_int = 6;
pub const XML_FROM_OUTPUT: c_int = 7;
pub const XML_FROM_IO: c_int = 8;
pub const XML_FROM_FTP: c_int = 9;
pub const XML_FROM_HTTP: c_int = 10;
pub const XML_FROM_XINCLUDE: c_int = 11;
pub const XML_FROM_XPATH: c_int = 12;
pub const XML_FROM_XPOINTER: c_int = 13;
pub const XML_FROM_REGEXP: c_int = 14;
pub const XML_FROM_DATATYPE: c_int = 15;
pub const XML_FROM_SCHEMASP: c_int = 16;
pub const XML_FROM_SCHEMASV: c_int = 17;
pub const XML_FROM_RELAXNGP: c_int = 18;
pub const XML_FROM_RELAXNGV: c_int = 19;
pub const XML_FROM_CATALOG: c_int = 20;
pub const XML_FROM_C14N: c_int = 21;
pub const XML_FROM_XSLT: c_int = 22;
pub const XML_FROM_VALID: c_int = 23;
pub const XML_FROM_CHECK: c_int = 24;
pub const XML_FROM_WRITER: c_int = 25;
pub const XML_FROM_MODULE: c_int = 26;
pub const XML_FROM_I18N: c_int = 27;
pub const XML_FROM_SCHEMATRONV: c_int = 28;
pub const XML_FROM_BUFFER: c_int = 29;
pub const XML_FROM_URI: c_int = 30;
pub const xmlErrorDomain = c_uint;
pub const XML_ERR_OK: c_int = 0;
pub const XML_ERR_INTERNAL_ERROR: c_int = 1;
pub const XML_ERR_NO_MEMORY: c_int = 2;
pub const XML_ERR_DOCUMENT_START: c_int = 3;
pub const XML_ERR_DOCUMENT_EMPTY: c_int = 4;
pub const XML_ERR_DOCUMENT_END: c_int = 5;
pub const XML_ERR_INVALID_HEX_CHARREF: c_int = 6;
pub const XML_ERR_INVALID_DEC_CHARREF: c_int = 7;
pub const XML_ERR_INVALID_CHARREF: c_int = 8;
pub const XML_ERR_INVALID_CHAR: c_int = 9;
pub const XML_ERR_CHARREF_AT_EOF: c_int = 10;
pub const XML_ERR_CHARREF_IN_PROLOG: c_int = 11;
pub const XML_ERR_CHARREF_IN_EPILOG: c_int = 12;
pub const XML_ERR_CHARREF_IN_DTD: c_int = 13;
pub const XML_ERR_ENTITYREF_AT_EOF: c_int = 14;
pub const XML_ERR_ENTITYREF_IN_PROLOG: c_int = 15;
pub const XML_ERR_ENTITYREF_IN_EPILOG: c_int = 16;
pub const XML_ERR_ENTITYREF_IN_DTD: c_int = 17;
pub const XML_ERR_PEREF_AT_EOF: c_int = 18;
pub const XML_ERR_PEREF_IN_PROLOG: c_int = 19;
pub const XML_ERR_PEREF_IN_EPILOG: c_int = 20;
pub const XML_ERR_PEREF_IN_INT_SUBSET: c_int = 21;
pub const XML_ERR_ENTITYREF_NO_NAME: c_int = 22;
pub const XML_ERR_ENTITYREF_SEMICOL_MISSING: c_int = 23;
pub const XML_ERR_PEREF_NO_NAME: c_int = 24;
pub const XML_ERR_PEREF_SEMICOL_MISSING: c_int = 25;
pub const XML_ERR_UNDECLARED_ENTITY: c_int = 26;
pub const XML_WAR_UNDECLARED_ENTITY: c_int = 27;
pub const XML_ERR_UNPARSED_ENTITY: c_int = 28;
pub const XML_ERR_ENTITY_IS_EXTERNAL: c_int = 29;
pub const XML_ERR_ENTITY_IS_PARAMETER: c_int = 30;
pub const XML_ERR_UNKNOWN_ENCODING: c_int = 31;
pub const XML_ERR_UNSUPPORTED_ENCODING: c_int = 32;
pub const XML_ERR_STRING_NOT_STARTED: c_int = 33;
pub const XML_ERR_STRING_NOT_CLOSED: c_int = 34;
pub const XML_ERR_NS_DECL_ERROR: c_int = 35;
pub const XML_ERR_ENTITY_NOT_STARTED: c_int = 36;
pub const XML_ERR_ENTITY_NOT_FINISHED: c_int = 37;
pub const XML_ERR_LT_IN_ATTRIBUTE: c_int = 38;
pub const XML_ERR_ATTRIBUTE_NOT_STARTED: c_int = 39;
pub const XML_ERR_ATTRIBUTE_NOT_FINISHED: c_int = 40;
pub const XML_ERR_ATTRIBUTE_WITHOUT_VALUE: c_int = 41;
pub const XML_ERR_ATTRIBUTE_REDEFINED: c_int = 42;
pub const XML_ERR_LITERAL_NOT_STARTED: c_int = 43;
pub const XML_ERR_LITERAL_NOT_FINISHED: c_int = 44;
pub const XML_ERR_COMMENT_NOT_FINISHED: c_int = 45;
pub const XML_ERR_PI_NOT_STARTED: c_int = 46;
pub const XML_ERR_PI_NOT_FINISHED: c_int = 47;
pub const XML_ERR_NOTATION_NOT_STARTED: c_int = 48;
pub const XML_ERR_NOTATION_NOT_FINISHED: c_int = 49;
pub const XML_ERR_ATTLIST_NOT_STARTED: c_int = 50;
pub const XML_ERR_ATTLIST_NOT_FINISHED: c_int = 51;
pub const XML_ERR_MIXED_NOT_STARTED: c_int = 52;
pub const XML_ERR_MIXED_NOT_FINISHED: c_int = 53;
pub const XML_ERR_ELEMCONTENT_NOT_STARTED: c_int = 54;
pub const XML_ERR_ELEMCONTENT_NOT_FINISHED: c_int = 55;
pub const XML_ERR_XMLDECL_NOT_STARTED: c_int = 56;
pub const XML_ERR_XMLDECL_NOT_FINISHED: c_int = 57;
pub const XML_ERR_CONDSEC_NOT_STARTED: c_int = 58;
pub const XML_ERR_CONDSEC_NOT_FINISHED: c_int = 59;
pub const XML_ERR_EXT_SUBSET_NOT_FINISHED: c_int = 60;
pub const XML_ERR_DOCTYPE_NOT_FINISHED: c_int = 61;
pub const XML_ERR_MISPLACED_CDATA_END: c_int = 62;
pub const XML_ERR_CDATA_NOT_FINISHED: c_int = 63;
pub const XML_ERR_RESERVED_XML_NAME: c_int = 64;
pub const XML_ERR_SPACE_REQUIRED: c_int = 65;
pub const XML_ERR_SEPARATOR_REQUIRED: c_int = 66;
pub const XML_ERR_NMTOKEN_REQUIRED: c_int = 67;
pub const XML_ERR_NAME_REQUIRED: c_int = 68;
pub const XML_ERR_PCDATA_REQUIRED: c_int = 69;
pub const XML_ERR_URI_REQUIRED: c_int = 70;
pub const XML_ERR_PUBID_REQUIRED: c_int = 71;
pub const XML_ERR_LT_REQUIRED: c_int = 72;
pub const XML_ERR_GT_REQUIRED: c_int = 73;
pub const XML_ERR_LTSLASH_REQUIRED: c_int = 74;
pub const XML_ERR_EQUAL_REQUIRED: c_int = 75;
pub const XML_ERR_TAG_NAME_MISMATCH: c_int = 76;
pub const XML_ERR_TAG_NOT_FINISHED: c_int = 77;
pub const XML_ERR_STANDALONE_VALUE: c_int = 78;
pub const XML_ERR_ENCODING_NAME: c_int = 79;
pub const XML_ERR_HYPHEN_IN_COMMENT: c_int = 80;
pub const XML_ERR_INVALID_ENCODING: c_int = 81;
pub const XML_ERR_EXT_ENTITY_STANDALONE: c_int = 82;
pub const XML_ERR_CONDSEC_INVALID: c_int = 83;
pub const XML_ERR_VALUE_REQUIRED: c_int = 84;
pub const XML_ERR_NOT_WELL_BALANCED: c_int = 85;
pub const XML_ERR_EXTRA_CONTENT: c_int = 86;
pub const XML_ERR_ENTITY_CHAR_ERROR: c_int = 87;
pub const XML_ERR_ENTITY_PE_INTERNAL: c_int = 88;
pub const XML_ERR_ENTITY_LOOP: c_int = 89;
pub const XML_ERR_ENTITY_BOUNDARY: c_int = 90;
pub const XML_ERR_INVALID_URI: c_int = 91;
pub const XML_ERR_URI_FRAGMENT: c_int = 92;
pub const XML_WAR_CATALOG_PI: c_int = 93;
pub const XML_ERR_NO_DTD: c_int = 94;
pub const XML_ERR_CONDSEC_INVALID_KEYWORD: c_int = 95;
pub const XML_ERR_VERSION_MISSING: c_int = 96;
pub const XML_WAR_UNKNOWN_VERSION: c_int = 97;
pub const XML_WAR_LANG_VALUE: c_int = 98;
pub const XML_WAR_NS_URI: c_int = 99;
pub const XML_WAR_NS_URI_RELATIVE: c_int = 100;
pub const XML_ERR_MISSING_ENCODING: c_int = 101;
pub const XML_WAR_SPACE_VALUE: c_int = 102;
pub const XML_ERR_NOT_STANDALONE: c_int = 103;
pub const XML_ERR_ENTITY_PROCESSING: c_int = 104;
pub const XML_ERR_NOTATION_PROCESSING: c_int = 105;
pub const XML_WAR_NS_COLUMN: c_int = 106;
pub const XML_WAR_ENTITY_REDEFINED: c_int = 107;
pub const XML_ERR_UNKNOWN_VERSION: c_int = 108;
pub const XML_ERR_VERSION_MISMATCH: c_int = 109;
pub const XML_ERR_NAME_TOO_LONG: c_int = 110;
pub const XML_ERR_USER_STOP: c_int = 111;
pub const XML_ERR_COMMENT_ABRUPTLY_ENDED: c_int = 112;
pub const XML_NS_ERR_XML_NAMESPACE: c_int = 200;
pub const XML_NS_ERR_UNDEFINED_NAMESPACE: c_int = 201;
pub const XML_NS_ERR_QNAME: c_int = 202;
pub const XML_NS_ERR_ATTRIBUTE_REDEFINED: c_int = 203;
pub const XML_NS_ERR_EMPTY: c_int = 204;
pub const XML_NS_ERR_COLON: c_int = 205;
pub const XML_DTD_ATTRIBUTE_DEFAULT: c_int = 500;
pub const XML_DTD_ATTRIBUTE_REDEFINED: c_int = 501;
pub const XML_DTD_ATTRIBUTE_VALUE: c_int = 502;
pub const XML_DTD_CONTENT_ERROR: c_int = 503;
pub const XML_DTD_CONTENT_MODEL: c_int = 504;
pub const XML_DTD_CONTENT_NOT_DETERMINIST: c_int = 505;
pub const XML_DTD_DIFFERENT_PREFIX: c_int = 506;
pub const XML_DTD_ELEM_DEFAULT_NAMESPACE: c_int = 507;
pub const XML_DTD_ELEM_NAMESPACE: c_int = 508;
pub const XML_DTD_ELEM_REDEFINED: c_int = 509;
pub const XML_DTD_EMPTY_NOTATION: c_int = 510;
pub const XML_DTD_ENTITY_TYPE: c_int = 511;
pub const XML_DTD_ID_FIXED: c_int = 512;
pub const XML_DTD_ID_REDEFINED: c_int = 513;
pub const XML_DTD_ID_SUBSET: c_int = 514;
pub const XML_DTD_INVALID_CHILD: c_int = 515;
pub const XML_DTD_INVALID_DEFAULT: c_int = 516;
pub const XML_DTD_LOAD_ERROR: c_int = 517;
pub const XML_DTD_MISSING_ATTRIBUTE: c_int = 518;
pub const XML_DTD_MIXED_CORRUPT: c_int = 519;
pub const XML_DTD_MULTIPLE_ID: c_int = 520;
pub const XML_DTD_NO_DOC: c_int = 521;
pub const XML_DTD_NO_DTD: c_int = 522;
pub const XML_DTD_NO_ELEM_NAME: c_int = 523;
pub const XML_DTD_NO_PREFIX: c_int = 524;
pub const XML_DTD_NO_ROOT: c_int = 525;
pub const XML_DTD_NOTATION_REDEFINED: c_int = 526;
pub const XML_DTD_NOTATION_VALUE: c_int = 527;
pub const XML_DTD_NOT_EMPTY: c_int = 528;
pub const XML_DTD_NOT_PCDATA: c_int = 529;
pub const XML_DTD_NOT_STANDALONE: c_int = 530;
pub const XML_DTD_ROOT_NAME: c_int = 531;
pub const XML_DTD_STANDALONE_WHITE_SPACE: c_int = 532;
pub const XML_DTD_UNKNOWN_ATTRIBUTE: c_int = 533;
pub const XML_DTD_UNKNOWN_ELEM: c_int = 534;
pub const XML_DTD_UNKNOWN_ENTITY: c_int = 535;
pub const XML_DTD_UNKNOWN_ID: c_int = 536;
pub const XML_DTD_UNKNOWN_NOTATION: c_int = 537;
pub const XML_DTD_STANDALONE_DEFAULTED: c_int = 538;
pub const XML_DTD_XMLID_VALUE: c_int = 539;
pub const XML_DTD_XMLID_TYPE: c_int = 540;
pub const XML_DTD_DUP_TOKEN: c_int = 541;
pub const XML_HTML_STRUCURE_ERROR: c_int = 800;
pub const XML_HTML_UNKNOWN_TAG: c_int = 801;
pub const XML_HTML_INCORRECTLY_OPENED_COMMENT: c_int = 802;
pub const XML_RNGP_ANYNAME_ATTR_ANCESTOR: c_int = 1000;
pub const XML_RNGP_ATTR_CONFLICT: c_int = 1001;
pub const XML_RNGP_ATTRIBUTE_CHILDREN: c_int = 1002;
pub const XML_RNGP_ATTRIBUTE_CONTENT: c_int = 1003;
pub const XML_RNGP_ATTRIBUTE_EMPTY: c_int = 1004;
pub const XML_RNGP_ATTRIBUTE_NOOP: c_int = 1005;
pub const XML_RNGP_CHOICE_CONTENT: c_int = 1006;
pub const XML_RNGP_CHOICE_EMPTY: c_int = 1007;
pub const XML_RNGP_CREATE_FAILURE: c_int = 1008;
pub const XML_RNGP_DATA_CONTENT: c_int = 1009;
pub const XML_RNGP_DEF_CHOICE_AND_INTERLEAVE: c_int = 1010;
pub const XML_RNGP_DEFINE_CREATE_FAILED: c_int = 1011;
pub const XML_RNGP_DEFINE_EMPTY: c_int = 1012;
pub const XML_RNGP_DEFINE_MISSING: c_int = 1013;
pub const XML_RNGP_DEFINE_NAME_MISSING: c_int = 1014;
pub const XML_RNGP_ELEM_CONTENT_EMPTY: c_int = 1015;
pub const XML_RNGP_ELEM_CONTENT_ERROR: c_int = 1016;
pub const XML_RNGP_ELEMENT_EMPTY: c_int = 1017;
pub const XML_RNGP_ELEMENT_CONTENT: c_int = 1018;
pub const XML_RNGP_ELEMENT_NAME: c_int = 1019;
pub const XML_RNGP_ELEMENT_NO_CONTENT: c_int = 1020;
pub const XML_RNGP_ELEM_TEXT_CONFLICT: c_int = 1021;
pub const XML_RNGP_EMPTY: c_int = 1022;
pub const XML_RNGP_EMPTY_CONSTRUCT: c_int = 1023;
pub const XML_RNGP_EMPTY_CONTENT: c_int = 1024;
pub const XML_RNGP_EMPTY_NOT_EMPTY: c_int = 1025;
pub const XML_RNGP_ERROR_TYPE_LIB: c_int = 1026;
pub const XML_RNGP_EXCEPT_EMPTY: c_int = 1027;
pub const XML_RNGP_EXCEPT_MISSING: c_int = 1028;
pub const XML_RNGP_EXCEPT_MULTIPLE: c_int = 1029;
pub const XML_RNGP_EXCEPT_NO_CONTENT: c_int = 1030;
pub const XML_RNGP_EXTERNALREF_EMTPY: c_int = 1031;
pub const XML_RNGP_EXTERNAL_REF_FAILURE: c_int = 1032;
pub const XML_RNGP_EXTERNALREF_RECURSE: c_int = 1033;
pub const XML_RNGP_FORBIDDEN_ATTRIBUTE: c_int = 1034;
pub const XML_RNGP_FOREIGN_ELEMENT: c_int = 1035;
pub const XML_RNGP_GRAMMAR_CONTENT: c_int = 1036;
pub const XML_RNGP_GRAMMAR_EMPTY: c_int = 1037;
pub const XML_RNGP_GRAMMAR_MISSING: c_int = 1038;
pub const XML_RNGP_GRAMMAR_NO_START: c_int = 1039;
pub const XML_RNGP_GROUP_ATTR_CONFLICT: c_int = 1040;
pub const XML_RNGP_HREF_ERROR: c_int = 1041;
pub const XML_RNGP_INCLUDE_EMPTY: c_int = 1042;
pub const XML_RNGP_INCLUDE_FAILURE: c_int = 1043;
pub const XML_RNGP_INCLUDE_RECURSE: c_int = 1044;
pub const XML_RNGP_INTERLEAVE_ADD: c_int = 1045;
pub const XML_RNGP_INTERLEAVE_CREATE_FAILED: c_int = 1046;
pub const XML_RNGP_INTERLEAVE_EMPTY: c_int = 1047;
pub const XML_RNGP_INTERLEAVE_NO_CONTENT: c_int = 1048;
pub const XML_RNGP_INVALID_DEFINE_NAME: c_int = 1049;
pub const XML_RNGP_INVALID_URI: c_int = 1050;
pub const XML_RNGP_INVALID_VALUE: c_int = 1051;
pub const XML_RNGP_MISSING_HREF: c_int = 1052;
pub const XML_RNGP_NAME_MISSING: c_int = 1053;
pub const XML_RNGP_NEED_COMBINE: c_int = 1054;
pub const XML_RNGP_NOTALLOWED_NOT_EMPTY: c_int = 1055;
pub const XML_RNGP_NSNAME_ATTR_ANCESTOR: c_int = 1056;
pub const XML_RNGP_NSNAME_NO_NS: c_int = 1057;
pub const XML_RNGP_PARAM_FORBIDDEN: c_int = 1058;
pub const XML_RNGP_PARAM_NAME_MISSING: c_int = 1059;
pub const XML_RNGP_PARENTREF_CREATE_FAILED: c_int = 1060;
pub const XML_RNGP_PARENTREF_NAME_INVALID: c_int = 1061;
pub const XML_RNGP_PARENTREF_NO_NAME: c_int = 1062;
pub const XML_RNGP_PARENTREF_NO_PARENT: c_int = 1063;
pub const XML_RNGP_PARENTREF_NOT_EMPTY: c_int = 1064;
pub const XML_RNGP_PARSE_ERROR: c_int = 1065;
pub const XML_RNGP_PAT_ANYNAME_EXCEPT_ANYNAME: c_int = 1066;
pub const XML_RNGP_PAT_ATTR_ATTR: c_int = 1067;
pub const XML_RNGP_PAT_ATTR_ELEM: c_int = 1068;
pub const XML_RNGP_PAT_DATA_EXCEPT_ATTR: c_int = 1069;
pub const XML_RNGP_PAT_DATA_EXCEPT_ELEM: c_int = 1070;
pub const XML_RNGP_PAT_DATA_EXCEPT_EMPTY: c_int = 1071;
pub const XML_RNGP_PAT_DATA_EXCEPT_GROUP: c_int = 1072;
pub const XML_RNGP_PAT_DATA_EXCEPT_INTERLEAVE: c_int = 1073;
pub const XML_RNGP_PAT_DATA_EXCEPT_LIST: c_int = 1074;
pub const XML_RNGP_PAT_DATA_EXCEPT_ONEMORE: c_int = 1075;
pub const XML_RNGP_PAT_DATA_EXCEPT_REF: c_int = 1076;
pub const XML_RNGP_PAT_DATA_EXCEPT_TEXT: c_int = 1077;
pub const XML_RNGP_PAT_LIST_ATTR: c_int = 1078;
pub const XML_RNGP_PAT_LIST_ELEM: c_int = 1079;
pub const XML_RNGP_PAT_LIST_INTERLEAVE: c_int = 1080;
pub const XML_RNGP_PAT_LIST_LIST: c_int = 1081;
pub const XML_RNGP_PAT_LIST_REF: c_int = 1082;
pub const XML_RNGP_PAT_LIST_TEXT: c_int = 1083;
pub const XML_RNGP_PAT_NSNAME_EXCEPT_ANYNAME: c_int = 1084;
pub const XML_RNGP_PAT_NSNAME_EXCEPT_NSNAME: c_int = 1085;
pub const XML_RNGP_PAT_ONEMORE_GROUP_ATTR: c_int = 1086;
pub const XML_RNGP_PAT_ONEMORE_INTERLEAVE_ATTR: c_int = 1087;
pub const XML_RNGP_PAT_START_ATTR: c_int = 1088;
pub const XML_RNGP_PAT_START_DATA: c_int = 1089;
pub const XML_RNGP_PAT_START_EMPTY: c_int = 1090;
pub const XML_RNGP_PAT_START_GROUP: c_int = 1091;
pub const XML_RNGP_PAT_START_INTERLEAVE: c_int = 1092;
pub const XML_RNGP_PAT_START_LIST: c_int = 1093;
pub const XML_RNGP_PAT_START_ONEMORE: c_int = 1094;
pub const XML_RNGP_PAT_START_TEXT: c_int = 1095;
pub const XML_RNGP_PAT_START_VALUE: c_int = 1096;
pub const XML_RNGP_PREFIX_UNDEFINED: c_int = 1097;
pub const XML_RNGP_REF_CREATE_FAILED: c_int = 1098;
pub const XML_RNGP_REF_CYCLE: c_int = 1099;
pub const XML_RNGP_REF_NAME_INVALID: c_int = 1100;
pub const XML_RNGP_REF_NO_DEF: c_int = 1101;
pub const XML_RNGP_REF_NO_NAME: c_int = 1102;
pub const XML_RNGP_REF_NOT_EMPTY: c_int = 1103;
pub const XML_RNGP_START_CHOICE_AND_INTERLEAVE: c_int = 1104;
pub const XML_RNGP_START_CONTENT: c_int = 1105;
pub const XML_RNGP_START_EMPTY: c_int = 1106;
pub const XML_RNGP_START_MISSING: c_int = 1107;
pub const XML_RNGP_TEXT_EXPECTED: c_int = 1108;
pub const XML_RNGP_TEXT_HAS_CHILD: c_int = 1109;
pub const XML_RNGP_TYPE_MISSING: c_int = 1110;
pub const XML_RNGP_TYPE_NOT_FOUND: c_int = 1111;
pub const XML_RNGP_TYPE_VALUE: c_int = 1112;
pub const XML_RNGP_UNKNOWN_ATTRIBUTE: c_int = 1113;
pub const XML_RNGP_UNKNOWN_COMBINE: c_int = 1114;
pub const XML_RNGP_UNKNOWN_CONSTRUCT: c_int = 1115;
pub const XML_RNGP_UNKNOWN_TYPE_LIB: c_int = 1116;
pub const XML_RNGP_URI_FRAGMENT: c_int = 1117;
pub const XML_RNGP_URI_NOT_ABSOLUTE: c_int = 1118;
pub const XML_RNGP_VALUE_EMPTY: c_int = 1119;
pub const XML_RNGP_VALUE_NO_CONTENT: c_int = 1120;
pub const XML_RNGP_XMLNS_NAME: c_int = 1121;
pub const XML_RNGP_XML_NS: c_int = 1122;
pub const XML_XPATH_EXPRESSION_OK: c_int = 1200;
pub const XML_XPATH_NUMBER_ERROR: c_int = 1201;
pub const XML_XPATH_UNFINISHED_LITERAL_ERROR: c_int = 1202;
pub const XML_XPATH_START_LITERAL_ERROR: c_int = 1203;
pub const XML_XPATH_VARIABLE_REF_ERROR: c_int = 1204;
pub const XML_XPATH_UNDEF_VARIABLE_ERROR: c_int = 1205;
pub const XML_XPATH_INVALID_PREDICATE_ERROR: c_int = 1206;
pub const XML_XPATH_EXPR_ERROR: c_int = 1207;
pub const XML_XPATH_UNCLOSED_ERROR: c_int = 1208;
pub const XML_XPATH_UNKNOWN_FUNC_ERROR: c_int = 1209;
pub const XML_XPATH_INVALID_OPERAND: c_int = 1210;
pub const XML_XPATH_INVALID_TYPE: c_int = 1211;
pub const XML_XPATH_INVALID_ARITY: c_int = 1212;
pub const XML_XPATH_INVALID_CTXT_SIZE: c_int = 1213;
pub const XML_XPATH_INVALID_CTXT_POSITION: c_int = 1214;
pub const XML_XPATH_MEMORY_ERROR: c_int = 1215;
pub const XML_XPTR_SYNTAX_ERROR: c_int = 1216;
pub const XML_XPTR_RESOURCE_ERROR: c_int = 1217;
pub const XML_XPTR_SUB_RESOURCE_ERROR: c_int = 1218;
pub const XML_XPATH_UNDEF_PREFIX_ERROR: c_int = 1219;
pub const XML_XPATH_ENCODING_ERROR: c_int = 1220;
pub const XML_XPATH_INVALID_CHAR_ERROR: c_int = 1221;
pub const XML_TREE_INVALID_HEX: c_int = 1300;
pub const XML_TREE_INVALID_DEC: c_int = 1301;
pub const XML_TREE_UNTERMINATED_ENTITY: c_int = 1302;
pub const XML_TREE_NOT_UTF8: c_int = 1303;
pub const XML_SAVE_NOT_UTF8: c_int = 1400;
pub const XML_SAVE_CHAR_INVALID: c_int = 1401;
pub const XML_SAVE_NO_DOCTYPE: c_int = 1402;
pub const XML_SAVE_UNKNOWN_ENCODING: c_int = 1403;
pub const XML_REGEXP_COMPILE_ERROR: c_int = 1450;
pub const XML_IO_UNKNOWN: c_int = 1500;
pub const XML_IO_EACCES: c_int = 1501;
pub const XML_IO_EAGAIN: c_int = 1502;
pub const XML_IO_EBADF: c_int = 1503;
pub const XML_IO_EBADMSG: c_int = 1504;
pub const XML_IO_EBUSY: c_int = 1505;
pub const XML_IO_ECANCELED: c_int = 1506;
pub const XML_IO_ECHILD: c_int = 1507;
pub const XML_IO_EDEADLK: c_int = 1508;
pub const XML_IO_EDOM: c_int = 1509;
pub const XML_IO_EEXIST: c_int = 1510;
pub const XML_IO_EFAULT: c_int = 1511;
pub const XML_IO_EFBIG: c_int = 1512;
pub const XML_IO_EINPROGRESS: c_int = 1513;
pub const XML_IO_EINTR: c_int = 1514;
pub const XML_IO_EINVAL: c_int = 1515;
pub const XML_IO_EIO: c_int = 1516;
pub const XML_IO_EISDIR: c_int = 1517;
pub const XML_IO_EMFILE: c_int = 1518;
pub const XML_IO_EMLINK: c_int = 1519;
pub const XML_IO_EMSGSIZE: c_int = 1520;
pub const XML_IO_ENAMETOOLONG: c_int = 1521;
pub const XML_IO_ENFILE: c_int = 1522;
pub const XML_IO_ENODEV: c_int = 1523;
pub const XML_IO_ENOENT: c_int = 1524;
pub const XML_IO_ENOEXEC: c_int = 1525;
pub const XML_IO_ENOLCK: c_int = 1526;
pub const XML_IO_ENOMEM: c_int = 1527;
pub const XML_IO_ENOSPC: c_int = 1528;
pub const XML_IO_ENOSYS: c_int = 1529;
pub const XML_IO_ENOTDIR: c_int = 1530;
pub const XML_IO_ENOTEMPTY: c_int = 1531;
pub const XML_IO_ENOTSUP: c_int = 1532;
pub const XML_IO_ENOTTY: c_int = 1533;
pub const XML_IO_ENXIO: c_int = 1534;
pub const XML_IO_EPERM: c_int = 1535;
pub const XML_IO_EPIPE: c_int = 1536;
pub const XML_IO_ERANGE: c_int = 1537;
pub const XML_IO_EROFS: c_int = 1538;
pub const XML_IO_ESPIPE: c_int = 1539;
pub const XML_IO_ESRCH: c_int = 1540;
pub const XML_IO_ETIMEDOUT: c_int = 1541;
pub const XML_IO_EXDEV: c_int = 1542;
pub const XML_IO_NETWORK_ATTEMPT: c_int = 1543;
pub const XML_IO_ENCODER: c_int = 1544;
pub const XML_IO_FLUSH: c_int = 1545;
pub const XML_IO_WRITE: c_int = 1546;
pub const XML_IO_NO_INPUT: c_int = 1547;
pub const XML_IO_BUFFER_FULL: c_int = 1548;
pub const XML_IO_LOAD_ERROR: c_int = 1549;
pub const XML_IO_ENOTSOCK: c_int = 1550;
pub const XML_IO_EISCONN: c_int = 1551;
pub const XML_IO_ECONNREFUSED: c_int = 1552;
pub const XML_IO_ENETUNREACH: c_int = 1553;
pub const XML_IO_EADDRINUSE: c_int = 1554;
pub const XML_IO_EALREADY: c_int = 1555;
pub const XML_IO_EAFNOSUPPORT: c_int = 1556;
pub const XML_XINCLUDE_RECURSION: c_int = 1600;
pub const XML_XINCLUDE_PARSE_VALUE: c_int = 1601;
pub const XML_XINCLUDE_ENTITY_DEF_MISMATCH: c_int = 1602;
pub const XML_XINCLUDE_NO_HREF: c_int = 1603;
pub const XML_XINCLUDE_NO_FALLBACK: c_int = 1604;
pub const XML_XINCLUDE_HREF_URI: c_int = 1605;
pub const XML_XINCLUDE_TEXT_FRAGMENT: c_int = 1606;
pub const XML_XINCLUDE_TEXT_DOCUMENT: c_int = 1607;
pub const XML_XINCLUDE_INVALID_CHAR: c_int = 1608;
pub const XML_XINCLUDE_BUILD_FAILED: c_int = 1609;
pub const XML_XINCLUDE_UNKNOWN_ENCODING: c_int = 1610;
pub const XML_XINCLUDE_MULTIPLE_ROOT: c_int = 1611;
pub const XML_XINCLUDE_XPTR_FAILED: c_int = 1612;
pub const XML_XINCLUDE_XPTR_RESULT: c_int = 1613;
pub const XML_XINCLUDE_INCLUDE_IN_INCLUDE: c_int = 1614;
pub const XML_XINCLUDE_FALLBACKS_IN_INCLUDE: c_int = 1615;
pub const XML_XINCLUDE_FALLBACK_NOT_IN_INCLUDE: c_int = 1616;
pub const XML_XINCLUDE_DEPRECATED_NS: c_int = 1617;
pub const XML_XINCLUDE_FRAGMENT_ID: c_int = 1618;
pub const XML_CATALOG_MISSING_ATTR: c_int = 1650;
pub const XML_CATALOG_ENTRY_BROKEN: c_int = 1651;
pub const XML_CATALOG_PREFER_VALUE: c_int = 1652;
pub const XML_CATALOG_NOT_CATALOG: c_int = 1653;
pub const XML_CATALOG_RECURSION: c_int = 1654;
pub const XML_SCHEMAP_PREFIX_UNDEFINED: c_int = 1700;
pub const XML_SCHEMAP_ATTRFORMDEFAULT_VALUE: c_int = 1701;
pub const XML_SCHEMAP_ATTRGRP_NONAME_NOREF: c_int = 1702;
pub const XML_SCHEMAP_ATTR_NONAME_NOREF: c_int = 1703;
pub const XML_SCHEMAP_COMPLEXTYPE_NONAME_NOREF: c_int = 1704;
pub const XML_SCHEMAP_ELEMFORMDEFAULT_VALUE: c_int = 1705;
pub const XML_SCHEMAP_ELEM_NONAME_NOREF: c_int = 1706;
pub const XML_SCHEMAP_EXTENSION_NO_BASE: c_int = 1707;
pub const XML_SCHEMAP_FACET_NO_VALUE: c_int = 1708;
pub const XML_SCHEMAP_FAILED_BUILD_IMPORT: c_int = 1709;
pub const XML_SCHEMAP_GROUP_NONAME_NOREF: c_int = 1710;
pub const XML_SCHEMAP_IMPORT_NAMESPACE_NOT_URI: c_int = 1711;
pub const XML_SCHEMAP_IMPORT_REDEFINE_NSNAME: c_int = 1712;
pub const XML_SCHEMAP_IMPORT_SCHEMA_NOT_URI: c_int = 1713;
pub const XML_SCHEMAP_INVALID_BOOLEAN: c_int = 1714;
pub const XML_SCHEMAP_INVALID_ENUM: c_int = 1715;
pub const XML_SCHEMAP_INVALID_FACET: c_int = 1716;
pub const XML_SCHEMAP_INVALID_FACET_VALUE: c_int = 1717;
pub const XML_SCHEMAP_INVALID_MAXOCCURS: c_int = 1718;
pub const XML_SCHEMAP_INVALID_MINOCCURS: c_int = 1719;
pub const XML_SCHEMAP_INVALID_REF_AND_SUBTYPE: c_int = 1720;
pub const XML_SCHEMAP_INVALID_WHITE_SPACE: c_int = 1721;
pub const XML_SCHEMAP_NOATTR_NOREF: c_int = 1722;
pub const XML_SCHEMAP_NOTATION_NO_NAME: c_int = 1723;
pub const XML_SCHEMAP_NOTYPE_NOREF: c_int = 1724;
pub const XML_SCHEMAP_REF_AND_SUBTYPE: c_int = 1725;
pub const XML_SCHEMAP_RESTRICTION_NONAME_NOREF: c_int = 1726;
pub const XML_SCHEMAP_SIMPLETYPE_NONAME: c_int = 1727;
pub const XML_SCHEMAP_TYPE_AND_SUBTYPE: c_int = 1728;
pub const XML_SCHEMAP_UNKNOWN_ALL_CHILD: c_int = 1729;
pub const XML_SCHEMAP_UNKNOWN_ANYATTRIBUTE_CHILD: c_int = 1730;
pub const XML_SCHEMAP_UNKNOWN_ATTR_CHILD: c_int = 1731;
pub const XML_SCHEMAP_UNKNOWN_ATTRGRP_CHILD: c_int = 1732;
pub const XML_SCHEMAP_UNKNOWN_ATTRIBUTE_GROUP: c_int = 1733;
pub const XML_SCHEMAP_UNKNOWN_BASE_TYPE: c_int = 1734;
pub const XML_SCHEMAP_UNKNOWN_CHOICE_CHILD: c_int = 1735;
pub const XML_SCHEMAP_UNKNOWN_COMPLEXCONTENT_CHILD: c_int = 1736;
pub const XML_SCHEMAP_UNKNOWN_COMPLEXTYPE_CHILD: c_int = 1737;
pub const XML_SCHEMAP_UNKNOWN_ELEM_CHILD: c_int = 1738;
pub const XML_SCHEMAP_UNKNOWN_EXTENSION_CHILD: c_int = 1739;
pub const XML_SCHEMAP_UNKNOWN_FACET_CHILD: c_int = 1740;
pub const XML_SCHEMAP_UNKNOWN_FACET_TYPE: c_int = 1741;
pub const XML_SCHEMAP_UNKNOWN_GROUP_CHILD: c_int = 1742;
pub const XML_SCHEMAP_UNKNOWN_IMPORT_CHILD: c_int = 1743;
pub const XML_SCHEMAP_UNKNOWN_LIST_CHILD: c_int = 1744;
pub const XML_SCHEMAP_UNKNOWN_NOTATION_CHILD: c_int = 1745;
pub const XML_SCHEMAP_UNKNOWN_PROCESSCONTENT_CHILD: c_int = 1746;
pub const XML_SCHEMAP_UNKNOWN_REF: c_int = 1747;
pub const XML_SCHEMAP_UNKNOWN_RESTRICTION_CHILD: c_int = 1748;
pub const XML_SCHEMAP_UNKNOWN_SCHEMAS_CHILD: c_int = 1749;
pub const XML_SCHEMAP_UNKNOWN_SEQUENCE_CHILD: c_int = 1750;
pub const XML_SCHEMAP_UNKNOWN_SIMPLECONTENT_CHILD: c_int = 1751;
pub const XML_SCHEMAP_UNKNOWN_SIMPLETYPE_CHILD: c_int = 1752;
pub const XML_SCHEMAP_UNKNOWN_TYPE: c_int = 1753;
pub const XML_SCHEMAP_UNKNOWN_UNION_CHILD: c_int = 1754;
pub const XML_SCHEMAP_ELEM_DEFAULT_FIXED: c_int = 1755;
pub const XML_SCHEMAP_REGEXP_INVALID: c_int = 1756;
pub const XML_SCHEMAP_FAILED_LOAD: c_int = 1757;
pub const XML_SCHEMAP_NOTHING_TO_PARSE: c_int = 1758;
pub const XML_SCHEMAP_NOROOT: c_int = 1759;
pub const XML_SCHEMAP_REDEFINED_GROUP: c_int = 1760;
pub const XML_SCHEMAP_REDEFINED_TYPE: c_int = 1761;
pub const XML_SCHEMAP_REDEFINED_ELEMENT: c_int = 1762;
pub const XML_SCHEMAP_REDEFINED_ATTRGROUP: c_int = 1763;
pub const XML_SCHEMAP_REDEFINED_ATTR: c_int = 1764;
pub const XML_SCHEMAP_REDEFINED_NOTATION: c_int = 1765;
pub const XML_SCHEMAP_FAILED_PARSE: c_int = 1766;
pub const XML_SCHEMAP_UNKNOWN_PREFIX: c_int = 1767;
pub const XML_SCHEMAP_DEF_AND_PREFIX: c_int = 1768;
pub const XML_SCHEMAP_UNKNOWN_INCLUDE_CHILD: c_int = 1769;
pub const XML_SCHEMAP_INCLUDE_SCHEMA_NOT_URI: c_int = 1770;
pub const XML_SCHEMAP_INCLUDE_SCHEMA_NO_URI: c_int = 1771;
pub const XML_SCHEMAP_NOT_SCHEMA: c_int = 1772;
pub const XML_SCHEMAP_UNKNOWN_MEMBER_TYPE: c_int = 1773;
pub const XML_SCHEMAP_INVALID_ATTR_USE: c_int = 1774;
pub const XML_SCHEMAP_RECURSIVE: c_int = 1775;
pub const XML_SCHEMAP_SUPERNUMEROUS_LIST_ITEM_TYPE: c_int = 1776;
pub const XML_SCHEMAP_INVALID_ATTR_COMBINATION: c_int = 1777;
pub const XML_SCHEMAP_INVALID_ATTR_INLINE_COMBINATION: c_int = 1778;
pub const XML_SCHEMAP_MISSING_SIMPLETYPE_CHILD: c_int = 1779;
pub const XML_SCHEMAP_INVALID_ATTR_NAME: c_int = 1780;
pub const XML_SCHEMAP_REF_AND_CONTENT: c_int = 1781;
pub const XML_SCHEMAP_CT_PROPS_CORRECT_1: c_int = 1782;
pub const XML_SCHEMAP_CT_PROPS_CORRECT_2: c_int = 1783;
pub const XML_SCHEMAP_CT_PROPS_CORRECT_3: c_int = 1784;
pub const XML_SCHEMAP_CT_PROPS_CORRECT_4: c_int = 1785;
pub const XML_SCHEMAP_CT_PROPS_CORRECT_5: c_int = 1786;
pub const XML_SCHEMAP_DERIVATION_OK_RESTRICTION_1: c_int = 1787;
pub const XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_1_1: c_int = 1788;
pub const XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_1_2: c_int = 1789;
pub const XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_2: c_int = 1790;
pub const XML_SCHEMAP_DERIVATION_OK_RESTRICTION_3: c_int = 1791;
pub const XML_SCHEMAP_WILDCARD_INVALID_NS_MEMBER: c_int = 1792;
pub const XML_SCHEMAP_INTERSECTION_NOT_EXPRESSIBLE: c_int = 1793;
pub const XML_SCHEMAP_UNION_NOT_EXPRESSIBLE: c_int = 1794;
pub const XML_SCHEMAP_SRC_IMPORT_3_1: c_int = 1795;
pub const XML_SCHEMAP_SRC_IMPORT_3_2: c_int = 1796;
pub const XML_SCHEMAP_DERIVATION_OK_RESTRICTION_4_1: c_int = 1797;
pub const XML_SCHEMAP_DERIVATION_OK_RESTRICTION_4_2: c_int = 1798;
pub const XML_SCHEMAP_DERIVATION_OK_RESTRICTION_4_3: c_int = 1799;
pub const XML_SCHEMAP_COS_CT_EXTENDS_1_3: c_int = 1800;
pub const XML_SCHEMAV_NOROOT: c_int = 1801;
pub const XML_SCHEMAV_UNDECLAREDELEM: c_int = 1802;
pub const XML_SCHEMAV_NOTTOPLEVEL: c_int = 1803;
pub const XML_SCHEMAV_MISSING: c_int = 1804;
pub const XML_SCHEMAV_WRONGELEM: c_int = 1805;
pub const XML_SCHEMAV_NOTYPE: c_int = 1806;
pub const XML_SCHEMAV_NOROLLBACK: c_int = 1807;
pub const XML_SCHEMAV_ISABSTRACT: c_int = 1808;
pub const XML_SCHEMAV_NOTEMPTY: c_int = 1809;
pub const XML_SCHEMAV_ELEMCONT: c_int = 1810;
pub const XML_SCHEMAV_HAVEDEFAULT: c_int = 1811;
pub const XML_SCHEMAV_NOTNILLABLE: c_int = 1812;
pub const XML_SCHEMAV_EXTRACONTENT: c_int = 1813;
pub const XML_SCHEMAV_INVALIDATTR: c_int = 1814;
pub const XML_SCHEMAV_INVALIDELEM: c_int = 1815;
pub const XML_SCHEMAV_NOTDETERMINIST: c_int = 1816;
pub const XML_SCHEMAV_CONSTRUCT: c_int = 1817;
pub const XML_SCHEMAV_INTERNAL: c_int = 1818;
pub const XML_SCHEMAV_NOTSIMPLE: c_int = 1819;
pub const XML_SCHEMAV_ATTRUNKNOWN: c_int = 1820;
pub const XML_SCHEMAV_ATTRINVALID: c_int = 1821;
pub const XML_SCHEMAV_VALUE: c_int = 1822;
pub const XML_SCHEMAV_FACET: c_int = 1823;
pub const XML_SCHEMAV_CVC_DATATYPE_VALID_1_2_1: c_int = 1824;
pub const XML_SCHEMAV_CVC_DATATYPE_VALID_1_2_2: c_int = 1825;
pub const XML_SCHEMAV_CVC_DATATYPE_VALID_1_2_3: c_int = 1826;
pub const XML_SCHEMAV_CVC_TYPE_3_1_1: c_int = 1827;
pub const XML_SCHEMAV_CVC_TYPE_3_1_2: c_int = 1828;
pub const XML_SCHEMAV_CVC_FACET_VALID: c_int = 1829;
pub const XML_SCHEMAV_CVC_LENGTH_VALID: c_int = 1830;
pub const XML_SCHEMAV_CVC_MINLENGTH_VALID: c_int = 1831;
pub const XML_SCHEMAV_CVC_MAXLENGTH_VALID: c_int = 1832;
pub const XML_SCHEMAV_CVC_MININCLUSIVE_VALID: c_int = 1833;
pub const XML_SCHEMAV_CVC_MAXINCLUSIVE_VALID: c_int = 1834;
pub const XML_SCHEMAV_CVC_MINEXCLUSIVE_VALID: c_int = 1835;
pub const XML_SCHEMAV_CVC_MAXEXCLUSIVE_VALID: c_int = 1836;
pub const XML_SCHEMAV_CVC_TOTALDIGITS_VALID: c_int = 1837;
pub const XML_SCHEMAV_CVC_FRACTIONDIGITS_VALID: c_int = 1838;
pub const XML_SCHEMAV_CVC_PATTERN_VALID: c_int = 1839;
pub const XML_SCHEMAV_CVC_ENUMERATION_VALID: c_int = 1840;
pub const XML_SCHEMAV_CVC_COMPLEX_TYPE_2_1: c_int = 1841;
pub const XML_SCHEMAV_CVC_COMPLEX_TYPE_2_2: c_int = 1842;
pub const XML_SCHEMAV_CVC_COMPLEX_TYPE_2_3: c_int = 1843;
pub const XML_SCHEMAV_CVC_COMPLEX_TYPE_2_4: c_int = 1844;
pub const XML_SCHEMAV_CVC_ELT_1: c_int = 1845;
pub const XML_SCHEMAV_CVC_ELT_2: c_int = 1846;
pub const XML_SCHEMAV_CVC_ELT_3_1: c_int = 1847;
pub const XML_SCHEMAV_CVC_ELT_3_2_1: c_int = 1848;
pub const XML_SCHEMAV_CVC_ELT_3_2_2: c_int = 1849;
pub const XML_SCHEMAV_CVC_ELT_4_1: c_int = 1850;
pub const XML_SCHEMAV_CVC_ELT_4_2: c_int = 1851;
pub const XML_SCHEMAV_CVC_ELT_4_3: c_int = 1852;
pub const XML_SCHEMAV_CVC_ELT_5_1_1: c_int = 1853;
pub const XML_SCHEMAV_CVC_ELT_5_1_2: c_int = 1854;
pub const XML_SCHEMAV_CVC_ELT_5_2_1: c_int = 1855;
pub const XML_SCHEMAV_CVC_ELT_5_2_2_1: c_int = 1856;
pub const XML_SCHEMAV_CVC_ELT_5_2_2_2_1: c_int = 1857;
pub const XML_SCHEMAV_CVC_ELT_5_2_2_2_2: c_int = 1858;
pub const XML_SCHEMAV_CVC_ELT_6: c_int = 1859;
pub const XML_SCHEMAV_CVC_ELT_7: c_int = 1860;
pub const XML_SCHEMAV_CVC_ATTRIBUTE_1: c_int = 1861;
pub const XML_SCHEMAV_CVC_ATTRIBUTE_2: c_int = 1862;
pub const XML_SCHEMAV_CVC_ATTRIBUTE_3: c_int = 1863;
pub const XML_SCHEMAV_CVC_ATTRIBUTE_4: c_int = 1864;
pub const XML_SCHEMAV_CVC_COMPLEX_TYPE_3_1: c_int = 1865;
pub const XML_SCHEMAV_CVC_COMPLEX_TYPE_3_2_1: c_int = 1866;
pub const XML_SCHEMAV_CVC_COMPLEX_TYPE_3_2_2: c_int = 1867;
pub const XML_SCHEMAV_CVC_COMPLEX_TYPE_4: c_int = 1868;
pub const XML_SCHEMAV_CVC_COMPLEX_TYPE_5_1: c_int = 1869;
pub const XML_SCHEMAV_CVC_COMPLEX_TYPE_5_2: c_int = 1870;
pub const XML_SCHEMAV_ELEMENT_CONTENT: c_int = 1871;
pub const XML_SCHEMAV_DOCUMENT_ELEMENT_MISSING: c_int = 1872;
pub const XML_SCHEMAV_CVC_COMPLEX_TYPE_1: c_int = 1873;
pub const XML_SCHEMAV_CVC_AU: c_int = 1874;
pub const XML_SCHEMAV_CVC_TYPE_1: c_int = 1875;
pub const XML_SCHEMAV_CVC_TYPE_2: c_int = 1876;
pub const XML_SCHEMAV_CVC_IDC: c_int = 1877;
pub const XML_SCHEMAV_CVC_WILDCARD: c_int = 1878;
pub const XML_SCHEMAV_MISC: c_int = 1879;
pub const XML_XPTR_UNKNOWN_SCHEME: c_int = 1900;
pub const XML_XPTR_CHILDSEQ_START: c_int = 1901;
pub const XML_XPTR_EVAL_FAILED: c_int = 1902;
pub const XML_XPTR_EXTRA_OBJECTS: c_int = 1903;
pub const XML_C14N_CREATE_CTXT: c_int = 1950;
pub const XML_C14N_REQUIRES_UTF8: c_int = 1951;
pub const XML_C14N_CREATE_STACK: c_int = 1952;
pub const XML_C14N_INVALID_NODE: c_int = 1953;
pub const XML_C14N_UNKNOW_NODE: c_int = 1954;
pub const XML_C14N_RELATIVE_NAMESPACE: c_int = 1955;
pub const XML_FTP_PASV_ANSWER: c_int = 2000;
pub const XML_FTP_EPSV_ANSWER: c_int = 2001;
pub const XML_FTP_ACCNT: c_int = 2002;
pub const XML_FTP_URL_SYNTAX: c_int = 2003;
pub const XML_HTTP_URL_SYNTAX: c_int = 2020;
pub const XML_HTTP_USE_IP: c_int = 2021;
pub const XML_HTTP_UNKNOWN_HOST: c_int = 2022;
pub const XML_SCHEMAP_SRC_SIMPLE_TYPE_1: c_int = 3000;
pub const XML_SCHEMAP_SRC_SIMPLE_TYPE_2: c_int = 3001;
pub const XML_SCHEMAP_SRC_SIMPLE_TYPE_3: c_int = 3002;
pub const XML_SCHEMAP_SRC_SIMPLE_TYPE_4: c_int = 3003;
pub const XML_SCHEMAP_SRC_RESOLVE: c_int = 3004;
pub const XML_SCHEMAP_SRC_RESTRICTION_BASE_OR_SIMPLETYPE: c_int = 3005;
pub const XML_SCHEMAP_SRC_LIST_ITEMTYPE_OR_SIMPLETYPE: c_int = 3006;
pub const XML_SCHEMAP_SRC_UNION_MEMBERTYPES_OR_SIMPLETYPES: c_int = 3007;
pub const XML_SCHEMAP_ST_PROPS_CORRECT_1: c_int = 3008;
pub const XML_SCHEMAP_ST_PROPS_CORRECT_2: c_int = 3009;
pub const XML_SCHEMAP_ST_PROPS_CORRECT_3: c_int = 3010;
pub const XML_SCHEMAP_COS_ST_RESTRICTS_1_1: c_int = 3011;
pub const XML_SCHEMAP_COS_ST_RESTRICTS_1_2: c_int = 3012;
pub const XML_SCHEMAP_COS_ST_RESTRICTS_1_3_1: c_int = 3013;
pub const XML_SCHEMAP_COS_ST_RESTRICTS_1_3_2: c_int = 3014;
pub const XML_SCHEMAP_COS_ST_RESTRICTS_2_1: c_int = 3015;
pub const XML_SCHEMAP_COS_ST_RESTRICTS_2_3_1_1: c_int = 3016;
pub const XML_SCHEMAP_COS_ST_RESTRICTS_2_3_1_2: c_int = 3017;
pub const XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_1: c_int = 3018;
pub const XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_2: c_int = 3019;
pub const XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_3: c_int = 3020;
pub const XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_4: c_int = 3021;
pub const XML_SCHEMAP_COS_ST_RESTRICTS_2_3_2_5: c_int = 3022;
pub const XML_SCHEMAP_COS_ST_RESTRICTS_3_1: c_int = 3023;
pub const XML_SCHEMAP_COS_ST_RESTRICTS_3_3_1: c_int = 3024;
pub const XML_SCHEMAP_COS_ST_RESTRICTS_3_3_1_2: c_int = 3025;
pub const XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_2: c_int = 3026;
pub const XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_1: c_int = 3027;
pub const XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_3: c_int = 3028;
pub const XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_4: c_int = 3029;
pub const XML_SCHEMAP_COS_ST_RESTRICTS_3_3_2_5: c_int = 3030;
pub const XML_SCHEMAP_COS_ST_DERIVED_OK_2_1: c_int = 3031;
pub const XML_SCHEMAP_COS_ST_DERIVED_OK_2_2: c_int = 3032;
pub const XML_SCHEMAP_S4S_ELEM_NOT_ALLOWED: c_int = 3033;
pub const XML_SCHEMAP_S4S_ELEM_MISSING: c_int = 3034;
pub const XML_SCHEMAP_S4S_ATTR_NOT_ALLOWED: c_int = 3035;
pub const XML_SCHEMAP_S4S_ATTR_MISSING: c_int = 3036;
pub const XML_SCHEMAP_S4S_ATTR_INVALID_VALUE: c_int = 3037;
pub const XML_SCHEMAP_SRC_ELEMENT_1: c_int = 3038;
pub const XML_SCHEMAP_SRC_ELEMENT_2_1: c_int = 3039;
pub const XML_SCHEMAP_SRC_ELEMENT_2_2: c_int = 3040;
pub const XML_SCHEMAP_SRC_ELEMENT_3: c_int = 3041;
pub const XML_SCHEMAP_P_PROPS_CORRECT_1: c_int = 3042;
pub const XML_SCHEMAP_P_PROPS_CORRECT_2_1: c_int = 3043;
pub const XML_SCHEMAP_P_PROPS_CORRECT_2_2: c_int = 3044;
pub const XML_SCHEMAP_E_PROPS_CORRECT_2: c_int = 3045;
pub const XML_SCHEMAP_E_PROPS_CORRECT_3: c_int = 3046;
pub const XML_SCHEMAP_E_PROPS_CORRECT_4: c_int = 3047;
pub const XML_SCHEMAP_E_PROPS_CORRECT_5: c_int = 3048;
pub const XML_SCHEMAP_E_PROPS_CORRECT_6: c_int = 3049;
pub const XML_SCHEMAP_SRC_INCLUDE: c_int = 3050;
pub const XML_SCHEMAP_SRC_ATTRIBUTE_1: c_int = 3051;
pub const XML_SCHEMAP_SRC_ATTRIBUTE_2: c_int = 3052;
pub const XML_SCHEMAP_SRC_ATTRIBUTE_3_1: c_int = 3053;
pub const XML_SCHEMAP_SRC_ATTRIBUTE_3_2: c_int = 3054;
pub const XML_SCHEMAP_SRC_ATTRIBUTE_4: c_int = 3055;
pub const XML_SCHEMAP_NO_XMLNS: c_int = 3056;
pub const XML_SCHEMAP_NO_XSI: c_int = 3057;
pub const XML_SCHEMAP_COS_VALID_DEFAULT_1: c_int = 3058;
pub const XML_SCHEMAP_COS_VALID_DEFAULT_2_1: c_int = 3059;
pub const XML_SCHEMAP_COS_VALID_DEFAULT_2_2_1: c_int = 3060;
pub const XML_SCHEMAP_COS_VALID_DEFAULT_2_2_2: c_int = 3061;
pub const XML_SCHEMAP_CVC_SIMPLE_TYPE: c_int = 3062;
pub const XML_SCHEMAP_COS_CT_EXTENDS_1_1: c_int = 3063;
pub const XML_SCHEMAP_SRC_IMPORT_1_1: c_int = 3064;
pub const XML_SCHEMAP_SRC_IMPORT_1_2: c_int = 3065;
pub const XML_SCHEMAP_SRC_IMPORT_2: c_int = 3066;
pub const XML_SCHEMAP_SRC_IMPORT_2_1: c_int = 3067;
pub const XML_SCHEMAP_SRC_IMPORT_2_2: c_int = 3068;
pub const XML_SCHEMAP_INTERNAL: c_int = 3069;
pub const XML_SCHEMAP_NOT_DETERMINISTIC: c_int = 3070;
pub const XML_SCHEMAP_SRC_ATTRIBUTE_GROUP_1: c_int = 3071;
pub const XML_SCHEMAP_SRC_ATTRIBUTE_GROUP_2: c_int = 3072;
pub const XML_SCHEMAP_SRC_ATTRIBUTE_GROUP_3: c_int = 3073;
pub const XML_SCHEMAP_MG_PROPS_CORRECT_1: c_int = 3074;
pub const XML_SCHEMAP_MG_PROPS_CORRECT_2: c_int = 3075;
pub const XML_SCHEMAP_SRC_CT_1: c_int = 3076;
pub const XML_SCHEMAP_DERIVATION_OK_RESTRICTION_2_1_3: c_int = 3077;
pub const XML_SCHEMAP_AU_PROPS_CORRECT_2: c_int = 3078;
pub const XML_SCHEMAP_A_PROPS_CORRECT_2: c_int = 3079;
pub const XML_SCHEMAP_C_PROPS_CORRECT: c_int = 3080;
pub const XML_SCHEMAP_SRC_REDEFINE: c_int = 3081;
pub const XML_SCHEMAP_SRC_IMPORT: c_int = 3082;
pub const XML_SCHEMAP_WARN_SKIP_SCHEMA: c_int = 3083;
pub const XML_SCHEMAP_WARN_UNLOCATED_SCHEMA: c_int = 3084;
pub const XML_SCHEMAP_WARN_ATTR_REDECL_PROH: c_int = 3085;
pub const XML_SCHEMAP_WARN_ATTR_POINTLESS_PROH: c_int = 3086;
pub const XML_SCHEMAP_AG_PROPS_CORRECT: c_int = 3087;
pub const XML_SCHEMAP_COS_CT_EXTENDS_1_2: c_int = 3088;
pub const XML_SCHEMAP_AU_PROPS_CORRECT: c_int = 3089;
pub const XML_SCHEMAP_A_PROPS_CORRECT_3: c_int = 3090;
pub const XML_SCHEMAP_COS_ALL_LIMITED: c_int = 3091;
pub const XML_SCHEMATRONV_ASSERT: c_int = 4000;
pub const XML_SCHEMATRONV_REPORT: c_int = 4001;
pub const XML_MODULE_OPEN: c_int = 4900;
pub const XML_MODULE_CLOSE: c_int = 4901;
pub const XML_CHECK_FOUND_ELEMENT: c_int = 5000;
pub const XML_CHECK_FOUND_ATTRIBUTE: c_int = 5001;
pub const XML_CHECK_FOUND_TEXT: c_int = 5002;
pub const XML_CHECK_FOUND_CDATA: c_int = 5003;
pub const XML_CHECK_FOUND_ENTITYREF: c_int = 5004;
pub const XML_CHECK_FOUND_ENTITY: c_int = 5005;
pub const XML_CHECK_FOUND_PI: c_int = 5006;
pub const XML_CHECK_FOUND_COMMENT: c_int = 5007;
pub const XML_CHECK_FOUND_DOCTYPE: c_int = 5008;
pub const XML_CHECK_FOUND_FRAGMENT: c_int = 5009;
pub const XML_CHECK_FOUND_NOTATION: c_int = 5010;
pub const XML_CHECK_UNKNOWN_NODE: c_int = 5011;
pub const XML_CHECK_ENTITY_TYPE: c_int = 5012;
pub const XML_CHECK_NO_PARENT: c_int = 5013;
pub const XML_CHECK_NO_DOC: c_int = 5014;
pub const XML_CHECK_NO_NAME: c_int = 5015;
pub const XML_CHECK_NO_ELEM: c_int = 5016;
pub const XML_CHECK_WRONG_DOC: c_int = 5017;
pub const XML_CHECK_NO_PREV: c_int = 5018;
pub const XML_CHECK_WRONG_PREV: c_int = 5019;
pub const XML_CHECK_NO_NEXT: c_int = 5020;
pub const XML_CHECK_WRONG_NEXT: c_int = 5021;
pub const XML_CHECK_NOT_DTD: c_int = 5022;
pub const XML_CHECK_NOT_ATTR: c_int = 5023;
pub const XML_CHECK_NOT_ATTR_DECL: c_int = 5024;
pub const XML_CHECK_NOT_ELEM_DECL: c_int = 5025;
pub const XML_CHECK_NOT_ENTITY_DECL: c_int = 5026;
pub const XML_CHECK_NOT_NS_DECL: c_int = 5027;
pub const XML_CHECK_NO_HREF: c_int = 5028;
pub const XML_CHECK_WRONG_PARENT: c_int = 5029;
pub const XML_CHECK_NS_SCOPE: c_int = 5030;
pub const XML_CHECK_NS_ANCESTOR: c_int = 5031;
pub const XML_CHECK_NOT_UTF8: c_int = 5032;
pub const XML_CHECK_NO_DICT: c_int = 5033;
pub const XML_CHECK_NOT_NCNAME: c_int = 5034;
pub const XML_CHECK_OUTSIDE_DICT: c_int = 5035;
pub const XML_CHECK_WRONG_NAME: c_int = 5036;
pub const XML_CHECK_NAME_NOT_NULL: c_int = 5037;
pub const XML_I18N_NO_NAME: c_int = 6000;
pub const XML_I18N_NO_HANDLER: c_int = 6001;
pub const XML_I18N_EXCESS_HANDLER: c_int = 6002;
pub const XML_I18N_CONV_FAILED: c_int = 6003;
pub const XML_I18N_NO_OUTPUT: c_int = 6004;
pub const XML_BUF_OVERFLOW: c_int = 7000;
pub const xmlParserErrors = c_uint;
pub const xmlGenericErrorFunc = ?*const fn (?*anyopaque, [*c]const u8, ...) callconv(.c) void;
pub extern fn xmlSetGenericErrorFunc(ctx: ?*anyopaque, handler: xmlGenericErrorFunc) void;
pub extern fn initGenericErrorDefaultFunc(handler: [*c]xmlGenericErrorFunc) void;
pub extern fn xmlSetStructuredErrorFunc(ctx: ?*anyopaque, handler: xmlStructuredErrorFunc) void;
pub extern fn xmlParserError(ctx: ?*anyopaque, msg: [*c]const u8, ...) void;
pub extern fn xmlParserWarning(ctx: ?*anyopaque, msg: [*c]const u8, ...) void;
pub extern fn xmlParserValidityError(ctx: ?*anyopaque, msg: [*c]const u8, ...) void;
pub extern fn xmlParserValidityWarning(ctx: ?*anyopaque, msg: [*c]const u8, ...) void;
pub extern fn xmlParserPrintFileInfo(input: xmlParserInputPtr) void;
pub extern fn xmlParserPrintFileContext(input: xmlParserInputPtr) void;
pub extern fn xmlGetLastError() xmlErrorPtr;
pub extern fn xmlResetLastError() void;
pub extern fn xmlCtxtGetLastError(ctx: ?*anyopaque) xmlErrorPtr;
pub extern fn xmlCtxtResetLastError(ctx: ?*anyopaque) void;
pub extern fn xmlResetError(err: xmlErrorPtr) void;
pub extern fn xmlCopyError(from: xmlErrorPtr, to: xmlErrorPtr) c_int;
pub const struct__xmlLink = opaque {};
pub const xmlLink = struct__xmlLink;
pub const xmlLinkPtr = ?*xmlLink;
pub const struct__xmlList = opaque {};
pub const xmlList = struct__xmlList;
pub const xmlListPtr = ?*xmlList;
pub const xmlListDeallocator = ?*const fn (xmlLinkPtr) callconv(.c) void;
pub const xmlListDataCompare = ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.c) c_int;
pub const xmlListWalker = ?*const fn (?*const anyopaque, ?*anyopaque) callconv(.c) c_int;
pub extern fn xmlListCreate(deallocator: xmlListDeallocator, compare: xmlListDataCompare) xmlListPtr;
pub extern fn xmlListDelete(l: xmlListPtr) void;
pub extern fn xmlListSearch(l: xmlListPtr, data: ?*anyopaque) ?*anyopaque;
pub extern fn xmlListReverseSearch(l: xmlListPtr, data: ?*anyopaque) ?*anyopaque;
pub extern fn xmlListInsert(l: xmlListPtr, data: ?*anyopaque) c_int;
pub extern fn xmlListAppend(l: xmlListPtr, data: ?*anyopaque) c_int;
pub extern fn xmlListRemoveFirst(l: xmlListPtr, data: ?*anyopaque) c_int;
pub extern fn xmlListRemoveLast(l: xmlListPtr, data: ?*anyopaque) c_int;
pub extern fn xmlListRemoveAll(l: xmlListPtr, data: ?*anyopaque) c_int;
pub extern fn xmlListClear(l: xmlListPtr) void;
pub extern fn xmlListEmpty(l: xmlListPtr) c_int;
pub extern fn xmlListFront(l: xmlListPtr) xmlLinkPtr;
pub extern fn xmlListEnd(l: xmlListPtr) xmlLinkPtr;
pub extern fn xmlListSize(l: xmlListPtr) c_int;
pub extern fn xmlListPopFront(l: xmlListPtr) void;
pub extern fn xmlListPopBack(l: xmlListPtr) void;
pub extern fn xmlListPushFront(l: xmlListPtr, data: ?*anyopaque) c_int;
pub extern fn xmlListPushBack(l: xmlListPtr, data: ?*anyopaque) c_int;
pub extern fn xmlListReverse(l: xmlListPtr) void;
pub extern fn xmlListSort(l: xmlListPtr) void;
pub extern fn xmlListWalk(l: xmlListPtr, walker: xmlListWalker, user: ?*anyopaque) void;
pub extern fn xmlListReverseWalk(l: xmlListPtr, walker: xmlListWalker, user: ?*anyopaque) void;
pub extern fn xmlListMerge(l1: xmlListPtr, l2: xmlListPtr) void;
pub extern fn xmlListDup(old: xmlListPtr) xmlListPtr;
pub extern fn xmlListCopy(cur: xmlListPtr, old: xmlListPtr) c_int;
pub extern fn xmlLinkGetData(lk: xmlLinkPtr) ?*anyopaque;
pub const xmlValidStatePtr = ?*xmlValidState;
pub const xmlValidCtxtPtr = [*c]xmlValidCtxt;
pub const xmlNotationTable = struct__xmlHashTable;
pub const xmlNotationTablePtr = ?*xmlNotationTable;
pub const xmlElementTable = struct__xmlHashTable;
pub const xmlElementTablePtr = ?*xmlElementTable;
pub const xmlAttributeTable = struct__xmlHashTable;
pub const xmlAttributeTablePtr = ?*xmlAttributeTable;
pub const xmlIDTable = struct__xmlHashTable;
pub const xmlIDTablePtr = ?*xmlIDTable;
pub const xmlRefTable = struct__xmlHashTable;
pub const xmlRefTablePtr = ?*xmlRefTable;
pub extern fn xmlAddNotationDecl(ctxt: xmlValidCtxtPtr, dtd: xmlDtdPtr, name: [*c]const xmlChar, PublicID: [*c]const xmlChar, SystemID: [*c]const xmlChar) xmlNotationPtr;
pub extern fn xmlCopyNotationTable(table: xmlNotationTablePtr) xmlNotationTablePtr;
pub extern fn xmlFreeNotationTable(table: xmlNotationTablePtr) void;
pub extern fn xmlNewElementContent(name: [*c]const xmlChar, @"type": xmlElementContentType) xmlElementContentPtr;
pub extern fn xmlCopyElementContent(content: xmlElementContentPtr) xmlElementContentPtr;
pub extern fn xmlFreeElementContent(cur: xmlElementContentPtr) void;
pub extern fn xmlNewDocElementContent(doc: xmlDocPtr, name: [*c]const xmlChar, @"type": xmlElementContentType) xmlElementContentPtr;
pub extern fn xmlCopyDocElementContent(doc: xmlDocPtr, content: xmlElementContentPtr) xmlElementContentPtr;
pub extern fn xmlFreeDocElementContent(doc: xmlDocPtr, cur: xmlElementContentPtr) void;
pub extern fn xmlSnprintfElementContent(buf: [*c]u8, size: c_int, content: xmlElementContentPtr, englob: c_int) void;
pub extern fn xmlAddElementDecl(ctxt: xmlValidCtxtPtr, dtd: xmlDtdPtr, name: [*c]const xmlChar, @"type": xmlElementTypeVal, content: xmlElementContentPtr) xmlElementPtr;
pub extern fn xmlCopyElementTable(table: xmlElementTablePtr) xmlElementTablePtr;
pub extern fn xmlFreeElementTable(table: xmlElementTablePtr) void;
pub extern fn xmlCreateEnumeration(name: [*c]const xmlChar) xmlEnumerationPtr;
pub extern fn xmlFreeEnumeration(cur: xmlEnumerationPtr) void;
pub extern fn xmlCopyEnumeration(cur: xmlEnumerationPtr) xmlEnumerationPtr;
pub extern fn xmlAddAttributeDecl(ctxt: xmlValidCtxtPtr, dtd: xmlDtdPtr, elem: [*c]const xmlChar, name: [*c]const xmlChar, ns: [*c]const xmlChar, @"type": xmlAttributeType, def: xmlAttributeDefault, defaultValue: [*c]const xmlChar, tree: xmlEnumerationPtr) xmlAttributePtr;
pub extern fn xmlCopyAttributeTable(table: xmlAttributeTablePtr) xmlAttributeTablePtr;
pub extern fn xmlFreeAttributeTable(table: xmlAttributeTablePtr) void;
pub extern fn xmlAddID(ctxt: xmlValidCtxtPtr, doc: xmlDocPtr, value: [*c]const xmlChar, attr: xmlAttrPtr) xmlIDPtr;
pub extern fn xmlFreeIDTable(table: xmlIDTablePtr) void;
pub extern fn xmlGetID(doc: xmlDocPtr, ID: [*c]const xmlChar) xmlAttrPtr;
pub extern fn xmlIsID(doc: xmlDocPtr, elem: xmlNodePtr, attr: xmlAttrPtr) c_int;
pub extern fn xmlRemoveID(doc: xmlDocPtr, attr: xmlAttrPtr) c_int;
pub extern fn xmlAddRef(ctxt: xmlValidCtxtPtr, doc: xmlDocPtr, value: [*c]const xmlChar, attr: xmlAttrPtr) xmlRefPtr;
pub extern fn xmlFreeRefTable(table: xmlRefTablePtr) void;
pub extern fn xmlIsRef(doc: xmlDocPtr, elem: xmlNodePtr, attr: xmlAttrPtr) c_int;
pub extern fn xmlRemoveRef(doc: xmlDocPtr, attr: xmlAttrPtr) c_int;
pub extern fn xmlGetRefs(doc: xmlDocPtr, ID: [*c]const xmlChar) xmlListPtr;
pub extern fn xmlValidateNotationUse(ctxt: xmlValidCtxtPtr, doc: xmlDocPtr, notationName: [*c]const xmlChar) c_int;
pub extern fn xmlIsMixedElement(doc: xmlDocPtr, name: [*c]const xmlChar) c_int;
pub extern fn xmlGetDtdAttrDesc(dtd: xmlDtdPtr, elem: [*c]const xmlChar, name: [*c]const xmlChar) xmlAttributePtr;
pub extern fn xmlGetDtdQAttrDesc(dtd: xmlDtdPtr, elem: [*c]const xmlChar, name: [*c]const xmlChar, prefix: [*c]const xmlChar) xmlAttributePtr;
pub extern fn xmlGetDtdNotationDesc(dtd: xmlDtdPtr, name: [*c]const xmlChar) xmlNotationPtr;
pub extern fn xmlGetDtdQElementDesc(dtd: xmlDtdPtr, name: [*c]const xmlChar, prefix: [*c]const xmlChar) xmlElementPtr;
pub extern fn xmlGetDtdElementDesc(dtd: xmlDtdPtr, name: [*c]const xmlChar) xmlElementPtr;
pub const XML_INTERNAL_GENERAL_ENTITY: c_int = 1;
pub const XML_EXTERNAL_GENERAL_PARSED_ENTITY: c_int = 2;
pub const XML_EXTERNAL_GENERAL_UNPARSED_ENTITY: c_int = 3;
pub const XML_INTERNAL_PARAMETER_ENTITY: c_int = 4;
pub const XML_EXTERNAL_PARAMETER_ENTITY: c_int = 5;
pub const XML_INTERNAL_PREDEFINED_ENTITY: c_int = 6;
pub const xmlEntityType = c_uint;
pub const xmlEntitiesTable = struct__xmlHashTable;
pub const xmlEntitiesTablePtr = ?*xmlEntitiesTable;
pub extern fn xmlNewEntity(doc: xmlDocPtr, name: [*c]const xmlChar, @"type": c_int, ExternalID: [*c]const xmlChar, SystemID: [*c]const xmlChar, content: [*c]const xmlChar) xmlEntityPtr;
pub extern fn xmlAddDocEntity(doc: xmlDocPtr, name: [*c]const xmlChar, @"type": c_int, ExternalID: [*c]const xmlChar, SystemID: [*c]const xmlChar, content: [*c]const xmlChar) xmlEntityPtr;
pub extern fn xmlAddDtdEntity(doc: xmlDocPtr, name: [*c]const xmlChar, @"type": c_int, ExternalID: [*c]const xmlChar, SystemID: [*c]const xmlChar, content: [*c]const xmlChar) xmlEntityPtr;
pub extern fn xmlGetPredefinedEntity(name: [*c]const xmlChar) xmlEntityPtr;
pub extern fn xmlGetDocEntity(doc: [*c]const xmlDoc, name: [*c]const xmlChar) xmlEntityPtr;
pub extern fn xmlGetDtdEntity(doc: xmlDocPtr, name: [*c]const xmlChar) xmlEntityPtr;
pub extern fn xmlGetParameterEntity(doc: xmlDocPtr, name: [*c]const xmlChar) xmlEntityPtr;
pub extern fn xmlEncodeEntitiesReentrant(doc: xmlDocPtr, input: [*c]const xmlChar) [*c]xmlChar;
pub extern fn xmlEncodeSpecialChars(doc: [*c]const xmlDoc, input: [*c]const xmlChar) [*c]xmlChar;
pub extern fn xmlCreateEntitiesTable() xmlEntitiesTablePtr;
pub extern fn xmlCopyEntitiesTable(table: xmlEntitiesTablePtr) xmlEntitiesTablePtr;
pub extern fn xmlFreeEntitiesTable(table: xmlEntitiesTablePtr) void;
pub const xmlParserNodeInfoPtr = [*c]xmlParserNodeInfo;
pub const xmlParserNodeInfoSeqPtr = [*c]xmlParserNodeInfoSeq;
pub const XML_PARSER_EOF: c_int = -1;
pub const XML_PARSER_START: c_int = 0;
pub const XML_PARSER_MISC: c_int = 1;
pub const XML_PARSER_PI: c_int = 2;
pub const XML_PARSER_DTD: c_int = 3;
pub const XML_PARSER_PROLOG: c_int = 4;
pub const XML_PARSER_COMMENT: c_int = 5;
pub const XML_PARSER_START_TAG: c_int = 6;
pub const XML_PARSER_CONTENT: c_int = 7;
pub const XML_PARSER_CDATA_SECTION: c_int = 8;
pub const XML_PARSER_END_TAG: c_int = 9;
pub const XML_PARSER_ENTITY_DECL: c_int = 10;
pub const XML_PARSER_ENTITY_VALUE: c_int = 11;
pub const XML_PARSER_ATTRIBUTE_VALUE: c_int = 12;
pub const XML_PARSER_SYSTEM_LITERAL: c_int = 13;
pub const XML_PARSER_EPILOG: c_int = 14;
pub const XML_PARSER_IGNORE: c_int = 15;
pub const XML_PARSER_PUBLIC_LITERAL: c_int = 16;
pub const xmlParserInputState = c_int;
pub const XML_PARSE_UNKNOWN: c_int = 0;
pub const XML_PARSE_DOM: c_int = 1;
pub const XML_PARSE_SAX: c_int = 2;
pub const XML_PARSE_PUSH_DOM: c_int = 3;
pub const XML_PARSE_PUSH_SAX: c_int = 4;
pub const XML_PARSE_READER: c_int = 5;
pub const xmlParserMode = c_uint;
pub const attributeSAXFunc = ?*const fn (?*anyopaque, [*c]const xmlChar, [*c]const xmlChar) callconv(.c) void;
pub const struct__xmlSAXHandlerV1 = extern struct {
    internalSubset: internalSubsetSAXFunc = @import("std").mem.zeroes(internalSubsetSAXFunc),
    isStandalone: isStandaloneSAXFunc = @import("std").mem.zeroes(isStandaloneSAXFunc),
    hasInternalSubset: hasInternalSubsetSAXFunc = @import("std").mem.zeroes(hasInternalSubsetSAXFunc),
    hasExternalSubset: hasExternalSubsetSAXFunc = @import("std").mem.zeroes(hasExternalSubsetSAXFunc),
    resolveEntity: resolveEntitySAXFunc = @import("std").mem.zeroes(resolveEntitySAXFunc),
    getEntity: getEntitySAXFunc = @import("std").mem.zeroes(getEntitySAXFunc),
    entityDecl: entityDeclSAXFunc = @import("std").mem.zeroes(entityDeclSAXFunc),
    notationDecl: notationDeclSAXFunc = @import("std").mem.zeroes(notationDeclSAXFunc),
    attributeDecl: attributeDeclSAXFunc = @import("std").mem.zeroes(attributeDeclSAXFunc),
    elementDecl: elementDeclSAXFunc = @import("std").mem.zeroes(elementDeclSAXFunc),
    unparsedEntityDecl: unparsedEntityDeclSAXFunc = @import("std").mem.zeroes(unparsedEntityDeclSAXFunc),
    setDocumentLocator: setDocumentLocatorSAXFunc = @import("std").mem.zeroes(setDocumentLocatorSAXFunc),
    startDocument: startDocumentSAXFunc = @import("std").mem.zeroes(startDocumentSAXFunc),
    endDocument: endDocumentSAXFunc = @import("std").mem.zeroes(endDocumentSAXFunc),
    startElement: startElementSAXFunc = @import("std").mem.zeroes(startElementSAXFunc),
    endElement: endElementSAXFunc = @import("std").mem.zeroes(endElementSAXFunc),
    reference: referenceSAXFunc = @import("std").mem.zeroes(referenceSAXFunc),
    characters: charactersSAXFunc = @import("std").mem.zeroes(charactersSAXFunc),
    ignorableWhitespace: ignorableWhitespaceSAXFunc = @import("std").mem.zeroes(ignorableWhitespaceSAXFunc),
    processingInstruction: processingInstructionSAXFunc = @import("std").mem.zeroes(processingInstructionSAXFunc),
    comment: commentSAXFunc = @import("std").mem.zeroes(commentSAXFunc),
    warning: warningSAXFunc = @import("std").mem.zeroes(warningSAXFunc),
    @"error": errorSAXFunc = @import("std").mem.zeroes(errorSAXFunc),
    fatalError: fatalErrorSAXFunc = @import("std").mem.zeroes(fatalErrorSAXFunc),
    getParameterEntity: getParameterEntitySAXFunc = @import("std").mem.zeroes(getParameterEntitySAXFunc),
    cdataBlock: cdataBlockSAXFunc = @import("std").mem.zeroes(cdataBlockSAXFunc),
    externalSubset: externalSubsetSAXFunc = @import("std").mem.zeroes(externalSubsetSAXFunc),
    initialized: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const xmlSAXHandlerV1 = struct__xmlSAXHandlerV1;
pub const xmlSAXHandlerV1Ptr = [*c]xmlSAXHandlerV1;
pub const xmlExternalEntityLoader = ?*const fn ([*c]const u8, [*c]const u8, xmlParserCtxtPtr) callconv(.c) xmlParserInputPtr;
pub const XML_ENC_ERR_SUCCESS: c_int = 0;
pub const XML_ENC_ERR_SPACE: c_int = -1;
pub const XML_ENC_ERR_INPUT: c_int = -2;
pub const XML_ENC_ERR_PARTIAL: c_int = -3;
pub const XML_ENC_ERR_INTERNAL: c_int = -4;
pub const XML_ENC_ERR_MEMORY: c_int = -5;
pub const xmlCharEncError = c_int;
pub const XML_CHAR_ENCODING_ERROR: c_int = -1;
pub const XML_CHAR_ENCODING_NONE: c_int = 0;
pub const XML_CHAR_ENCODING_UTF8: c_int = 1;
pub const XML_CHAR_ENCODING_UTF16LE: c_int = 2;
pub const XML_CHAR_ENCODING_UTF16BE: c_int = 3;
pub const XML_CHAR_ENCODING_UCS4LE: c_int = 4;
pub const XML_CHAR_ENCODING_UCS4BE: c_int = 5;
pub const XML_CHAR_ENCODING_EBCDIC: c_int = 6;
pub const XML_CHAR_ENCODING_UCS4_2143: c_int = 7;
pub const XML_CHAR_ENCODING_UCS4_3412: c_int = 8;
pub const XML_CHAR_ENCODING_UCS2: c_int = 9;
pub const XML_CHAR_ENCODING_8859_1: c_int = 10;
pub const XML_CHAR_ENCODING_8859_2: c_int = 11;
pub const XML_CHAR_ENCODING_8859_3: c_int = 12;
pub const XML_CHAR_ENCODING_8859_4: c_int = 13;
pub const XML_CHAR_ENCODING_8859_5: c_int = 14;
pub const XML_CHAR_ENCODING_8859_6: c_int = 15;
pub const XML_CHAR_ENCODING_8859_7: c_int = 16;
pub const XML_CHAR_ENCODING_8859_8: c_int = 17;
pub const XML_CHAR_ENCODING_8859_9: c_int = 18;
pub const XML_CHAR_ENCODING_2022_JP: c_int = 19;
pub const XML_CHAR_ENCODING_SHIFT_JIS: c_int = 20;
pub const XML_CHAR_ENCODING_EUC_JP: c_int = 21;
pub const XML_CHAR_ENCODING_ASCII: c_int = 22;
pub const xmlCharEncoding = c_int;
pub extern fn xmlInitCharEncodingHandlers() void;
pub extern fn xmlCleanupCharEncodingHandlers() void;
pub extern fn xmlRegisterCharEncodingHandler(handler: xmlCharEncodingHandlerPtr) void;
pub extern fn xmlGetCharEncodingHandler(enc: xmlCharEncoding) xmlCharEncodingHandlerPtr;
pub extern fn xmlFindCharEncodingHandler(name: [*c]const u8) xmlCharEncodingHandlerPtr;
pub extern fn xmlNewCharEncodingHandler(name: [*c]const u8, input: xmlCharEncodingInputFunc, output: xmlCharEncodingOutputFunc) xmlCharEncodingHandlerPtr;
pub extern fn xmlAddEncodingAlias(name: [*c]const u8, alias: [*c]const u8) c_int;
pub extern fn xmlDelEncodingAlias(alias: [*c]const u8) c_int;
pub extern fn xmlGetEncodingAlias(alias: [*c]const u8) [*c]const u8;
pub extern fn xmlCleanupEncodingAliases() void;
pub extern fn xmlParseCharEncoding(name: [*c]const u8) xmlCharEncoding;
pub extern fn xmlGetCharEncodingName(enc: xmlCharEncoding) [*c]const u8;
pub extern fn xmlDetectCharEncoding(in: [*c]const u8, len: c_int) xmlCharEncoding;
pub extern fn xmlCharEncOutFunc(handler: [*c]xmlCharEncodingHandler, out: xmlBufferPtr, in: xmlBufferPtr) c_int;
pub extern fn xmlCharEncInFunc(handler: [*c]xmlCharEncodingHandler, out: xmlBufferPtr, in: xmlBufferPtr) c_int;
pub extern fn xmlCharEncFirstLine(handler: [*c]xmlCharEncodingHandler, out: xmlBufferPtr, in: xmlBufferPtr) c_int;
pub extern fn xmlCharEncCloseFunc(handler: [*c]xmlCharEncodingHandler) c_int;
pub extern fn isolat1ToUTF8(out: [*c]u8, outlen: [*c]c_int, in: [*c]const u8, inlen: [*c]c_int) c_int;
pub const xmlInputMatchCallback = ?*const fn ([*c]const u8) callconv(.c) c_int;
pub const xmlInputOpenCallback = ?*const fn ([*c]const u8) callconv(.c) ?*anyopaque;
pub extern fn xmlCleanupInputCallbacks() void;
pub extern fn xmlPopInputCallbacks() c_int;
pub extern fn xmlRegisterDefaultInputCallbacks() void;
pub extern fn xmlAllocParserInputBuffer(enc: xmlCharEncoding) xmlParserInputBufferPtr;
pub extern fn xmlParserInputBufferCreateFilename(URI: [*c]const u8, enc: xmlCharEncoding) xmlParserInputBufferPtr;
pub extern fn xmlParserInputBufferCreateFile(file: [*c]FILE, enc: xmlCharEncoding) xmlParserInputBufferPtr;
pub extern fn xmlParserInputBufferCreateFd(fd: c_int, enc: xmlCharEncoding) xmlParserInputBufferPtr;
pub extern fn xmlParserInputBufferCreateMem(mem: [*c]const u8, size: c_int, enc: xmlCharEncoding) xmlParserInputBufferPtr;
pub extern fn xmlParserInputBufferCreateStatic(mem: [*c]const u8, size: c_int, enc: xmlCharEncoding) xmlParserInputBufferPtr;
pub extern fn xmlParserInputBufferCreateIO(ioread: xmlInputReadCallback, ioclose: xmlInputCloseCallback, ioctx: ?*anyopaque, enc: xmlCharEncoding) xmlParserInputBufferPtr;
pub extern fn xmlParserInputBufferRead(in: xmlParserInputBufferPtr, len: c_int) c_int;
pub extern fn xmlParserInputBufferGrow(in: xmlParserInputBufferPtr, len: c_int) c_int;
pub extern fn xmlParserInputBufferPush(in: xmlParserInputBufferPtr, len: c_int, buf: [*c]const u8) c_int;
pub extern fn xmlFreeParserInputBuffer(in: xmlParserInputBufferPtr) void;
pub extern fn xmlParserGetDirectory(filename: [*c]const u8) [*c]u8;
pub extern fn xmlRegisterInputCallbacks(matchFunc: xmlInputMatchCallback, openFunc: xmlInputOpenCallback, readFunc: xmlInputReadCallback, closeFunc: xmlInputCloseCallback) c_int;
pub extern fn __xmlParserInputBufferCreateFilename(URI: [*c]const u8, enc: xmlCharEncoding) xmlParserInputBufferPtr;
pub extern fn xmlCheckHTTPInput(ctxt: xmlParserCtxtPtr, ret: xmlParserInputPtr) xmlParserInputPtr;
pub extern fn xmlNoNetExternalEntityLoader(URL: [*c]const u8, ID: [*c]const u8, ctxt: xmlParserCtxtPtr) xmlParserInputPtr;
pub extern fn xmlNormalizeWindowsPath(path: [*c]const xmlChar) [*c]xmlChar;
pub extern fn xmlCheckFilename(path: [*c]const u8) c_int;
pub extern fn xmlFileMatch(filename: [*c]const u8) c_int;
pub extern fn xmlFileOpen(filename: [*c]const u8) ?*anyopaque;
pub extern fn xmlFileRead(context: ?*anyopaque, buffer: [*c]u8, len: c_int) c_int;
pub extern fn xmlFileClose(context: ?*anyopaque) c_int;
pub extern fn xmlInitParser() void;
pub extern fn xmlCleanupParser() void;
pub extern fn xmlParserInputRead(in: xmlParserInputPtr, len: c_int) c_int;
pub extern fn xmlParserInputGrow(in: xmlParserInputPtr, len: c_int) c_int;
pub extern fn xmlSubstituteEntitiesDefault(val: c_int) c_int;
pub extern fn xmlKeepBlanksDefault(val: c_int) c_int;
pub extern fn xmlStopParser(ctxt: xmlParserCtxtPtr) void;
pub extern fn xmlPedanticParserDefault(val: c_int) c_int;
pub extern fn xmlLineNumbersDefault(val: c_int) c_int;
pub extern fn xmlParseDocument(ctxt: xmlParserCtxtPtr) c_int;
pub extern fn xmlParseExtParsedEnt(ctxt: xmlParserCtxtPtr) c_int;
pub extern fn xmlParseInNodeContext(node: xmlNodePtr, data: [*c]const u8, datalen: c_int, options: c_int, lst: [*c]xmlNodePtr) xmlParserErrors;
pub extern fn xmlParseCtxtExternalEntity(ctx: xmlParserCtxtPtr, URL: [*c]const xmlChar, ID: [*c]const xmlChar, lst: [*c]xmlNodePtr) c_int;
pub extern fn xmlNewParserCtxt() xmlParserCtxtPtr;
pub extern fn xmlNewSAXParserCtxt(sax: [*c]const xmlSAXHandler, userData: ?*anyopaque) xmlParserCtxtPtr;
pub extern fn xmlInitParserCtxt(ctxt: xmlParserCtxtPtr) c_int;
pub extern fn xmlClearParserCtxt(ctxt: xmlParserCtxtPtr) void;
pub extern fn xmlFreeParserCtxt(ctxt: xmlParserCtxtPtr) void;
pub extern fn xmlCreateDocParserCtxt(cur: [*c]const xmlChar) xmlParserCtxtPtr;
pub extern fn xmlCreateIOParserCtxt(sax: xmlSAXHandlerPtr, user_data: ?*anyopaque, ioread: xmlInputReadCallback, ioclose: xmlInputCloseCallback, ioctx: ?*anyopaque, enc: xmlCharEncoding) xmlParserCtxtPtr;
pub extern fn xmlNewIOInputStream(ctxt: xmlParserCtxtPtr, input: xmlParserInputBufferPtr, enc: xmlCharEncoding) xmlParserInputPtr;
pub extern fn xmlParserFindNodeInfo(ctxt: xmlParserCtxtPtr, node: xmlNodePtr) [*c]const xmlParserNodeInfo;
pub extern fn xmlInitNodeInfoSeq(seq: xmlParserNodeInfoSeqPtr) void;
pub extern fn xmlClearNodeInfoSeq(seq: xmlParserNodeInfoSeqPtr) void;
pub extern fn xmlParserFindNodeInfoIndex(seq: xmlParserNodeInfoSeqPtr, node: xmlNodePtr) c_ulong;
pub extern fn xmlParserAddNodeInfo(ctxt: xmlParserCtxtPtr, info: xmlParserNodeInfoPtr) void;
pub extern fn xmlSetExternalEntityLoader(f: xmlExternalEntityLoader) void;
pub extern fn xmlGetExternalEntityLoader() xmlExternalEntityLoader;
pub extern fn xmlLoadExternalEntity(URL: [*c]const u8, ID: [*c]const u8, ctxt: xmlParserCtxtPtr) xmlParserInputPtr;
pub extern fn xmlByteConsumed(ctxt: xmlParserCtxtPtr) c_long;
pub const XML_PARSE_RECOVER: c_int = 1;
pub const XML_PARSE_NOENT: c_int = 2;
pub const XML_PARSE_DTDLOAD: c_int = 4;
pub const XML_PARSE_DTDATTR: c_int = 8;
pub const XML_PARSE_DTDVALID: c_int = 16;
pub const XML_PARSE_NOERROR: c_int = 32;
pub const XML_PARSE_NOWARNING: c_int = 64;
pub const XML_PARSE_PEDANTIC: c_int = 128;
pub const XML_PARSE_NOBLANKS: c_int = 256;
pub const XML_PARSE_SAX1: c_int = 512;
pub const XML_PARSE_XINCLUDE: c_int = 1024;
pub const XML_PARSE_NONET: c_int = 2048;
pub const XML_PARSE_NODICT: c_int = 4096;
pub const XML_PARSE_NSCLEAN: c_int = 8192;
pub const XML_PARSE_NOCDATA: c_int = 16384;
pub const XML_PARSE_NOXINCNODE: c_int = 32768;
pub const XML_PARSE_COMPACT: c_int = 65536;
pub const XML_PARSE_OLD10: c_int = 131072;
pub const XML_PARSE_NOBASEFIX: c_int = 262144;
pub const XML_PARSE_HUGE: c_int = 524288;
pub const XML_PARSE_OLDSAX: c_int = 1048576;
pub const XML_PARSE_IGNORE_ENC: c_int = 2097152;
pub const XML_PARSE_BIG_LINES: c_int = 4194304;
pub const xmlParserOption = c_uint;
pub extern fn xmlCtxtReset(ctxt: xmlParserCtxtPtr) void;
pub extern fn xmlCtxtResetPush(ctxt: xmlParserCtxtPtr, chunk: [*c]const u8, size: c_int, filename: [*c]const u8, encoding: [*c]const u8) c_int;
pub extern fn xmlCtxtUseOptions(ctxt: xmlParserCtxtPtr, options: c_int) c_int;
pub extern fn xmlReadDoc(cur: [*c]const xmlChar, URL: [*c]const u8, encoding: [*c]const u8, options: c_int) xmlDocPtr;
pub extern fn xmlReadFile(URL: [*c]const u8, encoding: [*c]const u8, options: c_int) xmlDocPtr;
pub extern fn xmlReadMemory(buffer: [*c]const u8, size: c_int, URL: [*c]const u8, encoding: [*c]const u8, options: c_int) xmlDocPtr;
pub extern fn xmlReadFd(fd: c_int, URL: [*c]const u8, encoding: [*c]const u8, options: c_int) xmlDocPtr;
pub extern fn xmlReadIO(ioread: xmlInputReadCallback, ioclose: xmlInputCloseCallback, ioctx: ?*anyopaque, URL: [*c]const u8, encoding: [*c]const u8, options: c_int) xmlDocPtr;
pub extern fn xmlCtxtReadDoc(ctxt: xmlParserCtxtPtr, cur: [*c]const xmlChar, URL: [*c]const u8, encoding: [*c]const u8, options: c_int) xmlDocPtr;
pub extern fn xmlCtxtReadFile(ctxt: xmlParserCtxtPtr, filename: [*c]const u8, encoding: [*c]const u8, options: c_int) xmlDocPtr;
pub extern fn xmlCtxtReadMemory(ctxt: xmlParserCtxtPtr, buffer: [*c]const u8, size: c_int, URL: [*c]const u8, encoding: [*c]const u8, options: c_int) xmlDocPtr;
pub extern fn xmlCtxtReadFd(ctxt: xmlParserCtxtPtr, fd: c_int, URL: [*c]const u8, encoding: [*c]const u8, options: c_int) xmlDocPtr;
pub extern fn xmlCtxtReadIO(ctxt: xmlParserCtxtPtr, ioread: xmlInputReadCallback, ioclose: xmlInputCloseCallback, ioctx: ?*anyopaque, URL: [*c]const u8, encoding: [*c]const u8, options: c_int) xmlDocPtr;
pub const XML_WITH_THREAD: c_int = 1;
pub const XML_WITH_TREE: c_int = 2;
pub const XML_WITH_OUTPUT: c_int = 3;
pub const XML_WITH_PUSH: c_int = 4;
pub const XML_WITH_READER: c_int = 5;
pub const XML_WITH_PATTERN: c_int = 6;
pub const XML_WITH_WRITER: c_int = 7;
pub const XML_WITH_SAX1: c_int = 8;
pub const XML_WITH_FTP: c_int = 9;
pub const XML_WITH_HTTP: c_int = 10;
pub const XML_WITH_VALID: c_int = 11;
pub const XML_WITH_HTML: c_int = 12;
pub const XML_WITH_LEGACY: c_int = 13;
pub const XML_WITH_C14N: c_int = 14;
pub const XML_WITH_CATALOG: c_int = 15;
pub const XML_WITH_XPATH: c_int = 16;
pub const XML_WITH_XPTR: c_int = 17;
pub const XML_WITH_XINCLUDE: c_int = 18;
pub const XML_WITH_ICONV: c_int = 19;
pub const XML_WITH_ISO8859X: c_int = 20;
pub const XML_WITH_UNICODE: c_int = 21;
pub const XML_WITH_REGEXP: c_int = 22;
pub const XML_WITH_AUTOMATA: c_int = 23;
pub const XML_WITH_EXPR: c_int = 24;
pub const XML_WITH_SCHEMAS: c_int = 25;
pub const XML_WITH_SCHEMATRON: c_int = 26;
pub const XML_WITH_MODULES: c_int = 27;
pub const XML_WITH_DEBUG: c_int = 28;
pub const XML_WITH_DEBUG_MEM: c_int = 29;
pub const XML_WITH_DEBUG_RUN: c_int = 30;
pub const XML_WITH_ZLIB: c_int = 31;
pub const XML_WITH_ICU: c_int = 32;
pub const XML_WITH_LZMA: c_int = 33;
pub const XML_WITH_NONE: c_int = 99999;
pub const xmlFeature = c_uint;
pub extern fn xmlHasFeature(feature: xmlFeature) c_int;
pub const div_t = extern struct {
    quot: c_int = @import("std").mem.zeroes(c_int),
    rem: c_int = @import("std").mem.zeroes(c_int),
};
pub const ldiv_t = extern struct {
    quot: c_long = @import("std").mem.zeroes(c_long),
    rem: c_long = @import("std").mem.zeroes(c_long),
};
pub const lldiv_t = extern struct {
    quot: c_longlong = @import("std").mem.zeroes(c_longlong),
    rem: c_longlong = @import("std").mem.zeroes(c_longlong),
};
pub extern fn __ctype_get_mb_cur_max() usize;
pub fn atof(arg___nptr: [*c]const u8) callconv(.c) f64 {
    var __nptr = arg___nptr;
    _ = &__nptr;
    return strtod(__nptr, @as([*c][*c]u8, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0)))))));
}
pub fn atoi(arg___nptr: [*c]const u8) callconv(.c) c_int {
    var __nptr = arg___nptr;
    _ = &__nptr;
    return @as(c_int, @bitCast(@as(c_int, @truncate(strtol(__nptr, @as([*c][*c]u8, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0)))))), @as(c_int, 10))))));
}
pub fn atol(arg___nptr: [*c]const u8) callconv(.c) c_long {
    var __nptr = arg___nptr;
    _ = &__nptr;
    return strtol(__nptr, @as([*c][*c]u8, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0)))))), @as(c_int, 10));
}
pub fn atoll(arg___nptr: [*c]const u8) callconv(.c) c_longlong {
    var __nptr = arg___nptr;
    _ = &__nptr;
    return strtoll(__nptr, @as([*c][*c]u8, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0)))))), @as(c_int, 10));
}
pub extern fn strtod(__nptr: [*c]const u8, __endptr: [*c][*c]u8) f64;
pub extern fn strtof(__nptr: [*c]const u8, __endptr: [*c][*c]u8) f32;
pub extern fn strtold(__nptr: [*c]const u8, __endptr: [*c][*c]u8) c_longdouble;
pub extern fn strtol(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_long;
pub extern fn strtoul(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_ulong;
pub extern fn strtoq(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtouq(noalias __nptr: [*c]const u8, noalias __endptr: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern fn strtoll(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_longlong;
pub extern fn strtoull(__nptr: [*c]const u8, __endptr: [*c][*c]u8, __base: c_int) c_ulonglong;
pub extern fn l64a(__n: c_long) [*c]u8;
pub extern fn a64l(__s: [*c]const u8) c_long;
pub const u_char = __u_char;
pub const u_short = __u_short;
pub const u_int = __u_int;
pub const u_long = __u_long;
pub const quad_t = __quad_t;
pub const u_quad_t = __u_quad_t;
pub const fsid_t = __fsid_t;
pub const loff_t = __loff_t;
pub const ino_t = __ino_t;
pub const dev_t = __dev_t;
pub const gid_t = __gid_t;
pub const mode_t = __mode_t;
pub const nlink_t = __nlink_t;
pub const uid_t = __uid_t;
pub const pid_t = __pid_t;
pub const id_t = __id_t;
pub const daddr_t = __daddr_t;
pub const caddr_t = __caddr_t;
pub const key_t = __key_t;
pub const clock_t = __clock_t;
pub const clockid_t = __clockid_t;
pub const time_t = __time_t;
pub const timer_t = __timer_t;
pub const ulong = c_ulong;
pub const ushort = c_ushort;
pub const uint = c_uint;
pub const u_int8_t = __uint8_t;
pub const u_int16_t = __uint16_t;
pub const u_int32_t = __uint32_t;
pub const u_int64_t = __uint64_t;
pub const register_t = c_long;
pub fn __bswap_16(arg___bsx: __uint16_t) callconv(.c) __uint16_t {
    var __bsx = arg___bsx;
    _ = &__bsx;
    return @as(__uint16_t, @bitCast(@as(c_short, @truncate(((@as(c_int, @bitCast(@as(c_uint, __bsx))) >> @intCast(8)) & @as(c_int, 255)) | ((@as(c_int, @bitCast(@as(c_uint, __bsx))) & @as(c_int, 255)) << @intCast(8))))));
}
pub fn __bswap_32(arg___bsx: __uint32_t) callconv(.c) __uint32_t {
    var __bsx = arg___bsx;
    _ = &__bsx;
    return ((((__bsx & @as(c_uint, 4278190080)) >> @intCast(24)) | ((__bsx & @as(c_uint, 16711680)) >> @intCast(8))) | ((__bsx & @as(c_uint, 65280)) << @intCast(8))) | ((__bsx & @as(c_uint, 255)) << @intCast(24));
}
pub fn __bswap_64(arg___bsx: __uint64_t) callconv(.c) __uint64_t {
    var __bsx = arg___bsx;
    _ = &__bsx;
    return @as(__uint64_t, @bitCast(@as(c_ulong, @truncate(((((((((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 18374686479671623680)) >> @intCast(56)) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 71776119061217280)) >> @intCast(40))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 280375465082880)) >> @intCast(24))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 1095216660480)) >> @intCast(8))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 4278190080)) << @intCast(8))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 16711680)) << @intCast(24))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 65280)) << @intCast(40))) | ((@as(c_ulonglong, @bitCast(@as(c_ulonglong, __bsx))) & @as(c_ulonglong, 255)) << @intCast(56))))));
}
pub fn __uint16_identity(arg___x: __uint16_t) callconv(.c) __uint16_t {
    var __x = arg___x;
    _ = &__x;
    return __x;
}
pub fn __uint32_identity(arg___x: __uint32_t) callconv(.c) __uint32_t {
    var __x = arg___x;
    _ = &__x;
    return __x;
}
pub fn __uint64_identity(arg___x: __uint64_t) callconv(.c) __uint64_t {
    var __x = arg___x;
    _ = &__x;
    return __x;
}
pub const __sigset_t = extern struct {
    __val: [16]c_ulong = @import("std").mem.zeroes([16]c_ulong),
};
pub const sigset_t = __sigset_t;
pub const struct_timeval = extern struct {
    tv_sec: __time_t = @import("std").mem.zeroes(__time_t),
    tv_usec: __suseconds_t = @import("std").mem.zeroes(__suseconds_t),
};
pub const struct_timespec = extern struct {
    tv_sec: __time_t = @import("std").mem.zeroes(__time_t),
    tv_nsec: __syscall_slong_t = @import("std").mem.zeroes(__syscall_slong_t),
};
pub const suseconds_t = __suseconds_t;
pub const __fd_mask = c_long;
pub const fd_set = extern struct {
    __fds_bits: [16]__fd_mask = @import("std").mem.zeroes([16]__fd_mask),
};
pub const fd_mask = __fd_mask;
pub extern fn select(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]struct_timeval) c_int;
pub extern fn pselect(__nfds: c_int, noalias __readfds: [*c]fd_set, noalias __writefds: [*c]fd_set, noalias __exceptfds: [*c]fd_set, noalias __timeout: [*c]const struct_timespec, noalias __sigmask: [*c]const __sigset_t) c_int;
pub extern fn __fdelt_chk(__d: c_long) c_long;
pub extern fn __fdelt_warn(__d: c_long) c_long;
pub const blksize_t = __blksize_t;
pub const blkcnt_t = __blkcnt_t;
pub const fsblkcnt_t = __fsblkcnt_t;
pub const fsfilcnt_t = __fsfilcnt_t;
const struct_unnamed_4 = extern struct {
    __low: c_uint = @import("std").mem.zeroes(c_uint),
    __high: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const __atomic_wide_counter = extern union {
    __value64: c_ulonglong,
    __value32: struct_unnamed_4,
};
pub const struct___pthread_internal_list = extern struct {
    __prev: [*c]struct___pthread_internal_list = @import("std").mem.zeroes([*c]struct___pthread_internal_list),
    __next: [*c]struct___pthread_internal_list = @import("std").mem.zeroes([*c]struct___pthread_internal_list),
};
pub const __pthread_list_t = struct___pthread_internal_list;
pub const struct___pthread_internal_slist = extern struct {
    __next: [*c]struct___pthread_internal_slist = @import("std").mem.zeroes([*c]struct___pthread_internal_slist),
};
pub const __pthread_slist_t = struct___pthread_internal_slist;
pub const struct___pthread_mutex_s = extern struct {
    __lock: c_int = @import("std").mem.zeroes(c_int),
    __count: c_uint = @import("std").mem.zeroes(c_uint),
    __owner: c_int = @import("std").mem.zeroes(c_int),
    __nusers: c_uint = @import("std").mem.zeroes(c_uint),
    __kind: c_int = @import("std").mem.zeroes(c_int),
    __spins: c_short = @import("std").mem.zeroes(c_short),
    __elision: c_short = @import("std").mem.zeroes(c_short),
    __list: __pthread_list_t = @import("std").mem.zeroes(__pthread_list_t),
};
pub const struct___pthread_rwlock_arch_t = extern struct {
    __readers: c_uint = @import("std").mem.zeroes(c_uint),
    __writers: c_uint = @import("std").mem.zeroes(c_uint),
    __wrphase_futex: c_uint = @import("std").mem.zeroes(c_uint),
    __writers_futex: c_uint = @import("std").mem.zeroes(c_uint),
    __pad3: c_uint = @import("std").mem.zeroes(c_uint),
    __pad4: c_uint = @import("std").mem.zeroes(c_uint),
    __cur_writer: c_int = @import("std").mem.zeroes(c_int),
    __shared: c_int = @import("std").mem.zeroes(c_int),
    __rwelision: i8 = @import("std").mem.zeroes(i8),
    __pad1: [7]u8 = @import("std").mem.zeroes([7]u8),
    __pad2: c_ulong = @import("std").mem.zeroes(c_ulong),
    __flags: c_uint = @import("std").mem.zeroes(c_uint),
};
pub const struct___pthread_cond_s = extern struct {
    __wseq: __atomic_wide_counter = @import("std").mem.zeroes(__atomic_wide_counter),
    __g1_start: __atomic_wide_counter = @import("std").mem.zeroes(__atomic_wide_counter),
    __g_refs: [2]c_uint = @import("std").mem.zeroes([2]c_uint),
    __g_size: [2]c_uint = @import("std").mem.zeroes([2]c_uint),
    __g1_orig_size: c_uint = @import("std").mem.zeroes(c_uint),
    __wrefs: c_uint = @import("std").mem.zeroes(c_uint),
    __g_signals: [2]c_uint = @import("std").mem.zeroes([2]c_uint),
};
pub const __tss_t = c_uint;
pub const __thrd_t = c_ulong;
pub const __once_flag = extern struct {
    __data: c_int = @import("std").mem.zeroes(c_int),
};
pub const pthread_t = c_ulong;
pub const pthread_mutexattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_condattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub const pthread_key_t = c_uint;
pub const pthread_once_t = c_int;
pub const union_pthread_attr_t = extern union {
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_attr_t = union_pthread_attr_t;
pub const pthread_mutex_t = extern union {
    __data: struct___pthread_mutex_s,
    __size: [40]u8,
    __align: c_long,
};
pub const pthread_cond_t = extern union {
    __data: struct___pthread_cond_s,
    __size: [48]u8,
    __align: c_longlong,
};
pub const pthread_rwlock_t = extern union {
    __data: struct___pthread_rwlock_arch_t,
    __size: [56]u8,
    __align: c_long,
};
pub const pthread_rwlockattr_t = extern union {
    __size: [8]u8,
    __align: c_long,
};
pub const pthread_spinlock_t = c_int;
pub const pthread_barrier_t = extern union {
    __size: [32]u8,
    __align: c_long,
};
pub const pthread_barrierattr_t = extern union {
    __size: [4]u8,
    __align: c_int,
};
pub extern fn random() c_long;
pub extern fn srandom(__seed: c_uint) void;
pub extern fn initstate(__seed: c_uint, __statebuf: [*c]u8, __statelen: usize) [*c]u8;
pub extern fn setstate(__statebuf: [*c]u8) [*c]u8;
pub const struct_random_data = extern struct {
    fptr: [*c]i32 = @import("std").mem.zeroes([*c]i32),
    rptr: [*c]i32 = @import("std").mem.zeroes([*c]i32),
    state: [*c]i32 = @import("std").mem.zeroes([*c]i32),
    rand_type: c_int = @import("std").mem.zeroes(c_int),
    rand_deg: c_int = @import("std").mem.zeroes(c_int),
    rand_sep: c_int = @import("std").mem.zeroes(c_int),
    end_ptr: [*c]i32 = @import("std").mem.zeroes([*c]i32),
};
pub extern fn random_r(noalias __buf: [*c]struct_random_data, noalias __result: [*c]i32) c_int;
pub extern fn srandom_r(__seed: c_uint, __buf: [*c]struct_random_data) c_int;
pub extern fn initstate_r(__seed: c_uint, noalias __statebuf: [*c]u8, __statelen: usize, noalias __buf: [*c]struct_random_data) c_int;
pub extern fn setstate_r(noalias __statebuf: [*c]u8, noalias __buf: [*c]struct_random_data) c_int;
pub extern fn rand() c_int;
pub extern fn srand(__seed: c_uint) void;
pub extern fn rand_r(__seed: [*c]c_uint) c_int;
pub extern fn drand48() f64;
pub extern fn erand48(__xsubi: [*c]c_ushort) f64;
pub extern fn lrand48() c_long;
pub extern fn nrand48(__xsubi: [*c]c_ushort) c_long;
pub extern fn mrand48() c_long;
pub extern fn jrand48(__xsubi: [*c]c_ushort) c_long;
pub extern fn srand48(__seedval: c_long) void;
pub extern fn seed48(__seed16v: [*c]c_ushort) [*c]c_ushort;
pub extern fn lcong48(__param: [*c]c_ushort) void;
pub const struct_drand48_data = extern struct {
    __x: [3]c_ushort = @import("std").mem.zeroes([3]c_ushort),
    __old_x: [3]c_ushort = @import("std").mem.zeroes([3]c_ushort),
    __c: c_ushort = @import("std").mem.zeroes(c_ushort),
    __init: c_ushort = @import("std").mem.zeroes(c_ushort),
    __a: c_ulonglong = @import("std").mem.zeroes(c_ulonglong),
};
pub extern fn drand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]f64) c_int;
pub extern fn erand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]f64) c_int;
pub extern fn lrand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn nrand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn mrand48_r(noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn jrand48_r(__xsubi: [*c]c_ushort, noalias __buffer: [*c]struct_drand48_data, noalias __result: [*c]c_long) c_int;
pub extern fn srand48_r(__seedval: c_long, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn seed48_r(__seed16v: [*c]c_ushort, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn lcong48_r(__param: [*c]c_ushort, __buffer: [*c]struct_drand48_data) c_int;
pub extern fn arc4random() __uint32_t;
pub extern fn arc4random_buf(__buf: ?*anyopaque, __size: usize) void;
pub extern fn arc4random_uniform(__upper_bound: __uint32_t) __uint32_t;
pub extern fn malloc(__size: c_ulong) ?*anyopaque;
pub extern fn calloc(__nmemb: c_ulong, __size: c_ulong) ?*anyopaque;
pub extern fn realloc(__ptr: ?*anyopaque, __size: c_ulong) ?*anyopaque;
pub extern fn free(__ptr: ?*anyopaque) void;
pub extern fn reallocarray(__ptr: ?*anyopaque, __nmemb: usize, __size: usize) ?*anyopaque;
pub extern fn alloca(__size: c_ulong) ?*anyopaque;
pub extern fn valloc(__size: usize) ?*anyopaque;
pub extern fn posix_memalign(__memptr: [*c]?*anyopaque, __alignment: usize, __size: usize) c_int;
pub extern fn aligned_alloc(__alignment: c_ulong, __size: c_ulong) ?*anyopaque;
pub extern fn abort() noreturn;
pub extern fn atexit(__func: ?*const fn () callconv(.c) void) c_int;
pub extern fn at_quick_exit(__func: ?*const fn () callconv(.c) void) c_int;
pub extern fn on_exit(__func: ?*const fn (c_int, ?*anyopaque) callconv(.c) void, __arg: ?*anyopaque) c_int;
pub extern fn exit(__status: c_int) noreturn;
pub extern fn quick_exit(__status: c_int) noreturn;
pub extern fn _Exit(__status: c_int) noreturn;
pub extern fn getenv(__name: [*c]const u8) [*c]u8;
pub extern fn putenv(__string: [*c]u8) c_int;
pub extern fn setenv(__name: [*c]const u8, __value: [*c]const u8, __replace: c_int) c_int;
pub extern fn unsetenv(__name: [*c]const u8) c_int;
pub extern fn clearenv() c_int;
pub extern fn mktemp(__template: [*c]u8) [*c]u8;
pub extern fn mkstemp(__template: [*c]u8) c_int;
pub extern fn mkstemps(__template: [*c]u8, __suffixlen: c_int) c_int;
pub extern fn mkdtemp(__template: [*c]u8) [*c]u8;
pub extern fn system(__command: [*c]const u8) c_int;
pub inline fn realpath(noalias arg___name: [*c]const u8, noalias arg___resolved: [*c]u8) [*c]u8 {
    var __name = arg___name;
    _ = &__name;
    var __resolved = arg___resolved;
    _ = &__resolved;
    var sz: usize = __builtin_object_size(@as(?*const anyopaque, @ptrCast(__resolved)), @intFromBool(@as(c_int, 2) > @as(c_int, 1)));
    _ = &sz;
    if (sz == @as(usize, @bitCast(@as(c_long, -@as(c_int, 1))))) return __realpath_alias(__name, __resolved);
    if ((((@as(@TypeOf(@as(c_int, 4096)), @bitCast(@as(c_int, 0))) < @as(@TypeOf(@as(c_int, 4096)), @bitCast(-@as(c_int, 1)))) or ((__builtin_constant_p(@as(c_int, 4096)) != 0) and (@as(c_int, 4096) > @as(c_int, 0)))) and (__builtin_constant_p(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 4096)))) <= (sz / @sizeOf(u8))) != 0)) and !(@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 4096)))) <= (sz / @sizeOf(u8)))) return __realpath_chk_warn(__name, __resolved, sz);
    return __realpath_chk(__name, __resolved, sz);
}
pub const __compar_fn_t = ?*const fn (?*const anyopaque, ?*const anyopaque) callconv(.c) c_int;
pub fn bsearch(arg___key: ?*const anyopaque, arg___base: ?*const anyopaque, arg___nmemb: usize, arg___size: usize, arg___compar: __compar_fn_t) callconv(.c) ?*anyopaque {
    var __key = arg___key;
    _ = &__key;
    var __base = arg___base;
    _ = &__base;
    var __nmemb = arg___nmemb;
    _ = &__nmemb;
    var __size = arg___size;
    _ = &__size;
    var __compar = arg___compar;
    _ = &__compar;
    var __l: usize = undefined;
    _ = &__l;
    var __u: usize = undefined;
    _ = &__u;
    var __idx: usize = undefined;
    _ = &__idx;
    var __p: ?*const anyopaque = undefined;
    _ = &__p;
    var __comparison: c_int = undefined;
    _ = &__comparison;
    __l = 0;
    __u = __nmemb;
    while (__l < __u) {
        __idx = (__l +% __u) / @as(usize, @bitCast(@as(c_long, @as(c_int, 2))));
        __p = @as(?*const anyopaque, @ptrCast(@as([*c]const u8, @ptrCast(@alignCast(__base))) + (__idx *% __size)));
        __comparison = __compar.?(__key, __p);
        if (__comparison < @as(c_int, 0)) {
            __u = __idx;
        } else if (__comparison > @as(c_int, 0)) {
            __l = __idx +% @as(usize, @bitCast(@as(c_long, @as(c_int, 1))));
        } else {
            return @as(?*anyopaque, @ptrCast(@volatileCast(@constCast(__p))));
        }
    }
    return @as(?*anyopaque, @ptrFromInt(@as(c_int, 0)));
}
pub extern fn qsort(__base: ?*anyopaque, __nmemb: usize, __size: usize, __compar: __compar_fn_t) void;
pub extern fn abs(__x: c_int) c_int;
pub extern fn labs(__x: c_long) c_long;
pub extern fn llabs(__x: c_longlong) c_longlong;
pub extern fn div(__numer: c_int, __denom: c_int) div_t;
pub extern fn ldiv(__numer: c_long, __denom: c_long) ldiv_t;
pub extern fn lldiv(__numer: c_longlong, __denom: c_longlong) lldiv_t;
pub extern fn ecvt(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn fcvt(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn gcvt(__value: f64, __ndigit: c_int, __buf: [*c]u8) [*c]u8;
pub extern fn qecvt(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn qfcvt(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int) [*c]u8;
pub extern fn qgcvt(__value: c_longdouble, __ndigit: c_int, __buf: [*c]u8) [*c]u8;
pub extern fn ecvt_r(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn fcvt_r(__value: f64, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn qecvt_r(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn qfcvt_r(__value: c_longdouble, __ndigit: c_int, noalias __decpt: [*c]c_int, noalias __sign: [*c]c_int, noalias __buf: [*c]u8, __len: usize) c_int;
pub extern fn mblen(__s: [*c]const u8, __n: usize) c_int;
pub extern fn mbtowc(noalias __pwc: [*c]wchar_t, noalias __s: [*c]const u8, __n: usize) c_int;
pub inline fn wctomb(arg___s: [*c]u8, arg___wchar: wchar_t) c_int {
    var __s = arg___s;
    _ = &__s;
    var __wchar = arg___wchar;
    _ = &__wchar;
    if ((__builtin_object_size(@as(?*const anyopaque, @ptrCast(__s)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))) != @as(usize, @bitCast(@as(c_long, -@as(c_int, 1))))) and (@as(c_ulong, @bitCast(@as(c_long, @as(c_int, 16)))) > __builtin_object_size(@as(?*const anyopaque, @ptrCast(__s)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))))) return __wctomb_chk(__s, __wchar, __builtin_object_size(@as(?*const anyopaque, @ptrCast(__s)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))));
    return __wctomb_alias(__s, __wchar);
}
pub inline fn mbstowcs(noalias arg___dst: [*c]wchar_t, noalias arg___src: [*c]const u8, arg___len: usize) usize {
    var __dst = arg___dst;
    _ = &__dst;
    var __src = arg___src;
    _ = &__src;
    var __len = arg___len;
    _ = &__len;
    if ((__builtin_constant_p(__dst == @as([*c]wchar_t, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0))))))) != 0) and (__dst == @as([*c]wchar_t, @ptrCast(@alignCast(@as(?*anyopaque, @ptrFromInt(@as(c_int, 0)))))))) return __mbstowcs_nulldst(__dst, __src, __len) else return if (((__builtin_constant_p(__builtin_object_size(@as(?*const anyopaque, @ptrCast(__dst)), @intFromBool(@as(c_int, 2) > @as(c_int, 1)))) != 0) and (__builtin_object_size(@as(?*const anyopaque, @ptrCast(__dst)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))) == @as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 1)))))) or ((((@as(@TypeOf(__len), @bitCast(@as(c_long, @as(c_int, 0)))) < @as(@TypeOf(__len), @bitCast(@as(c_long, -@as(c_int, 1))))) or ((__builtin_constant_p(__len) != 0) and (__len > @as(usize, @bitCast(@as(c_long, @as(c_int, 0))))))) and (__builtin_constant_p(@as(c_ulong, @bitCast(__len)) <= (__builtin_object_size(@as(?*const anyopaque, @ptrCast(__dst)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))) / @sizeOf(wchar_t))) != 0)) and (@as(c_ulong, @bitCast(__len)) <= (__builtin_object_size(@as(?*const anyopaque, @ptrCast(__dst)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))) / @sizeOf(wchar_t))))) __mbstowcs_alias(__dst, __src, __len) else if ((((@as(@TypeOf(__len), @bitCast(@as(c_long, @as(c_int, 0)))) < @as(@TypeOf(__len), @bitCast(@as(c_long, -@as(c_int, 1))))) or ((__builtin_constant_p(__len) != 0) and (__len > @as(usize, @bitCast(@as(c_long, @as(c_int, 0))))))) and (__builtin_constant_p(@as(c_ulong, @bitCast(__len)) <= (__builtin_object_size(@as(?*const anyopaque, @ptrCast(__dst)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))) / @sizeOf(wchar_t))) != 0)) and !(@as(c_ulong, @bitCast(__len)) <= (__builtin_object_size(@as(?*const anyopaque, @ptrCast(__dst)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))) / @sizeOf(wchar_t)))) __mbstowcs_chk_warn(__dst, __src, __len, __builtin_object_size(@as(?*const anyopaque, @ptrCast(__dst)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))) / @sizeOf(wchar_t)) else __mbstowcs_chk(__dst, __src, __len, __builtin_object_size(@as(?*const anyopaque, @ptrCast(__dst)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))) / @sizeOf(wchar_t));
    return @import("std").mem.zeroes(usize);
}
pub inline fn wcstombs(noalias arg___dst: [*c]u8, noalias arg___src: [*c]const wchar_t, arg___len: usize) usize {
    var __dst = arg___dst;
    _ = &__dst;
    var __src = arg___src;
    _ = &__src;
    var __len = arg___len;
    _ = &__len;
    return if (((__builtin_constant_p(__builtin_object_size(@as(?*const anyopaque, @ptrCast(__dst)), @intFromBool(@as(c_int, 2) > @as(c_int, 1)))) != 0) and (__builtin_object_size(@as(?*const anyopaque, @ptrCast(__dst)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))) == @as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 1)))))) or ((((@as(@TypeOf(__len), @bitCast(@as(c_long, @as(c_int, 0)))) < @as(@TypeOf(__len), @bitCast(@as(c_long, -@as(c_int, 1))))) or ((__builtin_constant_p(__len) != 0) and (__len > @as(usize, @bitCast(@as(c_long, @as(c_int, 0))))))) and (__builtin_constant_p(@as(c_ulong, @bitCast(__len)) <= (__builtin_object_size(@as(?*const anyopaque, @ptrCast(__dst)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))) / @sizeOf(u8))) != 0)) and (@as(c_ulong, @bitCast(__len)) <= (__builtin_object_size(@as(?*const anyopaque, @ptrCast(__dst)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))) / @sizeOf(u8))))) __wcstombs_alias(__dst, __src, __len) else if ((((@as(@TypeOf(__len), @bitCast(@as(c_long, @as(c_int, 0)))) < @as(@TypeOf(__len), @bitCast(@as(c_long, -@as(c_int, 1))))) or ((__builtin_constant_p(__len) != 0) and (__len > @as(usize, @bitCast(@as(c_long, @as(c_int, 0))))))) and (__builtin_constant_p(@as(c_ulong, @bitCast(__len)) <= (__builtin_object_size(@as(?*const anyopaque, @ptrCast(__dst)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))) / @sizeOf(u8))) != 0)) and !(@as(c_ulong, @bitCast(__len)) <= (__builtin_object_size(@as(?*const anyopaque, @ptrCast(__dst)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))) / @sizeOf(u8)))) __wcstombs_chk_warn(__dst, __src, __len, __builtin_object_size(@as(?*const anyopaque, @ptrCast(__dst)), @intFromBool(@as(c_int, 2) > @as(c_int, 1)))) else __wcstombs_chk(__dst, __src, __len, __builtin_object_size(@as(?*const anyopaque, @ptrCast(__dst)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))));
}
pub extern fn rpmatch(__response: [*c]const u8) c_int;
pub extern fn getsubopt(noalias __optionp: [*c][*c]u8, noalias __tokens: [*c]const [*c]u8, noalias __valuep: [*c][*c]u8) c_int;
pub extern fn getloadavg(__loadavg: [*c]f64, __nelem: c_int) c_int;
pub extern fn __realpath_chk(noalias __name: [*c]const u8, noalias __resolved: [*c]u8, __resolvedlen: usize) [*c]u8;
pub extern fn __realpath_alias(noalias __name: [*c]const u8, noalias __resolved: [*c]u8) [*c]u8;
pub extern fn __realpath_chk_warn(noalias __name: [*c]const u8, noalias __resolved: [*c]u8, __resolvedlen: usize) [*c]u8;
pub extern fn __ptsname_r_chk(__fd: c_int, __buf: [*c]u8, __buflen: usize, __nreal: usize) c_int;
pub extern fn __ptsname_r_alias(__fd: c_int, __buf: [*c]u8, __buflen: usize) c_int;
pub extern fn __ptsname_r_chk_warn(__fd: c_int, __buf: [*c]u8, __buflen: usize, __nreal: usize) c_int;
pub inline fn ptsname_r(arg___fd: c_int, arg___buf: [*c]u8, arg___buflen: usize) c_int {
    var __fd = arg___fd;
    _ = &__fd;
    var __buf = arg___buf;
    _ = &__buf;
    var __buflen = arg___buflen;
    _ = &__buflen;
    return if (((__builtin_constant_p(__builtin_object_size(@as(?*const anyopaque, @ptrCast(__buf)), @intFromBool(@as(c_int, 2) > @as(c_int, 1)))) != 0) and (__builtin_object_size(@as(?*const anyopaque, @ptrCast(__buf)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))) == @as(c_ulong, @bitCast(@as(c_long, -@as(c_int, 1)))))) or ((((@as(@TypeOf(__buflen), @bitCast(@as(c_long, @as(c_int, 0)))) < @as(@TypeOf(__buflen), @bitCast(@as(c_long, -@as(c_int, 1))))) or ((__builtin_constant_p(__buflen) != 0) and (__buflen > @as(usize, @bitCast(@as(c_long, @as(c_int, 0))))))) and (__builtin_constant_p(@as(c_ulong, @bitCast(__buflen)) <= (__builtin_object_size(@as(?*const anyopaque, @ptrCast(__buf)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))) / @sizeOf(u8))) != 0)) and (@as(c_ulong, @bitCast(__buflen)) <= (__builtin_object_size(@as(?*const anyopaque, @ptrCast(__buf)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))) / @sizeOf(u8))))) __ptsname_r_alias(__fd, __buf, __buflen) else if ((((@as(@TypeOf(__buflen), @bitCast(@as(c_long, @as(c_int, 0)))) < @as(@TypeOf(__buflen), @bitCast(@as(c_long, -@as(c_int, 1))))) or ((__builtin_constant_p(__buflen) != 0) and (__buflen > @as(usize, @bitCast(@as(c_long, @as(c_int, 0))))))) and (__builtin_constant_p(@as(c_ulong, @bitCast(__buflen)) <= (__builtin_object_size(@as(?*const anyopaque, @ptrCast(__buf)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))) / @sizeOf(u8))) != 0)) and !(@as(c_ulong, @bitCast(__buflen)) <= (__builtin_object_size(@as(?*const anyopaque, @ptrCast(__buf)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))) / @sizeOf(u8)))) __ptsname_r_chk_warn(__fd, __buf, __buflen, __builtin_object_size(@as(?*const anyopaque, @ptrCast(__buf)), @intFromBool(@as(c_int, 2) > @as(c_int, 1)))) else __ptsname_r_chk(__fd, __buf, __buflen, __builtin_object_size(@as(?*const anyopaque, @ptrCast(__buf)), @intFromBool(@as(c_int, 2) > @as(c_int, 1))));
}
pub extern fn __wctomb_chk(__s: [*c]u8, __wchar: wchar_t, __buflen: usize) c_int;
pub extern fn __wctomb_alias(__s: [*c]u8, __wchar: wchar_t) c_int;
pub extern fn __mbstowcs_chk(noalias __dst: [*c]wchar_t, noalias __src: [*c]const u8, __len: usize, __dstlen: usize) usize;
pub extern fn __mbstowcs_nulldst(noalias __dst: [*c]wchar_t, noalias __src: [*c]const u8, __len: usize) usize;
pub extern fn __mbstowcs_alias(noalias __dst: [*c]wchar_t, noalias __src: [*c]const u8, __len: usize) usize;
pub extern fn __mbstowcs_chk_warn(noalias __dst: [*c]wchar_t, noalias __src: [*c]const u8, __len: usize, __dstlen: usize) usize;
pub extern fn __wcstombs_chk(noalias __dst: [*c]u8, noalias __src: [*c]const wchar_t, __len: usize, __dstlen: usize) usize;
pub extern fn __wcstombs_alias(noalias __dst: [*c]u8, noalias __src: [*c]const wchar_t, __len: usize) usize;
pub extern fn __wcstombs_chk_warn(noalias __dst: [*c]u8, noalias __src: [*c]const wchar_t, __len: usize, __dstlen: usize) usize;
pub extern fn xmlSAX2GetPublicId(ctx: ?*anyopaque) [*c]const xmlChar;
pub extern fn xmlSAX2GetSystemId(ctx: ?*anyopaque) [*c]const xmlChar;
pub extern fn xmlSAX2SetDocumentLocator(ctx: ?*anyopaque, loc: xmlSAXLocatorPtr) void;
pub extern fn xmlSAX2GetLineNumber(ctx: ?*anyopaque) c_int;
pub extern fn xmlSAX2GetColumnNumber(ctx: ?*anyopaque) c_int;
pub extern fn xmlSAX2IsStandalone(ctx: ?*anyopaque) c_int;
pub extern fn xmlSAX2HasInternalSubset(ctx: ?*anyopaque) c_int;
pub extern fn xmlSAX2HasExternalSubset(ctx: ?*anyopaque) c_int;
pub extern fn xmlSAX2InternalSubset(ctx: ?*anyopaque, name: [*c]const xmlChar, ExternalID: [*c]const xmlChar, SystemID: [*c]const xmlChar) void;
pub extern fn xmlSAX2ExternalSubset(ctx: ?*anyopaque, name: [*c]const xmlChar, ExternalID: [*c]const xmlChar, SystemID: [*c]const xmlChar) void;
pub extern fn xmlSAX2GetEntity(ctx: ?*anyopaque, name: [*c]const xmlChar) xmlEntityPtr;
pub extern fn xmlSAX2GetParameterEntity(ctx: ?*anyopaque, name: [*c]const xmlChar) xmlEntityPtr;
pub extern fn xmlSAX2ResolveEntity(ctx: ?*anyopaque, publicId: [*c]const xmlChar, systemId: [*c]const xmlChar) xmlParserInputPtr;
pub extern fn xmlSAX2EntityDecl(ctx: ?*anyopaque, name: [*c]const xmlChar, @"type": c_int, publicId: [*c]const xmlChar, systemId: [*c]const xmlChar, content: [*c]xmlChar) void;
pub extern fn xmlSAX2AttributeDecl(ctx: ?*anyopaque, elem: [*c]const xmlChar, fullname: [*c]const xmlChar, @"type": c_int, def: c_int, defaultValue: [*c]const xmlChar, tree: xmlEnumerationPtr) void;
pub extern fn xmlSAX2ElementDecl(ctx: ?*anyopaque, name: [*c]const xmlChar, @"type": c_int, content: xmlElementContentPtr) void;
pub extern fn xmlSAX2NotationDecl(ctx: ?*anyopaque, name: [*c]const xmlChar, publicId: [*c]const xmlChar, systemId: [*c]const xmlChar) void;
pub extern fn xmlSAX2UnparsedEntityDecl(ctx: ?*anyopaque, name: [*c]const xmlChar, publicId: [*c]const xmlChar, systemId: [*c]const xmlChar, notationName: [*c]const xmlChar) void;
pub extern fn xmlSAX2StartDocument(ctx: ?*anyopaque) void;
pub extern fn xmlSAX2EndDocument(ctx: ?*anyopaque) void;
pub extern fn xmlSAX2StartElementNs(ctx: ?*anyopaque, localname: [*c]const xmlChar, prefix: [*c]const xmlChar, URI: [*c]const xmlChar, nb_namespaces: c_int, namespaces: [*c][*c]const xmlChar, nb_attributes: c_int, nb_defaulted: c_int, attributes: [*c][*c]const xmlChar) void;
pub extern fn xmlSAX2EndElementNs(ctx: ?*anyopaque, localname: [*c]const xmlChar, prefix: [*c]const xmlChar, URI: [*c]const xmlChar) void;
pub extern fn xmlSAX2Reference(ctx: ?*anyopaque, name: [*c]const xmlChar) void;
pub extern fn xmlSAX2Characters(ctx: ?*anyopaque, ch: [*c]const xmlChar, len: c_int) void;
pub extern fn xmlSAX2IgnorableWhitespace(ctx: ?*anyopaque, ch: [*c]const xmlChar, len: c_int) void;
pub extern fn xmlSAX2ProcessingInstruction(ctx: ?*anyopaque, target: [*c]const xmlChar, data: [*c]const xmlChar) void;
pub extern fn xmlSAX2Comment(ctx: ?*anyopaque, value: [*c]const xmlChar) void;
pub extern fn xmlSAX2CDataBlock(ctx: ?*anyopaque, value: [*c]const xmlChar, len: c_int) void;
pub extern fn xmlSAXVersion(hdlr: [*c]xmlSAXHandler, version: c_int) c_int;
pub extern fn xmlSAX2InitDefaultSAXHandler(hdlr: [*c]xmlSAXHandler, warning: c_int) void;
pub extern fn xmlDefaultSAXHandlerInit() void;
pub extern fn xmlInitGlobals() void;
pub extern fn xmlCleanupGlobals() void;
pub const xmlParserInputBufferCreateFilenameFunc = ?*const fn ([*c]const u8, xmlCharEncoding) callconv(.c) xmlParserInputBufferPtr;
pub const xmlOutputBufferCreateFilenameFunc = ?*const fn ([*c]const u8, xmlCharEncodingHandlerPtr, c_int) callconv(.c) xmlOutputBufferPtr;
pub extern fn xmlParserInputBufferCreateFilenameDefault(func: xmlParserInputBufferCreateFilenameFunc) xmlParserInputBufferCreateFilenameFunc;
pub extern fn xmlOutputBufferCreateFilenameDefault(func: xmlOutputBufferCreateFilenameFunc) xmlOutputBufferCreateFilenameFunc;
pub const xmlRegisterNodeFunc = ?*const fn (xmlNodePtr) callconv(.c) void;
pub const xmlDeregisterNodeFunc = ?*const fn (xmlNodePtr) callconv(.c) void;
pub const struct__xmlGlobalState = extern struct {
    xmlParserVersion: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    xmlDefaultSAXLocator: xmlSAXLocator = @import("std").mem.zeroes(xmlSAXLocator),
    xmlDefaultSAXHandler: xmlSAXHandlerV1 = @import("std").mem.zeroes(xmlSAXHandlerV1),
    docbDefaultSAXHandler: xmlSAXHandlerV1 = @import("std").mem.zeroes(xmlSAXHandlerV1),
    htmlDefaultSAXHandler: xmlSAXHandlerV1 = @import("std").mem.zeroes(xmlSAXHandlerV1),
    xmlFree: xmlFreeFunc = @import("std").mem.zeroes(xmlFreeFunc),
    xmlMalloc: xmlMallocFunc = @import("std").mem.zeroes(xmlMallocFunc),
    xmlMemStrdup: xmlStrdupFunc = @import("std").mem.zeroes(xmlStrdupFunc),
    xmlRealloc: xmlReallocFunc = @import("std").mem.zeroes(xmlReallocFunc),
    xmlGenericError: xmlGenericErrorFunc = @import("std").mem.zeroes(xmlGenericErrorFunc),
    xmlStructuredError: xmlStructuredErrorFunc = @import("std").mem.zeroes(xmlStructuredErrorFunc),
    xmlGenericErrorContext: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
    oldXMLWDcompatibility: c_int = @import("std").mem.zeroes(c_int),
    xmlBufferAllocScheme: xmlBufferAllocationScheme = @import("std").mem.zeroes(xmlBufferAllocationScheme),
    xmlDefaultBufferSize: c_int = @import("std").mem.zeroes(c_int),
    xmlSubstituteEntitiesDefaultValue: c_int = @import("std").mem.zeroes(c_int),
    xmlDoValidityCheckingDefaultValue: c_int = @import("std").mem.zeroes(c_int),
    xmlGetWarningsDefaultValue: c_int = @import("std").mem.zeroes(c_int),
    xmlKeepBlanksDefaultValue: c_int = @import("std").mem.zeroes(c_int),
    xmlLineNumbersDefaultValue: c_int = @import("std").mem.zeroes(c_int),
    xmlLoadExtDtdDefaultValue: c_int = @import("std").mem.zeroes(c_int),
    xmlParserDebugEntities: c_int = @import("std").mem.zeroes(c_int),
    xmlPedanticParserDefaultValue: c_int = @import("std").mem.zeroes(c_int),
    xmlSaveNoEmptyTags: c_int = @import("std").mem.zeroes(c_int),
    xmlIndentTreeOutput: c_int = @import("std").mem.zeroes(c_int),
    xmlTreeIndentString: [*c]const u8 = @import("std").mem.zeroes([*c]const u8),
    xmlRegisterNodeDefaultValue: xmlRegisterNodeFunc = @import("std").mem.zeroes(xmlRegisterNodeFunc),
    xmlDeregisterNodeDefaultValue: xmlDeregisterNodeFunc = @import("std").mem.zeroes(xmlDeregisterNodeFunc),
    xmlMallocAtomic: xmlMallocFunc = @import("std").mem.zeroes(xmlMallocFunc),
    xmlLastError: xmlError = @import("std").mem.zeroes(xmlError),
    xmlParserInputBufferCreateFilenameValue: xmlParserInputBufferCreateFilenameFunc = @import("std").mem.zeroes(xmlParserInputBufferCreateFilenameFunc),
    xmlOutputBufferCreateFilenameValue: xmlOutputBufferCreateFilenameFunc = @import("std").mem.zeroes(xmlOutputBufferCreateFilenameFunc),
    xmlStructuredErrorContext: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const xmlGlobalState = struct__xmlGlobalState;
pub const xmlGlobalStatePtr = [*c]xmlGlobalState;
pub extern fn xmlInitializeGlobalState(gs: xmlGlobalStatePtr) void;
pub extern fn xmlThrDefSetGenericErrorFunc(ctx: ?*anyopaque, handler: xmlGenericErrorFunc) void;
pub extern fn xmlThrDefSetStructuredErrorFunc(ctx: ?*anyopaque, handler: xmlStructuredErrorFunc) void;
pub extern fn xmlRegisterNodeDefault(func: xmlRegisterNodeFunc) xmlRegisterNodeFunc;
pub extern fn xmlThrDefRegisterNodeDefault(func: xmlRegisterNodeFunc) xmlRegisterNodeFunc;
pub extern fn xmlDeregisterNodeDefault(func: xmlDeregisterNodeFunc) xmlDeregisterNodeFunc;
pub extern fn xmlThrDefDeregisterNodeDefault(func: xmlDeregisterNodeFunc) xmlDeregisterNodeFunc;
pub extern fn xmlThrDefOutputBufferCreateFilenameDefault(func: xmlOutputBufferCreateFilenameFunc) xmlOutputBufferCreateFilenameFunc;
pub extern fn xmlThrDefParserInputBufferCreateFilenameDefault(func: xmlParserInputBufferCreateFilenameFunc) xmlParserInputBufferCreateFilenameFunc;
pub extern var xmlMalloc: xmlMallocFunc;
pub extern var xmlMallocAtomic: xmlMallocFunc;
pub extern var xmlRealloc: xmlReallocFunc;
pub extern var xmlFree: xmlFreeFunc;
pub extern var xmlMemStrdup: xmlStrdupFunc;
pub extern fn __xmlLastError() [*c]xmlError;
pub extern var xmlLastError: xmlError;
pub extern fn __oldXMLWDcompatibility() [*c]c_int;
pub extern var oldXMLWDcompatibility: c_int;
pub extern fn __xmlBufferAllocScheme() [*c]xmlBufferAllocationScheme;
pub extern var xmlBufferAllocScheme: xmlBufferAllocationScheme;
pub extern fn xmlThrDefBufferAllocScheme(v: xmlBufferAllocationScheme) xmlBufferAllocationScheme;
pub extern fn __xmlDefaultBufferSize() [*c]c_int;
pub extern var xmlDefaultBufferSize: c_int;
pub extern fn xmlThrDefDefaultBufferSize(v: c_int) c_int;
pub extern fn __xmlDefaultSAXHandler() [*c]xmlSAXHandlerV1;
pub extern var xmlDefaultSAXHandler: xmlSAXHandlerV1;
pub extern fn __xmlDefaultSAXLocator() [*c]xmlSAXLocator;
pub extern var xmlDefaultSAXLocator: xmlSAXLocator;
pub extern fn __xmlDoValidityCheckingDefaultValue() [*c]c_int;
pub extern var xmlDoValidityCheckingDefaultValue: c_int;
pub extern fn xmlThrDefDoValidityCheckingDefaultValue(v: c_int) c_int;
pub extern fn __xmlGenericError() [*c]xmlGenericErrorFunc;
pub extern var xmlGenericError: xmlGenericErrorFunc;
pub extern fn __xmlStructuredError() [*c]xmlStructuredErrorFunc;
pub extern var xmlStructuredError: xmlStructuredErrorFunc;
pub extern fn __xmlGenericErrorContext() [*c]?*anyopaque;
pub extern var xmlGenericErrorContext: ?*anyopaque;
pub extern fn __xmlStructuredErrorContext() [*c]?*anyopaque;
pub extern var xmlStructuredErrorContext: ?*anyopaque;
pub extern fn __xmlGetWarningsDefaultValue() [*c]c_int;
pub extern var xmlGetWarningsDefaultValue: c_int;
pub extern fn xmlThrDefGetWarningsDefaultValue(v: c_int) c_int;
pub extern fn __xmlIndentTreeOutput() [*c]c_int;
pub extern var xmlIndentTreeOutput: c_int;
pub extern fn xmlThrDefIndentTreeOutput(v: c_int) c_int;
pub extern fn __xmlTreeIndentString() [*c][*c]const u8;
pub extern var xmlTreeIndentString: [*c]const u8;
pub extern fn xmlThrDefTreeIndentString(v: [*c]const u8) [*c]const u8;
pub extern fn __xmlKeepBlanksDefaultValue() [*c]c_int;
pub extern var xmlKeepBlanksDefaultValue: c_int;
pub extern fn xmlThrDefKeepBlanksDefaultValue(v: c_int) c_int;
pub extern fn __xmlLineNumbersDefaultValue() [*c]c_int;
pub extern var xmlLineNumbersDefaultValue: c_int;
pub extern fn xmlThrDefLineNumbersDefaultValue(v: c_int) c_int;
pub extern fn __xmlLoadExtDtdDefaultValue() [*c]c_int;
pub extern var xmlLoadExtDtdDefaultValue: c_int;
pub extern fn xmlThrDefLoadExtDtdDefaultValue(v: c_int) c_int;
pub extern fn __xmlParserDebugEntities() [*c]c_int;
pub extern var xmlParserDebugEntities: c_int;
pub extern fn xmlThrDefParserDebugEntities(v: c_int) c_int;
pub extern fn __xmlParserVersion() [*c][*c]const u8;
pub extern var xmlParserVersion: [*c]const u8;
pub extern fn __xmlPedanticParserDefaultValue() [*c]c_int;
pub extern var xmlPedanticParserDefaultValue: c_int;
pub extern fn xmlThrDefPedanticParserDefaultValue(v: c_int) c_int;
pub extern fn __xmlSaveNoEmptyTags() [*c]c_int;
pub extern var xmlSaveNoEmptyTags: c_int;
pub extern fn xmlThrDefSaveNoEmptyTags(v: c_int) c_int;
pub extern fn __xmlSubstituteEntitiesDefaultValue() [*c]c_int;
pub extern var xmlSubstituteEntitiesDefaultValue: c_int;
pub extern fn xmlThrDefSubstituteEntitiesDefaultValue(v: c_int) c_int;
pub extern fn __xmlRegisterNodeDefaultValue() [*c]xmlRegisterNodeFunc;
pub extern var xmlRegisterNodeDefaultValue: xmlRegisterNodeFunc;
pub extern fn __xmlDeregisterNodeDefaultValue() [*c]xmlDeregisterNodeFunc;
pub extern var xmlDeregisterNodeDefaultValue: xmlDeregisterNodeFunc;
pub extern fn __xmlParserInputBufferCreateFilenameValue() [*c]xmlParserInputBufferCreateFilenameFunc;
pub extern var xmlParserInputBufferCreateFilenameValue: xmlParserInputBufferCreateFilenameFunc;
pub extern fn __xmlOutputBufferCreateFilenameValue() [*c]xmlOutputBufferCreateFilenameFunc;
pub extern var xmlOutputBufferCreateFilenameValue: xmlOutputBufferCreateFilenameFunc;
pub extern fn xmlNewMutex() xmlMutexPtr;
pub extern fn xmlMutexLock(tok: xmlMutexPtr) void;
pub extern fn xmlMutexUnlock(tok: xmlMutexPtr) void;
pub extern fn xmlFreeMutex(tok: xmlMutexPtr) void;
pub extern fn xmlNewRMutex() xmlRMutexPtr;
pub extern fn xmlRMutexLock(tok: xmlRMutexPtr) void;
pub extern fn xmlRMutexUnlock(tok: xmlRMutexPtr) void;
pub extern fn xmlFreeRMutex(tok: xmlRMutexPtr) void;
pub extern fn xmlInitThreads() void;
pub extern fn xmlLockLibrary() void;
pub extern fn xmlUnlockLibrary() void;
pub extern fn xmlGetThreadId() c_int;
pub extern fn xmlIsMainThread() c_int;
pub extern fn xmlCleanupThreads() void;
pub extern fn xmlGetGlobalState() xmlGlobalStatePtr;
pub const struct__xmlRelaxNG = opaque {};
pub const xmlRelaxNG = struct__xmlRelaxNG;
pub const xmlRelaxNGPtr = ?*xmlRelaxNG;
pub const xmlRelaxNGValidityErrorFunc = ?*const fn (?*anyopaque, [*c]const u8, ...) callconv(.c) void;
pub const xmlRelaxNGValidityWarningFunc = ?*const fn (?*anyopaque, [*c]const u8, ...) callconv(.c) void;
pub const struct__xmlRelaxNGParserCtxt = opaque {};
pub const xmlRelaxNGParserCtxt = struct__xmlRelaxNGParserCtxt;
pub const xmlRelaxNGParserCtxtPtr = ?*xmlRelaxNGParserCtxt;
pub const struct__xmlRelaxNGValidCtxt = opaque {};
pub const xmlRelaxNGValidCtxt = struct__xmlRelaxNGValidCtxt;
pub const xmlRelaxNGValidCtxtPtr = ?*xmlRelaxNGValidCtxt;
pub const XML_RELAXNG_OK: c_int = 0;
pub const XML_RELAXNG_ERR_MEMORY: c_int = 1;
pub const XML_RELAXNG_ERR_TYPE: c_int = 2;
pub const XML_RELAXNG_ERR_TYPEVAL: c_int = 3;
pub const XML_RELAXNG_ERR_DUPID: c_int = 4;
pub const XML_RELAXNG_ERR_TYPECMP: c_int = 5;
pub const XML_RELAXNG_ERR_NOSTATE: c_int = 6;
pub const XML_RELAXNG_ERR_NODEFINE: c_int = 7;
pub const XML_RELAXNG_ERR_LISTEXTRA: c_int = 8;
pub const XML_RELAXNG_ERR_LISTEMPTY: c_int = 9;
pub const XML_RELAXNG_ERR_INTERNODATA: c_int = 10;
pub const XML_RELAXNG_ERR_INTERSEQ: c_int = 11;
pub const XML_RELAXNG_ERR_INTEREXTRA: c_int = 12;
pub const XML_RELAXNG_ERR_ELEMNAME: c_int = 13;
pub const XML_RELAXNG_ERR_ATTRNAME: c_int = 14;
pub const XML_RELAXNG_ERR_ELEMNONS: c_int = 15;
pub const XML_RELAXNG_ERR_ATTRNONS: c_int = 16;
pub const XML_RELAXNG_ERR_ELEMWRONGNS: c_int = 17;
pub const XML_RELAXNG_ERR_ATTRWRONGNS: c_int = 18;
pub const XML_RELAXNG_ERR_ELEMEXTRANS: c_int = 19;
pub const XML_RELAXNG_ERR_ATTREXTRANS: c_int = 20;
pub const XML_RELAXNG_ERR_ELEMNOTEMPTY: c_int = 21;
pub const XML_RELAXNG_ERR_NOELEM: c_int = 22;
pub const XML_RELAXNG_ERR_NOTELEM: c_int = 23;
pub const XML_RELAXNG_ERR_ATTRVALID: c_int = 24;
pub const XML_RELAXNG_ERR_CONTENTVALID: c_int = 25;
pub const XML_RELAXNG_ERR_EXTRACONTENT: c_int = 26;
pub const XML_RELAXNG_ERR_INVALIDATTR: c_int = 27;
pub const XML_RELAXNG_ERR_DATAELEM: c_int = 28;
pub const XML_RELAXNG_ERR_VALELEM: c_int = 29;
pub const XML_RELAXNG_ERR_LISTELEM: c_int = 30;
pub const XML_RELAXNG_ERR_DATATYPE: c_int = 31;
pub const XML_RELAXNG_ERR_VALUE: c_int = 32;
pub const XML_RELAXNG_ERR_LIST: c_int = 33;
pub const XML_RELAXNG_ERR_NOGRAMMAR: c_int = 34;
pub const XML_RELAXNG_ERR_EXTRADATA: c_int = 35;
pub const XML_RELAXNG_ERR_LACKDATA: c_int = 36;
pub const XML_RELAXNG_ERR_INTERNAL: c_int = 37;
pub const XML_RELAXNG_ERR_ELEMWRONG: c_int = 38;
pub const XML_RELAXNG_ERR_TEXTWRONG: c_int = 39;
pub const xmlRelaxNGValidErr = c_uint;
pub const XML_RELAXNGP_NONE: c_int = 0;
pub const XML_RELAXNGP_FREE_DOC: c_int = 1;
pub const XML_RELAXNGP_CRNG: c_int = 2;
pub const xmlRelaxNGParserFlag = c_uint;
pub extern fn xmlRelaxNGInitTypes() c_int;
pub extern fn xmlRelaxNGCleanupTypes() void;
pub extern fn xmlRelaxNGNewParserCtxt(URL: [*c]const u8) xmlRelaxNGParserCtxtPtr;
pub extern fn xmlRelaxNGNewMemParserCtxt(buffer: [*c]const u8, size: c_int) xmlRelaxNGParserCtxtPtr;
pub extern fn xmlRelaxNGNewDocParserCtxt(doc: xmlDocPtr) xmlRelaxNGParserCtxtPtr;
pub extern fn xmlRelaxParserSetFlag(ctxt: xmlRelaxNGParserCtxtPtr, flag: c_int) c_int;
pub extern fn xmlRelaxNGFreeParserCtxt(ctxt: xmlRelaxNGParserCtxtPtr) void;
pub extern fn xmlRelaxNGSetParserErrors(ctxt: xmlRelaxNGParserCtxtPtr, err: xmlRelaxNGValidityErrorFunc, warn: xmlRelaxNGValidityWarningFunc, ctx: ?*anyopaque) void;
pub extern fn xmlRelaxNGGetParserErrors(ctxt: xmlRelaxNGParserCtxtPtr, err: [*c]xmlRelaxNGValidityErrorFunc, warn: [*c]xmlRelaxNGValidityWarningFunc, ctx: [*c]?*anyopaque) c_int;
pub extern fn xmlRelaxNGSetParserStructuredErrors(ctxt: xmlRelaxNGParserCtxtPtr, serror: xmlStructuredErrorFunc, ctx: ?*anyopaque) void;
pub extern fn xmlRelaxNGParse(ctxt: xmlRelaxNGParserCtxtPtr) xmlRelaxNGPtr;
pub extern fn xmlRelaxNGFree(schema: xmlRelaxNGPtr) void;
pub extern fn xmlRelaxNGSetValidErrors(ctxt: xmlRelaxNGValidCtxtPtr, err: xmlRelaxNGValidityErrorFunc, warn: xmlRelaxNGValidityWarningFunc, ctx: ?*anyopaque) void;
pub extern fn xmlRelaxNGGetValidErrors(ctxt: xmlRelaxNGValidCtxtPtr, err: [*c]xmlRelaxNGValidityErrorFunc, warn: [*c]xmlRelaxNGValidityWarningFunc, ctx: [*c]?*anyopaque) c_int;
pub extern fn xmlRelaxNGSetValidStructuredErrors(ctxt: xmlRelaxNGValidCtxtPtr, serror: xmlStructuredErrorFunc, ctx: ?*anyopaque) void;
pub extern fn xmlRelaxNGNewValidCtxt(schema: xmlRelaxNGPtr) xmlRelaxNGValidCtxtPtr;
pub extern fn xmlRelaxNGFreeValidCtxt(ctxt: xmlRelaxNGValidCtxtPtr) void;
pub extern fn xmlRelaxNGValidateDoc(ctxt: xmlRelaxNGValidCtxtPtr, doc: xmlDocPtr) c_int;
pub extern fn xmlRelaxNGValidatePushElement(ctxt: xmlRelaxNGValidCtxtPtr, doc: xmlDocPtr, elem: xmlNodePtr) c_int;
pub extern fn xmlRelaxNGValidatePushCData(ctxt: xmlRelaxNGValidCtxtPtr, data: [*c]const xmlChar, len: c_int) c_int;
pub extern fn xmlRelaxNGValidatePopElement(ctxt: xmlRelaxNGValidCtxtPtr, doc: xmlDocPtr, elem: xmlNodePtr) c_int;
pub extern fn xmlRelaxNGValidateFullElement(ctxt: xmlRelaxNGValidCtxtPtr, doc: xmlDocPtr, elem: xmlNodePtr) c_int;
pub const XML_SCHEMAS_ERR_OK: c_int = 0;
pub const XML_SCHEMAS_ERR_NOROOT: c_int = 1;
pub const XML_SCHEMAS_ERR_UNDECLAREDELEM: c_int = 2;
pub const XML_SCHEMAS_ERR_NOTTOPLEVEL: c_int = 3;
pub const XML_SCHEMAS_ERR_MISSING: c_int = 4;
pub const XML_SCHEMAS_ERR_WRONGELEM: c_int = 5;
pub const XML_SCHEMAS_ERR_NOTYPE: c_int = 6;
pub const XML_SCHEMAS_ERR_NOROLLBACK: c_int = 7;
pub const XML_SCHEMAS_ERR_ISABSTRACT: c_int = 8;
pub const XML_SCHEMAS_ERR_NOTEMPTY: c_int = 9;
pub const XML_SCHEMAS_ERR_ELEMCONT: c_int = 10;
pub const XML_SCHEMAS_ERR_HAVEDEFAULT: c_int = 11;
pub const XML_SCHEMAS_ERR_NOTNILLABLE: c_int = 12;
pub const XML_SCHEMAS_ERR_EXTRACONTENT: c_int = 13;
pub const XML_SCHEMAS_ERR_INVALIDATTR: c_int = 14;
pub const XML_SCHEMAS_ERR_INVALIDELEM: c_int = 15;
pub const XML_SCHEMAS_ERR_NOTDETERMINIST: c_int = 16;
pub const XML_SCHEMAS_ERR_CONSTRUCT: c_int = 17;
pub const XML_SCHEMAS_ERR_INTERNAL: c_int = 18;
pub const XML_SCHEMAS_ERR_NOTSIMPLE: c_int = 19;
pub const XML_SCHEMAS_ERR_ATTRUNKNOWN: c_int = 20;
pub const XML_SCHEMAS_ERR_ATTRINVALID: c_int = 21;
pub const XML_SCHEMAS_ERR_VALUE: c_int = 22;
pub const XML_SCHEMAS_ERR_FACET: c_int = 23;
pub const XML_SCHEMAS_ERR_: c_int = 24;
pub const XML_SCHEMAS_ERR_XXX: c_int = 25;
pub const xmlSchemaValidError = c_uint;
pub const XML_SCHEMA_VAL_VC_I_CREATE: c_int = 1;
pub const xmlSchemaValidOption = c_uint;
pub const struct__xmlSchema = opaque {};
pub const xmlSchema = struct__xmlSchema;
pub const xmlSchemaPtr = ?*xmlSchema;
pub const xmlSchemaValidityErrorFunc = ?*const fn (?*anyopaque, [*c]const u8, ...) callconv(.c) void;
pub const xmlSchemaValidityWarningFunc = ?*const fn (?*anyopaque, [*c]const u8, ...) callconv(.c) void;
pub const struct__xmlSchemaParserCtxt = opaque {};
pub const xmlSchemaParserCtxt = struct__xmlSchemaParserCtxt;
pub const xmlSchemaParserCtxtPtr = ?*xmlSchemaParserCtxt;
pub const struct__xmlSchemaValidCtxt = opaque {};
pub const xmlSchemaValidCtxt = struct__xmlSchemaValidCtxt;
pub const xmlSchemaValidCtxtPtr = ?*xmlSchemaValidCtxt;
pub const xmlSchemaValidityLocatorFunc = ?*const fn (?*anyopaque, [*c][*c]const u8, [*c]c_ulong) callconv(.c) c_int;
pub extern fn xmlSchemaNewParserCtxt(URL: [*c]const u8) xmlSchemaParserCtxtPtr;
pub extern fn xmlSchemaNewMemParserCtxt(buffer: [*c]const u8, size: c_int) xmlSchemaParserCtxtPtr;
pub extern fn xmlSchemaNewDocParserCtxt(doc: xmlDocPtr) xmlSchemaParserCtxtPtr;
pub extern fn xmlSchemaFreeParserCtxt(ctxt: xmlSchemaParserCtxtPtr) void;
pub extern fn xmlSchemaSetParserErrors(ctxt: xmlSchemaParserCtxtPtr, err: xmlSchemaValidityErrorFunc, warn: xmlSchemaValidityWarningFunc, ctx: ?*anyopaque) void;
pub extern fn xmlSchemaSetParserStructuredErrors(ctxt: xmlSchemaParserCtxtPtr, serror: xmlStructuredErrorFunc, ctx: ?*anyopaque) void;
pub extern fn xmlSchemaGetParserErrors(ctxt: xmlSchemaParserCtxtPtr, err: [*c]xmlSchemaValidityErrorFunc, warn: [*c]xmlSchemaValidityWarningFunc, ctx: [*c]?*anyopaque) c_int;
pub extern fn xmlSchemaIsValid(ctxt: xmlSchemaValidCtxtPtr) c_int;
pub extern fn xmlSchemaParse(ctxt: xmlSchemaParserCtxtPtr) xmlSchemaPtr;
pub extern fn xmlSchemaFree(schema: xmlSchemaPtr) void;
pub extern fn xmlSchemaSetValidErrors(ctxt: xmlSchemaValidCtxtPtr, err: xmlSchemaValidityErrorFunc, warn: xmlSchemaValidityWarningFunc, ctx: ?*anyopaque) void;
pub extern fn xmlSchemaSetValidStructuredErrors(ctxt: xmlSchemaValidCtxtPtr, serror: xmlStructuredErrorFunc, ctx: ?*anyopaque) void;
pub extern fn xmlSchemaGetValidErrors(ctxt: xmlSchemaValidCtxtPtr, err: [*c]xmlSchemaValidityErrorFunc, warn: [*c]xmlSchemaValidityWarningFunc, ctx: [*c]?*anyopaque) c_int;
pub extern fn xmlSchemaSetValidOptions(ctxt: xmlSchemaValidCtxtPtr, options: c_int) c_int;
pub extern fn xmlSchemaValidateSetFilename(vctxt: xmlSchemaValidCtxtPtr, filename: [*c]const u8) void;
pub extern fn xmlSchemaValidCtxtGetOptions(ctxt: xmlSchemaValidCtxtPtr) c_int;
pub extern fn xmlSchemaNewValidCtxt(schema: xmlSchemaPtr) xmlSchemaValidCtxtPtr;
pub extern fn xmlSchemaFreeValidCtxt(ctxt: xmlSchemaValidCtxtPtr) void;
pub extern fn xmlSchemaValidateDoc(ctxt: xmlSchemaValidCtxtPtr, instance: xmlDocPtr) c_int;
pub extern fn xmlSchemaValidateOneElement(ctxt: xmlSchemaValidCtxtPtr, elem: xmlNodePtr) c_int;
pub extern fn xmlSchemaValidateStream(ctxt: xmlSchemaValidCtxtPtr, input: xmlParserInputBufferPtr, enc: xmlCharEncoding, sax: xmlSAXHandlerPtr, user_data: ?*anyopaque) c_int;
pub extern fn xmlSchemaValidateFile(ctxt: xmlSchemaValidCtxtPtr, filename: [*c]const u8, options: c_int) c_int;
pub extern fn xmlSchemaValidCtxtGetParserCtxt(ctxt: xmlSchemaValidCtxtPtr) xmlParserCtxtPtr;
pub const struct__xmlSchemaSAXPlug = opaque {};
pub const xmlSchemaSAXPlugStruct = struct__xmlSchemaSAXPlug;
pub const xmlSchemaSAXPlugPtr = ?*xmlSchemaSAXPlugStruct;
pub extern fn xmlSchemaSAXPlug(ctxt: xmlSchemaValidCtxtPtr, sax: [*c]xmlSAXHandlerPtr, user_data: [*c]?*anyopaque) xmlSchemaSAXPlugPtr;
pub extern fn xmlSchemaSAXUnplug(plug: xmlSchemaSAXPlugPtr) c_int;
pub extern fn xmlSchemaValidateSetLocator(vctxt: xmlSchemaValidCtxtPtr, f: xmlSchemaValidityLocatorFunc, ctxt: ?*anyopaque) void;
pub const XML_PARSER_SEVERITY_VALIDITY_WARNING: c_int = 1;
pub const XML_PARSER_SEVERITY_VALIDITY_ERROR: c_int = 2;
pub const XML_PARSER_SEVERITY_WARNING: c_int = 3;
pub const XML_PARSER_SEVERITY_ERROR: c_int = 4;
pub const xmlParserSeverities = c_uint;
pub const XML_TEXTREADER_MODE_INITIAL: c_int = 0;
pub const XML_TEXTREADER_MODE_INTERACTIVE: c_int = 1;
pub const XML_TEXTREADER_MODE_ERROR: c_int = 2;
pub const XML_TEXTREADER_MODE_EOF: c_int = 3;
pub const XML_TEXTREADER_MODE_CLOSED: c_int = 4;
pub const XML_TEXTREADER_MODE_READING: c_int = 5;
pub const xmlTextReaderMode = c_uint;
pub const XML_PARSER_LOADDTD: c_int = 1;
pub const XML_PARSER_DEFAULTATTRS: c_int = 2;
pub const XML_PARSER_VALIDATE: c_int = 3;
pub const XML_PARSER_SUBST_ENTITIES: c_int = 4;
pub const xmlParserProperties = c_uint;
pub const XML_READER_TYPE_NONE: c_int = 0;
pub const XML_READER_TYPE_ELEMENT: c_int = 1;
pub const XML_READER_TYPE_ATTRIBUTE: c_int = 2;
pub const XML_READER_TYPE_TEXT: c_int = 3;
pub const XML_READER_TYPE_CDATA: c_int = 4;
pub const XML_READER_TYPE_ENTITY_REFERENCE: c_int = 5;
pub const XML_READER_TYPE_ENTITY: c_int = 6;
pub const XML_READER_TYPE_PROCESSING_INSTRUCTION: c_int = 7;
pub const XML_READER_TYPE_COMMENT: c_int = 8;
pub const XML_READER_TYPE_DOCUMENT: c_int = 9;
pub const XML_READER_TYPE_DOCUMENT_TYPE: c_int = 10;
pub const XML_READER_TYPE_DOCUMENT_FRAGMENT: c_int = 11;
pub const XML_READER_TYPE_NOTATION: c_int = 12;
pub const XML_READER_TYPE_WHITESPACE: c_int = 13;
pub const XML_READER_TYPE_SIGNIFICANT_WHITESPACE: c_int = 14;
pub const XML_READER_TYPE_END_ELEMENT: c_int = 15;
pub const XML_READER_TYPE_END_ENTITY: c_int = 16;
pub const XML_READER_TYPE_XML_DECLARATION: c_int = 17;
pub const xmlReaderTypes = c_uint;
pub const struct__xmlTextReader = opaque {};
pub const xmlTextReader = struct__xmlTextReader;
pub const xmlTextReaderPtr = ?*xmlTextReader;
pub extern fn xmlNewTextReader(input: xmlParserInputBufferPtr, URI: [*c]const u8) xmlTextReaderPtr;
pub extern fn xmlNewTextReaderFilename(URI: [*c]const u8) xmlTextReaderPtr;
pub extern fn xmlFreeTextReader(reader: xmlTextReaderPtr) void;
pub extern fn xmlTextReaderSetup(reader: xmlTextReaderPtr, input: xmlParserInputBufferPtr, URL: [*c]const u8, encoding: [*c]const u8, options: c_int) c_int;
pub extern fn xmlTextReaderRead(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderReadString(reader: xmlTextReaderPtr) [*c]xmlChar;
pub extern fn xmlTextReaderReadAttributeValue(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderAttributeCount(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderDepth(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderHasAttributes(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderHasValue(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderIsDefault(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderIsEmptyElement(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderNodeType(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderQuoteChar(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderReadState(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderIsNamespaceDecl(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderConstBaseUri(reader: xmlTextReaderPtr) [*c]const xmlChar;
pub extern fn xmlTextReaderConstLocalName(reader: xmlTextReaderPtr) [*c]const xmlChar;
pub extern fn xmlTextReaderConstName(reader: xmlTextReaderPtr) [*c]const xmlChar;
pub extern fn xmlTextReaderConstNamespaceUri(reader: xmlTextReaderPtr) [*c]const xmlChar;
pub extern fn xmlTextReaderConstPrefix(reader: xmlTextReaderPtr) [*c]const xmlChar;
pub extern fn xmlTextReaderConstXmlLang(reader: xmlTextReaderPtr) [*c]const xmlChar;
pub extern fn xmlTextReaderConstString(reader: xmlTextReaderPtr, str: [*c]const xmlChar) [*c]const xmlChar;
pub extern fn xmlTextReaderConstValue(reader: xmlTextReaderPtr) [*c]const xmlChar;
pub extern fn xmlTextReaderBaseUri(reader: xmlTextReaderPtr) [*c]xmlChar;
pub extern fn xmlTextReaderLocalName(reader: xmlTextReaderPtr) [*c]xmlChar;
pub extern fn xmlTextReaderName(reader: xmlTextReaderPtr) [*c]xmlChar;
pub extern fn xmlTextReaderNamespaceUri(reader: xmlTextReaderPtr) [*c]xmlChar;
pub extern fn xmlTextReaderPrefix(reader: xmlTextReaderPtr) [*c]xmlChar;
pub extern fn xmlTextReaderXmlLang(reader: xmlTextReaderPtr) [*c]xmlChar;
pub extern fn xmlTextReaderValue(reader: xmlTextReaderPtr) [*c]xmlChar;
pub extern fn xmlTextReaderClose(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderGetAttributeNo(reader: xmlTextReaderPtr, no: c_int) [*c]xmlChar;
pub extern fn xmlTextReaderGetAttribute(reader: xmlTextReaderPtr, name: [*c]const xmlChar) [*c]xmlChar;
pub extern fn xmlTextReaderGetAttributeNs(reader: xmlTextReaderPtr, localName: [*c]const xmlChar, namespaceURI: [*c]const xmlChar) [*c]xmlChar;
pub extern fn xmlTextReaderGetRemainder(reader: xmlTextReaderPtr) xmlParserInputBufferPtr;
pub extern fn xmlTextReaderLookupNamespace(reader: xmlTextReaderPtr, prefix: [*c]const xmlChar) [*c]xmlChar;
pub extern fn xmlTextReaderMoveToAttributeNo(reader: xmlTextReaderPtr, no: c_int) c_int;
pub extern fn xmlTextReaderMoveToAttribute(reader: xmlTextReaderPtr, name: [*c]const xmlChar) c_int;
pub extern fn xmlTextReaderMoveToAttributeNs(reader: xmlTextReaderPtr, localName: [*c]const xmlChar, namespaceURI: [*c]const xmlChar) c_int;
pub extern fn xmlTextReaderMoveToFirstAttribute(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderMoveToNextAttribute(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderMoveToElement(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderNormalization(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderConstEncoding(reader: xmlTextReaderPtr) [*c]const xmlChar;
pub extern fn xmlTextReaderSetParserProp(reader: xmlTextReaderPtr, prop: c_int, value: c_int) c_int;
pub extern fn xmlTextReaderGetParserProp(reader: xmlTextReaderPtr, prop: c_int) c_int;
pub extern fn xmlTextReaderCurrentNode(reader: xmlTextReaderPtr) xmlNodePtr;
pub extern fn xmlTextReaderGetParserLineNumber(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderGetParserColumnNumber(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderPreserve(reader: xmlTextReaderPtr) xmlNodePtr;
pub extern fn xmlTextReaderCurrentDoc(reader: xmlTextReaderPtr) xmlDocPtr;
pub extern fn xmlTextReaderExpand(reader: xmlTextReaderPtr) xmlNodePtr;
pub extern fn xmlTextReaderNext(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderNextSibling(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderIsValid(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderRelaxNGValidate(reader: xmlTextReaderPtr, rng: [*c]const u8) c_int;
pub extern fn xmlTextReaderRelaxNGValidateCtxt(reader: xmlTextReaderPtr, ctxt: xmlRelaxNGValidCtxtPtr, options: c_int) c_int;
pub extern fn xmlTextReaderRelaxNGSetSchema(reader: xmlTextReaderPtr, schema: xmlRelaxNGPtr) c_int;
pub extern fn xmlTextReaderSchemaValidate(reader: xmlTextReaderPtr, xsd: [*c]const u8) c_int;
pub extern fn xmlTextReaderSchemaValidateCtxt(reader: xmlTextReaderPtr, ctxt: xmlSchemaValidCtxtPtr, options: c_int) c_int;
pub extern fn xmlTextReaderSetSchema(reader: xmlTextReaderPtr, schema: xmlSchemaPtr) c_int;
pub extern fn xmlTextReaderConstXmlVersion(reader: xmlTextReaderPtr) [*c]const xmlChar;
pub extern fn xmlTextReaderStandalone(reader: xmlTextReaderPtr) c_int;
pub extern fn xmlTextReaderByteConsumed(reader: xmlTextReaderPtr) c_long;
pub extern fn xmlReaderWalker(doc: xmlDocPtr) xmlTextReaderPtr;
pub extern fn xmlReaderForDoc(cur: [*c]const xmlChar, URL: [*c]const u8, encoding: [*c]const u8, options: c_int) xmlTextReaderPtr;
pub extern fn xmlReaderForFile(filename: [*c]const u8, encoding: [*c]const u8, options: c_int) xmlTextReaderPtr;
pub extern fn xmlReaderForMemory(buffer: [*c]const u8, size: c_int, URL: [*c]const u8, encoding: [*c]const u8, options: c_int) xmlTextReaderPtr;
pub extern fn xmlReaderForFd(fd: c_int, URL: [*c]const u8, encoding: [*c]const u8, options: c_int) xmlTextReaderPtr;
pub extern fn xmlReaderForIO(ioread: xmlInputReadCallback, ioclose: xmlInputCloseCallback, ioctx: ?*anyopaque, URL: [*c]const u8, encoding: [*c]const u8, options: c_int) xmlTextReaderPtr;
pub extern fn xmlReaderNewWalker(reader: xmlTextReaderPtr, doc: xmlDocPtr) c_int;
pub extern fn xmlReaderNewDoc(reader: xmlTextReaderPtr, cur: [*c]const xmlChar, URL: [*c]const u8, encoding: [*c]const u8, options: c_int) c_int;
pub extern fn xmlReaderNewFile(reader: xmlTextReaderPtr, filename: [*c]const u8, encoding: [*c]const u8, options: c_int) c_int;
pub extern fn xmlReaderNewMemory(reader: xmlTextReaderPtr, buffer: [*c]const u8, size: c_int, URL: [*c]const u8, encoding: [*c]const u8, options: c_int) c_int;
pub extern fn xmlReaderNewFd(reader: xmlTextReaderPtr, fd: c_int, URL: [*c]const u8, encoding: [*c]const u8, options: c_int) c_int;
pub extern fn xmlReaderNewIO(reader: xmlTextReaderPtr, ioread: xmlInputReadCallback, ioclose: xmlInputCloseCallback, ioctx: ?*anyopaque, URL: [*c]const u8, encoding: [*c]const u8, options: c_int) c_int;
pub const xmlTextReaderLocatorPtr = ?*anyopaque;
pub const xmlTextReaderErrorFunc = ?*const fn (?*anyopaque, [*c]const u8, xmlParserSeverities, xmlTextReaderLocatorPtr) callconv(.c) void;
pub extern fn xmlTextReaderLocatorLineNumber(locator: xmlTextReaderLocatorPtr) c_int;
pub extern fn xmlTextReaderLocatorBaseURI(locator: xmlTextReaderLocatorPtr) [*c]xmlChar;
pub extern fn xmlTextReaderSetErrorHandler(reader: xmlTextReaderPtr, f: xmlTextReaderErrorFunc, arg: ?*anyopaque) void;
pub extern fn xmlTextReaderSetStructuredErrorHandler(reader: xmlTextReaderPtr, f: xmlStructuredErrorFunc, arg: ?*anyopaque) void;
pub extern fn xmlTextReaderGetErrorHandler(reader: xmlTextReaderPtr, f: [*c]xmlTextReaderErrorFunc, arg: [*c]?*anyopaque) void;
pub const __llvm__ = @as(c_int, 1);
pub const __clang__ = @as(c_int, 1);
pub const __clang_major__ = @as(c_int, 19);
pub const __clang_minor__ = @as(c_int, 1);
pub const __clang_patchlevel__ = @as(c_int, 7);
pub const __clang_version__ = "19.1.7 (https://github.com/ziglang/zig-bootstrap de1b01a8c1dddf75a560123ac1c2ab182b4830da)";
pub const __GNUC__ = @as(c_int, 4);
pub const __GNUC_MINOR__ = @as(c_int, 2);
pub const __GNUC_PATCHLEVEL__ = @as(c_int, 1);
pub const __GXX_ABI_VERSION = @as(c_int, 1002);
pub const __ATOMIC_RELAXED = @as(c_int, 0);
pub const __ATOMIC_CONSUME = @as(c_int, 1);
pub const __ATOMIC_ACQUIRE = @as(c_int, 2);
pub const __ATOMIC_RELEASE = @as(c_int, 3);
pub const __ATOMIC_ACQ_REL = @as(c_int, 4);
pub const __ATOMIC_SEQ_CST = @as(c_int, 5);
pub const __MEMORY_SCOPE_SYSTEM = @as(c_int, 0);
pub const __MEMORY_SCOPE_DEVICE = @as(c_int, 1);
pub const __MEMORY_SCOPE_WRKGRP = @as(c_int, 2);
pub const __MEMORY_SCOPE_WVFRNT = @as(c_int, 3);
pub const __MEMORY_SCOPE_SINGLE = @as(c_int, 4);
pub const __OPENCL_MEMORY_SCOPE_WORK_ITEM = @as(c_int, 0);
pub const __OPENCL_MEMORY_SCOPE_WORK_GROUP = @as(c_int, 1);
pub const __OPENCL_MEMORY_SCOPE_DEVICE = @as(c_int, 2);
pub const __OPENCL_MEMORY_SCOPE_ALL_SVM_DEVICES = @as(c_int, 3);
pub const __OPENCL_MEMORY_SCOPE_SUB_GROUP = @as(c_int, 4);
pub const __FPCLASS_SNAN = @as(c_int, 0x0001);
pub const __FPCLASS_QNAN = @as(c_int, 0x0002);
pub const __FPCLASS_NEGINF = @as(c_int, 0x0004);
pub const __FPCLASS_NEGNORMAL = @as(c_int, 0x0008);
pub const __FPCLASS_NEGSUBNORMAL = @as(c_int, 0x0010);
pub const __FPCLASS_NEGZERO = @as(c_int, 0x0020);
pub const __FPCLASS_POSZERO = @as(c_int, 0x0040);
pub const __FPCLASS_POSSUBNORMAL = @as(c_int, 0x0080);
pub const __FPCLASS_POSNORMAL = @as(c_int, 0x0100);
pub const __FPCLASS_POSINF = @as(c_int, 0x0200);
pub const __PRAGMA_REDEFINE_EXTNAME = @as(c_int, 1);
pub const __VERSION__ = "Clang 19.1.7 (https://github.com/ziglang/zig-bootstrap de1b01a8c1dddf75a560123ac1c2ab182b4830da)";
pub const __OBJC_BOOL_IS_BOOL = @as(c_int, 0);
pub const __CONSTANT_CFSTRINGS__ = @as(c_int, 1);
pub const __clang_literal_encoding__ = "UTF-8";
pub const __clang_wide_literal_encoding__ = "UTF-32";
pub const __OPTIMIZE__ = @as(c_int, 1);
pub const __ORDER_LITTLE_ENDIAN__ = @as(c_int, 1234);
pub const __ORDER_BIG_ENDIAN__ = @as(c_int, 4321);
pub const __ORDER_PDP_ENDIAN__ = @as(c_int, 3412);
pub const __BYTE_ORDER__ = __ORDER_LITTLE_ENDIAN__;
pub const __LITTLE_ENDIAN__ = @as(c_int, 1);
pub const _LP64 = @as(c_int, 1);
pub const __LP64__ = @as(c_int, 1);
pub const __CHAR_BIT__ = @as(c_int, 8);
pub const __BOOL_WIDTH__ = @as(c_int, 8);
pub const __SHRT_WIDTH__ = @as(c_int, 16);
pub const __INT_WIDTH__ = @as(c_int, 32);
pub const __LONG_WIDTH__ = @as(c_int, 64);
pub const __LLONG_WIDTH__ = @as(c_int, 64);
pub const __BITINT_MAXWIDTH__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 8388608, .decimal);
pub const __SCHAR_MAX__ = @as(c_int, 127);
pub const __SHRT_MAX__ = @as(c_int, 32767);
pub const __INT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __LONG_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __LONG_LONG_MAX__ = @as(c_longlong, 9223372036854775807);
pub const __WCHAR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __WCHAR_WIDTH__ = @as(c_int, 32);
pub const __WINT_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __WINT_WIDTH__ = @as(c_int, 32);
pub const __INTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTMAX_WIDTH__ = @as(c_int, 64);
pub const __SIZE_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __SIZE_WIDTH__ = @as(c_int, 64);
pub const __UINTMAX_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTMAX_WIDTH__ = @as(c_int, 64);
pub const __PTRDIFF_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __PTRDIFF_WIDTH__ = @as(c_int, 64);
pub const __INTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INTPTR_WIDTH__ = @as(c_int, 64);
pub const __UINTPTR_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINTPTR_WIDTH__ = @as(c_int, 64);
pub const __SIZEOF_DOUBLE__ = @as(c_int, 8);
pub const __SIZEOF_FLOAT__ = @as(c_int, 4);
pub const __SIZEOF_INT__ = @as(c_int, 4);
pub const __SIZEOF_LONG__ = @as(c_int, 8);
pub const __SIZEOF_LONG_DOUBLE__ = @as(c_int, 16);
pub const __SIZEOF_LONG_LONG__ = @as(c_int, 8);
pub const __SIZEOF_POINTER__ = @as(c_int, 8);
pub const __SIZEOF_SHORT__ = @as(c_int, 2);
pub const __SIZEOF_PTRDIFF_T__ = @as(c_int, 8);
pub const __SIZEOF_SIZE_T__ = @as(c_int, 8);
pub const __SIZEOF_WCHAR_T__ = @as(c_int, 4);
pub const __SIZEOF_WINT_T__ = @as(c_int, 4);
pub const __SIZEOF_INT128__ = @as(c_int, 16);
pub const __INTMAX_TYPE__ = c_long;
pub const __INTMAX_FMTd__ = "ld";
pub const __INTMAX_FMTi__ = "li";
pub const __INTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`");
// (no file):96:9
pub const __UINTMAX_TYPE__ = c_ulong;
pub const __UINTMAX_FMTo__ = "lo";
pub const __UINTMAX_FMTu__ = "lu";
pub const __UINTMAX_FMTx__ = "lx";
pub const __UINTMAX_FMTX__ = "lX";
pub const __UINTMAX_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`");
// (no file):102:9
pub const __PTRDIFF_TYPE__ = c_long;
pub const __PTRDIFF_FMTd__ = "ld";
pub const __PTRDIFF_FMTi__ = "li";
pub const __INTPTR_TYPE__ = c_long;
pub const __INTPTR_FMTd__ = "ld";
pub const __INTPTR_FMTi__ = "li";
pub const __SIZE_TYPE__ = c_ulong;
pub const __SIZE_FMTo__ = "lo";
pub const __SIZE_FMTu__ = "lu";
pub const __SIZE_FMTx__ = "lx";
pub const __SIZE_FMTX__ = "lX";
pub const __WCHAR_TYPE__ = c_int;
pub const __WINT_TYPE__ = c_uint;
pub const __SIG_ATOMIC_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __SIG_ATOMIC_WIDTH__ = @as(c_int, 32);
pub const __CHAR16_TYPE__ = c_ushort;
pub const __CHAR32_TYPE__ = c_uint;
pub const __UINTPTR_TYPE__ = c_ulong;
pub const __UINTPTR_FMTo__ = "lo";
pub const __UINTPTR_FMTu__ = "lu";
pub const __UINTPTR_FMTx__ = "lx";
pub const __UINTPTR_FMTX__ = "lX";
pub const __FLT16_DENORM_MIN__ = @as(f16, 5.9604644775390625e-8);
pub const __FLT16_NORM_MAX__ = @as(f16, 6.5504e+4);
pub const __FLT16_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT16_DIG__ = @as(c_int, 3);
pub const __FLT16_DECIMAL_DIG__ = @as(c_int, 5);
pub const __FLT16_EPSILON__ = @as(f16, 9.765625e-4);
pub const __FLT16_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT16_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT16_MANT_DIG__ = @as(c_int, 11);
pub const __FLT16_MAX_10_EXP__ = @as(c_int, 4);
pub const __FLT16_MAX_EXP__ = @as(c_int, 16);
pub const __FLT16_MAX__ = @as(f16, 6.5504e+4);
pub const __FLT16_MIN_10_EXP__ = -@as(c_int, 4);
pub const __FLT16_MIN_EXP__ = -@as(c_int, 13);
pub const __FLT16_MIN__ = @as(f16, 6.103515625e-5);
pub const __FLT_DENORM_MIN__ = @as(f32, 1.40129846e-45);
pub const __FLT_NORM_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_HAS_DENORM__ = @as(c_int, 1);
pub const __FLT_DIG__ = @as(c_int, 6);
pub const __FLT_DECIMAL_DIG__ = @as(c_int, 9);
pub const __FLT_EPSILON__ = @as(f32, 1.19209290e-7);
pub const __FLT_HAS_INFINITY__ = @as(c_int, 1);
pub const __FLT_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __FLT_MANT_DIG__ = @as(c_int, 24);
pub const __FLT_MAX_10_EXP__ = @as(c_int, 38);
pub const __FLT_MAX_EXP__ = @as(c_int, 128);
pub const __FLT_MAX__ = @as(f32, 3.40282347e+38);
pub const __FLT_MIN_10_EXP__ = -@as(c_int, 37);
pub const __FLT_MIN_EXP__ = -@as(c_int, 125);
pub const __FLT_MIN__ = @as(f32, 1.17549435e-38);
pub const __DBL_DENORM_MIN__ = @as(f64, 4.9406564584124654e-324);
pub const __DBL_NORM_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_HAS_DENORM__ = @as(c_int, 1);
pub const __DBL_DIG__ = @as(c_int, 15);
pub const __DBL_DECIMAL_DIG__ = @as(c_int, 17);
pub const __DBL_EPSILON__ = @as(f64, 2.2204460492503131e-16);
pub const __DBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __DBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __DBL_MANT_DIG__ = @as(c_int, 53);
pub const __DBL_MAX_10_EXP__ = @as(c_int, 308);
pub const __DBL_MAX_EXP__ = @as(c_int, 1024);
pub const __DBL_MAX__ = @as(f64, 1.7976931348623157e+308);
pub const __DBL_MIN_10_EXP__ = -@as(c_int, 307);
pub const __DBL_MIN_EXP__ = -@as(c_int, 1021);
pub const __DBL_MIN__ = @as(f64, 2.2250738585072014e-308);
pub const __LDBL_DENORM_MIN__ = @as(c_longdouble, 3.64519953188247460253e-4951);
pub const __LDBL_NORM_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_HAS_DENORM__ = @as(c_int, 1);
pub const __LDBL_DIG__ = @as(c_int, 18);
pub const __LDBL_DECIMAL_DIG__ = @as(c_int, 21);
pub const __LDBL_EPSILON__ = @as(c_longdouble, 1.08420217248550443401e-19);
pub const __LDBL_HAS_INFINITY__ = @as(c_int, 1);
pub const __LDBL_HAS_QUIET_NAN__ = @as(c_int, 1);
pub const __LDBL_MANT_DIG__ = @as(c_int, 64);
pub const __LDBL_MAX_10_EXP__ = @as(c_int, 4932);
pub const __LDBL_MAX_EXP__ = @as(c_int, 16384);
pub const __LDBL_MAX__ = @as(c_longdouble, 1.18973149535723176502e+4932);
pub const __LDBL_MIN_10_EXP__ = -@as(c_int, 4931);
pub const __LDBL_MIN_EXP__ = -@as(c_int, 16381);
pub const __LDBL_MIN__ = @as(c_longdouble, 3.36210314311209350626e-4932);
pub const __POINTER_WIDTH__ = @as(c_int, 64);
pub const __BIGGEST_ALIGNMENT__ = @as(c_int, 16);
pub const __WINT_UNSIGNED__ = @as(c_int, 1);
pub const __INT8_TYPE__ = i8;
pub const __INT8_FMTd__ = "hhd";
pub const __INT8_FMTi__ = "hhi";
pub const __INT8_C_SUFFIX__ = "";
pub const __INT16_TYPE__ = c_short;
pub const __INT16_FMTd__ = "hd";
pub const __INT16_FMTi__ = "hi";
pub const __INT16_C_SUFFIX__ = "";
pub const __INT32_TYPE__ = c_int;
pub const __INT32_FMTd__ = "d";
pub const __INT32_FMTi__ = "i";
pub const __INT32_C_SUFFIX__ = "";
pub const __INT64_TYPE__ = c_long;
pub const __INT64_FMTd__ = "ld";
pub const __INT64_FMTi__ = "li";
pub const __INT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `L`");
// (no file):203:9
pub const __UINT8_TYPE__ = u8;
pub const __UINT8_FMTo__ = "hho";
pub const __UINT8_FMTu__ = "hhu";
pub const __UINT8_FMTx__ = "hhx";
pub const __UINT8_FMTX__ = "hhX";
pub const __UINT8_C_SUFFIX__ = "";
pub const __UINT8_MAX__ = @as(c_int, 255);
pub const __INT8_MAX__ = @as(c_int, 127);
pub const __UINT16_TYPE__ = c_ushort;
pub const __UINT16_FMTo__ = "ho";
pub const __UINT16_FMTu__ = "hu";
pub const __UINT16_FMTx__ = "hx";
pub const __UINT16_FMTX__ = "hX";
pub const __UINT16_C_SUFFIX__ = "";
pub const __UINT16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __INT16_MAX__ = @as(c_int, 32767);
pub const __UINT32_TYPE__ = c_uint;
pub const __UINT32_FMTo__ = "o";
pub const __UINT32_FMTu__ = "u";
pub const __UINT32_FMTx__ = "x";
pub const __UINT32_FMTX__ = "X";
pub const __UINT32_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `U`");
// (no file):225:9
pub const __UINT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __INT32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __UINT64_TYPE__ = c_ulong;
pub const __UINT64_FMTo__ = "lo";
pub const __UINT64_FMTu__ = "lu";
pub const __UINT64_FMTx__ = "lx";
pub const __UINT64_FMTX__ = "lX";
pub const __UINT64_C_SUFFIX__ = @compileError("unable to translate macro: undefined identifier `UL`");
// (no file):233:9
pub const __UINT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __INT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST8_TYPE__ = i8;
pub const __INT_LEAST8_MAX__ = @as(c_int, 127);
pub const __INT_LEAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_LEAST8_FMTd__ = "hhd";
pub const __INT_LEAST8_FMTi__ = "hhi";
pub const __UINT_LEAST8_TYPE__ = u8;
pub const __UINT_LEAST8_MAX__ = @as(c_int, 255);
pub const __UINT_LEAST8_FMTo__ = "hho";
pub const __UINT_LEAST8_FMTu__ = "hhu";
pub const __UINT_LEAST8_FMTx__ = "hhx";
pub const __UINT_LEAST8_FMTX__ = "hhX";
pub const __INT_LEAST16_TYPE__ = c_short;
pub const __INT_LEAST16_MAX__ = @as(c_int, 32767);
pub const __INT_LEAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_LEAST16_FMTd__ = "hd";
pub const __INT_LEAST16_FMTi__ = "hi";
pub const __UINT_LEAST16_TYPE__ = c_ushort;
pub const __UINT_LEAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_LEAST16_FMTo__ = "ho";
pub const __UINT_LEAST16_FMTu__ = "hu";
pub const __UINT_LEAST16_FMTx__ = "hx";
pub const __UINT_LEAST16_FMTX__ = "hX";
pub const __INT_LEAST32_TYPE__ = c_int;
pub const __INT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_LEAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_LEAST32_FMTd__ = "d";
pub const __INT_LEAST32_FMTi__ = "i";
pub const __UINT_LEAST32_TYPE__ = c_uint;
pub const __UINT_LEAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_LEAST32_FMTo__ = "o";
pub const __UINT_LEAST32_FMTu__ = "u";
pub const __UINT_LEAST32_FMTx__ = "x";
pub const __UINT_LEAST32_FMTX__ = "X";
pub const __INT_LEAST64_TYPE__ = c_long;
pub const __INT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_LEAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_LEAST64_FMTd__ = "ld";
pub const __INT_LEAST64_FMTi__ = "li";
pub const __UINT_LEAST64_TYPE__ = c_ulong;
pub const __UINT_LEAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINT_LEAST64_FMTo__ = "lo";
pub const __UINT_LEAST64_FMTu__ = "lu";
pub const __UINT_LEAST64_FMTx__ = "lx";
pub const __UINT_LEAST64_FMTX__ = "lX";
pub const __INT_FAST8_TYPE__ = i8;
pub const __INT_FAST8_MAX__ = @as(c_int, 127);
pub const __INT_FAST8_WIDTH__ = @as(c_int, 8);
pub const __INT_FAST8_FMTd__ = "hhd";
pub const __INT_FAST8_FMTi__ = "hhi";
pub const __UINT_FAST8_TYPE__ = u8;
pub const __UINT_FAST8_MAX__ = @as(c_int, 255);
pub const __UINT_FAST8_FMTo__ = "hho";
pub const __UINT_FAST8_FMTu__ = "hhu";
pub const __UINT_FAST8_FMTx__ = "hhx";
pub const __UINT_FAST8_FMTX__ = "hhX";
pub const __INT_FAST16_TYPE__ = c_short;
pub const __INT_FAST16_MAX__ = @as(c_int, 32767);
pub const __INT_FAST16_WIDTH__ = @as(c_int, 16);
pub const __INT_FAST16_FMTd__ = "hd";
pub const __INT_FAST16_FMTi__ = "hi";
pub const __UINT_FAST16_TYPE__ = c_ushort;
pub const __UINT_FAST16_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65535, .decimal);
pub const __UINT_FAST16_FMTo__ = "ho";
pub const __UINT_FAST16_FMTu__ = "hu";
pub const __UINT_FAST16_FMTx__ = "hx";
pub const __UINT_FAST16_FMTX__ = "hX";
pub const __INT_FAST32_TYPE__ = c_int;
pub const __INT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const __INT_FAST32_WIDTH__ = @as(c_int, 32);
pub const __INT_FAST32_FMTd__ = "d";
pub const __INT_FAST32_FMTi__ = "i";
pub const __UINT_FAST32_TYPE__ = c_uint;
pub const __UINT_FAST32_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_uint, 4294967295, .decimal);
pub const __UINT_FAST32_FMTo__ = "o";
pub const __UINT_FAST32_FMTu__ = "u";
pub const __UINT_FAST32_FMTx__ = "x";
pub const __UINT_FAST32_FMTX__ = "X";
pub const __INT_FAST64_TYPE__ = c_long;
pub const __INT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const __INT_FAST64_WIDTH__ = @as(c_int, 64);
pub const __INT_FAST64_FMTd__ = "ld";
pub const __INT_FAST64_FMTi__ = "li";
pub const __UINT_FAST64_TYPE__ = c_ulong;
pub const __UINT_FAST64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_ulong, 18446744073709551615, .decimal);
pub const __UINT_FAST64_FMTo__ = "lo";
pub const __UINT_FAST64_FMTu__ = "lu";
pub const __UINT_FAST64_FMTx__ = "lx";
pub const __UINT_FAST64_FMTX__ = "lX";
pub const __USER_LABEL_PREFIX__ = "";
pub const __FINITE_MATH_ONLY__ = @as(c_int, 0);
pub const __GNUC_STDC_INLINE__ = @as(c_int, 1);
pub const __GCC_ATOMIC_TEST_AND_SET_TRUEVAL = @as(c_int, 1);
pub const __GCC_DESTRUCTIVE_SIZE = @as(c_int, 64);
pub const __GCC_CONSTRUCTIVE_SIZE = @as(c_int, 64);
pub const __CLANG_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __CLANG_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_BOOL_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR16_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_CHAR32_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_WCHAR_T_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_SHORT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_INT_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_LLONG_LOCK_FREE = @as(c_int, 2);
pub const __GCC_ATOMIC_POINTER_LOCK_FREE = @as(c_int, 2);
pub const __PIC__ = @as(c_int, 2);
pub const __pic__ = @as(c_int, 2);
pub const __FLT_RADIX__ = @as(c_int, 2);
pub const __DECIMAL_DIG__ = __LDBL_DECIMAL_DIG__;
pub const __SSP_STRONG__ = @as(c_int, 2);
pub const __ELF__ = @as(c_int, 1);
pub const __GCC_ASM_FLAG_OUTPUTS__ = @as(c_int, 1);
pub const __code_model_small__ = @as(c_int, 1);
pub const __amd64__ = @as(c_int, 1);
pub const __amd64 = @as(c_int, 1);
pub const __x86_64 = @as(c_int, 1);
pub const __x86_64__ = @as(c_int, 1);
pub const __SEG_GS = @as(c_int, 1);
pub const __SEG_FS = @as(c_int, 1);
pub const __seg_gs = @compileError("unable to translate macro: undefined identifier `address_space`");
// (no file):366:9
pub const __seg_fs = @compileError("unable to translate macro: undefined identifier `address_space`");
// (no file):367:9
pub const __znver3 = @as(c_int, 1);
pub const __znver3__ = @as(c_int, 1);
pub const __tune_znver3__ = @as(c_int, 1);
pub const __REGISTER_PREFIX__ = "";
pub const __NO_MATH_INLINES = @as(c_int, 1);
pub const __AES__ = @as(c_int, 1);
pub const __VAES__ = @as(c_int, 1);
pub const __PCLMUL__ = @as(c_int, 1);
pub const __VPCLMULQDQ__ = @as(c_int, 1);
pub const __LAHF_SAHF__ = @as(c_int, 1);
pub const __LZCNT__ = @as(c_int, 1);
pub const __RDRND__ = @as(c_int, 1);
pub const __FSGSBASE__ = @as(c_int, 1);
pub const __BMI__ = @as(c_int, 1);
pub const __BMI2__ = @as(c_int, 1);
pub const __POPCNT__ = @as(c_int, 1);
pub const __PRFCHW__ = @as(c_int, 1);
pub const __RDSEED__ = @as(c_int, 1);
pub const __ADX__ = @as(c_int, 1);
pub const __MWAITX__ = @as(c_int, 1);
pub const __MOVBE__ = @as(c_int, 1);
pub const __SSE4A__ = @as(c_int, 1);
pub const __FMA__ = @as(c_int, 1);
pub const __F16C__ = @as(c_int, 1);
pub const __SHA__ = @as(c_int, 1);
pub const __FXSR__ = @as(c_int, 1);
pub const __XSAVE__ = @as(c_int, 1);
pub const __XSAVEOPT__ = @as(c_int, 1);
pub const __XSAVEC__ = @as(c_int, 1);
pub const __XSAVES__ = @as(c_int, 1);
pub const __PKU__ = @as(c_int, 1);
pub const __CLFLUSHOPT__ = @as(c_int, 1);
pub const __CLWB__ = @as(c_int, 1);
pub const __WBNOINVD__ = @as(c_int, 1);
pub const __SHSTK__ = @as(c_int, 1);
pub const __CLZERO__ = @as(c_int, 1);
pub const __RDPID__ = @as(c_int, 1);
pub const __RDPRU__ = @as(c_int, 1);
pub const __INVPCID__ = @as(c_int, 1);
pub const __CRC32__ = @as(c_int, 1);
pub const __AVX2__ = @as(c_int, 1);
pub const __AVX__ = @as(c_int, 1);
pub const __SSE4_2__ = @as(c_int, 1);
pub const __SSE4_1__ = @as(c_int, 1);
pub const __SSSE3__ = @as(c_int, 1);
pub const __SSE3__ = @as(c_int, 1);
pub const __SSE2__ = @as(c_int, 1);
pub const __SSE2_MATH__ = @as(c_int, 1);
pub const __SSE__ = @as(c_int, 1);
pub const __SSE_MATH__ = @as(c_int, 1);
pub const __MMX__ = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 = @as(c_int, 1);
pub const __GCC_HAVE_SYNC_COMPARE_AND_SWAP_16 = @as(c_int, 1);
pub const __SIZEOF_FLOAT128__ = @as(c_int, 16);
pub const unix = @as(c_int, 1);
pub const __unix = @as(c_int, 1);
pub const __unix__ = @as(c_int, 1);
pub const linux = @as(c_int, 1);
pub const __linux = @as(c_int, 1);
pub const __linux__ = @as(c_int, 1);
pub const __gnu_linux__ = @as(c_int, 1);
pub const __FLOAT128__ = @as(c_int, 1);
pub const __STDC__ = @as(c_int, 1);
pub const __STDC_HOSTED__ = @as(c_int, 1);
pub const __STDC_VERSION__ = @as(c_long, 201710);
pub const __STDC_UTF_16__ = @as(c_int, 1);
pub const __STDC_UTF_32__ = @as(c_int, 1);
pub const __STDC_EMBED_NOT_FOUND__ = @as(c_int, 0);
pub const __STDC_EMBED_FOUND__ = @as(c_int, 1);
pub const __STDC_EMBED_EMPTY__ = @as(c_int, 2);
pub const _FORTIFY_SOURCE = @as(c_int, 2);
pub const __GLIBC_MINOR__ = @as(c_int, 39);
pub const __GCC_HAVE_DWARF2_CFI_ASM = @as(c_int, 1);
pub const LIBXML_TREE_ENABLED = "";
pub const LIBXML_SCHEMAS_ENABLED = "";
pub const LIBXML_READER_ENABLED = "";
pub const __XML_XMLREADER_H__ = "";
pub const __XML_VERSION_H__ = "";
pub const __XML_EXPORTS_H__ = "";
pub const XMLPUBLIC = "";
pub const XMLPUBFUN = "";
pub const XMLPUBVAR = @compileError("unable to translate C expr: unexpected token 'extern'");
// /home/stephan/projects/zig-firmware-brainstorming/.zig-cache/o/8c9d593234a90e9a59baab1030274e89/libxml/xmlexports.h:37:9
pub const XMLCALL = "";
pub const XMLCDECL = "";
pub const LIBXML_DLL_IMPORT = XMLPUBVAR;
pub const XML_IGNORE_FPTR_CAST_WARNINGS = "";
pub const XML_POP_WARNINGS = "";
pub const LIBXML_ATTR_FORMAT = @compileError("unable to translate C expr: unexpected token ''");
// /home/stephan/projects/zig-firmware-brainstorming/.zig-cache/o/8c9d593234a90e9a59baab1030274e89/libxml/xmlversion.h:13:9
pub const LIBXML_ATTR_ALLOC_SIZE = @compileError("unable to translate C expr: unexpected token ''");
// /home/stephan/projects/zig-firmware-brainstorming/.zig-cache/o/8c9d593234a90e9a59baab1030274e89/libxml/xmlversion.h:14:9
pub const ATTRIBUTE_UNUSED = "";
pub const XML_DEPRECATED = "";
pub const __XML_TREE_H__ = "";
pub const _STDIO_H = @as(c_int, 1);
pub const __GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION = "";
pub const _FEATURES_H = @as(c_int, 1);
pub const __KERNEL_STRICT_NAMES = "";
pub inline fn __GNUC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GNUC__ << @as(c_int, 16)) + __GNUC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub inline fn __glibc_clang_prereq(maj: anytype, min: anytype) @TypeOf(((__clang_major__ << @as(c_int, 16)) + __clang_minor__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__clang_major__ << @as(c_int, 16)) + __clang_minor__) >= ((maj << @as(c_int, 16)) + min);
}
pub const __GLIBC_USE = @compileError("unable to translate macro: undefined identifier `__GLIBC_USE_`");
// /usr/include/features.h:188:9
pub const _DEFAULT_SOURCE = @as(c_int, 1);
pub const __GLIBC_USE_ISOC2X = @as(c_int, 0);
pub const __USE_ISOC11 = @as(c_int, 1);
pub const __USE_ISOC99 = @as(c_int, 1);
pub const __USE_ISOC95 = @as(c_int, 1);
pub const __USE_POSIX_IMPLICITLY = @as(c_int, 1);
pub const _POSIX_SOURCE = @as(c_int, 1);
pub const _POSIX_C_SOURCE = @as(c_long, 200809);
pub const __USE_POSIX = @as(c_int, 1);
pub const __USE_POSIX2 = @as(c_int, 1);
pub const __USE_POSIX199309 = @as(c_int, 1);
pub const __USE_POSIX199506 = @as(c_int, 1);
pub const __USE_XOPEN2K = @as(c_int, 1);
pub const __USE_XOPEN2K8 = @as(c_int, 1);
pub const _ATFILE_SOURCE = @as(c_int, 1);
pub const __WORDSIZE = @as(c_int, 64);
pub const __WORDSIZE_TIME64_COMPAT32 = @as(c_int, 1);
pub const __SYSCALL_WORDSIZE = @as(c_int, 64);
pub const __TIMESIZE = __WORDSIZE;
pub const __USE_MISC = @as(c_int, 1);
pub const __USE_ATFILE = @as(c_int, 1);
pub const __USE_FORTIFY_LEVEL = @as(c_int, 2);
pub const __GLIBC_USE_DEPRECATED_GETS = @as(c_int, 0);
pub const __GLIBC_USE_DEPRECATED_SCANF = @as(c_int, 0);
pub const __GLIBC_USE_C2X_STRTOL = @as(c_int, 0);
pub const _STDC_PREDEF_H = @as(c_int, 1);
pub const __STDC_IEC_559__ = @as(c_int, 1);
pub const __STDC_IEC_60559_BFP__ = @as(c_long, 201404);
pub const __STDC_IEC_559_COMPLEX__ = @as(c_int, 1);
pub const __STDC_IEC_60559_COMPLEX__ = @as(c_long, 201404);
pub const __STDC_ISO_10646__ = @as(c_long, 201706);
pub const __GNU_LIBRARY__ = @as(c_int, 6);
pub const __GLIBC__ = @as(c_int, 2);
pub inline fn __GLIBC_PREREQ(maj: anytype, min: anytype) @TypeOf(((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min)) {
    _ = &maj;
    _ = &min;
    return ((__GLIBC__ << @as(c_int, 16)) + __GLIBC_MINOR__) >= ((maj << @as(c_int, 16)) + min);
}
pub const _SYS_CDEFS_H = @as(c_int, 1);
pub const __glibc_has_attribute = @compileError("unable to translate macro: undefined identifier `__has_attribute`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:45:10
pub inline fn __glibc_has_builtin(name: anytype) @TypeOf(__has_builtin(name)) {
    _ = &name;
    return __has_builtin(name);
}
pub const __glibc_has_extension = @compileError("unable to translate macro: undefined identifier `__has_extension`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:55:10
pub const __LEAF = "";
pub const __LEAF_ATTR = "";
pub const __THROW = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:79:11
pub const __THROWNL = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:80:11
pub const __NTH = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:81:11
pub const __NTHNL = @compileError("unable to translate macro: undefined identifier `__nothrow__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:82:11
pub const __COLD = @compileError("unable to translate macro: undefined identifier `__cold__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:102:11
pub inline fn __P(args: anytype) @TypeOf(args) {
    _ = &args;
    return args;
}
pub inline fn __PMT(args: anytype) @TypeOf(args) {
    _ = &args;
    return args;
}
pub const __CONCAT = @compileError("unable to translate C expr: unexpected token '##'");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:131:9
pub const __STRING = @compileError("unable to translate C expr: unexpected token '#'");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:132:9
pub const __ptr_t = ?*anyopaque;
pub const __BEGIN_DECLS = "";
pub const __END_DECLS = "";
pub inline fn __bos(ptr: anytype) @TypeOf(__builtin_object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1))) {
    _ = &ptr;
    return __builtin_object_size(ptr, __USE_FORTIFY_LEVEL > @as(c_int, 1));
}
pub inline fn __bos0(ptr: anytype) @TypeOf(__builtin_object_size(ptr, @as(c_int, 0))) {
    _ = &ptr;
    return __builtin_object_size(ptr, @as(c_int, 0));
}
pub inline fn __glibc_objsize0(__o: anytype) @TypeOf(__bos0(__o)) {
    _ = &__o;
    return __bos0(__o);
}
pub inline fn __glibc_objsize(__o: anytype) @TypeOf(__bos(__o)) {
    _ = &__o;
    return __bos(__o);
}
pub inline fn __glibc_safe_len_cond(__l: anytype, __s: anytype, __osz: anytype) @TypeOf(__l <= @import("std").zig.c_translation.MacroArithmetic.div(__osz, __s)) {
    _ = &__l;
    _ = &__s;
    _ = &__osz;
    return __l <= @import("std").zig.c_translation.MacroArithmetic.div(__osz, __s);
}
pub const __glibc_unsigned_or_positive = @compileError("unable to translate C expr: unexpected token '__typeof'");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:168:9
pub inline fn __glibc_safe_or_unknown_len(__l: anytype, __s: anytype, __osz: anytype) @TypeOf(((__builtin_constant_p(__osz) != 0) and (__osz == (__SIZE_TYPE__ - @as(c_int, 1)))) or (((__glibc_unsigned_or_positive(__l) != 0) and (__builtin_constant_p(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz)) != 0)) and (__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz) != 0))) {
    _ = &__l;
    _ = &__s;
    _ = &__osz;
    return ((__builtin_constant_p(__osz) != 0) and (__osz == (__SIZE_TYPE__ - @as(c_int, 1)))) or (((__glibc_unsigned_or_positive(__l) != 0) and (__builtin_constant_p(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz)) != 0)) and (__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz) != 0));
}
pub inline fn __glibc_unsafe_len(__l: anytype, __s: anytype, __osz: anytype) @TypeOf(((__glibc_unsigned_or_positive(__l) != 0) and (__builtin_constant_p(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz)) != 0)) and !(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz) != 0)) {
    _ = &__l;
    _ = &__s;
    _ = &__osz;
    return ((__glibc_unsigned_or_positive(__l) != 0) and (__builtin_constant_p(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz)) != 0)) and !(__glibc_safe_len_cond(__SIZE_TYPE__(__l), __s, __osz) != 0);
}
pub const __glibc_fortify = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:193:9
pub const __glibc_fortify_n = @compileError("unable to translate C expr: expected ')' instead got '...'");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:203:9
pub const __warnattr = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:216:10
pub const __errordecl = @compileError("unable to translate C expr: unexpected token 'extern'");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:217:10
pub const __flexarr = @compileError("unable to translate C expr: unexpected token '['");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:225:10
pub const __glibc_c99_flexarr_available = @as(c_int, 1);
pub const __REDIRECT = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:256:10
pub const __REDIRECT_NTH = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:263:11
pub const __REDIRECT_NTHNL = @compileError("unable to translate C expr: unexpected token '__asm__'");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:265:11
pub const __ASMNAME = @compileError("unable to translate C expr: unexpected token ','");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:268:10
pub inline fn __ASMNAME2(prefix: anytype, cname: anytype) @TypeOf(__STRING(prefix) ++ cname) {
    _ = &prefix;
    _ = &cname;
    return __STRING(prefix) ++ cname;
}
pub const __REDIRECT_FORTIFY = __REDIRECT;
pub const __REDIRECT_FORTIFY_NTH = __REDIRECT_NTH;
pub const __attribute_malloc__ = @compileError("unable to translate macro: undefined identifier `__malloc__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:298:10
pub const __attribute_alloc_size__ = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:309:10
pub const __attribute_alloc_align__ = @compileError("unable to translate macro: undefined identifier `__alloc_align__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:315:10
pub const __attribute_pure__ = @compileError("unable to translate macro: undefined identifier `__pure__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:325:10
pub const __attribute_const__ = @compileError("unable to translate C expr: unexpected token '__attribute__'");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:332:10
pub const __attribute_maybe_unused__ = @compileError("unable to translate macro: undefined identifier `__unused__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:338:10
pub const __attribute_used__ = @compileError("unable to translate macro: undefined identifier `__used__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:347:10
pub const __attribute_noinline__ = @compileError("unable to translate macro: undefined identifier `__noinline__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:348:10
pub const __attribute_deprecated__ = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:356:10
pub const __attribute_deprecated_msg__ = @compileError("unable to translate macro: undefined identifier `__deprecated__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:366:10
pub const __attribute_format_arg__ = @compileError("unable to translate macro: undefined identifier `__format_arg__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:379:10
pub const __attribute_format_strfmon__ = @compileError("unable to translate macro: undefined identifier `__format__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:389:10
pub const __attribute_nonnull__ = @compileError("unable to translate macro: undefined identifier `__nonnull__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:401:11
pub inline fn __nonnull(params: anytype) @TypeOf(__attribute_nonnull__(params)) {
    _ = &params;
    return __attribute_nonnull__(params);
}
pub const __returns_nonnull = @compileError("unable to translate macro: undefined identifier `__returns_nonnull__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:414:10
pub const __attribute_warn_unused_result__ = @compileError("unable to translate macro: undefined identifier `__warn_unused_result__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:423:10
pub const __wur = __attribute_warn_unused_result__;
pub const __always_inline = @compileError("unable to translate macro: undefined identifier `__always_inline__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:441:10
pub const __attribute_artificial__ = @compileError("unable to translate macro: undefined identifier `__artificial__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:450:10
pub const __extern_inline = @compileError("unable to translate macro: undefined identifier `__gnu_inline__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:468:11
pub const __extern_always_inline = @compileError("unable to translate macro: undefined identifier `__gnu_inline__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:469:11
pub const __fortify_function = __extern_always_inline ++ __attribute_artificial__;
pub const __restrict_arr = @compileError("unable to translate C expr: unexpected token '__restrict'");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:512:10
pub inline fn __glibc_unlikely(cond: anytype) @TypeOf(__builtin_expect(cond, @as(c_int, 0))) {
    _ = &cond;
    return __builtin_expect(cond, @as(c_int, 0));
}
pub inline fn __glibc_likely(cond: anytype) @TypeOf(__builtin_expect(cond, @as(c_int, 1))) {
    _ = &cond;
    return __builtin_expect(cond, @as(c_int, 1));
}
pub const __attribute_nonstring__ = "";
pub const __attribute_copy__ = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:561:10
pub const __LDOUBLE_REDIRECTS_TO_FLOAT128_ABI = @as(c_int, 0);
pub inline fn __LDBL_REDIR1(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return name ++ proto;
}
pub inline fn __LDBL_REDIR(name: anytype, proto: anytype) @TypeOf(name ++ proto) {
    _ = &name;
    _ = &proto;
    return name ++ proto;
}
pub inline fn __LDBL_REDIR1_NTH(name: anytype, proto: anytype, alias: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return name ++ proto ++ __THROW;
}
pub inline fn __LDBL_REDIR_NTH(name: anytype, proto: anytype) @TypeOf(name ++ proto ++ __THROW) {
    _ = &name;
    _ = &proto;
    return name ++ proto ++ __THROW;
}
pub const __LDBL_REDIR2_DECL = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:638:10
pub const __LDBL_REDIR_DECL = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:639:10
pub inline fn __REDIRECT_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT(name, proto, alias)) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return __REDIRECT(name, proto, alias);
}
pub inline fn __REDIRECT_NTH_LDBL(name: anytype, proto: anytype, alias: anytype) @TypeOf(__REDIRECT_NTH(name, proto, alias)) {
    _ = &name;
    _ = &proto;
    _ = &alias;
    return __REDIRECT_NTH(name, proto, alias);
}
pub const __glibc_macro_warning1 = @compileError("unable to translate macro: undefined identifier `_Pragma`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:653:10
pub const __glibc_macro_warning = @compileError("unable to translate macro: undefined identifier `GCC`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:654:10
pub const __HAVE_GENERIC_SELECTION = @as(c_int, 1);
pub const __fortified_attr_access = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:699:11
pub const __attr_access = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:700:11
pub const __attr_access_none = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:701:11
pub const __attr_dealloc = @compileError("unable to translate C expr: unexpected token ''");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:711:10
pub const __attr_dealloc_free = "";
pub const __attribute_returns_twice__ = @compileError("unable to translate macro: undefined identifier `__returns_twice__`");
// /usr/include/x86_64-linux-gnu/sys/cdefs.h:718:10
pub const __USE_EXTERN_INLINES = @as(c_int, 1);
pub const __stub___compat_bdflush = "";
pub const __stub_chflags = "";
pub const __stub_fchflags = "";
pub const __stub_gtty = "";
pub const __stub_revoke = "";
pub const __stub_setlogin = "";
pub const __stub_sigreturn = "";
pub const __stub_stty = "";
pub const __GLIBC_USE_LIB_EXT2 = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_BFP_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_BFP_EXT_C2X = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_FUNCS_EXT_C2X = @as(c_int, 0);
pub const __GLIBC_USE_IEC_60559_TYPES_EXT = @as(c_int, 0);
pub const __need_size_t = "";
pub const __need_NULL = "";
pub const _SIZE_T = "";
pub const NULL = @import("std").zig.c_translation.cast(?*anyopaque, @as(c_int, 0));
pub const __need___va_list = "";
pub const __GNUC_VA_LIST = "";
pub const _BITS_TYPES_H = @as(c_int, 1);
pub const __S16_TYPE = c_short;
pub const __U16_TYPE = c_ushort;
pub const __S32_TYPE = c_int;
pub const __U32_TYPE = c_uint;
pub const __SLONGWORD_TYPE = c_long;
pub const __ULONGWORD_TYPE = c_ulong;
pub const __SQUAD_TYPE = c_long;
pub const __UQUAD_TYPE = c_ulong;
pub const __SWORD_TYPE = c_long;
pub const __UWORD_TYPE = c_ulong;
pub const __SLONG32_TYPE = c_int;
pub const __ULONG32_TYPE = c_uint;
pub const __S64_TYPE = c_long;
pub const __U64_TYPE = c_ulong;
pub const __STD_TYPE = @compileError("unable to translate C expr: unexpected token 'typedef'");
// /usr/include/x86_64-linux-gnu/bits/types.h:137:10
pub const _BITS_TYPESIZES_H = @as(c_int, 1);
pub const __SYSCALL_SLONG_TYPE = __SLONGWORD_TYPE;
pub const __SYSCALL_ULONG_TYPE = __ULONGWORD_TYPE;
pub const __DEV_T_TYPE = __UQUAD_TYPE;
pub const __UID_T_TYPE = __U32_TYPE;
pub const __GID_T_TYPE = __U32_TYPE;
pub const __INO_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __INO64_T_TYPE = __UQUAD_TYPE;
pub const __MODE_T_TYPE = __U32_TYPE;
pub const __NLINK_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSWORD_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __OFF64_T_TYPE = __SQUAD_TYPE;
pub const __PID_T_TYPE = __S32_TYPE;
pub const __RLIM_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __RLIM64_T_TYPE = __UQUAD_TYPE;
pub const __BLKCNT_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __BLKCNT64_T_TYPE = __SQUAD_TYPE;
pub const __FSBLKCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSBLKCNT64_T_TYPE = __UQUAD_TYPE;
pub const __FSFILCNT_T_TYPE = __SYSCALL_ULONG_TYPE;
pub const __FSFILCNT64_T_TYPE = __UQUAD_TYPE;
pub const __ID_T_TYPE = __U32_TYPE;
pub const __CLOCK_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __TIME_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __USECONDS_T_TYPE = __U32_TYPE;
pub const __SUSECONDS_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __SUSECONDS64_T_TYPE = __SQUAD_TYPE;
pub const __DADDR_T_TYPE = __S32_TYPE;
pub const __KEY_T_TYPE = __S32_TYPE;
pub const __CLOCKID_T_TYPE = __S32_TYPE;
pub const __TIMER_T_TYPE = ?*anyopaque;
pub const __BLKSIZE_T_TYPE = __SYSCALL_SLONG_TYPE;
pub const __FSID_T_TYPE = @compileError("unable to translate macro: undefined identifier `__val`");
// /usr/include/x86_64-linux-gnu/bits/typesizes.h:73:9
pub const __SSIZE_T_TYPE = __SWORD_TYPE;
pub const __CPU_MASK_TYPE = __SYSCALL_ULONG_TYPE;
pub const __OFF_T_MATCHES_OFF64_T = @as(c_int, 1);
pub const __INO_T_MATCHES_INO64_T = @as(c_int, 1);
pub const __RLIM_T_MATCHES_RLIM64_T = @as(c_int, 1);
pub const __STATFS_MATCHES_STATFS64 = @as(c_int, 1);
pub const __KERNEL_OLD_TIMEVAL_MATCHES_TIMEVAL64 = @as(c_int, 1);
pub const __FD_SETSIZE = @as(c_int, 1024);
pub const _BITS_TIME64_H = @as(c_int, 1);
pub const __TIME64_T_TYPE = __TIME_T_TYPE;
pub const _____fpos_t_defined = @as(c_int, 1);
pub const ____mbstate_t_defined = @as(c_int, 1);
pub const _____fpos64_t_defined = @as(c_int, 1);
pub const ____FILE_defined = @as(c_int, 1);
pub const __FILE_defined = @as(c_int, 1);
pub const __struct_FILE_defined = @as(c_int, 1);
pub const __getc_unlocked_body = @compileError("TODO postfix inc/dec expr");
// /usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h:102:9
pub const __putc_unlocked_body = @compileError("TODO postfix inc/dec expr");
// /usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h:106:9
pub const _IO_EOF_SEEN = @as(c_int, 0x0010);
pub inline fn __feof_unlocked_body(_fp: anytype) @TypeOf((_fp.*._flags & _IO_EOF_SEEN) != @as(c_int, 0)) {
    _ = &_fp;
    return (_fp.*._flags & _IO_EOF_SEEN) != @as(c_int, 0);
}
pub const _IO_ERR_SEEN = @as(c_int, 0x0020);
pub inline fn __ferror_unlocked_body(_fp: anytype) @TypeOf((_fp.*._flags & _IO_ERR_SEEN) != @as(c_int, 0)) {
    _ = &_fp;
    return (_fp.*._flags & _IO_ERR_SEEN) != @as(c_int, 0);
}
pub const _IO_USER_LOCK = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x8000, .hex);
pub const __cookie_io_functions_t_defined = @as(c_int, 1);
pub const _VA_LIST_DEFINED = "";
pub const __off_t_defined = "";
pub const __ssize_t_defined = "";
pub const _IOFBF = @as(c_int, 0);
pub const _IOLBF = @as(c_int, 1);
pub const _IONBF = @as(c_int, 2);
pub const BUFSIZ = @as(c_int, 8192);
pub const EOF = -@as(c_int, 1);
pub const SEEK_SET = @as(c_int, 0);
pub const SEEK_CUR = @as(c_int, 1);
pub const SEEK_END = @as(c_int, 2);
pub const P_tmpdir = "/tmp";
pub const L_tmpnam = @as(c_int, 20);
pub const TMP_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 238328, .decimal);
pub const _BITS_STDIO_LIM_H = @as(c_int, 1);
pub const FILENAME_MAX = @as(c_int, 4096);
pub const L_ctermid = @as(c_int, 9);
pub const FOPEN_MAX = @as(c_int, 16);
pub const __attr_dealloc_fclose = __attr_dealloc(fclose, @as(c_int, 1));
pub const _BITS_FLOATN_H = "";
pub const __HAVE_FLOAT128 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT128 = @as(c_int, 0);
pub const __HAVE_FLOAT64X = @as(c_int, 1);
pub const __HAVE_FLOAT64X_LONG_DOUBLE = @as(c_int, 1);
pub const _BITS_FLOATN_COMMON_H = "";
pub const __HAVE_FLOAT16 = @as(c_int, 0);
pub const __HAVE_FLOAT32 = @as(c_int, 1);
pub const __HAVE_FLOAT64 = @as(c_int, 1);
pub const __HAVE_FLOAT32X = @as(c_int, 1);
pub const __HAVE_FLOAT128X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT16 = __HAVE_FLOAT16;
pub const __HAVE_DISTINCT_FLOAT32 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64 = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT32X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT64X = @as(c_int, 0);
pub const __HAVE_DISTINCT_FLOAT128X = __HAVE_FLOAT128X;
pub const __HAVE_FLOAT128_UNLIKE_LDBL = (__HAVE_DISTINCT_FLOAT128 != 0) and (__LDBL_MANT_DIG__ != @as(c_int, 113));
pub const __HAVE_FLOATN_NOT_TYPEDEF = @as(c_int, 0);
pub const __f32 = @import("std").zig.c_translation.Macros.F_SUFFIX;
pub inline fn __f64(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub inline fn __f32x(x: anytype) @TypeOf(x) {
    _ = &x;
    return x;
}
pub const __f64x = @import("std").zig.c_translation.Macros.L_SUFFIX;
pub const __CFLOAT32 = @compileError("unable to translate: TODO _Complex");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:149:12
pub const __CFLOAT64 = @compileError("unable to translate: TODO _Complex");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:160:13
pub const __CFLOAT32X = @compileError("unable to translate: TODO _Complex");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:169:12
pub const __CFLOAT64X = @compileError("unable to translate: TODO _Complex");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:178:13
pub inline fn __builtin_huge_valf32() @TypeOf(__builtin_huge_valf()) {
    return __builtin_huge_valf();
}
pub inline fn __builtin_inff32() @TypeOf(__builtin_inff()) {
    return __builtin_inff();
}
pub inline fn __builtin_nanf32(x: anytype) @TypeOf(__builtin_nanf(x)) {
    _ = &x;
    return __builtin_nanf(x);
}
pub const __builtin_nansf32 = @compileError("unable to translate macro: undefined identifier `__builtin_nansf`");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:221:12
pub const __builtin_huge_valf64 = @compileError("unable to translate macro: undefined identifier `__builtin_huge_val`");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:255:13
pub const __builtin_inff64 = @compileError("unable to translate macro: undefined identifier `__builtin_inf`");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:256:13
pub const __builtin_nanf64 = @compileError("unable to translate macro: undefined identifier `__builtin_nan`");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:257:13
pub const __builtin_nansf64 = @compileError("unable to translate macro: undefined identifier `__builtin_nans`");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:258:13
pub const __builtin_huge_valf32x = @compileError("unable to translate macro: undefined identifier `__builtin_huge_val`");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:272:12
pub const __builtin_inff32x = @compileError("unable to translate macro: undefined identifier `__builtin_inf`");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:273:12
pub const __builtin_nanf32x = @compileError("unable to translate macro: undefined identifier `__builtin_nan`");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:274:12
pub const __builtin_nansf32x = @compileError("unable to translate macro: undefined identifier `__builtin_nans`");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:275:12
pub const __builtin_huge_valf64x = @compileError("unable to translate macro: undefined identifier `__builtin_huge_vall`");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:289:13
pub const __builtin_inff64x = @compileError("unable to translate macro: undefined identifier `__builtin_infl`");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:290:13
pub const __builtin_nanf64x = @compileError("unable to translate macro: undefined identifier `__builtin_nanl`");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:291:13
pub const __builtin_nansf64x = @compileError("unable to translate macro: undefined identifier `__builtin_nansl`");
// /usr/include/x86_64-linux-gnu/bits/floatn-common.h:292:13
pub const _BITS_STDIO2_DEC_H = @as(c_int, 1);
pub const _BITS_STDIO_H = @as(c_int, 1);
pub const __STDIO_INLINE = __extern_inline;
pub const _BITS_STDIO2_H = @as(c_int, 1);
pub const __CLANG_LIMITS_H = "";
pub const _GCC_LIMITS_H_ = "";
pub const _LIBC_LIMITS_H_ = @as(c_int, 1);
pub const MB_LEN_MAX = @as(c_int, 16);
pub const LLONG_MIN = -LLONG_MAX - @as(c_int, 1);
pub const LLONG_MAX = __LONG_LONG_MAX__;
pub const ULLONG_MAX = (LLONG_MAX * @as(c_ulonglong, 2)) + @as(c_int, 1);
pub const _BITS_POSIX1_LIM_H = @as(c_int, 1);
pub const _POSIX_AIO_LISTIO_MAX = @as(c_int, 2);
pub const _POSIX_AIO_MAX = @as(c_int, 1);
pub const _POSIX_ARG_MAX = @as(c_int, 4096);
pub const _POSIX_CHILD_MAX = @as(c_int, 25);
pub const _POSIX_DELAYTIMER_MAX = @as(c_int, 32);
pub const _POSIX_HOST_NAME_MAX = @as(c_int, 255);
pub const _POSIX_LINK_MAX = @as(c_int, 8);
pub const _POSIX_LOGIN_NAME_MAX = @as(c_int, 9);
pub const _POSIX_MAX_CANON = @as(c_int, 255);
pub const _POSIX_MAX_INPUT = @as(c_int, 255);
pub const _POSIX_MQ_OPEN_MAX = @as(c_int, 8);
pub const _POSIX_MQ_PRIO_MAX = @as(c_int, 32);
pub const _POSIX_NAME_MAX = @as(c_int, 14);
pub const _POSIX_NGROUPS_MAX = @as(c_int, 8);
pub const _POSIX_OPEN_MAX = @as(c_int, 20);
pub const _POSIX_PATH_MAX = @as(c_int, 256);
pub const _POSIX_PIPE_BUF = @as(c_int, 512);
pub const _POSIX_RE_DUP_MAX = @as(c_int, 255);
pub const _POSIX_RTSIG_MAX = @as(c_int, 8);
pub const _POSIX_SEM_NSEMS_MAX = @as(c_int, 256);
pub const _POSIX_SEM_VALUE_MAX = @as(c_int, 32767);
pub const _POSIX_SIGQUEUE_MAX = @as(c_int, 32);
pub const _POSIX_SSIZE_MAX = @as(c_int, 32767);
pub const _POSIX_STREAM_MAX = @as(c_int, 8);
pub const _POSIX_SYMLINK_MAX = @as(c_int, 255);
pub const _POSIX_SYMLOOP_MAX = @as(c_int, 8);
pub const _POSIX_TIMER_MAX = @as(c_int, 32);
pub const _POSIX_TTY_NAME_MAX = @as(c_int, 9);
pub const _POSIX_TZNAME_MAX = @as(c_int, 6);
pub const _POSIX_CLOCKRES_MIN = @import("std").zig.c_translation.promoteIntLiteral(c_int, 20000000, .decimal);
pub const __undef_NR_OPEN = "";
pub const __undef_LINK_MAX = "";
pub const __undef_OPEN_MAX = "";
pub const __undef_ARG_MAX = "";
pub const _LINUX_LIMITS_H = "";
pub const NR_OPEN = @as(c_int, 1024);
pub const NGROUPS_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65536, .decimal);
pub const ARG_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 131072, .decimal);
pub const LINK_MAX = @as(c_int, 127);
pub const MAX_CANON = @as(c_int, 255);
pub const MAX_INPUT = @as(c_int, 255);
pub const NAME_MAX = @as(c_int, 255);
pub const PATH_MAX = @as(c_int, 4096);
pub const PIPE_BUF = @as(c_int, 4096);
pub const XATTR_NAME_MAX = @as(c_int, 255);
pub const XATTR_SIZE_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65536, .decimal);
pub const XATTR_LIST_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 65536, .decimal);
pub const RTSIG_MAX = @as(c_int, 32);
pub const _POSIX_THREAD_KEYS_MAX = @as(c_int, 128);
pub const PTHREAD_KEYS_MAX = @as(c_int, 1024);
pub const _POSIX_THREAD_DESTRUCTOR_ITERATIONS = @as(c_int, 4);
pub const PTHREAD_DESTRUCTOR_ITERATIONS = _POSIX_THREAD_DESTRUCTOR_ITERATIONS;
pub const _POSIX_THREAD_THREADS_MAX = @as(c_int, 64);
pub const AIO_PRIO_DELTA_MAX = @as(c_int, 20);
pub const PTHREAD_STACK_MIN = @as(c_int, 16384);
pub const DELAYTIMER_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const TTY_NAME_MAX = @as(c_int, 32);
pub const LOGIN_NAME_MAX = @as(c_int, 256);
pub const HOST_NAME_MAX = @as(c_int, 64);
pub const MQ_PRIO_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 32768, .decimal);
pub const SEM_VALUE_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const SSIZE_MAX = LONG_MAX;
pub const _BITS_POSIX2_LIM_H = @as(c_int, 1);
pub const _POSIX2_BC_BASE_MAX = @as(c_int, 99);
pub const _POSIX2_BC_DIM_MAX = @as(c_int, 2048);
pub const _POSIX2_BC_SCALE_MAX = @as(c_int, 99);
pub const _POSIX2_BC_STRING_MAX = @as(c_int, 1000);
pub const _POSIX2_COLL_WEIGHTS_MAX = @as(c_int, 2);
pub const _POSIX2_EXPR_NEST_MAX = @as(c_int, 32);
pub const _POSIX2_LINE_MAX = @as(c_int, 2048);
pub const _POSIX2_RE_DUP_MAX = @as(c_int, 255);
pub const _POSIX2_CHARCLASS_NAME_MAX = @as(c_int, 14);
pub const BC_BASE_MAX = _POSIX2_BC_BASE_MAX;
pub const BC_DIM_MAX = _POSIX2_BC_DIM_MAX;
pub const BC_SCALE_MAX = _POSIX2_BC_SCALE_MAX;
pub const BC_STRING_MAX = _POSIX2_BC_STRING_MAX;
pub const COLL_WEIGHTS_MAX = @as(c_int, 255);
pub const EXPR_NEST_MAX = _POSIX2_EXPR_NEST_MAX;
pub const LINE_MAX = _POSIX2_LINE_MAX;
pub const CHARCLASS_NAME_MAX = @as(c_int, 2048);
pub const RE_DUP_MAX = @as(c_int, 0x7fff);
pub const SCHAR_MAX = __SCHAR_MAX__;
pub const SHRT_MAX = __SHRT_MAX__;
pub const INT_MAX = __INT_MAX__;
pub const LONG_MAX = __LONG_MAX__;
pub const SCHAR_MIN = -__SCHAR_MAX__ - @as(c_int, 1);
pub const SHRT_MIN = -__SHRT_MAX__ - @as(c_int, 1);
pub const INT_MIN = -__INT_MAX__ - @as(c_int, 1);
pub const LONG_MIN = -__LONG_MAX__ - @as(c_long, 1);
pub const UCHAR_MAX = (__SCHAR_MAX__ * @as(c_int, 2)) + @as(c_int, 1);
pub const USHRT_MAX = (__SHRT_MAX__ * @as(c_int, 2)) + @as(c_int, 1);
pub const UINT_MAX = (__INT_MAX__ * @as(c_uint, 2)) + @as(c_uint, 1);
pub const ULONG_MAX = (__LONG_MAX__ * @as(c_ulong, 2)) + @as(c_ulong, 1);
pub const CHAR_BIT = __CHAR_BIT__;
pub const CHAR_MIN = SCHAR_MIN;
pub const CHAR_MAX = __SCHAR_MAX__;
pub const __XML_STRING_H__ = "";
pub const __need_va_list = "";
pub const __need_va_arg = "";
pub const __need___va_copy = "";
pub const __need_va_copy = "";
pub const __STDARG_H = "";
pub const _VA_LIST = "";
pub const va_start = @compileError("unable to translate macro: undefined identifier `__builtin_va_start`");
// /home/stephan/programs/zig/lib/include/__stdarg_va_arg.h:17:9
pub const va_end = @compileError("unable to translate macro: undefined identifier `__builtin_va_end`");
// /home/stephan/programs/zig/lib/include/__stdarg_va_arg.h:19:9
pub const va_arg = @compileError("unable to translate C expr: unexpected token 'an identifier'");
// /home/stephan/programs/zig/lib/include/__stdarg_va_arg.h:20:9
pub const __va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`");
// /home/stephan/programs/zig/lib/include/__stdarg___va_copy.h:11:9
pub const va_copy = @compileError("unable to translate macro: undefined identifier `__builtin_va_copy`");
// /home/stephan/programs/zig/lib/include/__stdarg_va_copy.h:11:9
pub const BAD_CAST = @compileError("unable to translate C expr: unexpected token ''");
// /home/stephan/projects/zig-firmware-brainstorming/.zig-cache/o/8c9d593234a90e9a59baab1030274e89/libxml/xmlstring.h:35:9
pub const BASE_BUFFER_SIZE = @as(c_int, 4096);
pub const LIBXML2_NEW_BUFFER = "";
pub const XML_XML_NAMESPACE = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/stephan/projects/zig-firmware-brainstorming/.zig-cache/o/8c9d593234a90e9a59baab1030274e89/libxml/tree.h:140:9
pub const XML_XML_ID = @compileError("unable to translate C expr: unexpected token 'const'");
// /home/stephan/projects/zig-firmware-brainstorming/.zig-cache/o/8c9d593234a90e9a59baab1030274e89/libxml/tree.h:148:9
pub const XML_DOCB_DOCUMENT_NODE = @as(c_int, 21);
pub const __XML_REGEXP_H__ = "";
pub const XML_LOCAL_NAMESPACE = XML_NAMESPACE_DECL;
pub inline fn XML_GET_CONTENT(n: anytype) @TypeOf(if (n.*.type == XML_ELEMENT_NODE) NULL else n.*.content) {
    _ = &n;
    return if (n.*.type == XML_ELEMENT_NODE) NULL else n.*.content;
}
pub inline fn XML_GET_LINE(n: anytype) @TypeOf(xmlGetLineNo(n)) {
    _ = &n;
    return xmlGetLineNo(n);
}
pub const xmlChildrenNode = @compileError("unable to translate macro: undefined identifier `children`");
// /home/stephan/projects/zig-firmware-brainstorming/.zig-cache/o/8c9d593234a90e9a59baab1030274e89/libxml/tree.h:640:9
pub const xmlRootNode = @compileError("unable to translate macro: undefined identifier `children`");
// /home/stephan/projects/zig-firmware-brainstorming/.zig-cache/o/8c9d593234a90e9a59baab1030274e89/libxml/tree.h:650:9
pub const __DEBUG_MEMORY_ALLOC__ = "";
pub const __XML_THREADS_H__ = "";
pub const __XML_GLOBALS_H = "";
pub const __XML_PARSER_H__ = "";
pub const __XML_DICT_H__ = "";
pub const __need_ptrdiff_t = "";
pub const __need_wchar_t = "";
pub const __need_max_align_t = "";
pub const __need_offsetof = "";
pub const __STDDEF_H = "";
pub const _PTRDIFF_T = "";
pub const _WCHAR_T = "";
pub const __CLANG_MAX_ALIGN_T_DEFINED = "";
pub const offsetof = @compileError("unable to translate C expr: unexpected token 'an identifier'");
// /home/stephan/programs/zig/lib/include/__stddef_offsetof.h:16:9
pub const __XML_HASH_H__ = "";
pub inline fn XML_CAST_FPTR(fptr: anytype) @TypeOf(fptr) {
    _ = &fptr;
    return fptr;
}
pub const __XML_VALID_H__ = "";
pub const __XML_ERROR_H__ = "";
pub const __XML_LINK_INCLUDE__ = "";
pub const __XML_AUTOMATA_H__ = "";
pub const __XML_ENTITIES_H__ = "";
pub const XML_DEFAULT_VERSION = "1.0";
pub const XML_DETECT_IDS = @as(c_int, 2);
pub const XML_COMPLETE_ATTRS = @as(c_int, 4);
pub const XML_SKIP_IDS = @as(c_int, 8);
pub const XML_SAX2_MAGIC = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xDEEDBEAF, .hex);
pub const __XML_CHAR_ENCODING_H__ = "";
pub const __XML_IO_H__ = "";
pub const __XML_SAX2_H__ = "";
pub const _STDLIB_H = @as(c_int, 1);
pub const WNOHANG = @as(c_int, 1);
pub const WUNTRACED = @as(c_int, 2);
pub const WSTOPPED = @as(c_int, 2);
pub const WEXITED = @as(c_int, 4);
pub const WCONTINUED = @as(c_int, 8);
pub const WNOWAIT = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x01000000, .hex);
pub const __WNOTHREAD = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x20000000, .hex);
pub const __WALL = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x40000000, .hex);
pub const __WCLONE = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0x80000000, .hex);
pub inline fn __WEXITSTATUS(status: anytype) @TypeOf((status & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff00, .hex)) >> @as(c_int, 8)) {
    _ = &status;
    return (status & @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xff00, .hex)) >> @as(c_int, 8);
}
pub inline fn __WTERMSIG(status: anytype) @TypeOf(status & @as(c_int, 0x7f)) {
    _ = &status;
    return status & @as(c_int, 0x7f);
}
pub inline fn __WSTOPSIG(status: anytype) @TypeOf(__WEXITSTATUS(status)) {
    _ = &status;
    return __WEXITSTATUS(status);
}
pub inline fn __WIFEXITED(status: anytype) @TypeOf(__WTERMSIG(status) == @as(c_int, 0)) {
    _ = &status;
    return __WTERMSIG(status) == @as(c_int, 0);
}
pub inline fn __WIFSIGNALED(status: anytype) @TypeOf((@import("std").zig.c_translation.cast(i8, (status & @as(c_int, 0x7f)) + @as(c_int, 1)) >> @as(c_int, 1)) > @as(c_int, 0)) {
    _ = &status;
    return (@import("std").zig.c_translation.cast(i8, (status & @as(c_int, 0x7f)) + @as(c_int, 1)) >> @as(c_int, 1)) > @as(c_int, 0);
}
pub inline fn __WIFSTOPPED(status: anytype) @TypeOf((status & @as(c_int, 0xff)) == @as(c_int, 0x7f)) {
    _ = &status;
    return (status & @as(c_int, 0xff)) == @as(c_int, 0x7f);
}
pub inline fn __WIFCONTINUED(status: anytype) @TypeOf(status == __W_CONTINUED) {
    _ = &status;
    return status == __W_CONTINUED;
}
pub inline fn __WCOREDUMP(status: anytype) @TypeOf(status & __WCOREFLAG) {
    _ = &status;
    return status & __WCOREFLAG;
}
pub inline fn __W_EXITCODE(ret: anytype, sig: anytype) @TypeOf((ret << @as(c_int, 8)) | sig) {
    _ = &ret;
    _ = &sig;
    return (ret << @as(c_int, 8)) | sig;
}
pub inline fn __W_STOPCODE(sig: anytype) @TypeOf((sig << @as(c_int, 8)) | @as(c_int, 0x7f)) {
    _ = &sig;
    return (sig << @as(c_int, 8)) | @as(c_int, 0x7f);
}
pub const __W_CONTINUED = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xffff, .hex);
pub const __WCOREFLAG = @as(c_int, 0x80);
pub inline fn WEXITSTATUS(status: anytype) @TypeOf(__WEXITSTATUS(status)) {
    _ = &status;
    return __WEXITSTATUS(status);
}
pub inline fn WTERMSIG(status: anytype) @TypeOf(__WTERMSIG(status)) {
    _ = &status;
    return __WTERMSIG(status);
}
pub inline fn WSTOPSIG(status: anytype) @TypeOf(__WSTOPSIG(status)) {
    _ = &status;
    return __WSTOPSIG(status);
}
pub inline fn WIFEXITED(status: anytype) @TypeOf(__WIFEXITED(status)) {
    _ = &status;
    return __WIFEXITED(status);
}
pub inline fn WIFSIGNALED(status: anytype) @TypeOf(__WIFSIGNALED(status)) {
    _ = &status;
    return __WIFSIGNALED(status);
}
pub inline fn WIFSTOPPED(status: anytype) @TypeOf(__WIFSTOPPED(status)) {
    _ = &status;
    return __WIFSTOPPED(status);
}
pub inline fn WIFCONTINUED(status: anytype) @TypeOf(__WIFCONTINUED(status)) {
    _ = &status;
    return __WIFCONTINUED(status);
}
pub const __ldiv_t_defined = @as(c_int, 1);
pub const __lldiv_t_defined = @as(c_int, 1);
pub const RAND_MAX = @import("std").zig.c_translation.promoteIntLiteral(c_int, 2147483647, .decimal);
pub const EXIT_FAILURE = @as(c_int, 1);
pub const EXIT_SUCCESS = @as(c_int, 0);
pub const MB_CUR_MAX = __ctype_get_mb_cur_max();
pub const _SYS_TYPES_H = @as(c_int, 1);
pub const __u_char_defined = "";
pub const __ino_t_defined = "";
pub const __dev_t_defined = "";
pub const __gid_t_defined = "";
pub const __mode_t_defined = "";
pub const __nlink_t_defined = "";
pub const __uid_t_defined = "";
pub const __pid_t_defined = "";
pub const __id_t_defined = "";
pub const __daddr_t_defined = "";
pub const __key_t_defined = "";
pub const __clock_t_defined = @as(c_int, 1);
pub const __clockid_t_defined = @as(c_int, 1);
pub const __time_t_defined = @as(c_int, 1);
pub const __timer_t_defined = @as(c_int, 1);
pub const _BITS_STDINT_INTN_H = @as(c_int, 1);
pub const __BIT_TYPES_DEFINED__ = @as(c_int, 1);
pub const _ENDIAN_H = @as(c_int, 1);
pub const _BITS_ENDIAN_H = @as(c_int, 1);
pub const __LITTLE_ENDIAN = @as(c_int, 1234);
pub const __BIG_ENDIAN = @as(c_int, 4321);
pub const __PDP_ENDIAN = @as(c_int, 3412);
pub const _BITS_ENDIANNESS_H = @as(c_int, 1);
pub const __BYTE_ORDER = __LITTLE_ENDIAN;
pub const __FLOAT_WORD_ORDER = __BYTE_ORDER;
pub inline fn __LONG_LONG_PAIR(HI: anytype, LO: anytype) @TypeOf(HI) {
    _ = &HI;
    _ = &LO;
    return blk: {
        _ = &LO;
        break :blk HI;
    };
}
pub const LITTLE_ENDIAN = __LITTLE_ENDIAN;
pub const BIG_ENDIAN = __BIG_ENDIAN;
pub const PDP_ENDIAN = __PDP_ENDIAN;
pub const BYTE_ORDER = __BYTE_ORDER;
pub const _BITS_BYTESWAP_H = @as(c_int, 1);
pub inline fn __bswap_constant_16(x: anytype) __uint16_t {
    _ = &x;
    return @import("std").zig.c_translation.cast(__uint16_t, ((x >> @as(c_int, 8)) & @as(c_int, 0xff)) | ((x & @as(c_int, 0xff)) << @as(c_int, 8)));
}
pub inline fn __bswap_constant_32(x: anytype) @TypeOf(((((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xff000000, .hex)) >> @as(c_int, 24)) | ((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x00ff0000, .hex)) >> @as(c_int, 8))) | ((x & @as(c_uint, 0x0000ff00)) << @as(c_int, 8))) | ((x & @as(c_uint, 0x000000ff)) << @as(c_int, 24))) {
    _ = &x;
    return ((((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0xff000000, .hex)) >> @as(c_int, 24)) | ((x & @import("std").zig.c_translation.promoteIntLiteral(c_uint, 0x00ff0000, .hex)) >> @as(c_int, 8))) | ((x & @as(c_uint, 0x0000ff00)) << @as(c_int, 8))) | ((x & @as(c_uint, 0x000000ff)) << @as(c_int, 24));
}
pub inline fn __bswap_constant_64(x: anytype) @TypeOf(((((((((x & @as(c_ulonglong, 0xff00000000000000)) >> @as(c_int, 56)) | ((x & @as(c_ulonglong, 0x00ff000000000000)) >> @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x0000ff0000000000)) >> @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000ff00000000)) >> @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x00000000ff000000)) << @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x0000000000ff0000)) << @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000000000ff00)) << @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x00000000000000ff)) << @as(c_int, 56))) {
    _ = &x;
    return ((((((((x & @as(c_ulonglong, 0xff00000000000000)) >> @as(c_int, 56)) | ((x & @as(c_ulonglong, 0x00ff000000000000)) >> @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x0000ff0000000000)) >> @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000ff00000000)) >> @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x00000000ff000000)) << @as(c_int, 8))) | ((x & @as(c_ulonglong, 0x0000000000ff0000)) << @as(c_int, 24))) | ((x & @as(c_ulonglong, 0x000000000000ff00)) << @as(c_int, 40))) | ((x & @as(c_ulonglong, 0x00000000000000ff)) << @as(c_int, 56));
}
pub const _BITS_UINTN_IDENTITY_H = @as(c_int, 1);
pub inline fn htobe16(x: anytype) @TypeOf(__bswap_16(x)) {
    _ = &x;
    return __bswap_16(x);
}
pub inline fn htole16(x: anytype) @TypeOf(__uint16_identity(x)) {
    _ = &x;
    return __uint16_identity(x);
}
pub inline fn be16toh(x: anytype) @TypeOf(__bswap_16(x)) {
    _ = &x;
    return __bswap_16(x);
}
pub inline fn le16toh(x: anytype) @TypeOf(__uint16_identity(x)) {
    _ = &x;
    return __uint16_identity(x);
}
pub inline fn htobe32(x: anytype) @TypeOf(__bswap_32(x)) {
    _ = &x;
    return __bswap_32(x);
}
pub inline fn htole32(x: anytype) @TypeOf(__uint32_identity(x)) {
    _ = &x;
    return __uint32_identity(x);
}
pub inline fn be32toh(x: anytype) @TypeOf(__bswap_32(x)) {
    _ = &x;
    return __bswap_32(x);
}
pub inline fn le32toh(x: anytype) @TypeOf(__uint32_identity(x)) {
    _ = &x;
    return __uint32_identity(x);
}
pub inline fn htobe64(x: anytype) @TypeOf(__bswap_64(x)) {
    _ = &x;
    return __bswap_64(x);
}
pub inline fn htole64(x: anytype) @TypeOf(__uint64_identity(x)) {
    _ = &x;
    return __uint64_identity(x);
}
pub inline fn be64toh(x: anytype) @TypeOf(__bswap_64(x)) {
    _ = &x;
    return __bswap_64(x);
}
pub inline fn le64toh(x: anytype) @TypeOf(__uint64_identity(x)) {
    _ = &x;
    return __uint64_identity(x);
}
pub const _SYS_SELECT_H = @as(c_int, 1);
pub const __FD_ZERO = @compileError("unable to translate macro: undefined identifier `__i`");
// /usr/include/x86_64-linux-gnu/bits/select.h:25:9
pub const __FD_SET = @compileError("unable to translate C expr: expected ')' instead got '|='");
// /usr/include/x86_64-linux-gnu/bits/select.h:32:9
pub const __FD_CLR = @compileError("unable to translate C expr: expected ')' instead got '&='");
// /usr/include/x86_64-linux-gnu/bits/select.h:34:9
pub inline fn __FD_ISSET(d: anytype, s: anytype) @TypeOf((__FDS_BITS(s)[@as(usize, @intCast(__FD_ELT(d)))] & __FD_MASK(d)) != @as(c_int, 0)) {
    _ = &d;
    _ = &s;
    return (__FDS_BITS(s)[@as(usize, @intCast(__FD_ELT(d)))] & __FD_MASK(d)) != @as(c_int, 0);
}
pub const __sigset_t_defined = @as(c_int, 1);
pub const ____sigset_t_defined = "";
pub const _SIGSET_NWORDS = @import("std").zig.c_translation.MacroArithmetic.div(@as(c_int, 1024), @as(c_int, 8) * @import("std").zig.c_translation.sizeof(c_ulong));
pub const __timeval_defined = @as(c_int, 1);
pub const _STRUCT_TIMESPEC = @as(c_int, 1);
pub const __suseconds_t_defined = "";
pub const __NFDBITS = @as(c_int, 8) * @import("std").zig.c_translation.cast(c_int, @import("std").zig.c_translation.sizeof(__fd_mask));
pub inline fn __FD_ELT(d: anytype) @TypeOf(@import("std").zig.c_translation.MacroArithmetic.div(d, __NFDBITS)) {
    _ = &d;
    return @import("std").zig.c_translation.MacroArithmetic.div(d, __NFDBITS);
}
pub inline fn __FD_MASK(d: anytype) __fd_mask {
    _ = &d;
    return @import("std").zig.c_translation.cast(__fd_mask, @as(c_ulong, 1) << @import("std").zig.c_translation.MacroArithmetic.rem(d, __NFDBITS));
}
pub inline fn __FDS_BITS(set: anytype) @TypeOf(set.*.__fds_bits) {
    _ = &set;
    return set.*.__fds_bits;
}
pub const FD_SETSIZE = __FD_SETSIZE;
pub const NFDBITS = __NFDBITS;
pub inline fn FD_SET(fd: anytype, fdsetp: anytype) @TypeOf(__FD_SET(fd, fdsetp)) {
    _ = &fd;
    _ = &fdsetp;
    return __FD_SET(fd, fdsetp);
}
pub inline fn FD_CLR(fd: anytype, fdsetp: anytype) @TypeOf(__FD_CLR(fd, fdsetp)) {
    _ = &fd;
    _ = &fdsetp;
    return __FD_CLR(fd, fdsetp);
}
pub inline fn FD_ISSET(fd: anytype, fdsetp: anytype) @TypeOf(__FD_ISSET(fd, fdsetp)) {
    _ = &fd;
    _ = &fdsetp;
    return __FD_ISSET(fd, fdsetp);
}
pub inline fn FD_ZERO(fdsetp: anytype) @TypeOf(__FD_ZERO(fdsetp)) {
    _ = &fdsetp;
    return __FD_ZERO(fdsetp);
}
pub const _BITS_SELECT_DECL_H = @as(c_int, 1);
pub const __blksize_t_defined = "";
pub const __blkcnt_t_defined = "";
pub const __fsblkcnt_t_defined = "";
pub const __fsfilcnt_t_defined = "";
pub const _BITS_PTHREADTYPES_COMMON_H = @as(c_int, 1);
pub const _THREAD_SHARED_TYPES_H = @as(c_int, 1);
pub const _BITS_PTHREADTYPES_ARCH_H = @as(c_int, 1);
pub const __SIZEOF_PTHREAD_MUTEX_T = @as(c_int, 40);
pub const __SIZEOF_PTHREAD_ATTR_T = @as(c_int, 56);
pub const __SIZEOF_PTHREAD_RWLOCK_T = @as(c_int, 56);
pub const __SIZEOF_PTHREAD_BARRIER_T = @as(c_int, 32);
pub const __SIZEOF_PTHREAD_MUTEXATTR_T = @as(c_int, 4);
pub const __SIZEOF_PTHREAD_COND_T = @as(c_int, 48);
pub const __SIZEOF_PTHREAD_CONDATTR_T = @as(c_int, 4);
pub const __SIZEOF_PTHREAD_RWLOCKATTR_T = @as(c_int, 8);
pub const __SIZEOF_PTHREAD_BARRIERATTR_T = @as(c_int, 4);
pub const __LOCK_ALIGNMENT = "";
pub const __ONCE_ALIGNMENT = "";
pub const _BITS_ATOMIC_WIDE_COUNTER_H = "";
pub const _THREAD_MUTEX_INTERNAL_H = @as(c_int, 1);
pub const __PTHREAD_MUTEX_HAVE_PREV = @as(c_int, 1);
pub const __PTHREAD_MUTEX_INITIALIZER = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/x86_64-linux-gnu/bits/struct_mutex.h:56:10
pub const _RWLOCK_INTERNAL_H = "";
pub const __PTHREAD_RWLOCK_ELISION_EXTRA = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/x86_64-linux-gnu/bits/struct_rwlock.h:40:11
pub inline fn __PTHREAD_RWLOCK_INITIALIZER(__flags: anytype) @TypeOf(__flags) {
    _ = &__flags;
    return blk: {
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = @as(c_int, 0);
        _ = &__PTHREAD_RWLOCK_ELISION_EXTRA;
        _ = @as(c_int, 0);
        break :blk __flags;
    };
}
pub const __ONCE_FLAG_INIT = @compileError("unable to translate C expr: unexpected token '{'");
// /usr/include/x86_64-linux-gnu/bits/thread-shared-types.h:113:9
pub const __have_pthread_attr_t = @as(c_int, 1);
pub const _ALLOCA_H = @as(c_int, 1);
pub const __COMPAR_FN_T = "";
pub const __STDLIB_MB_LEN_MAX = @as(c_int, 16);
pub const __XML_RELAX_NG__ = "";
pub const __XML_SCHEMA_H__ = "";
pub const _G_fpos_t = struct__G_fpos_t;
pub const _G_fpos64_t = struct__G_fpos64_t;
pub const _IO_marker = struct__IO_marker;
pub const _IO_codecvt = struct__IO_codecvt;
pub const _IO_wide_data = struct__IO_wide_data;
pub const _IO_FILE = struct__IO_FILE;
pub const _IO_cookie_io_functions_t = struct__IO_cookie_io_functions_t;
pub const _xmlCharEncodingHandler = struct__xmlCharEncodingHandler;
pub const _xmlBuf = struct__xmlBuf;
pub const _xmlParserInputBuffer = struct__xmlParserInputBuffer;
pub const _xmlOutputBuffer = struct__xmlOutputBuffer;
pub const _xmlDtd = struct__xmlDtd;
pub const _xmlNs = struct__xmlNs;
pub const _xmlDoc = struct__xmlDoc;
pub const _xmlAttr = struct__xmlAttr;
pub const _xmlNode = struct__xmlNode;
pub const _xmlEntity = struct__xmlEntity;
pub const _xmlParserInput = struct__xmlParserInput;
pub const _xmlEnumeration = struct__xmlEnumeration;
pub const _xmlElementContent = struct__xmlElementContent;
pub const _xmlSAXLocator = struct__xmlSAXLocator;
pub const _xmlError = struct__xmlError;
pub const _xmlSAXHandler = struct__xmlSAXHandler;
pub const _xmlParserNodeInfo = struct__xmlParserNodeInfo;
pub const _xmlParserNodeInfoSeq = struct__xmlParserNodeInfoSeq;
pub const _xmlValidState = struct__xmlValidState;
pub const _xmlValidCtxt = struct__xmlValidCtxt;
pub const _xmlStartTag = struct__xmlStartTag;
pub const _xmlHashTable = struct__xmlHashTable;
pub const _xmlParserCtxt = struct__xmlParserCtxt;
pub const _xmlBuffer = struct__xmlBuffer;
pub const _xmlNotation = struct__xmlNotation;
pub const _xmlAttribute = struct__xmlAttribute;
pub const _xmlElement = struct__xmlElement;
pub const _xmlID = struct__xmlID;
pub const _xmlRef = struct__xmlRef;
pub const _xmlDOMWrapCtxt = struct__xmlDOMWrapCtxt;
pub const _xmlMutex = struct__xmlMutex;
pub const _xmlRMutex = struct__xmlRMutex;
pub const _xmlLink = struct__xmlLink;
pub const _xmlList = struct__xmlList;
pub const _xmlSAXHandlerV1 = struct__xmlSAXHandlerV1;
pub const timeval = struct_timeval;
pub const timespec = struct_timespec;
pub const __pthread_internal_list = struct___pthread_internal_list;
pub const __pthread_internal_slist = struct___pthread_internal_slist;
pub const __pthread_mutex_s = struct___pthread_mutex_s;
pub const __pthread_rwlock_arch_t = struct___pthread_rwlock_arch_t;
pub const __pthread_cond_s = struct___pthread_cond_s;
pub const random_data = struct_random_data;
pub const drand48_data = struct_drand48_data;
pub const _xmlGlobalState = struct__xmlGlobalState;
pub const _xmlRelaxNG = struct__xmlRelaxNG;
pub const _xmlRelaxNGParserCtxt = struct__xmlRelaxNGParserCtxt;
pub const _xmlRelaxNGValidCtxt = struct__xmlRelaxNGValidCtxt;
pub const _xmlSchema = struct__xmlSchema;
pub const _xmlSchemaParserCtxt = struct__xmlSchemaParserCtxt;
pub const _xmlSchemaValidCtxt = struct__xmlSchemaValidCtxt;
pub const _xmlSchemaSAXPlug = struct__xmlSchemaSAXPlug;
pub const _xmlTextReader = struct__xmlTextReader;
