
function scr_initialize_custom() {

	// These are the new variables that are being read, for the new creation
	// They will also have to be loaded and saved
	// Worry about that later
    // this has starting XP for marines !

	/*
	chapter="Unnamed";
	chapter_string="Unnamed";
	icon=1;icon_name="da";custom=0;
	founding=1;
	fleet_type=1;
	strength=5;cooperation=5;
	purity=5;stability=5;
	var i;i=-1;repeat(6){i+=1;adv[i]="";adv_num[i]=0;dis[i]="";dis_num[i]=0;}
	homeworld="Temperate";homeworld_name=scr_star_name();
	recruiting="Death";recruiting_name=scr_star_name();
	flagship_name=scr_ship_name("imperial");
	recruiting_exists=1;
	homeworld_exists=1;
	homeworld_rule=1;
	aspirant_trial="Blood Duel";
	discipline="default";

	battle_cry="For the Emperor";

	main_color=1;secondary_color=1;trim_color=1;
	pauldron2_color=1;pauldron_color=1;// Left/Right pauldron
	lens_color=1;weapon_color=1;col_special=0;trim=1;

	hapothecary=scr_marine_name();
	hchaplain=scr_marine_name();
	clibrarian=scr_marine_name();
	fmaster=scr_marine_name();
	recruiter=scr_marine_name();
	admiral=scr_marine_name();

	equal_specialists=0;
	load_to_ships=2;

	successors=0;

	mutations=0;mutations_selected=0;
	preomnor=0;voice=0;doomed=0;lyman=0;omophagea=0;ossmodula=0;membrane=0;
	zygote=0;betchers=0;catalepsean=0;secretions=0;occulobe=0;mucranoid=0;

	disposition[0]=0;
	disposition[1]=0;// Prog
	disposition[2]=0;// Imp
	disposition[3]=0;// Mech
	disposition[4]=0;// Inq
	disposition[5]=0;// Ecclesiarchy
	disposition[6]=0;// Astartes
	disposition[7]=0;// Reserved

	chapter_master_name=scr_marine_name();
	chapter_master_melee=1;
	chapter_master_ranged=1;
	chapter_master_specialty=2;
	*/










	progenitor=obj_creation.founding;
	successors=obj_creation.successors;
	homeworld_rule=obj_creation.homeworld_rule;


	// Initializes all of the marine/vehicle/ship variables for the chapter.

	techs=20;epistolary=5;apothecary=6;codiciery=6;lexicanum=10;terminator=30;veteran=70;
	second=100;third=100;fourth=100;fifth=100;sixth=100;seventh=100;eighth=100;ninth=100;tenth=100;
	assault=20;siege=0;devastator=20;

	recruit_trial=obj_creation.aspirant_trial;

	// show_message(instance_number(obj_controller));

	global.chapter_name=obj_creation.chapter;
	global.founding=obj_creation.founding;
	global.founding_secret="";
	global.game_seed=floor(random(99999999))+string_to_integer(global.chapter_name)+string_to_integer(obj_creation.chapter_master_name);

	use_custom_icon=0;
	if (string_count("custom",obj_creation.icon_name)>0){
	    use_custom_icon=global.game_seed;

	    var ta,na;
	    ta=string(obj_creation.custom_icon)+".png";
	    na=string(global.game_seed)+".png";

	    /* if (file_exists(working_directory + "\icons_save\"+string(ta))){
	        file_copy(working_directory + "\icons\"+string(ta),working_directory + "\icons_save\"+string(na));
	    }*/
	}




	if (progenitor=10){// Pretty sure that's random?
	    var heh;heh=floor(random(17))+1;

	    if (heh=1) then global.founding_secret="Dark Angels";
	    if (heh=2) then global.founding_secret="Emperor's Children";
	    if (heh=3) then global.founding_secret="Iron Warriors";
	    if (heh=4) then global.founding_secret="White Scars";
	    if (heh=5) then global.founding_secret="Space Wolves";
	    if (heh=6) then global.founding_secret="Imperial Fists";
	    if (heh=7) then global.founding_secret="Night Lords";
	    if (heh=8) then global.founding_secret="Blood Angels";
	    if (heh=9) then global.founding_secret="Iron Hands";
	    if (heh=10) then global.founding_secret="World Eaters";
	    if (heh=11) then global.founding_secret="Ultramarines";
	    if (heh=12) then global.founding_secret="Death Guard";
	    if (heh=13) then global.founding_secret="Thousand Sons";
	    if (heh=14) then global.founding_secret="Black Legion";
	    if (heh=15) then global.founding_secret="Word Bearers";
	    if (heh=16) then global.founding_secret="Salamanders";
	    if (heh=17) then global.founding_secret="Raven Guard";
	}




	company_title[0]="";
	var i;i=0;repeat(40){i+=1;company_title[i]=obj_creation.company_title[i];}





	home_name=obj_creation.homeworld_name;obj_creation.restart_home_name=home_name;
	chapter_name=obj_creation.chapter;
	// fortress_name="";
	flagship_name=obj_creation.flagship_name;obj_creation.restart_flagship_name=flagship_name;
	sector_name=scr_sector_name();
	icon=obj_creation.icon;
	icon_name=obj_creation.icon_name;
	man_size=0;
	psy_powers=obj_creation.discipline;

	strin=string(obj_creation.adv[1])+string(obj_creation.adv[2])+string(obj_creation.adv[3])+string(obj_creation.adv[4]);
	strin2=string(obj_creation.dis[1])+string(obj_creation.dis[2])+string(obj_creation.dis[3])+string(obj_creation.dis[4]);

	progenitor_disposition=obj_creation.disposition[1];
	astartes_disposition=obj_creation.disposition[6];
	imperium_disposition=obj_creation.disposition[2];
	guard_disposition=obj_creation.disposition[2];
	inquisition_disposition=obj_creation.disposition[4];
	ecclesiarchy_disposition=obj_creation.disposition[5];
	mechanicus_disposition=obj_creation.disposition[3];
	other1_disposition=0;
	other1="";

	tolerant=0;var o;o=0;repeat(4){o+=1;if (obj_creation.dis[o]="Tolerant") then tolerant=1;adv[o]=obj_creation.adv[o];dis[o]=obj_creation.dis[o];}

	battle_barges=0;
	strike_cruisers=0;
	gladius=0;hunters=0;

	recruiting_type=obj_creation.recruiting;
	aspirant_trial=obj_creation.aspirant_trial;
	recruiting_name=obj_creation.recruiting_name;
	home_type=obj_creation.homeworld;
	home_name=obj_creation.homeworld_name;
	fleet_type=obj_creation.fleet_type;



	// if not custom


		// if not custom


	if (obj_creation.fleet_type!=1){
	    battle_barges=1;
	    strike_cruisers=6;
	    gladius=7;
	    hunters=3;
	    // obj_controller.fleet_type="Fleet";
	}
	if (obj_creation.fleet_type=1){
	    strike_cruisers=8;
	    gladius=7;
	    hunters=3;
	    // obj_controller.fleet_type="Homeworld";
	}

	if (obj_creation.custom=0){
	    if (obj_creation.fleet_type!=1){
	        flagship_name=obj_creation.flagship_name;
	        battle_barges=1;
	        strike_cruisers=6;
	        gladius=7;
	        hunters=3;
			
			if (global.chapter_name="Soul Drinkers") then gladius-=4; strike_cruisers-=3; battle_barges+=1; 
			
			}
	    if (obj_creation.fleet_type=1){
			strike_cruisers=8;
	        gladius=7;
	        hunters=3;
		
	        if (global.chapter_name="Imperial Fists")
	           {
				   flagship_name="Spear of Vengeance";
				   battle_barges+=1;
			   }
	    
		if (global.chapter_name="Crimson Fists")   
	           {
				   flagship_name="Throne's Fury";
				   battle_barges-=1;
				   gladius-=3;
				   strike_cruisers-=4
			   }
		
	        if (global.chapter_name="Dark Angels") then battle_barges+=1;
	    }
	    if (obj_creation.fleet_type=3){
	        if (global.chapter_name="Lamenters"){
	            strike_cruisers=2;
	            gladius=2;
	            hunters=1;
				battle_barges=0;
	        }
	        if (global.chapter_name="Blood Ravens"){
	            battle_barges=1;
	        }
	    }
	    if (global.chapter_name!="Lamenters") and (global.chapter_name!="Doom Benefactors") and (global.chapter_name!="Blood Ravens") then battle_barges+=2;
	}

	var i, v;i=-1;v=0;
	/*repeat(110){i+=1;
	    ship[i]="";ship_owner[i]=0;ship_class[i]="";ship_size[i]=0;
	    ship_leadership[i]=0;ship_hp[i]=0;ship_maxhp[i]=0;ship_location[i]="";ship_shields[i]=0;
	    ship_conditions[i]="";ship_speed[i]=0;ship_turning[i]=0;
	    ship_front_armour[i]=0;ship_other_armour[i]=0;ship_weapons[i]=0;ship_shields[i]=0;
	    ship_wep[i,0]="";ship_wep_facing[i,0]="";ship_wep_condition[i,0]="";
	    ship_wep[i,1]="";ship_wep_facing[i,1]="";ship_wep_condition[i,1]="";
	    ship_wep[i,2]="";ship_wep_facing[i,2]="";ship_wep_condition[i,2]="";
	    ship_wep[i,3]="";ship_wep_facing[i,3]="";ship_wep_condition[i,3]="";
	    ship_wep[i,4]="";ship_wep_facing[i,4]="";ship_wep_condition[i,4]="";
	    ship_wep[i,5]="";ship_wep_facing[i,5]="";ship_wep_condition[i,5]="";
	    ship_capacity[i]=0;ship_carrying[i]=0;ship_contents[i]="";ship_turrets[i]=0;
	}*/

	var ship_names;ship_names="";

	if (battle_barges>=1) then repeat(battle_barges){v+=1;
	    if (flagship_name!="") and (v=1) then ship[v]=flagship_name;
	    if (flagship_name="") or (v>1) then ship[v]=scr_ship_name("imperial");
	    ship_uid[v]=floor(random(99999999))+1;
	    ship_owner[v]=1;ship_class[v]="Battle Barge";ship_size[v]=3;ship_location[v]="home";
	    ship_leadership[v]=100;ship_hp[v]=1200;ship_maxhp[v]=1200;
	    ship_conditions[v]="";ship_speed[v]=20;ship_turning[v]=45;
	    ship_front_armour[v]=6;ship_other_armour[v]=6;ship_weapons[v]=5;ship_shields[v]=12;
	    ship_wep[v,1]="Weapons Battery";ship_wep_facing[v,1]="left";ship_wep_condition[v,1]="";
	    ship_wep[v,2]="Weapons Battery";ship_wep_facing[v,2]="right";ship_wep_condition[v,2]="";
	    ship_wep[v,3]="Thunderhawk Launch Bays";ship_wep_facing[v,3]="special";ship_wep_condition[v,3]="";
	    ship_wep[v,4]="Torpedo Tubes";ship_wep_facing[v,4]="front";ship_wep_condition[v,4]="";
	    ship_wep[v,5]="Bombardment Cannons";ship_wep_facing[v,5]="most";ship_wep_condition[v,5]="";
	    ship_capacity[v]=600;ship_carrying[v]=0;ship_contents[v]="";ship_turrets[v]=3;
	    ship_names+=string(ship[v])+"|";
	}

	repeat(strike_cruisers){v+=1;
	    ship[v]=scr_ship_name("imperial");ship_owner[v]=1;ship_class[v]="Strike Cruiser";ship_size[v]=2;
	    ship_uid[v]=floor(random(99999999))+1;
	    ship_leadership[v]=100;ship_hp[v]=600;ship_maxhp[v]=600;ship_location[v]="home";
	    ship_conditions[v]="";ship_speed[v]=25;ship_turning[v]=90;
	    ship_front_armour[v]=6;ship_other_armour[v]=6;ship_weapons[v]=4;ship_shields[v]=6;
	    ship_wep[v,1]="Weapons Battery";ship_wep_facing[v,1]="left";ship_wep_condition[v,1]="";
	    ship_wep[v,2]="Weapons Battery";ship_wep_facing[v,2]="right";ship_wep_condition[v,2]="";
	    ship_wep[v,3]="Thunderhawk Launch Bays";ship_wep_facing[v,3]="special";ship_wep_condition[v,3]="";
	    ship_wep[v,4]="Bombardment Cannons";ship_wep_facing[v,4]="most";ship_wep_condition[v,4]="";
	    ship_capacity[v]=250;ship_carrying[v]=0;ship_contents[v]="";ship_turrets[v]=1;
	    repeat(5){if (string_count(ship[v],ship_names)!=0) then ship[v]=scr_ship_name("imperial");}
	    ship_names+=string(ship[v])+"|";
	}

	repeat(gladius){v+=1;// Single weapon battery has 25% more damage than the hunter class destroyer
	    ship[v]=scr_ship_name("imperial");ship_owner[v]=1;ship_class[v]="Gladius";ship_size[v]=1;
	    ship_uid[v]=floor(random(99999999))+1;
	    ship_leadership[v]=100;ship_hp[v]=200;ship_maxhp[v]=200;ship_location[v]="home";
	    ship_conditions[v]="";ship_speed[v]=30;ship_turning[v]=90;
	    ship_front_armour[v]=5;ship_other_armour[v]=5;ship_weapons[v]=1;ship_shields[v]=1;
	    ship_wep[v,1]="Weapons Battery";ship_wep_facing[v,1]="most";ship_wep_condition[v,1]="";
	    ship_capacity[v]=100;ship_carrying[v]=0;ship_contents[v]="";ship_turrets[v]=1;
	    repeat(5){if (string_count(ship[v],ship_names)!=0) then ship[v]=scr_ship_name("imperial");}
	    ship_names+=string(ship[v])+"|";
	}

	repeat(hunters){v+=1;
	    ship[v]=scr_ship_name("imperial");ship_owner[v]=1;ship_class[v]="Hunter";ship_size[v]=1;
	    ship_uid[v]=floor(random(99999999))+1;
	    ship_leadership[v]=100;ship_hp[v]=200;ship_maxhp[v]=200;ship_location[v]="home";
	    ship_conditions[v]="";ship_speed[v]=35;ship_turning[v]=90;
	    ship_front_armour[v]=5;ship_other_armour[v]=5;ship_weapons[v]=2;ship_shields[v]=1;
	    ship_wep[v,1]="Torpedoes";ship_wep_facing[v,1]="front";ship_wep_condition[v,1]="";
	    ship_wep[v,2]="Weapons Battery";ship_wep_facing[v,2]="most";ship_wep_condition[v,2]="";
	    ship_capacity[v]=50;ship_carrying[v]=0;ship_contents[v]="";ship_turrets[v]=1;
	    repeat(5){if (string_count(ship[v],ship_names)!=0) then ship[v]=scr_ship_name("imperial");}
	    ship_names+=string(ship[v])+"|";
	}

	var j,f;j=0;f=0;
	repeat(battle_barges+strike_cruisers+gladius+hunters){f+=1;j=0;
	    repeat(30){j+=1;if (ship_uid[f]=ship_uid[j]) and (f!=j) then ship_uid[j]=floor(random(99999999))+1;}
	}







	// :D :D :D
	master_tau=0;master_battlesuits=0;master_kroot=0;master_tau_vehicles=0;
	master_ork_boyz=0;master_ork_nobz=0;master_ork_warboss=0;master_ork_vehicles=0;
	master_heretics=0;master_chaos_marines=0;master_lesser_demons=0;master_greater_demons=0;master_chaos_vehicles=0;
	master_gaunts=0;master_warriors=0;master_carnifex=0;master_synapse=0;master_tyrant=0;master_gene=0;
	master_avatar=0;master_farseer=0;master_autarch=0;master_eldar=0;master_aspect=0;master_eldar_vehicles=0;
	master_necron_overlord=0;master_destroyer=0;master_necron=0;master_wraith=0;master_necron_vehicles=0;master_monolith=0;
	master_special_killed="";

	check_number=5;
	year_fraction=0;// 84 per turn
	if (obj_creation.chapter_year=0) then year=735;
	if (obj_creation.chapter_year!=0) then year=obj_creation.chapter_year;
	millenium=41;

	var company;company=0;
	var techs, epistolary, apothecary, chaap, codiciery, lexicanum, terminator, veteran, whirlwind;
	var second, third, fourth, fifth, sixth, seventh, eighth, ninth, tenth;
	var assult,siege;temp1=0;temp2=0;
	var size_relative, k, temp1, temp2, i, v, t;k=0;i=0;v=0;
	techs=20;epistolary=4;apothecary=6;codiciery=6;lexicanum=10;terminator=10;veteran=89;
	second=100;third=100;fourth=100;fifth=100;sixth=100;seventh=100;eighth=100;ninth=100;tenth=100;
	assault=20;siege=0;devastator=20;chaap=1;

	whirlwind=4;

	specials=0;firsts=0;seconds=0;thirds=0;fourths=0;fifths=0;
	sixths=0;sevenths=0;eighths=0;ninths=0;tenths=0;

	strin=obj_creation.adv[1]+obj_creation.adv[2]+obj_creation.adv[3]+obj_creation.adv[4];
	strin2=obj_creation.dis[1]+obj_creation.dis[2]+obj_creation.dis[3]+obj_creation.dis[4];

	preomnor=obj_creation.preomnor;voice=obj_creation.voice;doomed=obj_creation.doomed;lyman=obj_creation.lyman;omophagea=obj_creation.omophagea;
	ossmodula=obj_creation.ossmodula;membrane=obj_creation.membrane;zygote=obj_creation.zygote;betchers=obj_creation.betchers;
	catalepsean=obj_creation.catalepsean;secretions=obj_creation.secretions;occulobe=obj_creation.occulobe;mucranoid=obj_creation.mucranoid;

	/*techs=20;epistolary=5;apothecary=6;codiciery=6;lexicanum=10;terminator=30;veteran=30;
	second=9;third=9;fourth=9;fifth=9;sixth=9;seventh=9;eighth=9;ninth=9;tenth=10;
	assault=2;siege=0;devastator=2;*/

	var chapter_option,o,psyky;psyky=0;

	o=0;chapter_option=0;repeat(4){o+=1;if (obj_creation.adv[o]="Tech-Brothers") then chapter_option=1;}if (chapter_option=1){techs+=10;tenth-=10;}
	o=0;chapter_option=0;repeat(4){o+=1;if (obj_creation.adv[o]="Melee Enthusiasts") then chapter_option=1;}if (chapter_option=1){assault=30;}
	o=0;chapter_option=0;repeat(4){o+=1;if (obj_creation.adv[o]="Siege Masters") then chapter_option=1;}if (chapter_option=1) then siege=1;
	o=0;chapter_option=0;repeat(4){o+=1;if (obj_creation.adv[o]="Crafters") then chapter_option=1;}if (chapter_option=1){techs+=5;terminator+=5;tenth-=10;}
	o=0;chapter_option=0;repeat(4){o+=1;if (obj_creation.adv[o]="Psyker Abundance") then chapter_option=1;}if (chapter_option=1){tenth-=10;epistolary+=2;codiciery+=3;lexicanum+=5;psyky=1;}
	var intolerant;intolerant=0;
	o=0;chapter_option=0;repeat(4){o+=1;if (obj_creation.dis[o]="Psyker Intolerant") then chapter_option=1;}if (chapter_option=1){epistolary=0;codiciery=0;lexicanum=0;veteran+=10;tenth+=10;intolerant=1;}
	o=0;chapter_option=0;repeat(4){o+=1;if (obj_creation.dis[o]="Sieged") then chapter_option=1;}
	if (chapter_option=1){
	    techs-=10;epistolary-=3;apothecary-=4;codiciery-=3;lexicanum-=5;terminator-=10;veteran-=50;
	    second-=30;third-=30;fourth-=30;fifth-=60;sixth-=60;seventh-=60;eighth-=70;ninth-=70;tenth-=70;// 370
	    assault=10;siege=0;devastator=10;
	}
	o=0;chapter_option=0;repeat(4){o+=1;if (obj_creation.dis[o]="Tech-Heresy") then chapter_option=1;}if (chapter_option=1){techs-=10;tenth+=1;}
	o=0;chapter_option=0;repeat(4){o+=1;if (obj_creation.adv[o]="Reverent Guardians") then chapter_option=1;}if (chapter_option=1){chaap+=10;tenth-=10;}

	// if (obj_creation.custom>0) or ((global.chapter_name="Doom Benefactors") and (obj_creation.custom=0)){
	if ((progenitor>=1) and (progenitor<=10)) or ((global.chapter_name="Doom Benefactors") and (obj_creation.custom=0)){
	    if (obj_creation.strength<=4) then ninth=0;
	    if (obj_creation.strength<=3) then eighth=0;
	    if (obj_creation.strength<=2) then seventh=0;
	    if (obj_creation.strength<=1) then sixth=0;

	    var bonus_marines,o;bonus_marines=0;o=0;
	    if (obj_creation.strength>5) then bonus_marines=(obj_creation.strength-5)*50;

	    /*repeat(20){
	        if (bonus_marines>=5) and (veteran>0){bonus_marines-=5;veteran+=5;}
	        if (bonus_marines>=5) and (second>0){bonus_marines-=5;second+=5;}
	        if (bonus_marines>=5) and (third>0){bonus_marines-=5;second+=5;}
	        if (bonus_marines>=5) and (fourth>0){bonus_marines-=5;second+=5;}
	        if (bonus_marines>=5) and (fifth>0){bonus_marines-=5;second+=5;}
	        if (bonus_marines>=5) and (sixth>0){bonus_marines-=5;second+=5;}
	        if (bonus_marines>=5) and (seventh>0){bonus_marines-=5;second+=5;}
	        if (bonus_marines>=5) and (eighth>0){bonus_marines-=5;second+=5;}
	        if (bonus_marines>=5) and (ninth>0){bonus_marines-=5;second+=5;}
	        if (bonus_marines>=5) and (tenth>0){bonus_marines-=5;second+=5;}
	    }*/
	}

	if (obj_creation.custom!=0){
	    var bonus_marines,o;bonus_marines=0;o=0;
	    if (obj_creation.strength>5) then bonus_marines=(obj_creation.strength-5)*50;

	    repeat(20){
	        if (bonus_marines>=5) and (veteran>0){bonus_marines-=5;veteran+=5;}
	        if (bonus_marines>=5) and (second>0){bonus_marines-=5;second+=5;}
	        if (bonus_marines>=5) and (third>0){bonus_marines-=5;third+=5;}
	        if (bonus_marines>=5) and (fourth>0){bonus_marines-=5;fourth+=5;}
	        if (bonus_marines>=5) and (fifth>0){bonus_marines-=5;fifth+=5;}
	        if (bonus_marines>=5) and (sixth>0){bonus_marines-=5;sixth+=5;}
	        if (bonus_marines>=5) and (seventh>0){bonus_marines-=5;seventh+=5;}
	        if (bonus_marines>=5) and (eighth>0){bonus_marines-=5;eighth+=5;}
	        if (bonus_marines>=5) and (ninth>0){bonus_marines-=5;ninth+=5;}
	        if (bonus_marines>=5) and (tenth>0){bonus_marines-=5;tenth+=5;}
	    }
	}




		if (global.chapter_name="Salamanders"){veteran+=20;second+=20;third+=20;fourth+=20;fifth+=20;sixth+=20;seventh=0;eighth=0;ninth=0;tenth-=40;}
	// if (global.chapter_name="Salamanders"){veteran+=12;second+=2;third+=2;fourth+=2;fifth+=4;sixth+=4;seventh+=4;eighth=0;ninth=0;}
	if (global.chapter_name="Blood Angels"){chaap=3;apothecary=10;epistolary=6;codiciery=6;lexicanum=8;}
	if (global.chapter_name="Dark Angels"){veteran=0;terminator+=80;}
	if (global.chapter_name="Lamenters"){
	    tenth=0;ninth=0;eighth=0;seventh=0;sixth=0;fifth=0;
	    techs=8;epistolary=6;apothecary=5;codiciery=3;lexicanum=5;terminator=5;veteran+=10;
	}
	if (global.chapter_name="Soul Drinkers"){
		tenth-=38;seventh=0;sixth=40; assault-=10;
		fifth-=20;fourth-=20;third-=20;second-=20;terminator-=5;veteran-=20;
	}
	if (global.chapter_name="Crimson Fists"){
	    veteran+=30;
	}
	if (global.chapter_name="Space Wolves"){
	    veteran+=40;second+=40;third+=40;fourth+=40;fifth+=40;sixth+=40;seventh+=40;eighth+=40;ninth+=40;tenth+=60;
	}
	if (global.chapter_name="Iron Hands"){
	    terminator=0;veteran+=10;
	}
	if (obj_creation.custom=0) and (global.chapter_name!="Iron Hands") and (global.chapter_name!="Doom Benefactors"){
	    if (veteran>=20) and (global.founding=0){veteran-=20;terminator+=20;}
	    if (veteran>=10) and (global.founding!=0) and (global.chapter_name!="Lamenters"){veteran-=10;terminator+=10;}
	    // if (global.chapter_name="Lamenters") then terminator=0;
	    // tenth-=1;
	}




	icon=obj_creation.icon;
	icon_name=obj_creation.icon_name;
	battle_cry=obj_creation.battle_cry;
	home_name=obj_creation.homeworld_name;

	// This needs to be updated
	main_color=obj_creation.main_color;
	secondary_color=obj_creation.secondary_color;
	trim_color=obj_creation.trim_color;
	pauldron2_color=obj_creation.pauldron2_color;
	pauldron_color=obj_creation.pauldron_color;
	lens_color=obj_creation.lens_color;
	weapon_color=obj_creation.weapon_color;
	col_special=obj_creation.col_special;
	trim=obj_creation.trim;
	skin_color=obj_creation.skin_color;

	/*main_color=obj_creation.main_color;
	secondary_color=obj_creation.secondary_color;
	lens_color=obj_creation.lens_color;
	weapon_color=obj_creation.weapon_color;*/

	master_name=obj_creation.chapter_master_name;
	chief_librarian_name=obj_creation.clibrarian;
	high_chaplain_name=obj_creation.hchaplain;
	high_apothecary_name=obj_creation.hapothecary;
	forge_master_name=obj_creation.fmaster;
	lord_admiral_name=obj_creation.admiral;
	recruiter_name=obj_creation.recruiter;

	master_melee=obj_creation.chapter_master_melee;
	master_ranged=obj_creation.chapter_master_ranged;



	company=0;
	// Initialize default marines for loadouts
	i=-1;repeat(101){i+=1;
	    race[100,i]=1;loc[100,i]="";name[100,i]="";role[100,i]="";wep1[100,i]="";bio[100,i]=0;lid[100,i]=0;wid[100,i]=2;spe[100,i]="";
	    wep2[100,i]="";armour[100,i]="";gear[100,i]="";mobi[100,i]="";chaos[100,i]=0;experience[100,i]=0;hp[100,i]=0;
	    age[100,i]=((millenium*1000)+year)-10;god[100,i]=0;if (global.chapter_name="Iron Hands") then bio[100,i]=choose(3,4,5);
		TTRPG[100,i]=new TTRPG_stats("chapter", 100,i);
	}initialized=500;
	// Initialize special marines
	i=-1;repeat(501){i+=1;
	    race[0,i]=1;loc[0,i]="";name[0,i]="";role[0,i]="";wep1[0,i]="";bio[0,i]=0;lid[0,i]=0;wid[0,i]=2;spe[0,i]="";
	    wep2[0,i]="";armour[0,i]="";gear[0,i]="";mobi[0,i]="";chaos[0,i]=0;experience[0,i]=0;hp[0,i]=0;
	    age[0,i]=((millenium*1000)+year)-10;god[0,i]=0;if (global.chapter_name="Iron Hands") then bio[0,i]=choose(3,4,5);
		TTRPG[0,i]= new TTRPG_stats("chapter", 0,i);
	}
	i=-1;repeat(101){i+=1;
	    role[100,i]="";wep1[100,i]="";wep2[100,i]="";armour[100,i]="";gear[100,i]="";mobi[100,i]="";//hirelings??
	    role[102,i]="";wep1[102,i]="";wep2[102,i]="";armour[102,i]="";gear[102,i]="";mobi[102,i]="";//hirelings??
	}
	i=99;repeat(3){i+=1; // gear 
	    role[i,2]="Honor Guard";wep1[i,2]="Power Sword";wep2[i,2]="Storm Bolter";armour[i,2]="Power Armour";mobi[i,2]="";gear[i,2]="";
	    role[i,3]="Veteran";wep1[i,3]="Chainsword";wep2[i,3]="Combiflamer";armour[i,3]="Power Armour";mobi[i,3]="";gear[i,3]="";
	    role[i,4]="Terminator";wep1[i,4]="Power Fist";wep2[i,4]="Storm Bolter";armour[i,4]="Terminator Armour";mobi[i,4]="";gear[i,4]="";
	    role[i,5]="Captain";wep1[i,5]="Power Fist";wep2[i,5]="Bolt Pistol";armour[i,5]="Power Armour";mobi[i,5]="";gear[i,5]="";
	    role[i,6]="Dreadnought";wep1[i,6]="Close Combat Weapon";wep2[i,6]="Lascannon";armour[i,6]="Dreadnought";mobi[i,6]="";gear[i,6]="";
	    role[i,7]="Company Champion";wep1[i,7]="Power Sword";wep2[i,7]="Storm Shield";armour[i,7]="Power Armour";mobi[i,7]="";gear[i,7]="";
	    role[i,8]="Tactical Marine";wep1[i,8]="Bolter";wep2[i,8]="Chainsword";armour[i,8]="Power Armour";mobi[i,8]="";gear[i,8]="";
	    role[i,9]="Devastator";wep1[i,9]="Heavy Ranged";wep2[i,9]="Combat Knife";armour[i,9]="Power Armour";mobi[i,9]="";gear[i,9]="";
	    role[i,10]="Assault Marine";wep1[i,10]="Chainsword";wep2[i,10]="Bolt Pistol";armour[i,10]="Power Armour";mobi[i,10]="Jump Pack";gear[i,10]="";
	    role[i,12]="Scout";wep1[i,12]="Sniper Rifle";wep2[i,12]="Combat Knife";armour[i,12]="Scout Armour";mobi[i,12]="";gear[i,12]="";
	    role[i,14]="Chaplain";wep1[i,14]="Power Sword";wep2[i,14]="Storm Bolter";armour[i,14]="Power Armour";gear[i,14]="Rosarius";mobi[i,14]="";
	    role[i,15]="Apothecary";wep1[i,15]="Power Sword";wep2[i,15]="Storm Bolter";armour[i,15]="Power Armour";gear[i,15]="Narthecium";mobi[i,15]="";
	    role[i,16]="Techmarine";wep1[i,16]="Power Axe";wep2[i,16]="Storm Bolter";armour[i,16]="Power Armour";gear[i,16]="Servo Arms";mobi[i,16]="";
	    role[i,17]="Librarian";wep1[i,17]="Force Weapon";wep2[i,17]="Storm Bolter";armour[i,17]="Power Armour";gear[i,17]="Psychic Hood";mobi[i,17]="";
	}// 100 is defaults, 101 is the allowable starting equipment // info
	i=-1;repeat(21){i+=1;
	    race[100,i]=obj_creation.race[100,i];
	    role[100,i]=obj_creation.role[100,i];
	    wep1[100,i]=obj_creation.wep1[100,i];
	    wep2[100,i]=obj_creation.wep2[100,i];
	    armour[100,i]=obj_creation.armour[100,i];
	    gear[100,i]=obj_creation.gear[100,i];
	    mobi[100,i]=obj_creation.mobi[100,i];
	}
	role[100,18]="Sergeant";wep1[100,18]="Chainsword";wep2[100,18]="Combiflamer";armour[100,18]="Power Armour";mobi[100,18]="";gear[100,18]="";	
		//made all the exp buffs sort into neat little structs so theyre easier to dev and player modify
	company_spawn_buffs = [0,0,[110,10],[105,10],[95,10],[80,15],[65,5],[55,5],[45,5],[35,5],[3,4]]
	role_spawn_buffs = {}
	variable_struct_set(role_spawn_buffs,role[100,5],[70,40]);
	variable_struct_set(role_spawn_buffs,role[100,14],[120,30]);
	variable_struct_set(role_spawn_buffs,role[100,15],[95,20]);
	variable_struct_set(role_spawn_buffs,role[100,16],[95,20]);
	variable_struct_set(role_spawn_buffs,"Standard Bearer",[30,30]);
	variable_struct_set(role_spawn_buffs,role[100,7],[40,5]);
	variable_struct_set(role_spawn_buffs,role[100,8],[3,5]);
	variable_struct_set(role_spawn_buffs,role[100,10],0);
	variable_struct_set(role_spawn_buffs,role[100,9],0);
	variable_struct_set(role_spawn_buffs,role[100,12],0);
	
	squad_types = {};
	var st = { 
		"command_squad" :[
				[role[100,5], {"max":1,"min":1}],		//captain
				[role[100,7], {"max":1,"min":1}],		//company_champion
				[role[100,15], {"max":1,"min":1}],		//Apothecary
				["Standard Bearer" , {"max":1,"min":1}],//standard bearer
				[role[100,3] , {"max":5,"min":0}],		//veterans
			],
			"terminator_squad": [
				[role[100,8], {"max":9,"min":3}],
			],
			"tactical_squad":[
				[role[100,8], {"max":9,"min":4, "loadout":{
					"required":{
						"wep1":["Bolter",4], 
						"wep2":["Combat Knife",4]
					},
					"option" :{
						"wep1":[
							[["Flamer", "Meltagun"],1],
							[["Plasma Gun","Storm Bolter"], 1],
							[["Multi-Melta", "Heavy Flamer", "Bolter"], 1],
							[["Missile Launcher", "Lascannon", "Bolter"], 1]],
						"wep2":[
							["Chainsword",2],
							[["Power Sword", "Power Axe", "Lightning Claw"],1],
							[["Chainfist", "Power Fist"],1]
						]
					} 
				}}],		//tactical marine
				[role[100,18], {"max":1,"min":1}],		// sergeant
			],
			"assault_squad" : [
				[role[100,10] , {
					"max":9, 
					"min":4, 
					"loadout":{
						"required" : {
							"wep1" : ["Chainsword", 4],
							"wep2":["Bolt Pistol",4]
						},
						"option" : {
							"wep1":[
								[["Flamer"], 1], [["Eviscerator"],2],
							],
							"wep2":[
								[["Plasma Pistol"], 1]
							]
						}
					}
				}
			],
			[role[100,18], {"max":1,"min":1}],		// sergeant
		]		
	};

	var st_names = struct_get_names(st);
	for (var st_iter = 0; st_iter < array_length(st_names);st_iter++;){
		var s_group = st[$ st_names[st_iter]];
		squad_types[$ st_names[st_iter]] = {};
		for (var iter_2 = 0; iter_2 < array_length(s_group);iter_2++){
			squad_types[$ st_names[st_iter]][$ s_group[iter_2][0]] = s_group[iter_2][1];
		}
	}



	i=-1;
	repeat(18){i+=1;
	    if (role[100,i]!="") then scr_start_allow(i,"wep1",wep1[100,i]);
	    if (role[100,i]!="") then scr_start_allow(i,"wep2",wep2[100,i]);
	    if (role[100,i]!="") then scr_start_allow(i,"mobi",mobi[100,i]);
	    if (role[100,i]!="") then scr_start_allow(i,"gear",gear[100,i]);
	    // check for allowable starting equipment here
	}

	initialized=500;// How many array variables have been prepared
	v=0;company=0;



	// Chapter Master
	// This needs work
	race[company,1]=1;loc[company,1]=home_name;name[company,1]=obj_creation.chapter_master_name;role[company,1]="Chapter Master";
	 TTRPG[company,1]=new TTRPG_stats("chapter", company,1, "chapter_master");
	 var chapter_master = TTRPG[company,1]
	if (master_melee=1) then wep1[0,1]="Power Fist&DUB|";
	if (master_melee=2) then wep1[0,1]="Relic Blade&MNR|";
	if (master_melee=3) then wep1[0,1]="Master Crafted Thunder Hammer";
	if (master_melee=4) then wep1[0,1]="Master Crafted Power Sword";
	if (master_melee=5) then wep1[0,1]="Master Crafted Power Axe";
	if (master_melee=6) then wep1[0,1]="Master Crafted Eviscerator";
	if (master_melee=7) then wep1[0,1]="Master Crafted Force Weapon";

	if (master_ranged=1) then wep2[0,1]="Integrated Bolters";
	if (master_ranged=2) then wep2[0,1]="Infernus Pistol";
	if (master_ranged=3) then wep2[0,1]="Master Crafted Plasma Pistol";
	if (master_ranged=4) then wep2[0,1]="Master Crafted Plasma Gun";
	if (master_ranged=5) then wep2[0,1]="Master Crafted Heavy Bolter";
	if (master_ranged=6) then wep2[0,1]="Master Crafted Meltagun";
	if (master_ranged=7) then wep2[0,1]="Storm Shield";

	if (global.chapter_name="Dark Angels") then wep2[0,1]="Plasma Gun&UBL|";
	if (global.chapter_name="Blood Angels") then wep1[0,1]="Master Crafted Power Axe";
	if (global.chapter_name="Iron Hands"){wep1[0,1]="Power Axe&ADA|";wep2[0,1]="Storm Shield";bio[0,1]=10;}
	if (global.chapter_name="Doom Benefactors") then bio[0,1]=4;

	armour[company,1]="Artificer Armour";spe[company,1]="";
	if (obj_creation.chapter_master_specialty=1){experience[company,1]=550;spe[company,1]+="$";}
	if (obj_creation.chapter_master_specialty=2){experience[company,1]=650;spe[company,1]+="@";}
	if (obj_creation.chapter_master_specialty=3){experience[company,1]=550;gear[company,1]="Psychic Hood";
	    var let,letmax;let="";letmax=0;
	    if (obj_creation.discipline="default"){let="D";letmax=7;}
	    if (obj_creation.discipline="biomancy"){let="B";letmax=5;}
	    if (obj_creation.discipline="pyromancy"){let="P";letmax=5;}
	    if (obj_creation.discipline="telekinesis"){let="T";letmax=5;}
	    if (obj_creation.discipline="rune Magick"){let="R";letmax=5;}
	    spe[company,1]+=string(let)+"0|";scr_powers_new(company,1);
	}
	mobi[company,1]=mobi[100,2];
	if (string_count("Paragon",strin)>0) then chapter_master.add_trait("paragon")

	// Forge Master
	race[company,2]=1;loc[company,2]=home_name;role[company,2]="Forge Master";wep1[company,2]="Conversion Beam Projector";name[company,2]=obj_creation.fmaster;
	wep2[company,2]="Power Weapon";armour[company,2]="Artificer Armour";gear[company,2]="Master Servo Arms";chaos[company,2]=0;experience[company,2]=475;
	if (global.chapter_name="Lamenters") then armour[company,2]="MK6 Corvus";bio[company,2]=8;if (global.chapter_name="Iron Hands") then bio[company,k]=10;
	// Master of Sanctity (Chaplain)
	race[company,3]=1;loc[company,3]=home_name;role[company,3]="Master of Sanctity";wep1[company,3]=wep1[101,14];name[company,3]=obj_creation.hchaplain;
	wep2[company,3]=wep2[101,14];armour[company,3]="Artificer Armour";gear[company,3]=gear[101,14];chaos[company,3]=-100;experience[company,3]=525;
	if (global.chapter_name="Lamenters") then armour[company,3]="MK6 Corvus";
	// Maser of the Apothecarion (Apothecary)
	race[company,4]=1;loc[company,4]=home_name;role[company,4]="Master of the Apothecarion";wep1[company,4]=wep1[101,15];name[company,4]=obj_creation.hapothecary;
	wep2[company,4]=wep2[100,15];armour[company,4]="Artificer Armour";gear[company,4]=gear[101,15];chaos[company,4]=0;experience[company,4]=500;
	if (global.chapter_name="Lamenters") then armour[company,4]="MK6 Corvus";
	// Chief Librarian
	race[company,5]=1;loc[company,5]=home_name;role[company,5]="Chief "+string(role[100,17]);wep1[company,5]=wep1[101,17];name[company,5]=obj_creation.clibrarian;
	wep2[company,5]=wep2[101,17];armour[company,5]="Artificer Armour";gear[company,5]=gear[101,17];chaos[company,5]=0;experience[company,5]=550;
	if (global.chapter_name="Lamenters") then armour[company,5]="MK6 Corvus";
	if (obj_creation.discipline="default"){let="D";letmax=7;}
	if (obj_creation.discipline="biomancy"){let="B";letmax=5;}
	if (obj_creation.discipline="pyromancy"){let="P";letmax=5;}
	if (obj_creation.discipline="telekinesis"){let="T";letmax=5;}
	if (obj_creation.discipline="rune Magick"){let="R";letmax=5;}
	spe[company,5]=string(let)+"0|";scr_powers_new(company,5);
	k=0;commands+=6;k+=6;

	if (intolerant=1){
	    race[company,5]=0;loc[company,5]="";role[company,5]="";wep1[company,5]="";name[company,5]="";
	    wep2[company,5]="";armour[company,5]="";gear[company,5]="";hp[company,5]=0;chaos[company,5]=0;experience[company,5]=0;
	    man_size-=1;commands-=1;
	}
	man_size+=6;

	// Tech Marines
	repeat(techs){k+=1;commands+=1;man_size+=1;
	    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,16];wep1[company,k]=wep1[101,16];name[company,k]=scr_marine_name();
	    wep2[company,k]=wep2[101,16];armour[company,k]="Power Armour";gear[company,k]=gear[101,16];chaos[company,k]=0;experience[company,k]=100;
	    bio[company,k]=4+choose(0,1,2);if (global.chapter_name="Iron Hands") then bio[company,k]=choose(7,8);
	}
	// Librarians
	repeat(epistolary){k+=1;commands+=1;man_size+=1;
	    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,17];wep1[company,k]=wep1[101,17];name[company,k]=scr_marine_name();
	    wep2[company,k]=wep2[101,17];armour[company,k]="MK7 Aquila";gear[company,k]=gear[101,17];chaos[company,k]=0;experience[company,k]=125;
	    if (psyky=1) then experience[company,k]+=10;

	    var let,letmax;let="";letmax=0;
	    if (obj_creation.discipline="default"){let="D";letmax=7;}
	    if (obj_creation.discipline="biomancy"){let="B";letmax=5;}
	    if (obj_creation.discipline="pyromancy"){let="P";letmax=5;}
	    if (obj_creation.discipline="telekinesis"){let="T";letmax=5;}
	    if (obj_creation.discipline="rune Magick"){let="R";letmax=5;}
	    spe[company,k]+=string(let)+"0|";scr_powers_new(company,k);
	}
	// Codiciery
	repeat(codiciery){k+=1;commands+=1;man_size+=1;
	    race[company,k]=1;loc[company,k]=home_name;role[company,k]="Codiciery";wep1[company,k]="Power Sword";name[company,k]=scr_marine_name();
	    wep2[company,k]="Bolt Pistol";armour[company,k]="MK7 Aquila";gear[company,k]="Psychic Hood";chaos[company,k]=0;experience[company,k]=80;
	    if (psyky=1) then experience[company,k]+=10;

	    var let,letmax;let="";letmax=0;
	    if (obj_creation.discipline="default"){let="D";letmax=7;}
	    if (obj_creation.discipline="biomancy"){let="B";letmax=5;}
	    if (obj_creation.discipline="pyromancy"){let="P";letmax=5;}
	    if (obj_creation.discipline="telekinesis"){let="T";letmax=4;}
	    if (obj_creation.discipline="rune Magick"){let="R";letmax=5;}
	    spe[company,k]+=string(let)+"0|";scr_powers_new(company,k);
	}
	// Lexicanum
	repeat(lexicanum){k+=1;commands+=1;man_size+=1;
	    race[company,k]=1;loc[company,k]=home_name;role[company,k]="Lexicanum";wep1[company,k]="Bolter";name[company,k]=scr_marine_name();
	    wep2[company,k]="Chainsword";armour[company,k]="MK7 Aquila";chaos[company,k]=0;experience[company,k]=40;
	    if (psyky=1) then experience[company,k]+=10;

	    var let,letmax;let="";letmax=0;
	    if (obj_creation.discipline="default"){let="D";letmax=7;}
	    if (obj_creation.discipline="biomancy"){let="B";letmax=5;}
	    if (obj_creation.discipline="pyromancy"){let="P";letmax=5;}
	    if (obj_creation.discipline="telekinesis"){let="T";letmax=4;}
	    if (obj_creation.discipline="rune Magick"){let="R";letmax=5;}
	    spe[company,k]+=string(let)+"0|";
	}
	// Apothecary
	repeat(apothecary){k+=1;commands+=1;man_size+=1;
	    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,15];wep1[company,k]=wep1[101,15];name[company,k]=scr_marine_name();
	    wep2[company,k]=wep2[101,15];armour[company,k]="MK7 Aquila";gear[company,k]=gear[101,15];chaos[company,k]=0;experience[company,k]=100;
	}


	// Honor Guard

	var hong,chapter_option,o;hong=0;
	o=0;chapter_option=0;repeat(4){o+=1;if (obj_creation.adv[o]="Brothers, All") then chapter_option=1;}if (chapter_option=1) then hong+=20;
	if (progenitor=0) and (obj_creation.custom=0) then hong+=10;
	if (hong>0) then repeat(10){k+=1;commands+=1;man_size+=1;
	    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,2];name[company,k]=scr_marine_name();gear[company,k]=gear[100,2];mobi[company,k]=mobi[100,2];
