/obj/item/digit/finger
	name = "Finger"
	desc = "One of."
	icon_state = "finger"
	base_icon_state = "finger"
	digit_type = "finger"

/*
/obj/item/digit/finger/desc_chaser(mob/user)
	. = list()
	var/image_src = image2html('modular_septic/images/kidnamedfinger.jpg', user, format = "jpg", sourceonly = TRUE)
	. += "<img src='[image_src]' width=160 height=90>"
*/

/obj/item/digit/finger/thumb
	name = "Thumb Finger"
	digit_type = "thumb"

/obj/item/digit/finger/index
	name = "Index Finger"
	digit_type = "index finger"

/obj/item/digit/finger/middle
	name = "Middle Finger"
	digit_type = "middle finger"

/obj/item/digit/finger/ring
	name = "Ring Finger"
	digit_type = "ring finger"

/obj/item/digit/finger/pinky
	name = "Pinky Finger"
	digit_type = "pinky finger"

/*
/mob/living/carbon/human/desc_chaser(mob/user)
	. = list()
	if(HAS_TRAIT(src, TRAIT_FRAGGOT))
		var/obscured = check_obscured_slots()
		if(!(obscured & ITEM_SLOT_NECK))
			if(!wear_neck)
				var/image_src = image2html('modular_pod/icons/beast.jpg', user, format = "jpg", sourceonly = TRUE)
				. += "<img src='[image_src]' width=63 height=70>"
*/
