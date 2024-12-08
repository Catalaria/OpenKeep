//////////-Additional Information-//////////

/*Mechanical Stat focus 
Advantage: Strength + Intelligence. 
Disadvantage: Low Constitution. Low Perception. 
If you are on your way to balance this, please be wary, this is the statfocus suitable that not only express their lore,
but fits in a unique statspread. So keep this focus unaltered. 
If endurance matters more than Const in stamina purposes, please swap the debuff. This is to portray the nature of the Kitsunes
as having the body of "pursuit predators" - in contrast to humen's persistence hunting.
>>>MAJOR NEED! Please, someone code in a "Felinid"-like system for the Kitsunes, but instead of CUTESY BS, I want 
help to portray Kitsune's bloodthirsty nature. The 'Eldritch Jaw', which is essentially, "wagging_tail" system
for the mouth with opens with a emote (or bite intention).<<<
*/

/mob/living/carbon/human/species/abyssariad/kitsune
	race = /datum/species/abyssariad/kitsune

/datum/species/abyssariad/kitsune
	name = "Kitsune"
	id = "abyssariad"
	desc = "<b>Storm branched Champions</b><br>\
	Molded from Abyssor's tumultuous embrace of storm and will, the Kitsune are a warrior, demiurgic race \
	deeply bonded with honor and Ethos that intertwines with the tempestuous forces of Abyssor, \
	never set on a balance, all Kitsunes are extreme as the storms, with the tendency to be both \
	hermeticly humble and quick tempered, and know for either loving duel for honor's sake \
	- or being the most radical martial pacifists on the planet. Their society almost crumbled \
	during The Bloody Apotheosis, but their bronze-age traditions lives on together with a deep \
	hatred for all things Graggar. Noble souls that, when not belonging to military or clerical jobs, \
	usually partakes in the society's intelligentsia division, usually as scientists, alchemists and astronomers."

	skin_tone_wording = "Championage Branch"

	default_color = "FFFFFF"
	species_traits = list(EYECOLOR,HAIR,FACEHAIR,LIPS,KITSUNE_TONGUE)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	default_features = list("mcolor" = "FFF", "ears" = "Vulp", "tail_human" = "VulpianiV", "kitsune_tongue" = "eldritch")
	use_skintones = 1
	possible_ages = list(AGE_IMMORTAL) //Abyssariads are Immortal. However, if they become stray from Abyssor - they suffer severe dementia, and after some decades, become Dais.
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = NONE
	liked_food = MEAT
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	limbs_icon_m = 'icons/roguetown/kaizoku/abyssariad_bodies/male/mt_kit.dmi'
	limbs_icon_f = 'icons/roguetown/kaizoku/abyssariad_bodies/female/ft_kit.dmi'
	dam_icon = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	hairyness = ""
	mutant_bodyparts = list("ears","tail_human", "kitsune_tongue")
	use_f = FALSE
	soundpack_m = /datum/voicepack/male/abyssariad
	soundpack_f = /datum/voicepack/female/abyssariad
	offset_features = list(OFFSET_ID = list(0,1), OFFSET_GLOVES = list(0,1), OFFSET_WRISTS = list(0,1),\
	OFFSET_CLOAK = list(0,1), OFFSET_FACEMASK = list(0,1), OFFSET_HEAD = list(0,1), \
	OFFSET_FACE = list(0,1), OFFSET_BELT = list(0,1), OFFSET_BACK = list(0,1), \
	OFFSET_NECK = list(0,1), OFFSET_MOUTH = list(0,1), OFFSET_PANTS = list(0,1), \
	OFFSET_SHIRT = list(0,1), OFFSET_ARMOR = list(0,1), OFFSET_HANDS = list(0,1), OFFSET_UNDIES = list(0,1), \
	OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,1), OFFSET_WRISTS_F = list(0,1), OFFSET_HANDS_F = list(0,1), \
	OFFSET_CLOAK_F = list(0,1), OFFSET_FACEMASK_F = list(0,0), OFFSET_HEAD_F = list(0,0), \
	OFFSET_FACE_F = list(0,0), OFFSET_BELT_F = list(0,1), OFFSET_BACK_F = list(0,0), \
	OFFSET_NECK_F = list(0,0), OFFSET_MOUTH_F = list(0,0), OFFSET_PANTS_F = list(0,1), \
	OFFSET_SHIRT_F = list(0,1), OFFSET_ARMOR_F = list(0,1), OFFSET_UNDIES_F = list(0,1))
    // Lore explanation for stats:
    // Qualities: +Dense muscles ; higher fast-twitch fiber
    // =>Disadvantage: -Lower Stationary Acuity; They are better at noticing movements, bad at noticing stationary objects. Bad with bows by nature. Foxes have that IRL because of nightvision. At least they have more reason to have it than Dark Elves.
	// -Low fat mass, high muscle mass. Streamlined body structure that minimizes resistance and maximizes intense muscular movements.
	specstats = list("strength" = 1, "perception" = -2, "intelligence" = 2, "constitution" = -1, "endurance" = 0, "speed" = 1, "fortune" = 0) // 1-2+2-1+0 = +1 ; Elves have +2, paying off for additional +1 str
	specstats = list("strength" = 1, "perception" = -2, "intelligence" = 2, "constitution" = -1, "endurance" = 0, "speed" = 1, "fortune" = 0) // Don't even bother making each gender different. Abyssariads are equals in championage.
	enflamed_icon = "widefire"
	mutanttongue = /obj/item/organ/tongue/kitsune
	minrace_pq = 0

	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/tongue/kitsune,
		/datum/customizer/organ/tongue/kitsune
	)
	body_markings = list(
		/datum/body_marking/tonage,
	)