// wep1 power sword // wep2 storm bolter default

		
		wep1[company,k]=wep1[101,2];

	    wep2[company,k]=wep2[101,2];armour[company,k]="MK4 Maximus";

	    chaos[company,k]=0;experience[company,k]=210+irandom(30);
	}




	specials=k;


	// First Company
	i=-1;company=1;
	repeat(501){i+=1;
	    race[company,i]=1;loc[company,i]="";name[company,i]="";role[company,i]="";wep1[company,i]="";lid[company,i]=0;wid[company,i]=2;spe[company,i]="";
	    wep2[company,i]="";armour[company,i]="";chaos[company,i]=0;experience[company,i]=0;gear[company,i]="";mobi[company,i]="";hp[company,i]=100;
	    age[company,i]=((millenium*1000)+year)-10;god[company,i]=0;bio[company,i]=0;if (global.chapter_name="Iron Hands") then bio[company,i]=choose(3,4,5);
		TTRPG[company,i]= new TTRPG_stats("chapter", company,i);
	}initialized=200;// How many array variables have been prepared

	k=0;

	if (veteran+terminator>0){
	    k+=1;commands+=1;// Captain
	    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,5];wep1[company,k]=wep1[101,5];name[company,k]=scr_marine_name();
	    wep2[company,k]=wep2[101,5];armour[company,k]="Terminator Armour";chaos[company,k]=0;experience[company,k]=220;gear[company,k]=gear[101,5];
	    if (string_count("Crafter",strin)>0) then armour[company,k]="Tartaros";
	    if (terminator<=0) then armour[company,k]="MK6 Corvus";
	    if (global.chapter_name="Iron Hands") then armour[company,k]="Terminator Armour";
	    if (mobi[101,5]!="") then mobi[company,k]=mobi[101,5];
	    if (armour[company,k]="Terminator Armour") or (armour[company,k]="Tartaros"){
	        man_size+=1;
	        if (wep1[company,k]="Bolt Pistol") then wep1[company,k]="Storm Bolter";
	        if (wep1[company,k]="Bolter") then wep1[company,k]="Storm Bolter";
	        if (wep2[company,k]="Bolt Pistol") then wep2[company,k]="Storm Bolter";
	        if (wep2[company,k]="Bolter") then wep2[company,k]="Storm Bolter";
	    }

	    if (global.chapter_name!="Space Wolves") and (global.chapter_name!="Iron Hands"){
	        var skl;skl=1;if (chaap>0){skl=2;chaap-=1;}
	        repeat(skl){
	            k+=1;commands+=1;// Chaplain
	            race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,14];wep1[company,k]=wep1[101,14];name[company,k]=scr_marine_name();
	            wep2[company,k]=wep2[101,14];armour[company,k]="Terminator Armour";gear[company,k]=gear[101,14]chaos[company,k]=0;experience[company,k]=150;
	            if (string_count("Crafter",strin)>0) then armour[company,k]="Tartaros";
	            if (terminator<=0) then armour[company,k]="MK6 Corvus";
	            if (mobi[101,14]!="") then mobi[company,k]=mobi[101,14];
	            if (armour[company,k]="Terminator") or (armour[company,k]="Tartaros") then man_size+=1;
	        }
	    }

	    k+=1;commands+=1;// Apothecary
	    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,15];wep1[company,k]=wep1[101,15];name[company,k]=scr_marine_name();
	    wep2[company,k]=wep2[101,15];armour[company,k]="Terminator Armour";gear[company,k]=gear[101,15];chaos[company,k]=0;experience[company,k]=130;
	    if (string_count("Crafter",strin)>0) then armour[company,k]="Tartaros";
	    if (terminator<=0) then armour[company,k]="MK6 Corvus";
	    if (mobi[101,15]!="") then mobi[company,k]=mobi[101,15];
	    if (armour[company,k]="Terminator") or (armour[company,k]="Tartaros") then man_size+=1;

	    if (global.chapter_name="Space Wolves"){
	        k+=1;commands+=1;// Apothecary
	        race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,15];wep1[company,k]=wep1[101,15];name[company,k]=scr_marine_name();
	        wep2[company,k]=wep2[101,15];armour[company,k]="Terminator Armour";gear[company,k]=gear[101,15];chaos[company,k]=0;experience[company,k]=110;
	        if (string_count("Crafter",strin)>0) then armour[company,k]="Tartaros";
	        if (terminator<=0) then armour[company,k]="MK6 Corvus";
	        if (mobi[101,15]!="") then mobi[company,k]=mobi[101,15];
	        if (armour[company,k]="Terminator") or (armour[company,k]="Tartaros") then man_size+=1;
	    }
	    if (global.chapter_name="Iron Hands"){
	        k+=1;commands+=1;
	        race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,16];wep1[company,k]=wep1[101,16];name[company,k]=scr_marine_name();
	        wep2[company,k]=wep2[101,16];armour[company,k]="Power Armour";gear[company,k]=gear[101,16];chaos[company,k]=0;experience[company,k]=100;
	        bio[company,k]=4+choose(0,1,2);if (global.chapter_name="Iron Hands") then bio[company,k]=choose(7,8);
	        if (mobi[101,16]!="") then mobi[company,k]=mobi[101,16];
	        if (armour[company,k]="Terminator") or (armour[company,k]="Tartaros") then man_size+=1;
	    }

	    k+=1;// Standard bearer
	    race[company,k]=1;loc[company,k]=home_name;role[company,k]="Standard Bearer";wep1[company,k]="Company Standard";name[company,k]=scr_marine_name();
	    wep2[company,k]="Power Fist";armour[company,k]="Terminator Armour";chaos[company,k]=0;experience[company,k]=90;
	    if (string_count("Crafter",strin)>0) then armour[company,k]="Tartaros";
	    if (terminator<=0) then armour[company,k]="MK6 Corvus";
	    if (armour[company,k]="Terminator") or (armour[company,k]="Tartaros") then man_size+=1;

	    k+=1;man_size+=1;// Company Champion
	    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,7];wep1[company,k]=wep1[100,7];name[company,k]=scr_marine_name();
	    wep2[company,k]=wep2[100,7];armour[company,k]="Terminator Armour";chaos[company,k]=0;experience[company,k]=200;
	    if (string_count("Crafter",strin)>0) then armour[company,k]="Tartaros";
	    if (terminator<=0) then armour[company,k]="MK6 Corvus";
	    if (armour[company,k]="Terminator") or (armour[company,k]="Tartaros") then man_size+=1;
	}

	// go 5 under the required xp amount 
	
	var terminator_random_xp;
	var veteran_random_xp;
	
	if (terminator-1>0) then repeat(terminator-1){k+=1;man_size+=2; terminator_random_xp = irandom(20)+175;
	// repeat(max(terminator-4,0)){k+=1;man_size+=2;
	    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,4];wep1[company,k]=wep1[101,4];name[company,k]=scr_marine_name();
	    wep2[company,k]=wep2[101,4];armour[company,k]="Terminator Armour";chaos[company,k]=0;experience[company,k]=terminator_random_xp;
	    if (string_count("Crafter",strin)>0) and (k<=20) then armour[company,k]="Tartaros";
	}
	repeat(veteran){k+=1;man_size+=1;  veteran_random_xp = irandom(20)+145;
	    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,3];wep1[company,k]=wep1[101,3];name[company,k]=scr_marine_name();
	    wep2[company,k]=wep2[101,3];armour[company,k]="MK6 Corvus";chaos[company,k]=0;
	    experience[company,k]=veteran_random_xp;mobi[company,k]=mobi[101,3];
	}

	k+=1;commands+=1;
	race[company,k]=1;loc[company,k]=home_name;role[company,k]="Venerable "+string(role[100,6]);wep1[company,k]=wep1[101,6];man_size+=8;
	wep2[company,k]=wep2[101,6];armour[company,k]="Dreadnought";chaos[company,k]=0;experience[company,k]=400;name[company,k]=scr_marine_name();
	k+=1;commands+=1;
	race[company,k]=1;loc[company,k]=home_name;role[company,k]="Venerable "+string(role[100,6]);wep1[company,k]=wep1[101,6];man_size+=8;
	wep2[company,k]=wep2[101,6];armour[company,k]="Dreadnought";chaos[company,k]=0;experience[company,k]=400;name[company,k]=scr_marine_name();
	// :D :D :D


	repeat(4){v+=1;man_size+=10;
	    veh_race[company,v]=1;veh_loc[company,v]=home_name;veh_role[company,v]="Rhino";veh_wep1[company,v]="Storm Bolter";veh_wep2[company,v]="HK Missile";veh_wep3[company,v]="";
	    veh_upgrade[company,v]="Artificer Hull";veh_acc[company,v]="Dozer Blades";veh_hp[company,v]=100;veh_chaos[company,v]=0;veh_pilots[company,v]=0;veh_lid[company,v]=0;veh_wid[company,v]=2;
	}
	var predrelic;predrelic=2;
	if (global.chapter_name="Iron Hands") then predrelic=3;
	repeat(predrelic){v+=1;man_size+=10;
		var predtype;predtype=choose(1,2,3,4)
		veh_race[company,v]=1;veh_loc[company,v]=home_name;veh_role[company,v]="Predator";
		if (predtype=1){veh_wep1[company,v]="Plasma Destroyer Turret";veh_wep2[company,v]="Lascannon Sponsons";veh_wep3[company,v]="HK Missile";veh_upgrade[company,v]="Artificer Hull";veh_acc[company,v]="Searchlight";}
		if (predtype=2){veh_wep1[company,v]="Heavy Conversion Beamer Turret";veh_wep2[company,v]="Lascannon Sponsons";veh_wep3[company,v]="HK Missile";veh_upgrade[company,v]="Artificer Hull";veh_acc[company,v]="Searchlight";}
		if (predtype=3){veh_wep1[company,v]="Flamestorm Cannon Turret";veh_wep2[company,v]="Heavy Flamer Sponsons";veh_wep3[company,v]="Storm Bolter";veh_upgrade[company,v]="Artificer Hull";veh_acc[company,v]="Dozer Blades";}
		if (predtype=4){veh_wep1[company,v]="Magna-Melta Turret";veh_wep2[company,v]="Heavy Flamer Sponsons";veh_wep3[company,v]="Storm Bolter";veh_upgrade[company,v]="Artificer Hull";veh_acc[company,v]="Dozer Blades";}
		veh_hp[company,v]=100;veh_chaos[company,v]=0;veh_pilots[company,v]=0;veh_lid[company,v]=0;
	}
	if (global.chapter_name!="Lamenters") then repeat(6){v+=1;man_size+=20;
	    veh_race[company,v]=1;veh_loc[company,v]=home_name;veh_role[company,v]="Land Raider";veh_hp[company,v]=100;veh_chaos[company,v]=0;veh_pilots[company,v]=0;veh_lid[company,v]=0;veh_wid[company,v]=2;
			if (floor(v mod 4) == 1) or (floor(v mod 4) == 2){veh_wep1[company,v]="Twin Linked Heavy Bolter Mount";veh_wep2[company,v]="Twin Linked Lascannon Sponsons";veh_wep3[company,v]="HK Missile";veh_upgrade[company,v]="";veh_acc[company,v]="Searchlight";}
			if (floor(v mod 4) == 3){veh_wep1[company,v]="Twin Linked Assault Cannon Mount";veh_wep2[company,v]="Hurricane Bolter Sponsons";veh_wep3[company,v]="Storm Bolter";veh_upgrade[company,v]="Heavy Armour";veh_acc[company,v]="Frag Assault Launchers";}
			if (floor(v mod 4) == 0){veh_wep1[company,v]="Twin Linked Assault Cannon Mount";veh_wep2[company,v]="Flamestorm Cannon Sponsons";veh_wep3[company,v]="Storm Bolter";veh_upgrade[company,v]="Heavy Armour";veh_acc[company,v]="Frag Assault Launchers";}
	}v=0;

	firsts=k;




	repeat(9){
	    company+=1;

	    // Initialize marines
	    i=-1;repeat(501){i+=1;
	        race[company,i]=1;loc[company,i]="";name[company,i]="";role[company,i]="";wep1[company,i]="";lid[company,i]=0;wid[company,i]=2;spe[company,i]="";
	        wep2[company,i]="";armour[company,i]="";gear[company,i]="";mobi[company,i]="";hp[company,i]=100;chaos[company,i]=0;experience[company,i]=0;
	        age[company,i]=((millenium*1000)+year)-10;god[company,i]=0;bio[company,i]=0;if (global.chapter_name="Iron Hands") then bio[company,i]=choose(3,4,5);
			TTRPG[company,i]= new TTRPG_stats("chapter", company,i);
	    }

	    var company_experience, company_unit2, company_unit3, dready, rhinoy, whirly, speedy,stahp;
	    company_experience=0;company_unit2="";company_unit3="";stahp=0;

	    v=0;i=-1;k=0;v=0;dready=0;rhinoy=0;whirly=0;speedy=0;


	    if (obj_creation.equal_specialists=1){
	        if (company=2) then temp1=max(0,(second-(assault+devastator))-1);
	        if (company=3) then temp1=max(0,(third-(assault+devastator))-1);
	        if (company=4) then temp1=max(0,(fourth-(assault+devastator))-1);
	        if (company=5) then temp1=max(0,(fifth-(assault+devastator))-1);
	        if (company=6) then temp1=max(0,(sixth-(assault+devastator))-1);
	        if (company=7) then temp1=max(0,(seventh-(assault+devastator))-1);
	        if (company=8) then temp1=max(0,(eighth-(assault+devastator))-1);
	        if (company=9) then temp1=max(0,(ninth-(assault+devastator))-1);
	        if (company=10) then temp1=max(0,tenth-10);

	        company_experience=(16-company)*5;

	        // temp1=(100-(assault*devastator))*10;company_experience=(16-company)*5;
	        // temp1-=1;

	        // if (company=2){dready=1;if (string_count("Sieged",strin2)>0) or (obj_creation.custom=0) then dready+=1;}
	        rhinoy=8;whirly=whirlwind;speedy=2;
	    }

		// random xp for each marine company
		// this gives the entire company the same xp
		// figure it out later how to give individual ones different ones
		// repeat didn't work

	    if (obj_creation.equal_specialists=0)  { 
			 if (company=2){ 
	            temp1=(second-(assault+devastator));company_unit2="assault";company_unit3="devastator";
	            temp1-=2;

	            dready=1;if (string_count("Sieged",strin2)>0) or (obj_creation.custom=0) then dready+=1;
	            rhinoy=8;whirly=whirlwind;speedy=2;
	            if (second=0) then stahp=1;
			
	      }
	        if (company=3){
	            temp1=(third-(assault+devastator));company_unit2="assault";company_unit3="devastator";
	            temp1-=2;
	            // dready=2;
	            if (string_count("Sieged",strin2)>0) or (obj_creation.custom=0) then dready+=2;
	            rhinoy=8;whirly=whirlwind;speedy=2;
	            if (third=0) then stahp=1;
	        }
	        if (company=4){
	            temp1=(fourth-(assault+devastator));company_unit2="assault";company_unit3="devastator";
	            temp1-=2;
	            // dready=2;
	            if (string_count("Sieged",strin2)>0) or (obj_creation.custom=0) then dready+=2;
	            rhinoy=8;whirly=whirlwind;speedy=2;
	            if (fourth=0) then stahp=1;
	        }
	        if (company=5){
	            temp1=(fifth-(assault+devastator));company_unit2="assault";company_unit3="devastator";
	            temp1-=2;
	            // dready=2;
	            if (string_count("Sieged",strin2)>0) or (obj_creation.custom=0) then dready+=2;
	            rhinoy=8;whirly=whirlwind;speedy=2;
	            if (fifth=0) then stahp=1;
	        }
	        if (company=6){
	            temp1=sixth;company_unit2="";company_unit3="";
	            temp1-=2;
	            // dready=2;
	            if (string_count("Sieged",strin2)>0) or (obj_creation.custom=0) then dready+=2;
	            rhinoy=8;whirly=whirlwind;speedy=0;
	            if (sixth=0) then stahp=1;
	        }
	        if (company=7){
	            temp1=seventh;company_unit2="";company_unit3="";
	            temp1-=2;
	            if (obj_creation.custom=0) then dready=2;
	            rhinoy=8;whirly=0;speedy=8;
	            if (seventh=0) then stahp=1;
	        }
	        if (company=8){
	            temp1=eighth;company_unit2="";company_unit3="";
	            temp1-=2;
	            if (obj_creation.custom=0) then dready=2;
	            rhinoy=2;whirly=0;speedy=2;
	            if (eighth=0) then stahp=1;
	        }
	        if (company=9){
	            temp1=ninth;company_unit2="";company_unit3="";
	            temp1-=2;
	            if (obj_creation.custom=0) then dready=2;
	            rhinoy=2;whirly=0;speedy=0;
	            if (ninth=0) then stahp=1;
	        }
	        if (company=10){
	            temp1=tenth;company_unit2="";company_unit3="";
	            temp1-=2;
	            dready=0;rhinoy=8;whirly=0;speedy=0;

	            // if (obj_creation.custom=0) then temp1-=5;

	            if (tenth=0) then stahp=1;
	        }
	    }

	    var spawn_unit;
	    if (stahp=0){
	        k+=1;commands+=1;// Captain
	        race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,5];wep1[company,k]=wep1[101,5];
	        name[company,k]=scr_marine_name();

	        if (company=4) then name[company,k]=lord_admiral_name;
	        if (company=10) then name[company,k]=recruiter_name;


	        wep2[company,k]=wep2[101,5];
	        spawn_unit = TTRPG[company,k];
			// used to randomly make a marine an old guard of their company, giving a bit more xp (TODO) and fancier armor they've hanged onto all these years	
			spawn_unit.spawn_exp();
	        spawn_unit.spawn_old_guard();
	        chaos[company,k]=0;

	        if (company=8) then mobi[company,k]="Jump Pack";
	        if (mobi[101,5]!="") then mobi[company,k]=mobi[101,5];
	        gear[company,k]=gear[101,5];

	        if (global.chapter_name="Iron Hands") then armour[company,k]="Terminator Armour";

	        if (global.chapter_name!="Space Wolves") and (global.chapter_name!="Iron Hands"){
	            var skl;skl=1;if (chaap>0){skl=2;chaap-=1;}
	            repeat(skl){
	                k+=1;commands+=1;// Chaplain
	                race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,14];wep1[company,k]=wep1[101,14];name[company,k]=scr_marine_name();
	                wep2[company,k]=wep2[101,14];
	                armour[company,k]="MK7 Aquila";if (company<=2) then armour[company,k]=choose("MK8 Errant","MK6 Corvus");
	                gear[company,k]=gear[101,14];chaos[company,k]=0;
	                if (company=8) then mobi[company,k]="Jump Pack";
	                if (mobi[101,14]!="") then mobi[company,k]=mobi[101,14];
					spawn_unit = TTRPG[company,k]
					spawn_unit.spawn_exp();
          spawn_unit.spawn_old_guard();
	            }
	        }

	        k+=1;commands+=1;// Apothecary
	        race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,15];wep1[company,k]=wep1[101,15];name[company,k]=scr_marine_name();
	        wep2[company,k]=wep2[101,15];
	        spawn_unit = TTRPG[company,k]
			spawn_unit.spawn_exp();
	        spawn_unit.spawn_old_guard();
	        gear[company,k]=gear[101,15];chaos[company,k]=0;
	        if (company=8) then mobi[company,k]="Jump Pack";
	        if (mobi[101,15]!="") then mobi[company,k]=mobi[101,15];

	        if (global.chapter_name="Space Wolves"){
	            k+=1;commands+=1;// Apothecary
	            race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,15];wep1[company,k]=wep1[101,15];name[company,k]=scr_marine_name();
	            wep2[company,k]=wep2[101,15];
	            armour[company,k]="MK7 Aquila";if (company<=2) then armour[company,k]=choose("MK8 Errant","MK6 Corvus");
	            gear[company,k]=gear[101,15];chaos[company,k]=0;
	            if (company=8) then mobi[company,k]="Jump Pack";
	            if (mobi[101,15]!="") then mobi[company,k]=mobi[101,15];
					        spawn_unit = TTRPG[company,k]
			spawn_unit.spawn_exp();
	        spawn_unit.spawn_old_guard();
	        }
	        if (global.chapter_name="Iron Hands"){
	            k+=1;commands+=1;
	            race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,16];wep1[company,k]=wep1[101,16];name[company,k]=scr_marine_name();
	            wep2[company,k]=wep2[101,16];armour[company,k]="Power Armour";gear[company,k]=gear[101,16];chaos[company,k]=0;
	            bio[company,k]=4+choose(0,1,2);if (global.chapter_name="Iron Hands") then bio[company,k]=choose(7,8);
	            if (mobi[101,16]!="") then mobi[company,k]=mobi[101,16];
				spawn_unit = TTRPG[company,k]
				spawn_unit.spawn_exp();
				spawn_unit.spawn_old_guard();
	        }

	        k+=1;// Standard Bearer
	        race[company,k]=1;loc[company,k]=home_name;role[company,k]="Standard Bearer";wep1[company,k]="Chainsword";name[company,k]=scr_marine_name();
	        wep2[company,k]="Company Standard";
	        armour[company,k]="MK5 Heresy";
	        chaos[company,k]=0;if (company=8) then mobi[company,k]="Jump Pack";
	        spawn_unit = TTRPG[company,k];
			spawn_unit.spawn_exp();
	        spawn_unit.spawn_old_guard();      

	        k+=1;man_size+=1;// Company Champion
	        race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,7];wep1[company,k]=wep1[100,7];name[company,k]=scr_marine_name();
	        wep2[company,k]=wep2[100,7];armour[company,k]="MK4 Maximus";
	        chaos[company,k]=0;
			spawn_unit = TTRPG[company,k];
			spawn_unit.add_trait("champion");
			spawn_unit.spawn_exp();
	        spawn_unit.spawn_old_guard();
			// have equal spec true or false have same old_guard chance
			// it doesn't fully make sense why new marines in reserve companies would have the same chance
			// but otherwise you'd always pick true so you'd have more shit
			// just making em the same to reduce meta/power gaming
	        if (obj_creation.equal_specialists=1){
	            if (company<10){
					
	                repeat(temp1){k+=1;man_size+=1;

	                race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,8];wep1[company,k]=wep1[101,8];wep2[company,k]=wep2[101,8];name[company,k]=scr_marine_name();
	                chaos[company,k]=0;

			        spawn_unit = TTRPG[company,k]
					spawn_unit.spawn_exp();
					spawn_unit.spawn_old_guard();

	                }
	                repeat(assault){k+=1;man_size+=1;

	                race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,10];wep1[company,k]=wep1[101,10];name[company,k]=scr_marine_name();
					mobi[company,k]="Jump Pack";chaos[company,k]=0;
					wep2[company,k]=wep2[101,10]; 
						
			        spawn_unit = TTRPG[company,k]
					spawn_unit.spawn_exp();
					spawn_unit.spawn_old_guard();
					
	                }
	                repeat(devastator){k+=1;man_size+=1;

	                race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,9];wep2[company,k]=wep2[101,9];name[company,k]=scr_marine_name();
	                chaos[company,k]=0;

	                    if (wep1[101,9]="Heavy Ranged") then wep1[company,k]=choose("Lascannon","Missile Launcher","Heavy Bolter");
	                    if (wep1[101,9]!="Heavy Ranged") then wep1[company,k]=wep1[101,9];

			        spawn_unit = TTRPG[company,k]
					spawn_unit.spawn_exp();
					spawn_unit.spawn_old_guard();
							
	                }
	            }
	            if (company=10){
	                repeat(temp1){k+=1;man_size+=1;
					
	                    race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,12];
	                    wep1[company,k]=wep1[101,12];name[company,k]=scr_marine_name();
	                    wep2[company,k]=wep2[101,12];armour[company,k]="Scout Armour";
	                    chaos[company,k]=0;
				        spawn_unit = TTRPG[company,k]
				        spawn_unit.spawn_exp()
	                }
	            }
	        }

	        if (obj_creation.equal_specialists=0){
	             if (company<8) then repeat(temp1){k+=1;man_size+=1;
					
	                race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,8];wep1[company,k]=wep1[101,8];wep2[company,k]=wep2[101,8];name[company,k]=scr_marine_name();
	                chaos[company,k]=0;

					
			        spawn_unit = TTRPG[company,k]
					spawn_unit.spawn_exp();
					spawn_unit.spawn_old_guard();
					
	            } // reserve company only of assault
	            if (company=8) then repeat(temp1){k+=1;man_size+=1; // assault reserve company

	            	race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,10];wep1[company,k]=wep1[101,10];wep2[company,k]=wep2[101,10];name[company,k]=scr_marine_name();
	            	chaos[company,k]=0;mobi[company,k]="Jump Pack";
					
			        spawn_unit = TTRPG[company,k]
					spawn_unit.spawn_exp();
					spawn_unit.spawn_old_guard();
				
	            } // reserve company only devo
	            if (company=9) then repeat(temp1){k+=1;man_size+=1; 

	                race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,9];name[company,k]=scr_marine_name();wep2[company,k]=wep2[101,9];
	                chaos[company,k]=0;
	                if (wep1[101,9]="Heavy Ranged") then wep1[company,k]=choose("Lascannon","Missile Launcher","Heavy Bolter");
	                if (wep1[101,9]!="Heavy Ranged") then wep1[company,k]=wep1[101,9];
			        spawn_unit = TTRPG[company,k]
					spawn_unit.spawn_exp();
					spawn_unit.spawn_old_guard();
								
	            }
	            if (company=10) then repeat(temp1){k+=1;man_size+=1;
	                race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,12];wep1[company,k]=wep1[101,12];name[company,k]=scr_marine_name();
	                wep2[company,k]=wep2[101,12];armour[company,k]="Scout Armour";
	                chaos[company,k]=0;
	            } 
	            if (company_unit2="assault") then repeat(assault){k+=1;man_size+=1;

	                race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,10];wep1[company,k]=wep1[101,10];wep2[company,k]=wep2[101,10];name[company,k]=scr_marine_name();
	                mobi[company,k]=mobi[101,10];chaos[company,k]=0;
			        spawn_unit = TTRPG[company,k]
					spawn_unit.spawn_exp();
					spawn_unit.spawn_old_guard();
				
					
	            }
	            if (company_unit3="devastator") then repeat(devastator){k+=1;man_size+=1;

	                race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,9];name[company,k]=scr_marine_name();wep2[company,k]=wep2[101,9];
					chaos[company,k]=0;
					

	                if (wep1[101,9]="Heavy Ranged") then wep1[company,k]=choose("Lascannon","Missile Launcher","Heavy Bolter");
	                if (wep1[101,9]!="Heavy Ranged") then wep1[company,k]=wep1[101,9];
					
			        spawn_unit = TTRPG[company,k]
			        spawn_unit.spawn_old_guard();
			        spawn_unit.spawn_exp()
				
	                
	            }
	        }

	        if (dready>0){
	            repeat(dready){
	                k+=1;man_size+=10;commands+=1;
	                race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,6];wep1[company,k]="Close Combat Weapon";name[company,k]=scr_marine_name();
	                wep2[company,k]=wep2[101,6];armour[company,k]="Dreadnought";chaos[company,k]=0;experience[company,k]=300;
	                if (company=9) then wep1[company,k]="Missile Launcher";
	            }
	        }


	        if (rhinoy>0) then repeat(rhinoy){v+=1;man_size+=10;
	            veh_race[company,v]=1;veh_loc[company,v]=home_name;veh_role[company,v]="Rhino";veh_wep1[company,v]="Storm Bolter";veh_wep2[company,v]="HK Missile";veh_wep3[company,v]="";
	            veh_upgrade[company,v]="";veh_acc[company,v]="Dozer Blades";veh_hp[company,v]=100;veh_chaos[company,v]=0;veh_pilots[company,v]=0;veh_lid[company,v]=0;veh_wid[company,v]=2;
	        }
	        if (whirly>0) then repeat(whirly){v+=1;man_size+=10;
	            veh_race[company,v]=1;veh_loc[company,v]=home_name;veh_role[company,v]="Whirlwind";veh_wep1[company,v]="Whirlwind Missiles";veh_wep2[company,v]="HK Missile";veh_wep3[company,v]="";
	            veh_upgrade[company,v]="";veh_acc[company,v]="";veh_hp[company,v]=100;veh_chaos[company,v]=0;veh_pilots[company,v]=0;veh_lid[company,v]=0;veh_wid[company,v]=2;
	        }
	        if (speedy>0) then repeat(speedy){v+=1;man_size+=6;
	            veh_race[company,v]=1;veh_loc[company,v]=home_name;veh_role[company,v]="Land Speeder";veh_wep1[company,v]="Heavy Bolter";veh_wep2[company,v]="";veh_wep3[company,v]="";
	            veh_upgrade[company,v]="";veh_acc[company,v]="";veh_hp[company,v]=100;veh_chaos[company,v]=0;veh_pilots[company,v]=0;veh_lid[company,v]=0;veh_wid[company,v]=2;
	        }
	        if (company=9) or (global.chapter_name="Iron Hands"){
	            var predy;predy=5;
	            if (global.chapter_name="Iron Hands") then predy=2;

	            repeat(predy){v+=1;man_size+=10;
	                veh_race[company,v]=1;veh_loc[company,v]=home_name;veh_role[company,v]="Predator";
	                if (!floor(v mod 2) == 1){veh_wep1[company,v]="Twin Linked Lascannon Turret";veh_wep2[company,v]="Lascannon Sponsons";veh_wep3[company,v]="HK Missile";veh_upgrade[company,v]="";veh_acc[company,v]="Searchlight";}
	                if (floor(v mod 2) == 1){veh_wep1[company,v]="Autocannon Turret";veh_wep2[company,v]="Heavy Bolter Sponsons";veh_wep3[company,v]="Storm Bolter";veh_upgrade[company,v]="";veh_acc[company,v]="Dozer Blades";}veh_wid[company,v]=2;
	                veh_hp[company,v]=100;veh_chaos[company,v]=0;veh_pilots[company,v]=0;veh_lid[company,v]=0;
	            }
	        }
	        man_size+=k;
	    }

	    if (company=2) then seconds=k;
	    if (company=3) then thirds=k
	    if (company=4) then fourths=k;
	    if (company=5) then fifths=k;
	    if (company=6) then sixths=k;
	    if (company=7) then sevenths=k;
	    if (company=8) then eighths=k;
	    if (company=9) then ninths=k;
	    if (company=10) then tenths=k;

	}


	var c;c=0;k=0;company=0;
	repeat(200){c+=1;
	    if (k=0){
	        if (role[0,c]!="") and (role[0,c+1]="") then k=c;
	    }
	}
	if (global.chapter_name!="Space Wolves") and (global.chapter_name!="Iron Hands"){
	    if (chaap>0) then repeat(chaap){
	        k+=1;commands+=1;// Chaplain
	        race[company,k]=1;loc[company,k]=home_name;role[company,k]=role[100,14];wep1[company,k]=wep1[101,14];name[company,k]=scr_marine_name();
	        wep2[company,k]=wep2[101,14];
	        armour[company,k]="MK7 Aquila";// if (company<=2) then armour[company,k]=choose("MK8 Errant","MK6 Corvus");
	        gear[company,k]=gear[101,14];chaos[company,k]=0;experience[company,k]=100;
	        bio[company,k]=0;
	        // if (company=8) then mobi[company,k]="Jump Pack";
	        if (mobi[101,14]!="") then mobi[company,k]=mobi[101,14];
	    }
	}


	// obj_controller.marines-=commands;


	instance_create(0,0,obj_restart_vars);
	scr_restart_variables(1);


	var eqi;eqi=0;
	eqi+=1;equipment[eqi]="MK7 Aquila";equipment_number[eqi]=10;equipment_type[eqi]="armour";
	eqi+=1;equipment[eqi]="MK8 Errant";equipment_number[eqi]=1;equipment_type[eqi]="armour";
	eqi+=1;equipment[eqi]="Scout Armour";equipment_number[eqi]=20;equipment_type[eqi]="armour";
	eqi+=1;equipment[eqi]="Bolter";equipment_number[eqi]=20;equipment_type[eqi]="weapon";
	eqi+=1;equipment[eqi]="Chainsword";equipment_number[eqi]=20;equipment_type[eqi]="weapon";
	eqi+=1;equipment[eqi]="Lascannon";equipment_number[eqi]=5;equipment_type[eqi]="weapon";
	eqi+=1;equipment[eqi]="Heavy Bolter";equipment_number[eqi]=5;equipment_type[eqi]="weapon";
	eqi+=1;equipment[eqi]="Jump Pack";equipment_number[eqi]=10;equipment_type[eqi]="gear";
	eqi+=1;equipment[eqi]="Bike";equipment_number[eqi]=40;equipment_type[eqi]="vehicle";
	scr_add_item("Bolt Pistol",5);
	scr_add_item(wep1[101,12],20);
	scr_add_item(wep2[101,12],20);
	if (global.chapter_name="Iron Hands") then scr_add_item("Bionics",200);


	if (string_count("Sieged",strin2)>0){
	    scr_add_item("Narthecium",4);
	    scr_add_item(wep1[101,15],4);
	    scr_add_item(wep2[101,15],4);
	    scr_add_item("Psychic Hood",4);
	    scr_add_item("Force Weapon",4);
	    scr_add_item("Plasma Pistol",4);

	    o=0;chapter_option=0;repeat(4){o+=1;if (obj_creation.adv[o]="Crafters") then chapter_option=1;}
	    if (chapter_option=1) then scr_add_item("Tartaros",10);
	    else{scr_add_item("Terminator Armour",10);}

	    scr_add_item("MK7 Aquila",200);
	    scr_add_item("Bolter",200);
	    scr_add_item("Chainsword",200);
	    scr_add_item("Jump Pack",80);
	    scr_add_item("Bolt Pistol",80);
	    scr_add_item("Heavy Bolter",40);
	    scr_add_item("Lascannon",40);
	    scr_add_item("Power Weapon",12);
	    scr_add_item("Rosarius",4);
	}
	if (string_count("Sieged",strin2)=0){scr_add_item("Dreadnought",6);scr_add_item("Close Combat Weapon",6);}

	// man_size+=80;// bikes

	// if (string_count("Crafter",strin)>0) and (string_count("Enthusi",strin)>0) then equipment_number[1]=20;
	// if (string_count("Crafter",strin)>0) and (string_count("Enthusi",strin)=0) then equipment_number[2]=20;

	if (string_count("Crafter",strin)>0) and (string_count("Enthusi",strin)>0){eqi+=1;equipment[eqi]="MK3 Iron Armour";equipment_number[eqi]=round(random_range(2,12));equipment_type[eqi]="armour";}
	if (string_count("Crafter",strin)>0) and (string_count("Enthusi",strin)=0){eqi+=1;equipment[eqi]="MK4 Maximus";equipment_number[eqi]=round(random_range(3,18));equipment_type[eqi]="armour";}


	var i;i=-1;
	repeat(121){i+=1;
	    slave_batch_num[i]=0;
	    slave_batch_eta[i]=0;
	}




	var o,bloo;bloo=0;o=0;repeat(4){o+=1;if (obj_creation.dis[o]="Blood Debt") then bloo=1;}
	if (bloo=1) and (instance_exists(obj_controller)){obj_controller.blood_debt=1;}
	if (bloo=1){
	    penitent=1;penitent_max=(obj_creation.strength*1000)+300;
	    penitent_current=300;penitent_end=obj_creation.strength*48;
	}
	if (bloo=0) and (fleet_type=3){
	    penitent=1;penitent_max=(obj_creation.strength*60);
	    penitent_current=1;
	    penitent_end=obj_creation.strength*5;

	    if (obj_creation.chapter="Lamenters"){
	        penitent_max=600;penitent_end=600;
	        // obj_controller.loyalty=50;obj_controller.loyalty_hidden=50;
	    }
	}


	// if (obj_creation.chapter="Lamenters"){
	    // penitent_max=100300;penitent_end=1200;
	    // obj_controller.loyalty=50;obj_controller.loyalty_hidden=50;
	// }
	obj_ini.squads = [];
	var last_squad_count
	for (company=1;company < 10;company++;){
		create_squad("command_squad", company);
		last_squad_count = array_length(obj_ini.squads);
		while (last_squad_count == array_length(obj_ini.squads)){ ///keep making tact squads for as long as there are enough tact marines
			last_squad_count = (array_length(obj_ini.squads) + 1);
			create_squad("tactical_squad", company);
		}
		last_squad_count = array_length(obj_ini.squads);
		while (last_squad_count == array_length(obj_ini.squads)){
			last_squad_count = (array_length(obj_ini.squads) + 1);
			create_squad("assault_squad", company);
		}		
	}
}

