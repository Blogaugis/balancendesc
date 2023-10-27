function role_groups(group){
	var role_list = false;
	switch (group){
		case "lib":
			role_list = [
						string("Chief {0}",obj_ini.role[100,17]),
						obj_ini.role[100,17], //librarian
						"Codiciery",
						"Lexicanum",
			];
			break;

	}
	return role_list;
}

function is_specialist(unit_role, type="standard", include_trainee=false) {

	// unit_role
	//TODO need to make all string roles not strings but array references
	var specialist=false;
	switch(type){
		case "standard":
			specialists = ["Chapter Master",
							"Forge Master",
							"Master of Sanctity",
							"Master of the Apothecarion",
							string("Chief {0}",obj_ini.role[100,17]),//chief librarian
							obj_ini.role[100,5],//captain
							obj_ini.role[100,6],//dreadnought
							obj_ini.role[100,7],//company_champion
							obj_ini.role[100,14],//chaplain
							obj_ini.role[100,15],//apothecary
							obj_ini.role[100,16],//techmarine
							obj_ini.role[100,17], //librarian
							"Codiciery",
							"Lexicanum",
							obj_ini.role[100,2],//honour guard
			];
			if (include_trainee){
				array_push(specialists, 
							 string("{0} Aspirant",obj_ini.role[100,17]),
							 string("{0} Aspirant",obj_ini.role[100,15]),  
							 string("{0} Aspirant",obj_ini.role[100,14]),
							 string("{0} Aspirant",obj_ini.role[100,16]),
							 );
			}
			break;

		case "libs":
			specialists = role_groups("lib");
			if (include_trainee){
				array_push(specialists,  string("{0} Aspirant",obj_ini.role[100,17]));
			}
			break;
		case "forge":
			specialists = [
						obj_ini.role[100,16],//techmarine
						"Forge Master", 
			];
			if (include_trainee){
				array_push(specialists,  string("{0} Aspirant",obj_ini.role[100,16]));
			}			
			break;
		case "chap":
			specialists = [
						obj_ini.role[100,14],//techmarine
						"Master of Sanctity",
			];
			if (include_trainee){
				array_push(specialists,  string("{0} Aspirant",obj_ini.role[100,14]));
			}			
			break;
		case "apoth":
			specialists = [
						obj_ini.role[100,15],//techmarine
						"Master of the Apothecarion",
			];
			if (include_trainee){
				array_push(specialists,  string("{0} Aspirant",obj_ini.role[100,15]));
			}			
			break;
		case "heads":
			specialists = ["Master of Sanctity",
						string("Chief {0}", obj_ini.role[100,17]),
						"Forge Master", 
						"Chapter Master", 
						"Master of the Apothecarion"
			]
			break;								
	}

	specialist = (array_contains(specialists,unit_role)) ? true : false;

	return specialist;
}