/datum/species/abyssariad/kitsune/get_span_language(datum/language/message_language)
	if(!message_language)
		return
	if(message_language.type == /datum/language/abyssal)
		return list(SPAN_ABYSSAL)
	return message_language.spans

/datum/species/abyssariad/kitsune/check_roundstart_eligible()
	return TRUE


/datum/species/abyssariad/kitsune/get_skin_list()
	return sortList(list(
		"Oathbound Muqian" = SKIN_COLOR_OATHBOUND_MUQIAN,
		"Oathbound Kaizoku" = SKIN_COLOR_OATHBOUND_KAIZOKU,
		"Oathbound Shuhen" = SKIN_COLOR_OATHBOUND_SHUHEN,
		"Oathbound Linyou" = SKIN_COLOR_OATHBOUND_LINYOU,
		"Oathbound Dustwalker" = SKIN_COLOR_OATHBOUND_DUSTWALKER,
		"Warpcaster Muqian" = SKIN_COLOR_WARPCASTER_MUQIAN,
		"Warpcaster Kaizoku" = SKIN_COLOR_WARPCASTER_KAIZOKU,
		"Warpcaster Shuhen" = SKIN_COLOR_WARPCASTER_SHUHEN,
		"Warpcaster Linyou" = SKIN_COLOR_WARPCASTER_LINYOU,
		"Warpcaster Dustwalker" = SKIN_COLOR_WARPCASTER_DUSTWALKER,
	))

/datum/species/abyssariad/kitsune/get_hairc_list()
	return sortList(list(
	"blond - pale" = "9d8d6e",
	"blond - dirty" = "88754f",
	"blond - drywheat" = "d5ba7b",
	"blond - strawberry" = "c69b71",

	"brown - mud" = "362e25",
	"brown - oats" = "584a3b",
	"brown - grain" = "58433b",
	"brown - soil" = "48322a",

	"black - oil" = "181a1d",
	"black - cave" = "201616",
	"black - rogue" = "2b201b",
	"black - midnight" = "1d1b2b",

	"red - berry" = "48322a",
	"red - wine" = "82534c",
	"red - sunset" = "82462b",
	"red - blood" = "822b2b",
	
	"white - platinum" = "f8f3f3",
	"white - silver" = "ddddc8",
	"white - oceanid" = "141f1f"

	))

/datum/species/abyssariad/kitsune/random_name(gender,unique,lastname)
	var/randname
	if(unique)
		if(gender == MALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/abyssariad/abyssnorm.txt") )
				if(!findname(randname))
					break
		if(gender == FEMALE)
			for(var/i in 1 to 10)
				randname = pick( world.file2list("strings/rt/names/abyssariad/abyssnorf.txt") )
				if(!findname(randname))
					break
	else
		if(gender == MALE)
			randname = pick( world.file2list("strings/rt/names/abyssariad/abyssnorm.txt") )
		if(gender == FEMALE)
			randname = pick( world.file2list("strings/rt/names/abyssariad/abyssnorf.txt") )
	randname += " Clanless"
	return randname

/datum/species/abyssariad/kitsune/random_surname()
	return " [pick(world.file2list("strings/rt/names/abyssariad/abyssnorm.txt.txt"))]"

/datum/species/abyssariad/kitsune/get_accent_list()
	return strings("japanese_replacement.json", "japanese")

/datum/species/abyssariad/kitsune/can_wag_tongue(mob/living/carbon/human/H)
	return ("kitsune_tongue" in mutant_bodyparts) || ("waggingkitsune_tongue" in mutant_bodyparts)

/datum/species/abyssariad/kitsune/is_wagging_tongue(mob/living/carbon/human/H)
	return ("waggingkitsune_tongue" in mutant_bodyparts)

/datum/species/abyssariad/kitsune/start_wagging_tongue(mob/living/carbon/human/H)
	if("kitsune_tongue" in mutant_bodyparts)
		mutant_bodyparts -= "kitsune_tongue"
		mutant_bodyparts |= "waggingkitsune_tongue"
	H.update_body()

/datum/species/abyssariad/kitsune/stop_wagging_tongue(mob/living/carbon/human/H)
	if("waggingkitsune_tongue" in mutant_bodyparts)
		mutant_bodyparts -= "waggingkitsune_tongue"
		mutant_bodyparts |= "kitsune_tongue"
	H.update_body()


/*
/datum/species/human/felinid/on_species_gain(mob/living/carbon/C, datum/species/old_species, pref_load)
	if(ishuman(C))
		var/mob/living/carbon/human/H = C
		if(!pref_load)			//Hah! They got forcefully purrbation'd. Force default felinid parts on them if they have no mutant parts in those areas!
			if(H.dna.features["tail_human"] == "None")
				H.dna.features["tail_human"] = "Cat"
			if(H.dna.features["ears"] == "None")
				H.dna.features["ears"] = "Cat"
		if(H.dna.features["ears"] == "Cat")
			var/obj/item/organ/ears/cat/ears = new
			ears.Insert(H, drop_if_replaced = FALSE)
		else
			mutantears = /obj/item/organ/ears
		if(H.dna.features["tail_human"] == "Cat")
			var/obj/item/organ/tail/cat/tail = new
			tail.Insert(H, drop_if_replaced = FALSE)
		else
			mutanttail = null
	return ..()
*/