/* okay so basically htis functions loops through a given company and attempts to sortv the units in the company not in a squad already into 
the requested squad type , if the squad is not possible it will  not be made*/
// squad_type: the type of squad to be created as a string to access the correct key in obj_ini.squad_types
// company : the company you wish to create the squad in (int)
//squad_loadout: true if you want to use the squad loadout sorting algorithem to re-equip the squad in accordance with the squad type loadout
function create_squad(squad_type, company, squad_loadout = true){
		var fill_squad, squad_fulfilment, i, squad_unit_types, fulfilled,unit, 
		squad, sergeant_found, highest_exp, exp_unit, squad_unit,
		 required_load, unit_type, load_out_name, load_out_areas, load_out_slot,load_item,
		 optional_load, item_to_add;
		var squad_count = array_length(obj_ini.squads);
		fill_squad =  obj_ini.squad_types[$ squad_type];			//grab all the squad struct info from the squad_types struct
		squad_fulfilment = {};		
		squad_unit_types = struct_get_names(fill_squad);		//find out what type of units squad consists of
		for (i = 0;i < array_length(squad_unit_types);i++){
			squad_fulfilment[$ squad_unit_types[i]] =0;	//create a fulfilment structure to log members of squad
		}
		squad = {type : squad_type, members:[]};
		sergeant_found = false;
		//if squad has sergeants in find out if there are any available sergeants
		if (struct_exists(squad_fulfilment ,obj_ini.role[100,18])){
			sergeant_found = false;
			for (i = 0; i < array_length(obj_ini.TTRPG[company]);i++;){	
				unit = obj_ini.TTRPG[company,i];
				if (unit.squad== "none"){
					if (unit.role() == obj_ini.role[100,18]){
						squad_fulfilment[$ obj_ini.role[100,18]] += 1;
						array_push(squad.members, unit);
						sergeant_found = true;// free sergeant is found mark it so a marine dose not get promoted
						break;
					}
				}
			}
		}
		for (i = 0; i < array_length( obj_ini.TTRPG[company]);i++;){								//fill squad roles
			unit = obj_ini.TTRPG[company,i];
			if (unit.squad== "none") and (array_contains(squad_unit_types, unit.role())){
				//if no sergeant found add one marine to standard marine selection so that a marine can be promoted
				if (array_contains(["tactical_squad", "assault_squad"], squad_type))and (sergeant_found == false){
					if (squad_fulfilment[$ unit.role()]< (fill_squad[$ unit.role()][$ "max"] + 1)){
						squad_fulfilment[$ unit.role()]++;
						array_push(squad.members, unit);	
					}
				}//if sergeants not required
				else if (squad_fulfilment[$ unit.role()]< fill_squad[$ unit.role()][$ "max"]){
					squad_fulfilment[$ unit.role()]++;
					array_push(squad.members, unit);
				}
			}
		}
		//if a new sergeant is needed find the marine with the highest experience in the squad 
		//(which if everything works right should be a marine with the old_guard, seasoned, or ancient trait)
		if (struct_exists(squad_fulfilment ,obj_ini.role[100,18])) and (sergeant_found == false) and ((squad_fulfilment[$ obj_ini.role[100,8]] > 4)or (squad_fulfilment[$ obj_ini.role[100,10]] > 4) ){
			highest_exp = 0;
			for (i = 0; i < array_length(squad.members);i++;){
				unit = squad.members[i];
				if (unit.experience() > highest_exp){
					highest_exp = unit.experience();
					exp_unit = unit;
				};
			}
			squad_fulfilment[$ obj_ini.role[100,18]]++;
		}
		//evaluate if the minimum unit type requirements have been met to create a new squad
		fulfilled = true;
		for (i = 0;i < array_length(squad_unit_types);i++){
			if (squad_fulfilment[$ squad_unit_types[i]] < fill_squad[$ squad_unit_types[i]][$ "min"]){
				fulfilled = false;
			}
			if (fulfilled == false){
				break
			}
		}
		if (fulfilled == true){
			if (struct_exists(squad_fulfilment ,obj_ini.role[100,18])) and (sergeant_found == false){
				exp_unit.update_role(obj_ini.role[100,18]); //if squad is viable promote marine to sergeant
			}
			//update units squad marke
			for (i = 0; i < array_length(squad.members);i++;){
				unit = squad.members[i];
				unit.squad = squad_count;
			}
			array_push(obj_ini.squads, squad); //push squad to squads array thus creating squad

			// heres where the whole thing gets annoying
			/*basically each equipment slot is looped through and inside each loop each marine is looped through in a random order to ensure 
				that each squad looks different and that each marine has a range of optional and required equipment
				required equipmetn is things like boltguns and combat knives in a tactical squad
				optional equipment is stuff like lascannons and specialist equipment in a tactical squad or plasma pistols in an assualt squad
				in future i'd like to tailer these to marine skill sets e.g the marines with the best ranged stats get given the best ranged equipment	
			*/
			if (squad_loadout == true ){
				for (i = 0;i < array_length(squad_unit_types);i++;){
					unit_type = squad_unit_types[i];
					required_load = "none";
					optional_load = "none";
					 if (struct_exists(fill_squad[$ unit_type],"loadout")){						//find out if the unit type for the squad has optional equipment thresholds
						if (struct_exists(fill_squad[$ unit_type][$ "loadout"],"option")){
							if (optional_load == "none"){
							  	optional_load = DeepCloneStruct(fill_squad[$ unit_type][$ "loadout"][$ "option"]);
							  	load_out_areas = struct_get_names(fill_squad[$ unit_type][$ "loadout"][$ "option"]);
							  	for (load_out_name = 0; load_out_name < array_length(load_out_areas);load_out_name++;){
									load_out_slot = load_out_areas[load_out_name];
									for (load_item = 0; load_item < array_length(optional_load[$ load_out_slot]);load_item++;){									
							  			array_push(optional_load[$ load_out_slot][load_item],0);
							  		}
							  	}
							}
						}					 	
						 
						if (struct_exists(fill_squad[$ unit_type][$ "loadout"],"required")){	//find out if the unit type for the squad has required  equipment thresholds
							if (required_load == "none"){
							  	required_load = DeepCloneStruct(fill_squad[$ unit_type][$ "loadout"][$ "required"]);
							  	load_out_areas = struct_get_names(fill_squad[$ unit_type][$ "loadout"][$ "required"]);
								for (load_out_name = 0; load_out_name < array_length(load_out_areas);load_out_name++;){
									load_out_slot = load_out_areas[load_out_name];
									array_push(required_load[$ load_out_slot],0);
								}
							}
						}											
						var copy_squad;
						var new_copy_unit;
						for (load_out_name = 0; load_out_name < array_length(load_out_areas);load_out_name++;){
							copy_squad = [];
							load_out_slot = load_out_areas[load_out_name];
							array_copy(copy_squad,0,squad.members,0, array_length(squad.members)); //create a copy of the squad members
							while (array_length(copy_squad) > 0){
								new_copy_unit = irandom(array_length(copy_squad)-1);  //loop through the squad members randomly so that each squad has different marine loadouts
								unit = copy_squad[new_copy_unit];
								if (unit.role() == unit_type){
									if (struct_exists(fill_squad[$ unit_type],"loadout")){		
										if (required_load != "none"){
											if (required_load[$ load_out_slot][2] <required_load[$ load_out_slot][1]){		//if the required amount of equipment is not in the squad already equip this marine with equipment
												unit.alter_equipment({load_out_slot:required_load[$ load_out_slot][0]})
												required_load[$ load_out_slot][2]++;
										  	} else{	 //if all required equipment is included in the squad start adding optional equipment
												if (struct_exists(fill_squad[$ unit_type][$ "loadout"],"option")){
													if (optional_load != "none"){
										  				if (struct_exists(optional_load, load_out_slot)){
										  					for (load_item = 0; load_item < array_length(optional_load[$ load_out_slot]);load_item++;){
											  					if (optional_load[$ load_out_slot][load_item][2] <optional_load[$ load_out_slot][load_item][1]){
											  						
											  						if (is_array(optional_load[$ load_out_slot][load_item][0])){ //if the array items are varibale e.g a struct
											  							item_to_add = optional_load[$ load_out_slot][load_item][0][irandom(array_length(optional_load[$ load_out_slot][load_item][0])-1)]
											  						} else {
											  							item_to_add = optional_load[$ load_out_slot][load_item][0];
											  						}
																	unit.alter_equipment({load_out_slot:item_to_add})
															  		switch(load_out_slot){
															  			case "wep1":
															  				unit.update_weapon_one(item_to_add);
															  				break;
															  			case "wep2":
															  				unit.update_weapon_two(item_to_add);
															  				break;															  				
																				  		}
															  		optional_load[$ load_out_slot][load_item][2]++;
															  		break;
														  		}
													  		}
										  				}
													}
												}			  		
										  	}				

										}	
									}
								}
								array_delete(copy_squad, new_copy_unit,1);
							}
						}
						 
					}
				}
			}
		}
	}	


//function for making deep copies of structs as gml has no function
function DeepCloneStruct(s){
    if( is_array(s) ){
        var len = array_length(s);
        var arr = array_create(len);
        for( var i=0; i<len; ++i ){
            arr[i] = DeepCloneStruct(s[i]);
        }
        return arr;
    }else if( is_struct(s) ){
        var stc = {};
        var nms = variable_struct_get_names(s);
        var len = array_length(nms);
        for( var i=0; i<len; ++i ){
            var nm = nms[i];
            stc[$nm] = DeepCloneStruct(s[$nm]);
        }
        return stc;
    }
    return s;
}