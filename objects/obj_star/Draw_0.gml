// Draws the system name and color codes it based on ownership
if (p_type[1]="Craftworld") and (obj_controller.known[eFACTION.Eldar]=0){
    draw_set_alpha(0);
    draw_set_color(255);
    draw_circle(old_x,old_y,5,0);
    draw_set_alpha(1);
    exit;
}

var show=name;

if (global.cheat_debug=true) then show=string(name)+"#"+string(p_problem[1,1])+":"+string(p_timer[1,1])+"#"+string(p_problem[1,2])+":"+string(p_timer[1,2])+"#"+string(p_problem[1,3])+":"+string(p_timer[1,3]);

draw_set_color(c_white);
draw_set_alpha(0.25);

if (!craftworld) and (vision==1) then draw_self();
if (craftworld) then draw_sprite_ext(spr_craftworld,0,x,y,1,1,point_direction(x,y,room_width/2,room_height/2)+90,c_white,1);
if (space_hulk) then draw_sprite_ext(spr_star_hulk,0,x,y,1,1,0,c_white,1);

if (storm>0) then draw_sprite_ext(spr_warp_storm,storm_image,x,y,0.75,0.75,0,c_white,1);

//ad hoc way of determining whether stuff is in view or not...needs work

draw_set_halign(fa_center);
draw_set_font(fnt_cul_14);
draw_set_alpha(1);
var scale = obj_controller.zoomed ? 2 : 1;
if (!global.load && (obj_controller.zoomed || in_camera_view(star_box_shape()))) {
    if (garrison){
        draw_sprite(spr_new_resource,3,x-30,y+15);
        if (scr_hit(x-40,y+10,x-10,y+35)){
            tooltip_draw("Marine Garrison in system");
        }
    }
    if (point_in_rectangle(mouse_x, mouse_y,x-128,y, x+128, y+80) && obj_controller.zoomed){
        scale = 3.5;
    }    
    if (stored_owner != owner || !surface_exists(star_tag_surface)){
        star_tag_surface = surface_create(256, 128);
        var xx=64;
        var yy=0;
        surface_set_target(star_tag_surface);
        var panel_width = string_width(name) + 60;
        if (owner != eFACTION.Player ){
            var faction_sprite = obj_img.force[owner];
            var faction_index = 0;
            var faction_colour = global.star_name_colors[owner];
            draw_sprite_general(spr_p_name_bg, 0, 0, 0, string_width(name) + 60, 32, xx-(panel_width/2), yy+30, 1, 1, 0, faction_colour, faction_colour, faction_colour, faction_colour, 1);
            if (obj_img.force_exists[owner]==-1){
                try{
                    scr_image("force",-50,0,0,0,0);
                    var faction_sprite = obj_img.force[owner];
                    draw_sprite_ext(faction_sprite,faction_index,xx+(panel_width/2)-30,yy+25, 0.60, 0.60, 0, c_white, 1);
                } catch(_exception){
                    show_debug_message("{0}", _exception);
                }
            } else {
                draw_sprite_ext(faction_sprite,faction_index,xx+(panel_width/2)-30,yy+25, 0.60, 0.60, 0, c_white, 1);
            }
        } else {
            scr_shader_initialize();
            var main_color = make_colour_from_array(obj_controller.body_colour_replace);
            var pauldron_color = make_colour_from_array(obj_controller.pauldron_colour_replace);
            draw_sprite_general(spr_p_name_bg, 0, 0, 0, string_width(name) + 60, 32, xx-(panel_width/2), yy+30, 1, 1, 0, main_color, main_color, pauldron_color, pauldron_color, 1);
            var faction_sprite = obj_img.creation[1];
            var faction_index = obj_ini.icon;
            draw_sprite_ext(faction_sprite,faction_index,xx+(panel_width/2)-30,yy+30, 0.2, 0.2, 0, c_white, 1);
            //context.set_vertical_gradient(main_color, pauldron_color);
            //draw_text_ext_transformed_color(gx + xoffset,gy + yoffset,text,sep,owner.width,xscale,yscale,angle ,col1, col2, col3, col4, alpha);
        }
        draw_set_color(c_white);
        draw_text(xx, yy+33, name)
        surface_reset_target();
        stored_owner = owner;
        draw_surface_ext(star_tag_surface, x-(64*scale), y, scale, scale, 1, c_white, 1);
    } else {
        draw_surface_ext(star_tag_surface, x-(64*scale), y, scale, scale, 1, c_white, 1);
    }
}
draw_set_valign(fa_top)






