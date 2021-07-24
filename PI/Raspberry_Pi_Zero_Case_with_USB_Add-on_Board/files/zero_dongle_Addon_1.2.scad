// ----------------------------------------------
// Thing: Raspberry Pi Zero USB Dongle Case
// Author: Petr Ptacek
// Last updte: 12/22/2017
// License: Attribution-ShareAlike (CC BY-SA 3.0)
// 
// Updates:
// 07/23/2018 Blaine McDonnell blaine@armoin.com
//      Updated Model to support
//          Bottom and side Header Options
//          RC522 PN 0006 [Uses really short M2x2 Screws or adhesive]
//              Recommend using a thing RF blocking shield between the Pi and MFRC        
//          USB-A Addon Board v1.1
//              Shifted Back the USB Support, Increased Height and reduced Post Height
//          Increased the micro USB width
//      Uses M2.5x10 Screws
// ----------------------------------------------

$fa = 2;
$fs = 0.5;
inch = 25.4;
bit = 0.01;
inf = 1e3;

extrusion_w = 0.5;
extrusion_h = 0.2;
fit = 0.5; 

zero_w = 30;
zero_l = 65;
zero_t = 2.5; //2.1
zero_corner_r = 3;
zero_hole_r = 3.5;

insulation_t = 0.1;

usb_t = 4.5;
usb_w = 12; 
usb_o = 6; 
usb_catch_l = 9; 
usb_catch_h1 = 1; 
usb_catch_h2 = 0.5; 
usb_catch_w = usb_w + 2;

case_horizontal_t = 2*extrusion_w;
case_vertical_t = 4*extrusion_w;
case_bottom_h = zero_t + insulation_t + usb_t;
case_top_h = 3.5;

hdmi_h = 3.5;
hdmi_w = 11.7; 
hdmi_o = 12.4;

micro_usb_h = 3;
micro_usb_w = 8.5; 
micro_usb_o1 = 41;
micro_usb_o2 = 54.1;

sd_h = 1.5;
sd_w = 13;
sd_o = 16.9;

sd_relieve_o = 1.6;
sd_relieve_r = 3;
sd_relieve_s = 2.3;

camera_h = 1.5;
camera_w = 17.5;
camera_o = 0;

led_di = 2;
led_do = led_di + 4*extrusion_w;
led_lo = 60;
led_wo = 7.2;

header_l = 52.2;
header_w = 6;
header_o = zero_w - 3.5;

screw_tap_di = 0.0743 * inch + fit/2;
screw_tap_do = screw_tap_di + 2*case_vertical_t;

screw_hole_di = 0.0930 * inch + fit; 
screw_hole_do = screw_hole_di + 2*case_vertical_t;

screw_spacer_h = insulation_t + usb_t - 1.6;
screw_head_d = 0.167 * inch + fit;
screw_head_h = 1.7; //was 1.6

/* Micro MFRC Reader */
mfrc_hole_di = 0.050 * inch + fit; //.0920
mfrc_hole_do = mfrc_hole_di + 2;
mfrc_hole_r = 2;
mfrc_l = 34; //35.1
mfrc_w = 25.7; //24.7
mfrc_screw_spacer_h = .5;
module rsquare(l, w, r, o = 0) {
    offset(r = o)
        hull()
            for (x = [-l/2+r, l/2-r])
                for (y = [-w/2+r, w/2-r])
                    translate([x, y])
                        circle(r = r);
}

module rbox(l, w, r, o, h) {
    linear_extrude(height = h)
        rsquare(l, w, r, o);
}

module shell(hi) {
    difference() {
        union() {
            translate([0, 0, -hi])
                rbox(zero_l, zero_w, zero_corner_r, case_vertical_t + fit/2, hi);
            translate([0, 0, -hi])
                hull() {
                    rbox(zero_l, zero_w, zero_corner_r, case_vertical_t + fit/2, bit);
                    translate([0, 0, -case_horizontal_t])
                        rbox(zero_l, zero_w, zero_corner_r, case_vertical_t - case_horizontal_t + fit/2, bit);
                }
        }
        translate([0, 0, -hi + bit])
            rbox(zero_l, zero_w, zero_corner_r, fit/2, hi);
    }
}

module cylinders(l, w, r, h) {
    for (x = [-l/2, l/2])
        for (y = [-w/2, w/2])
            translate([x, y])
                cylinder(r = r, h = h, center = true);
}

module sd_relieve() {
    translate([-zero_l/2 - case_vertical_t - sd_relieve_o, -zero_w/2 + sd_o, sd_h/2])
        scale([1, sd_relieve_s, 1])
            sphere(r = sd_relieve_r);
}

