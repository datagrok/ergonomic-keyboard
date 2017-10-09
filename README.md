# A 3D-Printed Ergonomic Keyboard Chassis

I want an ergonomic keyboard, but with a mix of features I haven't so far found commercially, in kits, or other enthusiasts' designs.

# Build log

TODO: include photos

### v5

v4's switch placement algorithm assumes a constant angle at which the finger should strike the key. Observe that a range of angles from perpendicular to about 60 degrees is comfortable. Use this flexibility to bring the switch angles (and keycap centers) closer together.

v4 prints the entire "key bowl" as one solid object. Instead, explore ways to print separated parts, requiring less support material, to be connected using standard hardware (e.g. M3 machine screws and nuts, and/or zip ties.)

Result: (TODO)

### v4

Improved the "bowl" of v3 to avoid so much wasted support material.

Result: As I feared, the vertical finger travel feels quite weird. But, I can operate all the keys without finger stretching, lateral finger movement, hand travel, or wrist movement. Could I get used to it? Maybe I'll try again to reorient the keys.

### v3

Hypothesis: determining maximum and minimum finger stretch can inform the derivation of a function that positions each switch and angles it toward the pad of the finger at that position. A distribution of switches across that range of motion should result in a board that can be typed on without moving the palms.

Result: the "plate and post" support proved difficult to print and generated a lot of wasteful support material. I did not get a complete print. I should try to build more 45-degree angles into the design, to obviate the need for support material.

Notes:

- Happy with improvements to the "key bowl/boat," but the way I implemented it in OpenSCAD made it difficult to add supports. The "plate and post" was admittedly hastily added with a lot of tedious nudging-around.

