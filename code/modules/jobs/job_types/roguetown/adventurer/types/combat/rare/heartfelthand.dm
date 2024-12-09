/datum/advclass/combat/heartfelthand
	name = "Hand of Heartfelt"
	tutorial = "You serve your lord as the royal hand, taking care of all diplomatic actions in your relm. \
	maybe one day you will become lord too, if you and your people manage to recover what is lost."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list("Humen, Kitsune, Oni, Tengu")
	outfit = /datum/outfit/job/roguetown/adventurer/heartfelthand
	maximum_possible_slots = 1
	min_pq = 1
	pickprob = 50
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/heartfelthand/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/looseshirt
	belt = /obj/item/storage/belt/rogue/leather/black
	shoes = /obj/item/clothing/shoes/roguetown/nobleboot/gutal
	pants = /obj/item/clothing/under/roguetown/tobi/random
	neck = /obj/item/clothing/neck/roguetown/gorget
	armor = /obj/item/clothing/suit/roguetown/armor/heartfelt/hand/kaizoku
	if(H.gender == FEMALE)
		armor = /obj/item/clothing/suit/roguetown/armor/heartfelt/hand/kaizoku/female
	beltr = /obj/item/storage/belt/rogue/pouch/coins/rich
	gloves = /obj/item/clothing/gloves/roguetown/leather/abyssal/black
	beltl = /obj/item/rogueweapon/sword/sabre/piandao/dec
	beltr = /obj/item/scomstone
	backr = /obj/item/storage/backpack/rogue/satchel/heartfelt
	mask = /obj/item/clothing/mask/rogue/spectacles/golden
	neck = /obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("perception", 2)
		H.change_stat("intelligence", 3)
	ADD_TRAIT(H, TRAIT_SEEPRICES, type)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KAIZOKU, TRAIT_GENERIC)  //Cultural Trait. Must not be considered a 'buff' or 'debuff'.