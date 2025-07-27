# License 
GPL2: Use this for whatever you want, but if you do, others must be able to use your customizations as well, hence your forks will be gpl2 as well.

# Philosophy
No hidden control flow. I don't want any behind-the-scenes triggered timing events og interrupts working anywhere it can be avoided (which I believe is everywhere). I want plain, readable sequential code that the reader can make sense of, even the first time they read the code. 

# Getting started
TODO


# Highligthed features
- Written in zig. This should make it possible to give better and more compile error messages.
- Easy start: Easy to setup and compile locally (in opposition to qmk where python is now annoying, you must git pull with -recursive flag, you must run a qmk setup command etc). The "etc" is mainly because I personally always feel there are more cases, but I could not come up with any at the time of writing :D
- handling is done in plain procedural code (look at processing.zig). No events with hidden control flow or anything like that.
- tap-with-mod combined with hold: Say you need to press altgr+7 for making a {, then you also want the same key to be a modifier when hold. This is possible out of the box (possible in zmk, but in qmk this must be done using custom tap/hold handling)
- custom code is more isolated to a key. This is one of the very nice feature in zmk - in qmk you cannot do this in the same manner, you will have the big switch case to handle all the custom behaviour.
- tap-without-mods while mod activated: Option of defining that a given key should be fired without any modifiers (ctrl, shift etc) even though shift or other modifiers are currently being held. 
- user is in control: The users code is the top level of orchestration. In qmk you hook into existing land and by magic everything is compiled. The zigmkay way makes it more obvious how the whole code is running and custom IO stuff will be implemented at the top level (the main.zig)
- no black magic like #define specific field, compile flags, special function names to be implemented etc. Instead you edit the source code. You are not hooking into predefined events or defining methods with specific names to allow your logic to run at a specific place. And you IDE will understand more of what is going on as a result.
- Strict 3-legged logic in terms of A:scanning, B:processing, C:send keycodes to the host using usb. Leg A and C are small, oneoffs and needs to be tested by hand. Leg B is the complex part an because queues are used for comminution between these 3, it is possible to test step B in isolation. And there are lots of tests of this part guarding against regression.
- Readable pin mapping definition
- (upcomming) less custom code: Hook into tap-enter, tap-exit, hold-enter and hold-exit times. In qmk you react to key presses and key releases, so if you want a custom behaviour on tap, but standard on hold, you must handle both tap and hold in your custom code. in zigmkay you let zigmkay decide if tap or hold is chosen, and only run your code in one of the cases. 
- Only dependencies is zig, which must be downloaded first, and microzig which will be auto-fetched when compiling (i think that is the time this happens)
- Autofire per setting - allows for very fast autofire, eg on arrow keys while other keys remain unchanged. This feature does not support combination with hold functions.

# When not to choose zigmkay
- wireless: zigmkay is not planned to be wireless ever.
- mcu: zigmkay will only support the mcu types that microzig supports.
- tap dances: only tap/hold is supported as I don't need tap dances myself. But might be a future thing.
- rgb: I don't need rgb support myself - however, it could be rather fun to explore good ways this could be supported so this might be a thing in the future - but no promisses

# Tasks
The following is an overview over what is done and what is missing.

## Scanning
- (done) poc for scanning a unibody
- (done) debounce handling
- TODO Generalization of pin config
- TODO Sort array by either row or cols depending on the direction of the current and keep track of the key position indexes

## Processor
- (done) tap-only keys
- (done) hold-only keys
- (done) Transparent key support
- (done) None key support
- (done) Tap/Hold - both layer and modifiers are supported. Currently only simple cases where the key is held for more than tapping term period and where it is tapped quickly
- (done) Tap/Hold feature: retrotapping - bool per key 
- (done) Tap/Hold feature: permissive hold - on for all, not possible to disable as I have never seen anyone wanting this off
- (done) Tap/Hold feature: double modifier holds (fixed automatically by improved logic)
- (done) Tap/Hold feature: tripple modifier holds (fixed automatically by improved logic)
- (done) Allow a key press to go into boot mode
- (done) Autofire: allow fast reacting autofire on certain keys, eg arrow keys
- TODO Combos - should support tap/hold just like single keys, as it is implemented in zmk. Should also be defined by matrix key indexes+layers just like in zmk, instead of by keycodes like qmk does.
- TODO Custom code support
- TODO Tri-layer functionality for two layers => 3rd layer
- TODO Tri-layer functionality for a shift key and a layer key => maybe this should not be a layer A + layer B = layer C but instead dual-hold => layer C/or mod changing

Nice to have
- TODO Allow log printing through the usb interface as text to the host

Stuff that I do not use myself:
- TODO One shot mods (should these be ignored if the next key tapped has its own tapping-modifier(s) applied to it?)


## Hardware
- TODO Trrs

## Overall
- Design how custom code should be included 
- Look into performance and memory usage optimization

# Guide
```c
pub fn main() !void {
    // Data queues
    var matrix_change_queue = zigmkay.core.MatrixStateChangeQueue.Create();
    var usb_command_queue = zigmkay.core.OutputCommandQueue.Create();

    // Logic
    const matrix_scanner = zigmkay.matrix_scanning.CreateMatrixScanner(.{ .debounce_ms = 5 });
    var processor = zigmkay.processing.CreateProcessorType(keyboard.dimensions, &keyboard.keymap){};
    const usb_command_executor = zigmkay.usb_command_executor.CreateAndInitUsbCommandExecutor();

    while (true) {
        const current_time = time.get_time_since_boot().to_us();

        // Detect matrix changes
        try matrix_scanner.DetectKeyboardChanges(&matrix_change_queue, current_time);

        // Decide actions
        try processor.Process(&matrix_change_queue, &usb_command_queue, current_time);

        // Execute actions
        try usb_command_executor.HouseKeepAndProcessCommands(&usb_command_queue);
    }
}
```