module bottom(has_header_hole = false,has_side_header_hole = false) {
    difference() {
        union() {
            shell(case_bottom_h);
            translate([zero_l/2 - usb_o - usb_catch_l, 0, -case_bottom_h])
                cube([2*usb_catch_l, usb_catch_w, usb_catch_h2], center = true);
            translate([zero_l/2 - usb_catch_l/2 - usb_o, 0, -case_bottom_h + usb_catch_h2/2])
                hull() {
                    cube([usb_catch_l, usb_catch_w, bit], center = true);
                    translate([0, 0, usb_catch_h1])
                        cube([usb_catch_l - 2*usb_catch_h1, usb_catch_w, bit], center = true);
                }
            translate([0, 0, -case_bottom_h + screw_spacer_h/2])
                cylinders(zero_l - 2*zero_hole_r, zero_w - 2*zero_hole_r, screw_hole_do/2, screw_spacer_h);
        }            
        translate([0, 0, -case_bottom_h + screw_spacer_h/2])
            cylinders(zero_l - 2*zero_hole_r, zero_w - 2*zero_hole_r, screw_hole_di/2, inf);
        translate([0, 0, +screw_head_h/2 - case_bottom_h - case_horizontal_t - bit])
            cylinders(zero_l - 2*zero_hole_r, zero_w - 2*zero_hole_r, screw_head_d/2, screw_head_h);
        translate([zero_l/2 + case_vertical_t/2, 0, -case_bottom_h + case_bottom_h/2])
            cube([2*case_vertical_t, usb_w + fit, case_bottom_h], center = true);
        sd_relieve();
    if (has_header_hole)
       rotate([180,0,0])
       translate([0, -header_o + zero_w/2, 0])
           cube([header_l, header_w, inf], center = true);
    if (has_side_header_hole)
       rotate([0,0,0])
       translate([0, 3+zero_w/2, 0])
           cube([header_l, header_w, inf], center = true);
    }
}


module mfrc() {
    difference() {
        union() {
           translate([-5, 0, -case_bottom_h + mfrc_screw_spacer_h/2])
                cylinders(mfrc_l - mfrc_hole_r, mfrc_w - 2*mfrc_hole_r, mfrc_hole_do/2, mfrc_screw_spacer_h);
        }
        translate([-5, 0, -case_bottom_h + mfrc_screw_spacer_h/2])
            cylinders(mfrc_l - mfrc_hole_r, mfrc_w - 2*mfrc_hole_r, mfrc_hole_di/2, mfrc_screw_spacer_h);
    }
    
    
}

module top(has_header_hole = false) {
    difference() {
        union() {
            shell(case_top_h);
            translate([0, 0, -case_top_h/2])
                cylinders(zero_l - 2*zero_hole_r, zero_w - 2*zero_hole_r, screw_tap_do/2, case_top_h);
            translate([led_lo - zero_l/2, -led_wo + zero_w/2, -case_top_h - 1])
                cylinder(d = led_do, h = case_top_h);    
        }        
        translate([0, 0, -case_top_h/2])
            cylinders(zero_l - 2*zero_hole_r, zero_w - 2*zero_hole_r, screw_tap_di/2, case_top_h);
        translate([-zero_l/2 - case_vertical_t/2, -sd_o + zero_w/2, -sd_h/2 + bit])
            cube([case_vertical_t*2, sd_w, sd_h], center = true);
        translate([zero_l/2 + case_vertical_t/2, 0, -camera_h/2 + bit])
            cube([case_vertical_t*2, camera_w, camera_h], center = true);
        translate([micro_usb_o1 - zero_l/2, zero_w/2, -micro_usb_h/2 + bit])
            cube([micro_usb_w, case_vertical_t*3, micro_usb_h], center = true);
        translate([micro_usb_o2 - zero_l/2, zero_w/2, -micro_usb_h/2 + bit])
            cube([micro_usb_w, case_vertical_t*3, micro_usb_h], center = true);
        translate([hdmi_o - zero_l/2, zero_w/2, -hdmi_h/2 + bit])
            cube([hdmi_w, case_vertical_t*3, hdmi_h], center = true);
        // Hole for led is almost complete, has to be drill out if wanted.
        translate([led_lo - zero_l/2, -led_wo + zero_w/2, -case_top_h - case_horizontal_t + 2*extrusion_h])
            cylinder(d = led_di, h = case_top_h + case_vertical_t);
        // This is optional.
        if (has_header_hole)
            translate([0, -header_o + zero_w/2, 0])
                cube([header_l, header_w, inf], center = true);
        rotate([180, 0, 0])
            sd_relieve();
    }
}

union() {
    bottom(false,false); // (Bottom Header = false , Side Header = false) 
    mfrc();
    //rotate([180, 0, 0])
    //    top(false);  // (Header = false) 
    
}
