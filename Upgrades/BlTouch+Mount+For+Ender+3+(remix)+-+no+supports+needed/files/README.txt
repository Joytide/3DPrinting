Summary

If you want to try my newer adjustable touch sensor mount, check this thing out:
https://www.thingiverse.com/thing:3148733

I generally recommend the adjustable mount over the fixed mounts for most folks, though people have had good luck using this fixed mount with the BL-Touch V3.1

This is a remix of BlTouch Mount For Ender 3 by dopesoner930 below.

https://www.thingiverse.com/thing:2990086

which is a remix of the original from shocksofmighty below:

https://www.thingiverse.com/thing:2493610

This uses the same dimensions, I just rounded some of the corners so it would not need supports.

===============================================================
Offsets

These are the offsets for this mount - thanks dopesoner930 (for the original design) and danpeig for confirming the offsets:

X_PROBE_OFFSET_FROM_EXTRUDER -42 // X offset: -left +right [of the nozzle]
Y_PROBE_OFFSET_FROM_EXTRUDER -5 // Y offset: -front +behind [the nozzle]

The z-offset will be different for every printer, and must be adjusted for any probe, but one datapoint was reported as -1.75mm, when using a BL-Touch v3.1 on an Ender3 Pro (so -1.75mm should be in the ballpark).

===============================================================

Although I cannot test this anymore on my Ender3 (which uses a Titan Aero), the "ender3-bltouch-mount-4b-3mm-lower" version has been confirmed by multiple commenters to work well with the BL-TOUCH 3.1 Smart on the Ender3 Pro, and also the 3D Touch on the Ender3 used without springs which is more typical.

Some clones work better with the "ender3-no-support-bltouch-mount-4a-fixed.stl" version, this is also a better version if you plan to use springs between the mount and probe.

It is really not possible to make a one-size fits all mount for the clones or all the models of BL-Touch or the clones however, so if you are using an unknown clone or a different model of the BL-Touch than listed, the best bet there may be to try the adjustable mount (
https://www.thingiverse.com/thing:3148733
).

Thanks to everyone who has posted makes, and has provided feedback on this! The feedback has helped greatly to improve the information regarding this thing, and it is great to hear that this remix has worked out for many folks! Credit for the original designs goes to shocksofmighty and dopesoner930, from which thing thing was modified.

The STEP file is posted for easy remixing. Thanks for posting makes and if you have any issues or thoughts about this, please leave a comment.

===============================================================
Updates

Update 10/16/2020 - cleaned up some of the updates to remove ones that are not as relevant to the current designs, and moved this out of WIP status (which was long overdue).

Update 1/25/2020 - It was reported that the "ender3-bltouch-mount-4b-3mm-lower" version works well on a 2019 Ender3 Pro, with a BL-TOUCH 3.1 Smart (genuine Antclabs) if using it without the springs. Offsets were X -41, Y -10 - Thanks to Scope6666 for this info!

Update 10-10-2018: Added an option for a mount that sets the probe 3mm lower that the original model. If you find the probe needs to be moved down, try this one:
ender3-bltouch-mount-4b-3mm-lower.stl

Update 8-29-2018: I was told that the original mount did not fit the Smart 2. The problem was that the mount was too thick, resulting in not enough space for the smart 2 (it was too low). I modified it by raising the base of the mount where the touch probe will mount, by 3.004mm. Thanks to info from Elchschmied who created the re-mix to correct the problem (
https://www.thingiverse.com/thing:3068970
).
How I Designed This

This was designed with ViaCAD V9

Tags:
auto_bed_leveling 
BLTouch 
bltouch_mount
ender
ender 3
leveling
v3.1
Ender3 Pro