- I used my [Logitech M570](https://www.logitech.com/en-us/product/wireless-trackball-m570) trackball as a reference for this build. Notable difference between my trackball and my keyboard: I use the trackball with a palm-rest; the hand does not travel, the wrist does not move. Compare to most keyboards which require wrist-rests, that you're not supposed to use while typing. Can I make a keyboard that is comfortable with zero hand travel?

- I wonder if I could mash-up my wireless trackball and the keyboard, replacing one of the thumb clusters. A combination pointing-device and curved-keyboard reminds me of the [King's Assembly](https://www.kickstarter.com/projects/70308014/kings-assembly-a-computer-mouse-full-of-awesome), which I didn't like because who wants to slide their bulky keyboard around their desk? And it seems like every keystroke would jostle the pointer. But a trackball instead could work well!

### v2

Hypothesis: with some keys angled sharply together, the pinky can still reach a 4th row without it being angled so much that it is struck with the fingernail.

Result: it is difficult to reach over the first row to reach the 4th row, depending on the angle. It will be easier to evaluate success if I print a whole hand worth of keys and angle it consistently.

### v1

Hypothesis: Angling the switches will let me cram DSA caps together as closely as possible, making it easy to reach many of them with minimal finger travel.

Conclusion: Due to the angle, some caps are necessarily struck with the tip of the fingernail. This is uncomfortable.

# Goals

I have two primary goals, and they often conflict:

**Economy.**
I want a keyboard that is cheap to manufacture in small quantities.
The design and creation of custom computer keyboards is a rich kid's hobby, and it shouldn't be.
Every computer user should be able to type comfortably, control what their input device does, and modify it to suit their needs.

Currently the [Mitosis][] best meets this goal for me.
It is a very minimalist kit that (due to ingenious design and attention to manufacturing details) remarkably meets several other goals (programmable, open, mechanical, wireless, low-profile, small, rather comfortable) while costing around $80 to manufacture in small quantities.

**Ergonoimcs.** I want a keyboard that is ergonomic, and has its keys arranged for maximum typing comfort.
For me this means column depth and stagger proportional to the length of my fingers.
(So most easy-to-manufacture "ortho-linear" designs like the [Planck, Preonic](https://olkb.com/), [Let's Split](https://github.com/nicinabox/lets-split-guide), or [Nyquist](https://docs.keeb.io/) are ruled out.)
Also, it means minimizing stretching, hand movement (re-homing), and lateral finger movement.

Economy is improved by clever printed circuit board design and manufacture (e.g. using one PCB design that serves multiple purposes), but cheap PCBs are necessarily flat.

For ergonomics it seems I should create a sculpted chassis that arranges key switches perfectly for my fingers' most comfortable range of motion, but that means avoiding the use of a cheap, flat PCB in favor of a hand-wired 3D model.
It also implies a small number of keys (because one can reach only so many without moving the hands.) A small number of keys implies cleverly-designed key chording, and I'm fine with that.

I'm doing prototypes using a 3D printer, but large-volume 3D prints can be expensive for users of a 3D printing service.
I am sure that even after I determine my optimal switch positions I will have additional work to do to reduce the chassis cost.
For example, Shapeways.com will print a [Dactyl for $220](https://www.shapeways.com/shops/bespokeys), or a [ManuForm for $300](https://www.shapeways.com/shops/grandesigns).
I have plans to attempt other means of cheap manufacturing: minimalist die-cut metal, laser-cut acrylic, laser-cut and folded cardboard, etc.

Other goals:

1. **Fully programmable.**
The firmware should be Free Software.
Failing that, users should be able to replace the firmware with their own free software implementations, completely, without losing access to any of the hardware.

2. **Fully open.**
CAD files provided for the chassis, schematics for the wiring, gerbers for the PCB (if any), and the complete corresponding source files for all the tools that were used to create those models, schematics and gerbers.

3. **Split.**
I want a separate board for each hand, so that I don't have to be "joined at the wrist" while typing.
Some gamers also like split boards so they can mouse with one hand while using half a keyboard as button inputs with the other.

4. **Tinkerable.**
If any of the I/O pins from the controller(s) remain unused, I'd like the option to connect things to them in the future.

5. **Wireless.**
I might want to mount the halves of the keyboard onto the arm-rests of my office chair, and that's hard to do with wires.

6. **Parametric.**
People have hands of different sizes, and [differing finger length ratios](https://en.wikipedia.org/wiki/Digit_ratio).
The perfect layout for me isn't for everyone, so the design should have tunable parameters.

Some requirements that other keyboard enthusiasts have, I don't care about so much:

- **No Backwards Compatibility.**
I don't need to remain compatible with my preexisting layout, even a little bit.
I want to abandon QWERTY, and train myself to touch-type, and stop using the weirdly row-staggered standard layout.
I'm starting from scratch, which means I can go all-out when it comes to weird key arrangements, unusual angles, multiple function layers, chording, etc.

- **No Bling.**
RGB LEDs, LCD displays, and other toys are fun, but I will discard it in favor of longer battery life.
The [Mitosis][] presents an interesting compromise: the wireless keyboards with no special effects have low power requirements, but the receiver module that sits on the desk is powered by the USB port, so it contains the status LEDs, and could have other toys added to it.
One might still want a receiver with a bling-less mode for use with a battery-powered laptop.
Also, I intend to train myself to touch-type this keyboard, so I need no backlight.

# Other work / inspiration

**[Ergodox](https://www.ergodox.io/).** I built an original ErgoDox, which for a long time was the only keyboard to meet many of my requirements.
But I found that it was not as comfortable as I had hoped:

- The thumb-keys could be positioned more comfortably if they were angled differently than the rest of the board.
- Hardware to position the board at a comfortable angle is not included, must be aftermarket-engineered, and a large wrist-rest is a necessity.
- Too many keys! I have to stretch or move away from home-row to reach many of them.
- The column-stagger does not match my fingers well.

**[RedTilt](https://deskthority.net/workshop-f7/my-diy-keyboard-collection-or-how-i-became-a-kb-geek-t2534-120.html)** was my first inspiration to try 3d-printing a chassis, years ago.
I like the design (which is still receiving revision) but:

- I have no use for a TrackPoint pointing-stick.
- I don't understand the lack of column stagger, and the horizontal curvature. The author says it is comfortable, but my fingers don't angle that way.
- As far as I can tell, the author hasn't open-sourced their design.

**[Kinesis Advantage](https://www.kinesis-ergo.com/shop/advantage2/).** The longtime favorite of RSI-afflicted individuals. This is the board to beat, for me to consider my design good-enough.
Things I dislike:

- it costs $350!
- it is neither open nor fully programmable
- some keys remain hard to reach, lateral finger movement required
- the function-key row is ugly and requires hand movement to reach
- big, hard to travel with
- it is a single "joined at the wrist" board
- I predict a lower thumb-key cluster (that you trigger with the pad rather than the side of the thumb) would feel more comfortable.

**[Maltron Dual Hand](http://www.maltron.com/store/p20/Maltron_L90_dual_hand_fully_ergonomic_%283D%29_keyboard_-_US_English.html).** The other commercially-available "key bowl" keyboard. $500!

**[Mitosis][].**
An ingenious, minimalist design, whose single PCB is small enough to be eligible for deep discount manufacturing while being used for multiple purposes: as the left- and right-hand PCBs, and the mounting plate as well!
This is the first keyboard kit I liked enough to purchase after the ErgoDox.
[FIXME: More]

**[Dactyl](https://github.com/adereth/dactyl-keyboard) & [Lightcycle](https://twitter.com/adereth/status/862796553500540929)**
Dactyl is a popular board that, like the ErgoDox, mimics the Kinesis Advantage, but with a sculpted profile. The Lightcycle is a modification of the Dactyl to make it smaller, with fewer keys.
Both employ an interesting Clojure-to-OpenSCAD compilation step.
My intuition is that the thumb cluster is positioned too high, but I might be wrong about that.
The author says it hasn't been released as a kit because there are still specific design flaws to be worked out.

**[ManuForm](https://geekhack.org/index.php?topic=46015.0).**
I like the thumb-cluster of keys and the column stagger, but I want a split keyboard.
The author originally attempted to design it as a split board but found that to be too difficult. (TODO: why?)

**[Eucalyptus](https://imgur.com/gallery/7jEsm).**
This ingenious board uses tiled copies of one PCB to connect switches positioned on a curve, with a column stagger, eliminating tediously hand-wiring direct to the pins of the switches.
It also incorporates a trackball!
But Sparkfun no longer sells that trackball module.

# License: AGPL3+

All of the code herein is copyright 2017 [Michael F. Lamb](http://datagrok.org) and released under the terms of the [GNU Affero General Public License, version 3][AGPL-3.0+] (or, at your option, any later version.)

**Summary:** You have to give people the source code.

If you modify or reference my OpenSCAD files to create new .stl files that you give or sell to other people, you have to give them the OpenSCAD files as well. Not just mine, not just the changes, but every one needed to create that .stl.

If you incorporate this code into a web-based thing that people can use online (to generate customized .stl files or whatever,) you have to give every _user_ your source code upon request. The whole thing, enough that they could stand up the same web service on their own box if they wanted to.

If you print an object based on this code and sell or give it away, I want the recipients to receive all the source code necessary to reproduce it. (But in this particular case, there may not be a mechanism in copyright law for me to insist that you do so.)

[AGPL-3.0+]: http://www.gnu.org/licenses/agpl.html
[Mitosis]: https://imgur.com/a/mwTFj
