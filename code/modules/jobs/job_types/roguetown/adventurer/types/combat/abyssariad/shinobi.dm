/////////////////////////////////////////////////////Abyssariad Pattern for Combat Skills/////////////////////////////////////////////////////////
//'Civilian/Low Abyssanctum' Combat Roles - 3 LEVELS MAX in Combat Skill (Normal) - Many reasons. Mostly religious and Finantial.				//
//'Zamurai/High Abyssanctum' Combat Roles - 4 lEVELS MAX in Combat Skill (Rare) - Plenty of Reasons. Leading religious and Demon-slaying.		//
//'Champion' Combat Roles - 5 LEVELS MAX in Combat SKill (Unique) - Little Reason to go to Rockhill besides Royal Expedition/Rockhill's Captain.//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/datum/advclass/combat/abyssariad/shinobi //Civilian role. Ashigarus or former (low-ranking) monks takes this role.
	name = "Shinobi"
	tutorial = "The military or former monks convert agents of a Daimyo or a clan who operates in secrecy, using stealth, \
	disguise and deception as tool. Knowledged in poison, Shinobis steals battle plans and assassinates \
	important political figures. Differently of Imperial Assassins or Rogues, the Shinobis still have concepts \
	of loyalty to Abyssal Tide's honor."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		//humen - need to settle Heartfeltean culture on this one.
		"Changeling",
		"Skylancer",
		"Ogrun",
		"Undine"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/abyssariad/shinobi
	category_tags = list(CTAG_ADVENTURER)
	pickprob = 100

/datum/outfit/job/roguetown/adventurer/abyssariad/shinobi/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 5)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/traps, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/engineering, 3, TRUE) //Shinobis produces bombs.
	if(prob(70))
		beltl = /obj/item/clothing/gloves/roguetown/leather
	else
		beltl = /obj/item/clothing/gloves/roguetown/fingerless
	backl = /obj/item/storage/backpack/rogue/satchel/ninja
	neck = /obj/item/clothing/neck/roguetown/gorget
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/khudagach
	pants = /obj/item/clothing/under/roguetown/trou/leather/shinobizubon
	shoes = /obj/item/clothing/shoes/roguetown/boots/jikatabi/shinobi
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/hankyu
	belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho/ninja
	if(prob(40))
		beltl = /obj/item/rogueweapon/knife/steel/tanto
	else
		beltl = /obj/item/rogueweapon/knife/kaiken

	if(H.dna.species.name == "Undine")
		to_chat(H, "<span class='warning'>Living in the Fog island's waterways, I've been trained and fed by the many Abyssariad monks. From their will, I am a branch of their skills.")
		var/TMNT = pickweight(list("Donatello" = 1, "Leonardo" = 1, "Michelangelo" = 1, "Raphael" = 1)) // is this a reference...?
		H.become_blind("TRAIT_GENERIC")
		pants = /obj/item/clothing/under/roguetown/kaizoku/tribal
		armor = /obj/item/clothing/suit/roguetown/armor/leather/splint/ninjakappa
		switch(TMNT) //I'm fucking autistic
			if("Donatello")
				mask = /obj/item/clothing/mask/rogue/kaizoku/eyeband/donatello
				backr = /obj/item/rogueweapon/polearm/woodstaff/quarterstaff/bostaff
				H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE) //worst weapon, good skill.
			if("Michelangelo")
				mask = /obj/item/clothing/mask/rogue/kaizoku/eyeband/michelangelo
				beltr = /obj/item/rogueweapon/flail/nunchaku
				beltl = /obj/item/rogueweapon/flail/nunchaku
				H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
			if("Raphael")
				mask = /obj/item/clothing/mask/rogue/kaizoku/eyeband/raphael
				beltr = /obj/item/rogueweapon/knife/hunting/sai
				beltl = /obj/item/rogueweapon/knife/hunting/sai
			if("Leonardo")
				mask = /obj/item/clothing/mask/rogue/kaizoku/eyeband/leonardo
				beltr = /obj/item/rogueweapon/sword/short/wakizashi
				beltl = /obj/item/rogueweapon/sword/short/wakizashi
	else
		head = /obj/item/clothing/head/roguetown/shinobi_zukin
		pants = /obj/item/clothing/under/roguetown/trou/leather/shinobizubon
		shirt = /obj/item/clothing/suit/roguetown/shirt/looseshirt/shinobi
		belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho/ninja
		armor = /obj/item/clothing/suit/roguetown/armor/leather/hide/shozoku
		beltr = /obj/item/quiver/arrows
		beltl = /obj/item/rogueweapon/knife/kaiken
		backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/hankyu

		ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
		H.change_stat("perception", 1)
		H.change_stat("speed", 3)
		H.change_stat("constitution", 1)
	H.cure_blind("TRAIT_GENERIC")
