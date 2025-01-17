/obj/item/hand_labeler
	name = "hand labeler"
	desc = ""
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "labeler0"
	item_state = "flight"
	var/label = null
	var/labels_left = 30
	var/mode = 0

/obj/item/hand_labeler/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is pointing [src] at [user.p_them()]self. [user.p_theyre(TRUE)] going to label [user.p_them()]self as a suicide!</span>")
	labels_left = max(labels_left - 1, 0)

	var/old_real_name = user.real_name
	user.real_name += " (suicide)"
	// no conflicts with their identification card
	for(var/atom/A in user.GetAllContents())
		if(istype(A, /obj/item/card/id))
			var/obj/item/card/id/their_card = A

			// only renames their card, as opposed to tagging everyone's
			if(their_card.registered_name != old_real_name)
				continue

			their_card.registered_name = user.real_name
			their_card.update_label()

	// NOT EVEN DEATH WILL TAKE AWAY THE STAIN
	user.mind.name += " (suicide)"

	mode = 1
	icon_state = "labeler[mode]"
	label = "suicide"

	return OXYLOSS

/obj/item/hand_labeler/afterattack(atom/A, mob/user,proximity)
	. = ..()
	if(!proximity)
		return
	if(!mode)	//if it's off, give up.
		return

	if(!labels_left)
		to_chat(user, "<span class='warning'>No labels left!</span>")
		return
	if(!label || !length(label))
		to_chat(user, "<span class='warning'>No text set!</span>")
		return
	if(length(A.name) + length(label) > 64)
		to_chat(user, "<span class='warning'>Label too big!</span>")
		return
	if(ismob(A))
		to_chat(user, "<span class='warning'>I can't label creatures!</span>") // use a collar
		return

	user.visible_message("<span class='notice'>[user] labels [A] as [label].</span>", \
						"<span class='notice'>I label [A] as [label].</span>")
	A.name = "[A.name] ([label])"
	labels_left--


/obj/item/hand_labeler/attack_self(mob/user)
	if(!user.IsAdvancedToolUser())
		to_chat(user, "<span class='warning'>I don't have the dexterity to use [src]!</span>")
		return
	mode = !mode
	icon_state = "labeler[mode]"
	if(mode)
		to_chat(user, "<span class='notice'>I turn on [src].</span>")
		//Now let them chose the text.
		var/str = copytext(reject_bad_text(input(user,"Label text?","Set label","")),1,MAX_NAME_LEN)
		if(!str || !length(str))
			to_chat(user, "<span class='warning'>Invalid text!</span>")
			return
		label = str
		to_chat(user, "<span class='notice'>I set the text to '[str]'.</span>")
	else
		to_chat(user, "<span class='notice'>I turn off [src].</span>")

/obj/item/hand_labeler/attackby(obj/item/I, mob/user, params)
	..()
	if(istype(I, /obj/item/hand_labeler_refill))
		to_chat(user, "<span class='notice'>I insert [I] into [src].</span>")
		qdel(I)
		labels_left = initial(labels_left)	//Yes, it's capped at its initial value

/obj/item/hand_labeler_refill
	name = "hand labeler paper roll"
	icon = 'icons/obj/bureaucracy.dmi'
	desc = ""
	icon_state = "labeler_refill"
	item_state = "electropack"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
