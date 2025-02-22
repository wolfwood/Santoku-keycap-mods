use <../trackpoint_notch.scad>;
include <../settings.scad>;
use <../util/printable.scad>;

use <DES-bindings/sculpted.scad>;

module DES(type="R3"){
  $fn=60;

  if (type == "R2L") {
    mirror([1,0,0]) sculpted_key("R2R");
  } else if (type == "R3L") {
    mirror([1,0,0]) sculpted_key("R3R");
  } else if (type == "R4L") {
    mirror([1,0,0]) sculpted_key("R4R");
  } else {
    sculpted_key(type);
  }
}

module printable(type, other=false, trim=true, noop=false) {
  _printable_choc(angle = 50,
                  surface_contact = 1.5,
                  surface_contact_stem = .75,
                  width = 17.16 + 0.89,
                  stem_depth = 1.4,
                  sculpt_compensate =  -lookup_sculpted_sculpt(type),
                  type=type,
                  other=other,
                  trim=trim,
                  noop=noop)
    children();
}


keycap = "R4";

if (is_undef(keycap)) {
  let(x_spacing = is_list(grid_spacing) ? grid_spacing.x : grid_spacing, y_spacing = is_list(grid_spacing) ? grid_spacing.y : grid_spacing, stagger = is_undef(grid_stagger) ? 0 : grid_stagger ? y_spacing/2 : 0) {
    *translate([0,y_spacing,0]) trackpoint_notch($x=1,$y=-1) DES("R2");
    trackpoint_notch($x=1,$y=1) DES("R3");
    *translate([x_spacing,stagger+y_spacing,0]) trackpoint_notch($x=-1,$y=-1) DES("R2R");
    *translate([x_spacing,stagger,0]) trackpoint_notch($x=-1,$y=1) DES("R3R");
  }
  } else {
  printable(keycap, noop=raw())
    DES(keycap);
}
