//Landmarks and other helpers which speed up the mapping process and reduce the number of unique instances/subtypes of items/turf/ect



/obj/effect/baseturf_helper //Set the baseturfs of every turf in the /area/ it is placed.
	name = "baseturf editor"
	icon = 'icons/effects/mapping_helpers.dmi'
	icon_state = ""

	var/list/baseturf_to_replace
	var/baseturf

	layer = POINT_LAYER

/obj/effect/baseturf_helper/Initialize()
	. = ..()
	return INITIALIZE_HINT_LATELOAD

/obj/effect/baseturf_helper/LateInitialize()
	if(!baseturf_to_replace)
		baseturf_to_replace = typecacheof(list(/turf/open/space,/turf/baseturf_bottom))
	else if(!length(baseturf_to_replace))
		baseturf_to_replace = list(baseturf_to_replace = TRUE)
	else if(baseturf_to_replace[baseturf_to_replace[1]] != TRUE) // It's not associative
		var/list/formatted = list()
		for(var/i in baseturf_to_replace)
			formatted[i] = TRUE
		baseturf_to_replace = formatted

	var/area/our_area = get_area(src)
	for(var/i in get_area_turfs(our_area, z))
		replace_baseturf(i)

	qdel(src)

/obj/effect/baseturf_helper/proc/replace_baseturf(turf/thing)
	var/list/baseturf_cache = thing.baseturfs
	if(length(baseturf_cache))
		for(var/i in baseturf_cache)
			if(baseturf_to_replace[i])
				baseturf_cache -= i
		if(!baseturf_cache.len)
			thing.assemble_baseturfs(baseturf)
		else
			thing.PlaceOnBottom(null, baseturf)
	else if(baseturf_to_replace[thing.baseturfs])
		thing.assemble_baseturfs(baseturf)
	else
		thing.PlaceOnBottom(null, baseturf)



/obj/effect/baseturf_helper/space
	name = "space baseturf editor"
	baseturf = /turf/open/space

/obj/effect/baseturf_helper/asteroid
	name = "asteroid baseturf editor"
	baseturf = /turf/open/floor/plating/asteroid

/obj/effect/baseturf_helper/asteroid/airless
	name = "asteroid airless baseturf editor"
	baseturf = /turf/open/floor/plating/asteroid/airless

/obj/effect/baseturf_helper/asteroid/basalt
	name = "asteroid basalt baseturf editor"
	baseturf = /turf/open/floor/plating/asteroid/basalt

/obj/effect/baseturf_helper/asteroid/snow
	name = "asteroid snow baseturf editor"
	baseturf = /turf/open/floor/plating/asteroid/snow

/obj/effect/baseturf_helper/beach/sand
	name = "beach sand baseturf editor"
	baseturf = /turf/open/floor/plating/beach/sand

/obj/effect/baseturf_helper/beach/water
	name = "water baseturf editor"
	baseturf = /turf/open/floor/plating/beach/water

/obj/effect/baseturf_helper/lava
	name = "lava baseturf editor"
	baseturf = /turf/open/lava/smooth

/obj/effect/baseturf_helper/lava_land/surface
	name = "lavaland baseturf editor"
	baseturf = /turf/open/lava/smooth/lava_land_surface


/obj/effect/mapping_helpers
	icon = 'icons/effects/mapping_helpers.dmi'
	icon_state = ""
	var/late = FALSE

/obj/effect/mapping_helpers/Initialize()
	..()
	return late ? INITIALIZE_HINT_LATELOAD : INITIALIZE_HINT_QDEL


//needs to do its thing before spawn_rivers() is called
INITIALIZE_IMMEDIATE(/obj/effect/mapping_helpers/no_lava)

/obj/effect/mapping_helpers/no_lava
	icon_state = "no_lava"

/obj/effect/mapping_helpers/no_lava/Initialize()
	. = ..()
	var/turf/T = get_turf(src)
	T.flags_1 |= NO_LAVA_GEN_1

//This helper applies components to things on the map directly.
/obj/effect/mapping_helpers/component_injector
	name = "Component Injector"
	late = TRUE
	var/target_type
	var/target_name
	var/component_type

//Late init so everything is likely ready and loaded (no warranty)
/obj/effect/mapping_helpers/component_injector/LateInitialize()
	if(!ispath(component_type,/datum/component))
		CRASH("Wrong component type in [type] - [component_type] is not a component")
	var/turf/T = get_turf(src)
	for(var/atom/A in T.GetAllContents())
		if(A == src)
			continue
		if(target_name && A.name != target_name)
			continue
		if(target_type && !istype(A,target_type))
			continue
		var/cargs = build_args()
		A.AddComponent(arglist(cargs))
		qdel(src)
		return

