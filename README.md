# License
GPL2: Use this for whatever you want, but if you do, others must be able to use your customizations as well, hence your forks will be gpl2 as well.

# Getting started
1. Download zig version 14.1
2. Clone this repo
3. Define you own files (todo: write in details what needs to be done)
4. Compile using ./build.zig and deploy using ./

# TODO
## Scanning
- Sort array by either row or cols depending on the direction of the current and keep track of the key position indexes

## Processor
- (done) tap-only keys
- (done) hold-only keys
- (done) Transparent key support
- (done) None key support
- Combos - should support tap/hold just like single keys, as it is implemented in zmk. Should also be defined by matrix key indexes+layers just like in zmk, instead of by keycodes like qmk does.
- Tap and hold on the same key (remember features: tapping term, retrotapping, permissive hold)
- One shot mods (should these be ignored if the next key tapped has its own tapping-modifier(s) applied to it?)
- "Tap+hold for layer switch" on same keys
- "Tap+hold for modifiers switch" on same keys

- Tri-layer functionality for two layers => 3rd layer
- Tri-layer functionality for a shift key and a layer key => maybe this should not be a layer A + layer B = layer C but instead dual-hold => layer C/or mod changing
- Ensure special-tab case is covered
- Find a way to do tri-layer support, eg no matter in what order, holding ie both thumbs should always give you a third layer. This is possible in default land in zmk, but in qmk it must be done manually.
- Autofire: allow fast reacting autofire on certain keys, eg arrow keys

## Hardware
- Support trrs connections

# Highligthed features
- Written in zig.
- Easy start: Easy to setup and compile locally (in opposition to qmk where python is now annoying, you must git pull with -recursive flag, you must run a qmk setup command etc). The "etc" is mainly because I personally always feel there are more cases, but I could not come up with any at the time of writing :D
- tap-with-mod combined with hold: Say you need to press altgr+7 for making a {, then you also want the same key to be a modifier when hold. This is possible out of the box (possible in zmk, but in qmk this must be done using custom tap/hold handling)
- custom code is more isolated to a key. This is one of the very nice feature in zmk - in qmk you cannot do this in the same manner, you will have the big switch case to handle all the custom behaviour.
- tap-without-mods while mod activated: Option of defining that a given key should be fired without any modifiers (ctrl, shift etc) even though shift or other modifiers are currently being held. 
- user is in control: The users code is the top level of orchestration. In qmk you hook into existing land and by magic everything is compiled. The zigmkay way makes it more obvious how the whole code is running and custom IO stuff will be implemented at the top level (the main.zig)
- no black magic like #define specific field, compile flags, special function names to be implemented etc. Instead you edit the source code. You are not hooking into predefined events or defining methods with specific names to allow your logic to run at a specific place. And you IDE will understand more of what is going on as a result.
- Strict 3-legged logic in terms of A:scanning, B:processing, C:send keycodes to the host using usb. Leg A and C are small, oneoffs and needs to be tested by hand. Leg B is the complex part an because queues are used for comminution between these 3, it is possible to test step B in isolation. And there are lots of tests of this part guarding against regression.
- Readable pin mapping definition
- (upcomming) less custom code: Hook into tap-enter, tap-exit, hold-enter and hold-exit times. In qmk you react to key presses and key releases, so if you want a custom behaviour on tap, but standard on hold, you must handle both tap and hold in your custom code. in zigmkay you let zigmkay decide if tap or hold is chosen, and only run your code in one of the cases. 
- Only dependencies is zig, which must be downloaded first, and microzig which will be auto-fetched when compiling (i think that is the time this happens)

# When not to choose zigmkay
- wireless: zigmkay is not planned to be wireless ever.
- mcu: zigmkay will only support the mcu types that microzig supports.
- tap dances: only tap/hold is supported as I don't need tap dances myself. But might be a future thing.
- rgb: I don't need rgb support myself - however, it could be rather fun to explore good ways this could be supported so this might be a thing in the future - but no promisses

# Guide
(todo)
