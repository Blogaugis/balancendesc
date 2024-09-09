function new_colony_fleet (doner_star, doner_planet, target, target_planet, mission="new_colony"){
    var new_colonise_fleet=instance_create(doner_star.x,doner_star.y,obj_en_fleet);
    new_colonise_fleet.owner = eFACTION.Imperium;
    new_colonise_fleet.sprite_index=spr_fleet_civilian;
    new_colonise_fleet.image_index=3;

    var doner_volume = 0;
    if (doner_star.p_large[doner_planet]=1) {
        doner_volume = floor(doner_star.p_population[doner_planet]*0.01*power(10,8));
        doner_star.p_population[doner_planet]*=0.99;
    } else {
        doner_volume = doner_star.p_population[doner_planet]*0.1;
        doner_star.p_population[doner_planet]*=0.90;       
    }
    var new_cargo = {
        colonists : doner_volume,
        mission : mission,
        target_planet : target_planet,
        colonist_influence : doner_star.p_influence[doner_planet]
    }

    //TODO flesh out colonisation efforts
    if (doner_star.p_population[target_planet] && doner_star.p_type[doner_planet] == "Hive"){
    	new_colonise_fleet.image_index=3; 
        new_colonise_fleet.trade_goods="colonize";
    } else {
    	new_colonise_fleet.image_index=choose(1,2);
        new_colonise_fleet.trade_goods="colonize";
    }

    new_colonise_fleet.cargo_data.colonize = new_cargo; 

    new_colonise_fleet.action_x=target.x;
    new_colonise_fleet.action_y=target.y;
    with (new_colonise_fleet){
        set_fleet_movement();
    }
    scr_event_log("green",$"New colony fleet departs from {doner_star.name}. for the {target.name} system",doner_star.name);

}

function fleet_has_cargo(desired_cargo, fleet="none"){
    if (fleet == "none"){
        return struct_exists(cargo_data, desired_cargo);
    } else {
        var has_cargo = false;
        with (fleet){
            has_cargo =  fleet_has_cargo();
        }
        return has_cargo;
    }
}

function deploy_colonisers(star){
    var lag=1,r=0;

    var data = cargo_data.colonize;
    if (data.target_planet>0){
        var targ_planet = data.target_planet;
        star.p_large[targ_planet]=0;
        star.p_population[targ_planet] += data.colonists;
        var colony_purpose = data.mission=="new_colony"? "recolonise" : "bolster population" ;
        scr_alert("green","duhuhuhu",$"Imperial citizens {colony_purpose} {planet_numeral_name(targ_planet, star)} I.",star.x,star.y);
    } else {
        for (r=1;r<=star.planets;r++){
            if (data.mission == "new_colony") && (star.p_population[r]<=0) then continue;
            if (star.p_type[r]!="") and (star.p_type[r]!="Dead") {
                if (lag=1){
                    star.p_population[r] += data.colonists;
                    star.p_large[r]=0;
                    guardsmen=0;
                }
                if (lag=2){
                    star.p_population[r] += data.colonists;
                    star.p_large[r]=1;
                    guardsmen=0;
                }

                scr_alert("green","duhuhuhu",$"Imperial citizens recolonize {planet_numeral_name(r, star)} I.",star.x,star.y);
                
                star.dispo[r]=min(obj_ini.imperium_disposition,obj_controller.disposition[2])+choose(-1,-2,-3,-4,0,1,2,3,4);
                if (star.name=obj_ini.home_name) and (star.p_type[r]=obj_ini.home_type) and (obj_controller.homeworld_rule!=1) then star.dispo[r]=-5000;
                
                // star.present_fleet[owner]-=1;
                instance_destroy();
                exit;
            }
        }  
    }   
}