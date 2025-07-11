
# Why a new firmware? Current missing in qmk/zmk:
- Understandable error messages. Zmk lags this, qmk is a little better in this regard
- Flexibility to do simple thing as eg Tap for RALT+Key, Hold for mod/layerhold. Qmk does not allow this combo.
- Understandable keymap definition: qmk relies on custom code for semi advanced stuff, zmk has a nice way of defining a behavior and then pass arguments to that in the keymap.
- tri-layer where one of the holds does shift itself. In qmk this goes to entirely custom code instantly. in zmk not sure, but an entire uppercase layer does not cut it as the key cannot be used as a standalone shift key for shortcuts then. Also, every alpha combo must be duplicated.
- Simple extra stuff should be isolatable to a single keys logic
-   examples:
    - special tab button while hold layer:
    - 1. Layer hold should have an extra snippet for onHoldExit (when layer is exited) that will simply fire an alt-released code if it is currently held
    - 2. The special tab key should have an extra snippet for onBeforeTapEnter which should fire an alt-pressed in case it is not already held
    - special nvim jump keys:
    - 1. Hold down a number layer that will fire Up when released, allowing line jumps using just: Press hold key, type number, release hold key - now nvim jumps up.
    - 2. The same functionality for jumping down

- Possibility to hook into "on tap entered", "on tap exited", "on hold entered" and "on hold exited". In qmk you can only hook into "key pressed/released" and then have to handle tap/hold logic yourself but then one cannot use all the standard tapping/holding logic already built into qmk. 

# TODO


Scanning
- Debounce-support
- Sort array by either row or cols depending on the direction of the current and keep track of the key position indexes

Processor
- Support for mods applied to key presses,
- Holds to switch layer
- "Tap+hold for layer switch" on same keys
- "Tap+hold for modifiers switch" on same keys
- Combos
- Tri-layer functionality for two layers => 3rd layer
- Tri-layer functionality for a shift key and a layer key => maybe this should not be a layer A + layer B = layer C but instead dual-hold => layer C/or mod changing 
- Ensure special-tab case is covered
 

Hardware
- Support trrs connections

Low priority: pleasing general use cases that I currently dont use myself: 
- Support for tap dances? not needed by myself though.
- support for multiple boards
- Make the firmware a module that is imported into main to used for an actual keyboard configuration
- Support for nkro
- blue tooth - this might not be possible with the design choices taken - but at least it may take some real effort to get working depending on what microzig offers to help
