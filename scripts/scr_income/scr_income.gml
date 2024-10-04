function scr_income() {

	// Determines income


	income_base=50;income_tribute=0;income_controlled_planets=0;
	if (obj_ini.fleet_type != ePlayerBase.home_world) then income_base=50;
		// if(rene == 1) then income_base=0;

	income_home=0;
	if (obj_ini.fleet_type=ePlayerBase.home_world) then income_home=10;// Homeworld-based income


	income_fleet=0;
	with(obj_p_fleet){
	    obj_controller.income_fleet-=capital_number;
	    obj_controller.income_fleet-=frigate_number/2;
	    obj_controller.income_fleet-=escort_number/10;
	}
	if (obj_ini.fleet_type = ePlayerBase.home_world) then obj_controller.income_fleet=round(obj_controller.income_fleet/2);

	income_forge=0;
	income_agri=0;
	income_recruiting=0;
	income_training=0;

	var pid;pid=0;pid=scr_role_count(obj_ini.role[100][16],"");
	if (pid>=((disposition[3]/2)+5)) then training_techmarine=0;

	if (training_apothecary=1) then income_training-=1;
	if (training_apothecary=2) then income_training-=2;
	if (training_apothecary=3) then income_training-=3;
	if (training_apothecary=4) then income_training-=4;
	if (training_apothecary=5) then income_training-=6;
	if (training_apothecary=6) then income_training-=12;

	if (training_chaplain=1) then income_training-=1;
	if (training_chaplain=2) then income_training-=2;
	if (training_chaplain=3) then income_training-=3;
	if (training_chaplain=4) then income_training-=4;
	if (training_chaplain=5) then income_training-=6;
	if (training_chaplain=6) then income_training-=12;

	if (training_psyker=1) then income_training-=1;
	if (training_psyker=2) then income_training-=2;
	if (training_psyker=3) then income_training-=3;
	if (training_psyker=4) then income_training-=4;
	if (training_psyker=5) then income_training-=6;
	if (training_psyker=6) then income_training-=12;

	if (training_techmarine=1) then income_training-=1;
	if (training_techmarine=2) then income_training-=2;
	if (training_techmarine=3) then income_training-=3;
	if (training_techmarine=4) then income_training-=4;
	if (training_techmarine=5) then income_training-=6;
	if (training_techmarine=6) then income_training-=12;



	income_recruiting=(recruiting*-2)*string_count("|",obj_controller.recruiting_worlds);

	tau_stars=0;if (instance_exists(obj_turn_end)) then tau_messenger+=1;

	if (obj_ini.fleet_type=ePlayerBase.home_world){
	    with(obj_star){
	        if (planet_feature_bool(p_feature[1], P_features.Monastery)==1){obj_controller.income+=10;instance_create(x,y,obj_temp1);}
	        if (planet_feature_bool(p_feature[2], P_features.Monastery)==1){obj_controller.income+=10;instance_create(x,y,obj_temp1);}
	        if (owner = eFACTION.Tau) then obj_controller.tau_stars+=1;
	        alarm[2]=1;
	    }
	}


	if (obj_ini.fleet_type != ePlayerBase.home_world){
	    with(obj_p_fleet){
	        if (action="") and (capital_number>0){
	            var mine;mine=instance_nearest(x,y,obj_star);
	            var i;i=0;
	            repeat(4){i+=1;
	                if (mine.p_owner[i]=eFACTION.Imperium) or (mine.p_owner[i]=eFACTION.Mechanicus){
	                    if (mine.p_type[i]="Desert") or (mine.p_type[i]="Temperate") then obj_controller.income_home+=2*capital_number;
	                    if (mine.p_type[i]="Forge") or (mine.p_type[i]="Hive") then obj_controller.income_home+=4*capital_number;
	                }
	            }
	        }
	    }
	}


	with(obj_star){
	    var o;o=0;
	    repeat(4){o+=1;
	        if (dispo[o]>=100){
	            if (planet_feature_bool(p_feature[1], P_features.Monastery)==0){
	                obj_controller.income_controlled_planets+=1;obj_controller.income_tribute+=1;
					// low pops
	                if (p_type[o]="Death") then obj_controller.income_tribute+=1;
	                if (p_type[o]="Desert") then obj_controller.income_tribute+=2;
	                if (p_type[o]="Ice") then obj_controller.income_tribute+=2;
						// High tectonic activity tends to liberate more minerals and other resources in the depths of the planet
	                if (p_type[o]="Lava") then obj_controller.income_tribute+=199;
					// Earth-likes
						// Agri worlds feed other worlds
	                if (p_type[o]="Agri") then obj_controller.income_tribute+=9;
						// Low literacy means low skill of labor
	                if (p_type[o]="Feudal") then obj_controller.income_tribute+=4;
						// The church takes part of the tithe
	                if (p_type[o]="Shrine") then obj_controller.income_tribute+=4;
						// The standard
	                if (p_type[o]="Temperate") then obj_controller.income_tribute+=9;
					// The hives with insane number of pops
	                if (p_type[o]="Hive") then obj_controller.income_tribute+=149;
	                if (p_type[o]="Forge") then obj_controller.income_tribute+=199;
	            }
	        }
	    }
	}




	obj_controller.alarm[4]=10;
	// This tells the controller to give moolah if it is the end of the turn


}
