use <../../includes/PseudoMakeMeKeyCapProfiles/Choc_Chicago_Steno_Thumb.scad>;

function name2id_thumb(key) =
  key == "T1"    ?  2 :
  key == "T15"   ?  3 :
  key == "T0"    ? 15 :
  key == "T015"  ? 16 :
  key == "T02"   ? 17 :
  key == "T0175" ? 18 :
  key == "TW15"  ? 19 :
  key == "TW015" ? 20 :
  key == "R2L"   ?  0 :
  key == "R3L"   ?  1 :
  -1;

module thumb_key(key="T1", homing=false) {
  keyID = name2id_thumb(key);

  if (keyID < 0)
    assert(false, str("invalid CS thumb key ID: ", key));

  keycap(keyID   = keyID, //change profile refer to KeyParameters Struct
	 cutLen  = 0, //Don't change. for chopped caps
	 Stem    = true, //tusn on shell and stems
	 StemRot = 0, //change stem orientation by deg
	 Dish    = true, //turn on dish cut
	 Stab    = 0,
	 visualizeDish = false, // turn on debug visual of Dish
	 crossSection  = false, // center cut to check internal
	 homeDot = false, //turn on homedots
	 Legends = false
	 );
}

function lookup_thumb_sculpt(key) = XAngleSkew(name2id_thumb(key));

thumb_key();