/obj/effect/mapping_helpers/component_injector/proc/build_args()
	return list(component_type)

/obj/effect/mapping_helpers/component_injector/infective
	name = "Infective Injector"
	icon_state = "component_infective"
	component_type = /datum/component/infective
	var/disease_type

/obj/effect/mapping_helpers/component_injector/infective/build_args()
	if(!ispath(disease_type,/datum/disease))
		CRASH("Wrong disease type passed in.")
	var/datum/disease/D = new disease_type()
	return list(component_type,D)

/obj/effect/mapping_helpers/dead_body_placer
	name = "Dead Body placer"
	late = TRUE
	icon_state = "deadbodyplacer"
	var/bodycount = 2 //number of bodies to spawn

/obj/effect/mapping_helpers/dead_body_placer/LateInitialize()
	var/area/a = get_area(src)
	var/list/trays = list()
	for (var/i in a.contents)
		if (istype(i, /obj/structure/bodycontainer/morgue))
			trays += i
	if(!trays.len)
		log_mapping("[src] at [x],[y] could not find any morgues.")
		return
	for (var/i = 1 to bodycount)
		var/obj/structure/bodycontainer/morgue/j = pick(trays)
		var/mob/living/carbon/human/h = new /mob/living/carbon/human(j, 1)
		h.death()
		for (var/part in h.internal_organs) //randomly remove organs from each body, set those we keep to be in stasis
			if (prob(40))
				qdel(part)
			else
				var/obj/item/organ/O = part
				O.organ_flags |= ORGAN_FROZEN
		j.update_icon()
	qdel(src)


//On Ian's birthday, the hop's office is decorated.
/obj/effect/mapping_helpers/ianbirthday
	name = "Ian's Bday Helper"
	late = TRUE
	icon_state = "iansbdayhelper"
	var/balloon_clusters = 2

/obj/effect/mapping_helpers/ianbirthday/LateInitialize()
//	if(locate(/datum/holiday/ianbirthday) in SSevents.holidays)
//		birthday()
	qdel(src)

/obj/effect/mapping_helpers/ianbirthday/proc/birthday()
	var/area/a = get_area(src)
	var/list/table = list()//should only be one aka the front desk, but just in case...
	var/list/openturfs = list()

	//confetti and a corgi balloon! (and some list stuff for more decorations)
	for(var/thing in a.contents)
		if(istype(thing, /obj/structure/table/reinforced))
			table += thing
		if(isopenturf(thing))
			new /obj/effect/decal/cleanable/confetti(thing)
	//cake + knife to cut it!
	var/turf/food_turf = get_turf(pick(table))
	new /obj/item/kitchen/knife(food_turf)
	var/obj/item/reagent_containers/food/snacks/store/cake/birthday/iancake = new(food_turf)
	iancake.desc = ""
	//some balloons! this picks an open turf and pops a few balloons in and around that turf, yay.
	for(var/i in 1 to balloon_clusters)
		var/turf/clusterspot = pick_n_take(openturfs)
		new /obj/item/toy/balloon(clusterspot)
		var/balloons_left_to_give = 3 //the amount of balloons around the cluster
		var/list/dirs_to_balloon = GLOB.cardinals.Copy()
		while(balloons_left_to_give > 0)
			balloons_left_to_give--
			var/chosen_dir = pick_n_take(dirs_to_balloon)
			var/turf/balloonstep = get_step(clusterspot, chosen_dir)
			var/placed = FALSE
			if(isopenturf(balloonstep))
				var/obj/item/toy/balloon/B = new(balloonstep)//this clumps the cluster together
				placed = TRUE
				if(chosen_dir == NORTH)
					B.pixel_y -= 10
				if(chosen_dir == SOUTH)
					B.pixel_y += 10
				if(chosen_dir == EAST)
					B.pixel_x -= 10
				if(chosen_dir == WEST)
					B.pixel_x += 10
			if(!placed)
				new /obj/item/toy/balloon(clusterspot)
	//remind me to add wall decor!

/obj/effect/mapping_helpers/ianbirthday/admin//so admins may birthday any room
	name = "generic birthday setup"
	icon_state = "bdayhelper"

/obj/effect/mapping_helpers/ianbirthday/admin/LateInitialize()
	birthday()
	qdel(src)


//This is our map object, which just gets placed anywhere on the map. A .dm file is linked to it to set the templates list.
//If there's only one template in the list, it will only pick that (useful for editing parts of maps without editing the WHOLE map)
/obj/effect/landmark/map_load_mark
	name = "map loader landmark"
	var/list/templates //List of templates we're trying to pick from (must be a list, even if there's only one entry)

/obj/effect/landmark/map_load_mark/Initialize()
	. = ..()
	LAZYADD(SSmapping.map_load_marks,src)
