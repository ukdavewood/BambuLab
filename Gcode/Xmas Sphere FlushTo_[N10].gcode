; HEADER_BLOCK_START
; BambuStudio 01.07.06.92
; model printing time: 16m 10s; total estimated time: 22m 56s
; total layer number: 127
; model label id: 1776
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0,0,0,0,0,0,0,0,0,0,0
; additional_cooling_fan_speed = 70,70,70,70,70,70,70,70,70,70,70,70
; auxiliary_fan = 1
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; before_layer_change_gcode = 
; best_object_pos = 0.5,0.5
; bottom_shell_layers = 3
; bottom_shell_thickness = 0
; bottom_surface_pattern = monotonic
; bridge_angle = 0
; bridge_flow = 1
; bridge_no_support = 0
; bridge_speed = 50
; brim_object_gap = 0.1
; brim_type = auto_brim
; brim_width = 5
; chamber_temperatures = 0,0,0,0,0,0,0,0,0,0,0,0
; change_filament_gcode = M620 S[next_extruder]A\nM204 S9000\n{if toolchange_count > 1 && (z_hop_types[current_extruder] == 0 || z_hop_types[current_extruder] == 3)}\nG17\nG2 Z{z_after_toolchange + 0.4} I0.86 J0.86 P1 F10000 ; spiral lift a little from second lift\n{endif}\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\n\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\n\n{if next_extruder < 255}\nM400\n\nG92 E0\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM109 S[nozzle_temperature_range_high]\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\nG1 X80 F15000\nG1 X60 F15000\nG1 X80 F15000\nG1 X60 F15000; shake to put down garbage\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A
; close_fan_the_first_x_layers = 1,1,1,1,1,1,1,1,1,1,1,1
; complete_print_exhaust_fan_speed = 70,70,70,70,70,70,70,70,70,70,70,70
; cool_plate_temp = 35,35,35,35,35,35,35,35,35,35,35,35
; cool_plate_temp_initial_layer = 35,35,35,35,35,35,35,35,35,35,35,35
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_filament_colour = ;;;;;;;;;;;
; default_filament_profile = "Bambu PLA Basic @BBL X1C"
; default_jerk = 0
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; different_settings_to_system = prime_tower_width;prime_volume;sparse_infill_density;sparse_infill_pattern;;;;;;;;;;;;;
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70,70,70,70,70,70,70,70,70,70,70
; elefant_foot_compensation = 0.15
; enable_arc_fitting = 1
; enable_overhang_bridge_fan = 1,1,1,1,1,1,1,1,1,1,1,1
; enable_overhang_speed = 1
; enable_pressure_advance = 0,0,0,0,0,0,0,0,0,0,0,0
; enable_prime_tower = 0
; enable_support = 0
; enforce_support_layers = 0
; eng_plate_temp = 0,0,0,0,0,0,0,0,0,0,0,0
; eng_plate_temp_initial_layer = 0,0,0,0,0,0,0,0,0,0,0,0
; ensure_vertical_shell_thickness = 1
; exclude_object = 1
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 36
; extruder_clearance_max_radius = 68
; extruder_clearance_radius = 57
; extruder_colour = #018001
; extruder_offset = 0x2
; extruder_type = DirectDrive
; fan_cooling_layer_time = 100,100,100,100,100,100,100,100,100,100,100,100
; fan_max_speed = 100,100,100,100,100,100,100,100,100,100,100,100
; fan_min_speed = 100,100,100,100,100,100,100,100,100,100,100,100
; filament_colour = #84620D;#FFFFFF;#C00D1E;#000000;#97999B;#FF6A13;#00358E;#FCE300;#8BD5EE;#00AE42;#FF6A13;#005F61
; filament_cost = 24.99,24.99,24.99,24.99,24.99,24.99,24.99,24.99,24.99,24.99,24.99,24.99
; filament_density = 1.26,1.32,1.26,1.26,1.26,1.26,1.26,1.26,1.26,1.26,1.26,1.26
; filament_diameter = 1.75,1.75,1.75,1.75,1.75,1.75,1.75,1.75,1.75,1.75,1.75,1.75
; filament_end_gcode = "; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n"
; filament_flow_ratio = 0.98,0.98,0.98,0.98,0.98,0.98,0.98,0.98,0.98,0.98,0.98,0.98
; filament_ids = GFA00;GFA01;GFA00;GFA00;GFA00;GFA00;GFA00;GFA00;GFA00;GFA00;GFA00;GFA00
; filament_is_support = 0,0,0,0,0,0,0,0,0,0,0,0
; filament_max_volumetric_speed = 21,22,21,21,21,21,21,21,21,21,21,21
; filament_minimal_purge_on_wipe_tower = 15,15,15,15,15,15,15,15,15,15,15,15
; filament_settings_id = "Bambu PLA Basic @BBL X1C";"Bambu PLA Matte @BBL X1C";"Bambu PLA Basic @BBL X1C";"Bambu PLA Basic @BBL X1C";"Bambu PLA Basic @BBL X1C";"Bambu PLA Basic @BBL X1C";"Bambu PLA Basic @BBL X1C";"Bambu PLA Basic @BBL X1C";"Bambu PLA Basic @BBL X1C";"Bambu PLA Basic @BBL X1C";"Bambu PLA Basic @BBL X1C";"Bambu PLA Basic @BBL X1C"
; filament_soluble = 0,0,0,0,0,0,0,0,0,0,0,0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA;PLA;PLA;PLA;PLA;PLA;PLA;PLA;PLA;PLA;PLA;PLA
; filament_vendor = "Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab"
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0,567,233,168,369,348,240,496,517,349,348,210,245,0,304,187,167,339,277,341,207,290,339,234,320,655,0,177,475,404,253,609,617,486,404,223,461,667,441,0,499,617,367,740,619,519,617,380,227,404,283,167,0,309,250,476,318,265,309,207,232,570,222,212,361,0,285,409,508,293,167,254,470,667,437,167,487,587,0,703,518,441,587,255,251,450,323,228,285,240,298,0,328,304,240,267,274,370,316,221,199,340,196,430,0,246,340,167,240,582,281,182,380,465,255,594,443,0,465,218,232,570,222,212,361,167,285,409,508,293,0,254,379,609,364,167,419,551,187,671,461,338,551,0
; flush_volumes_vector = 140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0,0,0,0,0,0,0,0,0,0,0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 200
; gcode_add_line_number = 0
; gcode_flavor = marlin
; host_type = octoprint
; hot_plate_temp = 55,55,55,55,55,55,55,55,55,55,55,55
; hot_plate_temp_initial_layer = 55,55,55,55,55,55,55,55,55,55,55,55
; independent_support_layer_height = 1
; infill_combination = 0
; infill_direction = 45
; infill_jerk = 9
; infill_wall_overlap = 15%
; initial_layer_acceleration = 500
; initial_layer_flow_ratio = 1
; initial_layer_infill_speed = 105
; initial_layer_jerk = 9
; initial_layer_line_width = 0.5
; initial_layer_print_height = 0.2
; initial_layer_speed = 50
; inner_wall_acceleration = 0
; inner_wall_jerk = 9
; inner_wall_line_width = 0.45
; inner_wall_speed = 200
; interface_shells = 0
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 200
; ironing_flow = 10%
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 E-[retraction_length] F1800\nG17\nG2 Z{layer_z + 0.4} I0.86 J0.86 P1 F20000 ; spiral lift a little\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400 P300\nM971 S11 C10 O0\nG92 E0\nG1 E[retraction_length] F300\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.28
; line_width = 0.42
; machine_end_gcode = ;===== date: 20230428 =====================\nM400 ; wait for buffer to clear\nG92 E0 ; zero the extruder\nG1 E-0.8 F1800 ; retract\nG1 Z{max_layer_z + 0.5} F900 ; lower z a little\nG1 X65 Y245 F12000 ; move to safe pos \nG1 Y265 F3000\n\nG1 X65 Y245 F12000\nG1 Y265 F3000\nM140 S0 ; turn off bed\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off remote part cooling fan\nM106 P3 S0 ; turn off chamber cooling fan\n\nG1 X100 F12000 ; wipe\n; pull back filament to AMS\nM620 S255\nG1 X20 Y50 F12000\nG1 Y-3\nT255\nG1 X65 F12000\nG1 Y265\nG1 X100 F12000 ; wipe\nM621 S255\nM104 S0 ; turn off hotend\n\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n    M400 ; wait all motion done\n    M991 S0 P-1 ;end smooth timelapse at safe pos\n    M400 S3 ;wait for last picture to be taken\nM623; end of "timelapse_record_flag"\n\nM400 ; wait all motion done\nM17 S\nM17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom\n{if (max_layer_z + 100.0) < 250}\n    G1 Z{max_layer_z + 100.0} F600\n    G1 Z{max_layer_z +98.0}\n{else}\n    G1 Z250 F600\n    G1 Z248\n{endif}\nM400 P100\nM17 R ; restore z current\n\nG90\nG1 X128 Y250 F3600\n\nM220 S100  ; Reset feedrate magnitude\nM201.2 K1.0 ; Reset acc magnitude\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 0\n\nM17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power\n
; machine_load_filament_time = 29
; machine_max_acceleration_e = 5000,5000
; machine_max_acceleration_extruding = 20000,20000
; machine_max_acceleration_retracting = 5000,5000
; machine_max_acceleration_travel = 9000,9000
; machine_max_acceleration_x = 20000,20000
; machine_max_acceleration_y = 20000,20000
; machine_max_acceleration_z = 500,200
; machine_max_jerk_e = 2.5,2.5
; machine_max_jerk_x = 9,9
; machine_max_jerk_y = 9,9
; machine_max_jerk_z = 3,3
; machine_max_speed_e = 30,30
; machine_max_speed_x = 500,200
; machine_max_speed_y = 500,200
; machine_max_speed_z = 20,20
; machine_min_extruding_rate = 0,0
; machine_min_travel_rate = 0,0
; machine_pause_gcode = M400 U1
; machine_start_gcode = ;===== machine: X1 =========================\n;===== date: 20230707 =====================\n;===== turn on the HB fan =================\nM104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle\n;===== reset machine status =================\nG91\nM17 Z0.4 ; lower the z-motor current\nG380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed\nG380 S2 Z-25 F300 ;\nG1 Z5 F300;\nG90\nM17 X1.2 Y1.2 Z0.75 ; reset motor current to default\nM960 S5 P1 ; turn on logo lamp\nG90\nM220 S100 ;Reset Feedrate\nM221 S100 ;Reset Flowrate\nM73.2   R1.0 ;Reset left time magnitude\nM1002 set_gcode_claim_speed_level : 5\nM221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem\nG29.1 Z{+0.0} ; clear z-trim value first\nM204 S10000 ; init ACC set to 10m/s^2\n\n;===== heatbed preheat ====================\nM1002 gcode_claim_action : 2\nM140 S[bed_temperature_initial_layer_single] ;set bed temp\nM190 S[bed_temperature_initial_layer_single] ;wait for bed temp\n\n{if scan_first_layer}\n;=========register first layer scan=====\nM977 S1 P60\n{endif}\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_no_support_extruder]=="PLA"}\n    {if (bed_temperature[initial_no_support_extruder] >45)||(bed_temperature_initial_layer[initial_no_support_extruder] >45)}\n    M106 P3 S180\n    {elsif (bed_temperature[initial_no_support_extruder] >50)||(bed_temperature_initial_layer[initial_no_support_extruder] >50)}\n    M106 P3 S255\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\n;===== prepare print temperature and material ==========\nM104 S[nozzle_temperature_initial_layer] ;set extruder temp\nG91\nG0 Z10 F1200\nG90\nG28 X\nM975 S1 ; turn on\nG1 X60 F12000\nG1 Y245\nG1 Y265 F3000\nM620 M\nM620 S[initial_no_support_extruder]A   ; switch material if AMS exist\n    M109 S[nozzle_temperature_initial_layer]\n    G1 X120 F12000\n\n    G1 X20 Y50 F12000\n    G1 Y-3\n    T[initial_no_support_extruder]\n    G1 X54 F12000\n    G1 Y265\n    M400\nM621 S[initial_no_support_extruder]A\nM620.1 E F{filament_max_volumetric_speed[initial_no_support_extruder]/2.4053*60} T{nozzle_temperature_range_high[initial_no_support_extruder]}\n\nM412 S1 ; ===turn on filament runout detection===\n\nM109 S250 ;set nozzle to common flush temp\nM106 P1 S0\nG92 E0\nG1 E50 F200\nM400\nM104 S[nozzle_temperature_initial_layer]\nG92 E0\nG1 E50 F200\nM400\nM106 P1 S255\nG92 E0\nG1 E5 F300\nM109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-20} ; drop nozzle temp, make filament shink a bit\nG92 E0\nG1 E-0.5 F300\n\nG1 X70 F9000\nG1 X76 F15000\nG1 X65 F15000\nG1 X76 F15000\nG1 X65 F15000; shake to put down garbage\nG1 X80 F6000\nG1 X95 F15000\nG1 X80 F15000\nG1 X165 F15000; wipe and shake\nM400\nM106 P1 S0\n;===== prepare print temperature and material end =====\n\n\n;===== wipe nozzle ===============================\nM1002 gcode_claim_action : 14\nM975 S1\nM106 S255\nG1 X65 Y230 F18000\nG1 Y264 F6000\nM109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]-20}\nG1 X100 F18000 ; first wipe mouth\n\nG0 X135 Y253 F20000  ; move to exposed steel surface edge\nG28 Z P0 T300; home z with low precision,permit 300deg temperature\nG29.2 S0 ; turn off ABL\nG0 Z5 F20000\n\nG1 X60 Y265\nG92 E0\nG1 E-0.5 F300 ; retrack more\nG1 X100 F5000; second wipe mouth\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X100 F5000\nG1 X70 F15000\nG1 X90 F5000\nG0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle\nM104 S140 ; set temp down to heatbed acceptable\nM106 S255 ; turn on fan (G28 has turn off fan)\n\nM221 S; push soft endstop status\nM221 Z0 ;turn off Z axis endstop\nG0 Z0.5 F20000\nG0 X125 Y259.5 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y262.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y260.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.5\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 Z0.5 F20000\nG0 X125 Y261.0\nG0 Z-1.01\nG0 X131 F211\nG0 X124\nG0 X128\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\nG2 I0.5 J0 F300\n\nM109 S140 ; wait nozzle temp down to heatbed acceptable\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\nG2 I0.5 J0 F3000\n\nM221 R; pop softend status\nG1 Z10 F1200\nM400\nG1 Z10\nG1 F30000\nG1 X128 Y128\nG29.2 S1 ; turn on ABL\n;G28 ; home again after hard wipe mouth\nM106 S0 ; turn off fan , too noisy\n;===== wipe nozzle end ================================\n\n;===== check scanner clarity ===========================\nG1 X128 Y128 F24000\nG28 Z P0\nM972 S5 P0\nG1 X230 Y15 F24000\n;===== check scanner clarity end =======================\n\n;===== bed leveling ==================================\nM1002 judge_flag g29_before_print_flag\nM622 J1\n\n    M1002 gcode_claim_action : 1\n    G29 A X{first_layer_print_min[0]} Y{first_layer_print_min[1]} I{first_layer_print_size[0]} J{first_layer_print_size[1]}\n    M400\n    M500 ; save cali data\n\nM623\n;===== bed leveling end ================================\n\n;===== home after wipe mouth============================\nM1002 judge_flag g29_before_print_flag\nM622 J0\n\n    M1002 gcode_claim_action : 13\n    G28\n\nM623\n;===== home after wipe mouth end =======================\n\nM975 S1 ; turn on vibration supression\n\n;=============turn on fans to prevent PLA jamming=================\n{if filament_type[initial_no_support_extruder]=="PLA"}\n    {if (bed_temperature[initial_no_support_extruder] >45)||(bed_temperature_initial_layer[initial_no_support_extruder] >45)}\n    M106 P3 S180\n    {elsif (bed_temperature[initial_no_support_extruder] >50)||(bed_temperature_initial_layer[initial_no_support_extruder] >50)}\n    M106 P3 S255\n    {endif};Prevent PLA from jamming\n{endif}\nM106 P2 S100 ; turn on big fan ,to cool down toolhead\n\nM104 S{nozzle_temperature_initial_layer[initial_no_support_extruder]} ; set extrude temp earlier, to reduce wait time\n\n;===== mech mode fast check============================\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q1 A7 B30 C80  H15 K0\nM974 Q1 S2 P0\n\nG1 X128 Y128 Z10 F20000\nM400 P200\nM970.3 Q0 A7 B30 C90 Q0 H15 K0\nM974 Q0 S2 P0\n\nM975 S1\nG1 F30000\nG1 X230 Y15\nG28 X ; re-home XY\n;===== mech mode fast check============================\n\n{if scan_first_layer}\n;start heatbed  scan====================================\nM976 S2 P1\nG90\nG1 X128 Y128 F20000\nM976 S3 P2  ;register void printing detection\n{endif}\n\n;===== noozle load line ===============================\nM975 S1\nG90\nM83\nT1000\nG1 X18.0 Y1.0 Z0.8 F18000;Move to start position\nM109 S{nozzle_temperature[initial_no_support_extruder]}\nG1 Z0.2\nG0 E2 F300\nG0 X240 E15 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nG0 Y11 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\nG0 X239.5\nG0 E0.2\nG0 Y1.5 E0.700\nG0 X231 E0.700 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM400\n\n;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==\n;curr_bed_type={curr_bed_type}\n{if curr_bed_type=="Textured PEI Plate"}\nG29.1 Z{-0.04} ; for Textured PEI Plate\n{endif}\n\n;===== draw extrinsic para cali paint =================\nM1002 judge_flag extrude_cali_flag\nM622 J1\n\n    M1002 gcode_claim_action : 8\n\n    T1000\n\n    G0 F1200.0 X231 Y15   Z0.2 E0.741\n    G0 F1200.0 X226 Y15   Z0.2 E0.275\n    G0 F1200.0 X226 Y8    Z0.2 E0.384\n    G0 F1200.0 X216 Y8    Z0.2 E0.549\n    G0 F1200.0 X216 Y1.5  Z0.2 E0.357\n\n    G0 X48.0 E12.0 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\n    G0 X48.0 Y14 E0.92 F1200.0\n    G0 X35.0 Y6.0 E1.03 F1200.0\n\n    ;=========== extruder cali extrusion ==================\n    T1000\n    M83\n    {if default_acceleration > 0}\n        {if outer_wall_acceleration > 0}\n            M204 S[outer_wall_acceleration]\n        {else}\n            M204 S[default_acceleration]\n        {endif}\n    {endif}\n    G0 X35.000 Y6.000 Z0.300 F30000 E0\n    G1 F1500.000 E0.800\n    M106 S0 ; turn off fan\n    G0 X185.000 E9.35441 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G0 X187 Z0\n    G1 F1500.000 E-0.800\n    G0 Z1\n    G0 X180 Z0.3 F18000\n\n    M900 L1000.0 M1.0\n    M900 K0.040\n    G0 X45.000 F30000\n    G0 Y8.000 F30000\n    G1 F1500.000 E0.800\n    G1 X65.000 E1.24726 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X70.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X75.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X80.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X85.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X90.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X95.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X100.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X105.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X110.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X115.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X120.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X125.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X130.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X135.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X140.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X145.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X150.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X155.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X160.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X165.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X170.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X175.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X180.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 F1500.000 E-0.800\n    G1 X183 Z0.15 F30000\n    G1 X185\n    G1 Z1.0\n    G0 Y6.000 F30000 ; move y to clear pos\n    G1 Z0.3\n    M400\n\n    G0 X45.000 F30000\n    M900 K0.020\n    G0 X45.000 F30000\n    G0 Y10.000 F30000\n    G1 F1500.000 E0.800\n    G1 X65.000 E1.24726 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X70.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X75.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X80.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X85.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X90.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X95.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X100.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X105.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X110.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X115.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X120.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X125.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X130.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X135.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X140.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X145.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X150.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X155.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X160.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X165.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X170.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X175.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X180.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 F1500.000 E-0.800\n    G1 X183 Z0.15 F30000\n    G1 X185\n    G1 Z1.0\n    G0 Y6.000 F30000 ; move y to clear pos\n    G1 Z0.3\n    M400\n\n    G0 X45.000 F30000\n    M900 K0.000\n    G0 X45.000 F30000\n    G0 Y12.000 F30000\n    G1 F1500.000 E0.800\n    G1 X65.000 E1.24726 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X70.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X75.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X80.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X85.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X90.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X95.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X100.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X105.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X110.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X115.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X120.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X125.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X130.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X135.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X140.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X145.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X150.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X155.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X160.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X165.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X170.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X175.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X180.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 F1500.000 E-0.800\n    G1 X183 Z0.15 F30000\n    G1 X185\n    G1 Z1.0\n    G0 Y6.000 F30000 ; move y to clear pos\n    G1 Z0.3\n\n    G0 X45.000 F30000 ; move to start point\n\nM623 ; end of "draw extrinsic para cali paint"\n\n\nM1002 judge_flag extrude_cali_flag\nM622 J0\n    G0 X231 Y1.5 F30000\n    G0 X18 E14.3 F{outer_wall_volumetric_speed/(0.3*0.5)     * 60}\nM623\n\nM104 S140\n\n\n;=========== laser and rgb calibration ===========\nM400\nM18 E\nM500 R\n\nM973 S3 P14\n\nG1 X120 Y1.0 Z0.3 F18000.0;Move to first extrude line pos\nT1100\nG1 X235.0 Y1.0 Z0.3 F18000.0;Move to first extrude line pos\nM400 P100\nM960 S1 P1\nM400 P100\nM973 S6 P0; use auto exposure for horizontal laser by xcam\nM960 S0 P0\n\nG1 X240.0 Y6.0 Z0.3 F18000.0;Move to vertical extrude line pos\nM960 S2 P1\nM400 P100\nM973 S6 P1; use auto exposure for vertical laser by xcam\nM960 S0 P0\n\n;=========== handeye calibration ======================\nM1002 judge_flag extrude_cali_flag\nM622 J1\n\n    M973 S3 P1 ; camera start stream\n    M400 P500\n    M973 S1\n    G0 F6000 X228.500 Y4.500 Z0.000\n    M960 S0 P1\n    M973 S1\n    M400 P800\n    M971 S6 P0\n    M973 S2 P0\n    M400 P500\n    G0 Z0.000 F12000\n    M960 S0 P0\n    M960 S1 P1\n    G0 X221.00 Y4.50\n    M400 P200\n    M971 S5 P1\n    M973 S2 P1\n    M400 P500\n    M960 S0 P0\n    M960 S2 P1\n    G0 X228.5 Y11.0\n    M400 P200\n    M971 S5 P3\n    G0 Z0.500 F12000\n    M960 S0 P0\n    M960 S2 P1\n    G0 X228.5 Y11.0\n    M400 P200\n    M971 S5 P4\n    M973 S2 P0\n    M400 P500\n    M960 S0 P0\n    M960 S1 P1\n    G0 X221.00 Y4.50\n    M400 P500\n    M971 S5 P2\n    M963 S1\n    M400 P1500\n    M964\n    T1100\n    G0 F6000 X228.500 Y4.500 Z0.000\n    M960 S0 P1\n    M973 S1\n    M400 P800\n    M971 S6 P0\n    M973 S2 P0\n    M400 P500\n    G0 Z0.000 F12000\n    M960 S0 P0\n    M960 S1 P1\n    G0 X221.00 Y4.50\n    M400 P200\n    M971 S5 P1\n    M973 S2 P1\n    M400 P500\n    M960 S0 P0\n    M960 S2 P1\n    G0 X228.5 Y11.0\n    M400 P200\n    M971 S5 P3\n    G0 Z0.500 F12000\n    M960 S0 P0\n    M960 S2 P1\n    G0 X228.5 Y11.0\n    M400 P200\n    M971 S5 P4\n    M973 S2 P0\n    M400 P500\n    M960 S0 P0\n    M960 S1 P1\n    G0 X221.00 Y4.50\n    M400 P500\n    M971 S5 P2\n    M963 S1\n    M400 P1500\n    M964\n    T1100\n    G1 Z3 F3000\n\n    M400\n    M500 ; save cali data\n\n    M104 S{nozzle_temperature[initial_no_support_extruder]} ; rise nozzle temp now ,to reduce temp waiting time.\n\n    T1100\n    M400 P400\n    M960 S0 P0\n    G0 F30000.000 Y10.000 X65.000 Z0.000\n    M400 P400\n    M960 S1 P1\n    M400 P50\n\n    M969 S1 N3 A2000\n    G0 F360.000 X181.000 Z0.000\n    M980.3 A70.000 B{outer_wall_volumetric_speed/(1.75*1.75/4*3.14)*60/4} C5.000 D{outer_wall_volumetric_speed/(1.75*1.75/4*3.14)*60} E5.000 F175.000 H1.000 I0.000 J0.020 K0.040\n    M400 P100\n    G0 F20000\n    G0 Z1 ; rise nozzle up\n    T1000 ; change to nozzle space\n    G0 X45.000 Y4.000 F30000 ; move to test line pos\n    M969 S0 ; turn off scanning\n    M960 S0 P0\n\n\n    G1 Z2 F20000\n    T1000\n    G0 X45.000 Y4.000 F30000 E0\n    M109 S{nozzle_temperature[initial_no_support_extruder]}\n    G0 Z0.3\n    G1 F1500.000 E3.600\n    G1 X65.000 E1.24726 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X70.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X75.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X80.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X85.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X90.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X95.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X100.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X105.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X110.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X115.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X120.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X125.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X130.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X135.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n\n    ; see if extrude cali success, if not ,use default value\n    M1002 judge_last_extrude_cali_success\n    M622 J0\n        M400\n        M900 K0.02 M{outer_wall_volumetric_speed/(1.75*1.75/4*3.14)*0.02}\n    M623\n\n    G1 X140.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X145.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X150.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X155.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X160.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X165.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X170.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X175.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X180.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X185.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X190.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X195.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X200.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X205.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X210.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X215.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    G1 X220.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)/ 4 * 60}\n    G1 X225.000 E0.31181 F{outer_wall_volumetric_speed/(0.3*0.5)    * 60}\n    M973 S4\n\nM623\n\n;========turn off light and wait extrude temperature =============\nM1002 gcode_claim_action : 0\nM973 S4 ; turn off scanner\nM400 ; wait all motion done before implement the emprical L parameters\n;M900 L500.0 ; Empirical parameters\nM109 S[nozzle_temperature_initial_layer]\nM960 S1 P0 ; turn off laser\nM960 S2 P0 ; turn off laser\nM106 S0 ; turn off fan\nM106 P2 S0 ; turn off big fan\nM106 P3 S0 ; turn off chamber fan\n\nM975 S1 ; turn on mech mode supression\nG90\nM83\nT1000\nG1 E{-retraction_length[initial_no_support_extruder]} F1800\nG1 X128.0 Y253.0 Z0.2 F24000.0;Move to start position\nG1 E{retraction_length[initial_no_support_extruder]} F1800\nM109 S{nozzle_temperature_initial_layer[initial_no_support_extruder]}\nG0 X253 E6.4 F{outer_wall_volumetric_speed/(0.3*0.6)    * 60}\nG0 Y128 E6.4\nG0 X252.5\nG0 Y252.5 E6.4\nG0 X128 E6.4
; machine_unload_filament_time = 28
; max_bridge_length = 10
; max_layer_height = 0.28
; max_travel_detour_distance = 0
; min_bead_width = 85%
; min_feature_size = 25%
; min_layer_height = 0.08
; minimum_sparse_infill_area = 15
; nozzle_diameter = 0.4
; nozzle_temperature = 220,220,220,220,220,220,220,220,220,220,220,220
; nozzle_temperature_initial_layer = 220,220,220,220,220,220,220,220,220,220,220,220
; nozzle_temperature_range_high = 240,240,240,240,240,240,240,240,240,240,240,240
; nozzle_temperature_range_low = 190,190,190,190,190,190,190,190,190,190,190,190
; nozzle_type = hardened_steel
; nozzle_volume = 107
; only_one_wall_first_layer = 0
; ooze_prevention = 0
; outer_wall_acceleration = 5000
; outer_wall_jerk = 9
; outer_wall_line_width = 0.42
; outer_wall_speed = 200
; overhang_1_4_speed = 0
; overhang_2_4_speed = 50
; overhang_3_4_speed = 30
; overhang_4_4_speed = 10
; overhang_fan_speed = 100,100,100,100,100,100,100,100,100,100,100,100
; overhang_fan_threshold = 50%,50%,50%,50%,50%,50%,50%,50%,50%,50%,50%,50%
; post_process = 
; pressure_advance = 0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02
; prime_tower_brim_width = 3
; prime_tower_width = 10
; prime_volume = 10
; print_compatible_printers = "Bambu Lab X1 Carbon 0.4 nozzle";"Bambu Lab X1 0.4 nozzle";"Bambu Lab P1S 0.4 nozzle"
; print_flow_ratio = 1
; print_host = 
; print_host_webui = 
; print_sequence = by layer
; print_settings_id = 0.28mm Extra Draft @BBL X1C
; printable_area = 0x0,256x0,256x256,0x256
; printable_height = 250
; printer_model = Bambu Lab X1 Carbon
; printer_settings_id = Bambu Lab X1 Carbon 0.4 nozzle
; printer_structure = corexy
; printer_technology = FFF
; printer_variant = 0.4
; printhost_apikey = 
; printhost_authorization_type = key
; printhost_cafile = 
; printhost_password = 
; printhost_port = 
; printhost_ssl_ignore_revoke = 0
; printhost_user = 
; raft_contact_distance = 0.1
; raft_expansion = 1.5
; raft_first_layer_density = 90%
; raft_first_layer_expansion = 2
; raft_layers = 0
; reduce_crossing_wall = 0
; reduce_fan_stop_start_freq = 1,1,1,1,1,1,1,1,1,1,1,1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3,3,3,3,3,3,3,3,3,3,3,3
; resolution = 0.012
; retract_before_wipe = 0%
; retract_length_toolchange = 2
; retract_lift_above = 0
; retract_lift_below = 249
; retract_restart_extra = 0
; retract_restart_extra_toolchange = 0
; retract_when_changing_layer = 1
; retraction_length = 0.8
; retraction_minimum_travel = 1
; retraction_speed = 30
; scan_first_layer = 1
; seam_gap = 15%
; seam_position = aligned
; silent_mode = 0
; single_extruder_multi_material = 1
; skirt_distance = 2
; skirt_height = 1
; skirt_loops = 0
; slice_closing_radius = 0.049
; slicing_mode = regular
; slow_down_for_layer_cooling = 1,1,1,1,1,1,1,1,1,1,1,1
; slow_down_layer_time = 4,4,4,4,4,4,4,4,4,4,4,4
; slow_down_min_speed = 20,20,20,20,20,20,20,20,20,20,20,20
; solid_infill_filament = 1
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 100%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = zig-zag
; sparse_infill_speed = 200
; spiral_mode = 0
; standby_temperature_delta = -5
; start_end_points = 30x-3,54x245
; support_air_filtration = 0
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
; support_chamber_temp_control = 0
; support_critical_regions_only = 0
; support_expansion = 0
; support_filament = 0
; support_interface_bottom_layers = 2
; support_interface_filament = 0
; support_interface_loop_pattern = 0
; support_interface_pattern = auto
; support_interface_spacing = 0.5
; support_interface_speed = 80
; support_interface_top_layers = 2
; support_line_width = 0.42
; support_object_xy_distance = 0.35
; support_on_build_plate_only = 0
; support_remove_small_overhang = 1
; support_speed = 150
; support_style = default
; support_threshold_angle = 40
; support_top_z_distance = 0.2
; support_type = normal(auto)
; temperature_vitrification = 55,55,55,55,55,55,55,55,55,55,55,55
; template_custom_gcode = 
; textured_plate_temp = 55,55,55,55,55,55,55,55,55,55,55,55
; textured_plate_temp_initial_layer = 55,55,55,55,55,55,55,55,55,55,55,55
; thick_bridges = 0
; thumbnail_size = 50x50
; time_lapse_gcode = 
; timelapse_type = 0
; top_one_wall_type = all top
; top_shell_layers = 3
; top_shell_thickness = 0.6
; top_solid_infill_flow_ratio = 1
; top_surface_acceleration = 2000
; top_surface_jerk = 9
; top_surface_line_width = 0.45
; top_surface_pattern = monotonicline
; top_surface_speed = 200
; travel_jerk = 9
; travel_speed = 500
; travel_speed_z = 0
; tree_support_branch_angle = 45
; tree_support_branch_diameter = 2
; tree_support_branch_distance = 5
; tree_support_brim_width = 0
; tree_support_wall_count = 1
; upward_compatible_machine = "Bambu Lab P1S 0.4 nozzle";"Bambu Lab P1P 0.4 nozzle";"Bambu Lab X1 0.4 nozzle"
; use_relative_e_distances = 1
; wall_distribution_count = 1
; wall_filament = 1
; wall_generator = classic
; wall_infill_order = inner wall/outer wall/infill
; wall_loops = 2
; wall_transition_angle = 10
; wall_transition_filter_deviation = 25%
; wall_transition_length = 100%
; wipe = 1
; wipe_distance = 2
; wipe_speed = 80%
; wipe_tower_no_sparse_layers = 0
; wipe_tower_rotation_angle = 0
; wipe_tower_x = 155,155
; wipe_tower_y = 192.786,220
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R22
M201 X20000 Y20000 Z500 E5000
M203 X500 Y500 Z20 E30
M204 P20000 R5000 T20000
M205 X9.00 Y9.00 Z3.00 E2.50
M106 S0
M106 P2 S0
; FEATURE: Custom
;===== machine: X1 =========================
;===== date: 20230707 =====================
;===== turn on the HB fan =================
M104 S75 ;set extruder temp to turn on the HB fan and prevent filament oozing from nozzle
;===== reset machine status =================
G91
M17 Z0.4 ; lower the z-motor current
G380 S2 Z30 F300 ; G380 is same as G38; lower the hotbed , to prevent the nozzle is below the hotbed
G380 S2 Z-25 F300 ;
G1 Z5 F300;
G90
M17 X1.2 Y1.2 Z0.75 ; reset motor current to default
M960 S5 P1 ; turn on logo lamp
G90
M220 S100 ;Reset Feedrate
M221 S100 ;Reset Flowrate
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 5
M221 X0 Y0 Z0 ; turn off soft endstop to prevent protential logic problem
G29.1 Z0 ; clear z-trim value first
M204 S10000 ; init ACC set to 10m/s^2

;===== heatbed preheat ====================
M1002 gcode_claim_action : 2
M140 S55 ;set bed temp
M190 S55 ;wait for bed temp


;=========register first layer scan=====
M977 S1 P60


;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead

;===== prepare print temperature and material ==========
M104 S220 ;set extruder temp
G91
G0 Z10 F1200
G90
G28 X
M975 S1 ; turn on
M73 P18 R18
G1 X60 F12000
M73 P19 R18
G1 Y245
G1 Y265 F3000
M620 M
M620 S0A   ; switch material if AMS exist
    M109 S220
    G1 X120 F12000

    G1 X20 Y50 F12000
    G1 Y-3
    T0
    G1 X54 F12000
    G1 Y265
    M400
M621 S0A
M620.1 E F523.843 T240

M412 S1 ; ===turn on filament runout detection===

M109 S250 ;set nozzle to common flush temp
M106 P1 S0
G92 E0
G1 E50 F200
M400
M104 S220
G92 E0
G1 E50 F200
M400
M106 P1 S255
G92 E0
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P20 R18
G1 E-0.5 F300

M73 P21 R17
G1 X70 F9000
G1 X76 F15000
G1 X65 F15000
G1 X76 F15000
G1 X65 F15000; shake to put down garbage
G1 X80 F6000
G1 X95 F15000
G1 X80 F15000
G1 X165 F15000; wipe and shake
M400
M106 P1 S0
;===== prepare print temperature and material end =====


;===== wipe nozzle ===============================
M1002 gcode_claim_action : 14
M975 S1
M106 S255
G1 X65 Y230 F18000
G1 Y264 F6000
M109 S200
G1 X100 F18000 ; first wipe mouth

G0 X135 Y253 F20000  ; move to exposed steel surface edge
G28 Z P0 T300; home z with low precision,permit 300deg temperature
G29.2 S0 ; turn off ABL
G0 Z5 F20000

G1 X60 Y265
G92 E0
G1 E-0.5 F300 ; retrack more
G1 X100 F5000; second wipe mouth
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X100 F5000
G1 X70 F15000
G1 X90 F5000
G0 X128 Y261 Z-1.5 F20000  ; move to exposed steel surface and stop the nozzle
M104 S140 ; set temp down to heatbed acceptable
M106 S255 ; turn on fan (G28 has turn off fan)

M221 S; push soft endstop status
M221 Z0 ;turn off Z axis endstop
G0 Z0.5 F20000
G0 X125 Y259.5 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y262.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y260.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.5
G0 Z-1.01
G0 X131 F211
G0 X124
G0 Z0.5 F20000
G0 X125 Y261.0
G0 Z-1.01
G0 X131 F211
G0 X124
G0 X128
G2 I0.5 J0 F300
M73 P22 R17
G2 I0.5 J0 F300
G2 I0.5 J0 F300
G2 I0.5 J0 F300

M109 S140 ; wait nozzle temp down to heatbed acceptable
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000
G2 I0.5 J0 F3000

M221 R; pop softend status
G1 Z10 F1200
M400
G1 Z10
G1 F30000
G1 X128 Y128
G29.2 S1 ; turn on ABL
;G28 ; home again after hard wipe mouth
M106 S0 ; turn off fan , too noisy
;===== wipe nozzle end ================================

;===== check scanner clarity ===========================
G1 X128 Y128 F24000
G28 Z P0
M972 S5 P0
G1 X230 Y15 F24000
;===== check scanner clarity end =======================

;===== bed leveling ==================================
M1002 judge_flag g29_before_print_flag
M622 J1

    M1002 gcode_claim_action : 1
    G29 A X118.875 Y118.875 I18.2472 J18.2477
    M400
    M500 ; save cali data

M623
;===== bed leveling end ================================

;===== home after wipe mouth============================
M1002 judge_flag g29_before_print_flag
M622 J0

    M1002 gcode_claim_action : 13
    G28

M623
;===== home after wipe mouth end =======================

M975 S1 ; turn on vibration supression

;=============turn on fans to prevent PLA jamming=================

    
    M106 P3 S180
    ;Prevent PLA from jamming

M106 P2 S100 ; turn on big fan ,to cool down toolhead

M104 S220 ; set extrude temp earlier, to reduce wait time

;===== mech mode fast check============================
G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q1 A7 B30 C80  H15 K0
M974 Q1 S2 P0

G1 X128 Y128 Z10 F20000
M400 P200
M970.3 Q0 A7 B30 C90 Q0 H15 K0
M974 Q0 S2 P0

M975 S1
G1 F30000
G1 X230 Y15
G28 X ; re-home XY
;===== mech mode fast check============================


;start heatbed  scan====================================
M976 S2 P1
G90
G1 X128 Y128 F20000
M976 S3 P2  ;register void printing detection


;===== noozle load line ===============================
M975 S1
G90
M83
T1000
G1 X18.0 Y1.0 Z0.8 F18000;Move to start position
M109 S220
G1 Z0.2
G0 E2 F300
G0 X240 E15 F6033.27
G0 Y11 E0.700 F1508.32
G0 X239.5
G0 E0.2
G0 Y1.5 E0.700
G0 X231 E0.700 F6033.27
M400

;===== for Textured PEI Plate , lower the nozzle as the nozzle was touching topmost of the texture when homing ==
;curr_bed_type=Textured PEI Plate

G29.1 Z-0.04 ; for Textured PEI Plate


;===== draw extrinsic para cali paint =================
M1002 judge_flag extrude_cali_flag
M622 J1

    M1002 gcode_claim_action : 8

    T1000

    G0 F1200.0 X231 Y15   Z0.2 E0.741
    G0 F1200.0 X226 Y15   Z0.2 E0.275
    G0 F1200.0 X226 Y8    Z0.2 E0.384
    G0 F1200.0 X216 Y8    Z0.2 E0.549
    G0 F1200.0 X216 Y1.5  Z0.2 E0.357

    G0 X48.0 E12.0 F6033.27
    G0 X48.0 Y14 E0.92 F1200.0
    G0 X35.0 Y6.0 E1.03 F1200.0

    ;=========== extruder cali extrusion ==================
    T1000
    M83
    
        
            M204 S5000
        
    
    G0 X35.000 Y6.000 Z0.300 F30000 E0
    G1 F1500.000 E0.800
    M106 S0 ; turn off fan
    G0 X185.000 E9.35441 F6033.27
    G0 X187 Z0
    G1 F1500.000 E-0.800
    G0 Z1
    G0 X180 Z0.3 F18000

    M900 L1000.0 M1.0
    M900 K0.040
    G0 X45.000 F30000
    G0 Y8.000 F30000
    G1 F1500.000 E0.800
M73 P23 R17
    G1 X65.000 E1.24726 F1508.32
    G1 X70.000 E0.31181 F1508.32
    G1 X75.000 E0.31181 F6033.27
    G1 X80.000 E0.31181 F1508.32
    G1 X85.000 E0.31181 F6033.27
    G1 X90.000 E0.31181 F1508.32
    G1 X95.000 E0.31181 F6033.27
    G1 X100.000 E0.31181 F1508.32
    G1 X105.000 E0.31181 F6033.27
    G1 X110.000 E0.31181 F1508.32
    G1 X115.000 E0.31181 F6033.27
    G1 X120.000 E0.31181 F1508.32
    G1 X125.000 E0.31181 F6033.27
    G1 X130.000 E0.31181 F1508.32
    G1 X135.000 E0.31181 F6033.27
    G1 X140.000 E0.31181 F1508.32
M73 P24 R17
    G1 X145.000 E0.31181 F6033.27
    G1 X150.000 E0.31181 F1508.32
    G1 X155.000 E0.31181 F6033.27
    G1 X160.000 E0.31181 F1508.32
    G1 X165.000 E0.31181 F6033.27
    G1 X170.000 E0.31181 F1508.32
    G1 X175.000 E0.31181 F6033.27
    G1 X180.000 E0.31181 F6033.27
    G1 F1500.000 E-0.800
    G1 X183 Z0.15 F30000
    G1 X185
    G1 Z1.0
    G0 Y6.000 F30000 ; move y to clear pos
    G1 Z0.3
    M400

    G0 X45.000 F30000
    M900 K0.020
    G0 X45.000 F30000
    G0 Y10.000 F30000
    G1 F1500.000 E0.800
    G1 X65.000 E1.24726 F1508.32
    G1 X70.000 E0.31181 F1508.32
    G1 X75.000 E0.31181 F6033.27
    G1 X80.000 E0.31181 F1508.32
    G1 X85.000 E0.31181 F6033.27
    G1 X90.000 E0.31181 F1508.32
    G1 X95.000 E0.31181 F6033.27
    G1 X100.000 E0.31181 F1508.32
    G1 X105.000 E0.31181 F6033.27
    G1 X110.000 E0.31181 F1508.32
    G1 X115.000 E0.31181 F6033.27
    G1 X120.000 E0.31181 F1508.32
    G1 X125.000 E0.31181 F6033.27
    G1 X130.000 E0.31181 F1508.32
    G1 X135.000 E0.31181 F6033.27
    G1 X140.000 E0.31181 F1508.32
    G1 X145.000 E0.31181 F6033.27
M73 P25 R17
    G1 X150.000 E0.31181 F1508.32
    G1 X155.000 E0.31181 F6033.27
    G1 X160.000 E0.31181 F1508.32
    G1 X165.000 E0.31181 F6033.27
    G1 X170.000 E0.31181 F1508.32
    G1 X175.000 E0.31181 F6033.27
    G1 X180.000 E0.31181 F6033.27
    G1 F1500.000 E-0.800
    G1 X183 Z0.15 F30000
    G1 X185
    G1 Z1.0
    G0 Y6.000 F30000 ; move y to clear pos
    G1 Z0.3
    M400

    G0 X45.000 F30000
    M900 K0.000
    G0 X45.000 F30000
    G0 Y12.000 F30000
    G1 F1500.000 E0.800
    G1 X65.000 E1.24726 F1508.32
    G1 X70.000 E0.31181 F1508.32
    G1 X75.000 E0.31181 F6033.27
    G1 X80.000 E0.31181 F1508.32
    G1 X85.000 E0.31181 F6033.27
    G1 X90.000 E0.31181 F1508.32
    G1 X95.000 E0.31181 F6033.27
    G1 X100.000 E0.31181 F1508.32
    G1 X105.000 E0.31181 F6033.27
    G1 X110.000 E0.31181 F1508.32
    G1 X115.000 E0.31181 F6033.27
    G1 X120.000 E0.31181 F1508.32
    G1 X125.000 E0.31181 F6033.27
    G1 X130.000 E0.31181 F1508.32
    G1 X135.000 E0.31181 F6033.27
    G1 X140.000 E0.31181 F1508.32
    G1 X145.000 E0.31181 F6033.27
    G1 X150.000 E0.31181 F1508.32
    G1 X155.000 E0.31181 F6033.27
    G1 X160.000 E0.31181 F1508.32
    G1 X165.000 E0.31181 F6033.27
    G1 X170.000 E0.31181 F1508.32
    G1 X175.000 E0.31181 F6033.27
    G1 X180.000 E0.31181 F6033.27
    G1 F1500.000 E-0.800
    G1 X183 Z0.15 F30000
    G1 X185
    G1 Z1.0
    G0 Y6.000 F30000 ; move y to clear pos
    G1 Z0.3

    G0 X45.000 F30000 ; move to start point

M623 ; end of "draw extrinsic para cali paint"


M1002 judge_flag extrude_cali_flag
M622 J0
    G0 X231 Y1.5 F30000
    G0 X18 E14.3 F6033.27
M623

M104 S140


;=========== laser and rgb calibration ===========
M400
M18 E
M500 R

M973 S3 P14

G1 X120 Y1.0 Z0.3 F18000.0;Move to first extrude line pos
T1100
G1 X235.0 Y1.0 Z0.3 F18000.0;Move to first extrude line pos
M400 P100
M960 S1 P1
M400 P100
M973 S6 P0; use auto exposure for horizontal laser by xcam
M960 S0 P0

G1 X240.0 Y6.0 Z0.3 F18000.0;Move to vertical extrude line pos
M960 S2 P1
M400 P100
M973 S6 P1; use auto exposure for vertical laser by xcam
M960 S0 P0

;=========== handeye calibration ======================
M1002 judge_flag extrude_cali_flag
M622 J1

    M973 S3 P1 ; camera start stream
    M400 P500
    M973 S1
    G0 F6000 X228.500 Y4.500 Z0.000
    M960 S0 P1
    M973 S1
    M400 P800
    M971 S6 P0
    M973 S2 P0
    M400 P500
    G0 Z0.000 F12000
    M960 S0 P0
    M960 S1 P1
    G0 X221.00 Y4.50
    M400 P200
    M971 S5 P1
    M973 S2 P1
    M400 P500
    M960 S0 P0
    M960 S2 P1
    G0 X228.5 Y11.0
    M400 P200
    M971 S5 P3
    G0 Z0.500 F12000
    M960 S0 P0
    M960 S2 P1
    G0 X228.5 Y11.0
    M400 P200
    M971 S5 P4
    M973 S2 P0
    M400 P500
    M960 S0 P0
    M960 S1 P1
    G0 X221.00 Y4.50
    M400 P500
    M971 S5 P2
    M963 S1
    M400 P1500
    M964
    T1100
    G0 F6000 X228.500 Y4.500 Z0.000
    M960 S0 P1
    M973 S1
    M400 P800
    M971 S6 P0
    M973 S2 P0
    M400 P500
    G0 Z0.000 F12000
    M960 S0 P0
    M960 S1 P1
    G0 X221.00 Y4.50
    M400 P200
    M971 S5 P1
    M973 S2 P1
    M400 P500
    M960 S0 P0
    M960 S2 P1
    G0 X228.5 Y11.0
    M400 P200
    M971 S5 P3
    G0 Z0.500 F12000
    M960 S0 P0
    M960 S2 P1
    G0 X228.5 Y11.0
    M400 P200
    M971 S5 P4
    M973 S2 P0
    M400 P500
    M960 S0 P0
    M960 S1 P1
    G0 X221.00 Y4.50
    M400 P500
    M971 S5 P2
    M963 S1
    M400 P1500
    M964
    T1100
    G1 Z3 F3000

    M400
    M500 ; save cali data

    M104 S220 ; rise nozzle temp now ,to reduce temp waiting time.

    T1100
    M400 P400
    M960 S0 P0
    G0 F30000.000 Y10.000 X65.000 Z0.000
    M400 P400
    M960 S1 P1
    M400 P50

    M969 S1 N3 A2000
    G0 F360.000 X181.000 Z0.000
    M980.3 A70.000 B94.1106 C5.000 D376.442 E5.000 F175.000 H1.000 I0.000 J0.020 K0.040
    M400 P100
    G0 F20000
    G0 Z1 ; rise nozzle up
    T1000 ; change to nozzle space
    G0 X45.000 Y4.000 F30000 ; move to test line pos
    M969 S0 ; turn off scanning
    M960 S0 P0


    G1 Z2 F20000
    T1000
    G0 X45.000 Y4.000 F30000 E0
    M109 S220
    G0 Z0.3
    G1 F1500.000 E3.600
    G1 X65.000 E1.24726 F1508.32
    G1 X70.000 E0.31181 F1508.32
    G1 X75.000 E0.31181 F6033.27
    G1 X80.000 E0.31181 F1508.32
    G1 X85.000 E0.31181 F6033.27
    G1 X90.000 E0.31181 F1508.32
M73 P25 R16
    G1 X95.000 E0.31181 F6033.27
    G1 X100.000 E0.31181 F1508.32
    G1 X105.000 E0.31181 F6033.27
    G1 X110.000 E0.31181 F1508.32
    G1 X115.000 E0.31181 F6033.27
M73 P26 R16
    G1 X120.000 E0.31181 F1508.32
    G1 X125.000 E0.31181 F6033.27
    G1 X130.000 E0.31181 F1508.32
    G1 X135.000 E0.31181 F6033.27

    ; see if extrude cali success, if not ,use default value
    M1002 judge_last_extrude_cali_success
    M622 J0
        M400
        M900 K0.02 M0.125481
    M623

    G1 X140.000 E0.31181 F1508.32
    G1 X145.000 E0.31181 F6033.27
    G1 X150.000 E0.31181 F1508.32
    G1 X155.000 E0.31181 F6033.27
    G1 X160.000 E0.31181 F1508.32
    G1 X165.000 E0.31181 F6033.27
    G1 X170.000 E0.31181 F1508.32
    G1 X175.000 E0.31181 F6033.27
    G1 X180.000 E0.31181 F1508.32
    G1 X185.000 E0.31181 F6033.27
    G1 X190.000 E0.31181 F1508.32
    G1 X195.000 E0.31181 F6033.27
    G1 X200.000 E0.31181 F1508.32
    G1 X205.000 E0.31181 F6033.27
    G1 X210.000 E0.31181 F1508.32
    G1 X215.000 E0.31181 F6033.27
    G1 X220.000 E0.31181 F1508.32
    G1 X225.000 E0.31181 F6033.27
    M973 S4

M623

;========turn off light and wait extrude temperature =============
M1002 gcode_claim_action : 0
M973 S4 ; turn off scanner
M400 ; wait all motion done before implement the emprical L parameters
;M900 L500.0 ; Empirical parameters
M109 S220
M960 S1 P0 ; turn off laser
M960 S2 P0 ; turn off laser
M106 S0 ; turn off fan
M106 P2 S0 ; turn off big fan
M106 P3 S0 ; turn off chamber fan

M975 S1 ; turn on mech mode supression
G90
M83
T1000
G1 E-0.8 F1800
G1 X128.0 Y253.0 Z0.2 F24000.0;Move to start position
G1 E0.8 F1800
M109 S220
G0 X253 E6.4 F5027.73
G0 Y128 E6.4
G0 X252.5
G0 Y252.5 E6.4
G0 X128 E6.4
G90
G21
M83 ; use relative distances for extrusion
; filament start gcode
M106 P3 S150


M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L1
M991 S0 P0 ;notify layer change
M106 S0
M106 P2 S0
M204 S500
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G1 X131.471 Y133.5 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X131.077 Y133.67 E.01597
G3 X124.097 Y118.711 I-3.086 J-7.668 E.93396
G3 X128.354 Y117.744 I3.912 J7.369 E.16452
G3 X131.611 Y133.433 I-.363 J8.258 E.81414
G1 X131.525 Y133.474 E.00354
G1 X131.656 Y133.918 F30000
; FEATURE: Outer wall
G1 F3000
G1 X131.247 Y134.091 E.01656
G3 X123.806 Y118.349 I-3.254 J-8.091 E.98202
G3 X128.376 Y117.287 I4.198 J7.7 E.1769
G3 X131.802 Y133.845 I-.383 J8.713 E.85934
G1 X131.71 Y133.891 E.00384
; WIPE_START
G1 F24000
G1 X131.247 Y134.091 E-.19175
G1 X130.685 Y134.302 E-.22808
G1 X130.106 Y134.467 E-.22862
G1 X129.819 Y134.527 E-.11155
; WIPE_END
G1 E-.04 F1800
G1 X132.611 Y127.423 Z.6 F30000
G1 X134.853 Y121.717 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.506147
G1 F6300
G2 X133.304 Y120.174 I-59.559 J58.232 E.08254
G2 X131.35 Y118.869 I-5.535 J6.174 E.089
G1 X135.124 Y122.642 E.20144
G3 X135.531 Y123.705 I-7.169 J3.359 E.043
G1 X130.294 Y118.467 E.2796
G2 X129.428 Y118.257 I-1.699 J5.105 E.03365
G1 X135.748 Y124.576 E.33734
G3 X135.846 Y125.33 I-4.989 J1.038 E.02873
G1 X128.665 Y118.149 E.38338
G2 X127.994 Y118.133 I-.547 J8.86 E.02534
G1 X135.875 Y126.014 E.42073
G3 X135.85 Y126.644 I-4.527 J.133 E.02381
G1 X127.358 Y118.152 E.4533
G2 X126.773 Y118.222 I.139 J3.661 E.02228
G1 X135.778 Y127.227 E.48073
G3 X135.673 Y127.777 I-3.79 J-.443 E.02114
G1 X126.223 Y118.327 E.50446
G2 X125.707 Y118.466 I.755 J3.834 E.02019
G1 X135.534 Y128.294 E.52462
G3 X135.366 Y128.781 I-3.376 J-.893 E.01946
G1 X125.218 Y118.633 E.54171
G2 X124.752 Y118.822 I.938 J2.979 E.019
G1 X135.175 Y129.245 E.5564
G3 X134.96 Y129.685 I-3.262 J-1.32 E.0185
M73 P27 R16
G1 X124.315 Y119.04 E.56826
G2 X123.898 Y119.278 I1.446 J3.022 E.01815
G1 X134.723 Y130.103 E.57789
M73 P28 R16
G3 X134.466 Y130.501 I-2.771 J-1.51 E.0179
G1 X123.501 Y119.536 E.58535
G2 X123.127 Y119.817 I1.921 J2.952 E.01768
G1 X134.185 Y130.875 E.59032
G3 X133.886 Y131.231 I-2.58 J-1.858 E.01757
G1 X122.768 Y120.114 E.5935
G1 X122.429 Y120.429 E.0175
G1 X133.568 Y131.568 E.59464
G3 X133.231 Y131.886 I-2.322 J-2.13 E.01751
G1 X122.113 Y120.768 E.5935
G2 X121.814 Y121.125 I2.475 J2.373 E.01757
G1 X132.877 Y132.188 E.59056
G1 X132.5 Y132.466 E.01769
G1 X121.538 Y121.503 E.5852
G2 X121.278 Y121.899 I2.32 J1.803 E.01788
G1 X132.103 Y132.723 E.57782
G3 X131.684 Y132.96 I-1.909 J-2.884 E.01816
G1 X121.038 Y122.314 E.56831
G1 X120.821 Y122.752 E.01845
G1 X131.243 Y133.174 E.55636
G3 X130.782 Y133.368 I-1.55 J-3.047 E.01891
G1 X120.632 Y123.218 E.54185
G1 X120.465 Y123.706 E.01948
G1 X130.294 Y133.535 E.52468
G3 X129.776 Y133.672 I-1.193 J-3.442 E.02023
G1 X120.328 Y124.224 E.50436
G2 X120.221 Y124.772 I3.67 J1.006 E.02108
G1 X129.23 Y133.781 E.48093
G3 X128.644 Y133.85 I-.791 J-4.17 E.02228
G1 X120.15 Y125.356 E.45344
G2 X120.124 Y125.985 I4.256 J.491 E.02379
G1 X128.014 Y133.875 E.42118
G3 X127.328 Y133.844 I-.139 J-4.576 E.02594
G1 X120.15 Y126.666 E.38318
G2 X120.259 Y127.43 I6.233 J-.498 E.02915
G1 X126.575 Y133.747 E.3372
G3 X125.704 Y133.531 I1.585 J-8.256 E.03389
G1 X120.461 Y128.288 E.27988
G2 X120.858 Y129.328 I9.865 J-3.167 E.042
G1 X124.64 Y133.122 E.20225
G3 X122.568 Y131.705 I3.43 J-7.24 E.09516
G1 X121.151 Y130.288 E.07566
; CHANGE_LAYER
; Z_HEIGHT: 0.48
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X122.565 Y131.702 E-.76
; WIPE_END
M73 P29 R16
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 2/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L2
M991 S0 P1 ;notify layer change
M106 S255
M106 P2 S178
; open powerlost recovery
M1003 S1
M976 S1 P1 ; scan model before printing 2nd layer
M400 P100
G1 E.8
M204 S10000
G1 E-.8
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G1 X129.962 Y133.582 Z.6 F30000
G1 X131.694 Y134.022 Z.6
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X131.227 Y134.228 E.02272
G3 X125.703 Y117.461 I-3.236 J-8.227 E1.27988
G3 X128.388 Y117.169 I2.32 J8.835 E.12062
G3 X132.02 Y133.87 I-.398 J8.832 E1.0316
G1 X131.749 Y133.997 E.01333
G1 X131.855 Y134.371 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
G1 X131.363 Y134.579 E.02193
G3 X125.274 Y117.196 I-3.369 J-8.578 E1.21704
G3 X128.407 Y116.795 I2.714 J8.761 E.13037
G3 X131.908 Y134.344 I-.414 J9.206 E1.00573
M204 S10000
; WIPE_START
G1 F24000
G1 X131.363 Y134.579 E-.22566
G1 X130.83 Y134.773 E-.21526
G1 X130.286 Y134.93 E-.21527
G1 X130.018 Y134.984 E-.10381
; WIPE_END
G1 E-.04 F1800
G1 X132.857 Y133.19 Z.88 F30000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.422476
G1 F12000
G1 X134.225 Y131.822 E.07998
G2 X135.508 Y130.027 I-6.371 J-5.908 E.09148
G1 X132.026 Y133.509 E.2036
G1 X131.073 Y133.949 E.04339
G1 X135.933 Y129.089 E.28416
G2 X136.201 Y128.309 I-4.699 J-2.049 E.03415
G1 X130.309 Y134.201 E.34452
G3 X129.645 Y134.353 I-1.274 J-4.053 E.02819
G1 X136.357 Y127.64 E.39247
G1 X136.459 Y127.026 E.02573
G1 X129.033 Y134.452 E.43417
G3 X128.465 Y134.507 I-.885 J-6.155 E.02359
G1 X136.502 Y126.471 E.46988
G2 X136.52 Y125.94 I-3.233 J-.375 E.02197
G1 X127.94 Y134.52 E.5016
G3 X127.451 Y134.497 I-.1 J-3.099 E.02028
G1 X136.502 Y125.446 E.52917
G2 X136.454 Y124.981 I-2.98 J.068 E.01935
G1 X126.977 Y134.458 E.5541
G3 X126.53 Y134.393 I.183 J-2.823 E.01871
G1 X136.389 Y124.533 E.57644
G2 X136.306 Y124.104 I-2.699 J.298 E.01811
G1 X126.103 Y134.307 E.59654
G3 X125.7 Y134.198 I.908 J-4.152 E.01728
G1 X136.203 Y123.694 E.61411
G2 X136.078 Y123.307 I-3.834 J1.028 E.01683
G1 X125.303 Y134.082 E.62999
G1 X124.932 Y133.941 E.01641
G1 X135.946 Y122.927 E.64395
G2 X135.791 Y122.569 I-2.002 J.651 E.01614
G1 X124.561 Y133.799 E.65661
G1 X124.214 Y133.634 E.01589
G1 X135.631 Y122.217 E.6675
G2 X135.453 Y121.882 I-1.716 J.697 E.0157
G1 X123.879 Y133.457 E.67672
M73 P30 R16
G3 X123.555 Y133.268 I1.031 J-2.138 E.01551
G1 X135.264 Y121.559 E.68457
G2 X135.066 Y121.244 I-1.847 J.939 E.01539
G1 X123.247 Y133.063 E.69102
G1 X122.939 Y132.858 E.01528
G1 X134.853 Y120.945 E.69653
G2 X134.63 Y120.655 I-1.717 J1.086 E.01513
G1 X122.652 Y132.633 E.70033
G3 X122.374 Y132.399 I1.834 J-2.466 E.01505
G1 X134.393 Y120.379 E.70276
G2 X134.155 Y120.105 I-1.452 J1.02 E.01505
G1 X122.11 Y132.15 E.70421
G1 X121.852 Y131.896 E.01498
G1 X133.892 Y119.856 E.70395
G1 X133.629 Y119.606 E.01499
G1 X121.609 Y131.626 E.70275
G1 X121.374 Y131.348 E.01503
G1 X133.348 Y119.374 E.70009
G1 X133.061 Y119.149 E.01509
G1 X121.149 Y131.061 E.69649
G1 X120.941 Y130.757 E.01525
G1 X132.757 Y118.94 E.69086
M73 P30 R15
G1 X132.447 Y118.738 E.01531
G1 X120.734 Y130.451 E.68483
G1 X120.55 Y130.123 E.01557
G1 X132.124 Y118.548 E.6767
G1 X131.786 Y118.374 E.01573
G1 X120.37 Y129.791 E.66748
G1 X120.212 Y129.436 E.01605
G1 X131.441 Y118.206 E.65655
G1 X131.075 Y118.06 E.0163
G1 X120.054 Y129.081 E.64438
G3 X119.92 Y128.703 I2.219 J-1.001 E.01661
G1 X130.703 Y117.919 E.63049
G2 X130.311 Y117.8 I-1.179 J3.157 E.01698
G1 X119.8 Y128.31 E.61453
G3 X119.698 Y127.899 I2.583 J-.856 E.01752
G1 X129.9 Y117.697 E.59649
G1 X129.472 Y117.613 E.01806
G1 X119.613 Y127.472 E.57639
G3 X119.547 Y127.026 I2.134 J-.546 E.01867
G1 X129.03 Y117.542 E.55447
G2 X128.563 Y117.497 I-.606 J3.84 E.01943
G1 X119.503 Y126.558 E.52971
G3 X119.486 Y126.062 I2.767 J-.343 E.02053
G1 X128.062 Y117.486 E.50141
G2 X127.541 Y117.494 I-.218 J2.746 E.02155
G1 X119.496 Y125.54 E.4704
G1 X119.544 Y124.979 E.02328
G1 X126.978 Y117.544 E.43465
G2 X126.376 Y117.634 I.253 J3.759 E.0252
G1 X119.646 Y124.364 E.39348
G3 X119.804 Y123.694 I3.721 J.522 E.0285
G1 X125.701 Y117.796 E.34482
G1 X124.939 Y118.046 E.03317
G1 X120.064 Y122.921 E.285
G3 X120.495 Y121.977 I4.801 J1.623 E.04296
G1 X123.977 Y118.496 E.20355
G1 X123.577 Y118.715 E.01885
G2 X122.235 Y119.725 I4.234 J7.016 E.06956
G1 X120.767 Y121.194 E.08585
; CHANGE_LAYER
; Z_HEIGHT: 0.76
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X122.181 Y119.779 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 3/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z.88 I-1.015 J.672 P1  F30000
G1 X131.821 Y134.347 Z.88
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X131.774 Y134.365 E.00221
G3 X126.181 Y117 I-3.783 J-8.364 E1.37527
G3 X128.319 Y116.826 I1.841 J9.373 E.09563
G3 X132.237 Y134.14 I-.328 J9.174 E1.07195
G1 X131.875 Y134.321 E.01803
G1 X131.985 Y134.685 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
G1 X131.93 Y134.709 E.00247
G3 X118.486 Y125.127 I-3.93 J-8.709 E.81843
G1 X118.486 Y125.127 E0
G3 X128.339 Y116.452 I9.514 J.873 E.59422
G3 X137.514 Y126.873 I-.342 J9.552 E.63817
G1 X137.514 Y126.873 E0
G3 X132.412 Y134.475 I-9.514 J-.873 E.39202
G1 X132.039 Y134.658 E.01707
M204 S10000
; WIPE_START
G1 F24000
G1 X131.93 Y134.709 E-.04564
G1 X131.436 Y134.918 E-.20369
G1 X130.931 Y135.096 E-.2037
G1 X130.416 Y135.246 E-.20371
G1 X130.151 Y135.308 E-.10326
; WIPE_END
G1 E-.04 F1800
G17
G3 Z1.16 I.3 J-1.179 P1  F30000
G1 X122.945 Y133.474 Z1.16
G1 Z.76
M73 P31 R15
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421693
G1 F12000
G1 X121.568 Y132.097 E.08034
G3 X120.218 Y130.236 I6.599 J-6.206 E.0951
G1 X123.763 Y133.781 E.20679
G2 X124.727 Y134.233 I4.306 J-7.918 E.04396
G1 X119.765 Y129.271 E.28947
G3 X119.499 Y128.494 I9.049 J-3.535 E.03393
G1 X125.507 Y134.502 E.35051
G2 X126.19 Y134.674 I1.873 J-5.997 E.02909
G1 X119.33 Y127.813 E.40023
G3 X119.219 Y127.191 I8.776 J-1.881 E.02606
G1 X126.81 Y134.782 E.44284
G2 X127.378 Y134.839 I.79 J-5.03 E.02357
G1 X119.162 Y126.623 E.47934
G3 X119.141 Y126.09 I4.731 J-.454 E.022
G1 X127.91 Y134.86 E.51162
G2 X128.413 Y134.851 I.169 J-4.476 E.02073
G1 X119.15 Y125.588 E.54038
G3 X119.185 Y125.111 I4.26 J.073 E.01972
G1 X128.889 Y134.816 E.56614
G2 X129.343 Y134.759 I-.281 J-4.075 E.0189
G1 X119.242 Y124.657 E.58931
G3 X119.319 Y124.223 I3.908 J.467 E.01821
G1 X129.775 Y134.679 E.61
G1 X130.193 Y134.585 E.01768
G1 X119.413 Y123.806 E.6289
G1 X119.527 Y123.408 E.01707
G1 X130.592 Y134.473 E.64554
G2 X130.975 Y134.345 I-.946 J-3.479 E.01669
G1 X119.655 Y123.024 E.66044
G3 X119.796 Y122.655 I3.363 J1.076 E.01634
G1 X131.346 Y134.204 E.67378
G2 X131.703 Y134.05 I-1.188 J-3.264 E.01607
G1 X119.95 Y122.297 E.68567
G3 X120.116 Y121.951 I3.16 J1.301 E.01582
G1 X132.048 Y133.883 E.6961
G2 X132.378 Y133.702 I-1.445 J-3.034 E.01555
G1 X120.297 Y121.621 E.70481
G3 X120.489 Y121.302 I2.941 J1.548 E.01538
G1 X132.698 Y133.511 E.7123
G2 X133.009 Y133.31 I-1.637 J-2.862 E.01526
G1 X120.691 Y120.992 E.71862
G1 X120.902 Y120.692 E.01514
G1 X133.307 Y133.097 E.72368
G2 X133.593 Y132.871 I-1.865 J-2.658 E.01503
G1 X121.131 Y120.409 E.72704
G3 X121.364 Y120.131 I3.028 J2.299 E.01498
G1 X133.869 Y132.637 E.72959
G2 X134.137 Y132.393 I-2.036 J-2.505 E.01494
G1 X121.608 Y119.864 E.73095
G1 X121.863 Y119.607 E.01492
G1 X134.392 Y132.136 E.73095
G2 X134.636 Y131.869 I-2.255 J-2.309 E.01494
G1 X122.13 Y119.363 E.72959
G3 X122.407 Y119.129 I2.228 J2.346 E.01498
G1 X134.872 Y131.593 E.72717
G1 X135.098 Y131.308 E.01502
G1 X122.693 Y118.903 E.72368
G1 X122.991 Y118.69 E.01512
G1 X135.309 Y131.008 E.71862
G2 X135.511 Y130.698 I-2.656 J-1.952 E.01525
G1 X123.302 Y118.489 E.7123
G3 X123.622 Y118.298 I1.863 J2.754 E.01539
G1 X135.703 Y130.379 E.70481
G1 X135.884 Y130.049 E.01554
G1 X123.952 Y118.117 E.6961
G1 X124.296 Y117.95 E.01579
G1 X136.05 Y129.703 E.68567
G2 X136.204 Y129.345 I-3.105 J-1.55 E.01606
G1 X124.654 Y117.796 E.67378
G3 X125.025 Y117.655 I1.442 J3.227 E.01635
G1 X136.345 Y128.976 E.66044
G2 X136.473 Y128.592 I-3.346 J-1.333 E.01668
G1 X125.408 Y117.527 E.64554
G3 X125.806 Y117.414 I1.207 J3.487 E.01709
G1 X136.587 Y128.194 E.62892
G2 X136.681 Y127.777 I-3.67 J-1.049 E.01765
G1 X126.222 Y117.318 E.6102
G3 X126.656 Y117.241 I.899 J3.832 E.01822
G1 X136.758 Y127.343 E.58931
G2 X136.815 Y126.889 I-4.015 J-.737 E.01889
G1 X127.111 Y117.184 E.56615
G3 X127.587 Y117.149 I.548 J4.224 E.01972
G1 X136.85 Y126.412 E.54039
G2 X136.859 Y125.91 I-4.466 J-.333 E.02073
G1 X128.093 Y117.143 E.51144
G3 X128.622 Y117.161 I.079 J5.544 E.02185
G1 X136.838 Y125.377 E.47934
G2 X136.781 Y124.809 I-5.092 J.227 E.0236
G1 X129.19 Y117.218 E.44285
G3 X129.81 Y117.326 I-2.178 J14.286 E.02595
G1 X136.67 Y124.187 E.40024
G2 X136.501 Y123.507 I-5.356 J.968 E.02893
G1 X130.493 Y117.498 E.35052
G3 X131.273 Y117.767 I-2.623 J8.888 E.03403
G1 X136.235 Y122.729 E.28949
G2 X135.782 Y121.764 I-8.666 J3.483 E.04399
G1 X132.237 Y118.219 E.20681
G3 X134.069 Y119.541 I-4.344 J7.953 E.09342
G3 X135.48 Y120.951 I-225.736 J227.298 E.08232
; CHANGE_LAYER
; Z_HEIGHT: 1.04
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X134.069 Y119.541 E-.75826
G1 X134.065 Y119.538 E-.00174
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 4/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z1.16 I-1.205 J-.169 P1  F30000
G1 X131.947 Y134.636 Z1.16
G1 Z1.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X131.905 Y134.654 E.00202
G3 X125.971 Y116.726 I-3.905 J-8.653 E1.41473
G3 X128.618 Y116.527 I2.004 J8.944 E.11848
G3 X132.384 Y134.421 I-.618 J9.473 E1.09649
G1 X132.001 Y134.61 E.019
G1 X132.11 Y134.974 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
G1 X132.06 Y134.998 E.0023
G3 X123.301 Y117.322 I-4.06 J-8.996 E1.24383
G1 X123.301 Y117.322 E0
G3 X128.638 Y116.152 I4.703 J8.695 E.2273
G3 X132.558 Y134.756 I-.637 J9.849 E1.05244
G1 X132.164 Y134.947 E.01798
M204 S10000
; WIPE_START
G1 F24000
G1 X132.06 Y134.998 E-.04406
G1 X131.549 Y135.212 E-.21041
G1 X131.027 Y135.396 E-.21043
G1 X130.495 Y135.551 E-.21041
G1 X130.278 Y135.601 E-.0847
; WIPE_END
G1 E-.04 F1800
G1 X132.725 Y133.143 Z1.44 F30000
G1 Z1.04
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X135.439 Y129.877 I-8.076 J-9.471 E.18979
G1 X131.864 Y133.451 E.22485
G3 X130.883 Y133.881 I-7.002 J-14.659 E.04766
G1 X135.87 Y128.894 E.3137
G2 X136.134 Y128.078 I-4.923 J-2.045 E.0382
G1 X130.078 Y134.134 E.38093
G1 X129.386 Y134.275 E.03145
G1 X136.27 Y127.39 E.43307
G2 X136.351 Y126.758 I-3.351 J-.749 E.02841
G1 X128.756 Y134.352 E.47776
G3 X128.165 Y134.392 I-.721 J-6.346 E.02637
G1 X136.392 Y126.164 E.51757
G2 X136.385 Y125.62 I-4.368 J-.21 E.02422
G1 X127.623 Y134.382 E.55117
G1 X127.113 Y134.34 E.02276
G1 X136.344 Y125.11 E.58067
G1 X136.273 Y124.628 E.02164
G1 X126.623 Y134.278 E.60704
G3 X126.161 Y134.188 I.52 J-3.928 E.02096
G1 X136.188 Y124.162 E.63075
G2 X136.077 Y123.72 I-3.858 J.73 E.02025
G1 X125.726 Y134.072 E.65118
G3 X125.301 Y133.944 I.463 J-2.314 E.01974
G1 X135.941 Y123.305 E.66932
G1 X135.799 Y122.895 E.01928
G1 X124.902 Y133.792 E.68548
G3 X124.51 Y133.633 I.785 J-2.493 E.01886
G1 X135.626 Y122.516 E.69931
G1 X135.453 Y122.137 E.01853
G1 X124.137 Y133.453 E.71188
G1 X123.783 Y133.256 E.01805
G1 X135.25 Y121.789 E.72137
G1 X135.046 Y121.441 E.01794
G1 X123.446 Y133.041 E.72972
G1 X123.115 Y132.821 E.0177
G1 X134.818 Y121.117 E.73623
G2 X134.585 Y120.799 I-1.88 J1.132 E.01759
G1 X122.798 Y132.585 E.74144
G3 X122.496 Y132.336 I1.949 J-2.678 E.01745
M73 P32 R15
G1 X134.33 Y120.502 E.74444
G1 X134.075 Y120.205 E.0174
G1 X122.211 Y132.069 E.74628
G1 X121.933 Y131.795 E.01736
G1 X133.791 Y119.937 E.74598
G1 X133.508 Y119.668 E.01736
G1 X121.673 Y131.503 E.74448
G1 X121.42 Y131.204 E.01742
G1 X133.202 Y119.422 E.74114
G2 X132.891 Y119.181 I-1.531 J1.652 E.01752
G1 X121.185 Y130.887 E.73639
G1 X120.961 Y130.559 E.01766
G1 X132.557 Y118.963 E.72947
G1 X132.224 Y118.746 E.01774
G1 X120.751 Y130.218 E.72172
G1 X120.553 Y129.864 E.01804
G1 X131.86 Y118.557 E.71133
G1 X131.496 Y118.369 E.01822
G1 X120.376 Y129.489 E.69953
G1 X120.206 Y129.108 E.01859
G1 X131.104 Y118.21 E.68555
G2 X130.706 Y118.056 I-1.832 J4.153 E.01899
G1 X120.056 Y128.706 E.66992
G3 X119.926 Y128.284 I3.313 J-1.258 E.01963
G1 X130.285 Y117.926 E.65164
G2 X129.842 Y117.817 I-.905 J2.726 E.02031
G1 X119.817 Y127.841 E.63059
G1 X119.726 Y127.381 E.02087
G1 X129.38 Y117.726 E.60732
G2 X128.898 Y117.657 I-.678 J2.985 E.02169
G1 X119.663 Y126.892 E.58095
G1 X119.616 Y126.387 E.02254
G1 X128.386 Y117.617 E.55173
G2 X127.838 Y117.613 I-.31 J5.736 E.0244
G1 X119.613 Y125.838 E.5174
G3 X119.649 Y125.25 I3.245 J-.094 E.02625
G1 X127.25 Y117.649 E.47815
G2 X126.626 Y117.722 I.135 J3.886 E.02799
G1 X119.728 Y124.62 E.43394
G3 X119.871 Y123.925 I3.847 J.429 E.03159
G1 X125.929 Y117.867 E.38109
G2 X125.128 Y118.116 I1.167 J5.161 E.03736
G1 X120.126 Y123.118 E.31464
G3 X120.561 Y122.131 I5.016 J1.623 E.04808
G1 X124.138 Y118.554 E.22499
G2 X122.098 Y120.043 I3.383 J6.779 E.11286
G1 X120.821 Y121.319 E.08031
G1 X126.19 Y117.069 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.418216
G1 F12000
G2 X124.258 Y117.679 I1.617 J8.482 E.08299
G1 X123.345 Y118.155 E.04205
G2 X125.738 Y134.837 I4.659 J7.844 E.87769
G1 X126.748 Y135.037 E.04205
G2 X126.249 Y117.057 I1.255 J-9.031 E1.2939
G1 X128.762 Y134.723 F30000
; LINE_WIDTH: 0.416808
G1 F12000
G3 X125.358 Y134.358 I-.789 J-8.697 E.14024
G1 X124.471 Y134.027 E.03852
G3 X122.368 Y132.709 I3.408 J-7.778 E.10135
G1 X121.645 Y132.037 E.04018
G1 X121.03 Y131.319 E.03849
G3 X119.654 Y128.684 I7.935 J-5.821 E.12142
G3 X119.274 Y126.762 I9.541 J-2.885 E.07986
G3 X119.24 Y125.673 I12.039 J-.921 E.04437
G3 X119.644 Y123.361 I9.787 J.518 E.09576
G1 X119.989 Y122.436 E.04017
G3 X121.963 Y119.648 I8.147 J3.674 E.13987
G1 X122.713 Y119.006 E.04018
G1 X123.443 Y118.511 E.03588
G1 X124.39 Y118.01 E.0436
G3 X130.636 Y117.647 I3.599 J8.002 E.26034
G1 X131.561 Y117.99 E.04019
G1 X132.391 Y118.411 E.03786
G3 X134.339 Y119.942 I-5.265 J8.702 E.10106
G3 X135.779 Y121.955 I-7.522 J6.905 E.10097
G1 X136.141 Y122.747 E.03544
G3 X136.595 Y124.267 I-12.177 J4.464 E.06462
G3 X136.593 Y127.683 I-8.487 J1.703 E.13991
G1 X136.36 Y128.641 E.04012
G1 X136.047 Y129.479 E.0364
G3 X135.273 Y130.896 I-10.521 J-4.828 E.06579
G3 X132.887 Y133.266 I-7.166 J-4.832 E.13772
G3 X128.822 Y134.717 I-4.8 J-7.026 E.17757
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X129.335 Y134.665 E-.19598
G1 X130.212 Y134.484 E-.34018
G1 X130.697 Y134.343 E-.19209
G1 X130.776 Y134.315 E-.03175
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 5/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z1.44 I-.513 J1.104 P1  F30000
G1 X132.066 Y134.914 Z1.44
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X132.028 Y134.927 E.00179
G3 X126.058 Y116.396 I-4.037 J-8.926 E1.46768
G3 X128.341 Y116.21 I1.964 J10.001 E.10208
G3 X132.522 Y134.686 I-.35 J9.791 E1.14394
G1 X132.12 Y134.887 E.01999
G1 X132.23 Y135.251 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F600
G1 X132.183 Y135.271 E.00207
G3 X127.07 Y136.129 I-4.183 J-9.271 E.21526
G1 X127.07 Y136.129 E0
G3 X128.361 Y115.835 I.932 J-10.129 E1.28846
G3 X138.129 Y126.93 I-.364 J10.168 E.67937
G1 X138.129 Y126.93 E0
G3 X132.697 Y135.022 I-10.129 J-.93 E.41732
G1 X132.284 Y135.225 E.01889
M204 S10000
; WIPE_START
G1 F24000
G1 X132.183 Y135.271 E-.04198
G1 X131.658 Y135.493 E-.21683
G1 X131.12 Y135.684 E-.21684
G1 X130.572 Y135.843 E-.21686
G1 X130.399 Y135.883 E-.06748
; WIPE_END
G1 E-.04 F1800
G1 X123.588 Y132.439 Z1.72 F30000
G1 X120.569 Y130.912 Z1.72
G1 Z1.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X122.043 Y132.386 E.09272
G2 X123.959 Y133.742 I6.102 J-6.596 E.10471
G1 X120.255 Y130.038 E.23301
G3 X119.812 Y129.033 I29.848 J-13.772 E.04883
G1 X124.968 Y134.19 E.32437
G2 X125.788 Y134.448 I2.71 J-7.168 E.03824
G1 X119.55 Y128.211 E.39239
G3 X119.398 Y127.498 I21.755 J-4.999 E.03241
G1 X126.502 Y134.602 E.44689
G2 X127.152 Y134.69 I1.113 J-5.739 E.02918
G1 X119.309 Y126.847 E.4934
G3 X119.27 Y126.247 I15.092 J-1.283 E.02675
G1 X127.753 Y134.73 E.53365
G2 X128.312 Y134.728 I.196 J-20.239 E.02486
G1 X119.273 Y125.689 E.56858
G3 X119.308 Y125.164 I4.699 J.05 E.02346
G1 X128.837 Y134.692 E.59943
G2 X129.336 Y134.63 I-.309 J-4.468 E.02235
G1 X119.371 Y124.665 E.62684
G3 X119.458 Y124.191 I4.266 J.535 E.02146
G1 X129.807 Y134.54 E.65104
G2 X130.263 Y134.435 I-.587 J-3.585 E.02083
G1 X119.566 Y123.738 E.67291
G3 X119.694 Y123.305 I3.923 J.92 E.02011
G1 X130.696 Y134.307 E.69215
G1 X131.111 Y134.161 E.01956
G1 X119.839 Y122.889 E.70908
G1 X120.002 Y122.491 E.01913
G1 X131.508 Y133.997 E.72379
G2 X131.89 Y133.817 I-1.408 J-3.488 E.01877
G1 X120.182 Y122.11 E.73648
G3 X120.377 Y121.743 I3.36 J1.547 E.01847
G1 X132.257 Y133.623 E.74733
G2 X132.61 Y133.415 I-1.675 J-3.248 E.01824
G1 X120.585 Y121.39 E.75645
G3 X120.806 Y121.051 I3.134 J1.803 E.01804
G1 X132.95 Y133.194 E.76389
G1 X133.277 Y132.96 E.01789
G1 X121.041 Y120.725 E.76971
G1 X121.292 Y120.414 E.01775
G1 X133.588 Y132.71 E.77354
G2 X133.887 Y132.448 I-2.185 J-2.792 E.01769
G1 X121.551 Y120.113 E.77599
G3 X121.826 Y119.826 I2.687 J2.303 E.01766
G1 X134.174 Y132.174 E.77675
G2 X134.448 Y131.887 I-2.412 J-2.589 E.01766
G1 X122.113 Y119.552 E.77599
G3 X122.412 Y119.29 I2.484 J2.53 E.01769
G1 X134.711 Y131.589 E.77371
G1 X134.959 Y131.276 E.01777
G1 X122.723 Y119.04 E.76974
G1 X123.05 Y118.806 E.01789
G1 X135.193 Y130.949 E.7639
G2 X135.415 Y130.61 I-2.913 J-2.142 E.01804
G1 X123.39 Y118.585 E.75645
G3 X123.743 Y118.377 I2.028 J3.04 E.01824
G1 X135.623 Y130.257 E.74733
G2 X135.818 Y129.89 I-3.167 J-1.914 E.01847
G1 X124.11 Y118.183 E.73648
G3 X124.492 Y118.003 I1.789 J3.307 E.01877
G1 X135.998 Y129.509 E.72379
G1 X136.161 Y129.111 E.01913
G1 X124.889 Y117.839 E.70909
G1 X125.303 Y117.693 E.01956
G1 X136.306 Y128.696 E.69215
G2 X136.434 Y128.262 I-3.794 J-1.353 E.02011
G1 X125.737 Y117.565 E.67291
G3 X126.19 Y117.457 I1.189 J3.979 E.02072
G1 X136.542 Y127.809 E.65123
G2 X136.629 Y127.335 I-4.179 J-1.01 E.02146
G1 X126.664 Y117.37 E.62685
G3 X127.163 Y117.308 I.808 J4.406 E.02235
G1 X136.692 Y126.837 E.59944
G2 X136.727 Y126.311 I-4.664 J-.576 E.02346
G1 X127.688 Y117.272 E.56859
G3 X128.25 Y117.273 I.277 J4.351 E.025
G1 X136.73 Y125.753 E.53348
G2 X136.691 Y125.153 I-15.126 J.682 E.02675
G1 X128.848 Y117.31 E.4934
G3 X129.497 Y117.398 I-.463 J5.829 E.02918
G1 X136.602 Y124.502 E.4469
M73 P33 R15
G2 X136.45 Y123.79 I-7.522 J1.227 E.03239
G1 X130.212 Y117.552 E.39242
G3 X131.032 Y117.81 I-1.89 J7.424 E.03824
G1 X136.188 Y122.967 E.32438
G2 X135.745 Y121.963 I-30.328 J12.782 E.04882
G1 X132.041 Y118.258 E.23303
G1 X132.414 Y118.463 E.01895
G3 X135.432 Y121.088 I-7.492 J11.659 E.17852
G1 X120.463 Y120.342 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.396613
G1 F12000
G1 X119.872 Y121.211 E.04033
G2 X118.67 Y127.337 I8.097 J4.769 E.24432
G1 X118.866 Y128.362 E.04005
G2 X129.337 Y135.329 I9.121 J-2.355 E.52869
G1 X130.362 Y135.134 E.04005
G2 X137.329 Y124.663 I-2.354 J-9.12 E.52871
G1 X137.134 Y123.638 E.04005
G2 X128.773 Y116.607 I-9.113 J2.35 E.44747
G1 X127.73 Y116.57 E.04005
G2 X120.499 Y120.295 I.265 J9.394 E.32293
G1 X136.924 Y124.287 F30000
; LINE_WIDTH: 0.397654
G1 F12000
G1 X137.063 Y125.202 E.03566
G3 X129.713 Y134.924 I-9.045 J.801 E.5145
G1 X128.798 Y135.063 E.03566
G3 X119.076 Y127.713 I-.798 J-9.049 E.51446
G1 X118.937 Y126.798 E.03566
G3 X121.041 Y120.155 I9.1 J-.772 E.2753
G3 X128.316 Y116.918 I6.92 J5.758 E.31761
G1 X129.239 Y116.987 E.03566
G3 X136.912 Y124.228 I-1.229 J8.989 E.43359
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X136.801 Y123.695 E-.20711
G1 X136.488 Y122.725 E-.3873
G1 X136.32 Y122.323 E-.16559
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 6/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z1.72 I-1.158 J-.373 P1  F30000
G1 X132.176 Y135.174 Z1.72
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X132.144 Y135.184 E.0015
G3 X124.909 Y116.405 I-4.153 J-9.183 E1.45947
G3 X128.638 Y115.943 I3.097 J9.721 E.16811
G3 X132.652 Y134.936 I-.647 J10.058 E1.16403
G1 X132.23 Y135.147 E.02099
G1 X132.34 Y135.511 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1800
G1 X132.298 Y135.526 E.00181
G3 X124.794 Y116.048 I-4.308 J-9.525 E1.39735
G3 X128.658 Y115.569 I3.212 J10.081 E.16079
G3 X132.825 Y135.269 I-.668 J10.432 E1.11462
G1 X132.393 Y135.484 E.01981
M204 S10000
; WIPE_START
G1 F24000
G1 X132.298 Y135.526 E-.0395
G1 X131.759 Y135.756 E-.2228
G1 X131.206 Y135.952 E-.22287
G1 X130.643 Y136.116 E-.22285
G1 X130.51 Y136.147 E-.05198
; WIPE_END
G1 E-.04 F1800
G1 X133.117 Y133.675 Z2 F30000
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X135.809 Y130.573 I-9.389 J-10.868 E.18329
G1 X135.987 Y130.248 E.01651
G1 X132.246 Y133.99 E.23536
G3 X131.225 Y134.455 I-15.159 J-31.936 E.04991
G1 X136.455 Y129.224 E.32902
G2 X136.722 Y128.401 I-11.006 J-4.024 E.0385
G1 X130.4 Y134.723 E.39766
G3 X129.677 Y134.89 I-2.716 J-10.087 E.03305
G1 X136.891 Y127.675 E.45386
G2 X136.988 Y127.023 I-5.763 J-1.186 E.02936
G1 X129.023 Y134.988 E.50106
G3 X128.418 Y135.037 I-.74 J-5.364 E.02703
G1 X137.036 Y126.418 E.54219
G2 X137.045 Y125.853 I-5.027 J-.363 E.02516
G1 X127.852 Y135.046 E.57833
G3 X127.32 Y135.022 I-.054 J-4.751 E.02371
G1 X137.021 Y125.321 E.61031
G2 X136.969 Y124.817 I-4.513 J.213 E.02255
G1 X126.816 Y134.97 E.63872
G3 X126.339 Y134.891 I1.343 J-9.511 E.0215
G1 X136.893 Y124.337 E.66388
G2 X136.794 Y123.88 I-4.124 J.647 E.02084
G1 X125.88 Y134.793 E.68656
G3 X125.441 Y134.677 I.631 J-3.261 E.02024
G1 X136.676 Y123.441 E.70679
G2 X136.541 Y123.02 I-3.813 J.994 E.01967
G1 X125.02 Y134.541 E.72473
G3 X124.616 Y134.389 I1.149 J-3.675 E.01922
G1 X136.39 Y122.616 E.74064
G2 X136.223 Y122.226 I-3.553 J1.287 E.01886
G1 X124.227 Y134.222 E.75467
G3 X123.851 Y134.042 I1.422 J-3.434 E.01854
G1 X136.041 Y121.851 E.76685
G2 X135.844 Y121.493 I-3.293 J1.58 E.01822
G1 X123.492 Y133.845 E.77701
G3 X123.147 Y133.634 I1.703 J-3.181 E.01801
G1 X135.634 Y121.147 E.78553
G2 X135.411 Y120.813 I-3.083 J1.812 E.01785
G1 X122.813 Y133.411 E.79251
G3 X122.492 Y133.177 I1.927 J-2.981 E.01772
G1 X135.177 Y120.491 E.79802
G1 X134.93 Y120.182 E.0176
G1 X122.181 Y132.931 E.80196
G1 X121.887 Y132.669 E.01752
G1 X134.669 Y119.887 E.80406
G2 X134.396 Y119.604 I-2.663 J2.282 E.01751
G1 X121.604 Y132.396 E.80476
G3 X121.331 Y132.113 I2.392 J-2.566 E.01751
G1 X134.113 Y119.331 E.80406
G1 X133.818 Y119.069 E.01752
G1 X121.07 Y131.818 E.80196
G1 X120.822 Y131.509 E.0176
G1 X133.508 Y118.823 E.79802
G2 X133.187 Y118.589 I-2.249 J2.747 E.01772
G1 X120.588 Y131.187 E.79251
G3 X120.366 Y130.853 I2.861 J-2.146 E.01785
G1 X132.853 Y118.366 E.78553
G2 X132.508 Y118.155 I-2.048 J2.971 E.01801
G1 X120.156 Y130.507 E.77701
G3 X119.958 Y130.148 I3.095 J-1.938 E.01822
G1 X132.149 Y117.958 E.76685
G2 X131.773 Y117.778 I-1.797 J3.252 E.01854
G1 X119.777 Y129.774 E.75466
G3 X119.61 Y129.384 I3.386 J-1.676 E.01886
G1 X131.384 Y117.611 E.74064
G2 X130.98 Y117.459 I-1.554 J3.523 E.01922
G1 X119.459 Y128.98 E.72473
G3 X119.324 Y128.559 I3.678 J-1.415 E.01967
G1 X130.559 Y117.323 E.70679
G2 X130.121 Y117.205 I-1.27 J3.841 E.02019
G1 X119.206 Y128.12 E.68664
G3 X119.107 Y127.663 I4.026 J-1.105 E.02084
G1 X129.663 Y117.107 E.66404
G2 X129.183 Y117.031 I-.795 J3.462 E.02164
G1 X119.031 Y127.183 E.63867
G3 X118.979 Y126.679 I4.461 J-.717 E.02255
G1 X128.676 Y116.981 E.61006
G2 X128.148 Y116.954 I-.7 J8.301 E.02354
G1 X118.955 Y126.147 E.57832
G3 X118.964 Y125.582 I5.036 J-.202 E.02516
G1 X127.582 Y116.963 E.54218
G2 X126.977 Y117.012 I.135 J5.412 E.02703
G1 X119.012 Y124.977 E.50105
G3 X119.109 Y124.324 I5.859 J.533 E.02936
G1 X126.317 Y117.116 E.45345
G2 X125.6 Y117.277 I1.32 J7.551 E.03272
G1 X119.278 Y123.599 E.39764
G3 X119.545 Y122.775 I11.267 J3.199 E.0385
G1 X124.775 Y117.546 E.329
G2 X123.747 Y118.018 I3.837 J9.714 E.05035
G1 X120.013 Y121.752 E.2349
M73 P34 R15
G3 X121.404 Y119.804 I8.595 J4.67 E.10673
G1 X122.883 Y118.326 E.09301
G1 X137.261 Y128.929 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.380468
G1 F12000
G2 X128.642 Y116.308 I-9.236 J-2.947 E.64345
G1 X127.718 Y116.28 E.0338
G2 X137.091 Y129.452 I.284 J9.719 E1.53529
G1 X137.243 Y128.986 E.01791
G1 X128.23 Y116.607 F30000
; LINE_WIDTH: 0.380656
G1 F12000
G1 X129.281 Y116.683 E.03851
G3 X122.747 Y118.199 I-1.282 J9.315 E1.90976
G3 X128.17 Y116.607 I5.259 J7.877 E.20991
; CHANGE_LAYER
; Z_HEIGHT: 1.88
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X127.702 Y116.6 E-.17786
G1 X127.176 Y116.632 E-.20044
G1 X126.651 Y116.693 E-.20063
G1 X126.183 Y116.778 E-.18107
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 7/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z2 I-1.157 J.378 P1  F30000
G1 X132.282 Y135.426 Z2
G1 Z1.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X132.256 Y135.431 E.0012
G3 X126.521 Y115.753 I-4.265 J-9.432 E1.57654
G3 X128.327 Y115.653 I1.461 J10.087 E.08055
G3 X132.778 Y135.178 I-.336 J10.346 E1.21023
G1 X132.336 Y135.399 E.02199
G1 X132.446 Y135.763 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1800
G1 X132.412 Y135.777 E.00151
G3 X130.048 Y136.529 I-4.412 J-9.777 E.10208
G1 X130.048 Y136.529 E0
G3 X117.471 Y128.048 I-2.048 J-10.529 E.69182
G1 X117.471 Y128.048 E0
G3 X128.346 Y115.279 I10.534 J-2.044 E.79054
G3 X138.529 Y123.952 I-.353 J10.729 E.59291
G1 X138.529 Y123.952 E0
G3 X132.953 Y135.515 I-10.529 J2.048 E.56504
G1 X132.5 Y135.737 E.02073
M204 S10000
; WIPE_START
G1 F24000
G1 X132.412 Y135.777 E-.0368
G1 X131.857 Y136.011 E-.22865
G1 X131.29 Y136.212 E-.22869
G1 X130.712 Y136.38 E-.22867
G1 X130.617 Y136.402 E-.03719
; WIPE_END
G1 E-.04 F1800
G1 X123.335 Y134.115 Z2.28 F30000
G1 X122.7 Y133.915 Z2.28
G1 Z1.88
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X121.176 Y132.392 E.09585
G3 X119.756 Y130.409 I6.983 J-6.503 E.10881
G1 X123.589 Y134.242 E.24116
G2 X124.631 Y134.722 I4.697 J-8.834 E.05104
G1 X119.276 Y129.366 E.3369
G3 X119 Y128.529 I12.492 J-4.57 E.03923
G1 X125.471 Y134.999 E.40704
G2 X126.213 Y135.179 I3.573 J-13.134 E.03397
G1 X118.825 Y127.791 E.46476
G3 X118.72 Y127.124 I9.708 J-1.868 E.03005
G1 X126.877 Y135.281 E.51314
G2 X127.49 Y135.331 I.838 J-6.395 E.02738
G1 X118.666 Y126.507 E.5551
G3 X118.652 Y125.931 I5.124 J-.412 E.02565
G1 X128.069 Y135.348 E.59237
G2 X128.611 Y135.328 I.096 J-4.842 E.02417
G1 X118.672 Y125.388 E.62528
G3 X118.72 Y124.874 I4.602 J.171 E.02299
G1 X129.126 Y135.28 E.65461
G2 X129.615 Y135.207 I-.402 J-4.396 E.02203
G1 X118.793 Y124.384 E.68082
G3 X118.887 Y123.917 I4.21 J.609 E.02124
G1 X130.081 Y135.111 E.70417
G2 X130.532 Y134.999 I-.64 J-3.545 E.02066
G1 X119.002 Y123.469 E.72533
G3 X119.133 Y123.038 I3.899 J.958 E.02004
G1 X130.963 Y134.867 E.74414
G2 X131.377 Y134.72 I-1.106 J-3.765 E.01959
G1 X119.281 Y122.624 E.76093
G1 X119.445 Y122.225 E.01917
G1 X131.774 Y134.554 E.77558
G2 X132.156 Y134.374 I-1.416 J-3.49 E.0188
G1 X119.626 Y121.844 E.78822
G3 X119.82 Y121.476 I3.374 J1.545 E.01852
G1 X132.524 Y134.18 E.79919
G2 X132.881 Y133.974 I-1.658 J-3.274 E.01832
G1 X120.028 Y121.121 E.80852
G1 X120.247 Y120.777 E.01812
G1 X133.225 Y133.755 E.81642
G1 X133.553 Y133.521 E.01793
G1 X120.478 Y120.446 E.8225
G3 X120.724 Y120.13 I2.936 J2.035 E.01783
G1 X133.869 Y133.275 E.82691
G2 X134.175 Y133.019 I-2.134 J-2.849 E.01776
G1 X120.982 Y119.825 E.82994
G3 X121.25 Y119.531 I2.753 J2.241 E.01772
G1 X134.47 Y132.751 E.83161
G1 X134.75 Y132.469 E.01769
G1 X121.53 Y119.249 E.83161
G3 X121.825 Y118.981 I2.53 J2.49 E.01772
G1 X135.018 Y132.175 E.82995
G2 X135.276 Y131.87 I-2.586 J-2.443 E.01776
G1 X122.131 Y118.725 E.82691
G3 X122.447 Y118.479 I2.347 J2.696 E.01784
G1 X135.522 Y131.554 E.8225
G1 X135.754 Y131.224 E.01795
G1 X122.775 Y118.245 E.81649
G3 X123.119 Y118.026 I2.109 J2.947 E.01814
G1 X135.973 Y130.88 E.80859
G2 X136.18 Y130.525 I-3.064 J-2.019 E.01831
G1 X123.477 Y117.822 E.79908
G3 X123.844 Y117.627 I2.231 J3.743 E.0185
G1 X136.374 Y130.156 E.78822
G2 X136.555 Y129.775 I-3.305 J-1.802 E.01879
G1 X124.226 Y117.446 E.77558
G1 X124.623 Y117.28 E.01912
G1 X136.719 Y129.376 E.76093
G2 X136.867 Y128.962 I-3.616 J-1.525 E.01958
G1 X125.037 Y117.133 E.74414
G3 X125.468 Y117.001 I1.386 J3.769 E.02005
G1 X136.998 Y128.531 E.72533
G2 X137.113 Y128.083 I-3.934 J-1.241 E.02058
G1 X125.917 Y116.887 E.7043
G3 X126.385 Y116.793 I1.075 J4.118 E.02124
G1 X137.207 Y127.616 E.68083
G2 X137.28 Y127.126 I-4.322 J-.894 E.02202
G1 X126.874 Y116.72 E.65461
G3 X127.389 Y116.672 I.685 J4.554 E.02299
G1 X137.325 Y126.609 E.62509
G2 X137.348 Y126.069 I-4.167 J-.446 E.02404
G1 X127.933 Y116.654 E.59225
G3 X128.507 Y116.666 I.166 J6.018 E.02555
G1 X137.334 Y125.493 E.55527
G2 X137.28 Y124.877 I-5.515 J.172 E.02753
G1 X129.123 Y116.719 E.51315
G3 X129.787 Y116.821 I-.574 J5.964 E.02991
G1 X137.175 Y124.209 E.46477
G2 X137 Y123.472 I-5.801 J.99 E.03376
G1 X130.529 Y117.001 E.40705
M73 P34 R14
G3 X131.369 Y117.278 I-2.965 J10.387 E.03935
G1 X136.724 Y122.634 E.33691
G2 X136.244 Y121.592 I-10.031 J3.987 E.05107
G1 X132.411 Y117.758 E.24118
G3 X133.171 Y118.208 I-3.633 J6.996 E.03935
G3 X135.917 Y120.702 I-9.511 J13.233 E.16534
G1 X128.321 Y116.005 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.366482
G1 F12000
G2 X134.002 Y117.995 I-.313 J9.998 E1.9831
G2 X128.381 Y116.008 I-6.001 J8.032 E.21159
G1 X137.509 Y124.146 F30000
; LINE_WIDTH: 0.36664
G1 F12000
G1 X137.662 Y125.15 E.03553
G3 X129.854 Y135.509 I-9.645 J.852 E.4971
G1 X128.85 Y135.662 E.03553
G3 X118.491 Y127.854 I-.852 J-9.645 E.4971
G1 X118.338 Y126.85 E.03553
G3 X128.309 Y116.317 I9.65 J-.851 E.57316
G1 X129.322 Y116.391 E.03553
G3 X137.497 Y124.087 I-1.311 J9.582 E.41893
; CHANGE_LAYER
; Z_HEIGHT: 2.16
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X137.383 Y123.543 E-.21134
G1 X137.231 Y123.022 E-.20636
G1 X137.049 Y122.509 E-.20672
G1 X136.912 Y122.18 E-.13558
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 8/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z2.28 I-1.153 J-.388 P1  F30000
G1 X132.379 Y135.659 Z2.28
G1 Z2.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X132.36 Y135.663 E.00085
G3 X124.187 Y116.104 I-4.369 J-9.661 E1.50904
G3 X128.622 Y115.417 I3.796 J9.848 E.20118
G3 X132.895 Y135.403 I-.632 J10.585 E1.22688
G1 X132.432 Y135.632 E.02296
G1 X132.542 Y135.996 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1800
G1 X132.514 Y136.004 E.00121
G3 X124.052 Y115.754 I-4.524 J-10.003 E1.4422
G3 X128.642 Y115.042 I3.93 J10.196 E.19218
G3 X133.068 Y135.735 I-.652 J10.959 E1.17261
G1 X132.596 Y135.969 E.02163
M204 S10000
; WIPE_START
G1 F24000
G1 X132.514 Y136.004 E-.03384
G1 X131.948 Y136.246 E-.23399
G1 X131.367 Y136.452 E-.23407
G1 X130.776 Y136.624 E-.23405
G1 X130.714 Y136.638 E-.02405
; WIPE_END
G1 E-.04 F1800
G1 X133.487 Y134.13 Z2.56 F30000
G1 Z2.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X136.458 Y130.603 I-9.551 J-11.06 E.20599
G1 X132.602 Y134.459 E.24256
G3 X131.554 Y134.951 I-4.839 J-8.942 E.05153
G1 X136.949 Y129.556 E.3394
G2 X137.241 Y128.709 I-17.867 J-6.62 E.03986
G1 X130.709 Y135.24 E.4109
G3 X129.964 Y135.429 I-2.053 J-6.535 E.03419
G1 X137.428 Y127.966 E.4695
G2 X137.545 Y127.293 I-15.378 J-3.033 E.03041
G1 X129.294 Y135.544 E.51907
G3 X128.676 Y135.606 I-.864 J-5.473 E.02765
G1 X137.607 Y126.675 E.56183
G2 X137.63 Y126.097 I-5.138 J-.491 E.02576
G1 X128.097 Y135.629 E.59966
G3 X127.551 Y135.619 I-.184 J-4.864 E.02429
G1 X137.62 Y125.551 E.63336
G2 X137.582 Y125.033 I-4.63 J.079 E.02311
G1 X127.034 Y135.581 E.66355
G3 X126.54 Y135.519 I.307 J-4.426 E.02214
G1 X137.52 Y124.539 E.6907
G2 X137.436 Y124.067 I-4.25 J.505 E.02135
G1 X126.068 Y135.435 E.71517
G3 X125.614 Y135.333 I.686 J-4.087 E.02068
G1 X137.332 Y123.615 E.73711
G2 X137.209 Y123.183 I-3.914 J.88 E.02002
G1 X125.185 Y135.207 E.75639
G1 X124.768 Y135.068 E.01956
G1 X137.07 Y122.766 E.77391
G2 X136.917 Y122.363 I-3.66 J1.165 E.01917
G1 X124.364 Y134.916 E.78967
G3 X123.975 Y134.749 I1.296 J-3.542 E.01882
G1 X136.75 Y121.974 E.80361
G1 X136.568 Y121.6 E.0185
G1 X123.599 Y134.569 E.81583
G1 X123.24 Y134.372 E.01821
M73 P35 R14
G1 X136.372 Y121.241 E.82604
G2 X136.164 Y120.893 I-3.201 J1.677 E.01804
G1 X122.893 Y134.164 E.83481
G3 X122.557 Y133.944 I1.785 J-3.105 E.01787
G1 X135.945 Y120.556 E.84222
G1 X135.713 Y120.232 E.01772
G1 X122.231 Y133.714 E.84815
G1 X121.921 Y133.469 E.0176
G1 X135.468 Y119.921 E.85224
G2 X135.213 Y119.62 I-2.805 J2.121 E.01755
G1 X121.621 Y133.213 E.85508
G3 X121.33 Y132.948 I2.219 J-2.717 E.01751
G1 X134.948 Y119.329 E.85667
G1 X134.67 Y119.052 E.01748
G1 X121.052 Y132.67 E.85667
G3 X120.787 Y132.38 I2.457 J-2.504 E.01751
G1 X134.379 Y118.787 E.85507
G2 X134.079 Y118.531 I-2.427 J2.544 E.01755
G1 X120.532 Y132.079 E.85224
G3 X120.287 Y131.768 I2.644 J-2.338 E.01761
G1 X133.769 Y118.285 E.84815
G1 X133.443 Y118.056 E.01774
G1 X120.055 Y131.444 E.84222
G3 X119.836 Y131.107 I2.891 J-2.116 E.01788
G1 X133.107 Y117.836 E.83481
G2 X132.759 Y117.628 I-2.03 J2.987 E.01803
G1 X119.628 Y130.759 E.82604
G3 X119.432 Y130.4 I3.101 J-1.93 E.01822
G1 X132.401 Y117.431 E.81583
G2 X132.025 Y117.251 I-1.789 J3.254 E.01855
G1 X119.25 Y130.026 E.80361
G3 X119.083 Y129.637 I3.379 J-1.679 E.01884
G1 X131.636 Y117.084 E.78967
G2 X131.234 Y116.93 I-1.571 J3.501 E.01915
G1 X118.93 Y129.234 E.77404
G3 X118.791 Y128.817 I3.642 J-1.445 E.01956
G1 X130.818 Y116.79 E.75658
G1 X130.385 Y116.667 E.02001
G1 X118.668 Y128.385 E.73711
G1 X118.564 Y127.933 E.02061
G1 X129.932 Y116.565 E.71516
G2 X129.46 Y116.481 I-.98 J4.163 E.02134
G1 X118.48 Y127.461 E.69069
G3 X118.418 Y126.967 I4.366 J-.799 E.02215
G1 X128.962 Y116.423 E.66326
G2 X128.448 Y116.381 I-.755 J5.99 E.02292
G1 X118.38 Y126.449 E.63336
G3 X118.37 Y125.903 I4.854 J-.362 E.02429
G1 X127.903 Y116.371 E.59965
G2 X127.324 Y116.394 I-.085 J5.165 E.02578
G1 X118.393 Y125.325 E.56183
G3 X118.455 Y124.707 I5.529 J.241 E.02762
G1 X126.706 Y116.456 E.51906
G2 X126.035 Y116.571 I2.161 J14.662 E.03026
G1 X118.572 Y124.034 E.46948
G3 X118.759 Y123.291 I6.707 J1.293 E.03408
G1 X125.291 Y116.76 E.41088
G2 X124.446 Y117.049 I3.003 J10.147 E.03975
G1 X119.051 Y122.444 E.33938
G3 X119.542 Y121.397 I9.105 J3.634 E.05149
G1 X123.398 Y117.541 E.24253
G2 X119.876 Y120.507 I7.515 J12.497 E.20564
G1 X128.647 Y115.911 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.642104
G1 F7731.758
G1 X127.699 Y115.886 E.06293
G2 X129.393 Y115.977 I.302 J10.113 E4.10809
G1 X128.707 Y115.916 E.04576
; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X129.393 Y115.977 E-.26191
G1 X129.951 Y116.071 E-.21507
G1 X130.505 Y116.196 E-.21568
G1 X130.675 Y116.244 E-.06734
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 9/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z2.56 I-1.212 J.111 P1  F30000
G1 X132.474 Y135.89 Z2.56
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X132.464 Y135.892 E.00049
G3 X127.661 Y115.15 I-4.463 J-9.894 E1.70631
G3 X128.879 Y115.18 I.329 J11.263 E.0542
G3 X133.011 Y135.627 I-.878 J10.818 E1.24597
G1 X132.528 Y135.864 E.02393
G1 X132.638 Y136.227 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1800
G1 X132.618 Y136.234 E.00088
G3 X127.65 Y114.775 I-4.617 J-10.235 E1.62943
G3 X128.909 Y114.806 I.34 J11.648 E.05174
G3 X133.184 Y135.959 I-.909 J11.192 E1.18981
G1 X132.692 Y136.201 E.02252
M204 S10000
; WIPE_START
G1 F24000
G1 X132.618 Y136.234 E-.03091
G1 X132.038 Y136.48 E-.23934
G1 X131.444 Y136.689 E-.23939
G1 X130.839 Y136.866 E-.23937
G1 X130.811 Y136.872 E-.011
; WIPE_END
G1 E-.04 F1800
G1 X123.897 Y133.64 Z2.84 F30000
G1 X119.656 Y131.657 Z2.84
G1 Z2.44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X121.233 Y133.234 E.09919
G2 X123.245 Y134.686 I6.871 J-7.4 E.11067
G1 X119.313 Y130.754 E.24734
G3 X118.81 Y129.691 I8.983 J-4.901 E.05234
G1 X124.308 Y135.188 E.34582
G2 X125.169 Y135.49 I3.876 J-9.697 E.04061
G1 X118.511 Y128.832 E.41883
G3 X118.32 Y128.081 I5.95 J-1.911 E.03448
G1 X125.921 Y135.682 E.47816
G2 X126.605 Y135.806 I1.576 J-6.748 E.03093
G1 X118.193 Y127.394 E.52921
G3 X118.126 Y126.766 I5.551 J-.912 E.02807
G1 X127.235 Y135.876 E.57303
G2 X127.822 Y135.903 I.536 J-5.216 E.02617
G1 X118.098 Y126.179 E.61171
G3 X118.104 Y125.624 I4.94 J-.228 E.02468
G1 X128.377 Y135.897 E.64625
G2 X128.903 Y135.864 I-.035 J-4.706 E.02348
G1 X118.137 Y125.098 E.67726
G3 X118.195 Y124.596 I4.5 J.264 E.0225
G1 X129.405 Y135.806 E.70519
G2 X129.883 Y135.724 I-.493 J-4.297 E.02158
G1 X118.275 Y124.116 E.73022
G3 X118.377 Y123.658 I4.128 J.679 E.02088
G1 X130.341 Y135.621 E.75259
G2 X130.783 Y135.503 I-.729 J-3.619 E.02037
G1 X118.497 Y123.217 E.77289
G3 X118.632 Y122.792 I3.85 J.99 E.01984
G1 X131.208 Y135.369 E.79116
G2 X131.619 Y135.22 I-1.121 J-3.735 E.01946
G1 X118.781 Y122.382 E.80761
G1 X118.944 Y121.985 E.01909
G1 X132.014 Y135.055 E.8222
G2 X132.394 Y134.874 I-1.415 J-3.47 E.01871
G1 X119.125 Y121.605 E.83471
G3 X119.318 Y121.238 I3.366 J1.532 E.01846
G1 X132.762 Y134.682 E.84574
G2 X133.119 Y134.479 I-1.631 J-3.279 E.01828
G1 X119.522 Y120.882 E.85536
G1 X119.737 Y120.537 E.01808
G1 X133.462 Y134.262 E.8634
G2 X133.792 Y134.032 I-1.884 J-3.053 E.0179
G1 X119.968 Y120.208 E.86964
G3 X120.208 Y119.889 I2.963 J1.984 E.0178
G1 X134.112 Y133.792 E.87462
G2 X134.422 Y133.542 I-2.067 J-2.886 E.01773
G1 X120.459 Y119.579 E.87838
G1 X120.722 Y119.282 E.01765
G1 X134.717 Y133.277 E.88036
G2 X135.002 Y133.002 I-2.306 J-2.676 E.01763
G1 X120.998 Y118.998 E.88095
G3 X121.283 Y118.723 I2.59 J2.4 E.01763
G1 X135.278 Y132.718 E.88036
G1 X135.541 Y132.421 E.01765
G1 X121.578 Y118.458 E.87839
G3 X121.888 Y118.208 I2.378 J2.637 E.01773
G1 X135.792 Y132.111 E.87462
G2 X136.032 Y131.792 I-2.723 J-2.304 E.0178
G1 X122.208 Y117.968 E.86964
G3 X122.538 Y117.738 I2.214 J2.822 E.0179
G1 X136.263 Y131.463 E.8634
G1 X136.478 Y131.118 E.01808
G1 X122.881 Y117.521 E.85536
G3 X123.238 Y117.318 I1.987 J3.074 E.01828
G1 X136.682 Y130.762 E.84574
G2 X136.875 Y130.395 I-3.174 J-1.899 E.01846
G1 X123.606 Y117.126 E.83471
G3 X123.986 Y116.945 I1.795 J3.291 E.01871
G1 X137.056 Y130.016 E.8222
G1 X137.219 Y129.619 E.01909
G1 X124.381 Y116.78 E.80761
G3 X124.792 Y116.631 I1.532 J3.586 E.01946
G1 X137.368 Y129.208 E.79116
G2 X137.503 Y128.783 I-3.715 J-1.415 E.01984
G1 X125.217 Y116.497 E.7729
G3 X125.658 Y116.378 I1.279 J3.869 E.02034
G1 X137.623 Y128.342 E.75265
G2 X137.722 Y127.882 I-4.539 J-1.218 E.02098
G1 X126.117 Y116.276 E.73005
G3 X126.595 Y116.194 I.971 J4.217 E.02158
G1 X137.805 Y127.404 E.70518
G2 X137.863 Y126.902 I-4.012 J-.72 E.02249
G1 X127.097 Y116.136 E.67726
G3 X127.623 Y116.103 I.561 J4.67 E.02348
G1 X137.896 Y126.376 E.64625
G2 X137.902 Y125.821 I-4.934 J-.326 E.02468
G1 X128.181 Y116.1 E.61153
G3 X128.765 Y116.124 I.05 J5.83 E.02602
G1 X137.874 Y125.234 E.57304
G2 X137.807 Y124.606 I-5.619 J.285 E.02807
G1 X129.394 Y116.193 E.52924
G3 X130.078 Y116.318 I-.765 J6.155 E.03096
G1 X137.68 Y123.919 E.47818
G2 X137.489 Y123.168 I-6.141 J1.16 E.03448
G1 X130.831 Y116.51 E.41885
G3 X131.692 Y116.811 I-3.014 J9.998 E.04061
G1 X137.19 Y122.309 E.34583
G2 X136.687 Y121.246 I-9.486 J3.838 E.05233
G1 X132.755 Y117.314 E.24737
G3 X133.478 Y117.746 I-3.487 J6.655 E.03751
G3 X136.344 Y120.343 I-10.023 J13.942 E.17242
M73 P36 R14
G1 X128.282 Y115.631 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.619835
G1 F8039.36
G2 X137.465 Y121.738 I-.275 J10.373 E3.42078
G2 X128.341 Y115.634 I-9.448 J4.251 E.73877
; CHANGE_LAYER
; Z_HEIGHT: 2.72
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X128.848 Y115.654 E-.19266
G1 X129.427 Y115.718 E-.22125
G1 X130.001 Y115.814 E-.22129
G1 X130.322 Y115.886 E-.12481
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 10/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z2.84 I-1.21 J.134 P1  F30000
G1 X132.56 Y136.099 Z2.84
G1 Z2.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X132.555 Y136.096 E.00024
G3 X123.443 Y115.9 I-4.565 J-10.094 E1.54893
G3 X128.573 Y114.938 I4.562 J10.174 E.23434
G3 X133.114 Y135.824 I-.582 J11.063 E1.28534
G1 X132.614 Y136.072 E.02485
G1 X132.724 Y136.436 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1800
G1 X132.71 Y136.438 E.00058
G3 X123.288 Y115.558 I-4.719 J-10.436 E1.47815
G3 X128.592 Y114.564 I4.716 J10.519 E.22365
G3 X133.287 Y136.157 I-.602 J11.438 E1.22658
G1 X132.777 Y136.409 E.02337
M204 S10000
; WIPE_START
G1 F24000
G1 X132.71 Y136.438 E-.02788
G1 X132.119 Y136.69 E-.24413
G1 X131.513 Y136.904 E-.24419
G1 X130.897 Y137.083 E-.2438
; WIPE_END
G1 E-.04 F1800
G1 X133.834 Y134.527 Z3.12 F30000
G1 Z2.72
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X136.876 Y130.933 I-9.941 J-11.498 E.21032
G1 X132.933 Y134.875 E.24801
G3 X131.867 Y135.389 I-4.951 J-8.91 E.05268
G1 X137.389 Y129.867 E.34737
G2 X137.704 Y129 I-11.281 J-4.584 E.04103
G1 X131.002 Y135.702 E.42157
G3 X130.25 Y135.902 I-2.16 J-6.602 E.03466
G1 X137.902 Y128.25 E.48139
G2 X138.033 Y127.566 I-6.022 J-1.512 E.03099
G1 X129.565 Y136.034 E.53273
G3 X128.941 Y136.106 I-1.139 J-7.165 E.02795
G1 X138.113 Y126.934 E.57698
G2 X138.15 Y126.344 I-5.234 J-.63 E.02631
G1 X128.344 Y136.151 E.61692
G3 X127.787 Y136.155 I-.305 J-3.85 E.02477
G1 X138.154 Y125.789 E.65212
G2 X138.128 Y125.262 I-4.705 J-.038 E.02348
G1 X127.261 Y136.129 E.68366
G3 X126.758 Y136.079 I.197 J-4.495 E.02246
G1 X138.078 Y124.759 E.71211
G2 X138.007 Y124.278 I-4.319 J.394 E.02165
G1 X126.278 Y136.007 E.73786
G3 X125.816 Y135.917 I.576 J-4.157 E.02094
G1 X137.917 Y123.816 E.76125
G2 X137.81 Y123.37 I-4.02 J.729 E.02039
G1 X125.371 Y135.809 E.78251
G3 X124.941 Y135.687 I.874 J-3.879 E.01989
G1 X137.686 Y122.942 E.80171
G2 X137.539 Y122.537 I-2.885 J.811 E.01921
G1 X124.531 Y135.545 E.8183
G3 X124.134 Y135.39 I1.182 J-3.614 E.01898
G1 X137.389 Y122.133 E.8339
G2 X137.223 Y121.748 I-3.512 J1.285 E.01866
G1 X123.749 Y135.223 E.84766
G1 X123.375 Y135.044 E.01843
G1 X137.043 Y121.376 E.85981
G2 X136.848 Y121.018 I-3.283 J1.552 E.01813
G1 X123.018 Y134.849 E.87004
G3 X122.671 Y134.643 I1.653 J-3.193 E.01795
G1 X136.644 Y120.67 E.87902
G1 X136.43 Y120.332 E.01781
G1 X122.333 Y134.429 E.8868
G1 X122.009 Y134.2 E.01763
G1 X136.2 Y120.01 E.8927
G2 X135.961 Y119.696 I-2.91 J1.97 E.01754
G1 X121.696 Y133.961 E.89734
G3 X121.392 Y133.712 I2.059 J-2.831 E.01747
G1 X135.713 Y119.391 E.90089
G1 X135.452 Y119.101 E.0174
G1 X121.1 Y133.453 E.90284
G3 X120.82 Y133.18 I2.285 J-2.629 E.01738
G1 X135.18 Y118.82 E.90337
G2 X134.9 Y118.547 I-2.564 J2.356 E.01738
G1 X120.548 Y132.899 E.90284
G1 X120.287 Y132.609 E.0174
G1 X134.608 Y118.288 E.90089
G2 X134.304 Y118.039 I-2.363 J2.583 E.01747
G1 X120.039 Y132.304 E.89734
G3 X119.8 Y131.99 I2.671 J-2.284 E.01754
G1 X133.991 Y117.8 E.8927
G1 X133.667 Y117.571 E.01763
G1 X119.57 Y131.668 E.88679
G1 X119.356 Y131.33 E.01781
G1 X133.329 Y117.356 E.87902
G2 X132.982 Y117.151 I-2 J2.988 E.01795
G1 X119.152 Y130.982 E.87004
G3 X118.957 Y130.624 I3.089 J-1.91 E.01813
G1 X132.625 Y116.956 E.85981
G1 X132.251 Y116.777 E.01843
G1 X118.777 Y130.252 E.84765
G3 X118.61 Y129.866 I3.353 J-1.674 E.01871
G1 X131.866 Y116.61 E.83388
G2 X131.469 Y116.455 I-1.579 J3.458 E.01898
G1 X118.456 Y129.468 E.8186
G3 X118.314 Y129.057 I3.586 J-1.466 E.01934
G1 X131.059 Y116.313 E.8017
G2 X130.629 Y116.191 I-1.305 J3.761 E.01989
G1 X118.19 Y128.63 E.78251
G3 X118.083 Y128.184 I3.913 J-1.174 E.02039
G1 X130.184 Y116.083 E.76124
G2 X129.722 Y115.993 I-1.037 J4.066 E.02094
G1 X117.993 Y127.722 E.73786
G3 X117.922 Y127.241 I4.247 J-.875 E.02165
G1 X129.239 Y115.923 E.71195
G1 X128.734 Y115.876 E.02257
G1 X117.878 Y126.732 E.6829
G3 X117.846 Y126.211 I3.59 J-.481 E.02322
G1 X128.213 Y115.845 E.65212
G2 X127.657 Y115.848 I-.249 J4.951 E.02473
G1 X117.85 Y125.656 E.61696
G3 X117.887 Y125.066 I5.272 J.04 E.02631
G1 X127.067 Y115.886 E.57747
G2 X126.435 Y115.966 I.394 J5.669 E.02835
G1 X117.967 Y124.434 E.53272
G3 X118.098 Y123.75 I6.154 J.828 E.03099
G1 X125.75 Y116.098 E.48138
G2 X124.998 Y116.298 I1.407 J6.801 E.03466
G1 X118.296 Y122.999 E.42156
G3 X118.611 Y122.133 I11.599 J3.718 E.04103
G1 X124.133 Y116.611 E.34736
G2 X123.067 Y117.125 I3.885 J9.423 E.05268
G1 X119.124 Y121.067 E.24799
G3 X122.166 Y117.473 I12.984 J7.905 E.21029
G1 X129.516 Y136.504 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.592695
G1 F8449.021
G2 X128.629 Y115.405 I-1.51 J-10.505 E1.89597
G2 X129.457 Y136.512 I-.634 J10.594 E2.15368
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X128.925 Y136.574 E-.20345
G1 X128.321 Y136.614 E-.22989
G1 X127.728 Y136.616 E-.22559
G1 X127.462 Y136.602 E-.10107
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 11/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z3.12 I.071 J1.215 P1  F30000
G1 X132.648 Y136.3 Z3.12
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G3 X127.015 Y114.737 I-4.655 J-10.301 E1.74958
G3 X128.867 Y114.729 I.983 J12.524 E.08247
G3 X132.702 Y136.275 I-.875 J11.27 E1.32466
G1 X132.81 Y136.644 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1800
G1 X132.803 Y136.645 E.00029
G3 X128.887 Y114.354 I-4.801 J-10.646 E1.74597
G3 X139.156 Y129.456 I-.887 J11.646 E.86089
G1 X139.156 Y129.456 E0
G3 X133.444 Y136.331 I-11.155 J-3.457 E.37662
G1 X132.864 Y136.618 E.02658
M204 S10000
; WIPE_START
G1 F24000
G1 X132.803 Y136.645 E-.02526
G1 X132.2 Y136.9 E-.24894
G1 X131.582 Y137.118 E-.249
G1 X130.984 Y137.293 E-.2368
; WIPE_END
G1 E-.04 F1800
G1 X123.647 Y135.189 Z3.4 F30000
G1 X122.005 Y134.718 Z3.4
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G3 X118.918 Y131.076 I10.279 J-11.841 E.21317
G1 X122.925 Y135.083 E.25205
G2 X124.003 Y135.606 I5.128 J-9.195 E.05335
G1 X118.394 Y129.997 E.35285
G3 X118.072 Y129.12 I11.158 J-4.593 E.04157
G1 X124.883 Y135.93 E.42842
G2 X125.641 Y136.133 I2.191 J-6.652 E.03496
G1 X117.867 Y128.359 E.48906
G3 X117.73 Y127.667 I6.096 J-1.568 E.03141
G1 X126.333 Y136.27 E.54119
G2 X126.972 Y136.354 I1.067 J-5.649 E.02869
G1 X117.645 Y127.027 E.58671
G3 X117.603 Y126.43 I5.298 J-.674 E.02665
G1 X127.569 Y136.396 E.62694
G2 X128.132 Y136.404 I.351 J-5.008 E.02506
G1 X117.595 Y125.867 E.66285
G3 X117.617 Y125.333 I4.764 J-.078 E.02378
G1 X128.667 Y136.383 E.69512
G2 X129.176 Y136.337 I-.15 J-4.562 E.02278
G1 X117.663 Y124.824 E.7243
G3 X117.73 Y124.336 I4.378 J.355 E.02192
G1 X129.665 Y136.271 E.7508
G2 X130.135 Y136.185 I-.527 J-4.224 E.02125
G1 X117.816 Y123.866 E.77493
G3 X117.919 Y123.414 I4.079 J.689 E.02065
G1 X130.585 Y136.081 E.79682
G2 X131.017 Y135.958 I-.881 J-3.909 E.01999
G1 X118.042 Y122.982 E.81626
G3 X118.179 Y122.564 I3.786 J1.018 E.01956
G1 X131.436 Y135.821 E.8339
G2 X131.841 Y135.671 I-1.13 J-3.686 E.01924
G1 X118.33 Y122.16 E.84995
G3 X118.492 Y121.767 I3.577 J1.246 E.01892
G1 X132.233 Y135.507 E.86438
G2 X132.609 Y135.328 I-1.408 J-3.437 E.01854
G1 X118.672 Y121.391 E.87674
G3 X118.862 Y121.026 I3.345 J1.513 E.01832
G1 X132.974 Y135.138 E.88777
M73 P37 R14
G2 X133.33 Y134.939 I-1.597 J-3.27 E.01815
G1 X119.062 Y120.671 E.89758
G1 X119.275 Y120.329 E.01793
G1 X133.67 Y134.724 E.90555
G2 X134 Y134.499 I-1.916 J-3.161 E.01778
G1 X119.501 Y119.999 E.91212
G3 X119.735 Y119.678 I2.976 J1.924 E.01769
G1 X134.323 Y134.266 E.91768
G1 X134.631 Y134.019 E.01757
G1 X119.98 Y119.368 E.92161
G3 X120.239 Y119.071 I2.773 J2.149 E.01752
G1 X134.929 Y133.761 E.92411
G2 X135.218 Y133.496 I-2.218 J-2.713 E.01749
G1 X120.505 Y118.782 E.92559
G1 X120.782 Y118.504 E.01746
G1 X135.495 Y133.218 E.92559
G2 X135.761 Y132.929 I-2.44 J-2.515 E.01749
G1 X121.071 Y118.239 E.92411
G3 X121.369 Y117.981 I2.44 J2.523 E.01752
G1 X136.02 Y132.632 E.92161
G1 X136.265 Y132.322 E.01758
G1 X121.677 Y117.734 E.91768
G3 X121.999 Y117.501 I2.238 J2.749 E.01769
G1 X136.499 Y132.001 E.91215
G2 X136.725 Y131.671 I-2.823 J-2.174 E.01778
G1 X122.33 Y117.276 E.90555
G1 X122.67 Y117.061 E.0179
G1 X136.938 Y131.329 E.89758
G2 X137.138 Y130.974 I-3.062 J-1.959 E.01814
G1 X123.026 Y116.862 E.88777
G3 X123.391 Y116.672 I1.871 J3.162 E.01833
G1 X137.328 Y130.609 E.87674
G1 X137.508 Y130.234 E.01852
G1 X123.767 Y116.493 E.86438
G1 X124.159 Y116.329 E.01888
G1 X137.67 Y129.84 E.84995
G2 X137.82 Y129.436 I-3.529 J-1.542 E.01922
G1 X124.564 Y116.18 E.83391
G3 X124.982 Y116.043 I1.429 J3.655 E.01959
G1 X137.958 Y129.018 E.81626
G1 X138.081 Y128.586 E.01999
G1 X125.415 Y115.919 E.79683
G1 X125.865 Y115.815 E.02058
G1 X138.184 Y128.134 E.77494
G2 X138.27 Y127.665 I-4.135 J-1.001 E.02123
G1 X126.335 Y115.729 E.7508
G3 X126.823 Y115.663 I.839 J4.316 E.02194
G1 X138.337 Y127.177 E.72431
G2 X138.383 Y126.667 I-4.511 J-.663 E.02276
G1 X127.333 Y115.617 E.69513
G3 X127.868 Y115.597 I.443 J4.585 E.02382
G1 X138.405 Y126.133 E.66283
G2 X138.397 Y125.57 I-5.015 J-.213 E.02505
G1 X128.431 Y115.604 E.62695
G3 X129.028 Y115.646 I-.077 J5.339 E.02665
G1 X138.355 Y124.973 E.58672
G2 X138.27 Y124.333 I-5.736 J.431 E.02871
G1 X129.667 Y115.73 E.5412
G3 X130.359 Y115.866 I-.867 J6.224 E.03136
G1 X138.133 Y123.641 E.48908
G2 X137.928 Y122.881 I-6.875 J1.448 E.03506
G1 X131.117 Y116.07 E.42843
G3 X131.996 Y116.394 I-4.527 J13.639 E.04169
G1 X137.606 Y122.003 E.35287
G2 X137.082 Y120.924 I-9.613 J4 E.05338
G1 X133.075 Y116.917 E.25208
G3 X136.718 Y120.005 I-8.613 J13.855 E.21318
G1 X134.983 Y117.689 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.567434
G1 F8869.687
G2 X136.278 Y118.975 I-6.977 J8.316 E3.84192
G2 X135.028 Y117.728 I-8.945 J7.716 E.10226
; CHANGE_LAYER
; Z_HEIGHT: 3.28
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X135.439 Y118.092 E-.20862
G1 X135.871 Y118.522 E-.2314
G1 X136.278 Y118.975 E-.23143
G1 X136.424 Y119.157 E-.08855
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 12/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z3.4 I-1.19 J-.254 P1  F30000
G1 X132.732 Y136.488 Z3.4
G1 Z3.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G3 X123.265 Y115.506 I-4.741 J-10.487 E1.60904
G3 X128.491 Y114.502 I4.744 J10.584 E.23886
G3 X132.787 Y136.463 I-.5 J11.498 E1.36606
G1 X132.885 Y136.837 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1800
G1 X132.272 Y137.089 E.0272
G3 X123.111 Y115.165 I-4.281 J-11.087 E1.50644
G3 X128.511 Y114.128 I4.898 J10.928 E.22782
G3 X132.936 Y136.809 I-.52 J11.874 E1.30233
M204 S10000
; WIPE_START
G1 F24000
G1 X132.272 Y137.089 E-.2738
G1 X131.645 Y137.315 E-.25334
G1 X131.057 Y137.486 E-.23287
; WIPE_END
G1 E-.04 F1800
G17
G3 Z3.68 I.784 J.931 P1  F30000
G1 X134.134 Y134.896 Z3.68
G1 Z3.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X136.86 Y131.88 I-12.128 J-13.698 E.18121
G2 X137.267 Y131.206 I-5.792 J-3.966 E.03504
G1 X133.208 Y135.266 E.25539
G3 X132.118 Y135.799 I-5.222 J-9.296 E.05398
G1 X137.8 Y130.117 E.35742
G2 X138.13 Y129.231 I-7.73 J-3.382 E.04211
G1 X131.231 Y136.13 E.43401
G3 X130.464 Y136.34 I-2.253 J-6.722 E.03538
G1 X138.341 Y128.463 E.49552
G2 X138.482 Y127.766 I-6.141 J-1.603 E.03167
G1 X129.765 Y136.482 E.54831
G3 X129.12 Y136.571 I-1.114 J-5.702 E.029
G1 X138.57 Y127.12 E.59449
G2 X138.617 Y126.517 I-5.348 J-.717 E.02693
G1 X128.516 Y136.617 E.63538
G3 X127.948 Y136.629 I-.393 J-5.059 E.02532
G1 X138.629 Y125.948 E.67194
G2 X138.613 Y125.408 I-4.82 J-.125 E.02406
G1 X127.408 Y136.613 E.70489
G3 X126.892 Y136.571 I.11 J-4.609 E.02301
G1 X138.572 Y124.892 E.73474
G2 X138.51 Y124.397 I-4.435 J.305 E.02219
G1 X126.398 Y136.509 E.76191
G3 X125.923 Y136.428 I.486 J-4.271 E.02146
G1 X138.428 Y123.923 E.78665
G2 X138.324 Y123.469 I-4.087 J.692 E.0207
G1 X125.468 Y136.325 E.80875
G3 X125.031 Y136.206 I.842 J-3.956 E.02018
G1 X138.206 Y123.031 E.82883
G2 X138.074 Y122.606 I-3.847 J.963 E.01979
G1 X124.607 Y136.073 E.84719
G3 X124.195 Y135.928 I1.088 J-3.734 E.01942
G1 X137.929 Y122.195 E.86393
G2 X137.765 Y121.801 I-3.583 J1.256 E.01896
G1 X123.801 Y135.766 E.87848
G3 X123.419 Y135.591 I1.365 J-3.487 E.01869
G1 X137.591 Y121.419 E.89156
G2 X137.407 Y121.046 I-3.41 J1.452 E.0185
G1 X123.047 Y135.406 E.90337
G1 X122.688 Y135.209 E.01824
G1 X137.208 Y120.688 E.91346
G2 X136.998 Y120.342 I-3.19 J1.698 E.01804
G1 X122.342 Y134.998 E.92199
G3 X122.005 Y134.779 I1.787 J-3.111 E.0179
G1 X136.779 Y120.004 E.92943
G1 X136.547 Y119.679 E.01775
G1 X121.678 Y134.548 E.93538
G3 X121.365 Y134.305 I2.015 J-2.907 E.01765
G1 X136.305 Y119.365 E.93977
G2 X136.054 Y119.06 I-2.849 J2.08 E.0176
G1 X121.06 Y134.053 E.94318
G1 X120.766 Y133.791 E.01754
G1 X135.79 Y118.766 E.94515
G2 X135.516 Y118.484 I-2.653 J2.299 E.01752
G1 X120.484 Y133.516 E.94562
G3 X120.21 Y133.233 I2.378 J-2.581 E.01752
G1 X135.234 Y118.209 E.94515
G1 X134.939 Y117.947 E.01754
G1 X119.946 Y132.94 E.94318
G3 X119.695 Y132.634 I2.598 J-2.386 E.0176
G1 X134.634 Y117.695 E.93977
G2 X134.322 Y117.452 I-2.328 J2.664 E.01765
G1 X119.452 Y132.321 E.93538
G1 X119.221 Y131.996 E.01775
G1 X133.995 Y117.221 E.92943
G2 X133.658 Y117.002 I-2.124 J2.891 E.0179
G1 X119.002 Y131.658 E.92198
G3 X118.792 Y131.312 I2.98 J-2.044 E.01804
G1 X133.312 Y116.791 E.91346
G1 X132.953 Y116.593 E.01824
G1 X118.592 Y130.954 E.90337
G3 X118.408 Y130.581 I3.226 J-1.825 E.0185
G1 X132.581 Y116.409 E.89156
G2 X132.199 Y116.234 I-1.747 J3.312 E.01869
G1 X118.234 Y130.199 E.87848
G3 X118.071 Y129.805 I3.424 J-1.651 E.01896
G1 X131.805 Y116.072 E.86392
G2 X131.393 Y115.926 I-1.5 J3.591 E.01942
G1 X117.926 Y129.394 E.84719
G3 X117.794 Y128.969 I3.714 J-1.388 E.01979
G1 X130.969 Y115.794 E.82882
G2 X130.532 Y115.675 I-1.279 J3.837 E.02018
G1 X117.676 Y128.531 E.80874
G3 X117.572 Y128.077 I3.986 J-1.146 E.0207
G1 X130.077 Y115.572 E.78665
G2 X129.602 Y115.491 I-.961 J4.19 E.02146
G1 X117.49 Y127.603 E.76191
G3 X117.428 Y127.108 I4.372 J-.8 E.02219
G1 X129.101 Y115.435 E.73432
G1 X128.591 Y115.389 E.02281
G1 X117.387 Y126.592 E.70477
G3 X117.371 Y126.052 I4.803 J-.416 E.02406
G1 X128.045 Y115.378 E.67149
M73 P38 R14
G2 X127.483 Y115.383 I-.247 J3.78 E.02501
G1 X117.383 Y125.483 E.63537
G3 X117.43 Y124.88 I5.395 J.114 E.02693
G1 X126.88 Y115.429 E.59448
G2 X126.234 Y115.518 I.469 J5.794 E.029
G1 X117.518 Y124.234 E.5483
G3 X117.659 Y123.537 I6.281 J.905 E.03167
G1 X125.536 Y115.66 E.4955
G2 X124.769 Y115.87 I1.487 J6.932 E.03538
G1 X117.87 Y122.769 E.43399
G3 X118.2 Y121.882 I8.061 J2.496 E.04211
G1 X123.882 Y116.201 E.3574
G2 X122.792 Y116.734 I4.132 J9.828 E.05399
G1 X118.733 Y120.793 E.25536
G3 X120.264 Y118.706 I11.25 J6.645 E.11535
G1 X121.865 Y117.104 E.10075
G1 X134.632 Y117.142 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.547524
G1 F9231.985
G2 X138.865 Y128.133 I-6.628 J8.864 E3.17653
G2 X134.679 Y117.178 I-10.849 J-2.131 E.68737
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X135.123 Y117.522 E-.21324
G1 X135.587 Y117.935 E-.23601
G1 X136.027 Y118.373 E-.236
G1 X136.158 Y118.519 E-.07474
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 13/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z3.68 I-1.197 J-.22 P1  F30000
G1 X132.815 Y136.671 Z3.68
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G3 X124.408 Y114.851 I-4.824 J-10.671 E1.69575
G3 X128.784 Y114.317 I3.602 J11.309 E.19725
G3 X132.87 Y136.647 I-.794 J11.684 E1.37734
G1 X132.964 Y137.021 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X132.345 Y137.276 E.02751
G3 X123.258 Y137.115 I-4.345 J-11.276 E.38253
G1 X123.258 Y137.115 E0
G3 X116.885 Y121.258 I4.742 J-11.115 E.77941
G1 X116.885 Y121.258 E0
G3 X128.804 Y113.942 I11.115 J4.742 E.61239
G3 X133.016 Y136.993 I-.805 J12.058 E1.31326
M204 S10000
; WIPE_START
G1 F24000
G1 X132.345 Y137.276 E-.27698
G1 X131.707 Y137.506 E-.25763
G1 X131.137 Y137.672 E-.22539
; WIPE_END
G1 E-.04 F1800
G1 X123.781 Y135.637 Z3.96 F30000
G1 X121.718 Y135.067 Z3.96
G1 Z3.56
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X120.103 Y133.452 E.1016
G3 X118.55 Y131.34 I8.074 J-7.567 E.11689
G1 X122.661 Y135.452 E.25865
G2 X123.761 Y135.993 I5.572 J-9.927 E.05455
G1 X118.008 Y130.24 E.36192
G3 X117.669 Y129.343 I7.814 J-3.463 E.04266
G1 X124.654 Y136.328 E.4394
G2 X125.432 Y136.548 I4.373 J-13.991 E.03596
G1 X117.453 Y128.569 E.50192
G3 X117.307 Y127.865 I6.2 J-1.655 E.03202
G1 X126.136 Y136.693 E.55538
G2 X126.787 Y136.786 I1.154 J-5.751 E.02927
G1 X117.214 Y127.213 E.60222
G3 X117.162 Y126.604 I5.4 J-.761 E.02721
G1 X127.396 Y136.838 E.64377
G2 X127.971 Y136.855 I.438 J-5.111 E.0256
G1 X117.146 Y126.029 E.681
G3 X117.158 Y125.483 I4.868 J-.165 E.02431
G1 X128.517 Y136.843 E.71461
G2 X129.039 Y136.807 I-.061 J-4.665 E.02328
G1 X117.194 Y124.962 E.74513
G3 X117.252 Y124.461 I4.483 J.265 E.02241
G1 X129.54 Y136.749 E.77296
G2 X130.016 Y136.667 I-.49 J-4.28 E.02151
G1 X117.332 Y123.983 E.79791
G3 X117.431 Y123.524 I4.135 J.654 E.02089
G1 X130.476 Y136.568 E.82058
G2 X130.92 Y136.455 I-.788 J-4.015 E.02042
G1 X117.546 Y123.08 E.84136
G3 X117.675 Y122.652 I4.172 J1.026 E.01993
G1 X131.351 Y136.328 E.86034
G1 X131.764 Y136.182 E.01946
G1 X117.817 Y122.236 E.87734
G3 X117.976 Y121.836 I3.401 J1.12 E.01913
G1 X132.164 Y136.024 E.89252
G2 X132.553 Y135.855 I-1.21 J-3.32 E.01888
G1 X118.145 Y121.448 E.90633
G1 X118.326 Y121.07 E.01862
G1 X132.927 Y135.671 E.91854
G2 X133.291 Y135.477 I-1.678 J-3.584 E.01836
G1 X118.522 Y120.708 E.92907
G3 X118.728 Y120.356 I3.244 J1.652 E.01817
G1 X133.645 Y135.273 E.9384
G1 X133.987 Y135.057 E.01799
G1 X118.942 Y120.012 E.94642
G3 X119.172 Y119.684 I3.037 J1.884 E.01783
G1 X134.316 Y134.828 E.95265
G2 X134.637 Y134.591 I-1.946 J-2.98 E.01777
G1 X119.41 Y119.363 E.95792
G1 X119.657 Y119.052 E.01767
G1 X134.947 Y134.342 E.96188
G2 X135.245 Y134.082 I-2.166 J-2.785 E.01761
G1 X119.917 Y118.755 E.96422
G3 X120.186 Y118.465 I2.717 J2.243 E.01758
G1 X135.536 Y133.815 E.96566
G1 X135.814 Y133.535 E.01756
G1 X120.464 Y118.185 E.96566
G3 X120.755 Y117.918 I2.524 J2.456 E.01758
G1 X136.082 Y133.245 E.96422
G2 X136.343 Y132.948 I-2.517 J-2.472 E.0176
G1 X121.053 Y117.658 E.96188
G1 X121.363 Y117.409 E.01766
G1 X136.59 Y132.637 E.95792
G2 X136.828 Y132.316 I-2.735 J-2.277 E.01776
G1 X121.684 Y117.172 E.95265
G3 X122.013 Y116.943 I2.204 J2.816 E.01784
G1 X137.058 Y131.988 E.94642
G1 X137.272 Y131.644 E.01802
G1 X122.355 Y116.727 E.9384
G3 X122.709 Y116.523 I1.997 J3.047 E.01818
G1 X137.478 Y131.292 E.92907
G2 X137.674 Y130.93 I-3.119 J-1.931 E.01831
G1 X123.073 Y116.329 E.91855
G1 X123.447 Y116.145 E.01855
G1 X137.855 Y130.552 E.90634
G2 X138.024 Y130.164 I-3.375 J-1.703 E.01887
G1 X123.836 Y115.976 E.89252
G3 X124.236 Y115.818 I1.608 J3.483 E.01914
G1 X138.183 Y129.764 E.87734
G1 X138.325 Y129.349 E.01955
G1 X124.649 Y115.672 E.86035
G3 X125.08 Y115.545 I1.346 J3.773 E.02
G1 X138.454 Y128.92 E.84137
G2 X138.569 Y128.476 I-3.895 J-1.239 E.0204
G1 X125.524 Y115.432 E.82058
G3 X125.984 Y115.333 I1.107 J4.042 E.02092
G1 X138.668 Y128.017 E.79791
G1 X138.748 Y127.539 E.02157
G1 X126.46 Y115.251 E.77296
G1 X126.961 Y115.193 E.0224
G1 X138.806 Y127.038 E.74514
G2 X138.842 Y126.517 I-4.625 J-.587 E.02326
G1 X127.482 Y115.157 E.71461
G3 X128.029 Y115.145 I.378 J4.86 E.02432
G1 X138.854 Y125.971 E.68101
G2 X138.838 Y125.396 I-5.127 J-.139 E.02559
G1 X128.604 Y115.162 E.64378
G3 X129.214 Y115.215 I-.197 J5.877 E.02727
G1 X138.786 Y124.787 E.60215
G2 X138.693 Y124.135 I-5.848 J.506 E.02929
G1 X129.864 Y115.307 E.55539
G3 X130.568 Y115.452 I-.943 J6.337 E.03197
G1 X138.547 Y123.431 E.50193
G2 X138.331 Y122.657 I-16.661 J4.23 E.03575
G1 X131.346 Y115.672 E.43941
G3 X132.239 Y116.007 I-2.535 J8.119 E.04245
G1 X137.992 Y121.76 E.36194
G2 X137.45 Y120.66 I-10.099 J4.292 E.05458
G1 X133.338 Y116.548 E.25868
G3 X134.005 Y116.953 I-3.268 J6.135 E.03469
G3 X137.07 Y119.722 I-10.84 J15.081 E.18416
G1 X128.871 Y114.757 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.524095
G1 F9698.134
G2 X138.744 Y122.546 I-.865 J11.249 E3.04651
G2 X128.93 Y114.763 I-10.736 J3.459 E.70291
; CHANGE_LAYER
; Z_HEIGHT: 3.84
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X129.55 Y114.821 E-.2364
G1 X130.174 Y114.926 E-.24039
G1 X130.791 Y115.065 E-.24055
G1 X130.899 Y115.096 E-.04266
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 14/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z3.96 I-1.212 J.111 P1  F30000
G1 X132.894 Y136.846 Z3.96
G1 Z3.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G3 X125.641 Y114.33 I-4.903 J-10.847 E1.78296
G3 X128.381 Y114.102 I2.397 J12.231 E.12255
G3 X132.948 Y136.821 I-.39 J11.897 E1.41861
G1 X133.041 Y137.198 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X132.414 Y137.456 E.02785
G3 X128.401 Y113.728 I-4.413 J-11.457 E1.78547
G3 X140.23 Y127.088 I-.407 J12.278 E.8201
G1 X140.23 Y127.088 E0
G3 X133.094 Y137.171 I-12.229 J-1.089 E.53145
M204 S10000
; WIPE_START
G1 F24000
G1 X132.414 Y137.456 E-.28024
G1 X131.766 Y137.689 E-.26174
G1 X131.215 Y137.85 E-.21802
; WIPE_END
G1 E-.04 F1800
G1 X134.411 Y135.229 Z4.24 F30000
G1 Z3.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X137.219 Y132.119 I-12.486 J-14.097 E.18679
G2 X137.62 Y131.462 I-5.648 J-3.89 E.03423
G1 X133.464 Y135.617 E.26141
G3 X132.355 Y136.168 I-5.591 J-9.874 E.0551
G1 X138.169 Y130.354 E.36576
G2 X138.509 Y129.456 I-7.825 J-3.47 E.04271
G1 X131.454 Y136.511 E.44381
G3 X130.673 Y136.732 I-4.057 J-12.79 E.03609
G1 X138.737 Y128.669 E.50726
G2 X138.887 Y127.961 I-6.232 J-1.688 E.03222
G1 X129.961 Y136.886 E.56146
G3 X129.305 Y136.984 I-1.199 J-5.795 E.02954
G1 X138.984 Y127.304 E.60888
G2 X139.04 Y126.69 I-5.442 J-.803 E.02745
M73 P39 R13
G1 X128.691 Y137.039 E.65103
G3 X128.111 Y137.061 I-.479 J-5.152 E.02582
G1 X139.061 Y126.11 E.68885
G2 X139.054 Y125.559 I-4.913 J-.212 E.02454
G1 X127.56 Y137.053 E.72307
G3 X127.033 Y137.021 I.021 J-4.704 E.02348
G1 X139.023 Y125.032 E.75422
G1 X138.965 Y124.531 E.02242
G1 X126.53 Y136.966 E.78224
G3 X126.054 Y136.883 I.358 J-3.453 E.02149
G1 X138.888 Y124.049 E.80731
G2 X138.794 Y123.584 I-4.187 J.6 E.02111
G1 X125.585 Y136.794 E.83097
G3 X125.135 Y136.685 I.747 J-4.058 E.02058
G1 X138.686 Y123.134 E.85242
G1 X138.56 Y122.702 E.02004
G1 X124.7 Y136.561 E.87184
G3 X124.284 Y136.419 I1.06 J-3.777 E.01958
G1 X138.418 Y122.285 E.88912
G2 X138.266 Y121.879 I-3.691 J1.157 E.0193
G1 X123.879 Y136.265 E.90499
G3 X123.485 Y136.101 I1.263 J-3.598 E.01902
G1 X138.101 Y121.485 E.91947
G2 X137.92 Y121.107 I-3.453 J1.422 E.01864
G1 X123.107 Y135.92 E.93186
G3 X122.739 Y135.73 I1.515 J-3.37 E.01844
G1 X137.73 Y120.738 E.94306
G1 X137.53 Y120.38 E.01827
G1 X122.38 Y135.53 E.95309
G1 X122.036 Y135.316 E.01803
G1 X137.315 Y120.036 E.9612
G2 X137.093 Y119.7 I-3.102 J1.814 E.01794
G1 X121.701 Y135.092 E.96827
G1 X121.373 Y134.861 E.01783
G1 X136.86 Y119.374 E.97424
G2 X136.614 Y119.062 I-2.905 J2.033 E.0177
G1 X121.061 Y134.614 E.97837
G3 X120.757 Y134.36 I2.108 J-2.839 E.01765
G1 X136.361 Y118.756 E.98162
G1 X136.097 Y118.462 E.01759
G1 X120.461 Y134.098 E.9836
G3 X120.179 Y133.821 I2.319 J-2.649 E.01758
G1 X135.821 Y118.179 E.98402
G2 X135.539 Y117.902 I-2.602 J2.374 E.01758
G1 X119.903 Y133.538 E.9836
G1 X119.639 Y133.244 E.01759
G1 X135.243 Y117.64 E.98162
G2 X134.939 Y117.386 I-2.413 J2.585 E.01765
G1 X119.386 Y132.938 E.97837
G3 X119.14 Y132.626 I2.661 J-2.347 E.0177
G1 X134.627 Y117.139 E.97424
G1 X134.299 Y116.908 E.01783
G1 X118.907 Y132.3 E.96827
G3 X118.685 Y131.964 I2.88 J-2.15 E.01794
G1 X133.96 Y116.689 E.96092
G1 X133.62 Y116.47 E.01798
G1 X118.47 Y131.62 E.95306
G1 X118.27 Y131.262 E.01827
G1 X133.261 Y116.27 E.94305
G2 X132.893 Y116.079 I-1.882 J3.179 E.01844
G1 X118.08 Y130.893 E.93186
G3 X117.899 Y130.515 I3.272 J-1.799 E.01864
G1 X132.515 Y115.899 E.91946
G2 X132.121 Y115.735 I-1.657 J3.433 E.01902
G1 X117.734 Y130.121 E.90499
G3 X117.582 Y129.715 I3.538 J-1.562 E.0193
G1 X131.716 Y115.581 E.88912
G2 X131.293 Y115.446 I-1.805 J4.89 E.01976
G1 X117.44 Y129.298 E.87143
G1 X117.314 Y128.866 E.02004
G1 X130.863 Y115.317 E.85231
G2 X130.415 Y115.206 I-1.019 J3.156 E.02053
G1 X117.21 Y128.411 E.83067
G3 X117.112 Y127.95 I5.352 J-1.382 E.02095
G1 X129.951 Y115.112 E.80764
G2 X129.47 Y115.034 I-.932 J4.242 E.02168
G1 X117.035 Y127.469 E.78223
G1 X116.977 Y126.968 E.02242
G1 X128.967 Y114.979 E.75421
G2 X128.439 Y114.949 I-.99 J12.616 E.02354
G1 X116.946 Y126.441 E.72296
G3 X116.939 Y125.89 I4.907 J-.339 E.02454
G1 X127.886 Y114.943 E.68864
G2 X127.309 Y114.961 I-.16 J4.145 E.02568
G1 X116.96 Y125.31 E.65102
G3 X117.016 Y124.695 I5.496 J.188 E.02745
G1 X126.695 Y115.016 E.60888
G2 X126.039 Y115.114 I.543 J5.894 E.02954
G1 X117.121 Y124.032 E.56096
G3 X117.263 Y123.331 I8.283 J1.314 E.0318
G1 X125.329 Y115.265 E.50741
G2 X124.546 Y115.489 I3.895 J15.068 E.03623
G1 X117.491 Y122.544 E.4438
G3 X117.831 Y121.646 I8.164 J2.572 E.04271
G1 X123.645 Y115.832 E.36575
G2 X122.536 Y116.383 I4.482 J10.424 E.0551
G1 X118.381 Y120.538 E.26139
G3 X119.929 Y118.431 I9.918 J5.667 E.11659
G1 X121.589 Y116.771 E.10438
G1 X128.369 Y114.53 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.511714
G1 F9964.012
G2 X139.447 Y126.936 I-.364 J11.474 E2.75803
G2 X128.429 Y114.533 I-11.441 J-.932 E.9553
; CHANGE_LAYER
; Z_HEIGHT: 4.12
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X128.936 Y114.553 E-.19285
G1 X129.576 Y114.623 E-.2448
G1 X130.212 Y114.73 E-.24483
G1 X130.411 Y114.775 E-.07752
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 15/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z4.24 I-1.209 J.139 P1  F30000
G1 X132.968 Y137.015 Z4.24
G1 Z4.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X132.343 Y137.272 E.03007
G3 X122.42 Y115.281 I-4.352 J-11.271 E1.6288
G3 X128.673 Y113.939 I5.563 J10.685 E.28791
G3 X133.018 Y136.988 I-.682 J12.062 E1.42736
G1 X133.113 Y137.361 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X132.478 Y137.622 E.02819
G3 X122.247 Y114.949 I-4.487 J-11.62 E1.55014
G3 X128.693 Y113.565 I5.736 J11.017 E.27397
G3 X133.165 Y137.333 I-.702 J12.437 E1.35888
M204 S10000
; WIPE_START
G1 F24000
G1 X132.478 Y137.622 E-.28335
G1 X131.82 Y137.859 E-.26553
G1 X131.287 Y138.014 E-.21111
; WIPE_END
G1 E-.04 F1800
G1 X124.189 Y135.21 Z4.52 F30000
G1 X118.253 Y132.864 Z4.52
G1 Z4.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X119.659 Y134.27 E.08842
G2 X122.106 Y136.164 I9.689 J-9.993 E.13794
G1 X117.84 Y131.898 E.26837
G3 X117.261 Y130.765 I25.309 J-13.65 E.05658
G1 X123.238 Y136.742 E.376
G2 X124.145 Y137.095 I3.595 J-7.896 E.0433
G1 X116.905 Y129.855 E.45546
G3 X116.655 Y129.051 I7.028 J-2.625 E.03745
G1 X124.947 Y137.343 E.52161
G2 X125.673 Y137.516 I1.9 J-6.38 E.03322
G1 X116.482 Y128.325 E.57817
G3 X116.368 Y127.657 I5.89 J-1.352 E.03017
G1 X126.342 Y137.631 E.62748
G2 X126.968 Y137.703 I.948 J-5.53 E.028
G1 X116.295 Y127.03 E.67136
G3 X116.26 Y126.441 I5.224 J-.608 E.02626
G1 X127.557 Y137.739 E.71067
G2 X128.118 Y137.745 I.34 J-4.985 E.02494
G1 X116.254 Y125.882 E.7463
G3 X116.273 Y125.347 I4.773 J-.102 E.02383
G1 X128.649 Y137.723 E.77854
G1 X129.163 Y137.683 E.02294
G1 X116.312 Y124.832 E.8084
G3 X116.37 Y124.336 I4.447 J.265 E.02223
G1 X129.665 Y137.631 E.83635
G2 X130.137 Y137.55 I-.484 J-4.244 E.02134
G1 X116.449 Y123.862 E.8611
G3 X116.545 Y123.404 I4.123 J.627 E.02081
G1 X130.596 Y137.455 E.88391
G2 X131.042 Y137.348 I-.735 J-4.026 E.02042
G1 X116.653 Y122.959 E.90515
G1 X116.776 Y122.528 E.01993
G1 X131.471 Y137.223 E.9244
G2 X131.886 Y137.084 I-1.026 J-3.765 E.01948
G1 X116.916 Y122.114 E.94173
G3 X117.065 Y121.709 I3.679 J1.123 E.0192
G1 X132.292 Y136.936 E.9579
G1 X132.682 Y136.773 E.01883
G1 X117.226 Y121.317 E.97233
G3 X117.401 Y120.938 I3.457 J1.371 E.01856
G1 X133.059 Y136.596 E.98496
G1 X133.426 Y136.409 E.01832
G1 X117.584 Y120.567 E.99659
G1 X117.78 Y120.209 E.01814
G1 X133.79 Y136.22 E1.00716
G2 X134.139 Y136.015 I-1.649 J-3.21 E.01801
G1 X117.986 Y119.862 E1.01616
G1 X118.198 Y119.521 E.01788
G1 X134.478 Y135.8 E1.02411
G2 X134.805 Y135.574 I-1.856 J-3.023 E.01771
G1 X118.426 Y119.195 E1.03032
G3 X118.66 Y118.875 I2.967 J1.918 E.01764
G1 X135.126 Y135.341 E1.03585
G1 X135.433 Y135.095 E.01752
G1 X118.905 Y118.566 E1.03978
G3 X119.159 Y118.267 I2.792 J2.116 E.01748
G1 X135.734 Y134.841 E1.04267
G1 X136.025 Y134.579 E.01744
G1 X119.42 Y117.973 E1.04463
G3 X119.695 Y117.695 I2.621 J2.311 E.01743
G1 X136.305 Y134.305 E1.04494
G2 X136.58 Y134.027 I-2.345 J-2.588 E.01743
G1 X119.974 Y117.421 E1.04463
G1 X120.266 Y117.159 E.01744
G1 X136.841 Y133.733 E1.04267
G2 X137.095 Y133.434 I-2.537 J-2.415 E.01748
G1 X120.566 Y116.905 E1.03978
G1 X120.874 Y116.659 E.01752
G1 X137.34 Y133.125 E1.03585
G2 X137.574 Y132.805 I-2.734 J-2.239 E.01764
G1 X121.195 Y116.427 E1.03032
G3 X121.522 Y116.2 I2.184 J2.797 E.01771
G1 X137.802 Y132.479 E1.02411
G1 X138.014 Y132.138 E.01788
G1 X121.861 Y115.985 E1.01616
G3 X122.21 Y115.78 I1.997 J3.004 E.01801
G1 X138.22 Y131.791 E1.00716
G1 X138.416 Y131.433 E.01814
G1 X122.566 Y115.582 E.99713
G3 X122.938 Y115.401 I1.8 J3.222 E.01843
G1 X138.599 Y131.062 E.98518
G2 X138.774 Y130.683 I-3.282 J-1.75 E.01856
G1 X123.317 Y115.227 E.97233
G1 X123.708 Y115.064 E.01883
G1 X138.935 Y130.291 E.9579
G2 X139.084 Y129.886 I-3.529 J-1.528 E.0192
M73 P40 R13
G1 X124.114 Y114.916 E.94173
G3 X124.529 Y114.777 I1.441 J3.627 E.01948
G1 X139.224 Y129.472 E.9244
G1 X139.347 Y129.041 E.01993
G1 X124.958 Y114.652 E.90515
G3 X125.404 Y114.545 I1.181 J3.918 E.02042
G1 X139.455 Y128.596 E.88392
G2 X139.551 Y128.138 I-4.027 J-1.084 E.02081
G1 X125.863 Y114.45 E.86111
G3 X126.335 Y114.369 I.958 J4.171 E.02134
G1 X139.63 Y127.664 E.83635
G2 X139.688 Y127.168 I-4.387 J-.761 E.02223
G1 X126.831 Y114.311 E.80876
G3 X127.346 Y114.273 I.602 J4.565 E.02298
G1 X139.727 Y126.653 E.77885
G2 X139.746 Y126.118 I-4.755 J-.433 E.02383
G1 X127.882 Y114.255 E.74631
G3 X128.443 Y114.261 I.221 J4.992 E.02494
G1 X139.738 Y125.557 E.71058
G1 X139.692 Y124.957 E.02676
G1 X129.044 Y114.309 E.66988
G3 X129.657 Y114.369 I-.1 J4.195 E.02745
G1 X139.632 Y124.343 E.62749
G2 X139.518 Y123.675 I-6.007 J.684 E.03017
G1 X130.327 Y114.484 E.57819
G3 X131.053 Y114.657 I-1.173 J6.55 E.03322
G1 X139.345 Y122.949 E.52163
G2 X139.095 Y122.145 I-7.278 J1.822 E.03745
G1 X131.855 Y114.905 E.45547
G3 X132.761 Y115.258 I-2.689 J8.249 E.0433
G1 X137.825 Y120.322 E.31856
G1 X138.178 Y120.136 E.01775
G1 X133.893 Y115.836 E.27001
G3 X134.498 Y116.21 I-3.025 J5.567 E.03162
G3 X137.747 Y119.136 I-11.117 J15.612 E.19494
G1 X138.396 Y120.706 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.488243
G1 F10510.237
G1 X138.333 Y120.582 E.0068
G1 X138.446 Y120.942 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X139.065 Y121.562 E.03897
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X138.446 Y120.942 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 16/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z4.52 I-1.155 J-.384 P1  F30000
G1 X133.041 Y137.178 Z4.52
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G1 X132.406 Y137.435 E.03047
G3 X126.931 Y113.785 I-4.413 J-11.438 E1.8667
G3 X128.949 Y113.776 I1.068 J13.61 E.08985
G3 X133.087 Y137.149 I-.956 J12.222 E1.43693
G1 X133.185 Y137.524 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X132.541 Y137.785 E.02856
G3 X126.899 Y113.411 I-4.548 J-11.787 E1.77577
G3 X128.979 Y113.402 I1.101 J14.028 E.0855
G3 X133.235 Y137.493 I-.986 J12.596 E1.36725
M204 S10000
; WIPE_START
G1 F24000
G1 X132.541 Y137.785 E-.28628
G1 X131.875 Y138.028 E-.26931
G1 X131.359 Y138.179 E-.20441
; WIPE_END
G1 E-.04 F1800
G1 X134.98 Y135.883 Z4.8 F30000
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X137.939 Y132.596 I-12.78 J-14.478 E.19713
G2 X138.306 Y132.004 I-5.092 J-3.572 E.03104
G1 X134.008 Y136.302 E.2704
G3 X132.869 Y136.888 I-8.407 J-14.939 E.05699
G1 X138.888 Y130.869 E.37866
G2 X139.248 Y129.956 I-14.701 J-6.324 E.04365
G1 X131.956 Y137.248 E.45874
G3 X131.15 Y137.502 I-2.66 J-7.052 E.03762
G1 X139.5 Y129.151 E.52531
G2 X139.677 Y128.422 I-6.406 J-1.936 E.0334
G1 X130.42 Y137.679 E.58233
G3 X129.747 Y137.798 I-1.402 J-5.929 E.03041
G1 X139.797 Y127.749 E.63218
G2 X139.872 Y127.121 I-5.559 J-.987 E.02817
G1 X129.119 Y137.874 E.67645
G3 X128.527 Y137.913 I-.649 J-5.255 E.02643
G1 X139.912 Y126.527 E.71625
G2 X139.924 Y125.963 I-5.017 J-.381 E.02511
G1 X127.963 Y137.924 E.75239
G3 X127.426 Y137.909 I-.125 J-5.089 E.02394
G1 X139.91 Y125.424 E.78534
G2 X139.876 Y124.905 I-4.932 J.054 E.02317
G1 X126.906 Y137.875 E.81593
G1 X126.408 Y137.821 E.0223
G1 X139.819 Y124.409 E.84366
G2 X139.743 Y123.932 I-4.284 J.439 E.02149
G1 X125.932 Y137.743 E.86881
G3 X125.47 Y137.652 I.579 J-4.158 E.02095
G1 X139.653 Y123.469 E.89221
G1 X139.549 Y123.02 E.0205
G1 X125.02 Y137.549 E.91396
G1 X124.59 Y137.427 E.0199
G1 X139.426 Y122.591 E.93328
G2 X139.293 Y122.171 I-3.804 J.974 E.0196
G1 X124.171 Y137.292 E.95126
G3 X123.762 Y137.149 I1.07 J-3.721 E.01932
G1 X139.149 Y121.762 E.96795
G2 X138.988 Y121.37 I-3.572 J1.234 E.01886
G1 X123.37 Y136.988 E.9825
G3 X122.987 Y136.818 I1.42 J-3.699 E.01863
G1 X138.82 Y120.985 E.99598
G1 X138.639 Y120.613 E.0184
G1 X122.612 Y136.64 E1.00821
G3 X122.252 Y136.447 I1.446 J-3.123 E.01817
G1 X138.447 Y120.252 E1.01875
G2 X138.249 Y119.898 I-3.255 J1.586 E.01808
G1 X121.899 Y136.248 E1.02852
G1 X121.559 Y136.035 E.01785
G1 X138.035 Y119.559 E1.03646
G2 X137.815 Y119.226 I-3.073 J1.793 E.01776
G1 X121.227 Y135.814 E1.04348
G1 X120.903 Y135.585 E.01765
G1 X137.584 Y118.904 E1.04939
G2 X137.343 Y118.592 I-2.897 J1.989 E.01754
G1 X120.592 Y135.343 E1.05377
G3 X120.286 Y135.096 I2.045 J-2.848 E.0175
G1 X137.097 Y118.285 E1.05753
G2 X136.836 Y117.993 I-2.722 J2.177 E.01743
G1 X119.993 Y134.836 E1.05952
G3 X119.707 Y134.569 I2.235 J-2.678 E.01741
G1 X136.57 Y117.706 E1.06077
G1 X136.293 Y117.431 E.01739
G1 X119.43 Y134.293 E1.06077
G3 X119.165 Y134.005 I2.59 J-2.648 E.01741
G1 X136.007 Y117.164 E1.05946
G1 X135.714 Y116.904 E.01742
G1 X118.903 Y133.715 E1.05753
G1 X118.657 Y133.408 E.01749
G1 X135.408 Y116.657 E1.05377
G2 X135.097 Y116.415 I-2.313 J2.647 E.01753
G1 X118.416 Y133.096 E1.04938
G1 X118.185 Y132.774 E.01763
G1 X134.773 Y116.186 E1.04347
G2 X134.441 Y115.965 I-2.136 J2.842 E.01774
G1 X117.965 Y132.441 E1.03645
G1 X117.751 Y132.102 E.01782
G1 X134.101 Y115.752 E1.02851
G2 X133.747 Y115.553 I-1.952 J3.047 E.01806
G1 X117.553 Y131.747 E1.01875
G3 X117.362 Y131.385 I3.326 J-1.984 E.01821
G1 X133.388 Y115.36 E1.00814
G1 X133.014 Y115.181 E.01844
G1 X117.18 Y131.014 E.99603
G3 X117.012 Y130.63 I3.151 J-1.61 E.01868
G1 X132.63 Y115.012 E.9825
G1 X132.238 Y114.851 E.01885
G1 X116.851 Y130.238 E.96794
G1 X116.707 Y129.829 E.01927
G1 X131.828 Y114.707 E.95125
G2 X131.41 Y114.573 I-1.404 J3.661 E.01957
G1 X116.574 Y129.409 E.93327
G3 X116.451 Y128.979 I3.767 J-1.311 E.0199
G1 X130.979 Y114.451 E.91395
G2 X130.53 Y114.348 I-1.144 J3.951 E.02053
G1 X116.347 Y128.53 E.8922
G3 X116.257 Y128.067 I4.077 J-1.032 E.02099
G1 X130.068 Y114.257 E.8688
G2 X129.592 Y114.18 I-.885 J3.967 E.02146
G1 X116.181 Y127.591 E.84364
G1 X116.124 Y127.095 E.02219
G1 X129.092 Y114.127 E.81581
G2 X128.576 Y114.09 I-.602 J4.863 E.02304
G1 X116.09 Y126.576 E.78545
G3 X116.076 Y126.036 I4.799 J-.387 E.02403
G1 X128.037 Y114.076 E.75237
G2 X127.473 Y114.087 I-.188 J5.021 E.02508
G1 X116.089 Y125.471 E.71613
G3 X116.128 Y124.879 I4.997 J.029 E.02638
G1 X126.881 Y114.126 E.67643
G2 X126.253 Y114.202 I.356 J5.632 E.02815
G1 X116.203 Y124.251 E.63216
G3 X116.323 Y123.578 I6.048 J.73 E.03041
G1 X125.58 Y114.321 E.58231
G2 X124.85 Y114.498 I1.212 J6.588 E.03343
G1 X116.5 Y122.849 E.52528
G3 X116.752 Y122.044 I7.291 J1.84 E.03753
G1 X124.044 Y114.752 E.4587
G2 X123.131 Y115.112 I2.749 J8.308 E.04368
G1 X117.112 Y121.131 E.37862
G3 X117.694 Y119.996 I10.396 J4.615 E.05677
G1 X121.991 Y115.698 E.27035
G2 X118.119 Y119.018 I9.651 J15.177 E.22767
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X119.549 Y117.62 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 17/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z4.8 I-1.003 J.69 P1  F30000
G1 X133.107 Y137.324 Z4.8
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G1 X132.465 Y137.588 E.03089
G3 X122.891 Y114.677 I-4.474 J-11.586 E1.70545
G3 X128.534 Y113.593 I5.118 J11.419 E.25792
G3 X133.157 Y137.296 I-.544 J12.408 E1.47444
G1 X133.252 Y137.67 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
M73 P41 R13
G1 F3000
G1 X132.6 Y137.938 E.02894
G3 X122.091 Y114.648 I-4.608 J-11.936 E1.59221
G3 X128.554 Y113.219 I5.893 J11.318 E.27494
G3 X133.304 Y137.642 I-.563 J12.783 E1.40242
M204 S10000
; WIPE_START
G1 F24000
G1 X132.6 Y137.938 E-.29037
G1 X131.924 Y138.181 E-.27274
G1 X131.427 Y138.326 E-.19688
; WIPE_END
G1 E-.04 F1800
G1 X123.973 Y136.684 Z5.08 F30000
G1 X120.927 Y136.013 Z5.08
G1 Z4.68
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X119.203 Y134.289 E.10845
G3 X117.555 Y132.081 I9.151 J-8.548 E.12278
G1 X121.923 Y136.449 E.27475
G2 X123.072 Y137.038 I5.816 J-9.934 E.05746
G1 X116.963 Y130.929 E.38427
G3 X116.599 Y130.005 I8.048 J-3.705 E.04422
G1 X123.996 Y137.401 E.4653
G2 X124.811 Y137.656 I2.677 J-7.13 E.03801
G1 X116.342 Y129.188 E.5327
G3 X116.175 Y128.46 I5.124 J-1.564 E.03325
G1 X125.549 Y137.835 E.58972
G2 X126.231 Y137.956 I1.419 J-6.005 E.0308
G1 X116.042 Y127.767 E.64091
G3 X115.966 Y127.131 I5.627 J-.995 E.02852
G1 X126.867 Y138.032 E.68574
G2 X127.468 Y138.073 I.662 J-5.329 E.0268
G1 X115.926 Y126.531 E.72605
G3 X115.916 Y125.96 I5.075 J-.378 E.0254
G1 X128.039 Y138.084 E.76265
G2 X128.586 Y138.07 I.153 J-4.875 E.02434
G1 X115.93 Y125.414 E.79615
G3 X115.966 Y124.89 I4.691 J.052 E.02341
G1 X129.112 Y138.036 E.827
G1 X129.614 Y137.978 E.02248
G1 X116.021 Y124.385 E.8551
G3 X116.099 Y123.903 I4.331 J.456 E.02173
G1 X130.097 Y137.901 E.88057
G2 X130.56 Y137.803 I-.912 J-5.503 E.02105
G1 X116.191 Y123.435 E.9039
G3 X116.296 Y122.979 I4.11 J.705 E.0208
G1 X131.02 Y137.704 E.92627
G2 X131.456 Y137.579 I-.671 J-3.18 E.02018
G1 X116.42 Y122.543 E.94588
G3 X116.556 Y122.119 I3.845 J.998 E.01983
G1 X131.882 Y137.444 E.96409
G1 X132.296 Y137.298 E.01953
G1 X116.701 Y121.704 E.981
G1 X116.864 Y121.307 E.0191
G1 X132.693 Y137.135 E.99574
G2 X133.083 Y136.965 I-1.322 J-3.557 E.01893
G1 X117.036 Y120.918 E1.00947
G1 X117.217 Y120.539 E.01869
G1 X133.46 Y136.782 E1.0218
G2 X133.825 Y136.587 I-1.551 J-3.351 E.01843
G1 X117.413 Y120.175 E1.03246
G3 X117.615 Y119.817 I3.291 J1.621 E.0183
G1 X134.185 Y136.386 E1.04235
G1 X134.528 Y136.169 E.01806
G1 X117.83 Y119.472 E1.0504
G3 X118.054 Y119.136 I3.103 J1.828 E.01798
G1 X134.865 Y135.946 E1.05751
G1 X135.192 Y135.713 E.01786
G1 X118.286 Y118.807 E1.06349
G3 X118.531 Y118.492 I2.927 J2.028 E.01776
G1 X135.508 Y135.469 E1.06794
G1 X135.819 Y135.219 E.01773
G1 X118.782 Y118.182 E1.07175
G1 X119.045 Y117.886 E.01765
G1 X136.114 Y134.954 E1.07376
G2 X136.405 Y134.685 I-2.252 J-2.724 E.01764
G1 X119.316 Y117.596 E1.07503
G1 X119.595 Y117.315 E.01762
G1 X136.684 Y134.404 E1.07503
G2 X136.955 Y134.115 I-2.443 J-2.554 E.01764
G1 X119.886 Y117.046 E1.07376
G3 X120.181 Y116.781 I2.505 J2.498 E.01766
G1 X137.218 Y133.818 E1.07175
G2 X137.468 Y133.508 I-2.636 J-2.383 E.01773
G1 X120.492 Y116.531 E1.06794
G3 X120.808 Y116.287 I2.332 J2.692 E.01777
G1 X137.714 Y133.193 E1.0635
G1 X137.946 Y132.864 E.01788
G1 X121.135 Y116.054 E1.05751
G3 X121.472 Y115.831 I2.154 J2.892 E.01799
G1 X138.17 Y132.528 E1.0504
G1 X138.385 Y132.183 E.01809
G1 X121.815 Y115.614 E1.04235
G3 X122.175 Y115.413 I1.971 J3.103 E.01832
G1 X138.587 Y131.825 E1.03246
G2 X138.783 Y131.461 I-3.145 J-1.927 E.01841
G1 X122.54 Y115.218 E1.0218
G1 X122.917 Y115.035 E.01865
G1 X138.964 Y131.082 E1.00947
G2 X139.136 Y130.693 I-3.374 J-1.722 E.01891
G1 X123.307 Y114.865 E.99574
G3 X123.704 Y114.702 I1.648 J3.456 E.01911
G1 X139.299 Y130.296 E.981
G2 X139.444 Y129.881 I-3.622 J-1.499 E.01957
G1 X124.118 Y114.556 E.96409
G3 X124.544 Y114.421 I1.413 J3.72 E.01986
G1 X139.58 Y129.457 E.94588
G1 X139.704 Y129.021 E.02017
G1 X124.979 Y114.296 E.9263
G1 X125.434 Y114.191 E.02077
G1 X139.809 Y128.565 E.90428
G2 X139.901 Y128.097 I-4.12 J-1.055 E.02123
G1 X125.903 Y114.099 E.88057
G3 X126.386 Y114.022 I.928 J4.263 E.02177
G1 X139.979 Y127.615 E.85511
G2 X140.031 Y127.107 I-5.965 J-.864 E.02274
G1 X126.888 Y113.964 E.82678
G3 X127.414 Y113.93 I.57 J4.662 E.02345
G1 X140.066 Y126.582 E.79591
G2 X140.084 Y126.04 I-3.868 J-.4 E.02415
G1 X127.965 Y113.921 E.76235
G3 X128.532 Y113.927 I.209 J6.687 E.02521
G1 X140.074 Y125.469 E.72606
G2 X140.034 Y124.869 I-5.362 J.056 E.02677
G1 X129.133 Y113.968 E.68575
G3 X129.769 Y114.044 I-.362 J5.707 E.02854
G1 X139.958 Y124.233 E.64092
G2 X139.837 Y123.552 I-6.124 J.737 E.03079
G1 X130.451 Y114.165 E.59045
G3 X131.189 Y114.344 I-1.22 J6.666 E.03382
G1 X139.658 Y122.812 E.53272
G2 X139.401 Y121.996 I-7.399 J1.875 E.0381
G1 X132.004 Y114.599 E.46531
G3 X132.928 Y114.962 I-5.606 J15.602 E.04416
G1 X139.037 Y121.071 E.38429
G2 X138.445 Y119.919 I-14.01 J6.47 E.05764
G1 X134.077 Y115.551 E.27477
G3 X134.685 Y115.928 I-3.051 J5.6 E.03183
G3 X138.014 Y118.928 I-11.775 J16.414 E.19976
; CHANGE_LAYER
; Z_HEIGHT: 4.96
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X136.6 Y117.514 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 18/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z5.08 I-1.199 J-.206 P1  F30000
G1 X133.172 Y137.467 Z5.08
G1 Z4.96
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G1 X132.521 Y137.734 E.03131
G3 X123.477 Y114.262 I-4.53 J-11.733 E1.75837
G3 X128.825 Y113.452 I4.534 J11.876 E.24245
G3 X133.221 Y137.439 I-.834 J12.549 E1.48048
G1 X133.317 Y137.813 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X132.656 Y138.084 E.02934
G3 X128.845 Y113.077 I-4.656 J-12.084 E1.90077
G3 X140.411 Y129.699 I-.845 J12.923 E.95457
G1 X140.411 Y129.699 E0
G3 X133.369 Y137.785 I-12.411 J-3.699 E.45388
M204 S10000
; WIPE_START
G1 F24000
G1 X132.656 Y138.084 E-.29402
G1 X131.972 Y138.33 E-.2761
G1 X131.493 Y138.47 E-.18988
; WIPE_END
G1 E-.04 F1800
G1 X135.177 Y136.132 Z5.36 F30000
G1 Z4.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X138.203 Y132.772 I-13.616 J-15.303 E.20155
G2 X138.572 Y132.178 I-5.094 J-3.584 E.03111
G1 X134.183 Y136.568 E.27613
G3 X133.026 Y137.166 I-8.538 J-15.084 E.05796
G1 X139.163 Y131.029 E.38609
G2 X139.534 Y130.1 I-14.002 J-6.126 E.04451
G1 X132.1 Y137.534 E.46765
G3 X131.282 Y137.794 I-2.723 J-7.155 E.03821
G1 X139.792 Y129.283 E.53537
G2 X139.975 Y128.542 I-6.504 J-1.993 E.03394
G1 X130.541 Y137.976 E.59345
G3 X129.858 Y138.101 I-1.455 J-6.022 E.03092
G1 X140.1 Y127.859 E.64431
G2 X140.18 Y127.22 I-5.649 J-1.037 E.02866
G1 X129.219 Y138.181 E.68954
G3 X128.616 Y138.226 I-.696 J-5.344 E.02689
G1 X140.225 Y126.617 E.73028
G2 X140.241 Y126.043 I-5.103 J-.427 E.02556
G1 X128.043 Y138.241 E.76733
G3 X127.494 Y138.231 I-.189 J-4.891 E.02443
G1 X140.232 Y125.493 E.80131
G1 X140.201 Y124.966 E.02349
G1 X126.966 Y138.201 E.83255
G1 X126.463 Y138.146 E.02252
G1 X140.145 Y124.464 E.86067
G2 X140.073 Y123.978 I-4.367 J.398 E.02188
G1 X125.978 Y138.073 E.88667
G3 X125.506 Y137.986 I.538 J-4.24 E.02134
G1 X139.987 Y123.505 E.91093
G1 X139.882 Y123.052 E.0207
M73 P42 R13
G1 X125.05 Y137.883 E.933
G3 X124.613 Y137.763 I.853 J-3.96 E.02021
G1 X139.763 Y122.613 E.95306
G2 X139.634 Y122.183 I-3.887 J.934 E.01995
G1 X124.184 Y137.633 E.97188
G1 X123.77 Y137.489 E.01952
G1 X139.488 Y121.771 E.9888
G2 X139.331 Y121.369 I-3.656 J1.195 E.01919
G1 X123.369 Y137.331 E1.00413
G3 X122.976 Y137.166 I1.274 J-3.582 E.01898
G1 X139.167 Y120.975 E1.01851
G2 X138.985 Y120.599 I-3.446 J1.434 E.01861
G1 X122.598 Y136.985 E1.03083
G3 X122.229 Y136.796 I1.501 J-3.38 E.01846
G1 X138.797 Y120.228 E1.04221
G1 X138.597 Y119.87 E.01826
G1 X121.869 Y136.598 E1.05233
G3 X121.522 Y136.386 I1.713 J-3.191 E.01807
G1 X138.386 Y119.522 E1.06088
G1 X138.17 Y119.18 E.018
G1 X121.181 Y136.169 E1.06875
G1 X120.853 Y135.938 E.01782
G1 X137.938 Y118.854 E1.07476
G2 X137.702 Y118.532 I-2.984 J1.944 E.01778
G1 X120.533 Y135.701 E1.08005
G1 X120.221 Y135.454 E.01768
G1 X137.453 Y118.222 E1.08401
G2 X137.196 Y117.92 I-2.815 J2.135 E.01763
G1 X119.921 Y135.196 E1.08676
G1 X119.625 Y134.933 E.01759
G1 X136.932 Y117.626 E1.08874
G2 X136.656 Y117.344 I-2.647 J2.32 E.01757
G1 X119.344 Y134.656 E1.08899
G3 X119.068 Y134.374 I2.371 J-2.602 E.01757
G1 X136.375 Y117.067 E1.08874
G1 X136.079 Y116.804 E.01759
G1 X118.804 Y134.08 E1.08676
G3 X118.547 Y133.778 I2.558 J-2.436 E.01763
G1 X135.779 Y116.546 E1.08401
G1 X135.467 Y116.299 E.01768
G1 X118.298 Y133.468 E1.08005
G3 X118.062 Y133.146 I2.748 J-2.266 E.01778
G1 X135.147 Y116.061 E1.07476
G1 X134.819 Y115.831 E.01782
G1 X117.83 Y132.82 E1.06875
G1 X117.614 Y132.478 E.018
G1 X134.478 Y115.614 E1.06088
G2 X134.131 Y115.402 I-2.06 J2.98 E.01807
G1 X117.403 Y132.13 E1.05233
G1 X117.203 Y131.771 E.01826
G1 X133.771 Y115.204 E1.04221
G2 X133.402 Y115.015 I-1.871 J3.191 E.01846
G1 X117.015 Y131.401 E1.03083
G3 X116.833 Y131.025 I3.262 J-1.809 E.01861
G1 X133.024 Y114.834 E1.01851
G2 X132.631 Y114.669 I-1.668 J3.417 E.01898
G1 X116.669 Y130.631 E1.00413
G3 X116.512 Y130.229 I3.498 J-1.596 E.01919
G1 X132.23 Y114.511 E.98879
G1 X131.816 Y114.367 E.01952
G1 X116.366 Y129.817 E.97188
G3 X116.237 Y129.387 I3.759 J-1.363 E.01995
G1 X131.387 Y114.237 E.95305
G2 X130.949 Y114.117 I-1.291 J3.839 E.02022
G1 X116.118 Y128.948 E.933
G1 X116.013 Y128.495 E.0207
G1 X130.494 Y114.014 E.91093
G2 X130.022 Y113.927 I-1.009 J4.154 E.02134
G1 X115.927 Y128.022 E.88667
G3 X115.855 Y127.536 I4.294 J-.884 E.02188
G1 X129.535 Y113.856 E.86056
G1 X129.026 Y113.806 E.02274
G1 X115.807 Y127.026 E.83162
G1 X115.769 Y126.505 E.02324
G1 X128.506 Y113.769 E.8012
G2 X127.957 Y113.759 I-.359 J4.881 E.02443
G1 X115.759 Y125.957 E.76733
G3 X115.775 Y125.383 I5.118 J-.147 E.02556
G1 X127.383 Y113.774 E.73027
G2 X126.781 Y113.819 I.093 J5.388 E.02689
G1 X115.82 Y124.78 E.68953
G3 X115.9 Y124.141 I5.729 J.398 E.02866
G1 X126.14 Y113.901 E.64418
G1 X125.455 Y114.028 E.03102
G1 X116.025 Y123.457 E.59319
G3 X116.208 Y122.717 I6.685 J1.252 E.03394
G1 X124.718 Y114.207 E.53535
G2 X123.9 Y114.466 I1.905 J7.415 E.03821
G1 X116.466 Y121.9 E.46763
G3 X116.837 Y120.971 I14.378 J5.199 E.04451
G1 X122.974 Y114.834 E.38608
G2 X121.817 Y115.432 I7.388 J15.697 E.05796
G1 X117.428 Y119.822 E.27611
G3 X119.072 Y117.618 I12.138 J7.347 E.12249
G1 X120.822 Y115.869 E.11008
; CHANGE_LAYER
; Z_HEIGHT: 5.24
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X119.408 Y117.283 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 19/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z5.36 I-1.006 J.685 P1  F30000
G1 X133.234 Y137.599 Z5.36
G1 Z5.24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X126.181 Y113.399 I-5.242 J-11.6 E1.9384
G3 X128.372 Y113.275 I1.803 J12.464 E.09773
G3 X133.288 Y137.575 I-.38 J12.724 E1.51899
G1 X133.381 Y137.951 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X132.711 Y138.227 E.02974
G3 X128.392 Y112.901 I-4.709 J-12.228 E1.90404
G3 X132.002 Y113.521 I-.362 J12.925 E.15094
G1 X132.002 Y113.521 E0
G3 X141.056 Y127.125 I-4.016 J12.488 E.72434
G1 X141.056 Y127.125 E0
G3 X133.433 Y137.923 I-13.055 J-1.127 E.56883
M204 S10000
; WIPE_START
G1 F24000
G1 X132.711 Y138.227 E-.29779
G1 X132.019 Y138.475 E-.27932
G1 X131.557 Y138.61 E-.18289
; WIPE_END
G1 E-.04 F1800
G1 X124.1 Y136.983 Z5.64 F30000
G1 X120.72 Y136.246 Z5.64
G1 Z5.24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G3 X117.314 Y132.283 I12.264 J-13.988 E.23323
G1 X121.72 Y136.689 E.27718
G2 X122.872 Y137.285 I8.391 J-14.812 E.05772
G1 X116.712 Y131.124 E.38755
G3 X116.338 Y130.194 I15.77 J-6.871 E.04456
G1 X123.807 Y137.663 E.4698
G2 X124.625 Y137.924 I2.738 J-7.152 E.03822
G1 X116.075 Y129.375 E.53781
G3 X115.889 Y128.632 I6.52 J-2.031 E.03408
G1 X125.367 Y138.11 E.59623
G2 X126.052 Y138.239 I1.491 J-6.037 E.03103
G1 X115.76 Y127.947 E.64745
G3 X115.676 Y127.306 I5.661 J-1.07 E.02876
G1 X126.693 Y138.324 E.69307
G2 X127.299 Y138.373 I.741 J-5.368 E.02704
G1 X115.627 Y126.701 E.73423
G3 X115.608 Y126.125 I5.117 J-.461 E.02564
G1 X127.875 Y138.393 E.77173
G2 X128.428 Y138.389 I.24 J-4.919 E.02458
G1 X115.612 Y125.574 E.80617
G1 X115.64 Y125.046 E.02353
G1 X128.953 Y138.358 E.83744
G2 X129.458 Y138.307 I-.204 J-4.523 E.02259
G1 X115.693 Y124.542 E.86592
G3 X115.761 Y124.053 I4.383 J.36 E.02195
G1 X129.947 Y138.24 E.89244
G1 X130.422 Y138.158 E.02141
G1 X115.842 Y123.578 E.91715
G1 X115.944 Y123.124 E.02071
G1 X130.875 Y138.055 E.93924
G2 X131.318 Y137.941 I-.789 J-3.999 E.02034
G1 X116.059 Y122.683 E.95988
G3 X116.184 Y122.251 I3.909 J.891 E.02001
G1 X131.749 Y137.816 E.97916
G2 X132.162 Y137.673 I-1.065 J-3.754 E.01947
G1 X116.327 Y121.837 E.99617
G3 X116.478 Y121.433 I3.677 J1.149 E.01923
G1 X132.568 Y137.522 E1.01214
G1 X132.96 Y137.358 E.01892
G1 X116.64 Y121.039 E1.02664
G3 X116.817 Y120.659 I3.468 J1.385 E.01863
G1 X133.341 Y137.183 E1.03947
G1 X133.716 Y137.001 E.01852
G1 X117 Y120.285 E1.05154
G1 X117.197 Y119.926 E.01823
G1 X134.074 Y136.803 E1.06165
G2 X134.426 Y136.599 I-1.636 J-3.242 E.01813
G1 X117.402 Y119.575 E1.07092
G1 X117.617 Y119.234 E.01795
G1 X134.767 Y136.383 E1.07884
G2 X135.099 Y136.159 I-1.833 J-3.067 E.01783
G1 X117.842 Y118.902 E1.08561
G1 X118.072 Y118.575 E.01776
G1 X135.423 Y135.927 E1.09155
G2 X135.735 Y135.682 I-2.023 J-2.898 E.01763
G1 X118.318 Y118.265 E1.09569
G3 X118.567 Y117.958 I2.854 J2.071 E.0176
G1 X136.043 Y135.434 E1.09934
G1 X136.336 Y135.17 E.01752
G1 X118.829 Y117.664 E1.1013
G3 X119.098 Y117.376 I2.691 J2.253 E.01752
G1 X136.624 Y134.903 E1.10252
G1 X136.902 Y134.624 E.0175
G1 X119.376 Y117.097 E1.10252
G3 X119.664 Y116.83 I2.529 J2.434 E.01752
G1 X137.171 Y134.336 E1.10131
G1 X137.433 Y134.042 E.01753
G1 X119.957 Y116.566 E1.09934
G3 X120.265 Y116.318 I2.366 J2.616 E.01761
G1 X137.682 Y133.735 E1.09569
G1 X137.928 Y133.425 E.01762
G1 X120.576 Y116.073 E1.09156
G1 X120.901 Y115.841 E.01774
G1 X138.158 Y133.099 E1.08561
G2 X138.383 Y132.766 I-3.07 J-2.313 E.01783
G1 X121.233 Y115.617 E1.07884
G1 X121.574 Y115.401 E.01794
G1 X138.598 Y132.425 E1.07092
G2 X138.803 Y132.074 I-2.815 J-1.884 E.0181
G1 X121.926 Y115.197 E1.06165
G3 X122.284 Y114.999 I1.945 J3.084 E.01821
G1 X139 Y131.715 E1.05155
G2 X139.183 Y131.341 I-3.235 J-1.813 E.01851
G1 X122.659 Y114.817 E1.03948
G3 X123.04 Y114.642 I1.753 J3.303 E.01866
M73 P43 R13
G1 X139.36 Y130.962 E1.02664
G1 X139.521 Y130.567 E.01897
G1 X123.432 Y114.478 E1.01215
G3 X123.838 Y114.327 I1.543 J3.537 E.01926
G1 X139.673 Y130.163 E.99617
G1 X139.816 Y129.749 E.01945
G1 X124.251 Y114.184 E.97916
G1 X124.682 Y114.059 E.01996
G1 X139.941 Y129.317 E.95988
G2 X140.056 Y128.876 I-3.875 J-1.243 E.02031
G1 X125.125 Y113.945 E.93925
G3 X125.578 Y113.842 I1.143 J3.986 E.02069
G1 X140.158 Y128.422 E.91715
G2 X140.239 Y127.947 I-4.185 J-.963 E.02144
G1 X126.052 Y113.76 E.89245
G3 X126.542 Y113.693 I.839 J4.325 E.02199
G1 X140.307 Y127.458 E.86592
G2 X140.357 Y126.952 I-4.826 J-.732 E.02265
G1 X127.047 Y113.642 E.83729
G1 X127.572 Y113.611 E.0234
G1 X140.387 Y126.426 E.80614
G2 X140.392 Y125.875 I-4.578 J-.32 E.02453
G1 X128.127 Y113.609 E.7716
G3 X128.701 Y113.627 I.113 J5.513 E.02558
G1 X140.373 Y125.299 E.73424
G2 X140.324 Y124.694 I-5.41 J.13 E.02701
G1 X129.307 Y113.676 E.69308
G3 X129.948 Y113.761 I-.433 J5.749 E.02878
G1 X140.24 Y124.053 E.64746
G2 X140.108 Y123.365 I-6.657 J.917 E.03117
G1 X130.633 Y113.89 E.59607
G3 X131.377 Y114.078 I-1.19 J6.283 E.03416
G1 X139.925 Y122.625 E.5377
G2 X139.662 Y121.806 I-7.425 J1.933 E.03831
G1 X132.193 Y114.337 E.46982
G3 X133.127 Y114.715 I-5.067 J13.871 E.04484
G1 X139.289 Y120.876 E.38757
G2 X138.686 Y119.718 I-10.616 J4.782 E.05811
G1 X134.28 Y115.311 E.27721
G3 X138.246 Y118.721 I-10.396 J16.104 E.23337
; CHANGE_LAYER
; Z_HEIGHT: 5.52
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X136.813 Y117.325 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 20/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z5.64 I-1.199 J-.207 P1  F30000
G1 X133.291 Y137.726 Z5.64
G1 Z5.52
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X121.427 Y114.937 I-5.299 J-11.724 E1.73448
G3 X128.661 Y113.153 I6.578 J11.121 E.33619
G3 X133.346 Y137.701 I-.67 J12.849 E1.5225
G1 X133.439 Y138.075 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X132.761 Y138.357 E.03014
G3 X128.681 Y112.779 I-4.763 J-12.354 E1.93606
G3 X141.041 Y123.722 I-.681 J13.221 E.73185
G1 X141.041 Y123.722 E0
G3 X133.493 Y138.049 I-13.043 J2.28 E.71542
M204 S10000
; WIPE_START
G1 F24000
G1 X132.761 Y138.357 E-.30165
G1 X132.061 Y138.606 E-.28229
G1 X131.616 Y138.735 E-.17606
; WIPE_END
G1 E-.04 F1800
G1 X135.373 Y136.347 Z5.92 F30000
G1 Z5.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
M73 P43 R12
G2 X138.444 Y132.931 I-13.279 J-15.027 E.20478
G1 X138.791 Y132.376 E.02914
G1 X134.374 Y136.792 E.27782
G3 X133.217 Y137.396 I-5.953 J-10.003 E.0581
G1 X139.392 Y131.22 E.38848
G2 X139.777 Y130.282 I-13.426 J-6.052 E.04513
G1 X132.283 Y137.776 E.47141
G3 X131.463 Y138.042 I-2.78 J-7.167 E.03837
G1 X140.042 Y129.463 E.53964
G2 X140.231 Y128.72 I-6.521 J-2.057 E.03413
G1 X130.72 Y138.232 E.59833
G3 X130.033 Y138.364 I-1.524 J-6.045 E.03111
G1 X140.364 Y128.034 E.64985
G2 X140.452 Y127.391 I-5.677 J-1.111 E.02886
G1 X129.391 Y138.452 E.69582
G3 X128.785 Y138.505 I-.774 J-5.374 E.0271
G1 X140.506 Y126.784 E.73734
G2 X140.531 Y126.206 I-5.137 J-.509 E.02577
G1 X128.207 Y138.529 E.77523
G3 X127.653 Y138.529 I-.275 J-4.929 E.02464
G1 X140.529 Y125.654 E.80995
G2 X140.5 Y125.129 I-4.691 J-.007 E.02341
G1 X127.128 Y138.501 E.84123
G3 X126.621 Y138.454 I.169 J-4.533 E.02263
G1 X140.454 Y124.621 E.87017
G2 X140.392 Y124.129 I-4.413 J.302 E.02207
G1 X126.13 Y138.391 E.89719
G1 X125.656 Y138.312 E.0214
G1 X140.311 Y123.657 E.9219
G2 X140.213 Y123.201 I-4.112 J.64 E.02077
G1 X125.201 Y138.213 E.9444
G3 X124.756 Y138.104 I.749 J-4.014 E.02038
G1 X140.105 Y122.755 E.96559
G1 X139.98 Y122.326 E.01987
G1 X124.325 Y137.981 E.98484
G3 X123.909 Y137.843 I1.022 J-3.769 E.01949
G1 X139.844 Y121.909 E1.00238
G1 X139.699 Y121.5 E.0193
G1 X123.501 Y137.698 E1.01896
G1 X123.108 Y137.537 E.01888
G1 X139.536 Y121.109 E1.03341
G2 X139.367 Y120.724 I-3.51 J1.311 E.0187
G1 X122.725 Y137.366 E1.0469
G1 X122.35 Y137.187 E.01847
G1 X139.186 Y120.351 E1.05909
G2 X138.994 Y119.989 I-3.319 J1.525 E.01823
G1 X121.99 Y136.994 E1.06973
G3 X121.634 Y136.796 I1.582 J-3.268 E.01813
G1 X138.796 Y119.634 E1.07967
G2 X138.583 Y119.293 I-3.14 J1.725 E.01789
G1 X121.293 Y136.584 E1.08772
G3 X120.957 Y136.365 I1.776 J-3.095 E.01781
G1 X138.367 Y118.956 E1.09518
G1 X138.136 Y118.633 E.01766
G1 X120.632 Y136.136 E1.10109
G3 X120.317 Y135.898 I1.962 J-2.931 E.0176
G1 X137.899 Y118.316 E1.10607
G1 X137.653 Y118.009 E.01752
G1 X120.008 Y135.654 E1.10999
G3 X119.711 Y135.396 I2.142 J-2.769 E.01747
G1 X137.397 Y117.711 E1.11256
G1 X137.135 Y117.419 E.01744
G1 X119.418 Y135.136 E1.11451
G1 X119.14 Y134.86 E.01742
G1 X136.86 Y117.14 E1.11471
G1 X136.582 Y116.864 E.01742
G1 X118.865 Y134.581 E1.11451
G1 X118.603 Y134.289 E.01744
G1 X136.289 Y116.604 E1.11256
G2 X135.992 Y116.346 I-2.438 J2.512 E.01747
G1 X118.347 Y133.991 E1.10999
G1 X118.101 Y133.684 E.01752
G1 X135.683 Y116.102 E1.10606
G2 X135.368 Y115.864 I-2.277 J2.692 E.0176
G1 X117.864 Y133.367 E1.10109
G1 X117.633 Y133.044 E.01766
G1 X135.043 Y115.635 E1.09517
G2 X134.707 Y115.416 I-2.111 J2.877 E.01781
G1 X117.416 Y132.707 E1.08772
G3 X117.204 Y132.366 I2.929 J-2.067 E.01789
G1 X134.366 Y115.203 E1.07967
G2 X134.01 Y115.006 I-1.938 J3.07 E.01813
G1 X117.005 Y132.011 E1.06973
G3 X116.814 Y131.649 I3.128 J-1.887 E.01823
G1 X133.65 Y114.813 E1.05909
G1 X133.275 Y114.634 E.01847
G1 X116.633 Y131.276 E1.0469
G3 X116.464 Y130.891 I3.342 J-1.697 E.0187
G1 X132.891 Y114.463 E1.0334
G1 X132.499 Y114.302 E.01888
G1 X116.301 Y130.5 E1.01895
G1 X116.156 Y130.091 E.0193
G1 X132.091 Y114.157 E1.00237
G2 X131.675 Y114.019 I-1.438 J3.631 E.01949
G1 X116.02 Y129.674 E.98484
G1 X115.895 Y129.245 E.01987
G1 X131.244 Y113.896 E.96558
G2 X130.799 Y113.787 I-1.194 J3.906 E.02038
G1 X115.787 Y128.799 E.94439
G3 X115.689 Y128.343 I4.014 J-1.096 E.02077
G1 X130.344 Y113.688 E.9219
G1 X129.87 Y113.609 E.0214
G1 X115.608 Y127.871 E.89718
G3 X115.546 Y127.379 I4.352 J-.795 E.02207
G1 X129.379 Y113.546 E.87016
G2 X128.872 Y113.499 I-.675 J4.485 E.02263
G1 X115.5 Y126.871 E.84122
G3 X115.471 Y126.346 I4.66 J-.517 E.02341
G1 X128.346 Y113.471 E.80994
G2 X127.793 Y113.471 I-.278 J4.931 E.02464
G1 X115.469 Y125.794 E.77523
G3 X115.494 Y125.216 I5.162 J-.069 E.02577
G1 X127.215 Y113.495 E.73733
G2 X126.608 Y113.548 I.168 J5.429 E.0271
G1 X115.548 Y124.608 E.69581
G3 X115.636 Y123.966 I5.764 J.468 E.02886
G1 X125.966 Y113.636 E.64984
G2 X125.28 Y113.768 I.837 J6.176 E.03111
G1 X115.769 Y123.28 E.59831
G3 X115.958 Y122.536 I6.71 J1.314 E.03413
G1 X124.536 Y113.958 E.53963
G2 X123.716 Y114.225 I1.961 J7.434 E.03837
G1 X116.223 Y121.718 E.4714
G3 X116.608 Y120.78 I13.81 J5.113 E.04513
G1 X122.783 Y114.604 E.38845
M73 P44 R12
G2 X121.625 Y115.208 I4.796 J10.607 E.0581
G1 X117.209 Y119.624 E.27779
G3 X119.186 Y117.094 I10.974 J6.535 E.1432
G1 X120.627 Y115.653 E.09064
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X119.212 Y117.067 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 21/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z5.92 I-1.006 J.684 P1  F30000
G1 X133.346 Y137.849 Z5.92
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X125.423 Y113.252 I-5.356 J-11.849 E1.94771
G3 X128.951 Y113.032 I2.595 J13.177 E.1577
G3 X133.401 Y137.824 I-.96 J12.968 E1.52621
G1 X133.497 Y138.199 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X132.809 Y138.481 E.03054
G3 X125.239 Y112.91 I-4.809 J-12.482 E1.81331
G3 X128.971 Y112.657 I2.741 J12.805 E.1541
G3 X133.548 Y138.171 I-.971 J13.342 E1.45069
M204 S10000
; WIPE_START
G1 F24000
G1 X132.809 Y138.481 E-.30472
G1 X132.103 Y138.736 E-.28518
G1 X131.673 Y138.861 E-.1701
; WIPE_END
G1 E-.04 F1800
G1 X124.545 Y136.133 Z6.2 F30000
G1 X117.541 Y133.452 Z6.2
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X119.332 Y135.243 E.11268
G2 X121.562 Y136.913 I11.203 J-12.633 E.12409
G1 X117.086 Y132.438 E.28154
G3 X116.478 Y131.27 I11.549 J-6.756 E.0586
G1 X122.728 Y137.52 E.39314
G2 X123.673 Y137.905 I5.767 J-12.782 E.04544
G1 X116.094 Y130.326 E.47679
G3 X115.825 Y129.498 I7.241 J-2.807 E.03876
G1 X124.502 Y138.174 E.54583
G2 X125.253 Y138.366 I2.076 J-6.589 E.03448
G1 X115.634 Y128.746 E.60511
G3 X115.5 Y128.053 I6.108 J-1.538 E.03144
G1 X125.947 Y138.499 E.65716
G2 X126.596 Y138.589 I1.121 J-5.735 E.02916
G1 X115.411 Y127.404 E.7036
G3 X115.358 Y126.791 I5.431 J-.781 E.02739
G1 X127.209 Y138.643 E.74556
G2 X127.794 Y138.668 I.513 J-5.191 E.02604
G1 X115.334 Y126.207 E.78384
G3 X115.334 Y125.648 I4.979 J-.277 E.0249
G1 X128.352 Y138.666 E.81893
G2 X128.883 Y138.637 I.007 J-4.74 E.02365
G1 X115.362 Y125.116 E.85054
G3 X115.41 Y124.605 I4.58 J.172 E.02287
G1 X129.396 Y138.59 E.87978
G2 X129.893 Y138.528 I-.306 J-4.46 E.02231
G1 X115.474 Y124.108 E.90708
G1 X115.554 Y123.629 E.02163
G1 X130.37 Y138.445 E.93206
G2 X130.831 Y138.347 I-.647 J-4.156 E.02099
G1 X115.653 Y123.169 E.95479
G3 X115.764 Y122.719 I4.056 J.757 E.0206
G1 X131.282 Y138.237 E.9762
G1 X131.715 Y138.111 E.02008
G1 X115.888 Y122.284 E.99566
G1 X116.029 Y121.866 E.01964
G1 X132.137 Y137.973 E1.01325
G1 X132.55 Y137.827 E.01951
G1 X116.175 Y121.451 E1.03014
G1 X116.338 Y121.054 E.01908
G1 X132.945 Y137.662 E1.04474
G2 X133.333 Y137.49 I-1.166 J-3.164 E.01889
G1 X116.51 Y120.667 E1.05833
G1 X116.691 Y120.288 E.01867
G1 X133.708 Y137.305 E1.07052
G2 X134.077 Y137.114 I-1.752 J-3.839 E.01848
G1 X116.886 Y119.923 E1.08144
G3 X117.086 Y119.563 I3.305 J1.6 E.01832
G1 X134.436 Y136.914 E1.09149
G2 X134.781 Y136.699 I-1.744 J-3.174 E.01808
G1 X117.301 Y119.219 E1.09963
G3 X117.521 Y118.88 I3.129 J1.796 E.018
G1 X135.121 Y136.48 E1.10716
G1 X135.448 Y136.247 E.01785
G1 X117.753 Y118.551 E1.11314
G3 X117.993 Y118.232 I2.961 J1.983 E.01779
G1 X135.768 Y136.007 E1.11817
G1 X136.079 Y135.758 E.01771
G1 X118.241 Y117.92 E1.12214
G3 X118.501 Y117.62 I2.798 J2.164 E.01766
G1 X136.38 Y135.5 E1.12473
G1 X136.675 Y135.235 E.01763
G1 X118.764 Y117.324 E1.12671
G1 X119.043 Y117.043 E.01761
G1 X136.957 Y134.957 E1.12691
G1 X137.236 Y134.676 E.01761
G1 X119.325 Y116.766 E1.12671
G1 X119.62 Y116.501 E.01763
G1 X137.499 Y134.38 E1.12473
G2 X137.759 Y134.08 I-2.539 J-2.464 E.01766
G1 X119.921 Y116.242 E1.12214
G1 X120.232 Y115.993 E.01771
G1 X138.007 Y133.768 E1.11817
G2 X138.246 Y133.448 I-2.418 J-2.061 E.0178
G1 X120.552 Y115.753 E1.11309
G1 X120.879 Y115.52 E.01785
G1 X138.476 Y133.117 E1.10698
G2 X138.699 Y132.781 I-3.3 J-2.437 E.01797
G1 X121.219 Y115.301 E1.09963
G3 X121.563 Y115.086 I2.089 J2.96 E.01808
G1 X138.914 Y132.437 E1.09149
G2 X139.114 Y132.077 I-3.104 J-1.959 E.01832
G1 X121.923 Y114.886 E1.08145
G3 X122.292 Y114.695 I2.121 J3.647 E.01848
G1 X139.309 Y131.712 E1.07052
G1 X139.49 Y131.333 E.01867
G1 X122.667 Y114.51 E1.05833
G3 X123.055 Y114.338 I1.555 J2.993 E.01889
G1 X139.662 Y130.946 E1.04474
G1 X139.825 Y130.549 E.01908
G1 X123.45 Y114.173 E1.03014
G1 X123.863 Y114.027 E.01951
G1 X139.973 Y130.136 E1.01338
G2 X140.112 Y129.716 I-3.669 J-1.454 E.0197
G1 X124.285 Y113.889 E.99566
G1 X124.718 Y113.763 E.02008
G1 X140.236 Y129.281 E.9762
G2 X140.347 Y128.831 I-3.947 J-1.207 E.0206
G1 X125.169 Y113.654 E.95479
G3 X125.63 Y113.555 I1.108 J4.056 E.02099
G1 X140.446 Y128.371 E.93206
G1 X140.526 Y127.892 E.02163
G1 X126.107 Y113.472 E.90708
G3 X126.604 Y113.41 I.804 J4.397 E.02231
G1 X140.59 Y127.395 E.87978
G2 X140.638 Y126.884 I-4.532 J-.683 E.02287
G1 X127.117 Y113.363 E.85054
G3 X127.648 Y113.334 I.524 J4.711 E.02365
G1 X140.666 Y126.352 E.81893
G2 X140.666 Y125.793 I-4.979 J-.282 E.0249
G1 X128.206 Y113.332 E.78385
G3 X128.79 Y113.357 I.071 J5.217 E.02604
G1 X140.642 Y125.209 E.74556
G2 X140.589 Y124.596 I-5.485 J.168 E.02738
G1 X129.407 Y113.414 E.70345
G3 X130.053 Y113.501 I-.365 J5.171 E.02904
G1 X140.5 Y123.947 E.65717
G2 X140.366 Y123.254 I-6.242 J.845 E.03144
G1 X130.747 Y113.634 E.60512
G3 X131.498 Y113.825 I-1.326 J6.781 E.03448
G1 X140.175 Y122.502 E.54584
G2 X139.906 Y121.674 I-7.509 J1.978 E.03876
G1 X132.324 Y114.093 E.47692
G3 X133.272 Y114.48 I-5.177 J14.002 E.04555
G1 X139.523 Y120.731 E.39323
G2 X138.914 Y119.562 I-10.715 J4.842 E.05867
G1 X134.438 Y115.086 E.28157
G1 X135.007 Y115.442 E.02986
G3 X138.46 Y118.549 I-12.256 J17.091 E.20702
; CHANGE_LAYER
; Z_HEIGHT: 6.08
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X137.045 Y117.134 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 22/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z6.2 I-1.199 J-.21 P1  F30000
G1 X133.399 Y137.965 Z6.2
G1 Z6.08
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X123.279 Y113.746 I-5.407 J-11.965 E1.86828
G3 X128.476 Y112.88 I4.706 J12.209 E.23598
G3 X133.454 Y137.941 I-.484 J13.121 E1.5627
G1 X133.551 Y138.313 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3000
G1 X132.854 Y138.599 E.03093
G3 X123.144 Y113.396 I-4.863 J-12.599 E1.74269
G3 X128.496 Y112.506 I4.839 J12.557 E.2243
G3 X133.602 Y138.285 I-.504 J13.495 E1.48373
M204 S10000
; WIPE_START
G1 F24000
G1 X132.854 Y138.599 E-.30802
G1 X132.142 Y138.856 E-.28787
G1 X131.727 Y138.977 E-.16411
; WIPE_END
G1 E-.04 F1800
G1 X135.539 Y136.552 Z6.48 F30000
G1 Z6.08
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X139.005 Y132.529 I-12.982 J-14.691 E.23697
G1 X134.525 Y137.01 E.28186
G3 X133.358 Y137.62 I-6.018 J-10.085 E.05862
G1 X139.617 Y131.361 E.39375
G2 X140.011 Y130.41 I-13.914 J-6.327 E.0458
G1 X132.412 Y138.009 E.47808
M73 P45 R12
G3 X131.583 Y138.281 I-2.832 J-7.238 E.03879
G1 X140.281 Y129.583 E.54717
G2 X140.476 Y128.832 I-6.589 J-2.106 E.03452
G1 X130.832 Y138.476 E.60667
G3 X130.138 Y138.613 I-1.571 J-6.111 E.03149
G1 X140.613 Y128.138 E.65898
G2 X140.707 Y127.488 I-5.743 J-1.157 E.02923
G1 X129.488 Y138.706 E.70572
G3 X128.874 Y138.764 I-.819 J-5.439 E.02745
G1 X140.765 Y126.873 E.74801
G2 X140.794 Y126.287 I-5.204 J-.554 E.02611
G1 X128.289 Y138.792 E.78667
G1 X127.731 Y138.794 E.02484
G1 X140.792 Y125.732 E.82169
G2 X140.768 Y125.2 I-4.752 J-.051 E.02372
G1 X127.199 Y138.769 E.85358
G3 X126.686 Y138.726 I.126 J-4.595 E.02294
G1 X140.726 Y124.685 E.88327
G1 X140.669 Y124.186 E.02234
G1 X126.187 Y138.668 E.91099
G1 X125.71 Y138.588 E.02152
G1 X140.587 Y123.711 E.93588
G2 X140.494 Y123.247 I-4.175 J.596 E.02105
G1 X125.248 Y138.494 E.95912
G3 X124.795 Y138.389 I.704 J-4.077 E.02065
G1 X140.39 Y122.795 E.98098
G2 X140.265 Y122.363 I-3.912 J.89 E.02002
G1 X124.362 Y138.266 E1.00042
G3 X123.939 Y138.132 I.977 J-3.833 E.01975
G1 X140.133 Y121.938 E1.01872
G1 X139.988 Y121.527 E.0194
G1 X123.526 Y137.989 E1.03558
G3 X123.129 Y137.829 I1.223 J-3.614 E.01904
G1 X139.83 Y121.129 E1.05061
G1 X139.666 Y120.736 E.01893
G1 X122.737 Y137.664 E1.0649
G1 X122.361 Y137.484 E.01857
G1 X139.484 Y120.361 E1.07715
G2 X139.297 Y119.991 I-3.388 J1.477 E.01844
G1 X121.992 Y137.296 E1.08859
G1 X121.633 Y137.099 E.01824
G1 X139.098 Y119.634 E1.09868
G2 X138.89 Y119.285 I-3.21 J1.675 E.01807
G1 X121.285 Y136.89 E1.10747
G1 X120.942 Y136.676 E.01797
G1 X138.674 Y118.944 E1.11546
G2 X138.447 Y118.615 I-3.042 J1.864 E.0178
G1 X120.615 Y136.446 E1.12173
G3 X120.291 Y136.214 I1.908 J-3.002 E.01775
G1 X138.215 Y118.29 E1.12753
G2 X137.968 Y117.981 I-2.879 J2.042 E.01763
G1 X119.98 Y135.968 E1.13153
G3 X119.675 Y135.717 I2.085 J-2.844 E.0176
G1 X137.718 Y117.674 E1.13502
G1 X137.454 Y117.381 E.01753
G1 X119.38 Y135.455 E1.13698
G3 X119.093 Y135.185 I2.259 J-2.688 E.01753
G1 X137.186 Y117.092 E1.13814
G1 X136.907 Y116.815 E.01751
G1 X118.814 Y134.907 E1.13814
G3 X118.546 Y134.619 I2.432 J-2.534 E.01753
G1 X136.62 Y116.545 E1.13698
G1 X136.325 Y116.283 E.01754
G1 X118.282 Y134.326 E1.13502
G3 X118.032 Y134.019 I2.606 J-2.378 E.01761
G1 X136.02 Y116.032 E1.13153
G1 X135.709 Y115.786 E.01763
G1 X117.785 Y133.71 E1.12753
G1 X117.553 Y133.385 E.01775
G1 X135.385 Y115.553 E1.12173
G2 X135.057 Y115.324 I-2.203 J2.798 E.01779
G1 X117.326 Y133.056 E1.11546
G1 X117.11 Y132.715 E.01795
G1 X134.715 Y115.11 E1.10746
G2 X134.367 Y114.901 I-2.037 J2.989 E.01805
G1 X116.902 Y132.366 E1.09868
G1 X116.703 Y132.009 E.0182
G1 X134.008 Y114.704 E1.08859
G2 X133.639 Y114.516 I-1.859 J3.188 E.01842
G1 X116.516 Y131.639 E1.07715
G1 X116.334 Y131.264 E.01853
G1 X133.262 Y114.336 E1.06489
G2 X132.871 Y114.171 I-1.668 J3.4 E.0189
G1 X116.17 Y130.871 E1.0506
G3 X116.012 Y130.473 I3.468 J-1.608 E.01908
G1 X132.474 Y114.011 E1.03558
G1 X132.061 Y113.868 E.01946
G1 X115.867 Y130.062 E1.01872
G3 X115.735 Y129.637 I3.713 J-1.389 E.01979
G1 X131.634 Y113.738 E1.00018
G1 X131.204 Y113.611 E.01994
G1 X115.61 Y129.205 E.98095
G1 X115.506 Y128.753 E.02064
G1 X130.752 Y113.506 E.95912
G2 X130.29 Y113.412 I-1.07 J4.069 E.021
G1 X115.413 Y128.289 E.93587
G3 X115.331 Y127.814 I4.189 J-.962 E.02146
G1 X129.813 Y113.332 E.91098
G2 X129.314 Y113.274 I-.767 J4.408 E.02233
G1 X115.274 Y127.315 E.88326
G3 X115.232 Y126.8 I4.563 J-.63 E.02299
G1 X128.801 Y113.231 E.85358
G2 X128.263 Y113.212 I-.473 J5.745 E.02394
G1 X115.208 Y126.268 E.82128
G1 X115.206 Y125.713 E.02468
G1 X127.71 Y113.209 E.78659
G2 X127.126 Y113.236 I-.083 J4.465 E.02603
G1 X115.235 Y125.127 E.74801
G3 X115.293 Y124.512 I5.503 J.21 E.02748
G1 X126.512 Y113.294 E.70571
G2 X125.862 Y113.387 I.503 J5.83 E.02921
G1 X115.387 Y123.862 E.65897
G3 X115.524 Y123.168 I6.25 J.878 E.0315
G1 X125.168 Y113.524 E.60666
G2 X124.416 Y113.719 I1.359 J6.789 E.03455
G1 X115.725 Y122.41 E.54676
G3 X115.989 Y121.59 I8.909 J2.411 E.03834
G1 X123.588 Y113.991 E.47806
G2 X122.642 Y114.38 I5.461 J14.608 E.04552
G1 X116.383 Y120.639 E.39373
G3 X116.995 Y119.471 I13.937 J6.553 E.05869
G1 X121.475 Y114.991 E.28183
G2 X119.204 Y116.705 I7.015 J11.655 E.1268
G1 X117.447 Y118.462 E.11054
; CHANGE_LAYER
; Z_HEIGHT: 6.36
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X118.861 Y117.048 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 23/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z6.48 I-1 J.694 P1  F30000
G1 X133.448 Y138.074 Z6.48
G1 Z6.36
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X121.232 Y114.608 I-5.456 J-12.072 E1.78592
G3 X128.764 Y112.777 I6.773 J11.451 E.34988
G3 X133.503 Y138.049 I-.773 J13.225 E1.56407
G1 X133.602 Y138.42 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.897 Y138.711 E.03131
G3 X121.041 Y114.286 I-4.906 J-12.709 E1.6638
G3 X128.784 Y112.402 I6.965 J11.775 E.33203
G3 X133.652 Y138.393 I-.793 J13.6 E1.48494
M204 S10000
; WIPE_START
G1 F24000
G1 X132.897 Y138.711 E-.3113
G1 X132.178 Y138.969 E-.2904
G1 X131.778 Y139.086 E-.1583
; WIPE_END
G1 E-.04 F1800
G1 X124.641 Y136.381 Z6.76 F30000
G1 X117.361 Y133.622 Z6.76
G1 Z6.36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X118.786 Y135.046 E.08961
G2 X121.383 Y137.09 I9.353 J-9.213 E.14741
G1 X116.904 Y132.611 E.28179
G3 X116.29 Y131.444 I15.513 J-8.902 E.05866
G1 X122.554 Y137.707 E.39403
G2 X123.508 Y138.108 I6.733 J-14.694 E.04604
G1 X115.894 Y130.495 E.47895
G3 X115.62 Y129.667 I7.231 J-2.856 E.0388
G1 X124.334 Y138.381 E.54817
G2 X125.085 Y138.578 I2.134 J-6.586 E.03455
G1 X115.422 Y128.916 E.60786
G3 X115.281 Y128.221 I6.112 J-1.603 E.03153
G1 X125.779 Y138.719 E.66042
G2 X126.43 Y138.817 I2.128 J-12.012 E.02927
G1 X115.184 Y127.571 E.70744
G3 X115.122 Y126.956 I5.444 J-.856 E.02751
G1 X127.045 Y138.879 E.75004
G1 X127.63 Y138.91 E.02603
G1 X115.09 Y126.37 E.78887
G1 X115.088 Y125.815 E.02469
G1 X128.184 Y138.911 E.82385
G2 X128.718 Y138.892 I.094 J-4.764 E.02378
G1 X115.108 Y125.282 E.85614
G3 X115.146 Y124.767 I4.608 J.08 E.023
G1 X129.235 Y138.855 E.88625
G1 X129.731 Y138.797 E.02221
G1 X115.201 Y124.268 E.91401
G3 X115.275 Y123.815 I4.074 J.429 E.02043
G1 X130.208 Y138.721 E.93857
G2 X130.674 Y138.634 I-.545 J-4.193 E.0211
G1 X115.367 Y123.327 E.9629
G1 X115.469 Y122.876 E.0206
G1 X131.123 Y138.53 E.98477
G2 X131.558 Y138.412 I-.836 J-3.933 E.02007
G1 X115.588 Y122.442 E1.00461
G3 X115.716 Y122.016 I3.855 J.921 E.01979
G1 X131.985 Y138.286 E1.02347
M73 P46 R12
G1 X132.394 Y138.141 E.01929
G1 X115.858 Y121.605 E1.04024
G3 X116.011 Y121.205 I3.64 J1.164 E.01907
G1 X132.796 Y137.989 E1.05587
G1 X133.186 Y137.826 E.01881
G1 X116.172 Y120.813 E1.07029
G3 X116.349 Y120.436 I3.445 J1.384 E.01852
G1 X133.564 Y137.651 E1.08297
G1 X133.937 Y137.47 E.01842
G1 X116.53 Y120.063 E1.09502
G1 X116.726 Y119.706 E.01813
G1 X134.294 Y137.274 E1.10513
G2 X134.647 Y137.073 I-1.607 J-3.243 E.01806
G1 X116.928 Y119.355 E1.11465
G1 X117.14 Y119.014 E.01786
G1 X134.986 Y136.859 E1.12259
G2 X135.319 Y136.639 I-1.791 J-3.079 E.01778
G1 X117.362 Y118.682 E1.12964
G1 X117.59 Y118.357 E.01766
G1 X135.642 Y136.409 E1.13556
G2 X135.956 Y136.17 I-1.967 J-2.921 E.01758
G1 X117.831 Y118.044 E1.14025
G1 X118.075 Y117.735 E.01752
G1 X136.263 Y135.924 E1.14417
G2 X136.56 Y135.667 I-2.138 J-2.768 E.01746
G1 X118.334 Y117.44 E1.14657
G3 X118.594 Y117.148 I2.735 J2.174 E.01744
G1 X136.851 Y135.405 E1.14849
G2 X137.13 Y135.13 I-2.307 J-2.618 E.01741
G1 X118.87 Y116.87 E1.14867
G3 X119.149 Y116.595 I2.586 J2.342 E.01741
G1 X137.406 Y134.852 E1.14849
G2 X137.666 Y134.56 I-2.476 J-2.468 E.01744
G1 X119.44 Y116.333 E1.14657
G3 X119.736 Y116.077 I2.436 J2.512 E.01746
G1 X137.925 Y134.265 E1.14417
G1 X138.169 Y133.956 E.01752
G1 X120.043 Y115.83 E1.14025
G3 X120.358 Y115.591 I2.282 J2.682 E.01758
G1 X138.409 Y133.643 E1.13556
G1 X138.638 Y133.318 E.01766
G1 X120.681 Y115.361 E1.12964
G3 X121.014 Y115.141 I2.125 J2.859 E.01778
G1 X138.86 Y132.986 E1.12259
G1 X139.072 Y132.646 E.01786
G1 X121.353 Y114.927 E1.11465
G3 X121.706 Y114.726 I1.96 J3.044 E.01806
G1 X139.274 Y132.294 E1.10513
G1 X139.47 Y131.937 E.01813
G1 X122.063 Y114.53 E1.09502
G1 X122.435 Y114.349 E.01842
G1 X139.651 Y131.564 E1.08298
G2 X139.828 Y131.188 I-3.266 J-1.76 E.01852
G1 X122.814 Y114.174 E1.07029
G1 X123.204 Y114.011 E.01881
G1 X139.989 Y130.795 E1.05587
G2 X140.142 Y130.395 I-3.486 J-1.564 E.01907
G1 X123.606 Y113.859 E1.04024
G1 X124.014 Y113.714 E.01929
G1 X140.284 Y129.984 E1.02348
G2 X140.401 Y129.596 I-3.394 J-1.232 E.01802
G1 X124.442 Y113.588 E1.00547
G3 X124.877 Y113.47 I1.271 J3.814 E.02006
G1 X140.531 Y129.125 E.98478
G1 X140.633 Y128.673 E.0206
G1 X125.326 Y113.366 E.96291
G3 X125.792 Y113.279 I1.011 J4.106 E.0211
G1 X140.722 Y128.208 E.93917
G2 X140.799 Y127.732 I-4.198 J-.927 E.02146
G1 X126.269 Y113.203 E.91402
G1 X126.765 Y113.145 E.02221
G1 X140.854 Y127.234 E.88626
G2 X140.892 Y126.718 I-4.569 J-.596 E.023
G1 X127.282 Y113.108 E.85615
G3 X127.816 Y113.089 I.44 J4.744 E.02378
G1 X140.912 Y126.185 E.82386
G1 X140.91 Y125.63 E.02469
G1 X128.37 Y113.09 E.78888
G1 X128.954 Y113.121 E.02603
G1 X140.878 Y125.044 E.75005
G2 X140.816 Y124.429 I-5.507 J.241 E.02751
G1 X129.57 Y113.183 E.70745
G3 X130.221 Y113.28 I-.541 J5.841 E.02928
G1 X140.719 Y123.779 E.66043
G2 X140.578 Y123.085 I-6.252 J.908 E.03153
G1 X130.915 Y113.422 E.60787
G3 X131.666 Y113.619 I-1.383 J6.785 E.03455
G1 X140.38 Y122.333 E.54818
G2 X140.106 Y121.506 I-7.504 J2.027 E.0388
G1 X132.492 Y113.892 E.47896
G3 X133.446 Y114.292 I-5.777 J15.093 E.04603
G1 X139.71 Y120.556 E.39405
G2 X139.096 Y119.39 I-16.15 J7.747 E.05865
G1 X134.616 Y114.91 E.28182
G1 X135.143 Y115.238 E.02759
G3 X138.639 Y118.379 I-11.882 J16.743 E.20952
; CHANGE_LAYER
; Z_HEIGHT: 6.64
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X137.224 Y116.965 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 24/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z6.76 I-1.199 J-.211 P1  F30000
G1 X133.494 Y138.179 Z6.76
G1 Z6.64
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X126.835 Y112.682 I-5.501 J-12.181 E2.06844
G3 X129.038 Y112.673 I1.164 J14.845 E.09807
G3 X133.549 Y138.154 I-1.045 J13.325 E1.56639
G1 X133.649 Y138.52 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X126.802 Y112.308 I-5.656 J-12.523 E1.96287
G3 X129.067 Y112.299 I1.197 J15.263 E.0931
G3 X133.704 Y138.495 I-1.075 J13.699 E1.48646
M204 S10000
; WIPE_START
G1 F24000
G1 X132.941 Y138.825 E-.31555
G1 X132.214 Y139.082 E-.29296
G1 X131.832 Y139.193 E-.15149
; WIPE_END
G1 E-.04 F1800
G1 X135.689 Y136.736 Z7.04 F30000
G1 Z6.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X138.861 Y133.208 I-14.369 J-16.107 E.21143
G1 X139.196 Y132.671 E.02818
G1 X134.664 Y137.202 E.28507
G3 X133.49 Y137.818 I-9.233 J-16.174 E.059
G1 X139.817 Y131.491 E.39801
G2 X140.22 Y130.53 I-14.772 J-6.761 E.0464
G1 X132.532 Y138.218 E.48365
G3 X131.697 Y138.494 I-2.879 J-7.294 E.03914
G1 X140.495 Y129.696 E.55345
G2 X140.694 Y128.939 I-6.645 J-2.151 E.03485
G1 X130.939 Y138.694 E.61366
G3 X130.239 Y138.836 I-1.615 J-6.165 E.03181
G1 X140.836 Y128.238 E.66666
G2 X140.934 Y127.582 I-5.796 J-1.201 E.02953
G1 X129.583 Y138.934 E.71408
G3 X128.965 Y138.994 I-.876 J-5.796 E.02765
G1 X140.997 Y126.961 E.75693
G1 X141.028 Y126.372 E.02626
G1 X128.371 Y139.029 E.79623
G1 X127.811 Y139.03 E.02491
G1 X141.029 Y125.812 E.83151
G2 X141.01 Y125.274 I-4.805 J-.094 E.02399
G1 X127.274 Y139.01 E.86409
G3 X126.754 Y138.971 I.082 J-4.649 E.0232
G1 X140.972 Y124.753 E.89446
G1 X140.914 Y124.252 E.02241
G1 X126.25 Y138.916 E.92247
G3 X125.77 Y138.838 I.456 J-4.313 E.02165
G1 X140.838 Y123.771 E.94784
G2 X140.749 Y123.3 I-4.23 J.55 E.02129
G1 X125.303 Y138.747 E.97169
G1 X124.846 Y138.646 E.02082
G1 X140.645 Y122.847 E.99384
G2 X140.525 Y122.408 I-3.968 J.844 E.02024
G1 X124.408 Y138.525 E1.01386
G3 X123.979 Y138.396 I.93 J-3.89 E.01996
G1 X140.398 Y121.977 E1.03289
G1 X140.252 Y121.565 E.01946
G1 X123.564 Y138.253 E1.0498
G3 X123.16 Y138.098 I1.174 J-3.672 E.01924
G1 X140.099 Y121.159 E1.06557
G1 X139.934 Y120.766 E.01898
G1 X122.764 Y137.936 E1.08012
G3 X122.384 Y137.757 I1.396 J-3.474 E.01869
G1 X139.757 Y120.385 E1.09287
G1 X139.574 Y120.01 E.01857
G1 X122.008 Y137.575 E1.10497
G1 X121.648 Y137.377 E.01829
G1 X139.377 Y119.648 E1.11527
G2 X139.175 Y119.292 I-3.274 J1.622 E.01823
G1 X121.293 Y137.173 E1.12487
G1 X120.949 Y136.959 E.01803
G1 X138.958 Y118.95 E1.13289
G2 X138.736 Y118.614 I-3.106 J1.807 E.01794
G1 X120.614 Y136.736 E1.14
G1 X120.287 Y136.505 E.01782
G1 X138.504 Y118.288 E1.14597
G2 X138.263 Y117.97 I-2.948 J1.986 E.01774
G1 X119.971 Y136.262 E1.1507
G1 X119.659 Y136.016 E.01768
G1 X138.014 Y117.661 E1.15465
G2 X137.755 Y117.361 I-2.793 J2.158 E.01762
G1 X119.362 Y135.755 E1.15707
G3 X119.066 Y135.492 I2.196 J-2.762 E.0176
G1 X137.491 Y117.068 E1.15902
G2 X137.213 Y116.786 I-2.642 J2.328 E.01757
G1 X118.786 Y135.213 E1.15919
G3 X118.509 Y134.932 I2.364 J-2.61 E.01757
G1 X136.933 Y116.508 E1.15902
G2 X136.637 Y116.246 I-2.361 J2.369 E.0176
G1 X118.245 Y134.638 E1.15702
G3 X117.986 Y134.339 I2.533 J-2.457 E.01762
G1 X136.341 Y115.984 E1.15465
G1 X136.029 Y115.738 E.01768
G1 X117.737 Y134.03 E1.1507
G3 X117.496 Y133.712 I2.707 J-2.303 E.01774
G1 X135.713 Y115.495 E1.14596
G1 X135.386 Y115.264 E.01782
G1 X117.264 Y133.386 E1.14
G3 X117.042 Y133.05 I2.884 J-2.143 E.01794
G1 X135.051 Y115.041 E1.13288
G1 X134.707 Y114.827 E.01803
G1 X116.825 Y132.708 E1.12487
G3 X116.623 Y132.352 I3.07 J-1.978 E.01823
G1 X134.352 Y114.623 E1.11527
G1 X133.991 Y114.425 E.01829
G1 X116.426 Y131.99 E1.10497
G1 X116.243 Y131.615 E.01857
G1 X133.616 Y114.242 E1.09287
G2 X133.236 Y114.064 I-1.776 J3.296 E.01869
G1 X116.066 Y131.234 E1.08012
G1 X115.901 Y130.841 E.01898
G1 X132.84 Y113.902 E1.06557
G2 X132.436 Y113.747 I-1.578 J3.518 E.01924
G1 X115.748 Y130.435 E1.0498
M73 P47 R12
G1 X115.602 Y130.023 E.01946
G1 X132.021 Y113.604 E1.03289
G2 X131.592 Y113.475 I-1.36 J3.762 E.01996
G1 X115.475 Y129.592 E1.01386
G3 X115.355 Y129.153 I3.849 J-1.283 E.02024
G1 X131.154 Y113.354 E.99385
G1 X130.698 Y113.252 E.02078
G1 X115.25 Y128.699 E.97178
G3 X115.162 Y128.229 I4.142 J-1.02 E.02129
G1 X130.23 Y113.162 E.94784
G2 X129.749 Y113.084 I-.898 J4.013 E.02166
G1 X115.085 Y127.748 E.92245
G1 X115.028 Y127.247 E.02241
G1 X129.245 Y113.03 E.89435
G2 X128.726 Y112.99 I-.636 J4.864 E.02314
G1 X114.991 Y126.725 E.86402
G3 X114.971 Y126.188 I4.528 J-.443 E.02395
G1 X128.189 Y112.97 E.83151
G1 X127.629 Y112.971 E.02491
G1 X114.972 Y125.628 E.79622
G1 X115.003 Y125.039 E.02626
G1 X127.037 Y113.004 E.75705
G2 X126.417 Y113.066 I.242 J5.554 E.02775
G1 X115.066 Y124.418 E.71407
G3 X115.164 Y123.761 I5.893 J.544 E.02953
G1 X125.761 Y113.164 E.66665
G2 X125.06 Y113.306 I.915 J6.307 E.03181
G1 X115.307 Y123.06 E.61356
G3 X115.505 Y122.303 I6.481 J1.292 E.03479
G1 X124.303 Y113.506 E.55344
G2 X123.468 Y113.782 I2.044 J7.571 E.03914
G1 X115.78 Y121.47 E.48363
G3 X116.183 Y120.508 I15.176 J5.8 E.0464
G1 X122.511 Y114.181 E.39806
G2 X121.335 Y114.798 I8.013 J16.688 E.05908
G1 X116.804 Y119.329 E.28504
G3 X118.499 Y117.076 I14.71 J9.301 E.12554
G1 X120.31 Y115.265 E.11395
; CHANGE_LAYER
; Z_HEIGHT: 6.92
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X118.896 Y116.679 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 25/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z7.04 I-1.007 J.683 P1  F30000
G1 X133.54 Y138.277 Z7.04
G1 Z6.92
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X121.98 Y113.953 I-5.54 J-12.277 E1.85847
G3 X128.558 Y112.544 I5.991 J11.908 E.30254
G3 X133.594 Y138.253 I-.558 J13.457 E1.6007
G1 X133.696 Y138.621 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.694 Y138.619 E.00012
G3 X121.816 Y113.616 I-5.694 J-12.618 E1.76341
G3 X128.578 Y112.169 I6.153 J12.24 E.28703
G3 X134.393 Y138.28 I-.578 J13.831 E1.48913
G1 X133.75 Y138.595 E.02938
M204 S10000
; WIPE_START
G1 F24000
G1 X133.694 Y138.619 E-.02322
G1 X132.978 Y138.921 E-.29512
G1 X132.246 Y139.18 E-.29516
G1 X131.876 Y139.288 E-.14649
; WIPE_END
G1 E-.04 F1800
G1 X124.411 Y137.699 Z7.32 F30000
G1 X120.238 Y136.811 Z7.32
G1 Z6.92
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G3 X116.727 Y132.746 I13.048 J-14.818 E.23971
G1 X121.249 Y137.267 E.28445
G2 X122.429 Y137.893 I7.369 J-12.469 E.05946
G1 X116.105 Y131.569 E.39786
G3 X115.7 Y130.61 I14.548 J-6.702 E.04631
G1 X123.393 Y138.303 E.48394
G2 X124.225 Y138.58 I2.885 J-7.266 E.03902
G1 X115.421 Y129.777 E.5538
G3 X115.224 Y129.025 I5.35 J-1.805 E.03459
G1 X124.981 Y138.782 E.6138
G2 X125.681 Y138.928 I1.646 J-6.16 E.03182
G1 X115.073 Y128.32 E.66732
G3 X114.972 Y127.664 I5.787 J-1.23 E.02953
G1 X126.337 Y139.03 E.71497
G2 X126.959 Y139.096 I.905 J-5.494 E.02781
G1 X114.906 Y127.043 E.75821
G1 X114.871 Y126.454 E.02626
G1 X127.544 Y139.127 E.79724
G2 X128.104 Y139.133 I.329 J-4.982 E.02492
G1 X114.866 Y125.895 E.83273
G3 X114.883 Y125.357 I4.801 J-.126 E.02397
G1 X128.643 Y139.118 E.86566
G2 X129.166 Y139.086 I-.025 J-4.666 E.02329
G1 X114.916 Y124.836 E.89642
G1 X114.971 Y124.336 E.02236
G1 X129.663 Y139.028 E.92424
G2 X130.146 Y138.957 I-.394 J-4.336 E.02173
G1 X115.047 Y123.859 E.9498
G1 X115.132 Y123.389 E.02124
G1 X130.61 Y138.867 E.97367
G1 X131.065 Y138.767 E.02072
G1 X115.229 Y122.931 E.99619
G3 X115.344 Y122.492 I3.972 J.802 E.02022
G1 X131.509 Y138.657 E1.0169
G1 X131.938 Y138.532 E.01989
G1 X115.467 Y122.06 E1.03617
G3 X115.609 Y121.648 I3.743 J1.06 E.01941
G1 X132.352 Y138.391 E1.05326
G2 X132.76 Y138.245 I-1.1 J-3.704 E.01929
G1 X115.757 Y121.241 E1.06962
G1 X115.918 Y120.848 E.0189
G1 X133.151 Y138.081 E1.08406
G2 X133.536 Y137.912 I-1.319 J-3.511 E.01871
G1 X116.089 Y120.465 E1.0975
G1 X116.269 Y120.09 E.0185
G1 X133.909 Y137.73 E1.1097
G2 X134.272 Y137.539 I-1.519 J-3.33 E.01827
G1 X116.461 Y119.728 E1.12045
G1 X116.658 Y119.37 E.01816
G1 X134.628 Y137.341 E1.13049
G2 X134.972 Y137.13 I-1.707 J-3.163 E.01794
G1 X116.87 Y119.028 E1.13872
G3 X117.085 Y118.689 I3.127 J1.748 E.01788
G1 X135.311 Y136.915 E1.14654
G2 X135.636 Y136.685 I-1.885 J-3.003 E.0177
G1 X117.315 Y118.364 E1.15253
G3 X117.548 Y118.043 I2.972 J1.922 E.01766
G1 X135.958 Y136.453 E1.15809
G1 X136.266 Y136.206 E.01754
G1 X117.793 Y117.734 E1.16202
G3 X118.045 Y117.431 I2.821 J2.09 E.01752
G1 X136.57 Y135.956 E1.16533
G1 X136.862 Y135.693 E.01746
G1 X118.306 Y117.138 E1.16728
G3 X118.575 Y116.852 I2.674 J2.255 E.01745
G1 X137.148 Y135.426 E1.16838
G1 X137.425 Y135.148 E.01744
G1 X118.852 Y116.574 E1.16838
G3 X119.138 Y116.307 I2.527 J2.418 E.01746
G1 X137.694 Y134.862 E1.16728
G1 X137.955 Y134.569 E.01747
G1 X119.43 Y116.044 E1.16533
G3 X119.734 Y115.794 I2.38 J2.584 E.01753
G1 X138.206 Y134.266 E1.16202
G1 X138.452 Y133.957 E.01756
G1 X120.042 Y115.547 E1.15809
G3 X120.364 Y115.315 I2.229 J2.751 E.01768
G1 X138.685 Y133.636 E1.15253
G1 X138.915 Y133.311 E.0177
G1 X120.689 Y115.085 E1.14654
G1 X121.028 Y114.87 E.01787
G1 X139.13 Y132.972 E1.13873
G2 X139.342 Y132.63 I-2.934 J-2.061 E.01792
G1 X121.373 Y114.66 E1.13043
G1 X121.732 Y114.466 E.0182
G1 X139.539 Y132.272 E1.12014
M73 P47 R11
G2 X139.731 Y131.91 I-3.125 J-1.895 E.01824
G1 X122.092 Y114.271 E1.10961
G3 X122.464 Y114.088 I2.292 J4.197 E.01843
G1 X139.911 Y131.535 E1.0975
G2 X140.082 Y131.152 I-3.327 J-1.716 E.01868
G1 X122.849 Y113.919 E1.08407
G1 X123.24 Y113.755 E.01885
G1 X140.243 Y130.759 E1.06962
G2 X140.391 Y130.352 I-3.545 J-1.52 E.01925
G1 X123.648 Y113.609 E1.05327
G3 X124.062 Y113.468 I1.459 J3.614 E.01945
G1 X140.533 Y129.94 E1.03618
G1 X140.656 Y129.508 E.01996
G1 X124.491 Y113.343 E1.0169
G3 X124.932 Y113.23 I1.23 J3.87 E.02027
G1 X140.771 Y129.069 E.99638
G1 X140.873 Y128.616 E.02064
G1 X125.382 Y113.126 E.97447
G3 X125.854 Y113.043 I.971 J4.162 E.02132
G1 X140.957 Y128.146 E.95006
G2 X141.029 Y127.664 I-4.253 J-.889 E.02168
G1 X126.337 Y112.972 E.92424
G1 X126.834 Y112.914 E.02225
G1 X141.084 Y127.164 E.89643
G2 X141.117 Y126.643 I-4.622 J-.557 E.02324
G1 X127.356 Y112.882 E.86567
G3 X127.9 Y112.871 I.35 J3.936 E.02421
G1 X141.134 Y126.105 E.83248
G2 X141.129 Y125.546 I-4.977 J-.242 E.02486
G1 X128.46 Y112.877 E.79699
G3 X129.041 Y112.904 I-.021 J6.719 E.0259
G1 X141.094 Y124.957 E.75822
G2 X141.028 Y124.336 I-5.558 J.278 E.02777
G1 X129.663 Y112.97 E.71498
G3 X130.319 Y113.072 I-.578 J5.893 E.02955
G1 X140.927 Y123.68 E.66733
G2 X140.776 Y122.975 I-8.207 J1.387 E.03209
G1 X131.019 Y113.218 E.61381
G3 X131.775 Y113.42 I-1.421 J6.837 E.03485
G1 X140.579 Y122.224 E.55382
G2 X140.3 Y121.39 I-7.557 J2.066 E.03911
G1 X132.607 Y113.697 E.48396
G3 X133.571 Y114.106 I-6.472 J16.577 E.04658
G1 X139.896 Y120.431 E.39788
G2 X139.273 Y119.255 I-15.267 J7.321 E.05922
G1 X134.757 Y114.738 E.2841
G1 X135.446 Y115.18 E.0364
G3 X138.792 Y118.219 I-12.26 J16.865 E.20148
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X137.377 Y116.806 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 26/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z7.32 I-1.199 J-.211 P1  F30000
G1 X133.58 Y138.367 Z7.32
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X121.733 Y113.961 I-5.589 J-12.366 E1.86321
G3 X128.846 Y112.459 I6.262 J12.057 E.32738
G3 X133.635 Y138.342 I-.855 J13.543 E1.59936
G1 X133.74 Y138.711 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.734 Y138.709 E.00026
G3 X121.56 Y113.628 I-5.743 J-12.707 E1.76738
G3 X128.866 Y112.084 I6.435 J12.39 E.3104
G3 X134.438 Y138.367 I-.875 J13.917 E1.48766
G1 X133.794 Y138.685 E.02948
M204 S10000
; WIPE_START
M73 P48 R11
G1 F24000
G1 X133.734 Y138.709 E-.0244
G1 X133.015 Y139.015 E-.29724
G1 X132.277 Y139.276 E-.29731
G1 X131.921 Y139.38 E-.14106
; WIPE_END
G1 E-.04 F1800
G1 X135.821 Y136.892 Z7.6 F30000
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X139.03 Y133.321 I-14.557 J-16.31 E.21401
G1 X139.357 Y132.797 E.02745
G1 X134.791 Y137.363 E.28722
G3 X133.607 Y137.988 I-8.684 J-15.008 E.05958
G1 X139.972 Y131.623 E.4004
G2 X140.398 Y130.639 I-12.839 J-6.136 E.04771
G1 X132.642 Y138.395 E.4879
G3 X131.803 Y138.676 I-2.919 J-7.332 E.03939
G1 X140.677 Y129.801 E.55826
G2 X140.88 Y129.039 I-6.683 J-2.192 E.0351
G1 X131.04 Y138.88 E.61902
G3 X130.343 Y139.018 I-1.989 J-8.199 E.03161
G1 X141.027 Y128.334 E.67208
G2 X141.129 Y127.673 I-5.834 J-1.242 E.02977
G1 X129.675 Y139.128 E.72058
G3 X129.05 Y139.195 I-.905 J-5.533 E.02798
G1 X141.197 Y127.048 E.76413
G1 X141.228 Y126.458 E.02628
G1 X128.456 Y139.23 E.80345
G3 X127.893 Y139.234 I-.319 J-5.008 E.02505
G1 X141.233 Y125.894 E.83919
G2 X141.218 Y125.35 I-4.848 J-.138 E.0242
G1 X127.351 Y139.218 E.87237
G3 X126.826 Y139.184 I.037 J-4.69 E.02341
G1 X141.186 Y124.824 E.90335
G1 X141.128 Y124.323 E.02242
G1 X126.322 Y139.129 E.93137
G3 X125.837 Y139.056 I.41 J-4.357 E.02184
G1 X141.056 Y123.837 E.95737
G2 X140.973 Y123.361 I-4.276 J.503 E.02148
G1 X125.363 Y138.971 E.98196
G1 X124.907 Y138.868 E.02079
G1 X140.868 Y122.908 E1.00404
G2 X140.753 Y122.463 I-4.014 J.795 E.02042
G1 X124.464 Y138.753 E1.02471
G1 X124.029 Y138.629 E.02011
G1 X140.627 Y122.031 E1.04413
G2 X140.486 Y121.614 I-3.782 J1.053 E.0196
G1 X123.614 Y138.486 E1.06135
G3 X123.204 Y138.337 I1.123 J-3.72 E.0194
G1 X140.338 Y121.203 E1.07782
G1 X140.173 Y120.809 E.01899
G1 X122.808 Y138.174 E1.09237
G3 X122.422 Y138.001 I1.343 J-3.524 E.01882
G1 X140.001 Y120.423 E1.1058
G1 X139.814 Y120.051 E.01851
G1 X122.044 Y137.821 E1.11782
G3 X121.68 Y137.627 I1.545 J-3.343 E.01838
G1 X139.627 Y119.68 E1.129
G2 X139.427 Y119.321 I-4.365 J2.187 E.01828
G1 X121.319 Y137.429 E1.13915
G3 X120.975 Y137.215 I1.737 J-3.178 E.01805
G1 X139.215 Y118.975 E1.14744
G1 X138.998 Y118.632 E.01801
G1 X120.64 Y136.991 E1.15487
G1 X120.308 Y136.764 E.01788
G1 X138.767 Y118.306 E1.16116
G2 X138.533 Y117.981 I-3.006 J1.921 E.01781
G1 X119.982 Y136.531 E1.16695
G1 X119.671 Y136.284 E.01769
G1 X138.284 Y117.671 E1.17091
G2 X138.032 Y117.365 I-2.856 J2.092 E.01766
G1 X119.366 Y136.031 E1.17424
G1 X119.07 Y135.768 E.0176
G1 X137.767 Y117.07 E1.17621
G2 X137.498 Y116.782 I-2.706 J2.257 E.01759
G1 X118.782 Y135.497 E1.17731
G1 X118.502 Y135.218 E.01757
G1 X137.217 Y116.503 E1.17731
G2 X136.93 Y116.232 I-2.559 J2.423 E.01759
G1 X118.233 Y134.929 E1.17621
G1 X117.968 Y134.635 E.01759
G1 X136.634 Y115.969 E1.17423
G2 X136.329 Y115.716 I-2.41 J2.589 E.01765
G1 X117.716 Y134.329 E1.1709
G1 X117.467 Y134.019 E.01767
G1 X136.018 Y115.469 E1.16695
G2 X135.695 Y115.233 I-2.259 J2.759 E.01779
G1 X117.233 Y133.694 E1.16135
G3 X117.002 Y133.367 I2.795 J-2.227 E.01783
G1 X135.367 Y115.002 E1.15531
G2 X135.025 Y114.785 I-2.102 J2.933 E.01801
G1 X116.785 Y133.025 E1.14744
G3 X116.572 Y132.679 I2.974 J-2.066 E.01807
G1 X134.681 Y114.571 E1.13915
G1 X134.32 Y114.373 E.0183
G1 X116.373 Y132.321 E1.12902
G3 X116.18 Y131.954 I3.163 J-1.897 E.01841
G1 X133.956 Y114.179 E1.1182
G1 X133.578 Y113.998 E.01863
G1 X115.998 Y131.578 E1.1059
G3 X115.827 Y131.191 I3.366 J-1.716 E.01885
G1 X133.191 Y113.826 E1.09237
G1 X132.795 Y113.663 E.01904
G1 X115.662 Y130.797 E1.07782
G3 X115.514 Y130.386 I3.586 J-1.52 E.01943
G1 X132.386 Y113.514 E1.06134
G2 X131.971 Y113.371 I-1.483 J3.627 E.01955
G1 X115.373 Y129.969 E1.04413
G1 X115.247 Y129.536 E.02004
G1 X131.536 Y113.247 E1.02471
G2 X131.093 Y113.132 I-1.252 J3.886 E.02037
G1 X115.132 Y129.092 E1.00403
G3 X115.036 Y128.63 I5.434 J-1.377 E.021
G1 X130.637 Y113.029 E.98142
G2 X130.163 Y112.944 I-.99 J4.178 E.02143
G1 X114.948 Y128.16 E.95715
G3 X114.872 Y127.677 I3.404 J-.778 E.02177
G1 X129.676 Y112.873 E.93125
G1 X129.166 Y112.824 E.02279
G1 X114.814 Y127.176 E.90282
G3 X114.782 Y126.65 I4.666 J-.552 E.02346
G1 X128.649 Y112.782 E.87236
G2 X128.107 Y112.766 I-.416 J4.821 E.02415
G1 X114.767 Y126.106 E.83919
G3 X114.772 Y125.542 I5.024 J-.234 E.0251
G1 X127.544 Y112.77 E.80344
G1 X126.95 Y112.805 E.02646
G1 X114.803 Y124.952 E.76412
G3 X114.871 Y124.326 I5.602 J.285 E.02801
G1 X126.325 Y112.872 E.72057
G2 X125.665 Y112.974 I.578 J5.933 E.02975
G1 X114.973 Y123.665 E.67257
G3 X115.12 Y122.96 I6.351 J.952 E.03205
G1 X124.96 Y113.12 E.61901
G2 X124.197 Y113.324 I1.434 J6.891 E.03513
G1 X115.323 Y122.198 E.55825
G3 X115.602 Y121.361 I7.598 J2.066 E.0393
G1 X123.358 Y113.605 E.48789
G2 X122.392 Y114.012 I5.78 J15.065 E.04661
G1 X116.014 Y120.39 E.40125
G3 X116.643 Y119.202 I13.292 J6.281 E.05982
G1 X121.208 Y114.637 E.28718
G2 X118.91 Y116.377 I9.466 J14.893 E.12836
G1 X117.121 Y118.166 E.11255
; CHANGE_LAYER
; Z_HEIGHT: 7.48
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X118.535 Y116.752 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 27/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z7.6 I-.999 J.695 P1  F30000
G1 X133.622 Y138.46 Z7.6
G1 Z7.48
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X128.352 Y112.332 I-5.617 J-12.462 E2.1831
G1 X129.107 Y112.373 E.03364
G3 X133.677 Y138.435 I-1.101 J13.625 E1.60107
G1 X133.784 Y138.801 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.776 Y138.802 E.0003
G3 X128.361 Y111.958 I-5.771 J-12.804 E2.07041
G1 X129.137 Y111.999 E.03191
G3 X134.476 Y138.463 I-1.131 J13.999 E1.48905
G1 X133.838 Y138.775 E.02916
M204 S10000
; WIPE_START
G1 F24000
G1 X133.776 Y138.802 E-.02541
G1 X133.05 Y139.108 E-.2994
G1 X132.308 Y139.371 E-.29942
G1 X131.965 Y139.471 E-.13577
; WIPE_END
G1 E-.04 F1800
G1 X124.815 Y136.799 Z7.88 F30000
G1 X117.037 Y133.893 Z7.88
G1 Z7.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X118.588 Y135.444 E.09757
G2 X121.124 Y137.426 I9.488 J-9.53 E.14351
G1 X116.569 Y132.871 E.28654
G3 X115.939 Y131.686 I14.291 J-8.363 E.05972
G1 X122.313 Y138.06 E.40097
G2 X123.285 Y138.477 I8.594 J-18.669 E.04707
G1 X115.526 Y130.718 E.48809
G3 X115.243 Y129.881 I7.317 J-2.939 E.03935
G1 X124.12 Y138.758 E.55844
G2 X124.882 Y138.965 I2.199 J-6.587 E.03512
G1 X115.036 Y129.119 E.61936
G3 X114.886 Y128.415 I6.196 J-1.685 E.03205
G1 X125.586 Y139.115 E.6731
G2 X126.247 Y139.221 I1.275 J-5.828 E.02978
G1 X114.781 Y127.755 E.72131
G3 X114.71 Y127.13 I5.532 J-.941 E.028
G1 X126.87 Y139.289 E.76492
G2 X127.459 Y139.323 I.598 J-5.224 E.02624
G1 X114.675 Y126.54 E.80415
G3 X114.667 Y125.977 I5.011 J-.36 E.02507
G1 X128.023 Y139.333 E.84022
G2 X128.567 Y139.323 I.181 J-4.851 E.02423
G1 X114.678 Y125.434 E.87374
G3 X114.707 Y124.908 I4.7 J-.008 E.02344
G1 X129.091 Y139.292 E.90488
G2 X129.592 Y139.238 I-.23 J-4.485 E.02241
G1 X114.761 Y124.408 E.93293
G3 X114.829 Y123.921 I4.368 J.361 E.02187
G1 X130.08 Y139.172 E.95936
M73 P49 R11
G1 X130.552 Y139.09 E.02134
G1 X114.909 Y123.446 E.98411
G3 X115.01 Y122.993 I4.084 J.677 E.02066
G1 X131.007 Y138.99 E1.00633
G2 X131.453 Y138.882 I-.741 J-4.029 E.02044
G1 X115.12 Y122.548 E1.0275
G1 X115.243 Y122.117 E.01996
G1 X131.883 Y138.756 E1.04676
G2 X132.302 Y138.621 I-.995 J-3.8 E.01961
G1 X115.38 Y121.698 E1.06455
G1 X115.522 Y121.286 E.01939
G1 X132.712 Y138.476 E1.08135
G2 X133.107 Y138.317 I-1.223 J-3.595 E.01896
G1 X115.683 Y120.893 E1.09606
G3 X115.849 Y120.504 I3.547 J1.279 E.01882
G1 X133.497 Y138.153 E1.11022
G1 X133.871 Y137.971 E.01846
G1 X116.028 Y120.129 E1.12242
G3 X116.215 Y119.761 I3.369 J1.478 E.01836
G1 X134.24 Y137.786 E1.1339
G1 X134.596 Y137.588 E.01814
G1 X116.411 Y119.403 E1.14396
G3 X116.618 Y119.055 I3.203 J1.664 E.01801
G1 X134.946 Y137.383 E1.15299
G1 X135.286 Y137.168 E.01788
G1 X116.831 Y118.713 E1.16095
G3 X117.056 Y118.384 I3.046 J1.839 E.01776
G1 X135.617 Y136.945 E1.16762
G1 X135.941 Y136.714 E.01768
G1 X117.285 Y118.058 E1.17355
G3 X117.528 Y117.747 I2.897 J2.008 E.01759
G1 X136.254 Y136.472 E1.17797
G1 X136.561 Y136.225 E.01755
G1 X117.773 Y117.437 E1.1819
G3 X118.034 Y117.143 I2.749 J2.169 E.01749
G1 X136.857 Y135.966 E1.18414
G1 X137.149 Y135.704 E.01747
G1 X118.295 Y116.85 E1.18604
G1 X118.572 Y116.572 E.01744
G1 X137.428 Y135.428 E1.18619
G1 X137.704 Y135.15 E.01744
G1 X118.851 Y116.296 E1.18604
G1 X119.143 Y116.034 E.01747
G1 X137.966 Y134.857 E1.18414
G2 X138.227 Y134.563 I-2.491 J-2.465 E.01749
G1 X119.439 Y115.775 E1.1819
G1 X119.746 Y115.528 E.01755
G1 X138.472 Y134.253 E1.17797
G2 X138.715 Y133.942 I-2.653 J-2.319 E.01759
G1 X120.059 Y115.287 E1.17355
G1 X120.383 Y115.055 E.01768
G1 X138.944 Y133.617 E1.16762
G2 X139.169 Y133.287 I-2.865 J-2.193 E.01776
G1 X120.714 Y114.832 E1.16093
G1 X121.054 Y114.617 E.01788
G1 X139.382 Y132.945 E1.15298
G2 X139.589 Y132.597 I-2.954 J-1.988 E.01801
G1 X121.403 Y114.412 E1.14397
G1 X121.76 Y114.214 E.01814
G1 X139.785 Y132.239 E1.13392
G2 X139.972 Y131.871 I-3.182 J-1.846 E.01836
G1 X122.129 Y114.029 E1.12242
G1 X122.503 Y113.847 E.01846
G1 X140.151 Y131.496 E1.11022
G2 X140.317 Y131.107 I-3.381 J-1.668 E.01882
G1 X122.893 Y113.683 E1.09606
G3 X123.288 Y113.524 I1.619 J3.437 E.01896
G1 X140.478 Y130.714 E1.08135
G1 X140.62 Y130.302 E.01939
G1 X123.698 Y113.379 E1.06455
G3 X124.117 Y113.244 I1.415 J3.665 E.01961
G1 X140.757 Y129.884 E1.04676
G1 X140.88 Y129.452 E.01996
G1 X124.546 Y113.119 E1.0275
G3 X124.993 Y113.01 I1.187 J3.92 E.02044
G1 X140.99 Y129.007 E1.00633
G2 X141.091 Y128.554 I-3.984 J-1.131 E.02066
G1 X125.447 Y112.91 E.98412
G1 X125.92 Y112.828 E.02134
G1 X141.171 Y128.079 E.95936
G2 X141.239 Y127.592 I-4.299 J-.848 E.02187
G1 X126.408 Y112.762 E.93293
G3 X126.909 Y112.708 I.731 J4.43 E.02241
G1 X141.293 Y127.092 E.90488
G2 X141.322 Y126.566 I-4.667 J-.518 E.02344
G1 X127.432 Y112.677 E.87375
G3 X127.977 Y112.667 I.359 J4.779 E.02425
G1 X141.333 Y126.023 E.8402
G2 X141.325 Y125.46 I-5.021 J-.204 E.02507
G1 X128.541 Y112.677 E.80416
G3 X129.13 Y112.711 I-.009 J5.255 E.02624
G1 X141.29 Y124.87 E.76493
G2 X141.219 Y124.245 I-5.601 J.316 E.028
G1 X129.753 Y112.779 E.72131
G3 X130.414 Y112.885 I-.615 J5.938 E.02978
G1 X141.114 Y123.585 E.6731
G2 X140.964 Y122.881 I-6.347 J.981 E.03205
G1 X131.118 Y113.035 E.61937
G3 X131.88 Y113.242 I-1.438 J6.794 E.03512
G1 X140.757 Y122.119 E.55845
G2 X140.474 Y121.282 I-7.599 J2.101 E.03935
G1 X132.715 Y113.523 E.48809
G3 X133.687 Y113.94 I-7.619 J19.08 E.04707
G1 X140.061 Y120.314 E.40098
G2 X139.431 Y119.129 I-14.599 J7.006 E.05972
G1 X134.876 Y114.575 E.28653
G1 X135.385 Y114.893 E.02667
G3 X138.963 Y118.107 I-12.175 J17.153 E.21445
; CHANGE_LAYER
; Z_HEIGHT: 7.76
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X137.548 Y116.694 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 28/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z7.88 I-1.198 J-.214 P1  F30000
G1 X133.656 Y138.534 Z7.88
G1 Z7.76
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X120.974 Y114.174 I-5.664 J-12.532 E1.854
G3 X128.622 Y112.264 I7.033 J11.892 E.35559
G3 X133.71 Y138.509 I-.631 J13.738 E1.63147
G1 X133.82 Y138.876 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.809 Y138.875 E.00042
G3 X114.618 Y121.477 I-5.81 J-12.875 E1.34591
G1 X114.618 Y121.477 E0
G3 X128.642 Y111.889 I13.367 J4.502 E.74853
G3 X134.522 Y138.529 I-.642 J14.111 E1.5173
G1 X133.873 Y138.85 E.02972
M204 S10000
; WIPE_START
G1 F24000
G1 X133.809 Y138.875 E-.02613
G1 X133.08 Y139.186 E-.30115
G1 X132.333 Y139.45 E-.30119
G1 X132.001 Y139.547 E-.13153
; WIPE_END
G1 E-.04 F1800
G1 X135.941 Y137.031 Z8.16 F30000
G1 Z7.76
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X139.183 Y133.422 I-14.748 J-16.509 E.21624
G1 X139.5 Y132.914 E.02662
G1 X134.909 Y137.505 E.2888
G3 X133.718 Y138.138 I-8.314 J-14.207 E.06001
G1 X140.136 Y131.719 E.40377
G2 X140.556 Y130.742 I-18.608 J-8.565 E.04732
G1 X132.745 Y138.553 E.49134
G3 X131.903 Y138.837 I-2.955 J-7.359 E.03958
G1 X140.839 Y129.901 E.56215
G2 X141.046 Y129.136 I-6.711 J-2.229 E.03529
G1 X131.137 Y139.045 E.62338
G3 X130.428 Y139.196 I-1.695 J-6.233 E.03224
G1 X141.197 Y128.427 E.67743
G2 X141.304 Y127.762 I-5.864 J-1.282 E.02996
G1 X129.764 Y139.302 E.72592
G3 X129.135 Y139.373 I-.946 J-5.564 E.02817
G1 X141.372 Y127.136 E.7698
G2 X141.406 Y126.543 I-5.257 J-.601 E.0264
G1 X128.542 Y139.408 E.80926
G3 X127.975 Y139.417 I-.361 J-5.04 E.02523
G1 X141.416 Y125.976 E.84554
G2 X141.406 Y125.428 I-4.882 J-.182 E.02438
G1 X127.429 Y139.405 E.87926
G3 X126.9 Y139.376 I-.008 J-4.723 E.02359
G1 X141.375 Y124.901 E.91058
G2 X141.321 Y124.397 I-4.512 J.232 E.02255
G1 X126.397 Y139.321 E.9388
G3 X125.907 Y139.253 I.364 J-4.394 E.022
G1 X141.254 Y123.906 E.96539
G1 X141.171 Y123.431 E.02147
G1 X125.429 Y139.173 E.9903
G3 X124.973 Y139.071 I.682 J-4.111 E.02079
G1 X141.071 Y122.973 E1.01264
G2 X140.962 Y122.524 I-4.053 J.745 E.02057
G1 X124.526 Y138.96 E1.03395
G1 X124.091 Y138.837 E.02009
G1 X140.836 Y122.092 E1.05335
G2 X140.7 Y121.67 I-3.823 J1.002 E.01973
G1 X123.671 Y138.699 E1.07122
G1 X123.256 Y138.555 E.01951
G1 X140.554 Y121.258 E1.08812
G2 X140.393 Y120.861 I-3.618 J1.232 E.01907
G1 X122.861 Y138.393 E1.10291
G3 X122.469 Y138.227 I1.287 J-3.568 E.01893
G1 X140.228 Y120.468 E1.11716
G1 X140.046 Y120.092 E.01857
G1 X122.092 Y138.046 E1.12944
G3 X121.722 Y137.858 I1.487 J-3.389 E.01847
G1 X139.86 Y119.72 E1.14101
G1 X139.66 Y119.362 E.01825
G1 X121.361 Y137.661 E1.15112
G3 X121.011 Y137.453 I1.674 J-3.223 E.01812
G1 X139.454 Y119.01 E1.16019
G1 X139.238 Y118.668 E.01799
G1 X120.667 Y137.239 E1.1682
G3 X120.336 Y137.012 I1.851 J-3.065 E.01787
G1 X139.013 Y118.335 E1.17491
G1 X138.78 Y118.01 E.01779
G1 X120.008 Y136.781 E1.18087
G3 X119.695 Y136.537 I2.02 J-2.914 E.01769
G1 X138.537 Y117.695 E1.18532
G1 X138.289 Y117.385 E.01766
G1 X119.384 Y136.29 E1.18927
G3 X119.088 Y136.028 I2.185 J-2.769 E.01759
G1 X138.029 Y117.087 E1.19152
G1 X137.764 Y116.794 E.01758
G1 X118.793 Y135.765 E1.19344
G1 X118.513 Y135.487 E.01755
G1 X137.487 Y116.513 E1.19359
G1 X137.207 Y116.235 E.01755
G1 X118.236 Y135.206 E1.19344
G1 X117.971 Y134.913 E.01758
G1 X136.912 Y115.972 E1.19152
G2 X136.616 Y115.71 I-2.48 J2.506 E.01759
G1 X117.711 Y134.615 E1.18927
M73 P50 R11
G1 X117.463 Y134.305 E.01766
G1 X136.305 Y115.463 E1.18532
G2 X135.991 Y115.219 I-2.334 J2.67 E.01769
G1 X117.22 Y133.99 E1.18087
G1 X116.987 Y133.665 E.01779
G1 X135.664 Y114.988 E1.17491
G2 X135.333 Y114.761 I-2.182 J2.838 E.01787
G1 X116.762 Y133.332 E1.1682
G1 X116.546 Y132.99 E.01799
G1 X134.989 Y114.547 E1.16019
G2 X134.639 Y114.339 I-2.024 J3.015 E.01812
G1 X116.34 Y132.638 E1.15112
G1 X116.14 Y132.279 E.01825
G1 X134.278 Y114.142 E1.141
G2 X133.908 Y113.954 I-1.857 J3.202 E.01847
G1 X115.954 Y131.908 E1.12944
G1 X115.772 Y131.532 E.01857
G1 X133.531 Y113.773 E1.11715
G2 X133.139 Y113.607 I-1.679 J3.402 E.01893
G1 X115.607 Y131.139 E1.10291
G3 X115.446 Y130.742 I3.458 J-1.629 E.01908
G1 X132.743 Y113.445 E1.08812
G1 X132.329 Y113.301 E.01951
G1 X115.3 Y130.329 E1.07121
G3 X115.164 Y129.908 I3.687 J-1.423 E.01973
G1 X131.901 Y113.171 E1.05287
G1 X131.472 Y113.042 E.01992
G1 X115.038 Y129.476 E1.03381
G3 X114.929 Y129.027 I3.944 J-1.194 E.02057
G1 X131.027 Y112.929 E1.01264
G2 X130.571 Y112.827 I-1.138 J4.008 E.02079
G1 X114.829 Y128.569 E.99029
G1 X114.746 Y128.094 E.02147
G1 X130.093 Y112.747 E.96539
G2 X129.603 Y112.679 I-.854 J4.326 E.022
G1 X114.679 Y127.602 E.9388
G3 X114.625 Y127.099 I4.458 J-.736 E.02255
G1 X129.1 Y112.624 E.91058
G2 X128.569 Y112.597 I-1.731 J28.599 E.02364
G1 X114.594 Y126.572 E.87915
G3 X114.584 Y126.024 I4.87 J-.366 E.02438
G1 X128.018 Y112.59 E.84511
G2 X127.458 Y112.592 I-.266 J3.937 E.02493
G1 X114.594 Y125.456 E.80925
G3 X114.628 Y124.864 I5.291 J.008 E.0264
G1 X126.865 Y112.627 E.76979
G2 X126.236 Y112.698 I.317 J5.636 E.02817
G1 X114.696 Y124.238 E.72591
G3 X114.803 Y123.573 I5.972 J.617 E.02996
G1 X125.572 Y112.804 E.67741
G2 X124.863 Y112.955 I.986 J6.384 E.03224
G1 X114.954 Y122.864 E.62336
G3 X115.161 Y122.099 I6.918 J1.464 E.03529
G1 X124.097 Y113.163 E.56214
G2 X123.254 Y113.447 I2.113 J7.644 E.03958
G1 X115.444 Y121.258 E.49132
G3 X115.864 Y120.28 I19.043 J7.594 E.04732
G1 X122.282 Y113.862 E.40374
G2 X121.091 Y114.495 I7.118 J14.83 E.06001
G1 X116.5 Y119.085 E.28876
G3 X118.236 Y116.792 I12.037 J7.305 E.12814
G1 X120.059 Y114.969 E.11469
; CHANGE_LAYER
; Z_HEIGHT: 8.04
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X118.645 Y116.383 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 29/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z8.16 I-1.008 J.682 P1  F30000
G1 X133.69 Y138.61 Z8.16
G1 Z8.04
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X122.308 Y113.386 I-5.698 J-12.608 E1.9343
G3 X128.909 Y112.195 I5.702 J12.723 E.30131
G3 X133.744 Y138.585 I-.918 J13.806 E1.62876
G1 X133.855 Y138.952 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.844 Y138.952 E.00044
G3 X128.929 Y111.821 I-5.844 J-12.952 E2.11836
G3 X140.5 Y119.243 I-.934 J14.186 E.58911
G1 X140.5 Y119.243 E0
G3 X134.561 Y138.604 I-12.5 J6.757 E.92555
G1 X133.909 Y138.925 E.02986
M204 S10000
; WIPE_START
G1 F24000
G1 X133.844 Y138.952 E-.02656
G1 X133.11 Y139.263 E-.30292
G1 X132.359 Y139.529 E-.30298
G1 X132.036 Y139.623 E-.12754
; WIPE_END
G1 E-.04 F1800
G1 X124.567 Y138.052 Z8.44 F30000
G1 X120 Y137.092 Z8.44
G1 Z8.04
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G3 X116.442 Y132.98 I13.393 J-15.185 E.24259
G1 X121.015 Y137.554 E.28769
G2 X122.209 Y138.195 I7.296 J-12.161 E.06032
G1 X115.804 Y131.79 E.40293
G3 X115.384 Y130.816 I16.872 J-7.859 E.04717
G1 X123.184 Y138.616 E.49067
G2 X124.026 Y138.905 I9.182 J-25.396 E.03961
G1 X115.097 Y129.976 E.56169
G3 X114.887 Y129.212 I6.697 J-2.257 E.03527
G1 X124.79 Y139.115 E.62296
G2 X125.497 Y139.269 I1.723 J-6.219 E.03221
G1 X114.733 Y128.505 E.67712
G3 X114.623 Y127.842 I5.849 J-1.309 E.02992
G1 X126.161 Y139.379 E.72577
G1 X126.782 Y139.447 E.02781
G1 X114.551 Y127.216 E.76943
G3 X114.514 Y126.625 I5.238 J-.626 E.02634
G1 X127.374 Y139.485 E.809
G2 X127.942 Y139.5 I.413 J-5.049 E.02528
G1 X114.5 Y126.059 E.84555
G3 X114.507 Y125.512 I4.869 J-.213 E.02433
G1 X128.49 Y139.494 E.87959
G1 X129.012 Y139.463 E.02328
G1 X114.535 Y124.986 E.9107
G3 X114.586 Y124.484 I4.503 J.199 E.02249
G1 X129.516 Y139.414 E.93924
G2 X130.008 Y139.353 I-.301 J-4.41 E.02206
G1 X114.649 Y123.993 E.96623
G1 X114.728 Y123.519 E.02139
G1 X130.48 Y139.271 E.99093
G2 X130.939 Y139.176 I-.614 J-4.132 E.02084
G1 X114.824 Y123.062 E1.01372
G3 X114.928 Y122.613 I4.051 J.704 E.02052
G1 X131.388 Y139.072 E1.03543
G2 X131.818 Y138.949 I-.887 J-3.889 E.0199
G1 X115.051 Y122.182 E1.05475
G3 X115.182 Y121.76 I3.824 J.958 E.01967
G1 X132.241 Y138.819 E1.07314
G1 X132.65 Y138.674 E.01929
G1 X115.325 Y121.349 E1.08991
G3 X115.48 Y120.951 I3.622 J1.184 E.01902
G1 X133.05 Y138.521 E1.10527
G1 X133.44 Y138.358 E.01882
G1 X115.641 Y120.558 E1.11969
G3 X115.818 Y120.182 I3.439 J1.391 E.01851
G1 X133.818 Y138.182 E1.1323
G1 X134.19 Y138.001 E.01842
G1 X115.999 Y119.809 E1.1444
G1 X116.195 Y119.452 E.01813
G1 X134.548 Y137.805 E1.15456
G2 X134.903 Y137.607 I-1.588 J-3.263 E.0181
G1 X116.394 Y119.098 E1.16433
G1 X116.607 Y118.758 E.01787
G1 X135.242 Y137.393 E1.17228
G2 X135.579 Y137.176 I-1.76 J-3.108 E.01782
G1 X116.825 Y118.422 E1.17975
G1 X117.054 Y118.098 E.01766
G1 X135.902 Y136.946 E1.18567
G2 X136.221 Y136.712 I-1.923 J-2.96 E.01762
G1 X117.29 Y117.78 E1.19094
G1 X117.534 Y117.471 E.01752
G1 X136.528 Y136.465 E1.19486
G2 X136.831 Y136.214 I-2.084 J-2.818 E.01749
G1 X117.787 Y117.17 E1.19799
G1 X118.047 Y116.877 E.01744
G1 X137.122 Y135.952 E1.19995
G2 X137.408 Y135.685 I-2.24 J-2.678 E.01742
G1 X118.316 Y116.593 E1.20099
G1 X118.592 Y116.316 E.01741
G1 X137.684 Y135.407 E1.20099
G2 X137.953 Y135.123 I-2.395 J-2.539 E.01742
G1 X118.878 Y116.048 E1.19995
G1 X119.169 Y115.786 E.01743
G1 X138.213 Y134.83 E1.19799
G2 X138.466 Y134.529 I-2.552 J-2.399 E.01748
G1 X119.472 Y115.535 E1.19486
G1 X119.779 Y115.288 E.01751
G1 X138.71 Y134.22 E1.19094
G2 X138.946 Y133.902 I-2.711 J-2.257 E.01761
G1 X120.098 Y115.054 E1.18567
G1 X120.421 Y114.824 E.01765
G1 X139.175 Y133.578 E1.17975
G2 X139.393 Y133.243 I-2.877 J-2.11 E.0178
G1 X120.758 Y114.607 E1.17228
G1 X121.097 Y114.393 E.01784
G1 X139.606 Y132.902 E1.16434
G2 X139.805 Y132.548 I-3.048 J-1.955 E.01808
G1 X121.452 Y114.195 E1.15456
G3 X121.809 Y113.999 I1.922 J3.085 E.01814
G1 X140.001 Y132.191 E1.1444
G2 X140.182 Y131.818 I-3.232 J-1.792 E.01844
G1 X122.182 Y113.818 E1.13231
G3 X122.56 Y113.642 I1.753 J3.275 E.01854
G1 X140.359 Y131.442 E1.11969
G1 X140.52 Y131.049 E.01886
G1 X122.95 Y113.479 E1.10528
G3 X123.35 Y113.326 I1.569 J3.482 E.01906
G1 X140.675 Y130.651 E1.08991
G1 X140.818 Y130.24 E.01935
G1 X123.759 Y113.181 E1.07314
G3 X124.182 Y113.051 I1.366 J3.707 E.01972
G1 X140.949 Y129.818 E1.05475
G1 X141.072 Y129.387 E.01992
G1 X124.612 Y112.928 E1.03543
G1 X125.061 Y112.824 E.02052
G1 X141.176 Y128.938 E1.01373
G2 X141.272 Y128.481 I-4.021 J-1.086 E.02079
G1 X125.52 Y112.729 E.99093
G1 X125.992 Y112.647 E.0213
G1 X141.351 Y128.007 E.96623
G2 X141.414 Y127.516 I-4.335 J-.805 E.02201
G1 X126.484 Y112.586 E.93924
G3 X126.988 Y112.537 I.689 J4.465 E.02255
G1 X141.465 Y127.014 E.9107
G1 X141.493 Y126.488 E.02341
G1 X127.51 Y112.506 E.87959
G3 X128.058 Y112.5 I.324 J4.876 E.02438
G1 X141.5 Y125.942 E.84556
G2 X141.483 Y125.372 I-4.183 J-.167 E.02536
G1 X128.626 Y112.515 E.80883
G3 X129.226 Y112.562 I-.233 J6.826 E.0268
G1 X141.441 Y124.776 E.76838
G2 X141.377 Y124.158 I-7.03 J.421 E.02764
G1 X129.84 Y112.621 E.72576
G3 X130.503 Y112.731 I-.474 J4.913 E.02993
G1 X141.267 Y123.495 E.67713
G2 X141.113 Y122.788 I-6.372 J1.015 E.0322
G1 X131.21 Y112.885 E.62297
G3 X131.974 Y113.095 I-1.488 J6.901 E.03524
G1 X140.903 Y122.024 E.5617
G2 X140.616 Y121.184 I-7.622 J2.132 E.0395
G1 X132.816 Y113.384 E.49068
M73 P51 R11
G3 X133.79 Y113.805 I-3.263 J8.889 E.04725
G1 X140.188 Y120.203 E.40249
G2 X139.558 Y119.02 I-13.074 J6.201 E.05966
G1 X134.985 Y114.446 E.28772
G1 X135.468 Y114.748 E.02533
G3 X139.089 Y117.997 I-12.293 J17.342 E.21689
; CHANGE_LAYER
; Z_HEIGHT: 8.32
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X137.674 Y116.584 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 30/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z8.44 I-1.198 J-.214 P1  F30000
G1 X133.721 Y138.679 Z8.44
G1 Z8.32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X126.787 Y112.134 I-5.73 J-12.682 E2.15373
G3 X128.384 Y112.087 I1.35 J18.855 E.0711
G3 X133.776 Y138.655 I-.393 J13.91 E1.66184
G1 X133.888 Y139.024 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.877 Y139.025 E.00045
G3 X128.404 Y111.713 I-5.875 J-13.027 E2.10853
G3 X142.242 Y127.204 I-.414 J14.296 E.95455
G1 X142.242 Y127.204 E0
G3 X134.598 Y138.676 I-14.24 J-1.206 E.59059
G1 X133.942 Y138.998 E.03003
M204 S10000
; WIPE_START
G1 F24000
G1 X133.877 Y139.025 E-.02673
G1 X133.139 Y139.338 E-.30464
G1 X132.383 Y139.605 E-.30468
G1 X132.07 Y139.697 E-.12395
; WIPE_END
G1 E-.04 F1800
G1 X136.049 Y137.154 Z8.72 F30000
G1 Z8.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X139.625 Y133.022 I-13.919 J-15.658 E.24377
G1 X135.017 Y137.63 E.28986
G3 X133.821 Y138.27 I-8.05 J-13.614 E.06037
G1 X140.269 Y131.822 E.40561
G2 X140.692 Y130.842 I-8.512 J-4.258 E.0475
G1 X132.842 Y138.692 E.4938
G3 X131.997 Y138.98 I-2.987 J-7.376 E.03972
G1 X140.982 Y129.995 E.56519
G2 X141.193 Y129.227 I-6.733 J-2.264 E.03544
G1 X131.229 Y139.191 E.6268
G3 X130.518 Y139.346 I-1.731 J-6.255 E.03239
G1 X141.348 Y128.516 E.68126
G2 X141.458 Y127.849 I-5.893 J-1.321 E.03011
G1 X129.851 Y139.456 E.73017
G1 X129.224 Y139.527 E.0281
G1 X141.527 Y127.224 E.77396
G2 X141.565 Y126.629 I-5.525 J-.649 E.02651
G1 X128.628 Y139.566 E.81383
G3 X128.058 Y139.58 I-.403 J-5.068 E.02537
G1 X141.58 Y126.057 E.85064
G2 X141.574 Y125.506 I-4.908 J-.225 E.02452
G1 X127.508 Y139.573 E.88487
G1 X126.979 Y139.545 E.02355
G1 X141.543 Y124.981 E.91616
G2 X141.494 Y124.474 I-4.54 J.186 E.02268
G1 X126.474 Y139.494 E.94486
G3 X125.98 Y139.43 I.317 J-4.424 E.02213
G1 X141.432 Y123.979 E.972
G1 X141.35 Y123.504 E.02142
G1 X125.503 Y139.351 E.99685
G3 X125.044 Y139.254 I.633 J-4.142 E.02091
G1 X141.254 Y123.043 E1.01977
G1 X141.15 Y122.591 E.02064
G1 X124.592 Y139.149 E1.0416
G1 X124.159 Y139.026 E.02004
G1 X141.025 Y122.159 E1.06103
G2 X140.895 Y121.733 I-3.859 J.949 E.01983
G1 X123.734 Y138.894 E1.07953
G1 X123.321 Y138.75 E.01946
G1 X140.749 Y121.322 E1.09639
G2 X140.595 Y120.92 I-3.656 J1.176 E.01917
G1 X122.92 Y138.594 E1.11185
G1 X122.526 Y138.432 E.01897
G1 X140.431 Y120.527 E1.12635
G2 X140.254 Y120.147 I-3.472 J1.383 E.01865
G1 X122.147 Y138.254 E1.13903
G3 X121.772 Y138.072 I1.427 J-3.431 E.01855
G1 X140.072 Y119.772 E1.15119
G2 X139.875 Y119.413 I-3.3 J1.574 E.01825
G1 X121.413 Y137.875 E1.16141
G3 X121.057 Y137.674 I1.611 J-3.267 E.01818
G1 X139.676 Y119.056 E1.17125
G1 X139.46 Y118.715 E.01795
G1 X120.714 Y137.46 E1.17924
G3 X120.377 Y137.241 I1.784 J-3.112 E.01791
G1 X139.241 Y118.377 E1.18667
G1 X139.01 Y118.052 E.01776
G1 X120.051 Y137.011 E1.19266
G3 X119.731 Y136.774 I1.95 J-2.964 E.01771
G1 X138.775 Y117.73 E1.198
G1 X138.527 Y117.421 E.01761
G1 X119.42 Y136.528 E1.20194
G3 X119.118 Y136.274 I2.111 J-2.821 E.01758
G1 X138.275 Y117.117 E1.2051
G1 X138.011 Y116.824 E.01753
G1 X118.823 Y136.012 E1.20706
G3 X118.537 Y135.741 I2.269 J-2.68 E.01752
G1 X137.742 Y116.536 E1.20811
G1 X137.463 Y116.259 E.01751
G1 X118.258 Y135.464 E1.20811
G3 X117.989 Y135.176 I2.424 J-2.54 E.01753
G1 X137.177 Y115.988 E1.20706
G1 X136.882 Y115.726 E.01754
G1 X117.725 Y134.883 E1.2051
G3 X117.473 Y134.579 I2.582 J-2.4 E.01759
G1 X136.58 Y115.472 E1.20194
G1 X136.269 Y115.226 E.01762
G1 X117.225 Y134.27 E1.198
G3 X116.99 Y133.949 I2.742 J-2.256 E.01772
G1 X135.949 Y114.989 E1.1927
G1 X135.623 Y114.759 E.01777
G1 X116.758 Y133.624 E1.18675
G3 X116.54 Y133.285 I2.909 J-2.109 E.01793
G1 X135.285 Y114.541 E1.17918
G1 X134.943 Y114.326 E.01796
G1 X116.324 Y132.944 E1.17123
G3 X116.125 Y132.587 I3.083 J-1.954 E.01821
G1 X134.587 Y114.125 E1.16141
G1 X134.228 Y113.928 E.01824
G1 X115.928 Y132.228 E1.15119
G1 X115.746 Y131.853 E.01853
G1 X133.853 Y113.746 E1.13903
G2 X133.474 Y113.568 I-1.777 J3.28 E.01861
G1 X115.569 Y131.473 E1.12635
G1 X115.405 Y131.08 E.01893
G1 X133.08 Y113.406 E1.11184
G2 X132.679 Y113.25 I-1.592 J3.486 E.01913
G1 X115.251 Y130.678 E1.09639
G1 X115.105 Y130.267 E.0194
G1 X132.266 Y113.106 E1.07953
G2 X131.841 Y112.974 I-1.388 J3.715 E.01979
G1 X114.975 Y129.841 E1.06103
G3 X114.85 Y129.409 I3.786 J-1.324 E.02002
G1 X131.408 Y112.851 E1.0416
G2 X130.956 Y112.746 I-1.16 J3.97 E.02064
G1 X114.746 Y128.957 E1.01977
G3 X114.65 Y128.495 I4.06 J-1.08 E.02096
G1 X130.497 Y112.649 E.99685
G1 X130.02 Y112.57 E.02151
G1 X114.568 Y128.021 E.972
G3 X114.507 Y127.525 I4.191 J-.766 E.02223
G1 X129.526 Y112.506 E.9448
G2 X129.021 Y112.455 I-.706 J4.477 E.02262
G1 X114.457 Y127.019 E.91616
G1 X114.426 Y126.494 E.02342
G1 X128.492 Y112.427 E.88487
G2 X127.941 Y112.421 I-.331 J5.134 E.02451
G1 X114.42 Y125.943 E.85058
G3 X114.435 Y125.371 I5.091 J-.157 E.02543
G1 X127.372 Y112.434 E.81388
G2 X126.778 Y112.471 I.036 J5.308 E.02649
G1 X114.473 Y124.776 E.77409
G1 X114.542 Y124.151 E.02797
G1 X126.149 Y112.544 E.73018
G2 X125.482 Y112.654 I.649 J5.994 E.03009
G1 X114.652 Y123.484 E.68125
G3 X114.807 Y122.773 I6.41 J1.021 E.03239
G1 X124.771 Y112.809 E.62679
G2 X124.003 Y113.02 I1.5 J6.946 E.03547
G1 X115.018 Y122.005 E.56518
G3 X115.308 Y121.158 I26.017 J8.442 E.03982
G1 X123.158 Y113.308 E.49379
G2 X122.179 Y113.73 I6.886 J17.315 E.04741
G1 X115.732 Y120.178 E.4056
G3 X116.377 Y118.976 I12.675 J6.03 E.0607
G1 X120.983 Y114.37 E.28974
G2 X118.662 Y116.134 I9.779 J15.273 E.1298
G1 X116.843 Y117.953 E.11444
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X118.257 Y116.539 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 31/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z8.72 I-.998 J.696 P1  F30000
G1 X133.75 Y138.744 Z8.72
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X120.194 Y114.396 I-5.758 J-12.742 E1.85004
G3 X128.67 Y112.036 I7.79 J11.579 E.39817
G3 X133.805 Y138.719 I-.678 J13.966 E1.65713
G1 X133.915 Y139.085 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.904 Y139.086 E.00044
G3 X119.985 Y114.085 I-5.913 J-13.083 E1.75349
G3 X128.69 Y111.662 I7.999 J11.89 E.37747
G3 X134.629 Y138.734 I-.698 J14.341 E1.54004
G1 X133.969 Y139.059 E.0302
M204 S10000
; WIPE_START
G1 F24000
G1 X133.904 Y139.086 E-.02658
G1 X133.163 Y139.4 E-.30604
G1 X132.404 Y139.669 E-.30612
G1 X132.097 Y139.758 E-.12126
; WIPE_END
G1 E-.04 F1800
G1 X124.551 Y138.617 Z9 F30000
G1 X121.39 Y138.139 Z9
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P52 R11
G1 F11541.081
G1 X116.332 Y133.08 E.31819
G3 X115.688 Y131.885 I13.014 J-7.781 E.06041
G1 X122.114 Y138.312 E.40427
G2 X123.09 Y138.736 I4.261 J-8.471 E.04733
G1 X115.261 Y130.907 E.49249
G3 X114.971 Y130.065 I7.345 J-3.001 E.0396
G1 X123.937 Y139.032 E.56405
G2 X124.702 Y139.245 I2.284 J-6.704 E.03535
G1 X114.757 Y129.3 E.62564
G3 X114.599 Y128.591 I6.233 J-1.756 E.03232
G1 X125.411 Y139.403 E.68015
M73 P52 R10
G1 X126.073 Y139.513 E.02984
G1 X114.486 Y127.926 E.72893
G1 X114.413 Y127.302 E.02793
G1 X126.696 Y139.585 E.77268
G2 X127.29 Y139.628 I.678 J-5.269 E.02651
G1 X114.372 Y126.709 E.81267
G3 X114.354 Y126.14 I5.058 J-.442 E.02534
G1 X127.861 Y139.647 E.84966
G1 X128.411 Y139.645 E.02445
G1 X114.356 Y125.591 E.88411
G1 X114.384 Y125.067 E.02333
G1 X128.932 Y139.615 E.91516
G2 X129.439 Y139.571 I-.14 J-4.538 E.02266
G1 X114.43 Y124.561 E.9442
G3 X114.488 Y124.068 I4.423 J.268 E.02212
G1 X129.933 Y139.514 E.97165
G2 X130.404 Y139.433 I-.482 J-4.234 E.02126
G1 X114.566 Y123.595 E.99631
G3 X114.657 Y123.135 I4.145 J.58 E.02089
G1 X130.866 Y139.344 E1.01966
G1 X131.314 Y139.24 E.02044
G1 X114.759 Y122.684 E1.04145
G3 X114.878 Y122.253 I3.904 J.85 E.01994
G1 X131.747 Y139.122 E1.06118
G1 X132.174 Y138.997 E.01978
G1 X115.004 Y121.827 E1.08015
G1 X115.146 Y121.417 E.01928
G1 X132.582 Y138.854 E1.09689
G2 X132.986 Y138.706 I-1.113 J-3.669 E.01913
G1 X115.295 Y121.015 E1.11289
G1 X115.456 Y120.624 E.0188
G1 X133.375 Y138.544 E1.12726
G2 X133.757 Y138.374 I-1.316 J-3.487 E.0186
G1 X115.626 Y120.244 E1.14055
G1 X115.805 Y119.871 E.0184
G1 X134.128 Y138.194 E1.15268
G2 X134.491 Y138.005 I-1.503 J-3.32 E.01819
G1 X115.996 Y119.51 E1.16347
G1 X116.191 Y119.154 E.01807
G1 X134.845 Y137.808 E1.17346
G2 X135.189 Y137.6 I-1.678 J-3.164 E.01787
G1 X116.4 Y118.812 E1.18191
G1 X116.612 Y118.472 E.0178
G1 X135.526 Y137.386 E1.18983
G2 X135.852 Y137.161 I-1.843 J-3.016 E.01764
G1 X116.839 Y118.148 E1.19606
G1 X117.067 Y117.824 E.0176
G1 X136.174 Y136.931 E1.20195
G2 X136.483 Y136.689 I-2.002 J-2.875 E.01748
G1 X117.311 Y117.517 E1.20608
G3 X117.556 Y117.21 I2.855 J2.024 E.01746
G1 X136.789 Y136.444 E1.20993
G2 X137.082 Y136.185 I-2.155 J-2.738 E.01739
G1 X117.815 Y116.918 E1.21204
G3 X118.076 Y116.627 I2.719 J2.177 E.01738
G1 X137.373 Y135.924 E1.2139
G2 X137.649 Y135.649 I-2.306 J-2.602 E.01735
G1 X118.351 Y116.351 E1.21403
G3 X118.627 Y116.076 I2.583 J2.327 E.01735
G1 X137.924 Y135.373 E1.2139
G2 X138.185 Y135.082 I-2.459 J-2.468 E.01738
G1 X118.918 Y115.815 E1.21204
G3 X119.211 Y115.556 I2.448 J2.479 E.01739
G1 X138.444 Y134.79 E1.20993
G2 X138.689 Y134.483 I-2.609 J-2.331 E.01746
G1 X119.517 Y115.311 E1.20608
G3 X119.826 Y115.069 I2.311 J2.633 E.01748
G1 X138.933 Y134.176 E1.20196
G1 X139.161 Y133.852 E.0176
G1 X120.148 Y114.839 E1.19606
G3 X120.474 Y114.614 I2.169 J2.791 E.01764
G1 X139.388 Y133.528 E1.18983
G1 X139.6 Y133.188 E.0178
G1 X120.811 Y114.4 E1.18191
G3 X121.155 Y114.192 I2.022 J2.957 E.01787
G1 X139.809 Y132.846 E1.17346
G1 X140.004 Y132.49 E.01807
G1 X121.509 Y113.995 E1.16347
G3 X121.872 Y113.806 I1.865 J3.13 E.01819
G1 X140.195 Y132.129 E1.15269
G1 X140.374 Y131.756 E.0184
G1 X122.243 Y113.626 E1.14055
G3 X122.625 Y113.456 I1.698 J3.317 E.0186
G1 X140.544 Y131.376 E1.12726
G1 X140.705 Y130.985 E.0188
G1 X123.014 Y113.294 E1.11289
G3 X123.418 Y113.146 I1.517 J3.52 E.01913
G1 X140.854 Y130.583 E1.09689
G1 X140.996 Y130.173 E.01928
G1 X123.826 Y113.003 E1.08015
G1 X124.253 Y112.878 E.01978
G1 X141.122 Y129.747 E1.06118
G2 X141.241 Y129.316 I-3.785 J-1.282 E.01994
G1 X124.686 Y112.76 E1.04146
G1 X125.134 Y112.656 E.02044
G1 X141.343 Y128.865 E1.01966
G2 X141.434 Y128.405 I-4.055 J-1.04 E.02089
G1 X125.596 Y112.567 E.99632
G3 X126.067 Y112.486 I.953 J4.153 E.02126
G1 X141.512 Y127.932 E.97165
G2 X141.57 Y127.439 I-4.366 J-.762 E.02212
G1 X126.561 Y112.429 E.9442
G3 X127.068 Y112.385 I.647 J4.494 E.02266
G1 X141.616 Y126.933 E.91516
G1 X141.644 Y126.409 E.02333
G1 X127.589 Y112.355 E.88411
G1 X128.139 Y112.353 E.02445
G1 X141.646 Y125.86 E.84967
G2 X141.628 Y125.291 I-5.077 J-.127 E.02534
G1 X128.71 Y112.372 E.81267
G3 X129.304 Y112.415 I-.083 J5.311 E.02651
G1 X141.587 Y124.698 E.77268
G1 X141.514 Y124.074 E.02793
G1 X129.927 Y112.487 E.72894
G1 X130.589 Y112.597 E.02984
G1 X141.401 Y123.409 E.68016
G2 X141.243 Y122.7 I-6.39 J1.048 E.03232
G1 X131.298 Y112.755 E.62565
G3 X132.063 Y112.968 I-1.519 J6.918 E.03535
G1 X141.029 Y121.935 E.56406
G2 X140.739 Y121.093 I-7.634 J2.16 E.0396
G1 X132.91 Y113.264 E.4925
G3 X133.886 Y113.688 I-3.286 J8.896 E.04733
G1 X140.312 Y120.115 E.40428
G2 X139.669 Y118.92 I-13.661 J6.587 E.0604
G1 X135.084 Y114.336 E.28838
G1 X135.549 Y114.626 E.02436
G3 X139.199 Y117.899 I-12.416 J17.516 E.21855
; CHANGE_LAYER
; Z_HEIGHT: 8.88
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X137.783 Y116.486 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 32/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z9 I-1.198 J-.215 P1  F30000
G1 X133.777 Y138.803 Z9
G1 Z8.88
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X122.948 Y112.888 I-5.786 J-12.802 E1.99912
G3 X128.956 Y111.985 I5.036 J13.067 E.27242
G3 X133.832 Y138.778 I-.965 J14.016 E1.65239
G1 X133.942 Y139.146 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.932 Y139.146 E.00043
G3 X122.066 Y112.85 I-5.94 J-13.145 E1.8613
G3 X128.976 Y111.61 I5.946 J13.27 E.29111
G3 X134.659 Y138.792 I-.984 J14.391 E1.53561
G1 X133.996 Y139.12 E.03038
M204 S10000
; WIPE_START
G1 F24000
G1 X133.932 Y139.146 E-.02628
G1 X133.187 Y139.462 E-.30746
G1 X132.424 Y139.732 E-.30753
G1 X132.124 Y139.819 E-.11874
; WIPE_END
G1 E-.04 F1800
G1 X136.14 Y137.253 Z9.28 F30000
G1 Z8.88
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X139.525 Y133.433 I-16.466 J-18.002 E.22745
G1 X139.723 Y133.116 E.01666
G1 X135.111 Y137.728 E.29014
G3 X133.919 Y138.366 I-7.27 J-12.145 E.0602
G1 X140.373 Y131.912 E.40602
G2 X140.799 Y130.932 I-8.508 J-4.278 E.04754
G1 X132.929 Y138.802 E.49507
G3 X132.083 Y139.093 I-3.014 J-7.379 E.03978
G1 X141.096 Y130.081 E.56694
G2 X141.31 Y129.312 I-6.736 J-2.294 E.03551
G1 X131.314 Y139.308 E.62881
G3 X130.602 Y139.466 I-1.764 J-6.262 E.03247
G1 X141.469 Y128.6 E.68357
G1 X141.579 Y127.935 E.02999
G1 X129.934 Y139.58 E.73258
G3 X129.311 Y139.65 I-1.071 J-6.796 E.02791
G1 X141.651 Y127.309 E.77632
G2 X141.694 Y126.712 I-5.294 J-.68 E.02664
G1 X128.715 Y139.691 E.81649
G3 X128.14 Y139.712 I-.446 J-4.301 E.02562
G1 X141.713 Y126.139 E.85387
G1 X141.712 Y125.587 E.02457
G1 X127.588 Y139.71 E.88848
G1 X127.062 Y139.682 E.02344
G1 X141.676 Y125.068 E.91935
G2 X141.637 Y124.553 I-5.66 J.173 E.02297
G1 X126.554 Y139.636 E.94885
G3 X126.058 Y139.578 I.27 J-4.445 E.02222
G1 X141.579 Y124.056 E.97643
G2 X141.498 Y123.583 I-4.254 J.484 E.02136
M73 P53 R10
G1 X125.583 Y139.499 E1.00121
G3 X125.12 Y139.408 I.583 J-4.165 E.02099
G1 X141.408 Y123.119 E1.02466
G1 X141.304 Y122.669 E.02054
G1 X124.668 Y139.306 E1.04656
G3 X124.234 Y139.185 I.855 J-3.923 E.02003
G1 X141.186 Y122.234 E1.06638
G1 X141.061 Y121.805 E.01988
G1 X123.806 Y139.059 E1.08544
G1 X123.394 Y138.917 E.01937
G1 X140.916 Y121.395 E1.10225
G2 X140.768 Y120.989 I-3.687 J1.119 E.01922
G1 X122.99 Y138.767 E1.11833
G1 X122.598 Y138.605 E.01889
G1 X140.605 Y120.598 E1.13277
G2 X140.435 Y120.214 I-3.503 J1.323 E.01869
G1 X122.215 Y138.434 E1.14612
G1 X121.84 Y138.255 E.01848
G1 X140.253 Y119.841 E1.15831
G2 X140.063 Y119.477 I-3.336 J1.511 E.01828
G1 X121.478 Y138.063 E1.16915
G1 X121.12 Y137.866 E.01815
G1 X139.865 Y119.122 E1.17919
G2 X139.656 Y118.776 I-3.179 J1.686 E.01796
G1 X120.777 Y137.656 E1.18768
G1 X120.435 Y137.443 E.01789
G1 X139.442 Y118.437 E1.19563
G2 X139.215 Y118.109 I-3.03 J1.851 E.01773
G1 X120.109 Y137.215 E1.2019
G1 X119.784 Y136.986 E.01769
G1 X138.984 Y117.786 E1.20782
G2 X138.741 Y117.475 I-2.889 J2.011 E.01757
G1 X119.475 Y136.741 E1.21196
G3 X119.173 Y136.49 I2.604 J-3.442 E.01751
G1 X138.494 Y117.168 E1.21548
G2 X138.235 Y116.873 I-2.751 J2.166 E.01747
G1 X118.876 Y136.232 E1.21778
G3 X118.581 Y135.973 I1.797 J-2.34 E.01748
G1 X137.972 Y116.582 E1.21982
G2 X137.696 Y116.304 I-2.614 J2.317 E.01744
G1 X118.304 Y135.696 E1.21995
G3 X118.028 Y135.418 I2.338 J-2.595 E.01744
G1 X137.419 Y116.027 E1.21982
G2 X137.126 Y115.765 I-2.479 J2.469 E.01746
G1 X117.765 Y135.127 E1.21795
G3 X117.506 Y134.832 I2.491 J-2.46 E.01747
G1 X136.833 Y115.505 E1.21583
G2 X136.525 Y115.259 I-2.343 J2.624 E.01755
G1 X117.259 Y134.525 E1.21196
G3 X117.016 Y134.214 I2.645 J-2.322 E.01757
G1 X136.216 Y115.014 E1.20782
G1 X135.891 Y114.785 E.01769
G1 X116.785 Y133.891 E1.2019
G3 X116.558 Y133.563 I2.804 J-2.18 E.01773
G1 X135.565 Y114.557 E1.19563
G1 X135.223 Y114.344 E.01789
G1 X116.344 Y133.224 E1.18767
G3 X116.135 Y132.878 I2.97 J-2.031 E.01796
G1 X134.88 Y114.133 E1.17919
G1 X134.522 Y113.937 E.01815
G1 X115.937 Y132.523 E1.16915
G3 X115.751 Y132.154 I3.944 J-2.216 E.01836
G1 X134.16 Y113.745 E1.15803
G1 X133.785 Y113.566 E.01848
G1 X115.567 Y131.784 E1.14603
G3 X115.395 Y131.402 I2.783 J-1.477 E.01866
G1 X133.402 Y113.395 E1.13277
G1 X133.01 Y113.233 E.01889
G1 X115.232 Y131.011 E1.11833
G3 X115.084 Y130.605 I3.537 J-1.524 E.01922
G1 X132.606 Y113.083 E1.10225
G1 X132.194 Y112.941 E.01937
G1 X114.939 Y130.195 E1.08543
G1 X114.814 Y129.766 E.01988
G1 X131.766 Y112.815 E1.06638
G2 X131.332 Y112.694 I-1.288 J3.802 E.02003
G1 X114.696 Y129.331 E1.04656
G1 X114.591 Y128.881 E.02054
G1 X130.88 Y112.592 E1.02466
G2 X130.417 Y112.501 I-1.045 J4.074 E.02099
G1 X114.502 Y128.417 E1.00121
G3 X114.421 Y127.943 I4.17 J-.957 E.02136
G1 X129.942 Y112.422 E.97642
G2 X129.442 Y112.368 I-.654 J3.722 E.02239
G1 X114.363 Y127.447 E.94858
G3 X114.319 Y126.937 I4.516 J-.65 E.02277
G1 X128.938 Y112.318 E.91965
G2 X128.412 Y112.29 I-.572 J5.755 E.02343
G1 X114.288 Y126.413 E.88847
G1 X114.287 Y125.861 E.02457
G1 X127.86 Y112.288 E.85387
G2 X127.288 Y112.305 I-.128 J5.1 E.02546
G1 X114.306 Y125.288 E.8167
G3 X114.349 Y124.691 I5.336 J.083 E.02664
G1 X126.693 Y112.347 E.77653
G1 X126.066 Y112.42 E.02806
G1 X114.421 Y124.065 E.73258
G1 X114.531 Y123.4 E.02999
G1 X125.398 Y112.534 E.68356
G2 X124.685 Y112.692 I1.052 J6.42 E.03247
G1 X114.69 Y122.688 E.62881
G3 X114.914 Y121.909 I14.839 J3.853 E.03603
G1 X123.916 Y112.907 E.56633
G2 X123.071 Y113.198 I2.169 J7.67 E.03978
G1 X115.202 Y121.068 E.49506
G3 X115.627 Y120.088 I8.935 J3.299 E.04754
G1 X122.089 Y113.627 E.40647
G2 X120.889 Y114.272 I6.649 J13.791 E.06064
G1 X116.277 Y118.884 E.29012
G3 X118.332 Y116.275 I11.79 J7.172 E.14808
G1 X119.86 Y114.747 E.09614
; CHANGE_LAYER
; Z_HEIGHT: 9.16
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X118.446 Y116.161 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 33/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z9.28 I-1.008 J.682 P1  F30000
G1 X133.802 Y138.859 Z9.28
G1 Z9.16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X125.203 Y112.166 I-5.81 J-12.86 E2.1135
G3 X128.419 Y111.894 I2.853 J14.591 E.14384
G3 X133.857 Y138.835 I-.427 J14.105 E1.68399
G1 X133.966 Y139.203 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.956 Y139.2 E.00043
G3 X125.129 Y111.798 I-5.965 J-13.201 E2.00272
G3 X128.439 Y111.52 I2.925 J14.952 E.13666
G3 X134.687 Y138.845 I-.448 J14.479 E1.56442
G1 X134.02 Y139.176 E.03057
M204 S10000
; WIPE_START
G1 F24000
G1 X133.956 Y139.2 E-.02584
G1 X133.209 Y139.52 E-.30876
G1 X132.443 Y139.791 E-.30884
G1 X132.148 Y139.877 E-.11656
; WIPE_END
G1 E-.04 F1800
G1 X124.988 Y137.235 Z9.56 F30000
G1 X116.697 Y134.176 Z9.56
G1 Z9.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X120.852 Y137.775 I16.012 J-14.29 E.24519
G1 X116.218 Y133.14 E.29154
G3 X115.57 Y131.936 I13.267 J-7.913 E.06085
G1 X122.063 Y138.43 E.4085
G2 X123.047 Y138.857 I4.296 J-8.545 E.04773
G1 X115.14 Y130.949 E.49744
G3 X114.847 Y130.1 I7.409 J-3.026 E.03995
G1 X123.902 Y139.155 E.56961
G2 X124.674 Y139.371 I2.303 J-6.765 E.03566
G1 X114.633 Y129.329 E.63167
G3 X114.473 Y128.613 I6.843 J-1.902 E.03266
G1 X125.389 Y139.529 E.68673
G1 X126.057 Y139.641 E.03012
G1 X114.358 Y127.942 E.73595
G1 X114.285 Y127.312 E.02819
G1 X126.686 Y139.713 E.78009
G2 X127.286 Y139.756 I.683 J-5.316 E.02675
G1 X114.244 Y126.714 E.82044
G3 X114.226 Y126.14 I5.105 J-.445 E.02557
G1 X127.861 Y139.775 E.85776
G1 X128.416 Y139.773 E.02468
G1 X114.228 Y125.585 E.89252
G1 X114.256 Y125.057 E.02354
G1 X128.942 Y139.743 E.92385
G2 X129.454 Y139.698 I-.142 J-4.58 E.02287
G1 X114.302 Y124.546 E.95315
G3 X114.361 Y124.048 I4.465 J.271 E.02232
G1 X129.953 Y139.64 E.98085
G2 X130.428 Y139.559 I-.486 J-4.269 E.02146
G1 X114.44 Y123.571 E1.00574
G3 X114.532 Y123.107 I4.183 J.586 E.02108
G1 X130.892 Y139.466 E1.02915
G1 X131.346 Y139.364 E.02069
G1 X114.634 Y122.652 E1.05126
G3 X114.755 Y122.217 I3.94 J.859 E.02012
G1 X131.784 Y139.245 E1.0712
G1 X132.214 Y139.119 E.01997
G1 X114.882 Y121.787 E1.09034
G1 X115.025 Y121.373 E.01946
G1 X132.626 Y138.974 E1.10723
G2 X133.034 Y138.825 I-1.124 J-3.702 E.01931
G1 X115.176 Y120.968 E1.12338
G1 X115.338 Y120.573 E.01897
G1 X133.426 Y138.661 E1.13788
G2 X133.812 Y138.49 I-1.329 J-3.519 E.01877
G1 X115.51 Y120.189 E1.15129
G1 X115.69 Y119.812 E.01857
G1 X134.186 Y138.309 E1.16354
G2 X134.552 Y138.118 I-1.517 J-3.35 E.01836
G1 X115.883 Y119.449 E1.17442
G1 X116.08 Y119.089 E.01823
G1 X134.91 Y137.919 E1.1845
G2 X135.256 Y137.709 I-1.693 J-3.193 E.01804
G1 X116.293 Y118.745 E1.19295
G1 X116.508 Y118.404 E.01795
G1 X135.597 Y137.493 E1.20087
G2 X135.926 Y137.266 I-1.86 J-3.044 E.0178
G1 X116.734 Y118.074 E1.20731
G1 X116.965 Y117.747 E.01777
G1 X136.251 Y137.034 E1.21326
G2 X136.563 Y136.789 I-2.02 J-2.901 E.01764
G1 X117.211 Y117.437 E1.21741
G3 X117.458 Y117.127 I2.879 J2.042 E.01763
M73 P54 R10
G1 X136.872 Y136.542 E1.22131
G2 X137.168 Y136.281 I-2.175 J-2.763 E.01755
G1 X117.719 Y116.832 E1.22344
G3 X117.982 Y116.539 I2.744 J2.198 E.01754
G1 X137.461 Y136.017 E1.22532
G2 X137.74 Y135.74 I-2.327 J-2.625 E.01751
G1 X118.26 Y116.26 E1.22544
G3 X118.539 Y115.983 I2.607 J2.349 E.01751
G1 X138.017 Y135.461 E1.22532
G2 X138.281 Y135.168 I-2.48 J-2.49 E.01754
G1 X118.832 Y115.719 E1.22344
G3 X119.128 Y115.458 I2.471 J2.502 E.01755
G1 X138.542 Y134.873 E1.22131
G2 X138.789 Y134.563 I-2.632 J-2.351 E.01763
G1 X119.437 Y115.211 E1.21742
G3 X119.749 Y114.966 I2.332 J2.656 E.01764
G1 X139.035 Y134.253 E1.21326
G1 X139.265 Y133.926 E.01777
G1 X120.073 Y114.734 E1.20731
G3 X120.403 Y114.507 I2.189 J2.817 E.0178
G1 X139.495 Y133.599 E1.20102
G1 X139.708 Y133.256 E.01797
G1 X120.743 Y114.291 E1.19303
G3 X121.09 Y114.081 I2.04 J2.983 E.01804
G1 X139.92 Y132.911 E1.1845
G1 X140.117 Y132.552 E.01823
G1 X121.448 Y113.882 E1.17442
G3 X121.813 Y113.691 I1.883 J3.16 E.01836
G1 X140.31 Y132.188 E1.16354
G1 X140.49 Y131.811 E.01857
G1 X122.188 Y113.51 E1.15129
G3 X122.574 Y113.339 I1.714 J3.348 E.01877
G1 X140.662 Y131.427 E1.13788
G1 X140.824 Y131.032 E.01897
G1 X122.966 Y113.175 E1.12338
G3 X123.374 Y113.026 I1.531 J3.553 E.01931
G1 X140.975 Y130.627 E1.10723
G1 X141.118 Y130.213 E.01946
G1 X123.785 Y112.881 E1.09034
G1 X124.216 Y112.755 E.01997
G1 X141.245 Y129.783 E1.0712
G2 X141.366 Y129.348 I-3.82 J-1.295 E.02012
G1 X124.654 Y112.636 E1.0513
G1 X125.106 Y112.531 E.02063
G1 X141.468 Y128.893 E1.0293
G2 X141.56 Y128.429 I-4.091 J-1.05 E.02108
G1 X125.572 Y112.441 E1.00575
G3 X126.047 Y112.36 I.962 J4.191 E.02146
G1 X141.639 Y127.952 E.98086
G2 X141.698 Y127.454 I-4.405 J-.769 E.02232
G1 X126.546 Y112.302 E.95316
G3 X127.058 Y112.257 I.654 J4.535 E.02287
G1 X141.744 Y126.943 E.92386
G1 X141.772 Y126.415 E.02354
G1 X127.584 Y112.227 E.89252
G1 X128.141 Y112.228 E.02479
G1 X141.774 Y125.861 E.85761
G2 X141.756 Y125.286 I-5.123 J-.129 E.02557
G1 X128.714 Y112.244 E.82045
G3 X129.314 Y112.287 I-.083 J5.359 E.02675
G1 X141.715 Y124.688 E.7801
G1 X141.642 Y124.058 E.02819
G1 X129.942 Y112.359 E.73596
G1 X130.61 Y112.471 E.03012
G1 X141.527 Y123.387 E.68674
G2 X141.367 Y122.671 I-7.001 J1.185 E.03266
G1 X131.326 Y112.629 E.63169
G3 X132.098 Y112.845 I-1.531 J6.978 E.03566
G1 X141.153 Y121.9 E.56962
G2 X140.86 Y121.051 I-7.702 J2.177 E.03995
G1 X132.953 Y113.143 E.49746
G3 X133.936 Y113.57 I-3.312 J8.972 E.04773
G1 X140.43 Y120.064 E.40852
G2 X139.783 Y118.86 I-13.924 J6.713 E.06085
G1 X135.144 Y114.222 E.29177
G3 X139.298 Y117.819 I-11.757 J17.772 E.24507
; CHANGE_LAYER
; Z_HEIGHT: 9.44
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X137.864 Y116.424 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 34/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z9.56 I-1.198 J-.215 P1  F30000
G1 X133.823 Y138.906 Z9.56
G1 Z9.44
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X120.094 Y114.248 I-5.832 J-12.904 E1.87363
G3 X128.704 Y111.859 I7.89 J11.727 E.4044
G3 X133.878 Y138.881 I-.713 J14.143 E1.67714
G1 X133.985 Y139.25 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.978 Y139.248 E.00031
G3 X119.885 Y113.936 I-5.987 J-13.246 E1.77531
G3 X128.724 Y111.485 I8.099 J12.038 E.38322
G3 X134.711 Y138.892 I-.733 J14.518 E1.55812
G1 X134.039 Y139.223 E.03077
M204 S10000
; WIPE_START
G1 F24000
G1 X133.978 Y139.248 E-.02513
G1 X133.227 Y139.567 E-.30985
G1 X132.458 Y139.839 E-.30991
G1 X132.168 Y139.923 E-.11511
; WIPE_END
G1 E-.04 F1800
G1 X136.205 Y137.344 Z9.84 F30000
G1 Z9.44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X139.523 Y133.648 I-15.124 J-16.914 E.22141
G1 X139.823 Y133.168 E.02516
G1 X135.163 Y137.827 E.2931
G3 X133.956 Y138.477 I-7.969 J-13.376 E.06102
G1 X140.476 Y131.956 E.41018
G2 X140.905 Y130.969 I-8.573 J-4.309 E.04789
G1 X132.966 Y138.908 E.4994
G3 X132.114 Y139.201 I-3.036 J-7.436 E.04009
G1 X141.204 Y130.111 E.5718
G2 X141.42 Y129.337 I-6.79 J-2.311 E.03579
G1 X131.339 Y139.417 E.63414
G3 X130.621 Y139.577 I-1.776 J-6.31 E.03272
G1 X141.579 Y128.619 E.68932
G1 X141.691 Y127.949 E.03023
G1 X129.948 Y139.692 E.73872
G1 X129.316 Y139.765 E.02829
G1 X141.763 Y127.318 E.78301
G2 X141.806 Y126.716 I-5.336 J-.685 E.02685
G1 X128.716 Y139.807 E.82349
G3 X128.139 Y139.824 I-.447 J-5.122 E.02566
G1 X141.825 Y126.138 E.86095
G1 X141.824 Y125.582 E.02477
G1 X127.583 Y139.822 E.89583
G1 X127.053 Y139.794 E.02363
G1 X141.793 Y125.054 E.92727
G2 X141.748 Y124.54 I-4.596 J.142 E.02295
G1 X126.54 Y139.748 E.95667
G3 X126.041 Y139.689 I.272 J-4.48 E.0224
G1 X141.69 Y124.039 E.98447
G2 X141.608 Y123.563 I-4.286 J.489 E.02153
G1 X125.562 Y139.609 E1.00945
G3 X125.096 Y139.517 I.588 J-4.198 E.02116
G1 X141.518 Y123.095 E1.03308
G1 X141.413 Y122.641 E.02071
G1 X124.64 Y139.414 E1.05516
G3 X124.202 Y139.293 I.862 J-3.954 E.02019
G1 X141.293 Y122.202 E1.07513
G1 X141.167 Y121.77 E.02004
G1 X123.771 Y139.166 E1.09434
G1 X123.356 Y139.022 E.01953
G1 X141.022 Y121.357 E1.11129
G2 X140.872 Y120.948 I-3.717 J1.129 E.01938
G1 X122.949 Y138.871 E1.12749
G1 X122.553 Y138.708 E.01904
G1 X140.707 Y120.554 E1.14205
G2 X140.536 Y120.167 I-3.531 J1.333 E.01884
G1 X122.168 Y138.535 E1.1555
G1 X121.79 Y138.354 E.01863
G1 X140.353 Y119.791 E1.1678
G2 X140.162 Y119.424 I-3.363 J1.523 E.01842
G1 X121.424 Y138.161 E1.17871
G1 X121.064 Y137.963 E.0183
G1 X139.962 Y119.065 E1.18884
G2 X139.752 Y118.717 I-3.204 J1.699 E.0181
G1 X120.717 Y137.751 E1.19739
G1 X120.373 Y137.537 E.01803
G1 X139.535 Y118.375 E1.20541
G2 X139.307 Y118.044 I-3.055 J1.867 E.01787
G1 X120.045 Y137.307 E1.21172
G1 X119.717 Y137.076 E.01783
G1 X139.074 Y117.719 E1.21769
G2 X138.829 Y117.405 I-2.912 J2.027 E.01771
G1 X119.405 Y136.829 E1.22186
G3 X119.095 Y136.581 I2.05 J-2.89 E.01769
G1 X138.58 Y117.095 E1.22577
G2 X138.318 Y116.799 I-2.773 J2.183 E.01761
G1 X118.799 Y136.318 E1.22791
G3 X118.504 Y136.054 I2.206 J-2.754 E.0176
G1 X138.054 Y116.505 E1.22979
G2 X137.776 Y116.224 I-2.635 J2.336 E.01758
G1 X118.224 Y135.776 E1.22992
G3 X117.946 Y135.495 I2.356 J-2.616 E.01758
G1 X137.496 Y115.946 E1.22979
G2 X137.201 Y115.682 I-2.5 J2.49 E.0176
G1 X117.682 Y135.201 E1.22791
G3 X117.42 Y134.904 I2.511 J-2.48 E.01761
G1 X136.905 Y115.419 E1.22577
G2 X136.594 Y115.171 I-2.362 J2.644 E.01769
G1 X117.171 Y134.595 E1.22186
G3 X116.926 Y134.281 I2.666 J-2.34 E.01771
G1 X136.283 Y114.924 E1.21769
G1 X135.955 Y114.693 E.01783
G1 X116.693 Y133.956 E1.21172
G3 X116.465 Y133.625 I2.827 J-2.197 E.01787
G1 X135.627 Y114.463 E1.20541
G1 X135.283 Y114.249 E.01803
G1 X116.248 Y133.283 E1.19739
G3 X116.038 Y132.935 I2.994 J-2.048 E.0181
G1 X134.936 Y114.037 E1.18884
G1 X134.576 Y113.839 E.0183
G1 X115.838 Y132.576 E1.17871
G3 X115.647 Y132.209 I3.171 J-1.89 E.01842
G1 X134.21 Y113.646 E1.16779
G1 X133.832 Y113.465 E.01863
G1 X115.464 Y131.833 E1.1555
G3 X115.293 Y131.446 I3.36 J-1.721 E.01884
G1 X133.447 Y113.292 E1.14205
G1 X133.051 Y113.129 E.01904
G1 X115.128 Y131.052 E1.12749
G3 X114.978 Y130.643 I3.566 J-1.537 E.01938
G1 X132.644 Y112.978 E1.11129
G1 X132.229 Y112.834 E.01953
G1 X114.833 Y130.23 E1.09434
G1 X114.707 Y129.798 E.02004
G1 X131.798 Y112.707 E1.07513
G2 X131.36 Y112.586 I-1.299 J3.832 E.02019
G1 X114.587 Y129.359 E1.05516
G1 X114.482 Y128.905 E.02071
G1 X130.904 Y112.483 E1.03308
G2 X130.438 Y112.391 I-1.054 J4.105 E.02116
G1 X114.392 Y128.437 E1.00944
G3 X114.31 Y127.961 I4.207 J-.966 E.02153
G1 X129.959 Y112.311 E.98447
G2 X129.459 Y112.252 I-.772 J4.42 E.0224
G1 X114.252 Y127.46 E.95667
M73 P55 R10
G3 X114.207 Y126.946 I4.551 J-.656 E.02295
G1 X128.947 Y112.206 E.92727
G1 X128.417 Y112.178 E.02363
G1 X114.176 Y126.418 E.89583
G1 X114.175 Y125.862 E.02477
G1 X127.861 Y112.176 E.86094
G2 X127.284 Y112.193 I-.13 J5.14 E.02566
G1 X114.194 Y125.284 E.82349
G3 X114.237 Y124.682 I5.379 J.083 E.02685
G1 X126.684 Y112.235 E.78301
G1 X126.052 Y112.308 E.02829
G1 X114.309 Y124.051 E.73871
G1 X114.421 Y123.381 E.03023
G1 X125.379 Y112.423 E.68931
G2 X124.661 Y112.583 I1.059 J6.47 E.03272
G1 X114.58 Y122.663 E.63413
G3 X114.796 Y121.889 I7.005 J1.536 E.03579
G1 X123.886 Y112.799 E.57179
G2 X123.034 Y113.092 I2.184 J7.73 E.04009
G1 X115.096 Y121.031 E.49939
G3 X115.524 Y120.044 I9.002 J3.322 E.04789
G1 X122.044 Y113.523 E.41017
G2 X120.836 Y114.173 I6.76 J14.022 E.06103
G1 X116.177 Y118.832 E.29309
G3 X117.919 Y116.531 I15.681 J10.064 E.1285
G1 X119.795 Y114.656 E.11798
; CHANGE_LAYER
; Z_HEIGHT: 9.72
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X118.381 Y116.07 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 35/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z9.84 I-1.008 J.681 P1  F30000
G1 X133.844 Y138.951 Z9.84
G1 Z9.72
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X122.889 Y112.736 I-5.852 J-12.951 E2.02219
G3 X128.99 Y111.824 I5.128 J13.434 E.27651
G3 X133.899 Y138.927 I-.998 J14.177 E1.67063
G1 X134.004 Y139.297 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.998 Y139.293 E.00029
G3 X122.755 Y112.386 I-6.007 J-13.293 E1.91586
G3 X129.009 Y111.449 I5.262 J13.786 E.26171
G3 X134.734 Y138.935 I-1.018 J14.551 E1.55195
G1 X134.058 Y139.27 E.03096
M204 S10000
; WIPE_START
G1 F24000
G1 X133.998 Y139.293 E-.02445
G1 X133.245 Y139.614 E-.31091
G1 X132.474 Y139.887 E-.31098
G1 X132.187 Y139.97 E-.11365
; WIPE_END
G1 E-.04 F1800
G1 X124.715 Y138.413 Z10.12 F30000
G1 X119.756 Y137.379 Z10.12
G1 Z9.72
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G3 X116.148 Y133.219 I13.744 J-15.562 E.24564
G1 X120.777 Y137.848 E.29118
G2 X121.986 Y138.504 I7.387 J-12.166 E.06123
G1 X115.503 Y132.021 E.40785
G3 X115.063 Y131.029 I7.34 J-3.844 E.04831
G1 X122.968 Y138.933 E.49724
G2 X123.826 Y139.238 I3.145 J-7.486 E.04052
G1 X114.765 Y130.177 E.56997
G3 X114.546 Y129.406 I6.759 J-2.333 E.03569
G1 X124.597 Y139.456 E.63223
G1 X125.31 Y139.617 E.03252
G1 X114.384 Y128.691 E.68729
G1 X114.269 Y128.023 E.03018
G1 X125.975 Y139.729 E.73641
G2 X126.604 Y139.805 I.993 J-5.562 E.0282
G1 X114.194 Y127.395 E.78069
G3 X114.148 Y126.796 I5.308 J-.709 E.02673
G1 X127.204 Y139.852 E.82133
G2 X127.78 Y139.876 I.497 J-5.119 E.02567
G1 X114.125 Y126.221 E.85897
G1 X114.124 Y125.667 E.02467
G1 X128.331 Y139.874 E.89375
G2 X128.858 Y139.849 I.036 J-4.706 E.02349
G1 X114.151 Y125.141 E.9252
G3 X114.192 Y124.629 I4.576 J.11 E.02285
G1 X129.372 Y139.809 E.9549
G1 X129.867 Y139.752 E.02218
G1 X114.247 Y124.131 E.98263
G3 X114.324 Y123.656 I4.269 J.453 E.02143
G1 X130.344 Y139.676 E1.00775
G2 X130.812 Y139.591 I-.52 J-4.211 E.02117
G1 X114.41 Y123.189 E1.03178
G1 X114.512 Y122.738 E.02057
G1 X131.261 Y139.487 E1.05363
G2 X131.7 Y139.374 I-.788 J-3.969 E.0202
G1 X114.627 Y122.3 E1.07405
G1 X114.749 Y121.87 E.0199
G1 X132.128 Y139.249 E1.09327
G2 X132.543 Y139.111 I-1.026 J-3.758 E.01944
G1 X114.89 Y121.458 E1.11051
G3 X115.034 Y121.049 I3.709 J1.079 E.01928
G1 X132.951 Y138.966 E1.12713
G2 X133.343 Y138.805 I-1.239 J-3.568 E.01885
G1 X115.195 Y120.657 E1.14165
G3 X115.36 Y120.27 I3.529 J1.281 E.01874
G1 X133.731 Y138.641 E1.15567
G1 X134.101 Y138.457 E.01834
G1 X115.539 Y119.896 E1.16765
G3 X115.724 Y119.528 I3.364 J1.467 E.01831
G1 X134.47 Y138.274 E1.17922
G2 X134.828 Y138.079 I-1.906 J-3.932 E.01814
G1 X115.92 Y119.172 E1.18943
G3 X116.124 Y118.823 I3.21 J1.639 E.01799
G1 X135.179 Y137.877 E1.19867
G1 X135.517 Y137.663 E.01782
G1 X116.336 Y118.482 E1.20661
G3 X116.557 Y118.15 I3.063 J1.802 E.01774
G1 X135.851 Y137.444 E1.21368
G1 X136.173 Y137.213 E.01763
G1 X116.786 Y117.826 E1.21959
G3 X117.024 Y117.511 I2.925 J1.958 E.01757
G1 X136.49 Y136.977 E1.22457
G1 X136.797 Y136.731 E.01749
G1 X117.268 Y117.203 E1.22849
G3 X117.522 Y116.904 I2.79 J2.109 E.01745
G1 X137.097 Y136.479 E1.23146
G1 X137.388 Y136.218 E.01741
G1 X117.782 Y116.611 E1.23341
G3 X118.051 Y116.327 I2.658 J2.257 E.0174
G1 X137.673 Y135.95 E1.23439
G1 X137.949 Y135.673 E.01739
G1 X118.326 Y116.05 E1.23439
G3 X118.612 Y115.782 I2.526 J2.404 E.0174
G1 X138.218 Y135.389 E1.23341
G1 X138.478 Y135.097 E.01742
G1 X118.903 Y115.521 E1.23146
G3 X119.203 Y115.269 I2.394 J2.552 E.01746
G1 X138.732 Y134.797 E1.22849
G1 X138.976 Y134.489 E.0175
G1 X119.51 Y115.023 E1.22457
G3 X119.827 Y114.787 I2.259 J2.703 E.01758
G1 X139.214 Y134.174 E1.21959
G1 X139.443 Y133.85 E.01765
G1 X120.149 Y114.556 E1.21368
G3 X120.483 Y114.337 I2.12 J2.859 E.01776
G1 X139.664 Y133.518 E1.20661
G1 X139.876 Y133.178 E.01785
G1 X120.821 Y114.123 E1.19868
G3 X121.172 Y113.921 I1.974 J3.022 E.01801
G1 X140.08 Y132.829 E1.18943
G1 X140.276 Y132.472 E.01811
G1 X121.53 Y113.726 E1.17922
G1 X121.899 Y113.543 E.01834
G1 X140.459 Y132.102 E1.16754
G1 X140.635 Y131.725 E.0185
G1 X122.269 Y113.359 E1.15537
G3 X122.657 Y113.195 I1.445 J2.877 E.01878
G1 X140.805 Y131.343 E1.14165
G1 X140.966 Y130.951 E.01884
G1 X123.049 Y113.034 E1.12714
G1 X123.457 Y112.889 E.01927
G1 X141.11 Y130.543 E1.11051
G2 X141.251 Y130.13 I-3.603 J-1.455 E.01939
G1 X123.871 Y112.751 E1.09327
G1 X124.3 Y112.626 E.01983
G1 X141.373 Y129.7 E1.07405
G2 X141.488 Y129.262 I-3.842 J-1.242 E.02015
G1 X124.739 Y112.513 E1.05363
G3 X125.192 Y112.413 I1.297 J4.795 E.02063
G1 X141.59 Y128.811 E1.03154
G2 X141.676 Y128.344 I-4.111 J-1.001 E.02112
G1 X125.659 Y112.327 E1.00757
G3 X126.133 Y112.248 I.838 J3.57 E.02138
G1 X141.753 Y127.869 E.98264
G1 X141.808 Y127.371 E.02229
G1 X126.628 Y112.191 E.95491
G3 X127.141 Y112.151 I.609 J4.55 E.02291
G1 X141.849 Y126.859 E.92521
G2 X141.876 Y126.333 I-4.661 J-.504 E.02342
G1 X127.669 Y112.126 E.89376
G1 X128.22 Y112.124 E.02451
G1 X141.875 Y125.779 E.85898
G2 X141.852 Y125.204 I-5.131 J-.09 E.02561
G1 X128.796 Y112.148 E.82134
G3 X129.401 Y112.2 I-.261 J6.51 E.02704
G1 X141.806 Y124.605 E.78036
G2 X141.731 Y123.977 I-5.628 J.354 E.02814
G1 X130.025 Y112.271 E.73642
G3 X130.69 Y112.383 I-.667 J5.977 E.03002
G1 X141.616 Y123.309 E.68731
G2 X141.454 Y122.594 I-6.446 J1.085 E.03262
G1 X131.403 Y112.544 E.63225
G3 X132.174 Y112.762 I-1.558 J6.975 E.03565
G1 X141.235 Y121.823 E.57
G2 X140.937 Y120.972 I-28.258 J9.427 E.04012
G1 X133.032 Y113.067 E.49727
G3 X134.013 Y113.496 I-3.327 J8.954 E.04767
G1 X140.505 Y119.987 E.40834
G2 X139.852 Y118.781 I-13.541 J6.552 E.061
G1 X135.222 Y114.152 E.29122
G1 X135.676 Y114.435 E.02376
G3 X139.376 Y117.752 I-12.562 J17.732 E.22154
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X137.96 Y116.339 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 36/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z10.12 I-1.198 J-.217 P1  F30000
G1 X133.861 Y138.99 Z10.12
G1 Z10
M73 P56 R10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X124.395 Y112.204 I-5.869 J-12.991 E2.09943
G3 X128.444 Y111.75 I3.589 J13.73 E.18183
G3 X133.916 Y138.965 I-.451 J14.248 E1.70028
G1 X134.021 Y139.338 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X134.016 Y139.334 E.00025
G3 X119.915 Y113.805 I-6.017 J-13.335 E1.79006
G1 X119.915 Y113.805 E0
G3 X128.463 Y111.376 I8.07 J12.145 E.37077
G3 X134.755 Y138.975 I-.464 J14.623 E1.57979
G1 X134.075 Y139.311 E.03114
M204 S10000
; WIPE_START
G1 F24000
G1 X134.016 Y139.334 E-.02369
G1 X133.261 Y139.655 E-.31188
G1 X132.487 Y139.929 E-.31192
G1 X132.203 Y140.012 E-.11252
; WIPE_END
G1 E-.04 F1800
G1 X136.273 Y137.412 Z10.4 F30000
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X139.602 Y133.7 I-14.427 J-16.288 E.22226
G1 X139.887 Y133.243 E.02395
G1 X135.24 Y137.891 E.29238
G3 X134.031 Y138.545 I-7.798 J-12.965 E.06115
G1 X140.545 Y132.031 E.4098
G2 X140.975 Y131.047 I-8.549 J-4.319 E.04781
G1 X133.043 Y138.979 E.49898
G3 X132.19 Y139.278 I-10.338 J-28.142 E.04023
G1 X141.281 Y130.186 E.57191
G2 X141.5 Y129.413 I-6.773 J-2.334 E.03577
G1 X131.417 Y139.496 E.63429
G1 X130.701 Y139.658 E.03266
G1 X141.661 Y128.698 E.68947
G2 X141.773 Y128.031 I-5.883 J-1.336 E.03011
G1 X130.028 Y139.776 E.73884
G3 X129.399 Y139.851 I-.984 J-5.569 E.02822
G1 X141.85 Y127.4 E.78326
G2 X141.897 Y126.798 I-5.335 J-.722 E.02687
G1 X128.798 Y139.897 E.82401
G3 X128.221 Y139.919 I-.486 J-5.123 E.02569
G1 X141.92 Y126.22 E.86177
G1 X141.919 Y125.667 E.02459
G1 X127.665 Y139.921 E.89666
G3 X127.138 Y139.893 I-.021 J-4.705 E.0235
G1 X141.893 Y125.138 E.92821
G2 X141.853 Y124.623 I-4.602 J.096 E.02298
G1 X126.624 Y139.852 E.958
G1 X126.125 Y139.797 E.02236
G1 X141.796 Y124.126 E.98582
G2 X141.719 Y123.648 I-4.297 J.439 E.02156
G1 X125.65 Y139.717 E1.01087
G3 X125.18 Y139.633 I.598 J-4.69 E.02126
G1 X141.631 Y123.182 E1.03489
G1 X141.529 Y122.729 E.02063
G1 X124.727 Y139.531 E1.05695
G3 X124.288 Y139.416 I.807 J-3.969 E.02021
G1 X141.417 Y122.287 E1.07751
G1 X141.292 Y121.858 E.01989
G1 X123.856 Y139.293 E1.09679
G3 X123.443 Y139.152 I1.046 J-3.756 E.01945
G1 X141.153 Y121.442 E1.11408
G1 X141.008 Y121.033 E.01933
G1 X123.033 Y139.008 E1.13076
G1 X122.64 Y138.846 E.0189
G1 X140.846 Y120.64 E1.14532
G2 X140.682 Y120.25 I-3.556 J1.271 E.01884
G1 X122.251 Y138.68 E1.1594
G1 X121.876 Y138.501 E.0185
G1 X140.5 Y119.877 E1.1716
M73 P56 R9
G2 X140.316 Y119.506 I-3.388 J1.456 E.01841
G1 X121.508 Y138.315 E1.18319
G1 X121.149 Y138.118 E.01817
G1 X140.118 Y119.15 E1.19324
G2 X139.915 Y118.798 I-3.233 J1.628 E.01807
G1 X120.799 Y137.914 E1.20252
G1 X120.458 Y137.701 E.0179
G1 X139.7 Y118.459 E1.21048
G2 X139.48 Y118.124 I-3.089 J1.792 E.01782
G1 X120.125 Y137.479 E1.21757
G1 X119.8 Y137.25 E.0177
G1 X139.249 Y117.801 E1.2235
G2 X139.012 Y117.483 I-2.949 J1.948 E.01764
G1 X119.484 Y137.012 E1.2285
G1 X119.174 Y136.766 E.01756
G1 X138.766 Y117.175 E1.23243
G2 X138.513 Y116.873 I-2.813 J2.099 E.01752
G1 X118.874 Y136.512 E1.2354
G1 X118.581 Y136.251 E.01747
G1 X138.25 Y116.581 E1.23736
G2 X137.982 Y116.296 I-2.681 J2.248 E.01746
G1 X118.296 Y135.981 E1.23835
G1 X118.018 Y135.704 E.01744
G1 X137.704 Y116.019 E1.23835
G2 X137.419 Y115.749 I-2.548 J2.396 E.01746
G1 X117.75 Y135.419 E1.23736
G1 X117.487 Y135.127 E.01747
G1 X137.126 Y115.488 E1.2354
G2 X136.826 Y115.234 I-2.416 J2.544 E.01751
G1 X117.234 Y134.825 E1.23243
G1 X116.987 Y134.517 E.01755
G1 X136.516 Y114.988 E1.2285
G2 X136.2 Y114.75 I-2.28 J2.695 E.01762
G1 X116.751 Y134.199 E1.2235
G1 X116.52 Y133.876 E.01768
G1 X135.875 Y114.521 E1.21757
G2 X135.542 Y114.299 I-2.141 J2.852 E.0178
G1 X116.3 Y133.541 E1.21048
G1 X116.085 Y133.202 E.01788
G1 X135.201 Y114.086 E1.20252
G2 X134.851 Y113.882 I-1.995 J3.015 E.01804
G1 X115.882 Y132.85 E1.19324
G1 X115.684 Y132.494 E.01813
G1 X134.492 Y113.685 E1.18319
G2 X134.124 Y113.499 I-1.84 J3.188 E.01837
G1 X115.5 Y132.123 E1.1716
G1 X115.318 Y131.75 E.01846
G1 X133.749 Y113.32 E1.15939
G2 X133.36 Y113.154 I-1.674 J3.375 E.0188
G1 X115.154 Y131.36 E1.14532
G3 X114.992 Y130.967 I3.417 J-1.635 E.01891
G1 X132.967 Y112.992 E1.13075
G2 X132.557 Y112.848 I-1.493 J3.577 E.01934
G1 X114.847 Y130.558 E1.11408
G3 X114.708 Y130.142 I3.63 J-1.445 E.0195
G1 X132.144 Y112.707 E1.09679
G1 X131.712 Y112.584 E.01996
G1 X114.583 Y129.713 E1.07751
G3 X114.471 Y129.27 I3.524 J-1.131 E.02031
G1 X131.273 Y112.469 E1.05695
G1 X130.82 Y112.367 E.02064
G1 X114.369 Y128.818 E1.03489
G3 X114.281 Y128.352 I4.564 J-1.106 E.02112
G1 X130.352 Y112.28 E1.01101
G2 X129.875 Y112.203 I-.931 J4.203 E.0215
G1 X114.204 Y127.874 E.98581
G1 X114.147 Y127.377 E.02225
G1 X129.376 Y112.148 E.95799
G2 X128.862 Y112.107 I-.624 J4.55 E.02292
G1 X114.107 Y126.862 E.92821
G3 X114.081 Y126.333 I4.696 J-.493 E.02356
G1 X128.331 Y112.084 E.89638
G1 X127.778 Y112.082 E.02461
G1 X114.08 Y125.78 E.86169
G3 X114.103 Y125.202 I5.159 J-.08 E.02575
G1 X127.202 Y112.103 E.82401
G2 X126.601 Y112.149 I.11 J5.37 E.02681
G1 X114.15 Y124.6 E.78325
G3 X114.228 Y123.968 I5.154 J.31 E.02833
G1 X125.972 Y112.224 E.73878
G1 X125.301 Y112.341 E.03027
G1 X114.343 Y123.298 E.68933
G3 X114.5 Y122.587 I7.112 J1.197 E.03243
G1 X124.584 Y112.503 E.63434
G2 X123.81 Y112.722 I1.566 J7 E.03579
G1 X114.719 Y121.813 E.57186
G3 X115.025 Y120.953 I7.803 J2.29 E.04059
G1 X122.957 Y113.021 E.49897
G2 X121.969 Y113.455 I3.364 J9.011 E.04801
G1 X115.455 Y119.969 E.40979
G3 X116.113 Y118.757 I12.878 J6.203 E.06138
G1 X120.76 Y114.109 E.29237
G2 X118.417 Y115.897 I10.863 J16.661 E.13123
G1 X116.585 Y117.73 E.1153
; CHANGE_LAYER
; Z_HEIGHT: 10.28
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X117.999 Y116.316 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 37/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z10.4 I-.997 J.697 P1  F30000
G1 X133.879 Y139.028 Z10.4
G1 Z10.28
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X120.336 Y113.941 I-5.878 J-13.026 E1.90663
G3 X128.728 Y111.731 I7.633 J11.941 E.3923
G3 X133.933 Y139.004 I-.727 J14.272 E1.69252
G1 X134.03 Y139.371 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.272 Y139.684 E.03366
G3 X119.143 Y114.307 I-5.28 J-13.682 E1.72348
G3 X120.136 Y113.625 I6.575 J8.498 E.0495
G1 X120.136 Y113.625 E0
G3 X128.748 Y111.356 I7.832 J12.255 E.37162
G3 X134.081 Y139.344 I-.756 J14.646 E1.60284
M204 S10000
; WIPE_START
G1 F24000
G1 X133.272 Y139.684 E-.33347
G1 X132.498 Y139.962 E-.31263
G1 X132.21 Y140.046 E-.1139
; WIPE_END
G1 E-.04 F1800
G1 X124.738 Y138.49 Z10.68 F30000
G1 X119.71 Y137.443 Z10.68
G1 Z10.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X117.867 Y135.6 E.11593
G3 X116.078 Y133.256 I13.922 J-12.475 E.1313
G1 X120.74 Y137.918 E.29325
M73 P57 R9
G2 X121.955 Y138.577 I7.436 J-12.258 E.06151
G1 X115.423 Y132.045 E.4109
G3 X114.989 Y131.055 I8.598 J-4.361 E.04812
G1 X122.942 Y139.008 E.50029
G2 X123.802 Y139.313 I3.153 J-7.509 E.04065
G1 X114.689 Y130.199 E.57331
G3 X114.47 Y129.424 I6.796 J-2.344 E.03588
G1 X124.579 Y139.533 E.63596
G1 X125.296 Y139.695 E.0327
G1 X114.307 Y128.705 E.69132
G1 X114.19 Y128.033 E.03035
G1 X125.965 Y139.807 E.74071
G2 X126.597 Y139.884 I.997 J-5.591 E.02835
G1 X114.115 Y127.402 E.78523
G3 X114.069 Y126.799 I5.337 J-.712 E.02687
G1 X127.201 Y139.931 E.82608
G2 X127.78 Y139.955 I.499 J-5.147 E.02581
G1 X114.047 Y126.221 E.86393
G1 X114.045 Y125.664 E.0248
G1 X128.334 Y139.953 E.8989
G2 X128.864 Y139.927 I.036 J-4.732 E.02362
G1 X114.072 Y125.135 E.93052
G3 X114.114 Y124.621 I4.601 J.111 E.02297
G1 X129.38 Y139.887 E.96038
G1 X129.878 Y139.83 E.02231
G1 X114.168 Y124.12 E.98827
G3 X114.247 Y123.642 I4.291 J.456 E.02155
G1 X130.358 Y139.753 E1.01352
G2 X130.829 Y139.668 I-2.662 J-16.061 E.02128
G1 X114.333 Y123.173 E1.03768
G1 X114.435 Y122.719 E.02069
G1 X131.28 Y139.564 E1.05965
G2 X131.722 Y139.45 I-.793 J-3.992 E.02031
G1 X114.551 Y122.279 E1.08018
G1 X114.674 Y121.846 E.02001
G1 X132.152 Y139.324 E1.09951
G2 X132.569 Y139.185 I-1.032 J-3.779 E.01955
G1 X114.815 Y121.431 E1.11684
G3 X114.96 Y121.02 I3.731 J1.086 E.01939
G1 X132.98 Y139.04 E1.13356
G2 X133.374 Y138.878 I-1.245 J-3.586 E.01895
G1 X115.122 Y120.626 E1.14815
G3 X115.289 Y120.237 I3.549 J1.289 E.01884
G1 X133.764 Y138.713 E1.16227
G1 X134.139 Y138.531 E.0185
G1 X115.468 Y119.861 E1.1745
G3 X115.655 Y119.491 I3.383 J1.475 E.01842
G1 X134.51 Y138.347 E1.18612
G1 X134.867 Y138.148 E.01818
G1 X115.852 Y119.132 E1.1962
G3 X116.057 Y118.781 I3.227 J1.648 E.01809
G1 X135.22 Y137.945 E1.20549
G1 X135.56 Y137.729 E.01792
G1 X116.27 Y118.439 E1.21347
G3 X116.492 Y118.106 I3.081 J1.812 E.01784
G1 X135.895 Y137.509 E1.22058
G1 X136.22 Y137.277 E.01773
G1 X116.722 Y117.78 E1.22652
G3 X116.961 Y117.463 I2.941 J1.969 E.01766
G1 X136.538 Y137.04 E1.23153
G1 X136.847 Y136.792 E.01759
G1 X117.207 Y117.153 E1.23547
G3 X117.462 Y116.852 I2.805 J2.121 E.01755
G1 X137.149 Y136.539 E1.23846
G1 X137.442 Y136.276 E.01751
G1 X117.723 Y116.557 E1.24042
G3 X117.994 Y116.272 I2.673 J2.27 E.0175
G1 X137.728 Y136.006 E1.24141
G1 X138.006 Y135.728 E.01748
G1 X118.271 Y115.994 E1.24141
G3 X118.558 Y115.724 I2.54 J2.417 E.0175
G1 X138.276 Y135.443 E1.24042
G1 X138.538 Y135.148 E.01751
G1 X118.851 Y115.461 E1.23846
G3 X119.153 Y115.208 I2.407 J2.567 E.01756
G1 X138.793 Y134.848 E1.23548
G1 X139.039 Y134.537 E.0176
G1 X119.462 Y114.96 E1.23154
G3 X119.78 Y114.723 I2.272 J2.718 E.01768
G1 X139.278 Y134.22 E1.22652
G1 X139.508 Y133.894 E.01774
G1 X120.105 Y114.491 E1.22058
G3 X120.44 Y114.271 I2.132 J2.875 E.01786
G1 X139.73 Y133.561 E1.21348
G1 X139.943 Y133.219 E.01795
G1 X120.78 Y114.055 E1.20549
G3 X121.133 Y113.852 I1.986 J3.04 E.01811
G1 X140.148 Y132.868 E1.1962
G1 X140.345 Y132.509 E.01821
G1 X121.49 Y113.653 E1.18612
G3 X121.861 Y113.469 I1.83 J3.211 E.01845
G1 X140.532 Y132.139 E1.1745
G1 X140.711 Y131.763 E.01854
G1 X122.235 Y113.287 E1.16227
G3 X122.626 Y113.122 I1.663 J3.397 E.01888
G1 X140.878 Y131.374 E1.14816
G1 X141.04 Y130.98 E.01895
G1 X123.02 Y112.96 E1.13356
G1 X123.431 Y112.815 E.01938
G1 X141.185 Y130.569 E1.11685
G2 X141.326 Y130.154 I-3.622 J-1.463 E.0195
G1 X123.847 Y112.676 E1.09951
G1 X124.278 Y112.55 E.01994
G1 X141.449 Y129.721 E1.08019
G2 X141.565 Y129.281 I-3.863 J-1.249 E.02026
G1 X124.72 Y112.436 E1.05965
G1 X125.171 Y112.332 E.02061
G1 X141.667 Y128.827 E1.03768
G2 X141.753 Y128.358 I-4.133 J-1.007 E.02123
G1 X125.642 Y112.247 E1.01353
G3 X126.121 Y112.17 I.92 J4.231 E.02161
G1 X141.831 Y127.88 E.98827
G1 X141.886 Y127.379 E.02242
G1 X126.62 Y112.113 E.96039
G3 X127.136 Y112.073 I.613 J4.575 E.02303
G1 X141.928 Y126.865 E.93053
G2 X141.955 Y126.336 I-4.686 J-.508 E.02355
G1 X127.666 Y112.047 E.8989
G1 X128.22 Y112.045 E.02465
G1 X141.953 Y125.779 E.86394
G2 X141.931 Y125.201 I-5.158 J-.091 E.02575
G1 X128.799 Y112.069 E.82609
G3 X129.403 Y112.116 I-.12 J5.395 E.02693
G1 X141.885 Y124.599 E.78523
G2 X141.81 Y123.967 I-5.656 J.355 E.02829
G1 X130.035 Y112.193 E.74072
G3 X130.704 Y112.305 I-.67 J6.011 E.03018
G1 X141.693 Y123.295 E.69133
G2 X141.53 Y122.577 I-6.48 J1.09 E.0328
G1 X131.421 Y112.467 E.63597
G3 X132.196 Y112.686 I-1.565 J7.012 E.03585
G1 X141.311 Y121.801 E.57339
G2 X141.011 Y120.945 I-28.613 J9.54 E.04032
G1 X133.058 Y112.992 E.50031
G3 X134.045 Y113.423 I-3.342 J9 E.04792
G1 X140.577 Y119.955 E.41092
G2 X139.922 Y118.744 I-13.679 J6.618 E.06127
G1 X135.26 Y114.082 E.29329
G3 X139.44 Y117.707 I-12.324 J18.437 E.24675
; CHANGE_LAYER
; Z_HEIGHT: 10.56
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X138.006 Y116.312 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 38/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z10.68 I-1.198 J-.217 P1  F30000
G1 X133.89 Y139.054 Z10.68
G1 Z10.56
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X123.606 Y112.363 I-5.899 J-13.054 E2.07408
G3 X129.012 Y111.711 I4.411 J13.854 E.24363
G3 X133.945 Y139.029 I-1.021 J14.289 E1.68326
G1 X134.043 Y139.403 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.284 Y139.714 E.03367
G3 X129.032 Y111.337 I-5.28 J-13.716 E2.15981
G3 X139.361 Y135.327 I-1.036 J14.665 E1.32036
G1 X139.361 Y135.327 E0
G3 X134.093 Y139.375 I-11.357 J-9.328 E.27518
M204 S10000
; WIPE_START
G1 F24000
G1 X133.284 Y139.714 E-.33338
G1 X132.509 Y139.994 E-.31335
G1 X132.222 Y140.078 E-.11327
; WIPE_END
G1 E-.04 F1800
G1 X136.313 Y137.468 Z10.96 F30000
G1 Z10.56
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X139.948 Y133.276 I-14.057 J-15.861 E.24753
G1 X135.272 Y137.952 E.29419
G3 X134.058 Y138.609 I-7.861 J-13.086 E.06139
G1 X140.608 Y132.058 E.41205
G2 X141.04 Y131.069 I-8.589 J-4.338 E.04802
G1 X133.066 Y139.044 E.50163
G3 X132.209 Y139.344 I-10.449 J-28.475 E.04041
G1 X141.347 Y130.205 E.57487
G2 X141.567 Y129.428 I-6.811 J-2.346 E.03594
G1 X131.431 Y139.564 E.6376
G3 X130.711 Y139.727 I-1.812 J-6.331 E.03287
G1 X141.728 Y128.709 E.69309
G2 X141.842 Y128.039 I-5.912 J-1.342 E.03025
G1 X130.037 Y139.844 E.74259
G3 X129.404 Y139.919 I-.988 J-5.596 E.02836
G1 X141.918 Y127.405 E.78721
G2 X141.966 Y126.801 I-5.359 J-.725 E.02699
G1 X128.801 Y139.966 E.82816
G3 X128.221 Y139.988 I-.488 J-5.148 E.02581
G1 X141.989 Y126.22 E.8661
G1 X141.987 Y125.664 E.02471
G1 X127.662 Y139.99 E.90115
G3 X127.133 Y139.962 I-.02 J-4.737 E.02361
G1 X141.962 Y125.133 E.93285
G2 X141.922 Y124.616 I-4.626 J.097 E.02309
G1 X126.617 Y139.921 E.96278
G1 X126.115 Y139.866 E.02247
G1 X141.864 Y124.116 E.99073
G2 X141.784 Y123.639 I-3.72 J.373 E.02156
G1 X125.636 Y139.787 E1.01587
M73 P58 R9
G3 X125.165 Y139.7 I.539 J-4.231 E.02128
G1 X141.699 Y123.167 E1.04005
G2 X141.597 Y122.711 I-4.857 J.842 E.02078
G1 X124.711 Y139.598 E1.06228
G3 X124.269 Y139.482 I.811 J-3.987 E.02031
G1 X141.483 Y122.268 E1.08286
G1 X141.357 Y121.837 E.01999
G1 X123.835 Y139.359 E1.10223
G3 X123.42 Y139.217 I1.051 J-3.774 E.01955
G1 X141.217 Y121.419 E1.11961
G1 X141.072 Y121.008 E.01942
G1 X123.008 Y139.072 E1.13636
G1 X122.613 Y138.91 E.019
G1 X140.91 Y120.613 E1.15099
G2 X140.744 Y120.221 I-3.572 J1.276 E.01893
G1 X122.223 Y138.743 E1.16514
G1 X121.845 Y138.563 E.01859
G1 X140.562 Y119.846 E1.17741
G2 X140.377 Y119.474 I-3.405 J1.463 E.0185
G1 X121.475 Y138.376 E1.18905
G1 X121.115 Y138.178 E.01826
G1 X140.178 Y119.116 E1.19915
G2 X139.974 Y118.762 I-3.25 J1.637 E.01816
G1 X120.763 Y137.973 E1.20847
G1 X120.42 Y137.759 E.01799
G1 X139.758 Y118.421 E1.21647
G2 X139.537 Y118.085 I-3.102 J1.8 E.01791
G1 X120.086 Y137.536 E1.22359
G1 X119.759 Y137.305 E.01779
G1 X139.305 Y117.76 E1.22955
G2 X139.067 Y117.441 I-2.963 J1.958 E.01772
G1 X119.441 Y137.066 E1.23457
G1 X119.131 Y136.82 E.01764
G1 X138.819 Y117.131 E1.23852
G2 X138.565 Y116.828 I-2.828 J2.111 E.0176
G1 X118.829 Y136.564 E1.24151
G1 X118.534 Y136.302 E.01756
G1 X138.301 Y116.535 E1.24348
G2 X138.031 Y116.247 I-2.693 J2.259 E.01754
G1 X118.248 Y136.03 E1.24447
G1 X117.969 Y135.752 E.01753
G1 X137.752 Y115.97 E1.24447
G2 X137.466 Y115.698 I-2.561 J2.408 E.01754
G1 X117.699 Y135.465 E1.24348
G1 X117.435 Y135.172 E.01755
G1 X137.171 Y115.436 E1.24151
G2 X136.869 Y115.18 I-2.428 J2.557 E.01759
G1 X117.181 Y134.868 E1.23852
G1 X116.933 Y134.559 E.01763
G1 X136.558 Y114.934 E1.23457
G2 X136.241 Y114.694 I-2.291 J2.708 E.01771
G1 X116.695 Y134.24 E1.22955
G1 X116.463 Y133.915 E.01777
G1 X135.914 Y114.464 E1.22359
G2 X135.58 Y114.241 I-2.152 J2.866 E.01788
G1 X116.242 Y133.579 E1.21647
G1 X116.026 Y133.238 E.01796
G1 X135.236 Y114.027 E1.20847
G2 X134.885 Y113.822 I-2.004 J3.029 E.01813
G1 X115.822 Y132.884 E1.19915
G1 X115.623 Y132.526 E.01822
G1 X134.525 Y113.624 E1.18905
G2 X134.154 Y113.437 I-1.849 J3.204 E.01846
G1 X115.438 Y132.154 E1.1774
G1 X115.256 Y131.779 E.01855
G1 X133.777 Y113.257 E1.16514
G2 X133.387 Y113.09 I-1.682 J3.39 E.01889
G1 X115.09 Y131.387 E1.15099
G3 X114.928 Y130.992 I3.433 J-1.643 E.019
G1 X132.992 Y112.928 E1.13636
G2 X132.58 Y112.783 I-1.5 J3.594 E.01944
G1 X114.782 Y130.581 E1.11961
G3 X114.643 Y130.163 I3.648 J-1.452 E.0196
G1 X132.164 Y112.641 E1.10223
G1 X131.731 Y112.518 E.02006
G1 X114.517 Y129.731 E1.08286
G3 X114.403 Y129.288 I3.887 J-1.238 E.02036
G1 X131.289 Y112.402 E1.06228
G1 X130.834 Y112.3 E.02074
G1 X114.298 Y128.836 E1.04025
G3 X114.213 Y128.364 I4.158 J-.996 E.02134
G1 X130.364 Y112.213 E1.01604
G2 X129.885 Y112.135 I-.84 J3.652 E.02161
G1 X114.136 Y127.883 E.99071
G1 X114.078 Y127.384 E.02236
G1 X129.379 Y112.084 E.9625
G2 X128.867 Y112.038 I-.739 J5.371 E.02285
G1 X114.038 Y126.867 E.93284
G3 X114.013 Y126.335 I4.718 J-.496 E.02368
G1 X128.338 Y112.01 E.90114
G1 X127.779 Y112.012 E.02486
G1 X114.011 Y125.78 E.86609
G3 X114.034 Y125.199 I5.183 J-.081 E.02587
G1 X127.199 Y112.035 E.82815
G2 X126.596 Y112.081 I.11 J5.395 E.02694
G1 X114.082 Y124.594 E.7872
G3 X114.159 Y123.961 I5.682 J.365 E.02842
G1 X125.963 Y112.156 E.74258
G1 X125.289 Y112.273 E.03042
G1 X114.272 Y123.29 E.69308
G1 X114.433 Y122.571 E.03278
G1 X124.569 Y112.436 E.63759
G2 X123.791 Y112.656 I1.572 J7.032 E.03596
G1 X114.653 Y121.794 E.57486
G3 X114.96 Y120.93 I30.398 J10.309 E.04079
G1 X122.925 Y112.965 E.50108
G2 X121.942 Y113.392 I4.855 J12.545 E.04771
G1 X115.392 Y119.941 E.41203
G3 X116.052 Y118.724 I12.959 J6.24 E.06162
G1 X120.728 Y114.048 E.29416
G2 X118.383 Y115.836 I10.154 J15.751 E.13132
G1 X116.529 Y117.69 E.11663
; CHANGE_LAYER
; Z_HEIGHT: 10.84
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X117.943 Y116.276 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 39/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z10.96 I-.997 J.698 P1  F30000
G1 X133.902 Y139.08 Z10.96
G1 Z10.84
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X124.371 Y112.111 I-5.91 J-13.08 E2.11395
G3 X128.46 Y111.654 I3.612 J13.816 E.18364
G3 X133.956 Y139.055 I-.468 J14.346 E1.7113
G1 X134.053 Y139.429 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.294 Y139.741 E.03368
G3 X123.483 Y111.979 I-5.302 J-13.741 E1.93438
G3 X128.479 Y111.28 I4.551 J14.318 E.20814
G3 X134.103 Y139.4 I-.487 J14.72 E1.62105
M204 S10000
; WIPE_START
G1 F24000
G1 X133.294 Y139.741 E-.33359
G1 X132.517 Y140.021 E-.31393
G1 X132.233 Y140.104 E-.11247
; WIPE_END
G1 E-.04 F1800
G1 X124.76 Y138.551 Z11.24 F30000
G1 X119.674 Y137.494 Z11.24
G1 Z10.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X117.81 Y135.631 E.11722
G3 X116.023 Y133.285 I15.162 J-13.407 E.1313
G1 X120.711 Y137.973 E.2949
G2 X121.93 Y138.634 I7.475 J-12.332 E.06172
G1 X115.366 Y132.07 E.41295
G3 X114.93 Y131.075 I8.634 J-4.378 E.04831
G1 X122.921 Y139.066 E.5027
G2 X123.787 Y139.374 I11.166 J-30.077 E.04086
G1 X114.629 Y130.216 E.57606
G3 X114.41 Y129.438 I6.116 J-2.147 E.03598
G1 X124.565 Y139.594 E.63885
G1 X125.286 Y139.756 E.03284
G1 X114.248 Y128.718 E.69435
G3 X114.128 Y128.041 I6.736 J-1.536 E.03062
G1 X125.957 Y139.869 E.7441
G2 X126.592 Y139.946 I1.001 J-5.616 E.02847
G1 X114.053 Y127.407 E.78881
G3 X114.007 Y126.802 I5.36 J-.714 E.02699
G1 X127.198 Y139.993 E.82983
G2 X127.78 Y140.017 I.501 J-5.169 E.02592
G1 X113.984 Y126.221 E.86784
G1 X113.983 Y125.661 E.02491
G1 X128.337 Y140.015 E.90296
G2 X128.869 Y139.989 I.035 J-4.753 E.02372
G1 X114.01 Y125.131 E.93472
G3 X114.052 Y124.614 I4.621 J.112 E.02307
G1 X129.387 Y139.949 E.96471
G1 X129.888 Y139.891 E.02241
G1 X114.107 Y124.111 E.99272
G3 X114.185 Y123.631 I4.312 J.458 E.02164
G1 X130.369 Y139.815 E1.01808
G2 X130.838 Y139.725 I-.662 J-4.748 E.02124
G1 X114.272 Y123.16 E1.04209
G1 X114.375 Y122.704 E.02078
G1 X131.294 Y139.623 E1.06432
G2 X131.739 Y139.51 I-.682 J-3.621 E.02045
G1 X114.491 Y122.262 E1.08503
G1 X114.615 Y121.827 E.0201
G1 X132.171 Y139.384 E1.10444
G2 X132.59 Y139.244 I-1.036 J-3.794 E.01963
G1 X114.756 Y121.41 E1.12185
G3 X114.902 Y120.998 I3.747 J1.091 E.01948
G1 X133.002 Y139.098 E1.13863
G2 X133.398 Y138.935 I-1.252 J-3.604 E.01904
G1 X115.065 Y120.602 E1.15329
G3 X115.232 Y120.211 I3.565 J1.295 E.01893
G1 X133.791 Y138.77 E1.16746
G1 X134.166 Y138.587 E.01858
G1 X115.412 Y119.833 E1.17975
G3 X115.6 Y119.462 I3.397 J1.481 E.0185
G1 X134.539 Y138.402 E1.19142
G1 X134.898 Y138.202 E.01826
G1 X115.798 Y119.102 E1.20154
G3 X116.004 Y118.75 I2.917 J1.478 E.01815
G1 X135.252 Y137.998 E1.21082
G1 X135.594 Y137.781 E.018
G1 X116.221 Y118.408 E1.21872
M73 P59 R9
G3 X116.441 Y118.07 I3.498 J2.043 E.01795
G1 X135.931 Y137.56 E1.22603
G1 X136.256 Y137.327 E.0178
G1 X116.672 Y117.743 E1.232
G3 X116.912 Y117.424 I2.954 J1.978 E.01774
G1 X136.576 Y137.089 E1.23703
G1 X136.886 Y136.84 E.01767
G1 X117.159 Y117.113 E1.24099
G3 X117.415 Y116.811 I2.818 J2.13 E.01763
G1 X137.19 Y136.586 E1.24398
G1 X137.484 Y136.321 E.01759
G1 X117.678 Y116.515 E1.24596
G3 X117.95 Y116.229 I2.684 J2.28 E.01758
G1 X137.772 Y136.051 E1.24695
G1 X138.05 Y135.771 E.01756
G1 X118.228 Y115.949 E1.24695
G3 X118.516 Y115.679 I2.552 J2.429 E.01758
G1 X138.322 Y135.485 E1.24596
G1 X138.585 Y135.189 E.01759
G1 X118.81 Y115.414 E1.24399
G3 X119.114 Y115.16 I2.418 J2.578 E.01764
G1 X138.841 Y134.887 E1.24099
G1 X139.088 Y134.576 E.01768
G1 X119.423 Y114.911 E1.23703
G3 X119.744 Y114.673 I2.282 J2.73 E.01776
G1 X139.328 Y134.257 E1.232
G1 X139.559 Y133.93 E.01782
G1 X120.069 Y114.44 E1.22603
G3 X120.406 Y114.219 I2.141 J2.888 E.01794
G1 X139.779 Y133.592 E1.21872
G1 X139.996 Y133.25 E.018
G1 X120.748 Y114.002 E1.21082
G3 X121.104 Y113.8 I1.8 J2.745 E.01822
G1 X140.202 Y132.898 E1.20145
G1 X140.4 Y132.538 E.01829
G1 X121.464 Y113.602 E1.19121
G3 X121.834 Y113.413 I2.079 J3.61 E.01846
G1 X140.587 Y132.167 E1.17976
G1 X140.768 Y131.789 E.01863
G1 X122.209 Y113.23 E1.16747
G3 X122.602 Y113.065 I1.671 J3.412 E.01897
G1 X140.935 Y131.398 E1.15329
G1 X141.098 Y131.002 E.01903
G1 X122.998 Y112.902 E1.13863
G1 X123.41 Y112.756 E.01946
G1 X141.244 Y130.59 E1.12185
G2 X141.385 Y130.173 I-3.64 J-1.47 E.01959
G1 X123.829 Y112.616 E1.10444
G1 X124.261 Y112.49 E.02003
G1 X141.509 Y129.738 E1.08503
G2 X141.625 Y129.296 I-3.879 J-1.255 E.02035
G1 X124.705 Y112.376 E1.06441
G1 X125.158 Y112.271 E.0207
G1 X141.728 Y128.84 E1.04234
G2 X141.815 Y128.369 I-4.15 J-1.011 E.02132
G1 X125.631 Y112.185 E1.01808
G3 X126.112 Y112.109 I.924 J4.25 E.0217
G1 X141.893 Y127.889 E.99272
G1 X141.948 Y127.386 E.02252
G1 X126.613 Y112.051 E.96471
G3 X127.131 Y112.011 I.616 J4.593 E.02313
G1 X141.987 Y126.866 E.93453
G2 X142.017 Y126.339 I-4.212 J-.51 E.02352
G1 X127.664 Y111.985 E.90292
G1 X128.224 Y111.987 E.02491
G1 X142.016 Y125.779 E.86758
G2 X141.993 Y125.198 I-5.181 J-.092 E.02586
G1 X128.802 Y112.007 E.82984
G3 X129.408 Y112.054 I-.12 J5.419 E.02705
G1 X141.947 Y124.593 E.78881
G2 X141.872 Y123.96 I-5.681 J.356 E.02841
G1 X130.043 Y112.131 E.74411
G3 X130.714 Y112.244 I-.672 J6.035 E.03031
G1 X141.755 Y123.284 E.69451
G2 X141.591 Y122.563 I-6.507 J1.094 E.03294
G1 X131.435 Y112.406 E.63892
G3 X132.213 Y112.626 I-1.572 J7.045 E.036
G1 X141.371 Y121.784 E.57607
G2 X141.07 Y120.925 I-28.909 J9.635 E.04048
G1 X133.079 Y112.934 E.50271
G3 X134.07 Y113.366 I-3.354 J9.036 E.04811
G1 X140.634 Y119.931 E.41296
G2 X139.977 Y118.715 I-13.792 J6.672 E.06148
G1 X135.289 Y114.027 E.29492
G1 X135.754 Y114.317 E.02438
G3 X139.491 Y117.67 I-13.378 J18.667 E.22379
; CHANGE_LAYER
; Z_HEIGHT: 11.12
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X138.076 Y116.256 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 40/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z11.24 I-1.197 J-.218 P1  F30000
G1 X133.91 Y139.098 Z11.24
G1 Z11.12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X119.977 Y114.073 I-5.919 J-13.096 E1.9015
G3 X128.743 Y111.651 I8.007 J11.901 E.41166
G3 X133.965 Y139.073 I-.752 J14.352 E1.70085
G1 X134.06 Y139.447 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.302 Y139.76 E.03369
G3 X119.094 Y114.243 I-5.31 J-13.757 E1.73301
G3 X128.763 Y111.276 I8.911 J11.804 E.42381
G3 X134.112 Y139.419 I-.771 J14.726 E1.61137
M204 S10000
; WIPE_START
G1 F24000
G1 X133.302 Y139.76 E-.33411
G1 X132.523 Y140.039 E-.31436
G1 X132.241 Y140.121 E-.11153
; WIPE_END
G1 E-.04 F1800
G1 X136.34 Y137.506 Z11.52 F30000
G1 Z11.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X139.482 Y134.071 I-16.172 J-17.946 E.20737
G2 X139.99 Y133.298 I-6.635 J-4.906 E.04118
G1 X135.294 Y137.994 E.29541
G3 X134.077 Y138.651 I-7.905 J-13.168 E.06155
G1 X140.651 Y132.077 E.41358
G2 X141.084 Y131.085 I-8.616 J-4.351 E.04817
G1 X133.081 Y139.088 E.50343
G3 X132.221 Y139.389 I-10.525 J-28.704 E.04053
G1 X141.392 Y130.218 E.57688
G2 X141.612 Y129.439 I-6.828 J-2.352 E.03605
G1 X131.442 Y139.609 E.6398
G3 X130.719 Y139.773 I-1.818 J-6.353 E.03298
G1 X141.774 Y128.718 E.69547
G2 X141.888 Y128.045 I-5.926 J-1.345 E.03035
G1 X130.043 Y139.89 E.74513
G3 X129.408 Y139.966 I-.991 J-5.614 E.02845
G1 X141.965 Y127.409 E.78989
G2 X142.012 Y126.803 I-5.376 J-.727 E.02708
G1 X128.803 Y140.012 E.83097
G3 X128.221 Y140.034 I-.489 J-5.165 E.02589
G1 X142.036 Y126.22 E.86902
G1 X142.034 Y125.663 E.02479
G1 X127.661 Y140.036 E.90419
G3 X127.129 Y140.009 I-.02 J-4.747 E.02368
G1 X142.008 Y125.13 E.93599
G2 X141.968 Y124.611 I-4.64 J.098 E.02316
G1 X126.612 Y139.967 E.96601
G1 X126.108 Y139.912 E.02255
G1 X141.91 Y124.11 E.99406
G2 X141.833 Y123.627 I-4.332 J.443 E.02173
G1 X125.627 Y139.833 E1.01945
G3 X125.156 Y139.746 I.541 J-4.244 E.02135
G1 X141.747 Y123.154 E1.04374
G1 X141.642 Y122.7 E.02073
G1 X124.699 Y139.643 E1.06584
G3 X124.256 Y139.527 I.814 J-4 E.02037
G1 X141.528 Y122.256 E1.08648
G1 X141.402 Y121.823 E.02006
G1 X123.821 Y139.403 E1.10592
G3 X123.404 Y139.261 I1.054 J-3.785 E.01961
G1 X141.261 Y121.404 E1.12335
G1 X141.115 Y120.991 E.01949
G1 X122.991 Y139.115 E1.14016
G1 X122.595 Y138.953 E.01906
G1 X140.952 Y120.595 E1.15484
G2 X140.787 Y120.202 I-3.583 J1.28 E.01899
G1 X122.203 Y138.785 E1.16903
G1 X121.825 Y138.604 E.01865
G1 X140.604 Y119.825 E1.18133
G2 X140.418 Y119.452 I-3.415 J1.467 E.01856
G1 X121.453 Y138.417 E1.19302
G1 X121.092 Y138.219 E.01832
G1 X140.218 Y119.093 E1.20315
G2 X140.014 Y118.738 I-3.26 J1.642 E.01822
G1 X120.739 Y138.013 E1.2125
G1 X120.395 Y137.798 E.01805
G1 X139.797 Y118.396 E1.22053
G2 X139.575 Y118.059 I-3.113 J1.806 E.01796
G1 X120.06 Y137.574 E1.22767
G1 X119.732 Y137.343 E.01785
G1 X139.342 Y117.732 E1.23365
G2 X139.104 Y117.412 I-2.972 J1.964 E.01778
G1 X119.413 Y137.103 E1.23869
G1 X119.101 Y136.856 E.0177
G1 X138.855 Y117.102 E1.24265
G2 X138.6 Y116.798 I-2.837 J2.118 E.01766
G1 X118.799 Y136.599 E1.24565
G1 X118.502 Y136.336 E.01761
G1 X138.335 Y116.503 E1.24762
G2 X138.065 Y116.215 I-2.701 J2.266 E.0176
G1 X118.216 Y136.064 E1.24862
G1 X117.935 Y135.785 E.01758
G1 X137.784 Y115.936 E1.24862
G2 X137.498 Y115.664 I-2.569 J2.415 E.0176
G1 X117.665 Y135.497 E1.24762
G1 X117.4 Y135.202 E.01761
G1 X137.201 Y115.401 E1.24565
G2 X136.899 Y115.144 I-2.435 J2.564 E.01765
G1 X117.145 Y134.898 E1.24265
G1 X116.896 Y134.588 E.01769
G1 X136.587 Y114.897 E1.23869
G2 X136.268 Y114.657 I-2.299 J2.718 E.01777
G1 X116.658 Y134.268 E1.23365
G1 X116.425 Y133.941 E.01783
G1 X135.94 Y114.426 E1.22767
G2 X135.605 Y114.202 I-2.158 J2.875 E.01794
G1 X116.203 Y133.604 E1.22053
G1 X115.986 Y133.262 E.01802
G1 X135.261 Y113.987 E1.2125
G2 X134.908 Y113.781 I-2.011 J3.04 E.01819
G1 X115.782 Y132.907 E1.20315
G1 X115.582 Y132.548 E.01828
G1 X134.547 Y113.583 E1.19302
G2 X134.175 Y113.396 I-1.855 J3.214 E.01852
G1 X115.396 Y132.175 E1.18133
M73 P60 R9
G1 X115.213 Y131.798 E.01861
G1 X133.797 Y113.215 E1.16903
G2 X133.405 Y113.047 I-1.688 J3.401 E.01895
G1 X115.048 Y131.405 E1.15484
G3 X114.885 Y131.009 I3.446 J-1.65 E.01906
G1 X133.009 Y112.885 E1.14016
G2 X132.596 Y112.739 I-1.505 J3.605 E.0195
G1 X114.739 Y130.596 E1.12335
G3 X114.598 Y130.177 I3.659 J-1.457 E.01966
G1 X132.179 Y112.597 E1.10592
G1 X131.744 Y112.473 E.02013
G1 X114.472 Y129.744 E1.08648
G3 X114.358 Y129.3 I3.9 J-1.243 E.02043
G1 X131.301 Y112.357 E1.06584
G1 X130.844 Y112.254 E.02081
G1 X114.253 Y128.846 E1.04374
G3 X114.167 Y128.372 I16.286 J-3.192 E.0214
G1 X130.373 Y112.167 E1.01945
G2 X129.892 Y112.088 I-.94 J4.24 E.02167
G1 X114.09 Y127.89 E.99406
G1 X114.032 Y127.389 E.02244
G1 X129.388 Y112.033 E.96601
G2 X128.871 Y111.991 I-.63 J4.587 E.0231
G1 X113.992 Y126.87 E.93599
G3 X113.966 Y126.337 I4.734 J-.498 E.02375
G1 X128.339 Y111.964 E.90419
G1 X127.779 Y111.966 E.02495
G1 X113.964 Y125.78 E.86902
G3 X113.988 Y125.197 I5.2 J-.081 E.02595
G1 X127.197 Y111.988 E.83096
G2 X126.592 Y112.034 I.11 J5.413 E.02702
G1 X114.035 Y124.591 E.78989
G3 X114.112 Y123.955 I5.7 J.366 E.02851
G1 X125.957 Y112.11 E.74513
G1 X125.281 Y112.227 E.03052
G1 X114.226 Y123.282 E.69547
G1 X114.388 Y122.561 E.03289
G1 X124.558 Y112.391 E.6398
G2 X123.778 Y112.611 I1.577 J7.055 E.03608
G1 X114.608 Y121.782 E.57687
G3 X114.916 Y120.915 I30.376 J10.294 E.04091
G1 X122.919 Y112.912 E.50343
G2 X121.923 Y113.349 I3.388 J9.082 E.04837
G1 X115.349 Y119.923 E.41357
G3 X116.01 Y118.702 I13.018 J6.266 E.06178
G1 X120.706 Y114.006 E.2954
G2 X118.36 Y115.793 I10.186 J15.806 E.1313
G1 X116.49 Y117.663 E.11763
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X117.905 Y116.249 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 41/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z11.52 I-.997 J.698 P1  F30000
G1 X133.917 Y139.114 Z11.52
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X123.586 Y112.3 I-5.926 J-13.114 E2.08356
G3 X129.026 Y111.647 I4.432 J13.922 E.24518
G3 X133.972 Y139.089 I-1.035 J14.353 E1.6906
G1 X134.067 Y139.464 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.308 Y139.777 E.03371
G3 X129.046 Y111.272 I-5.308 J-13.777 E2.17049
G3 X137.376 Y114.594 I-1.019 J14.659 E.37416
G1 X137.376 Y114.594 E0
G3 X134.12 Y139.437 I-9.376 J11.406 E1.22834
M204 S10000
; WIPE_START
G1 F24000
G1 X133.308 Y139.777 E-.33447
G1 X132.529 Y140.057 E-.31476
G1 X132.249 Y140.138 E-.11076
; WIPE_END
G1 E-.04 F1800
G1 X125.082 Y137.513 Z11.8 F30000
G1 X116.489 Y134.365 Z11.8
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X117.859 Y135.735 E.0862
G2 X120.663 Y137.987 I10.295 J-9.948 E.16037
G1 X116.01 Y133.334 E.2927
G3 X115.357 Y132.129 I11.739 J-7.141 E.061
G1 X121.879 Y138.651 E.41028
G2 X122.863 Y139.083 I4.341 J-8.549 E.04785
G1 X114.914 Y131.134 E.50006
G3 X114.608 Y130.276 I28.761 J-10.745 E.04054
G1 X123.724 Y139.392 E.57348
G2 X124.5 Y139.616 I2.382 J-6.796 E.03595
G1 X114.385 Y129.501 E.6363
G3 X114.219 Y128.783 I6.31 J-1.838 E.03281
G1 X125.215 Y139.778 E.69172
G2 X125.883 Y139.895 I1.371 J-5.894 E.0302
G1 X114.103 Y128.115 E.74104
G3 X114.024 Y127.484 I5.581 J-1.021 E.02832
G1 X126.516 Y139.975 E.78582
G2 X127.12 Y140.027 I.761 J-5.349 E.02697
G1 X113.974 Y126.881 E.82696
G3 X113.947 Y126.302 I5.14 J-.527 E.02579
G1 X127.7 Y140.055 E.86513
G1 X128.25 Y140.053 E.02448
G1 X113.945 Y125.748 E.89986
G3 X113.968 Y125.219 I4.727 J-.064 E.02359
G1 X128.781 Y140.032 E.93186
G2 X129.298 Y139.997 I-.051 J-4.622 E.02308
G1 X114.004 Y124.703 E.96212
G1 X114.059 Y124.205 E.02227
G1 X129.793 Y139.94 E.98981
G2 X130.274 Y139.869 I-.391 J-4.32 E.02165
G1 X114.131 Y123.726 E1.01551
G3 X114.213 Y123.255 I4.234 J.487 E.02127
G1 X130.745 Y139.788 E1.04002
G2 X131.195 Y139.686 I-.682 J-4.06 E.02055
G1 X114.314 Y122.804 E1.06196
G3 X114.424 Y122.362 I3.995 J.755 E.02029
G1 X131.64 Y139.578 E1.08301
G1 X132.067 Y139.453 E.01981
G1 X114.546 Y121.932 E1.1022
G3 X114.681 Y121.515 I3.783 J.991 E.01952
G1 X132.486 Y139.32 E1.12009
G1 X132.894 Y139.176 E.01925
G1 X114.823 Y121.105 E1.13682
G3 X114.98 Y120.71 I3.595 J1.202 E.01892
G1 X133.291 Y139.021 E1.15189
G1 X133.68 Y138.858 E.01877
G1 X115.141 Y120.318 E1.16627
G3 X115.318 Y119.944 I3.421 J1.392 E.01845
G1 X134.055 Y138.68 E1.17866
G1 X134.424 Y138.497 E.01833
G1 X115.497 Y119.571 E1.1906
G1 X115.693 Y119.214 E.01809
G1 X134.786 Y138.307 E1.20107
G1 X135.14 Y138.11 E.01806
G1 X115.89 Y118.859 E1.21097
G1 X116.102 Y118.519 E.01783
G1 X135.481 Y137.898 E1.21902
G1 X135.819 Y137.684 E.0178
G1 X116.317 Y118.182 E1.22681
G1 X116.545 Y117.858 E.01762
G1 X136.142 Y137.455 E1.2328
G1 X136.464 Y137.225 E.01761
G1 X116.776 Y117.536 E1.23855
G1 X117.02 Y117.228 E.01748
G1 X136.772 Y136.98 E1.24254
G1 X137.078 Y136.734 E.01747
G1 X117.266 Y116.922 E1.24632
G1 X117.526 Y116.63 E.0174
G1 X137.37 Y136.474 E1.24835
G1 X137.661 Y136.213 E.01739
G1 X117.787 Y116.339 E1.25019
G1 X118.062 Y116.062 E.01737
G1 X137.938 Y135.938 E1.25028
G1 X138.213 Y135.661 E.01737
G1 X118.339 Y115.787 E1.25019
G1 X118.63 Y115.526 E.01739
G1 X138.474 Y135.37 E1.24835
G1 X138.734 Y135.078 E.0174
G1 X118.922 Y115.266 E1.24632
G1 X119.228 Y115.02 E.01747
G1 X138.98 Y134.772 E1.24254
G1 X139.224 Y134.464 E.01748
G1 X119.536 Y114.775 E1.23855
G1 X119.858 Y114.545 E.01761
G1 X139.455 Y134.142 E1.2328
M73 P60 R8
G1 X139.683 Y133.818 E.01762
G1 X120.181 Y114.316 E1.22681
G1 X120.519 Y114.102 E.0178
G1 X139.898 Y133.481 E1.21902
G1 X140.11 Y133.141 E.01783
G1 X120.859 Y113.89 E1.21097
G1 X121.214 Y113.693 E.01806
G1 X140.307 Y132.786 E1.20108
G1 X140.503 Y132.429 E.01809
G1 X121.572 Y113.498 E1.19089
G1 X121.943 Y113.318 E.01838
G1 X140.682 Y132.056 E1.17878
G2 X140.859 Y131.682 I-3.247 J-1.769 E.01845
G1 X122.32 Y113.142 E1.16627
G1 X122.709 Y112.979 E.01877
G1 X141.02 Y131.29 E1.15189
G2 X141.177 Y130.896 I-3.438 J-1.597 E.01892
G1 X123.106 Y112.824 E1.13682
G1 X123.514 Y112.68 E.01925
G1 X141.319 Y130.485 E1.12009
G2 X141.454 Y130.068 I-3.648 J-1.408 E.01952
G1 X123.933 Y112.547 E1.10221
G1 X124.36 Y112.422 E.01981
G1 X141.576 Y129.638 E1.08301
G2 X141.686 Y129.196 I-3.886 J-1.198 E.02029
G1 X124.805 Y112.314 E1.06197
G3 X125.255 Y112.212 I1.132 J3.958 E.02054
G1 X141.787 Y128.745 E1.04002
G2 X141.869 Y128.274 I-4.151 J-.958 E.02127
G1 X125.725 Y112.131 E1.01552
G3 X126.207 Y112.06 I.872 J4.248 E.02165
G1 X141.941 Y127.795 E.98982
G1 X141.996 Y127.297 E.02227
G1 X126.701 Y112.003 E.96212
G3 X127.219 Y111.968 I.569 J4.589 E.02308
G1 X142.032 Y126.781 E.93187
G2 X142.055 Y126.252 I-4.703 J-.465 E.02359
G1 X127.75 Y111.947 E.89987
G1 X128.3 Y111.945 E.02448
G1 X142.053 Y125.698 E.86513
G2 X142.022 Y125.115 I-4.54 J-.053 E.02598
G1 X128.88 Y111.973 E.82671
G3 X129.488 Y112.029 I-.278 J6.371 E.02716
G1 X141.976 Y124.517 E.78556
G2 X141.897 Y123.885 I-5.662 J.39 E.02832
G1 X130.117 Y112.105 E.74105
G3 X130.785 Y112.222 I-.702 J6.011 E.0302
G1 X141.781 Y123.218 E.69173
G2 X141.615 Y122.499 I-6.466 J1.117 E.03281
G1 X131.5 Y112.384 E.63632
M73 P61 R8
G3 X132.276 Y112.608 I-1.606 J7.021 E.03595
G1 X141.392 Y121.725 E.57349
G2 X141.086 Y120.866 I-29.061 J9.884 E.04054
G1 X133.137 Y112.917 E.50008
G3 X134.121 Y113.349 I-3.356 J8.979 E.04785
G1 X140.651 Y119.878 E.41074
G2 X139.99 Y118.666 I-13.417 J6.52 E.06142
G1 X135.337 Y114.013 E.29273
G1 X135.774 Y114.286 E.02293
G3 X139.512 Y117.635 I-12.694 J17.923 E.22372
; CHANGE_LAYER
; Z_HEIGHT: 11.68
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X138.096 Y116.222 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 42/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z11.8 I-1.197 J-.218 P1  F30000
G1 X133.922 Y139.125 Z11.8
G1 Z11.68
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X123.583 Y112.289 I-5.93 J-13.125 E2.08523
G3 X128.47 Y111.606 I4.45 J14 E.22055
G3 X133.977 Y139.101 I-.478 J14.395 E1.71688
G1 X134.072 Y139.475 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.313 Y139.789 E.03374
G3 X128.49 Y111.231 I-5.313 J-13.789 E2.14937
G3 X142.718 Y127.317 I-.49 J14.769 E.9871
G1 X142.718 Y127.317 E0
G3 X134.125 Y139.448 I-14.718 J-1.317 E.63958
M204 S10000
; WIPE_START
G1 F24000
G1 X133.313 Y139.789 E-.33484
G1 X132.532 Y140.068 E-.31501
G1 X132.254 Y140.149 E-.11015
; WIPE_END
G1 E-.04 F1800
G1 X136.372 Y137.521 Z12.08 F30000
G1 Z11.68
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X139.724 Y133.781 I-14.577 J-16.438 E.22391
G1 X139.997 Y133.343 E.02299
G1 X135.339 Y138.001 E.29304
G3 X134.126 Y138.661 I-7.741 J-12.773 E.06146
G1 X140.662 Y132.126 E.41112
G2 X141.094 Y131.141 I-8.557 J-4.345 E.04789
G1 X133.138 Y139.097 E.50053
G3 X132.279 Y139.404 I-10.752 J-28.785 E.04057
G1 X141.403 Y130.279 E.574
G2 X141.627 Y129.502 I-6.8 J-2.382 E.03598
G1 X131.504 Y139.626 E.63683
G1 X130.791 Y139.786 E.03248
G1 X141.79 Y128.787 E.69189
G2 X141.906 Y128.118 I-5.898 J-1.372 E.03023
G1 X130.116 Y139.908 E.74169
G3 X129.484 Y139.988 I-1.022 J-5.586 E.02834
G1 X141.987 Y127.485 E.7865
G2 X142.035 Y126.885 I-6.057 J-.783 E.0268
G1 X128.882 Y140.038 E.82742
G3 X128.302 Y140.065 I-.527 J-5.144 E.02581
G1 X142.066 Y126.3 E.86587
G1 X142.065 Y125.75 E.0245
G1 X127.748 Y140.066 E.90063
G3 X127.218 Y140.044 I-.064 J-4.73 E.02361
G1 X142.044 Y125.218 E.93265
G2 X142.009 Y124.7 I-4.625 J.051 E.02309
G1 X126.702 Y140.007 E.96293
G1 X126.204 Y139.953 E.02229
G1 X141.952 Y124.205 E.99065
G2 X141.881 Y123.723 I-4.323 J.392 E.02166
G1 X125.724 Y139.88 E1.01637
G3 X125.253 Y139.799 I.487 J-4.236 E.02129
G1 X141.796 Y123.255 E1.04072
G1 X141.695 Y122.804 E.02057
G1 X124.801 Y139.697 E1.06272
G3 X124.359 Y139.588 I.756 J-3.997 E.0203
G1 X141.589 Y122.357 E1.08392
G1 X141.464 Y121.929 E.01982
G1 X123.928 Y139.465 E1.10313
G3 X123.511 Y139.33 I.992 J-3.786 E.01954
G1 X141.331 Y121.51 E1.12103
G1 X141.187 Y121.102 E.01926
G1 X123.1 Y139.188 E1.13777
G3 X122.705 Y139.031 I1.203 J-3.598 E.01893
G1 X141.031 Y120.705 E1.15285
G1 X140.869 Y120.315 E.01879
G1 X122.313 Y138.87 E1.16725
G3 X121.938 Y138.692 I1.394 J-3.424 E.01846
G1 X140.693 Y119.938 E1.17976
G1 X140.512 Y119.566 E.01839
G1 X121.565 Y138.513 E1.19188
G1 X121.208 Y138.317 E.0181
G1 X140.317 Y119.208 E1.20208
G1 X140.12 Y118.853 E.01807
G1 X120.853 Y138.12 E1.21199
G1 X120.513 Y137.907 E.01784
G1 X139.907 Y118.513 E1.22004
G1 X139.693 Y118.175 E.01781
G1 X120.175 Y137.693 E1.22783
G1 X119.851 Y137.464 E.01764
G1 X139.464 Y117.851 E1.23383
G1 X139.234 Y117.529 E.01762
G1 X119.529 Y137.234 E1.23959
G1 X119.221 Y136.989 E.0175
G1 X138.989 Y117.221 E1.24358
G1 X138.743 Y116.914 E.01748
G1 X118.915 Y136.743 E1.24736
G1 X118.622 Y136.483 E.01741
G1 X138.483 Y116.622 E1.2494
G1 X138.221 Y116.331 E.0174
G1 X118.331 Y136.221 E1.25123
G1 X118.054 Y135.946 E.01738
G1 X137.946 Y116.054 E1.25133
G1 X137.669 Y115.779 E.01738
G1 X117.779 Y135.669 E1.25123
G1 X117.517 Y135.378 E.0174
G1 X137.378 Y115.517 E1.2494
G1 X137.085 Y115.257 E.01741
G1 X117.257 Y135.086 E1.24736
G1 X117.011 Y134.779 E.01748
G1 X136.779 Y115.011 E1.24358
G1 X136.471 Y114.766 E.0175
G1 X116.766 Y134.471 E1.23959
G1 X116.536 Y134.149 E.01762
G1 X136.149 Y114.536 E1.23382
G2 X135.823 Y114.309 I-2.456 J3.189 E.01767
G1 X116.307 Y133.825 E1.22771
G1 X116.093 Y133.487 E.01781
G1 X135.485 Y114.095 E1.2199
G1 X135.146 Y113.88 E.01781
G1 X115.88 Y133.146 E1.21197
G1 X115.683 Y132.792 E.01807
G1 X134.791 Y113.683 E1.20208
G1 X134.435 Y113.487 E.0181
G1 X115.488 Y132.434 E1.19188
G1 X115.307 Y132.062 E.01839
G1 X134.061 Y113.308 E1.17976
G2 X133.687 Y113.13 I-1.77 J3.249 E.01846
G1 X115.131 Y131.685 E1.16725
G1 X114.969 Y131.295 E.01879
G1 X133.295 Y112.969 E1.15285
G2 X132.9 Y112.812 I-1.599 J3.441 E.01893
G1 X114.813 Y130.898 E1.13777
G1 X114.669 Y130.49 E.01926
G1 X132.489 Y112.67 E1.12103
G2 X132.068 Y112.538 I-1.541 J4.2 E.01963
G1 X114.536 Y130.071 E1.10291
G1 X114.411 Y129.643 E.01982
G1 X131.64 Y112.413 E1.08385
G2 X131.199 Y112.303 I-1.1 J3.453 E.02027
G1 X114.303 Y129.198 E1.06285
G3 X114.201 Y128.748 I3.96 J-1.133 E.02056
G1 X130.747 Y112.201 E1.04089
G2 X130.276 Y112.12 I-.959 J4.156 E.02129
G1 X114.119 Y128.276 E1.01637
G3 X114.048 Y127.795 I4.252 J-.873 E.02166
G1 X129.796 Y112.047 E.99065
G1 X129.298 Y111.993 E.02229
G1 X113.991 Y127.3 E.96293
G3 X113.956 Y126.782 I4.593 J-.569 E.02309
G1 X128.782 Y111.956 E.93265
G2 X128.247 Y111.938 I-.448 J5.407 E.02381
G1 X113.935 Y126.25 E.90032
G1 X113.934 Y125.7 E.0245
G1 X127.697 Y111.936 E.8658
G2 X127.118 Y111.962 I-.085 J4.606 E.02577
G1 X113.961 Y125.119 E.82766
G3 X114.013 Y124.515 I5.404 J.157 E.02699
G1 X126.515 Y112.012 E.78649
G2 X125.884 Y112.092 I.39 J5.664 E.02834
G1 X114.094 Y123.882 E.74168
G3 X114.21 Y123.213 I6.015 J.703 E.03023
G1 X125.215 Y112.207 E.69231
G2 X124.497 Y112.374 I1.118 J6.472 E.03283
G1 X114.373 Y122.497 E.63686
G3 X114.597 Y121.721 I7.027 J1.607 E.03598
G1 X123.721 Y112.596 E.57399
G2 X122.862 Y112.903 I9.894 J29.091 E.04057
G1 X114.906 Y120.859 E.50051
G3 X115.338 Y119.874 I8.987 J3.359 E.04789
G1 X121.874 Y113.339 E.41111
G2 X120.661 Y113.999 I8.141 J16.395 E.06146
G1 X116.003 Y118.657 E.29301
G3 X118.217 Y115.891 I12.158 J7.46 E.15802
G1 X119.628 Y114.479 E.08879
; CHANGE_LAYER
; Z_HEIGHT: 11.96
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X118.217 Y115.891 E-.75854
G1 X118.214 Y115.893 E-.00146
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 43/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z12.08 I-1.008 J.682 P1  F30000
G1 X133.924 Y139.129 Z12.08
G1 Z11.96
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X119.958 Y114.045 I-5.933 J-13.127 E1.90599
G3 X128.753 Y111.617 I8.025 J11.929 E.41297
G3 X133.979 Y139.105 I-.761 J14.385 E1.70452
G1 X134.074 Y139.477 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M73 P62 R8
G1 X133.314 Y139.793 E.03378
G3 X128.772 Y111.243 I-5.317 J-13.79 E2.1616
G3 X142.559 Y123.469 I-.755 J14.737 E.81714
G1 X142.559 Y123.469 E0
G3 X134.128 Y139.451 I-14.561 J2.533 E.79823
M204 S10000
; WIPE_START
G1 F24000
G1 X133.314 Y139.793 E-.33533
G1 X132.533 Y140.071 E-.3151
G1 X132.256 Y140.152 E-.10958
; WIPE_END
G1 E-.04 F1800
G1 X125.089 Y137.527 Z12.36 F30000
G1 X116.477 Y134.374 Z12.36
G1 Z11.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X117.897 Y135.794 E.08934
G2 X120.656 Y138 I10.214 J-9.944 E.15754
G1 X115.997 Y133.341 E.29309
G3 X115.336 Y132.128 I12.774 J-7.742 E.06148
G1 X121.873 Y138.664 E.41121
G2 X122.858 Y139.097 I4.345 J-8.557 E.0479
G1 X114.9 Y131.139 E.50063
G3 X114.593 Y130.28 I28.785 J-10.752 E.04058
G1 X123.72 Y139.406 E.57412
G2 X124.497 Y139.63 I2.384 J-6.805 E.03598
G1 X114.37 Y129.504 E.63701
G3 X114.204 Y128.785 I6.314 J-1.839 E.03284
G1 X125.212 Y139.793 E.69247
G2 X125.881 Y139.91 I1.372 J-5.9 E.03023
G1 X114.089 Y128.117 E.74185
G3 X114.009 Y127.485 I5.587 J-1.022 E.02835
G1 X126.515 Y139.99 E.78667
G2 X127.119 Y140.042 I.762 J-5.354 E.02699
G1 X113.959 Y126.882 E.82785
G3 X113.932 Y126.302 I5.145 J-.527 E.02581
G1 X127.699 Y140.07 E.86606
G1 X128.25 Y140.068 E.02451
G1 X113.93 Y125.748 E.90083
G3 X113.953 Y125.218 I4.732 J-.064 E.02362
G1 X128.782 Y140.047 E.93286
G2 X129.3 Y140.012 I-.051 J-4.628 E.0231
G1 X113.989 Y124.702 E.96315
G1 X114.044 Y124.203 E.02229
G1 X129.795 Y139.955 E.99087
G2 X130.277 Y139.884 I-.392 J-4.324 E.02167
G1 X114.117 Y123.723 E1.0166
G3 X114.198 Y123.252 I4.238 J.487 E.02129
G1 X130.748 Y139.802 E1.04113
G2 X131.199 Y139.7 I-.682 J-4.063 E.02057
G1 X114.299 Y122.801 E1.06309
G3 X114.409 Y122.358 I3.998 J.756 E.02031
G1 X131.644 Y139.592 E1.08416
G1 X132.071 Y139.467 E.01983
G1 X114.532 Y121.928 E1.10337
G3 X114.667 Y121.51 I3.787 J.992 E.01954
G1 X132.491 Y139.334 E1.12128
G1 X132.899 Y139.19 E.01927
G1 X114.809 Y121.099 E1.13803
G3 X114.966 Y120.704 I3.598 J1.203 E.01894
G1 X133.297 Y139.034 E1.15311
G1 X133.686 Y138.871 E.01879
G1 X115.127 Y120.312 E1.16751
G3 X115.305 Y119.937 I3.428 J1.395 E.01847
G1 X134.063 Y138.695 E1.18003
G1 X134.435 Y138.515 E.0184
G1 X115.484 Y119.564 E1.19215
G1 X115.68 Y119.207 E.01811
G1 X134.793 Y138.32 E1.20235
G1 X135.148 Y138.122 E.01808
G1 X115.877 Y118.852 E1.21226
G1 X116.09 Y118.511 E.01784
G1 X135.488 Y137.91 E1.22031
G1 X135.827 Y137.696 E.01782
G1 X116.304 Y118.173 E1.22811
G1 X116.533 Y117.849 E.01764
G1 X136.151 Y137.467 E1.2341
G1 X136.473 Y137.237 E.01762
G1 X116.764 Y117.527 E1.23987
G1 X117.008 Y117.219 E.0175
G1 X136.781 Y136.992 E1.24386
G1 X137.088 Y136.746 E.01749
G1 X117.255 Y116.913 E1.24764
G1 X117.515 Y116.62 E.01741
G1 X137.38 Y136.485 E1.24968
G1 X137.671 Y136.224 E.01741
G1 X117.776 Y116.329 E1.25151
G1 X118.052 Y116.052 E.01738
G1 X137.948 Y135.948 E1.25161
G1 X138.224 Y135.671 E.01738
G1 X118.329 Y115.776 E1.25151
G1 X118.62 Y115.515 E.01741
G1 X138.485 Y135.38 E1.24968
G1 X138.745 Y135.087 E.01741
G1 X118.912 Y115.254 E1.24764
G1 X119.219 Y115.008 E.01749
G1 X138.992 Y134.781 E1.24386
G1 X139.236 Y134.473 E.0175
G1 X119.527 Y114.763 E1.23987
G1 X119.849 Y114.533 E.01762
G1 X139.467 Y134.151 E1.2341
G1 X139.696 Y133.827 E.01764
G1 X120.173 Y114.304 E1.22811
G1 X120.511 Y114.09 E.01782
G1 X139.91 Y133.489 E1.22031
G1 X140.122 Y133.148 E.01784
G1 X120.852 Y113.878 E1.21226
G1 X121.207 Y113.68 E.01808
G1 X140.32 Y132.793 E1.20235
G1 X140.516 Y132.436 E.01811
G1 X121.565 Y113.485 E1.19215
G1 X121.937 Y113.305 E.0184
G1 X140.695 Y132.063 E1.18003
G2 X140.873 Y131.688 I-3.251 J-1.771 E.01847
G1 X122.314 Y113.129 E1.16751
G1 X122.703 Y112.966 E.01879
G1 X141.034 Y131.296 E1.15311
G2 X141.191 Y130.901 I-3.441 J-1.599 E.01894
G1 X123.101 Y112.81 E1.13803
G1 X123.509 Y112.666 E.01927
G1 X141.333 Y130.49 E1.12129
G2 X141.468 Y130.072 I-3.652 J-1.41 E.01954
G1 X123.928 Y112.533 E1.10338
G1 X124.356 Y112.408 E.01983
G1 X141.591 Y129.642 E1.08416
G2 X141.701 Y129.199 I-3.89 J-1.199 E.02031
G1 X124.801 Y112.3 E1.0631
G3 X125.252 Y112.198 I1.133 J3.962 E.02057
G1 X141.802 Y128.748 E1.04113
G2 X141.883 Y128.277 I-4.157 J-.959 E.02129
G1 X125.723 Y112.116 E1.0166
G3 X126.205 Y112.045 I.873 J4.253 E.02167
G1 X141.956 Y127.797 E.99088
G1 X142.011 Y127.299 E.02229
G1 X126.7 Y111.988 E.96315
G3 X127.218 Y111.953 I.569 J4.593 E.0231
G1 X142.047 Y126.782 E.93286
G2 X142.07 Y126.252 I-4.708 J-.466 E.02361
G1 X127.749 Y111.932 E.90083
G1 X128.3 Y111.93 E.02451
G1 X142.068 Y125.698 E.86606
G2 X142.041 Y125.118 I-5.172 J-.052 E.02581
G1 X128.881 Y111.958 E.82786
G3 X129.485 Y112.01 I-.157 J5.405 E.02699
G1 X141.991 Y124.515 E.78668
G2 X141.911 Y123.883 I-5.666 J.39 E.02835
G1 X130.119 Y112.09 E.74186
G3 X130.788 Y112.207 I-.703 J6.016 E.03023
G1 X141.796 Y123.215 E.69248
G2 X141.63 Y122.496 I-6.496 J1.123 E.03284
G1 X131.503 Y112.37 E.63702
G3 X132.28 Y112.594 I-1.607 J7.029 E.03598
G1 X141.407 Y121.72 E.57413
G2 X141.1 Y120.861 I-29.102 J9.897 E.04058
G1 X133.142 Y112.903 E.50065
G3 X134.127 Y113.335 I-3.359 J8.989 E.0479
G1 X140.664 Y119.873 E.41123
G2 X140.004 Y118.659 I-13.438 J6.53 E.06147
G1 X135.344 Y114 E.29312
G1 X135.783 Y114.273 E.023
G3 X139.524 Y117.627 I-13.471 J18.792 E.22391
; CHANGE_LAYER
; Z_HEIGHT: 12.24
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X138.108 Y116.213 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 44/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z12.36 I-1.197 J-.219 P1  F30000
G1 X133.925 Y139.131 Z12.36
G1 Z12.24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X123.581 Y112.283 I-5.933 J-13.131 E2.08612
G3 X129.035 Y111.629 I4.43 J13.876 E.24583
G3 X133.979 Y139.106 I-1.043 J14.371 E1.69241
G1 X134.077 Y139.48 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.314 Y139.792 E.03383
G3 X123.466 Y111.926 I-5.323 J-13.792 E1.9417
G3 X129.055 Y111.255 I4.546 J14.245 E.23253
G3 X134.126 Y139.451 I-1.064 J14.745 E1.6035
M204 S10000
; WIPE_START
G1 F24000
G1 X133.314 Y139.792 E-.33479
G1 X132.534 Y140.074 E-.31512
G1 X132.256 Y140.155 E-.11009
; WIPE_END
G1 E-.04 F1800
G1 X136.375 Y137.526 Z12.64 F30000
G1 Z12.24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X139.729 Y133.784 I-14.578 J-16.442 E.22401
G1 X140.003 Y133.346 E.02301
G1 X135.342 Y138.006 E.2932
G3 X134.129 Y138.667 I-7.745 J-12.782 E.06148
G1 X140.667 Y132.128 E.41133
G2 X141.1 Y131.143 I-8.56 J-4.346 E.04791
G1 X133.14 Y139.103 E.50077
G3 X132.28 Y139.41 I-10.754 J-28.792 E.04058
G1 X141.409 Y130.281 E.57427
G2 X141.633 Y129.504 I-6.805 J-2.384 E.03599
M73 P63 R8
G1 X131.505 Y139.633 E.63717
G3 X130.786 Y139.799 I-1.844 J-6.335 E.03285
G1 X141.796 Y128.788 E.69264
G2 X141.913 Y128.119 I-5.901 J-1.372 E.03024
G1 X130.117 Y139.915 E.74203
G3 X129.485 Y139.994 I-1.022 J-5.589 E.02835
G1 X141.993 Y127.486 E.78686
G2 X142.045 Y126.881 I-5.356 J-.762 E.027
G1 X128.882 Y140.044 E.82805
G3 X128.302 Y140.071 I-.527 J-5.146 E.02582
G1 X142.073 Y126.3 E.86626
G1 X142.071 Y125.749 E.02451
G1 X127.748 Y140.073 E.90104
G3 X127.218 Y140.05 I-.064 J-4.732 E.02362
G1 X142.05 Y125.217 E.93308
G2 X142.015 Y124.7 I-4.629 J.051 E.0231
G1 X126.701 Y140.014 E.96337
G1 X126.203 Y139.959 E.0223
G1 X141.958 Y124.204 E.9911
G2 X141.887 Y123.722 I-4.324 J.392 E.02167
G1 X125.723 Y139.886 E1.01683
G3 X125.251 Y139.805 I.488 J-4.239 E.0213
G1 X141.805 Y123.251 E1.04137
G2 X141.703 Y122.8 I-4.064 J.683 E.02057
G1 X124.8 Y139.704 E1.06334
G3 X124.357 Y139.594 I.756 J-3.999 E.02031
G1 X141.595 Y122.356 E1.08441
G1 X141.47 Y121.928 E.01983
G1 X123.927 Y139.471 E1.10363
G3 X123.509 Y139.336 I.992 J-3.788 E.01954
G1 X141.337 Y121.508 E1.12154
G1 X141.193 Y121.099 E.01927
G1 X123.098 Y139.194 E1.13829
G3 X122.703 Y139.037 I1.204 J-3.6 E.01894
G1 X141.037 Y120.702 E1.15337
G1 X140.874 Y120.312 E.0188
G1 X122.311 Y138.876 E1.16778
G3 X121.936 Y138.698 I1.395 J-3.427 E.01847
G1 X140.698 Y119.936 E1.1803
G1 X140.518 Y119.563 E.0184
G1 X121.562 Y138.519 E1.19242
G1 X121.205 Y138.323 E.01811
G1 X140.323 Y119.205 E1.20262
G1 X140.125 Y118.85 E.01808
G1 X120.85 Y138.125 E1.21253
G1 X120.51 Y137.913 E.01785
G1 X139.913 Y118.51 E1.22059
G1 X139.699 Y118.171 E.01782
G1 X120.176 Y137.694 E1.22812
G1 X119.849 Y137.468 E.01767
G1 X139.47 Y117.847 E1.23426
G1 X139.239 Y117.525 E.01763
G1 X119.525 Y137.239 E1.24015
G1 X119.217 Y136.994 E.0175
G1 X138.994 Y117.217 E1.24414
G1 X138.748 Y116.91 E.01749
G1 X118.911 Y136.748 E1.24792
G1 X118.618 Y136.488 E.01742
G1 X138.488 Y116.618 E1.24996
G1 X138.226 Y116.327 E.01741
G1 X118.327 Y136.226 E1.25179
G1 X118.05 Y135.95 E.01739
G1 X137.95 Y116.05 E1.25189
G1 X137.673 Y115.774 E.01739
G1 X117.774 Y135.673 E1.25179
G1 X117.512 Y135.382 E.01741
G1 X137.382 Y115.512 E1.24996
G1 X137.089 Y115.252 E.01742
G1 X117.252 Y135.09 E1.24792
G1 X117.006 Y134.783 E.01749
G1 X136.783 Y115.006 E1.24414
G1 X136.475 Y114.761 E.0175
G1 X116.761 Y134.475 E1.24014
G1 X116.53 Y134.153 E.01763
G1 X136.153 Y114.53 E1.23438
G1 X135.828 Y114.302 E.01765
G1 X116.301 Y133.829 E1.22839
G1 X116.087 Y133.49 E.01782
G1 X135.49 Y114.087 E1.22059
G1 X135.15 Y113.875 E.01785
G1 X115.875 Y133.15 E1.21253
G1 X115.677 Y132.795 E.01808
G1 X134.795 Y113.677 E1.20262
G1 X134.438 Y113.481 E.01811
G1 X115.482 Y132.437 E1.19242
G1 X115.302 Y132.064 E.0184
G1 X134.064 Y113.302 E1.18029
G2 X133.689 Y113.124 I-1.772 J3.253 E.01847
G1 X115.126 Y131.688 E1.16777
G1 X114.963 Y131.298 E.0188
G1 X133.297 Y112.963 E1.15337
G2 X132.902 Y112.806 I-1.599 J3.443 E.01894
G1 X114.807 Y130.901 E1.13828
G1 X114.663 Y130.492 E.01927
G1 X132.491 Y112.664 E1.12154
G2 X132.073 Y112.529 I-1.41 J3.653 E.01954
G1 X114.53 Y130.072 E1.10362
G1 X114.405 Y129.644 E.01983
G1 X131.643 Y112.406 E1.0844
G2 X131.2 Y112.296 I-1.199 J3.889 E.02031
G1 X114.297 Y129.2 E1.06333
G3 X114.195 Y128.749 I3.964 J-1.134 E.02057
G1 X130.749 Y112.195 E1.04136
G2 X130.277 Y112.114 I-.959 J4.158 E.0213
G1 X114.113 Y128.278 E1.01683
G3 X114.042 Y127.796 I4.254 J-.874 E.02167
G1 X129.796 Y112.042 E.99104
G1 X129.294 Y111.991 E.02244
G1 X113.985 Y127.3 E.96308
G3 X113.95 Y126.782 I4.593 J-.569 E.0231
G1 X128.782 Y111.95 E.93307
G2 X128.252 Y111.927 I-.466 J4.709 E.02362
G1 X113.929 Y126.251 E.90103
G1 X113.927 Y125.699 E.02451
G1 X127.698 Y111.929 E.86626
G2 X127.118 Y111.956 I-.052 J5.174 E.02582
G1 X113.955 Y125.119 E.82804
G3 X114.007 Y124.514 I5.407 J.157 E.027
G1 X126.515 Y112.006 E.78685
G2 X125.882 Y112.087 I.312 J4.986 E.02841
G1 X114.087 Y123.881 E.74195
G3 X114.204 Y123.212 I6.018 J.703 E.03024
G1 X125.206 Y112.209 E.69214
G2 X124.495 Y112.367 I1.285 J7.443 E.03243
G1 X114.367 Y122.496 E.63715
G3 X114.591 Y121.719 I7.032 J1.608 E.03599
G1 X123.719 Y112.59 E.57425
G2 X122.86 Y112.897 I9.895 J29.097 E.04059
G1 X114.9 Y120.857 E.50075
G3 X115.333 Y119.871 I8.991 J3.36 E.04791
G1 X121.864 Y113.34 E.41089
G2 X120.657 Y113.994 I5.977 J12.469 E.06109
G1 X115.997 Y118.654 E.29317
G3 X118.197 Y115.902 I12.145 J7.45 E.15713
G1 X119.624 Y114.474 E.08981
; CHANGE_LAYER
; Z_HEIGHT: 12.52
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X118.21 Y115.888 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 45/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z12.64 I-1.008 J.682 P1  F30000
G1 X133.923 Y139.127 Z12.64
G1 Z12.52
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X123.582 Y112.287 I-5.931 J-13.127 E2.08555
G3 X128.477 Y111.604 I4.449 J13.995 E.22091
G3 X133.978 Y139.102 I-.486 J14.396 E1.71675
G1 X134.076 Y139.475 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.313 Y139.79 E.03389
G3 X126.675 Y140.719 I-5.316 J-13.79 E.27762
G1 X126.675 Y140.719 E0
G3 X113.281 Y124.675 I1.332 J-14.725 E.95307
G1 X113.281 Y124.675 E0
G3 X128.497 Y111.229 I14.726 J1.332 E.91903
G3 X134.127 Y139.447 I-.5 J14.77 E1.62629
M204 S10000
; WIPE_START
G1 F24000
G1 X133.313 Y139.79 E-.33566
G1 X132.533 Y140.07 E-.31504
G1 X132.257 Y140.15 E-.10931
; WIPE_END
G1 E-.04 F1800
G1 X125.09 Y137.526 Z12.92 F30000
G1 X116.477 Y134.373 Z12.92
G1 Z12.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X117.903 Y135.799 E.0897
G2 X120.656 Y137.999 I10.472 J-10.28 E.15715
G1 X115.997 Y133.34 E.29308
G3 X115.337 Y132.127 I12.774 J-7.742 E.06147
G1 X121.873 Y138.664 E.41118
G2 X122.859 Y139.096 I4.345 J-8.556 E.04789
G1 X114.901 Y131.138 E.5006
G3 X114.594 Y130.279 I28.77 J-10.747 E.04057
G1 X123.72 Y139.405 E.57408
G2 X124.497 Y139.629 I2.384 J-6.805 E.03598
G1 X114.372 Y129.504 E.63692
G1 X114.213 Y128.792 E.03246
G1 X125.212 Y139.792 E.69196
G2 X125.882 Y139.909 I1.372 J-5.9 E.03023
G1 X114.09 Y128.117 E.7418
G3 X114.01 Y127.485 I5.586 J-1.022 E.02834
G1 X126.515 Y139.989 E.78661
G2 X127.119 Y140.041 I.762 J-5.354 E.02699
G1 X113.96 Y126.882 E.82779
G3 X113.933 Y126.302 I5.145 J-.527 E.02581
G1 X127.7 Y140.069 E.86599
G1 X128.25 Y140.067 E.02451
G1 X113.932 Y125.748 E.90076
G3 X113.954 Y125.218 I4.731 J-.064 E.02361
G1 X128.782 Y140.046 E.93279
G2 X129.3 Y140.011 I-.051 J-4.628 E.0231
G1 X113.99 Y124.702 E.96307
G1 X114.045 Y124.203 E.02229
M73 P64 R8
G1 X129.795 Y139.954 E.9908
G2 X130.277 Y139.883 I-.392 J-4.324 E.02167
G1 X114.118 Y123.724 E1.01652
G3 X114.199 Y123.252 I4.239 J.488 E.02129
G1 X130.745 Y139.798 E1.04085
G1 X131.196 Y139.697 E.02058
G1 X114.3 Y122.801 E1.06287
G3 X114.41 Y122.358 I3.998 J.756 E.02031
G1 X131.643 Y139.591 E1.08408
G1 X132.071 Y139.466 E.01983
G1 X114.533 Y121.928 E1.10329
G3 X114.668 Y121.51 I3.787 J.992 E.01954
G1 X132.491 Y139.333 E1.1212
G1 X132.899 Y139.189 E.01926
G1 X114.81 Y121.1 E1.13794
G3 X114.967 Y120.704 I3.598 J1.203 E.01894
G1 X133.296 Y139.033 E1.15302
G1 X133.686 Y138.87 E.01879
G1 X115.128 Y120.313 E1.16742
G3 X115.306 Y119.938 I3.427 J1.395 E.01847
G1 X134.063 Y138.694 E1.17994
G1 X134.435 Y138.514 E.0184
G1 X115.485 Y119.564 E1.19206
G1 X115.681 Y119.207 E.01811
G1 X134.793 Y138.319 E1.20226
G1 X135.148 Y138.121 E.01807
G1 X115.878 Y118.852 E1.21217
G1 X116.091 Y118.512 E.01784
G1 X135.488 Y137.909 E1.22022
G1 X135.826 Y137.695 E.01782
G1 X116.305 Y118.174 E1.22802
G1 X116.534 Y117.85 E.01764
G1 X136.15 Y137.466 E1.23401
G1 X136.473 Y137.236 E.01762
G1 X116.765 Y117.528 E1.23977
G1 X117.009 Y117.22 E.0175
G1 X136.78 Y136.991 E1.24376
G1 X137.087 Y136.745 E.01749
G1 X117.255 Y116.913 E1.24755
G1 X117.515 Y116.621 E.01741
G1 X137.379 Y136.485 E1.24958
G1 X137.67 Y136.223 E.01741
G1 X117.777 Y116.33 E1.25141
G1 X118.053 Y116.053 E.01738
G1 X137.947 Y135.947 E1.25151
G1 X138.223 Y135.67 E.01738
G1 X118.33 Y115.777 E1.25141
G1 X118.621 Y115.515 E.01741
G1 X138.485 Y135.379 E1.24958
G1 X138.745 Y135.087 E.01741
G1 X118.913 Y115.255 E1.24755
G1 X119.22 Y115.009 E.01749
G1 X138.991 Y134.78 E1.24376
G1 X139.235 Y134.472 E.0175
G1 X119.527 Y114.764 E1.23977
G1 X119.85 Y114.534 E.01762
G1 X139.466 Y134.15 E1.23401
G1 X139.695 Y133.826 E.01764
G1 X120.174 Y114.305 E1.22802
G1 X120.512 Y114.091 E.01782
G1 X139.909 Y133.488 E1.22022
G1 X140.122 Y133.148 E.01784
G1 X120.852 Y113.879 E1.21217
G1 X121.207 Y113.681 E.01807
G1 X140.319 Y132.793 E1.20226
G1 X140.515 Y132.436 E.01811
G1 X121.565 Y113.486 E1.19206
G1 X121.937 Y113.306 E.0184
G1 X140.694 Y132.062 E1.17994
G2 X140.872 Y131.687 I-3.252 J-1.771 E.01847
G1 X122.314 Y113.13 E1.16742
G1 X122.704 Y112.967 E.01879
G1 X141.033 Y131.296 E1.15302
G2 X141.19 Y130.9 I-3.441 J-1.599 E.01894
G1 X123.101 Y112.811 E1.13794
G1 X123.509 Y112.667 E.01926
G1 X141.332 Y130.49 E1.1212
G2 X141.467 Y130.072 I-3.652 J-1.409 E.01954
G1 X123.929 Y112.534 E1.10329
G1 X124.357 Y112.409 E.01983
G1 X141.59 Y129.642 E1.08408
G2 X141.699 Y129.199 I-3.889 J-1.199 E.02031
G1 X124.801 Y112.301 E1.06302
G3 X125.252 Y112.199 I1.133 J3.962 E.02056
G1 X141.798 Y128.745 E1.04086
G1 X141.88 Y128.274 E.02125
G1 X125.723 Y112.117 E1.01638
G3 X126.205 Y112.046 I.873 J4.253 E.02167
G1 X141.955 Y127.797 E.9908
G1 X142.009 Y127.298 E.02229
G1 X126.7 Y111.989 E.96308
G3 X127.218 Y111.954 I.569 J4.593 E.0231
G1 X142.046 Y126.782 E.93279
G2 X142.068 Y126.252 I-4.708 J-.466 E.02361
G1 X127.751 Y111.935 E.90067
G1 X128.306 Y111.937 E.02468
G1 X142.067 Y125.698 E.86566
G2 X142.04 Y125.118 I-5.172 J-.052 E.02581
G1 X128.881 Y111.959 E.82779
G3 X129.485 Y112.011 I-.157 J5.405 E.02699
G1 X141.99 Y124.515 E.78661
G2 X141.91 Y123.883 I-5.666 J.39 E.02834
G1 X130.118 Y112.091 E.7418
G3 X130.788 Y112.208 I-.702 J6.015 E.03023
G1 X141.795 Y123.215 E.69243
G2 X141.628 Y122.496 I-6.485 J1.121 E.03284
G1 X131.503 Y112.371 E.63697
G3 X132.28 Y112.595 I-1.607 J7.029 E.03598
G1 X141.406 Y121.721 E.57409
G2 X141.099 Y120.862 I-29.101 J9.896 E.04057
G1 X133.141 Y112.904 E.50061
G3 X134.127 Y113.336 I-3.359 J8.989 E.04789
G1 X140.663 Y119.873 E.41119
G2 X140.003 Y118.66 I-13.436 J6.529 E.06147
G1 X135.344 Y114.001 E.29309
G1 X135.782 Y114.274 E.02299
G3 X139.523 Y117.627 I-12.699 J17.93 E.22394
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X138.108 Y116.214 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 46/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z12.92 I-1.197 J-.219 P1  F30000
G1 X133.918 Y139.117 Z12.92
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X119.966 Y114.056 I-5.927 J-13.114 E1.90417
G3 X128.759 Y111.631 I8.018 J11.918 E.41291
G3 X133.973 Y139.092 I-.768 J14.371 E1.70257
G1 X134.073 Y139.463 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.309 Y139.779 E.03395
G3 X119.082 Y114.227 I-5.317 J-13.776 E1.73538
G3 X128.779 Y111.257 I8.923 J11.82 E.42501
G3 X134.123 Y139.436 I-.787 J14.746 E1.61282
M204 S10000
; WIPE_START
G1 F24000
G1 X133.309 Y139.779 E-.33583
G1 X132.529 Y140.058 E-.31478
G1 X132.253 Y140.139 E-.10939
; WIPE_END
G1 E-.04 F1800
G1 X136.366 Y137.513 Z13.2 F30000
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X139.715 Y133.775 I-14.574 J-16.432 E.22374
G1 X139.988 Y133.338 E.02294
G1 X135.334 Y137.992 E.29277
G3 X134.122 Y138.652 I-7.732 J-12.757 E.06142
G1 X140.652 Y132.122 E.41079
G2 X141.085 Y131.137 I-8.551 J-4.342 E.04785
G1 X133.134 Y139.088 E.50013
G3 X132.276 Y139.394 I-10.743 J-28.757 E.04054
G1 X141.393 Y130.276 E.57356
G2 X141.617 Y129.5 I-6.798 J-2.382 E.03595
G1 X131.501 Y139.616 E.63638
G3 X130.783 Y139.783 I-1.838 J-6.312 E.03281
G1 X141.78 Y128.785 E.6918
G2 X141.896 Y128.117 I-5.895 J-1.371 E.0302
G1 X130.115 Y139.898 E.74113
G3 X129.484 Y139.977 I-1.021 J-5.582 E.02832
G1 X141.977 Y127.484 E.78591
G2 X142.028 Y126.88 I-5.35 J-.761 E.02697
G1 X128.881 Y140.028 E.82705
G3 X128.302 Y140.054 I-.527 J-5.14 E.02579
G1 X142.056 Y126.3 E.86522
G1 X142.055 Y125.75 E.02449
G1 X127.748 Y140.056 E.89996
G3 X127.219 Y140.034 I-.064 J-4.726 E.02359
G1 X142.034 Y125.219 E.93196
G2 X141.999 Y124.701 I-4.623 J.051 E.02308
G1 X126.703 Y139.997 E.96222
G1 X126.205 Y139.943 E.02227
G1 X141.941 Y124.206 E.98992
G2 X141.87 Y123.725 I-4.319 J.391 E.02165
G1 X125.726 Y139.87 E1.01562
G3 X125.255 Y139.789 I.487 J-4.233 E.02127
G1 X141.789 Y123.255 E1.04013
G2 X141.687 Y122.804 I-4.06 J.682 E.02055
G1 X124.804 Y139.687 E1.06208
G3 X124.361 Y139.578 I.755 J-3.995 E.02029
G1 X141.579 Y122.36 E1.08312
G1 X141.455 Y121.932 E.01981
G1 X123.932 Y139.455 E1.10232
G3 X123.514 Y139.321 I.991 J-3.784 E.01952
G1 X141.321 Y121.513 E1.12021
G1 X141.177 Y121.105 E.01925
G1 X123.104 Y139.179 E1.13694
G3 X122.709 Y139.021 I1.202 J-3.595 E.01892
G1 X141.022 Y120.709 E1.15201
G1 X140.859 Y120.319 E.01877
G1 X122.318 Y138.861 E1.16639
G3 X121.943 Y138.683 I1.394 J-3.425 E.01845
G1 X140.683 Y119.943 E1.1789
G1 X140.503 Y119.571 E.01838
G1 X121.57 Y138.504 E1.19101
G1 X121.213 Y138.308 E.01809
G1 X140.308 Y119.213 E1.2012
G1 X140.111 Y118.859 E.01806
G1 X120.859 Y138.111 E1.2111
G1 X120.519 Y137.899 E.01783
G1 X139.899 Y118.519 E1.21915
G1 X139.685 Y118.18 E.0178
M73 P65 R8
G1 X120.181 Y137.684 E1.22694
G1 X119.857 Y137.456 E.01763
G1 X139.456 Y117.857 E1.23292
G1 X139.226 Y117.535 E.01761
G1 X119.535 Y137.226 E1.23868
G1 X119.227 Y136.981 E.01748
G1 X138.981 Y117.227 E1.24267
G1 X138.736 Y116.921 E.01747
G1 X118.921 Y136.735 E1.24645
G1 X118.629 Y136.475 E.0174
G1 X138.475 Y116.629 E1.24848
G1 X138.214 Y116.338 E.01739
G1 X118.338 Y136.214 E1.25031
G1 X118.061 Y135.939 E.01737
G1 X137.939 Y116.061 E1.25041
G1 X137.662 Y115.786 E.01737
G1 X117.786 Y135.662 E1.25031
G1 X117.525 Y135.371 E.01739
G1 X137.371 Y115.525 E1.24848
G1 X137.079 Y115.265 E.0174
G1 X117.264 Y135.079 E1.24645
G1 X117.019 Y134.773 E.01747
G1 X136.773 Y115.019 E1.24267
G1 X136.465 Y114.774 E.01748
G1 X116.774 Y134.465 E1.23868
G1 X116.544 Y134.143 E.01761
G1 X136.143 Y114.544 E1.23292
G1 X135.819 Y114.316 E.01763
G1 X116.315 Y133.82 E1.22694
G1 X116.101 Y133.481 E.0178
G1 X135.481 Y114.101 E1.21914
G1 X135.141 Y113.889 E.01783
G1 X115.889 Y133.141 E1.2111
G1 X115.692 Y132.787 E.01806
G1 X134.786 Y113.692 E1.2012
G1 X134.43 Y113.496 E.01809
G1 X115.497 Y132.429 E1.19101
M73 P65 R7
G1 X115.317 Y132.057 E.01838
G1 X134.057 Y113.317 E1.1789
G2 X133.682 Y113.139 I-1.768 J3.247 E.01845
G1 X115.141 Y131.681 E1.16639
G1 X114.978 Y131.291 E.01877
G1 X133.291 Y112.979 E1.15201
G2 X132.896 Y112.821 I-1.597 J3.438 E.01892
G1 X114.823 Y130.895 E1.13694
G1 X114.678 Y130.487 E.01925
G1 X132.486 Y112.679 E1.12021
G2 X132.068 Y112.545 I-1.408 J3.649 E.01952
G1 X114.545 Y130.068 E1.10232
G1 X114.421 Y129.64 E.01981
G1 X131.639 Y112.422 E1.08312
G2 X131.196 Y112.313 I-1.197 J3.885 E.02029
G1 X114.313 Y129.196 E1.06207
G3 X114.211 Y128.745 I3.96 J-1.133 E.02055
G1 X130.745 Y112.211 E1.04013
G2 X130.274 Y112.13 I-.958 J4.153 E.02127
G1 X114.13 Y128.275 E1.01562
G3 X114.059 Y127.794 I4.249 J-.872 E.02165
G1 X129.795 Y112.057 E.98992
G1 X129.297 Y112.003 E.02227
G1 X114.001 Y127.299 E.96222
G3 X113.966 Y126.781 I4.589 J-.569 E.02308
G1 X128.742 Y111.964 E.93077
G2 X128.252 Y111.944 I-.427 J4.351 E.02182
G1 X113.945 Y126.25 E.89996
G1 X113.944 Y125.7 E.02449
G1 X127.698 Y111.946 E.86522
G2 X127.119 Y111.972 I-.052 J5.167 E.02579
G1 X113.972 Y125.119 E.82705
G3 X114.023 Y124.516 I5.401 J.157 E.02697
G1 X126.516 Y112.023 E.7859
G2 X125.885 Y112.102 I.39 J5.662 E.02832
G1 X114.104 Y123.883 E.74113
G3 X114.22 Y123.215 I6.01 J.702 E.0302
G1 X125.217 Y112.217 E.69179
G2 X124.499 Y112.384 I1.124 J6.498 E.03281
G1 X114.383 Y122.5 E.63638
G3 X114.607 Y121.724 I7.022 J1.606 E.03595
G1 X123.724 Y112.606 E.57355
G2 X122.866 Y112.912 I9.887 J29.07 E.04054
G1 X114.916 Y120.863 E.50012
G3 X115.348 Y119.878 I8.98 J3.356 E.04786
G1 X121.878 Y113.348 E.41078
G2 X120.665 Y114.008 I6.519 J13.414 E.06143
G1 X116.012 Y118.662 E.29275
G3 X118.25 Y115.872 I12.182 J7.478 E.15951
G1 X119.634 Y114.487 E.08711
; CHANGE_LAYER
; Z_HEIGHT: 13.08
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X118.25 Y115.872 E-.74412
G1 X118.221 Y115.903 E-.01588
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 47/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z13.2 I-1.008 J.682 P1  F30000
G1 X133.912 Y139.103 Z13.2
G1 Z13.08
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X124.364 Y112.085 I-5.921 J-13.104 E2.11783
G3 X129.041 Y111.658 I3.621 J13.851 E.20984
G3 X133.967 Y139.078 I-1.05 J14.341 E1.68855
G1 X134.067 Y139.446 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X123.475 Y111.954 I-6.075 J-13.446 E1.97185
G3 X129.061 Y111.284 I4.545 J14.278 E.23238
G3 X134.122 Y139.421 I-1.069 J14.716 E1.59974
M204 S10000
; WIPE_START
G1 F24000
G1 X133.306 Y139.77 E-.33728
G1 X132.525 Y140.046 E-.31456
G1 X132.252 Y140.126 E-.10816
; WIPE_END
G1 E-.04 F1800
G1 X125.085 Y137.502 Z13.48 F30000
G1 X116.497 Y134.359 Z13.48
G1 Z13.08
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X117.842 Y135.703 E.08455
G2 X120.668 Y137.977 I10.338 J-9.952 E.16182
G1 X116.019 Y133.329 E.29243
G3 X115.36 Y132.117 I12.736 J-7.721 E.06139
G1 X121.883 Y138.641 E.41038
G2 X122.867 Y139.073 I4.338 J-8.542 E.04782
G1 X114.924 Y131.13 E.49965
G3 X114.618 Y130.272 I28.724 J-10.733 E.04051
G1 X123.727 Y139.381 E.57302
G2 X124.503 Y139.605 I2.38 J-6.792 E.03592
G1 X114.396 Y129.498 E.63579
G3 X114.23 Y128.781 I6.285 J-1.832 E.03278
G1 X125.217 Y139.768 E.69117
G2 X125.885 Y139.884 I1.37 J-5.889 E.03018
G1 X114.114 Y128.113 E.74046
G3 X114.035 Y127.483 I5.577 J-1.02 E.0283
G1 X126.517 Y139.964 E.7852
G2 X127.12 Y140.016 I.76 J-5.345 E.02694
G1 X113.985 Y126.881 E.82631
G3 X113.958 Y126.302 I5.136 J-.527 E.02577
G1 X127.7 Y140.044 E.86445
G1 X128.25 Y140.042 E.02446
G1 X113.956 Y125.749 E.89915
G3 X113.979 Y125.22 I4.722 J-.064 E.02357
G1 X128.78 Y140.021 E.93113
G2 X129.297 Y139.986 I-.051 J-4.62 E.02306
G1 X114.015 Y124.704 E.96136
G1 X114.07 Y124.207 E.02225
G1 X129.792 Y139.929 E.98904
G2 X130.273 Y139.858 I-.391 J-4.316 E.02163
G1 X114.142 Y123.728 E1.01472
G3 X114.223 Y123.257 I4.229 J.486 E.02125
G1 X130.743 Y139.777 E1.0392
G2 X131.193 Y139.675 I-.681 J-4.055 E.02053
G1 X114.325 Y122.807 E1.06113
G3 X114.434 Y122.365 I3.992 J.754 E.02027
G1 X131.637 Y139.567 E1.08216
G1 X132.064 Y139.443 E.01979
G1 X114.556 Y121.935 E1.10134
G3 X114.691 Y121.518 I3.78 J.99 E.0195
G1 X132.483 Y139.31 E1.11922
G1 X132.89 Y139.166 E.01923
G1 X114.833 Y121.108 E1.13593
G3 X114.99 Y120.714 I3.593 J1.201 E.0189
G1 X133.287 Y139.01 E1.15099
G1 X133.676 Y138.848 E.01876
G1 X115.151 Y120.323 E1.16536
G3 X115.328 Y119.948 I3.423 J1.394 E.01843
G1 X134.052 Y138.672 E1.17786
G1 X134.423 Y138.492 E.01836
G1 X115.507 Y119.576 E1.18996
G1 X115.703 Y119.22 E.01807
G1 X134.781 Y138.298 E1.20014
G1 X135.135 Y138.1 E.01804
G1 X115.9 Y118.865 E1.21003
G1 X116.112 Y118.525 E.01781
G1 X135.475 Y137.888 E1.21807
G1 X135.813 Y137.675 E.01779
G1 X116.326 Y118.188 E1.22585
G1 X116.554 Y117.864 E.01761
G1 X136.136 Y137.446 E1.23184
G1 X136.458 Y137.216 E.01759
G1 X116.784 Y117.543 E1.23759
G1 X117.028 Y117.235 E.01747
G1 X136.765 Y136.972 E1.24158
G1 X137.071 Y136.726 E.01746
G1 X117.274 Y116.929 E1.24535
G1 X117.534 Y116.637 E.01738
G1 X137.363 Y136.466 E1.24738
G1 X137.653 Y136.205 E.01738
G1 X117.795 Y116.347 E1.24921
G1 X118.07 Y116.07 E.01735
G1 X137.93 Y135.93 E1.24931
G1 X138.205 Y135.653 E.01735
G1 X118.347 Y115.795 E1.24921
G1 X118.637 Y115.534 E.01738
G1 X138.466 Y135.363 E1.24738
G1 X138.726 Y135.071 E.01738
G1 X118.929 Y115.274 E1.24535
G1 X119.235 Y115.028 E.01746
G1 X138.972 Y134.765 E1.24158
G1 X139.216 Y134.457 E.01747
G1 X119.542 Y114.784 E1.23759
G1 X119.864 Y114.554 E.01759
G1 X139.444 Y134.134 E1.23172
G1 X139.67 Y133.808 E.01763
G1 X120.187 Y114.326 E1.2256
G1 X120.525 Y114.112 E.01779
G1 X139.888 Y133.475 E1.21807
G1 X140.1 Y133.135 E.01781
G1 X120.865 Y113.9 E1.21003
G1 X121.219 Y113.703 E.01804
M73 P66 R7
G1 X140.297 Y132.781 E1.20014
G1 X140.493 Y132.424 E.01807
G1 X121.577 Y113.508 E1.18996
G1 X121.948 Y113.328 E.01836
G1 X140.672 Y132.052 E1.17786
G2 X140.849 Y131.677 I-3.243 J-1.766 E.01843
G1 X122.324 Y113.152 E1.16537
G1 X122.713 Y112.99 E.01876
G1 X141.01 Y131.286 E1.15099
G2 X141.167 Y130.892 I-3.435 J-1.596 E.0189
G1 X123.11 Y112.834 E1.13593
G1 X123.517 Y112.69 E.01923
G1 X141.309 Y130.482 E1.11922
G2 X141.444 Y130.065 I-3.646 J-1.407 E.0195
G1 X123.936 Y112.557 E1.10134
G1 X124.363 Y112.433 E.01979
G1 X141.566 Y129.635 E1.08216
G2 X141.675 Y129.193 I-3.882 J-1.197 E.02027
G1 X124.807 Y112.325 E1.06114
G3 X125.257 Y112.223 I1.131 J3.956 E.02053
G1 X141.777 Y128.743 E1.03921
G2 X141.858 Y128.272 I-4.15 J-.957 E.02125
G1 X125.727 Y112.142 E1.01472
G3 X126.208 Y112.071 I.872 J4.246 E.02163
G1 X141.93 Y127.793 E.98904
G1 X141.985 Y127.296 E.02225
G1 X126.703 Y112.014 E.96137
G3 X127.219 Y111.979 I.568 J4.584 E.02306
G1 X142.021 Y126.781 E.93113
G2 X142.044 Y126.251 I-4.7 J-.465 E.02357
G1 X127.75 Y111.958 E.89916
G1 X128.3 Y111.956 E.02446
G1 X142.042 Y125.698 E.86445
G2 X142.015 Y125.12 I-5.163 J-.052 E.02577
G1 X128.88 Y111.984 E.82631
G3 X129.487 Y112.039 I-.264 J6.259 E.02712
G1 X141.965 Y124.518 E.78497
G2 X141.885 Y123.886 I-5.006 J.315 E.02835
G1 X130.115 Y112.116 E.74039
G3 X130.783 Y112.232 I-.702 J6.006 E.03018
G1 X141.763 Y123.212 E.69071
G2 X141.604 Y122.502 I-7.372 J1.274 E.03239
G1 X131.497 Y112.395 E.6358
G3 X132.273 Y112.619 I-1.605 J7.017 E.03592
G1 X141.382 Y121.728 E.57303
G2 X141.076 Y120.87 I-29.031 J9.875 E.04051
G1 X133.133 Y112.927 E.49966
G3 X134.117 Y113.359 I-3.354 J8.974 E.04782
G1 X140.641 Y119.883 E.41039
G2 X139.981 Y118.671 I-13.397 J6.51 E.06138
G1 X135.332 Y114.023 E.29245
G1 X135.768 Y114.295 E.02289
G3 X139.503 Y117.642 I-12.691 J17.917 E.22354
; CHANGE_LAYER
; Z_HEIGHT: 13.36
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X138.087 Y116.229 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 48/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z13.48 I-1.197 J-.219 P1  F30000
G1 X133.904 Y139.086 Z13.48
G1 Z13.36
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X123.596 Y112.33 I-5.913 J-13.085 E2.07905
G3 X128.484 Y111.649 I4.433 J13.944 E.22059
G3 X133.959 Y139.061 I-.493 J14.351 E1.71095
G1 X134.058 Y139.426 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X122.702 Y112.248 I-6.066 J-13.427 E1.93503
G3 X128.504 Y111.275 I5.283 J13.708 E.24323
G3 X134.113 Y139.401 I-.512 J14.724 E1.62027
M204 S10000
; WIPE_START
G1 F24000
G1 X133.298 Y139.752 E-.33684
G1 X132.519 Y140.027 E-.31413
G1 X132.244 Y140.107 E-.10903
; WIPE_END
G1 E-.04 F1800
G1 X136.333 Y137.496 Z13.76 F30000
G1 Z13.36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X139.688 Y133.757 I-15.312 J-17.116 E.22389
G1 X139.979 Y133.292 E.0244
G1 X135.288 Y137.983 E.29508
G3 X134.072 Y138.64 I-7.893 J-13.146 E.06151
G1 X140.64 Y132.072 E.41317
G2 X141.072 Y131.081 I-8.61 J-4.348 E.04813
G1 X133.077 Y139.076 E.50295
G3 X132.218 Y139.377 I-10.506 J-28.647 E.04049
G1 X141.371 Y130.224 E.57578
G2 X141.6 Y129.436 I-6.057 J-2.189 E.03651
G1 X131.44 Y139.596 E.63914
G1 X130.721 Y139.757 E.03279
G1 X141.762 Y128.715 E.69459
G2 X141.875 Y128.044 I-5.922 J-1.344 E.03032
G1 X130.041 Y139.878 E.74445
G3 X129.407 Y139.953 I-.99 J-5.611 E.02842
G1 X141.952 Y127.408 E.78917
G2 X142 Y126.802 I-5.373 J-.726 E.02706
G1 X128.802 Y140 E.83021
G3 X128.221 Y140.022 I-.489 J-5.161 E.02587
G1 X142.023 Y126.22 E.86824
G1 X142.022 Y125.663 E.02477
G1 X127.661 Y140.024 E.90338
G3 X127.13 Y139.996 I-.02 J-4.746 E.02366
G1 X141.996 Y125.131 E.93515
G2 X141.956 Y124.612 I-4.636 J.098 E.02314
G1 X126.613 Y139.955 E.96515
G1 X126.11 Y139.899 E.02253
G1 X141.898 Y124.111 E.99317
G2 X141.821 Y123.63 I-4.328 J.443 E.02171
G1 X125.63 Y139.821 E1.01854
G3 X125.158 Y139.734 I.541 J-4.24 E.02133
G1 X141.735 Y123.157 E1.04281
G1 X141.63 Y122.703 E.02071
G1 X124.702 Y139.631 E1.06489
G3 X124.26 Y139.515 I.813 J-3.997 E.02036
G1 X141.516 Y122.259 E1.08551
G1 X141.39 Y121.827 E.02004
G1 X123.825 Y139.391 E1.10493
G3 X123.408 Y139.249 I1.054 J-3.784 E.01959
G1 X141.25 Y121.408 E1.12235
G1 X141.104 Y120.995 E.01947
G1 X122.995 Y139.104 E1.13914
G1 X122.599 Y138.941 E.01904
G1 X140.941 Y120.6 E1.15381
G2 X140.775 Y120.207 I-3.581 J1.28 E.01897
G1 X122.208 Y138.774 E1.16799
G1 X121.83 Y138.593 E.01863
G1 X140.593 Y119.831 E1.18028
G2 X140.407 Y119.458 I-3.413 J1.466 E.01854
G1 X121.459 Y138.406 E1.19196
G1 X121.098 Y138.208 E.0183
G1 X140.207 Y119.099 E1.20208
G2 X140.003 Y118.745 I-3.257 J1.64 E.0182
G1 X120.746 Y138.002 E1.21142
G1 X120.402 Y137.787 E.01803
G1 X139.787 Y118.403 E1.21944
G2 X139.565 Y118.066 I-3.11 J1.805 E.01795
G1 X120.067 Y137.564 E1.22658
G1 X119.739 Y137.333 E.01783
G1 X139.332 Y117.74 E1.23255
G2 X139.094 Y117.42 I-2.97 J1.963 E.01777
G1 X119.421 Y137.093 E1.23759
G1 X119.109 Y136.846 E.01769
G1 X138.845 Y117.11 E1.24155
G2 X138.591 Y116.806 I-2.833 J2.115 E.01765
G1 X118.807 Y136.59 E1.24454
G1 X118.511 Y136.327 E.0176
G1 X138.326 Y116.512 E1.24651
G2 X138.056 Y116.224 I-2.7 J2.265 E.01759
G1 X118.225 Y136.055 E1.24751
G1 X117.944 Y135.776 E.01757
G1 X137.775 Y115.945 E1.24751
G2 X137.489 Y115.673 I-2.567 J2.413 E.01758
G1 X117.674 Y135.488 E1.24651
G1 X117.409 Y135.194 E.01759
G1 X137.193 Y115.41 E1.24454
G2 X136.891 Y115.154 I-2.433 J2.563 E.01764
G1 X117.155 Y134.89 E1.24154
G1 X116.906 Y134.58 E.01767
G1 X136.579 Y114.907 E1.23759
G2 X136.261 Y114.667 I-2.297 J2.715 E.01775
G1 X116.668 Y134.26 E1.23255
G1 X116.435 Y133.934 E.01781
G1 X135.933 Y114.436 E1.22658
G2 X135.598 Y114.213 I-2.157 J2.873 E.01793
G1 X116.213 Y133.597 E1.21944
G1 X115.997 Y133.255 E.01801
G1 X135.254 Y113.998 E1.21142
G2 X134.902 Y113.792 I-2.009 J3.037 E.01817
G1 X115.793 Y132.901 E1.20208
G1 X115.593 Y132.542 E.01827
G1 X134.541 Y113.594 E1.19195
G2 X134.17 Y113.407 I-1.854 J3.211 E.01851
G1 X115.407 Y132.169 E1.18028
G1 X115.225 Y131.793 E.01859
G1 X133.792 Y113.226 E1.16799
G2 X133.4 Y113.059 I-1.686 J3.399 E.01894
G1 X115.059 Y131.4 E1.15381
G3 X114.896 Y131.005 I3.441 J-1.647 E.01904
G1 X133.005 Y112.896 E1.13914
G2 X132.592 Y112.751 I-1.504 J3.603 E.01948
G1 X114.75 Y130.592 E1.12235
G3 X114.61 Y130.173 I3.656 J-1.456 E.01964
G1 X132.175 Y112.609 E1.10493
G1 X131.74 Y112.485 E.02011
G1 X114.484 Y129.741 E1.08551
G3 X114.371 Y129.295 I3.437 J-1.107 E.02047
G1 X131.298 Y112.369 E1.06478
G1 X130.842 Y112.266 E.02079
G1 X114.269 Y128.839 E1.04251
G3 X114.179 Y128.37 I4.78 J-1.164 E.02122
G1 X130.37 Y112.179 E1.01854
G2 X129.89 Y112.101 I-.938 J4.234 E.02165
G1 X114.102 Y127.888 E.99316
G1 X114.044 Y127.388 E.02242
G1 X129.387 Y112.045 E.96514
G2 X128.87 Y112.004 I-.629 J4.581 E.02308
G1 X114.004 Y126.869 E.93514
G3 X113.978 Y126.337 I4.729 J-.497 E.02373
G1 X128.333 Y111.982 E.903
G1 X127.777 Y111.98 E.02474
G1 X113.977 Y125.78 E.86813
G3 X114 Y125.198 I5.195 J-.081 E.02593
G1 X127.198 Y112 E.83021
G2 X126.593 Y112.047 I.11 J5.408 E.027
G1 X114.048 Y124.592 E.78917
G3 X114.125 Y123.956 I5.696 J.366 E.02848
G1 X125.959 Y112.122 E.74444
G1 X125.283 Y112.239 E.03049
G1 X114.238 Y123.284 E.69482
M73 P67 R7
G1 X114.4 Y122.564 E.03286
G1 X124.561 Y112.403 E.6392
G2 X123.782 Y112.623 I1.576 J7.049 E.03605
G1 X114.62 Y121.785 E.57633
G3 X114.928 Y120.919 I30.382 J10.298 E.04088
G1 X122.923 Y112.924 E.50293
G2 X121.928 Y113.36 I3.386 J9.075 E.04833
G1 X115.36 Y119.928 E.41315
G3 X116.028 Y118.702 I12.199 J5.846 E.06212
G1 X120.712 Y114.018 E.29467
G2 X118.366 Y115.805 I10.178 J15.791 E.13133
G1 X116.501 Y117.67 E.11733
; CHANGE_LAYER
; Z_HEIGHT: 13.64
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X117.915 Y116.256 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 49/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z13.76 I-.997 J.698 P1  F30000
G1 X133.894 Y139.061 Z13.76
G1 Z13.64
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X119.999 Y114.107 I-5.902 J-13.059 E1.89614
G3 X128.765 Y111.692 I7.984 J11.868 E.41158
G3 X133.948 Y139.037 I-.774 J14.31 E1.69497
G1 X134.05 Y139.407 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X134.048 Y139.403 E.00019
G3 X128.785 Y111.318 I-6.048 J-13.402 E2.18487
G3 X140.849 Y118.853 I-.761 J14.643 E.60978
G1 X140.849 Y118.853 E0
G3 X134.79 Y139.043 I-12.85 J7.147 E.96499
G1 X134.104 Y139.38 E.03138
M204 S10000
; WIPE_START
G1 F24000
G1 X134.048 Y139.403 E-.02303
G1 X133.288 Y139.725 E-.31348
G1 X132.51 Y140 E-.31353
G1 X132.233 Y140.081 E-.10996
; WIPE_END
G1 E-.04 F1800
G1 X124.76 Y138.53 Z14.04 F30000
G1 X119.687 Y137.476 Z14.04
G1 Z13.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X117.83 Y135.62 E.11678
G3 X116.042 Y133.275 I13.97 J-12.503 E.1313
G1 X120.721 Y137.954 E.29433
G2 X121.939 Y138.614 I7.462 J-12.308 E.06165
G1 X115.386 Y132.061 E.41224
G3 X114.951 Y131.068 I8.621 J-4.372 E.04824
G1 X122.928 Y139.046 E.50186
G2 X123.793 Y139.353 I11.166 J-30.072 E.04081
G1 X114.65 Y130.21 E.57512
G3 X114.43 Y129.433 I6.815 J-2.351 E.03598
G1 X124.57 Y139.573 E.63788
G1 X125.289 Y139.735 E.03279
G1 X114.267 Y128.712 E.6934
G1 X114.15 Y128.038 E.03043
G1 X125.96 Y139.848 E.74292
G2 X126.594 Y139.924 I1 J-5.608 E.02843
G1 X114.075 Y127.405 E.78756
G3 X114.028 Y126.801 I5.353 J-.714 E.02695
G1 X127.199 Y139.972 E.82852
G2 X127.78 Y139.995 I.5 J-5.16 E.02588
G1 X114.006 Y126.221 E.86648
G1 X114.004 Y125.662 E.02487
G1 X128.336 Y139.994 E.90155
G2 X128.867 Y139.968 I.035 J-4.746 E.02369
G1 X114.032 Y125.132 E.93326
G3 X114.073 Y124.616 I4.614 J.112 E.02304
G1 X129.385 Y139.928 E.9632
G1 X129.884 Y139.87 E.02237
G1 X114.128 Y124.114 E.99117
G3 X114.207 Y123.635 I4.305 J.457 E.02161
G1 X130.365 Y139.793 E1.01649
G2 X130.837 Y139.708 I-.524 J-4.246 E.02135
G1 X114.294 Y123.164 E1.04071
G1 X114.396 Y122.709 E.02075
G1 X131.29 Y139.603 E1.06275
G2 X131.733 Y139.489 I-.796 J-4.003 E.02037
G1 X114.512 Y122.268 E1.08333
G1 X114.635 Y121.834 E.02007
G1 X132.165 Y139.363 E1.10272
G2 X132.583 Y139.223 I-1.035 J-3.789 E.0196
G1 X114.777 Y121.418 E1.1201
G3 X114.922 Y121.006 I3.742 J1.089 E.01945
G1 X132.994 Y139.078 E1.13686
G2 X133.389 Y138.915 I-1.25 J-3.598 E.01901
G1 X115.085 Y120.61 E1.1515
G3 X115.252 Y120.22 I3.559 J1.293 E.0189
G1 X133.781 Y138.75 E1.16565
G1 X134.157 Y138.568 E.01856
G1 X115.432 Y119.843 E1.17792
G3 X115.619 Y119.472 I3.392 J1.479 E.01847
G1 X134.529 Y138.382 E1.18957
G1 X134.887 Y138.183 E.01823
G1 X115.816 Y119.112 E1.19968
G3 X116.022 Y118.76 I3.237 J1.654 E.01814
G1 X135.241 Y137.979 E1.209
G1 X135.582 Y137.763 E.01797
G1 X116.236 Y118.417 E1.217
G3 X116.459 Y118.083 I3.09 J1.818 E.01789
G1 X135.918 Y137.542 E1.22413
G1 X136.244 Y137.31 E.01778
G1 X116.69 Y117.756 E1.23009
G3 X116.929 Y117.438 I2.95 J1.975 E.01771
G1 X136.563 Y137.072 E1.23511
G1 X136.872 Y136.824 E.01764
G1 X117.176 Y117.127 E1.23907
G3 X117.431 Y116.825 I2.813 J2.127 E.0176
G1 X137.176 Y136.569 E1.24205
G1 X137.469 Y136.305 E.01756
G1 X117.694 Y116.53 E1.24402
G3 X117.965 Y116.244 I2.68 J2.276 E.01755
G1 X137.757 Y136.036 E1.24502
G1 X138.035 Y135.756 E.01753
G1 X118.243 Y115.965 E1.24502
G3 X118.531 Y115.695 I2.547 J2.424 E.01755
G1 X138.306 Y135.47 E1.24402
G1 X138.569 Y135.175 E.01756
G1 X118.824 Y115.431 E1.24206
G3 X119.128 Y115.176 I2.415 J2.574 E.01761
G1 X138.824 Y134.873 E1.23907
G1 X139.071 Y134.562 E.01765
G1 X119.437 Y114.928 E1.23511
G3 X119.756 Y114.69 I2.278 J2.725 E.01773
G1 X139.31 Y134.244 E1.23009
G1 X139.541 Y133.917 E.01779
G1 X120.082 Y114.458 E1.22413
G3 X120.418 Y114.237 I2.138 J2.883 E.01791
G1 X139.764 Y133.583 E1.217
G1 X139.978 Y133.24 E.018
G1 X120.759 Y114.021 E1.209
G3 X121.113 Y113.817 I1.991 J3.047 E.01817
G1 X140.184 Y132.888 E1.19968
G1 X140.381 Y132.528 E.01826
G1 X121.471 Y113.618 E1.18957
G3 X121.843 Y113.432 I1.835 J3.22 E.0185
G1 X140.568 Y132.157 E1.17792
G1 X140.748 Y131.78 E.0186
G1 X122.218 Y113.25 E1.16565
G3 X122.611 Y113.085 I1.669 J3.409 E.01894
G1 X140.915 Y131.39 E1.1515
G1 X141.078 Y130.994 E.019
G1 X123.005 Y112.922 E1.13686
G1 X123.417 Y112.777 E.01943
G1 X141.223 Y130.582 E1.1201
G2 X141.364 Y130.166 I-3.633 J-1.467 E.01956
G1 X123.835 Y112.637 E1.10272
G1 X124.267 Y112.511 E.02
G1 X141.488 Y129.732 E1.08334
G2 X141.604 Y129.291 I-3.873 J-1.253 E.02032
G1 X124.71 Y112.397 E1.06275
G1 X125.163 Y112.292 E.02067
G1 X141.706 Y128.836 E1.04071
G2 X141.793 Y128.365 I-4.146 J-1.01 E.02129
G1 X125.635 Y112.207 E1.01649
G3 X126.116 Y112.13 I.923 J4.243 E.02167
G1 X141.872 Y127.886 E.99117
G1 X141.927 Y127.384 E.02248
G1 X126.615 Y112.072 E.9632
G3 X127.133 Y112.032 I.615 J4.587 E.0231
G1 X141.968 Y126.868 E.93326
G2 X141.996 Y126.338 I-4.71 J-.51 E.02362
G1 X127.664 Y112.006 E.90155
G1 X128.22 Y112.005 E.02472
G1 X141.994 Y125.779 E.86648
G2 X141.972 Y125.199 I-5.174 J-.091 E.02582
G1 X128.801 Y112.028 E.82853
G3 X129.406 Y112.076 I-.12 J5.41 E.02701
G1 X141.925 Y124.595 E.78757
G2 X141.85 Y123.962 I-35.318 J3.89 E.02835
G1 X130.04 Y112.152 E.74293
G3 X130.711 Y112.265 I-.672 J6.028 E.03026
G1 X141.733 Y123.288 E.6934
G2 X141.57 Y122.567 I-6.498 J1.093 E.03289
G1 X131.43 Y112.427 E.63789
G3 X132.207 Y112.647 I-1.569 J7.03 E.03595
G1 X141.35 Y121.79 E.57513
G2 X141.049 Y120.932 I-28.803 J9.601 E.04042
G1 X133.072 Y112.954 E.50187
G3 X134.061 Y113.386 I-3.35 J9.024 E.04804
G1 X140.614 Y119.939 E.41225
G2 X140.23 Y119.198 I-6.793 J3.048 E.03715
G1 X140.23 Y119.198 E0
G2 X139.958 Y118.725 I-4.346 J2.191 E.02429
G1 X135.279 Y114.046 E.29435
G3 X139.473 Y117.683 I-11.55 J17.558 E.24766
; CHANGE_LAYER
; Z_HEIGHT: 13.92
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X138.04 Y116.288 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 50/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z14.04 I-1.197 J-.219 P1  F30000
G1 X133.881 Y139.035 Z14.04
G1 Z13.92
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X124.384 Y112.159 I-5.89 J-13.035 E2.10661
G3 X129.046 Y111.735 I3.603 J13.782 E.20921
G3 X133.936 Y139.01 I-1.055 J14.265 E1.6792
G1 X134.04 Y139.381 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M73 P68 R7
G1 X134.035 Y139.376 E.00029
G3 X123.498 Y112.026 I-6.043 J-13.376 E1.96153
G3 X129.066 Y111.361 I4.522 J14.209 E.23162
G3 X134.776 Y139.016 I-1.074 J14.639 E1.55968
G1 X134.094 Y139.354 E.03125
M204 S10000
; WIPE_START
G1 F24000
G1 X134.035 Y139.376 E-.02371
G1 X133.278 Y139.699 E-.31286
G1 X132.502 Y139.974 E-.31293
G1 X132.223 Y140.055 E-.11049
; WIPE_END
G1 E-.04 F1800
G1 X136.301 Y137.45 Z14.32 F30000
G1 Z13.92
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X139.929 Y133.265 I-14.536 J-16.269 E.24703
G1 X135.262 Y137.933 E.29361
G3 X134.05 Y138.588 I-7.84 J-13.046 E.06131
G1 X140.588 Y132.05 E.41133
G2 X141.019 Y131.062 I-8.576 J-4.332 E.04796
G1 X133.059 Y139.023 E.50079
G3 X132.203 Y139.323 I-10.412 J-28.364 E.04035
G1 X141.326 Y130.199 E.57393
G2 X141.545 Y129.424 I-6.041 J-2.126 E.03587
G1 X131.426 Y139.543 E.63655
G3 X130.707 Y139.706 I-1.81 J-6.323 E.03282
G1 X141.7 Y128.713 E.69154
G2 X141.82 Y128.036 I-6.8 J-1.554 E.03056
G1 X130.034 Y139.822 E.7414
G3 X129.402 Y139.897 I-.987 J-5.586 E.02831
G1 X141.896 Y127.404 E.78596
G2 X141.944 Y126.8 I-5.352 J-.724 E.02695
G1 X128.8 Y139.944 E.82684
G3 X128.221 Y139.966 I-.488 J-5.141 E.02577
G1 X141.967 Y126.22 E.86472
G1 X141.966 Y125.665 E.02467
G1 X127.663 Y139.968 E.89972
G3 X127.134 Y139.94 I-.021 J-4.722 E.02357
G1 X141.937 Y125.138 E.9312
G2 X141.9 Y124.618 I-5.287 J.116 E.02317
G1 X126.619 Y139.899 E.96126
G1 X126.118 Y139.844 E.02244
G1 X141.842 Y124.12 E.98917
G2 X141.766 Y123.64 I-4.312 J.441 E.02163
G1 X125.64 Y139.766 E1.01445
G3 X125.17 Y139.679 I.538 J-4.224 E.02125
G1 X141.68 Y123.169 E1.03862
G1 X141.576 Y122.717 E.02063
G1 X124.716 Y139.577 E1.06061
G3 X124.275 Y139.461 I.81 J-3.981 E.02028
G1 X141.462 Y122.274 E1.08116
G1 X141.336 Y121.844 E.01996
G1 X123.842 Y139.338 E1.1005
G3 X123.427 Y139.197 I1.049 J-3.767 E.01952
G1 X141.197 Y121.427 E1.11785
G1 X141.052 Y121.016 E.01939
G1 X123.016 Y139.051 E1.13458
G1 X122.621 Y138.89 E.01897
G1 X140.889 Y120.621 E1.14919
G2 X140.724 Y120.23 I-3.184 J1.115 E.0189
G1 X122.232 Y138.723 E1.1633
G1 X121.855 Y138.543 E.01856
G1 X140.54 Y119.858 E1.17542
G1 X140.356 Y119.486 E.01848
G1 X121.485 Y138.356 E1.18711
G1 X121.126 Y138.159 E.01823
G1 X140.159 Y119.127 E1.19727
G2 X139.955 Y118.774 I-3.244 J1.634 E.01813
G1 X120.775 Y137.954 E1.20658
G1 X120.432 Y137.74 E.01796
G1 X139.74 Y118.433 E1.21457
G2 X139.519 Y118.097 I-3.098 J1.798 E.01788
G1 X120.098 Y137.518 E1.22168
G1 X119.772 Y137.288 E.01776
G1 X139.287 Y117.773 E1.22763
G2 X139.05 Y117.454 I-2.958 J1.955 E.0177
G1 X119.455 Y137.049 E1.23264
G1 X119.145 Y136.803 E.01762
G1 X138.802 Y117.145 E1.23659
G2 X138.548 Y116.843 I-2.823 J2.107 E.01758
G1 X118.843 Y136.547 E1.23957
G1 X118.549 Y136.286 E.01753
G1 X138.285 Y116.55 E1.24154
G2 X138.015 Y116.263 I-2.689 J2.255 E.01752
G1 X118.264 Y136.015 E1.24253
G1 X117.985 Y135.737 E.0175
G1 X137.736 Y115.985 E1.24253
G2 X137.45 Y115.715 I-2.288 J2.133 E.01752
G1 X117.715 Y135.45 E1.24149
G1 X117.452 Y135.157 E.01752
G1 X137.154 Y115.455 E1.2394
G2 X136.855 Y115.197 I-2.768 J2.898 E.01755
G1 X117.198 Y134.855 E1.23659
G1 X116.95 Y134.546 E.0176
G1 X136.545 Y114.951 E1.23264
G2 X136.228 Y114.712 I-2.288 J2.704 E.01768
G1 X116.713 Y134.227 E1.22763
G1 X116.481 Y133.903 E.01774
G1 X135.902 Y114.482 E1.22168
G2 X135.568 Y114.26 I-2.148 J2.862 E.01786
G1 X116.26 Y133.567 E1.21457
G1 X116.045 Y133.226 E.01794
G1 X135.225 Y114.046 E1.20658
G2 X134.874 Y113.841 I-2.001 J3.025 E.0181
G1 X115.841 Y132.873 E1.19727
G1 X115.642 Y132.516 E.0182
G1 X134.515 Y113.644 E1.18719
G2 X134.145 Y113.457 I-1.847 J3.199 E.01843
G1 X115.457 Y132.144 E1.17556
G1 X115.276 Y131.77 E.01852
G1 X133.768 Y113.277 E1.16331
G2 X133.379 Y113.11 I-1.679 J3.384 E.01886
G1 X115.111 Y131.378 E1.14919
G3 X114.948 Y130.984 I3.429 J-1.641 E.01897
G1 X132.984 Y112.948 E1.13458
G2 X132.573 Y112.803 I-1.498 J3.589 E.01941
G1 X114.803 Y130.573 E1.11785
G3 X114.664 Y130.156 I3.643 J-1.45 E.01957
G1 X132.158 Y112.662 E1.1005
G1 X131.725 Y112.539 E.02003
G1 X114.538 Y129.725 E1.08116
G3 X114.424 Y129.283 I3.882 J-1.236 E.02033
G1 X131.284 Y112.423 E1.06061
G1 X130.83 Y112.321 E.02071
G1 X114.32 Y128.831 E1.03862
G3 X114.234 Y128.36 I4.152 J-.994 E.02131
G1 X130.36 Y112.234 E1.01444
G2 X129.882 Y112.156 I-.857 J3.756 E.02158
G1 X114.158 Y127.88 E.98915
G1 X114.1 Y127.382 E.02233
G1 X129.377 Y112.105 E.96104
G2 X128.866 Y112.06 I-.71 J5.168 E.02285
G1 X114.06 Y126.865 E.93137
G3 X114.034 Y126.335 I4.711 J-.495 E.02364
G1 X128.337 Y112.032 E.89972
G1 X127.779 Y112.034 E.02483
G1 X114.033 Y125.78 E.86472
G3 X114.056 Y125.2 I5.175 J-.08 E.02583
G1 X127.2 Y112.056 E.82684
G2 X126.598 Y112.103 I.11 J5.388 E.02689
G1 X114.104 Y124.596 E.78595
G3 X114.18 Y123.963 I5.674 J.365 E.02837
G1 X125.966 Y112.178 E.7414
G1 X125.293 Y112.294 E.03037
G1 X114.293 Y123.294 E.69197
G1 X114.455 Y122.576 E.03273
G1 X124.574 Y112.457 E.63656
G2 X123.797 Y112.677 I1.57 J7.023 E.03591
G1 X114.675 Y121.799 E.57384
G3 X114.981 Y120.938 I7.819 J2.294 E.04066
G1 X122.941 Y112.977 E.50078
G2 X121.95 Y113.412 I3.373 J9.039 E.04816
G1 X115.412 Y119.95 E.41132
G3 X116.071 Y118.734 I12.933 J6.228 E.06155
G1 X120.738 Y114.067 E.2936
G2 X118.394 Y115.855 I10.14 J15.726 E.13128
G1 X116.546 Y117.703 E.11624
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X117.961 Y116.289 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 51/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z14.32 I-.997 J.698 P1  F30000
G1 X133.867 Y139.002 Z14.32
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X122.87 Y112.685 I-5.875 J-13.001 E2.02997
G3 X128.493 Y111.743 I5.115 J13.271 E.25537
G3 X133.921 Y138.977 I-.501 J14.258 E1.6994
G1 X134.026 Y139.347 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X134.022 Y139.345 E.00021
G3 X126.667 Y140.58 I-6.022 J-13.345 E.30961
G1 X126.667 Y140.58 E0
G3 X114.082 Y121.456 I1.338 J-14.583 E1.07907
G1 X114.082 Y121.456 E0
G3 X128.513 Y111.368 I13.914 J4.538 E.77571
G3 X134.76 Y138.987 I-.513 J14.632 E1.57895
G1 X134.08 Y139.32 E.03111
M204 S10000
; WIPE_START
G1 F24000
G1 X134.022 Y139.345 E-.02422
G1 X133.265 Y139.665 E-.3121
G1 X132.491 Y139.939 E-.31216
G1 X132.209 Y140.021 E-.11152
; WIPE_END
G1 E-.04 F1800
G1 X124.736 Y138.466 Z14.6 F30000
G1 X119.724 Y137.424 Z14.6
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X117.888 Y135.588 E.11549
G3 X116.1 Y133.245 I15.494 J-13.679 E.13124
G1 X120.752 Y137.896 E.29263
G2 X121.965 Y138.555 I7.421 J-12.23 E.06142
G1 X115.445 Y132.035 E.41012
G3 X115.012 Y131.047 I8.584 J-4.355 E.04804
M73 P69 R7
G1 X122.95 Y138.985 E.49937
G2 X123.81 Y139.29 I3.151 J-7.502 E.04061
G1 X114.712 Y130.193 E.5723
G3 X114.493 Y129.418 I6.784 J-2.341 E.03582
G1 X124.585 Y139.51 E.63483
G1 X125.301 Y139.671 E.03264
G1 X114.33 Y128.701 E.6901
G1 X114.214 Y128.03 E.0303
G1 X125.968 Y139.783 E.7394
G2 X126.599 Y139.86 I.996 J-5.583 E.0283
G1 X114.145 Y127.405 E.78349
G3 X114.093 Y126.798 I6.307 J-.843 E.02709
G1 X127.202 Y139.907 E.82463
G2 X127.78 Y139.931 I.499 J-5.138 E.02576
G1 X114.071 Y126.221 E.86242
G1 X114.069 Y125.665 E.02476
G1 X128.333 Y139.929 E.89733
G2 X128.863 Y139.903 I.036 J-4.725 E.02358
G1 X114.096 Y125.137 E.9289
G3 X114.138 Y124.623 I4.593 J.111 E.02293
G1 X129.373 Y139.859 E.95841
G1 X129.874 Y139.805 E.02242
G1 X114.192 Y124.123 E.98649
G3 X114.27 Y123.646 I4.286 J.455 E.02151
G1 X130.354 Y139.73 E1.01176
G2 X130.824 Y139.645 I-.522 J-4.226 E.02125
G1 X114.357 Y123.178 E1.03588
G1 X114.459 Y122.725 E.02065
G1 X131.274 Y139.54 E1.05781
G2 X131.715 Y139.427 I-.792 J-3.985 E.02028
G1 X114.574 Y122.285 E1.07831
G1 X114.697 Y121.853 E.01998
G1 X132.145 Y139.301 E1.0976
G2 X132.561 Y139.162 I-1.03 J-3.772 E.01952
G1 X114.838 Y121.439 E1.11491
G3 X114.983 Y121.029 I3.724 J1.084 E.01936
G1 X132.971 Y139.017 E1.13159
G2 X133.364 Y138.856 I-1.244 J-3.582 E.01892
G1 X115.144 Y120.636 E1.14617
G3 X115.31 Y120.247 I3.544 J1.287 E.01881
G1 X133.754 Y138.691 E1.16026
G1 X134.128 Y138.51 E.01847
G1 X115.49 Y119.872 E1.17247
G3 X115.676 Y119.503 I3.376 J1.472 E.01839
G1 X134.499 Y138.325 E1.18407
G1 X134.855 Y138.127 E.01815
G1 X115.873 Y119.144 E1.19413
G3 X116.077 Y118.794 I3.221 J1.646 E.01806
G1 X135.207 Y137.924 E1.20341
G1 X135.547 Y137.709 E.01789
G1 X116.29 Y118.452 E1.21138
G3 X116.512 Y118.119 I3.076 J1.809 E.01781
G1 X135.882 Y137.489 E1.21847
G1 X136.205 Y137.258 E.0177
G1 X116.742 Y117.794 E1.2244
G3 X116.98 Y117.477 I2.936 J1.966 E.01763
G1 X136.523 Y137.021 E1.22941
G1 X136.831 Y136.774 E.01756
G1 X117.226 Y117.168 E1.23334
G3 X117.48 Y116.868 I2.8 J2.117 E.01752
G1 X137.133 Y136.521 E1.23632
G1 X137.425 Y136.258 E.01748
G1 X117.741 Y116.574 E1.23828
G3 X118.012 Y116.289 I2.668 J2.266 E.01747
G1 X137.712 Y135.989 E1.23927
G1 X137.988 Y135.711 E.01745
G1 X118.288 Y116.011 E1.23927
G3 X118.574 Y115.742 I2.535 J2.413 E.01747
G1 X138.259 Y135.426 E1.23828
G1 X138.52 Y135.132 E.01748
G1 X118.867 Y115.479 E1.23632
G3 X119.169 Y115.226 I2.403 J2.562 E.01753
G1 X138.774 Y134.832 E1.23334
G1 X139.02 Y134.523 E.01757
G1 X119.476 Y114.979 E1.22941
G3 X119.796 Y114.744 I1.986 J2.363 E.01767
G1 X139.258 Y134.206 E1.22431
G1 X139.488 Y133.881 E.01771
G1 X120.122 Y114.515 E1.21823
G3 X120.453 Y114.291 I2.505 J3.341 E.01778
G1 X139.71 Y133.548 E1.21138
G1 X139.923 Y133.206 E.01792
G1 X120.793 Y114.076 E1.20341
G3 X121.145 Y113.873 I1.982 J3.033 E.01808
G1 X140.127 Y132.856 E1.19413
G1 X140.324 Y132.497 E.01818
G1 X121.501 Y113.675 E1.18407
G3 X121.872 Y113.49 I1.827 J3.207 E.01842
G1 X140.51 Y132.129 E1.17247
G1 X140.689 Y131.753 E.01851
G1 X122.245 Y113.309 E1.16026
G3 X122.636 Y113.144 I1.66 J3.391 E.01885
G1 X140.856 Y131.364 E1.14617
G1 X141.017 Y130.971 E.01892
G1 X123.029 Y112.983 E1.1316
G1 X123.439 Y112.838 E.01934
G1 X141.162 Y130.561 E1.11491
G2 X141.303 Y130.147 I-3.617 J-1.46 E.01947
G1 X123.855 Y112.699 E1.0976
G1 X124.285 Y112.573 E.01991
G1 X141.426 Y129.715 E1.07831
G2 X141.541 Y129.275 I-3.855 J-1.247 E.02022
G1 X124.726 Y112.46 E1.05781
G1 X125.176 Y112.355 E.02057
G1 X141.643 Y128.822 E1.03588
G2 X141.73 Y128.354 I-4.126 J-1.005 E.0212
G1 X125.646 Y112.27 E1.01177
G3 X126.125 Y112.194 I.918 J4.224 E.02157
G1 X141.808 Y127.877 E.98655
G1 X141.862 Y127.377 E.02238
G1 X126.622 Y112.137 E.95871
G3 X127.137 Y112.097 I.612 J4.567 E.023
G1 X141.904 Y126.863 E.9289
G2 X141.931 Y126.335 I-4.678 J-.507 E.02351
G1 X127.668 Y112.072 E.89727
G1 X128.225 Y112.075 E.02481
G1 X141.929 Y125.779 E.86208
G2 X141.907 Y125.202 I-5.15 J-.09 E.02571
G1 X128.798 Y112.093 E.82463
M73 P69 R6
G3 X129.4 Y112.14 I-.12 J5.385 E.02689
G1 X141.861 Y124.601 E.78385
G2 X141.786 Y123.971 I-5.65 J.355 E.02824
G1 X130.032 Y112.217 E.73941
G3 X130.699 Y112.329 I-.669 J6.001 E.03013
G1 X141.665 Y123.295 E.68981
G1 X141.506 Y122.581 E.03254
G1 X131.415 Y112.49 E.63475
G3 X132.199 Y112.719 I-1.381 J6.191 E.03633
G1 X141.288 Y121.808 E.57175
G2 X140.988 Y120.953 I-28.507 J9.506 E.04026
G1 X133.05 Y113.015 E.49938
G3 X134.035 Y113.445 I-3.337 J8.985 E.04784
G1 X140.555 Y119.965 E.41013
G2 X139.9 Y118.756 I-13.636 J6.597 E.06119
G1 X135.248 Y114.103 E.29265
G1 X135.706 Y114.389 E.024
G3 X139.42 Y117.721 I-12.579 J17.761 E.22243
; CHANGE_LAYER
; Z_HEIGHT: 14.48
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X138.005 Y116.307 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 52/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z14.6 I-1.197 J-.22 P1  F30000
G1 X133.849 Y138.963 Z14.6
G1 Z14.48
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X120.06 Y114.197 I-5.857 J-12.96 E1.88179
G3 X128.774 Y111.801 I7.947 J11.861 E.40901
G3 X133.904 Y138.938 I-.782 J14.201 E1.6815
G1 X134.009 Y139.306 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X134.003 Y139.304 E.00027
G3 X119.851 Y113.886 I-6.012 J-13.302 E1.7828
G3 X128.793 Y111.427 I8.156 J12.173 E.38747
G3 X134.739 Y138.946 I-.802 J14.575 E1.56197
G1 X134.063 Y139.28 E.03095
M204 S10000
; WIPE_START
G1 F24000
G1 X134.003 Y139.304 E-.02468
G1 X133.249 Y139.624 E-.31117
G1 X132.477 Y139.897 E-.31122
G1 X132.192 Y139.98 E-.11293
; WIPE_END
G1 E-.04 F1800
G1 X136.254 Y137.385 Z14.88 F30000
G1 Z14.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X139.574 Y133.682 I-14.418 J-16.268 E.22172
G1 X139.858 Y133.228 E.02381
G1 X135.224 Y137.862 E.2915
G3 X134.018 Y138.515 I-7.767 J-12.906 E.06104
G1 X140.514 Y132.018 E.4087
G2 X140.943 Y131.036 I-8.53 J-4.31 E.0477
G1 X133.032 Y138.947 E.49769
G3 X132.18 Y139.246 I-10.291 J-27.998 E.04015
G1 X141.249 Y130.177 E.57046
G2 X141.467 Y129.406 I-6.759 J-2.329 E.03569
G1 X131.408 Y139.464 E.63277
G1 X131.112 Y139.533 E.01352
G3 X130.693 Y139.626 I-1.043 J-3.687 E.01912
G1 X141.628 Y128.692 E.68787
G2 X141.74 Y128.026 I-5.874 J-1.334 E.03004
G1 X130.024 Y139.742 E.73702
G3 X129.396 Y139.817 I-.982 J-5.554 E.02816
G1 X141.816 Y127.397 E.78133
G2 X141.863 Y126.796 I-5.323 J-.721 E.0268
G1 X128.797 Y139.863 E.822
G3 X128.221 Y139.885 I-.486 J-5.112 E.02563
G1 X141.887 Y126.22 E.85967
G1 X141.885 Y125.668 E.02453
G1 X127.666 Y139.887 E.89447
G3 X127.14 Y139.86 I-.021 J-4.696 E.02344
G1 X141.86 Y125.141 E.92595
G2 X141.82 Y124.627 I-4.591 J.096 E.02293
G1 X126.628 Y139.819 E.95567
G1 X126.129 Y139.764 E.02231
G1 X141.762 Y124.131 E.98343
G2 X141.687 Y123.654 I-4.288 J.438 E.02151
G1 X125.654 Y139.687 E1.00856
G3 X125.187 Y139.6 I.535 J-4.2 E.02113
G1 X141.602 Y123.186 E1.0326
G1 X141.498 Y122.736 E.02051
G1 X124.735 Y139.499 E1.05447
M73 P70 R6
G3 X124.297 Y139.384 I.805 J-3.959 E.02016
G1 X141.384 Y122.296 E1.07491
G1 X141.26 Y121.868 E.01985
G1 X123.867 Y139.261 E1.09414
G3 X123.454 Y139.121 I1.043 J-3.747 E.01941
G1 X141.121 Y121.454 E1.1114
G1 X140.977 Y121.045 E.01928
G1 X123.045 Y138.976 E1.12803
G1 X122.653 Y138.815 E.01886
G1 X140.815 Y120.653 E1.14256
G2 X140.651 Y120.264 I-3.544 J1.266 E.01879
G1 X122.265 Y138.65 E1.1566
G1 X121.891 Y138.471 E.01845
G1 X140.47 Y119.891 E1.16878
G2 X140.287 Y119.522 I-3.379 J1.451 E.01836
G1 X121.523 Y138.285 E1.18035
G1 X121.166 Y138.089 E.01812
G1 X140.089 Y119.167 E1.19037
G2 X139.887 Y118.816 I-3.227 J1.625 E.01803
G1 X120.817 Y137.885 E1.19963
G1 X120.476 Y137.673 E.01786
G1 X139.672 Y118.477 E1.20757
G2 X139.453 Y118.143 I-3.081 J1.788 E.01778
G1 X120.144 Y137.452 E1.21464
G1 X119.82 Y137.223 E.01766
G1 X139.222 Y117.82 E1.22055
G2 X138.986 Y117.503 I-2.941 J1.943 E.01759
G1 X119.504 Y136.985 E1.22554
G1 X119.196 Y136.741 E.01752
G1 X138.74 Y117.196 E1.22946
G2 X138.488 Y116.895 I-2.807 J2.095 E.01748
G1 X118.896 Y136.487 E1.23243
G1 X118.603 Y136.226 E.01743
G1 X138.226 Y116.604 E1.23438
G2 X137.958 Y116.319 I-2.673 J2.242 E.01742
G1 X118.32 Y135.957 E1.23537
G1 X118.042 Y135.681 E.0174
G1 X137.68 Y116.043 E1.23537
G2 X137.397 Y115.773 I-2.542 J2.39 E.01741
G1 X117.774 Y135.396 E1.23438
G1 X117.512 Y135.105 E.01742
G1 X137.104 Y115.513 E1.23243
G2 X136.804 Y115.259 I-2.41 J2.538 E.01747
G1 X117.26 Y134.804 E1.22946
G1 X117.014 Y134.497 E.0175
G1 X136.496 Y115.015 E1.22554
G2 X136.18 Y114.777 I-2.275 J2.689 E.01758
G1 X116.778 Y134.18 E1.22055
G1 X116.547 Y133.857 E.01764
G1 X135.856 Y114.548 E1.21464
G2 X135.524 Y114.327 I-2.136 J2.845 E.01775
G1 X116.328 Y133.523 E1.20757
G1 X116.113 Y133.184 E.01784
G1 X135.183 Y114.115 E1.19962
G2 X134.834 Y113.911 I-1.99 J3.008 E.018
G1 X115.911 Y132.833 E1.19037
G1 X115.713 Y132.478 E.01809
G1 X134.477 Y113.715 E1.18034
G2 X134.109 Y113.529 I-1.836 J3.181 E.01833
G1 X115.53 Y132.109 E1.16878
G1 X115.349 Y131.736 E.01841
G1 X133.735 Y113.35 E1.1566
G2 X133.347 Y113.184 I-1.67 J3.366 E.01875
G1 X115.185 Y131.347 E1.14255
G3 X115.023 Y130.955 I3.409 J-1.631 E.01886
G1 X132.955 Y113.023 E1.12803
G2 X132.546 Y112.879 I-1.489 J3.568 E.0193
G1 X114.879 Y130.546 E1.11139
G3 X114.74 Y130.132 I3.622 J-1.441 E.01946
G1 X132.133 Y112.739 E1.09414
G1 X131.703 Y112.616 E.01992
G1 X114.615 Y129.703 E1.0749
G3 X114.502 Y129.264 I3.86 J-1.229 E.02022
G1 X131.264 Y112.501 E1.05447
G1 X130.813 Y112.4 E.02059
G1 X114.398 Y128.814 E1.0326
G3 X114.313 Y128.346 I4.13 J-.989 E.02119
G1 X130.346 Y112.313 E1.00856
G2 X129.87 Y112.236 I-.929 J4.197 E.02145
G1 X114.237 Y127.869 E.98342
G1 X114.18 Y127.373 E.0222
G1 X129.372 Y112.181 E.95567
G2 X128.86 Y112.14 I-.622 J4.538 E.02286
G1 X114.14 Y126.859 E.92595
G3 X114.115 Y126.332 I4.684 J-.492 E.02351
G1 X128.334 Y112.113 E.89447
G1 X127.779 Y112.115 E.02468
G1 X114.113 Y125.78 E.85966
G3 X114.137 Y125.203 I5.146 J-.079 E.02569
G1 X127.203 Y112.137 E.82199
G2 X126.604 Y112.183 I.11 J5.359 E.02675
G1 X114.184 Y124.603 E.78132
G3 X114.26 Y123.974 I5.643 J.364 E.02822
G1 X125.976 Y112.258 E.73701
G1 X125.307 Y112.374 E.0302
G1 X114.372 Y123.308 E.68785
G1 X114.533 Y122.594 E.03254
G1 X124.592 Y112.536 E.63275
G2 X123.82 Y112.755 I1.563 J6.985 E.03571
G1 X114.751 Y121.823 E.57045
G3 X115.057 Y120.964 I7.794 J2.288 E.04055
G1 X122.968 Y113.053 E.49767
G2 X121.982 Y113.486 I3.357 J8.991 E.0479
G1 X115.486 Y119.982 E.40868
G3 X116.142 Y118.772 I12.835 J6.184 E.06127
G1 X120.776 Y114.139 E.29147
G2 X116.612 Y117.749 I11.403 J17.356 E.24587
; CHANGE_LAYER
; Z_HEIGHT: 14.76
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X118.043 Y116.352 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 53/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z14.88 I-.997 J.698 P1  F30000
G1 X133.83 Y138.921 Z14.88
G1 Z14.76
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X125.19 Y112.1 I-5.839 J-12.921 E2.1237
G3 X129.054 Y111.86 I2.832 J14.385 E.1727
G3 X133.885 Y138.896 I-1.062 J14.139 E1.66382
G1 X133.992 Y139.266 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.984 Y139.261 E.0004
G3 X124.32 Y111.916 I-5.992 J-13.263 E1.9784
G3 X129.073 Y111.486 I3.667 J14.028 E.19686
G3 X134.718 Y138.904 I-1.081 J14.513 E1.54574
G1 X134.046 Y139.239 E.03081
M204 S10000
; WIPE_START
G1 F24000
G1 X133.984 Y139.261 E-.02515
G1 X133.234 Y139.583 E-.3102
G1 X132.464 Y139.855 E-.31028
G1 X132.175 Y139.94 E-.11436
; WIPE_END
G1 E-.04 F1800
G1 X125.183 Y136.879 Z15.16 F30000
G1 X115.702 Y132.728 Z15.16
G1 Z14.76
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X120.793 Y137.819 E.32024
G2 X122 Y138.474 I7.368 J-12.129 E.06111
G1 X115.526 Y132 E.40725
G3 X115.094 Y131.018 I8.535 J-4.331 E.04776
G1 X122.979 Y138.902 E.49599
G2 X123.835 Y139.206 I3.138 J-7.467 E.04043
G1 X114.797 Y130.168 E.56856
G3 X114.578 Y129.399 I6.745 J-2.328 E.03561
G1 X124.604 Y139.424 E.63069
G1 X125.316 Y139.584 E.03244
G1 X114.417 Y128.685 E.68562
G1 X114.301 Y128.018 E.03011
G1 X125.979 Y139.696 E.73463
G2 X126.607 Y139.772 I.991 J-5.548 E.02813
G1 X114.226 Y127.392 E.77881
G3 X114.18 Y126.795 I5.297 J-.707 E.02666
G1 X127.205 Y139.82 E.81935
G2 X127.78 Y139.843 I.496 J-5.107 E.02561
G1 X114.158 Y126.221 E.85692
G1 X114.157 Y125.668 E.02461
G1 X128.33 Y139.841 E.89161
G2 X128.856 Y139.816 I.036 J-4.696 E.02344
G1 X114.184 Y125.144 E.923
G3 X114.225 Y124.633 I4.566 J.11 E.02279
G1 X129.368 Y139.776 E.95263
G1 X129.862 Y139.719 E.02213
G1 X114.279 Y124.136 E.98029
G3 X114.356 Y123.662 I4.259 J.452 E.02138
G1 X130.338 Y139.643 E1.00536
G2 X130.805 Y139.559 I-.518 J-4.201 E.02112
G1 X114.442 Y123.196 E1.02933
G1 X114.544 Y122.746 E.02053
G1 X131.253 Y139.455 E1.05112
G2 X131.691 Y139.342 I-.787 J-3.961 E.02015
G1 X114.658 Y122.309 E1.0715
G1 X114.781 Y121.88 E.01985
G1 X132.118 Y139.218 E1.09067
G2 X132.532 Y139.08 I-1.023 J-3.749 E.0194
G1 X114.92 Y121.468 E1.10788
G3 X115.064 Y121.061 I3.702 J1.077 E.01924
G1 X132.939 Y138.936 E1.12446
G2 X133.33 Y138.775 I-1.235 J-3.559 E.0188
G1 X115.225 Y120.67 E1.13894
G3 X115.39 Y120.284 I3.521 J1.278 E.0187
G1 X133.718 Y138.611 E1.15295
G1 X134.089 Y138.431 E.01836
G1 X115.568 Y119.91 E1.16509
G3 X115.753 Y119.544 I3.356 J1.463 E.01827
G1 X134.457 Y138.248 E1.17662
G1 X134.812 Y138.051 E.01804
G1 X115.949 Y119.188 E1.18661
G3 X116.152 Y118.84 I3.202 J1.636 E.01794
G1 X135.162 Y137.849 E1.19584
G1 X135.499 Y137.635 E.01778
G1 X116.364 Y118.5 E1.20376
G3 X116.584 Y118.169 I3.057 J1.798 E.0177
G1 X135.832 Y137.417 E1.21081
G1 X136.154 Y137.187 E.01759
G1 X116.812 Y117.846 E1.2167
G3 X117.049 Y117.531 I2.918 J1.953 E.01752
G1 X136.47 Y136.951 E1.22168
G1 X136.776 Y136.706 E.01745
G1 X117.293 Y117.223 E1.22558
G3 X117.549 Y116.927 I3.077 J2.396 E.0174
G1 X137.075 Y136.454 E1.22835
G1 X137.364 Y136.191 E.01737
G1 X117.806 Y116.634 E1.2303
G3 X118.074 Y116.35 I2.415 J2.016 E.01736
M73 P71 R6
G1 X137.651 Y135.926 E1.23147
G1 X137.925 Y135.65 E.01735
G1 X118.349 Y116.074 E1.23147
G3 X118.634 Y115.807 I2.521 J2.399 E.01736
G1 X138.194 Y135.367 E1.23049
G1 X138.454 Y135.075 E.01738
G1 X118.924 Y115.545 E1.22854
G3 X119.224 Y115.294 I2.388 J2.546 E.01742
G1 X138.707 Y134.777 E1.22559
G1 X138.951 Y134.469 E.01746
G1 X119.53 Y115.049 E1.22168
G3 X119.846 Y114.813 I2.253 J2.697 E.01754
G1 X139.188 Y134.154 E1.2167
G1 X139.416 Y133.831 E.0176
G1 X120.168 Y114.583 E1.21081
G3 X120.501 Y114.365 I2.115 J2.852 E.01772
G1 X139.636 Y133.5 E1.20376
G1 X139.848 Y133.16 E.0178
G1 X120.838 Y114.151 E1.19584
G3 X121.188 Y113.949 I1.97 J3.015 E.01797
G1 X140.051 Y132.812 E1.18661
G1 X140.247 Y132.456 E.01807
G1 X121.543 Y113.752 E1.17662
G3 X121.911 Y113.569 I1.816 J3.187 E.01831
G1 X140.432 Y132.09 E1.16509
G1 X140.61 Y131.716 E.0184
G1 X122.282 Y113.389 E1.15295
G3 X122.67 Y113.225 I1.65 J3.371 E.01874
G1 X140.775 Y131.33 E1.13894
G1 X140.936 Y130.939 E.0188
G1 X123.064 Y113.068 E1.12424
G1 X123.47 Y112.922 E.01917
G1 X141.08 Y130.532 E1.10779
G2 X141.219 Y130.12 I-3.595 J-1.451 E.01935
G1 X123.881 Y112.782 E1.09068
G1 X124.309 Y112.658 E.01979
G1 X141.342 Y129.691 E1.0715
G2 X141.456 Y129.254 I-3.832 J-1.239 E.0201
G1 X124.747 Y112.545 E1.05113
G1 X125.195 Y112.441 E.02045
G1 X141.558 Y128.804 E1.02933
G2 X141.644 Y128.338 I-4.102 J-.999 E.02107
G1 X125.662 Y112.357 E1.00536
G3 X126.138 Y112.281 I.912 J4.197 E.02144
G1 X141.721 Y127.864 E.9803
G1 X141.775 Y127.367 E.02224
G1 X126.632 Y112.224 E.95263
G3 X127.144 Y112.184 I.607 J4.54 E.02285
G1 X141.816 Y126.857 E.923
G2 X141.843 Y126.332 I-4.653 J-.503 E.02337
G1 X127.67 Y112.159 E.89161
G1 X128.22 Y112.157 E.02445
G1 X141.842 Y125.779 E.85692
G2 X141.82 Y125.205 I-5.12 J-.089 E.02555
G1 X128.795 Y112.18 E.81936
G3 X129.397 Y112.231 I-.203 J6.023 E.02689
G1 X141.774 Y124.608 E.7786
G2 X141.699 Y123.982 I-5.613 J.353 E.02807
G1 X130.021 Y112.304 E.73464
G3 X130.684 Y112.416 I-.665 J5.96 E.02995
G1 X141.583 Y123.315 E.68563
G2 X141.422 Y122.602 I-6.432 J1.083 E.03255
G1 X131.396 Y112.576 E.6307
G3 X132.164 Y112.793 I-1.552 J6.949 E.03554
G1 X141.203 Y121.832 E.56861
G2 X140.906 Y120.983 I-28.101 J9.377 E.04004
G1 X133.021 Y113.098 E.496
G3 X134 Y113.526 I-3.32 J8.934 E.04756
G1 X140.474 Y120 E.40726
G2 X139.823 Y118.797 I-13.482 J6.524 E.06089
G1 X135.207 Y114.181 E.29035
G1 X135.578 Y114.413 E.01946
G3 X139.349 Y117.771 I-12.192 J17.483 E.22515
; CHANGE_LAYER
; Z_HEIGHT: 15.04
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X137.933 Y116.358 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 54/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z15.16 I-1.197 J-.219 P1  F30000
G1 X133.808 Y138.873 Z15.16
G1 Z15.04
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X122.921 Y112.817 I-5.817 J-12.872 E2.00995
G3 X128.507 Y111.885 I5.063 J13.136 E.25367
G3 X133.863 Y138.848 I-.516 J14.116 E1.68165
G1 X133.971 Y139.217 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.963 Y139.216 E.0003
G3 X128.527 Y111.51 I-5.963 J-13.216 E2.14428
G3 X141.778 Y130.518 I-.531 J14.493 E1.10204
G1 X141.778 Y130.518 E0
G3 X134.695 Y138.861 I-13.778 J-4.518 E.46078
G1 X134.025 Y139.19 E.03067
M204 S10000
; WIPE_START
G1 F24000
G1 X133.963 Y139.216 E-.02528
G1 X133.214 Y139.533 E-.30909
G1 X132.447 Y139.804 E-.30914
G1 X132.153 Y139.89 E-.11649
; WIPE_END
G1 E-.04 F1800
G1 X136.184 Y137.315 Z15.44 F30000
G1 Z15.04
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X139.791 Y133.151 I-13.882 J-15.669 E.24576
G1 X135.147 Y137.795 E.29215
G3 X133.941 Y138.443 I-7.931 J-13.302 E.0609
G1 X140.443 Y131.942 E.40899
G2 X140.87 Y130.957 I-8.552 J-4.299 E.04778
G1 X132.954 Y138.874 E.49801
G3 X132.104 Y139.166 I-3.029 J-7.419 E.03999
G1 X141.169 Y130.102 E.57023
G2 X141.384 Y129.329 I-6.771 J-2.305 E.0357
G1 X131.331 Y139.382 E.63242
G3 X130.615 Y139.541 I-1.772 J-6.295 E.03264
G1 X141.543 Y128.613 E.68747
G1 X141.655 Y127.944 E.03015
G1 X129.943 Y139.656 E.73674
G1 X129.313 Y139.729 E.02822
G1 X141.727 Y127.315 E.78092
G2 X141.77 Y126.715 I-5.323 J-.683 E.02678
G1 X128.714 Y139.771 E.82131
G3 X128.139 Y139.788 I-.446 J-5.109 E.0256
G1 X141.789 Y126.139 E.85867
G1 X141.787 Y125.583 E.0247
G1 X127.585 Y139.786 E.89346
G1 X127.056 Y139.758 E.02357
G1 X141.757 Y125.057 E.92482
G2 X141.712 Y124.544 I-4.584 J.142 E.02289
G1 X126.545 Y139.712 E.95415
G3 X126.046 Y139.653 I.272 J-4.469 E.02234
G1 X141.654 Y124.045 E.98188
G2 X141.573 Y123.569 I-4.279 J.488 E.02148
G1 X125.569 Y139.574 E1.00679
G3 X125.103 Y139.482 I.586 J-4.187 E.0211
G1 X141.483 Y123.103 E1.03037
G1 X141.378 Y122.65 E.02065
G1 X124.649 Y139.379 E1.05239
G3 X124.213 Y139.258 I.86 J-3.944 E.02014
G1 X141.259 Y122.212 E1.07231
G1 X141.133 Y121.781 E.01999
G1 X123.782 Y139.132 E1.09147
G1 X123.368 Y138.988 E.01948
G1 X140.988 Y121.369 E1.10838
G2 X140.839 Y120.961 I-3.705 J1.125 E.01933
G1 X122.962 Y138.837 E1.12454
G1 X122.567 Y138.675 E.01899
G1 X140.674 Y120.568 E1.13906
G2 X140.503 Y120.182 I-3.522 J1.33 E.01879
G1 X122.183 Y138.502 E1.15248
G1 X121.806 Y138.322 E.01859
G1 X140.321 Y119.807 E1.16474
G2 X140.13 Y119.441 I-3.353 J1.519 E.01837
G1 X121.442 Y138.129 E1.17563
G1 X121.082 Y137.932 E.01825
G1 X139.931 Y119.083 E1.18573
G2 X139.721 Y118.736 I-3.197 J1.696 E.01806
G1 X120.736 Y137.721 E1.19426
G1 X120.393 Y137.506 E.01799
G1 X139.505 Y118.395 E1.20226
G2 X139.277 Y118.065 I-3.047 J1.862 E.01782
G1 X120.066 Y137.277 E1.20856
G1 X119.739 Y137.047 E.01778
G1 X139.045 Y117.74 E1.21451
G2 X138.801 Y117.428 I-2.904 J2.022 E.01766
G1 X119.428 Y136.8 E1.21867
G3 X119.118 Y136.553 I2.045 J-2.884 E.01764
G1 X138.553 Y117.119 E1.22257
G2 X138.291 Y116.823 I-2.765 J2.177 E.01757
G1 X118.823 Y136.291 E1.2247
G3 X118.529 Y136.028 I2.199 J-2.746 E.01756
G1 X138.028 Y116.53 E1.22658
G2 X137.75 Y116.25 I-2.628 J2.33 E.01753
G1 X118.25 Y135.75 E1.22671
G3 X117.972 Y135.47 I2.351 J-2.61 E.01753
G1 X137.471 Y115.972 E1.22658
G2 X137.177 Y115.709 I-2.491 J2.481 E.01756
G1 X117.709 Y135.177 E1.2247
G3 X117.447 Y134.881 I2.505 J-2.474 E.01757
G1 X136.882 Y115.447 E1.22257
G2 X136.572 Y115.2 I-2.356 J2.638 E.01764
G1 X117.199 Y134.572 E1.21867
G3 X116.955 Y134.26 I2.659 J-2.334 E.01766
G1 X136.261 Y114.953 E1.21451
G1 X135.934 Y114.723 E.01778
G1 X116.723 Y133.935 E1.20856
G3 X116.495 Y133.605 I2.82 J-2.192 E.01782
G1 X135.607 Y114.494 E1.20226
G1 X135.264 Y114.279 E.01799
G1 X116.279 Y133.264 E1.19426
G3 X116.069 Y132.917 I2.986 J-2.042 E.01806
G1 X134.918 Y114.068 E1.18573
G1 X134.558 Y113.871 E.01825
G1 X115.87 Y132.559 E1.17563
G3 X115.679 Y132.193 I3.162 J-1.885 E.01838
G1 X134.194 Y113.678 E1.16474
G1 X133.817 Y113.498 E.01859
G1 X115.497 Y131.818 E1.15248
G3 X115.326 Y131.432 I3.352 J-1.716 E.01879
G1 X133.433 Y113.325 E1.13906
G1 X133.038 Y113.163 E.01899
G1 X115.161 Y131.039 E1.12454
G3 X115.012 Y130.631 I3.557 J-1.533 E.01933
G1 X132.632 Y113.012 E1.10838
G2 X132.215 Y112.871 I-1.702 J4.366 E.01957
G1 X114.867 Y130.219 E1.09128
G1 X114.741 Y129.788 E.01999
G1 X131.784 Y112.745 E1.07212
G2 X131.351 Y112.621 I-1.165 J3.25 E.02005
G1 X114.622 Y129.35 E1.05239
G1 X114.517 Y128.897 E.02065
G1 X130.897 Y112.518 E1.03037
G2 X130.431 Y112.426 I-1.051 J4.096 E.0211
G1 X114.427 Y128.431 E1.00679
G3 X114.346 Y127.955 I4.195 J-.963 E.02148
G1 X129.954 Y112.347 E.98187
G2 X129.455 Y112.288 I-.77 J4.411 E.02234
G1 X114.288 Y127.456 E.95415
G3 X114.243 Y126.943 I4.54 J-.654 E.02289
M73 P72 R6
G1 X128.944 Y112.242 E.92482
G2 X128.412 Y112.218 I-.524 J5.662 E.02374
G1 X114.213 Y126.417 E.89322
G1 X114.211 Y125.861 E.0247
G1 X127.858 Y112.214 E.85849
G2 X127.286 Y112.229 I-.171 J4.384 E.02548
G1 X114.23 Y125.285 E.8213
G3 X114.273 Y124.685 I5.365 J.083 E.02678
G1 X126.687 Y112.271 E.78092
G1 X126.057 Y112.344 E.02822
G1 X114.345 Y124.056 E.73674
G1 X114.457 Y123.387 E.03015
G1 X125.385 Y112.459 E.68746
G2 X124.669 Y112.618 I1.056 J6.453 E.03264
G1 X114.616 Y122.671 E.63242
G3 X114.831 Y121.898 I6.987 J1.532 E.0357
G1 X123.896 Y112.834 E.57023
G2 X123.046 Y113.126 I2.179 J7.71 E.03999
G1 X115.13 Y121.043 E.498
G3 X115.557 Y120.058 I8.982 J3.315 E.04778
G1 X122.059 Y113.557 E.40898
G2 X120.853 Y114.205 I6.724 J13.948 E.0609
G1 X116.209 Y118.849 E.29213
G3 X119.816 Y114.685 I17.546 J11.554 E.24574
; CHANGE_LAYER
; Z_HEIGHT: 15.32
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X118.418 Y116.115 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 55/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z15.44 I-1.008 J.682 P1  F30000
G1 X133.784 Y138.819 Z15.44
G1 Z15.32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X120.148 Y114.327 I-5.793 J-12.817 E1.86097
G3 X128.786 Y111.959 I7.837 J11.648 E.40552
G3 X133.839 Y138.794 I-.795 J14.043 E1.66193
G1 X133.946 Y139.162 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.938 Y139.161 E.00032
G3 X119.938 Y114.016 I-5.947 J-13.159 E1.76359
G3 X128.806 Y111.585 I8.045 J11.958 E.38426
G3 X134.667 Y138.807 I-.815 J14.417 E1.54428
G1 X134 Y139.136 E.03052
M204 S10000
; WIPE_START
G1 F24000
G1 X133.938 Y139.161 E-.0253
G1 X133.193 Y139.477 E-.30781
G1 X132.429 Y139.747 E-.30787
G1 X132.128 Y139.835 E-.11902
; WIPE_END
G1 E-.04 F1800
G1 X124.968 Y137.191 Z15.72 F30000
G1 X116.734 Y134.15 Z15.72
G1 Z15.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X118.306 Y135.721 E.09886
G2 X120.877 Y137.738 I9.743 J-9.776 E.14568
G1 X116.258 Y133.119 E.29053
G3 X115.612 Y131.918 I13.177 J-7.866 E.0607
G1 X122.082 Y138.388 E.40699
G2 X123.062 Y138.814 I4.283 J-8.519 E.04759
G1 X115.183 Y130.934 E.49568
G3 X114.891 Y130.088 I7.387 J-3.017 E.03983
G1 X123.915 Y139.111 E.56763
G2 X124.684 Y139.326 I2.297 J-6.744 E.03555
G1 X114.676 Y129.318 E.62957
G3 X114.518 Y128.605 I6.269 J-1.766 E.03251
G1 X125.397 Y139.484 E.68439
G1 X126.063 Y139.595 E.03002
G1 X114.404 Y127.936 E.73345
G1 X114.331 Y127.309 E.02809
G1 X126.69 Y139.667 E.77745
G2 X127.287 Y139.71 I.681 J-5.3 E.02667
G1 X114.289 Y126.712 E.81767
G3 X114.272 Y126.14 I5.089 J-.444 E.02549
G1 X127.861 Y139.729 E.85488
G1 X128.414 Y139.728 E.0246
G1 X114.274 Y125.587 E.88953
G1 X114.302 Y125.06 E.02347
G1 X128.939 Y139.697 E.92076
G2 X129.449 Y139.653 I-.141 J-4.566 E.02279
G1 X114.348 Y124.552 E.94996
G3 X114.406 Y124.055 I4.449 J.27 E.02225
G1 X129.946 Y139.595 E.97758
G2 X130.42 Y139.514 I-.485 J-4.257 E.02139
G1 X114.485 Y123.58 E1.00239
G3 X114.577 Y123.117 I4.169 J.583 E.02101
G1 X130.884 Y139.424 E1.02586
G1 X131.335 Y139.32 E.02057
G1 X114.679 Y122.664 E1.04779
G3 X114.799 Y122.229 I3.927 J.856 E.02006
G1 X131.771 Y139.201 E1.06763
G1 X132.2 Y139.076 E.0199
G1 X114.925 Y121.801 E1.08671
G1 X115.068 Y121.389 E.0194
G1 X132.611 Y138.932 E1.10355
G2 X133.017 Y138.783 I-1.12 J-3.69 E.01925
G1 X115.218 Y120.985 E1.11965
G1 X115.38 Y120.591 E.01891
G1 X133.408 Y138.619 E1.1341
G2 X133.792 Y138.449 I-1.324 J-3.508 E.01871
G1 X115.552 Y120.209 E1.14746
G1 X115.731 Y119.833 E.01851
G1 X134.166 Y138.268 E1.15967
G2 X134.53 Y138.078 I-1.513 J-3.34 E.0183
G1 X115.923 Y119.47 E1.17052
G1 X116.12 Y119.112 E.01817
G1 X134.887 Y137.879 E1.18057
G2 X135.232 Y137.67 I-1.688 J-3.182 E.01798
G1 X116.33 Y118.768 E1.18907
G1 X116.543 Y118.427 E.01791
G1 X135.572 Y137.455 E1.19703
G2 X135.9 Y137.229 I-1.854 J-3.034 E.01775
G1 X116.772 Y118.1 E1.20331
G1 X117.001 Y117.775 E.01771
G1 X136.224 Y136.997 E1.20923
G2 X136.535 Y136.754 I-2.013 J-2.892 E.01759
G1 X117.246 Y117.465 E1.21338
G3 X117.492 Y117.157 I2.87 J2.035 E.01757
G1 X136.843 Y136.507 E1.21726
G2 X137.137 Y136.247 I-2.169 J-2.754 E.01749
G1 X117.753 Y116.863 E1.21938
G3 X118.016 Y116.57 I2.735 J2.19 E.01748
G1 X137.429 Y135.984 E1.22125
G2 X137.708 Y135.708 I-2.319 J-2.616 E.01746
G1 X118.292 Y116.292 E1.22138
G3 X118.571 Y116.016 I2.598 J2.34 E.01746
G1 X137.984 Y135.43 E1.22125
G2 X138.247 Y135.137 I-2.473 J-2.483 E.01748
G1 X118.863 Y115.753 E1.21938
G3 X119.157 Y115.493 I2.463 J2.494 E.01749
G1 X138.508 Y134.843 E1.21726
G2 X138.754 Y134.535 I-2.625 J-2.345 E.01757
G1 X119.465 Y115.246 E1.21338
G3 X119.776 Y115.003 I2.325 J2.648 E.01759
G1 X138.999 Y134.225 E1.20924
G1 X139.228 Y133.9 E.01771
G1 X120.1 Y114.772 E1.20331
G3 X120.428 Y114.545 I2.182 J2.808 E.01775
G1 X139.457 Y133.574 E1.19704
G1 X139.67 Y133.232 E.01791
G1 X120.768 Y114.33 E1.18907
G3 X121.113 Y114.121 I2.034 J2.973 E.01798
G1 X139.88 Y132.888 E1.18058
G1 X140.077 Y132.53 E.01817
G1 X121.47 Y113.923 E1.17052
G3 X121.834 Y113.732 I1.877 J3.149 E.0183
G1 X140.269 Y132.167 E1.15968
G1 X140.448 Y131.792 E.01851
G1 X122.208 Y113.551 E1.14747
G3 X122.592 Y113.381 I1.709 J3.338 E.01871
G1 X140.62 Y131.409 E1.1341
G1 X140.782 Y131.016 E.01891
G1 X122.983 Y113.217 E1.11965
G3 X123.389 Y113.068 I1.526 J3.541 E.01925
G1 X140.932 Y130.611 E1.10355
G1 X141.075 Y130.199 E.0194
G1 X123.8 Y112.924 E1.08671
G1 X124.229 Y112.799 E.0199
G1 X141.201 Y129.771 E1.06764
G2 X141.321 Y129.336 I-3.805 J-1.29 E.02006
G1 X124.665 Y112.68 E1.0478
G1 X125.116 Y112.576 E.02057
G1 X141.423 Y128.884 E1.02587
G2 X141.515 Y128.42 I-4.078 J-1.047 E.02101
G1 X125.58 Y112.486 E1.00239
G3 X126.054 Y112.405 I.959 J4.176 E.02139
G1 X141.594 Y127.945 E.97758
G2 X141.652 Y127.448 I-4.39 J-.766 E.02225
G1 X126.551 Y112.347 E.94997
G3 X127.061 Y112.303 I.651 J4.521 E.02279
G1 X141.698 Y126.94 E.92077
G1 X141.726 Y126.413 E.02347
G1 X127.586 Y112.272 E.88953
G1 X128.139 Y112.271 E.0246
G1 X141.728 Y125.86 E.85489
G2 X141.711 Y125.288 I-5.106 J-.128 E.02549
G1 X128.713 Y112.29 E.81768
G3 X129.31 Y112.333 I-.413 J9.93 E.02666
G1 X141.669 Y124.691 E.77746
G1 X141.596 Y124.064 E.02809
G1 X129.937 Y112.405 E.73346
G1 X130.603 Y112.516 E.03002
G1 X141.482 Y123.395 E.6844
G2 X141.324 Y122.682 I-6.427 J1.053 E.0325
G1 X131.316 Y112.674 E.62958
G3 X132.085 Y112.889 I-1.526 J6.956 E.03555
G1 X141.109 Y121.912 E.56764
G2 X140.817 Y121.066 I-7.678 J2.171 E.03983
G1 X132.938 Y113.186 E.49569
G3 X133.918 Y113.612 I-3.303 J8.946 E.04759
G1 X140.388 Y120.082 E.40701
G2 X139.742 Y118.881 I-13.827 J6.666 E.06069
G1 X135.123 Y114.262 E.29056
G1 X135.595 Y114.557 E.02473
G3 X139.266 Y117.851 I-12.441 J17.559 E.21989
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X137.851 Y116.437 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 56/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z15.72 I-1.197 J-.219 P1  F30000
G1 X133.759 Y138.763 Z15.72
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
M73 P73 R6
G3 X125.999 Y112.136 I-5.767 J-12.764 E2.13269
G3 X129.066 Y112.034 I1.99 J13.768 E.13678
G3 X133.813 Y138.738 I-1.074 J13.965 E1.64242
G1 X133.921 Y139.108 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.912 Y139.103 E.00041
G3 X125.15 Y111.902 I-5.92 J-13.105 E1.98791
G3 X129.085 Y111.66 I2.874 J14.606 E.16237
G3 X134.638 Y138.751 I-1.093 J14.338 E1.52636
G1 X133.975 Y139.081 E.0304
M204 S10000
; WIPE_START
G1 F24000
G1 X133.912 Y139.103 E-.02524
G1 X133.171 Y139.421 E-.3065
G1 X132.411 Y139.69 E-.3066
G1 X132.103 Y139.78 E-.12166
; WIPE_END
G1 E-.04 F1800
G1 X136.115 Y137.217 Z16 F30000
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X139.393 Y133.562 I-14.249 J-16.078 E.21892
G1 X139.685 Y133.095 E.02446
G1 X135.091 Y137.689 E.28898
G3 X133.897 Y138.33 I-7.569 J-12.656 E.0603
G1 X140.333 Y131.895 E.40484
G2 X140.757 Y130.918 I-8.484 J-4.267 E.0474
G1 X132.914 Y138.761 E.49338
G3 X132.072 Y139.051 I-3.005 J-7.355 E.03966
G1 X141.054 Y130.069 E.56504
G2 X141.268 Y129.303 I-6.715 J-2.287 E.0354
G1 X131.305 Y139.265 E.62673
G3 X130.595 Y139.423 I-1.759 J-6.242 E.03237
G1 X141.425 Y128.592 E.68132
G1 X141.536 Y127.93 E.02989
G1 X129.929 Y139.537 E.73019
G1 X129.304 Y139.609 E.02797
G1 X141.608 Y127.305 E.774
G2 X141.651 Y126.71 I-5.277 J-.678 E.02655
G1 X128.71 Y139.651 E.81405
G3 X128.14 Y139.669 I-.443 J-5.066 E.02538
G1 X141.669 Y126.139 E.8511
G1 X141.668 Y125.588 E.02449
G1 X127.59 Y139.666 E.88561
G1 X127.065 Y139.639 E.02336
G1 X141.638 Y125.066 E.91671
G2 X141.593 Y124.558 I-4.546 J.14 E.0227
G1 X126.559 Y139.593 E.94579
G3 X126.064 Y139.535 I.269 J-4.431 E.02215
G1 X141.536 Y124.063 E.97328
G2 X141.455 Y123.591 I-4.239 J.482 E.0213
G1 X125.591 Y139.456 E.99799
G3 X125.13 Y139.365 I.581 J-4.152 E.02092
G1 X141.366 Y123.129 E1.02137
G1 X141.262 Y122.68 E.02048
G1 X124.679 Y139.263 E1.0432
G3 X124.246 Y139.143 I.852 J-3.911 E.01997
G1 X141.144 Y122.246 E1.06296
G1 X141.019 Y121.818 E.01982
G1 X123.82 Y139.018 E1.08196
G1 X123.409 Y138.876 E.01931
G1 X140.875 Y121.41 E1.09872
G2 X140.727 Y121.005 I-3.674 J1.115 E.01916
G1 X123.007 Y138.726 E1.11475
G1 X122.615 Y138.565 E.01883
G1 X140.565 Y120.616 E1.12915
G2 X140.395 Y120.233 I-3.492 J1.318 E.01863
G1 X122.234 Y138.394 E1.14245
G1 X121.86 Y138.216 E.01843
G1 X140.214 Y119.861 E1.15461
G2 X140.025 Y119.498 I-3.326 J1.506 E.01822
G1 X121.499 Y138.024 E1.16541
G1 X121.142 Y137.829 E.0181
G1 X139.827 Y119.144 E1.17542
G2 X139.619 Y118.799 I-3.169 J1.681 E.0179
G1 X120.8 Y137.619 E1.18388
G1 X120.46 Y137.407 E.01783
G1 X139.405 Y118.461 E1.19181
G2 X139.18 Y118.134 I-3.022 J1.846 E.01767
G1 X120.135 Y137.179 E1.19806
G1 X119.811 Y136.951 E.01763
G1 X138.949 Y117.812 E1.20396
G2 X138.707 Y117.502 I-2.88 J2.005 E.01751
G1 X119.503 Y136.707 E1.20809
G3 X119.195 Y136.462 I2.027 J-2.858 E.01749
G1 X138.461 Y117.196 E1.21195
G2 X138.202 Y116.903 I-2.741 J2.158 E.01742
G1 X118.903 Y136.202 E1.21407
G3 X118.612 Y135.941 I2.179 J-2.722 E.01741
G1 X137.941 Y116.612 E1.21593
G2 X137.665 Y116.335 I-2.606 J2.31 E.01738
G1 X118.335 Y135.665 E1.21605
G3 X118.059 Y135.388 I2.331 J-2.587 E.01738
G1 X137.388 Y116.059 E1.21593
G2 X137.097 Y115.798 I-2.471 J2.462 E.01741
G1 X117.798 Y135.097 E1.21407
G3 X117.539 Y134.804 I2.484 J-2.453 E.01742
G1 X136.805 Y115.538 E1.21195
G2 X136.497 Y115.293 I-2.337 J2.617 E.01749
G1 X117.293 Y134.498 E1.20809
G3 X117.051 Y134.188 I2.637 J-2.314 E.01751
G1 X136.189 Y115.049 E1.20396
G1 X135.865 Y114.821 E.01763
G1 X116.82 Y133.866 E1.19806
G3 X116.595 Y133.539 I2.795 J-2.172 E.01767
G1 X135.54 Y114.593 E1.19181
G1 X135.2 Y114.381 E.01783
G1 X116.381 Y133.201 E1.18388
G3 X116.173 Y132.856 I2.961 J-2.025 E.0179
G1 X134.858 Y114.171 E1.17542
G1 X134.501 Y113.976 E.0181
G1 X115.975 Y132.502 E1.16541
G3 X115.787 Y132.137 I3.437 J-1.998 E.01825
G1 X134.14 Y113.784 E1.15449
G1 X133.766 Y113.606 E.01843
G1 X115.606 Y131.766 E1.14242
G3 X115.435 Y131.384 I3.065 J-1.593 E.01862
G1 X133.385 Y113.435 E1.12914
G1 X132.993 Y113.274 E.01883
G1 X115.273 Y130.995 E1.11475
G3 X115.125 Y130.59 I3.527 J-1.52 E.01916
G1 X132.591 Y113.124 E1.09872
G1 X132.18 Y112.982 E.01931
G1 X114.981 Y130.181 E1.08196
G1 X114.856 Y129.754 E.01982
G1 X131.754 Y112.857 E1.06296
G2 X131.321 Y112.737 I-1.284 J3.788 E.01997
G1 X114.738 Y129.32 E1.0432
G1 X114.634 Y128.871 E.02048
G1 X130.87 Y112.635 E1.02137
G2 X130.409 Y112.544 I-1.042 J4.061 E.02092
G1 X114.545 Y128.408 E.99799
G3 X114.464 Y127.937 I4.159 J-.954 E.0213
G1 X129.936 Y112.465 E.97328
G2 X129.44 Y112.409 I-.711 J4.062 E.02223
G1 X114.407 Y127.442 E.94567
G3 X114.362 Y126.934 I4.502 J-.648 E.0227
G1 X128.935 Y112.361 E.9167
G1 X128.41 Y112.334 E.02336
G1 X114.332 Y126.412 E.8856
G1 X114.331 Y125.861 E.02449
G1 X127.86 Y112.331 E.8511
G2 X127.29 Y112.349 I-.127 J5.085 E.02538
G1 X114.349 Y125.29 E.81405
G3 X114.392 Y124.694 I5.321 J.083 E.02655
G1 X126.696 Y112.391 E.774
G1 X126.071 Y112.463 E.02797
G1 X114.464 Y124.07 E.73018
G1 X114.575 Y123.407 E.02989
G1 X125.405 Y112.577 E.68132
G2 X124.695 Y112.735 I1.049 J6.401 E.03237
G1 X114.732 Y122.697 E.62672
G3 X114.946 Y121.931 I6.928 J1.521 E.0354
G1 X123.928 Y112.949 E.56504
G2 X123.086 Y113.239 I2.163 J7.647 E.03966
G1 X115.243 Y121.082 E.49337
G3 X115.667 Y120.105 I8.909 J3.291 E.0474
G1 X122.106 Y113.667 E.40502
G2 X120.909 Y114.311 I6.608 J13.704 E.06049
G1 X116.316 Y118.905 E.28896
G3 X118.503 Y116.165 I11.875 J7.238 E.15639
G1 X119.885 Y114.783 E.08693
; CHANGE_LAYER
; Z_HEIGHT: 15.88
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X118.503 Y116.165 E-.74259
G1 X118.472 Y116.198 E-.01741
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 57/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z16 I-1.007 J.683 P1  F30000
G1 X133.73 Y138.699 Z16
G1 Z15.88
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X122.268 Y113.297 I-5.738 J-12.698 E1.94794
G3 X128.528 Y112.077 I5.748 J12.831 E.28618
G3 X133.784 Y138.674 I-.536 J13.924 E1.6576
G1 X133.891 Y139.043 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.884 Y139.04 E.0003
G3 X122.114 Y112.955 I-5.893 J-13.039 E1.84646
G3 X128.548 Y111.703 I5.902 J13.175 E.2715
G3 X134.606 Y138.689 I-.557 J14.298 E1.54056
M73 P73 R5
G1 X133.945 Y139.016 E.03028
M204 S10000
; WIPE_START
G1 F24000
G1 X133.884 Y139.04 E-.02478
G1 X133.146 Y139.355 E-.305
G1 X132.389 Y139.622 E-.30507
G1 X132.072 Y139.714 E-.12515
; WIPE_END
G1 E-.04 F1800
G1 X124.602 Y138.148 Z16.28 F30000
G1 X119.943 Y137.172 Z16.28
G1 Z15.88
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X118.119 Y135.347 E.11477
G3 X116.355 Y133.026 I15.605 J-13.689 E.12979
G1 X120.969 Y137.641 E.29031
G2 X122.171 Y138.285 I7.371 J-12.304 E.06067
G1 X115.714 Y131.828 E.40619
G3 X115.292 Y130.848 I16.896 J-7.866 E.04747
G1 X123.152 Y138.709 E.49448
G2 X124 Y138.999 I9.314 J-25.804 E.03987
M73 P74 R5
G1 X115.003 Y130.002 E.56596
G3 X114.794 Y129.236 I5.637 J-1.948 E.03535
G1 X124.769 Y139.21 E.62745
G2 X125.481 Y139.365 I1.734 J-6.263 E.03243
G1 X114.637 Y128.521 E.68217
G3 X114.526 Y127.853 I24.417 J-4.385 E.03011
G1 X126.149 Y139.476 E.73116
G1 X126.775 Y139.545 E.02801
G1 X114.453 Y127.223 E.77512
G3 X114.416 Y126.628 I5.274 J-.63 E.02652
G1 X127.371 Y139.583 E.81497
G2 X127.943 Y139.598 I.415 J-5.084 E.02546
G1 X114.403 Y126.058 E.85177
G3 X114.409 Y125.507 I4.905 J-.214 E.0245
G1 X128.494 Y139.592 E.88604
G1 X129.021 Y139.561 E.02345
G1 X114.438 Y124.978 E.91737
G3 X114.489 Y124.472 I4.534 J.201 E.02265
G1 X129.528 Y139.511 E.94611
G2 X130.024 Y139.449 I-.304 J-4.442 E.02222
G1 X114.552 Y123.978 E.97329
G1 X114.632 Y123.5 E.02154
G1 X130.499 Y139.367 E.99817
G2 X130.956 Y139.267 I-.866 J-5.062 E.02084
G1 X114.729 Y123.04 E1.02084
G3 X114.834 Y122.587 I4.079 J.71 E.02066
G1 X131.413 Y139.167 E1.04296
G2 X131.846 Y139.042 I-.715 J-3.307 E.02006
G1 X114.957 Y122.153 E1.06243
G3 X115.089 Y121.728 I3.851 J.965 E.01981
G1 X132.273 Y138.912 E1.08095
G1 X132.685 Y138.766 E.01943
G1 X115.233 Y121.314 E1.09784
G3 X115.389 Y120.914 I3.647 J1.193 E.01915
G1 X133.087 Y138.611 E1.11331
G1 X133.48 Y138.447 E.01895
G1 X115.552 Y120.518 E1.12783
G3 X115.73 Y120.14 I3.462 J1.401 E.01864
G1 X133.861 Y138.27 E1.14053
G1 X134.236 Y138.088 E.01855
G1 X115.912 Y119.764 E1.15271
G1 X116.109 Y119.404 E.01826
G1 X134.596 Y137.891 E1.16294
G2 X134.954 Y137.691 I-1.599 J-3.286 E.01823
G1 X116.31 Y119.048 E1.17279
G1 X116.525 Y118.705 E.01799
G1 X135.295 Y137.475 E1.18079
G2 X135.634 Y137.257 I-1.771 J-3.128 E.01795
G1 X116.744 Y118.367 E1.18831
G1 X116.975 Y118.04 E.01779
G1 X135.959 Y137.025 E1.19427
G2 X136.281 Y136.789 I-1.938 J-2.981 E.01775
G1 X117.212 Y117.72 E1.19958
G1 X117.458 Y117.409 E.01765
G1 X136.59 Y136.541 E1.20353
G2 X136.895 Y136.288 I-2.098 J-2.838 E.01762
G1 X117.713 Y117.106 E1.20668
G1 X117.975 Y116.811 E.01756
G1 X137.188 Y136.024 E1.20865
G2 X137.476 Y135.755 I-2.256 J-2.697 E.01755
G1 X118.246 Y116.525 E1.2097
G1 X118.524 Y116.245 E.01753
G1 X137.754 Y135.475 E1.2097
G2 X138.025 Y135.189 I-2.413 J-2.558 E.01755
G1 X118.812 Y115.976 E1.20865
G1 X119.105 Y115.712 E.01756
G1 X138.287 Y134.894 E1.20668
G2 X138.542 Y134.591 I-2.57 J-2.416 E.01761
G1 X119.41 Y115.459 E1.20353
G1 X119.719 Y115.211 E.01764
G1 X138.788 Y134.28 E1.19958
G2 X139.025 Y133.96 I-2.731 J-2.273 E.01773
G1 X120.041 Y114.975 E1.19427
G1 X120.366 Y114.743 E.01777
G1 X139.256 Y133.633 E1.18831
G2 X139.475 Y133.295 I-2.896 J-2.125 E.01793
G1 X120.705 Y114.525 E1.18079
G1 X121.046 Y114.309 E.01797
G1 X139.69 Y132.952 E1.17279
G2 X139.891 Y132.596 I-3.07 J-1.97 E.0182
G1 X121.404 Y114.109 E1.16294
G3 X121.764 Y113.912 I1.936 J3.107 E.01827
G1 X140.088 Y132.236 E1.15271
G2 X140.27 Y131.86 I-3.253 J-1.804 E.01857
G1 X122.139 Y113.73 E1.14053
G3 X122.52 Y113.553 I1.765 J3.298 E.01867
G1 X140.448 Y131.482 E1.12784
G1 X140.611 Y131.087 E.019
G1 X122.913 Y113.389 E1.11331
G3 X123.315 Y113.234 I1.58 J3.506 E.01919
G1 X140.767 Y130.686 E1.09784
G1 X140.911 Y130.272 E.01949
G1 X123.727 Y113.088 E1.08096
G3 X124.154 Y112.958 I1.377 J3.734 E.01986
G1 X141.043 Y129.847 E1.06243
G1 X141.166 Y129.413 E.02006
G1 X124.587 Y112.833 E1.04298
G1 X125.039 Y112.728 E.02066
G1 X141.271 Y128.961 E1.02112
G2 X141.362 Y128.494 I-5.068 J-1.231 E.02114
G1 X125.501 Y112.633 E.99779
G1 X125.976 Y112.551 E.02145
G1 X141.446 Y128.021 E.97319
G2 X141.511 Y127.529 I-3.657 J-.733 E.02211
G1 X126.471 Y112.489 E.94612
G3 X126.979 Y112.439 I.695 J4.497 E.02271
G1 X141.562 Y127.022 E.91738
G1 X141.591 Y126.493 E.02358
G1 X127.505 Y112.408 E.88605
G3 X128.062 Y112.407 I.282 J4.172 E.02479
G1 X141.597 Y125.942 E.85145
G2 X141.584 Y125.372 I-5.087 J-.167 E.0254
G1 X128.629 Y112.417 E.81497
G3 X129.225 Y112.455 I-.046 J5.325 E.02658
G1 X141.547 Y124.777 E.77513
G1 X141.474 Y124.147 E.02823
G1 X129.851 Y112.524 E.73117
G3 X130.519 Y112.635 I-.654 J6.008 E.03015
G1 X141.363 Y123.479 E.68218
G2 X141.209 Y122.767 I-6.416 J1.021 E.03243
G1 X131.231 Y112.79 E.62766
G3 X132.011 Y113.012 I-1.274 J5.95 E.03607
G1 X140.997 Y121.998 E.5653
G2 X140.708 Y121.152 I-7.675 J2.145 E.03977
G1 X132.848 Y113.291 E.49449
G3 X133.829 Y113.715 I-3.282 J8.946 E.04756
G1 X140.286 Y120.172 E.40621
G2 X139.646 Y118.975 I-14.298 J6.875 E.06044
G1 X135.03 Y114.359 E.29034
G3 X139.169 Y117.941 I-11.177 J17.099 E.24419
; CHANGE_LAYER
; Z_HEIGHT: 16.16
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X137.736 Y116.545 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 58/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z16.28 I-1.197 J-.219 P1  F30000
G1 X133.699 Y138.63 Z16.28
G1 Z16.16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X120.921 Y114.084 I-5.707 J-12.628 E1.86813
G3 X128.806 Y112.168 I7.085 J11.979 E.36629
G3 X133.753 Y138.605 I-.815 J13.834 E1.63591
G1 X133.858 Y138.974 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.854 Y138.974 E.00017
G3 X124.033 Y139.666 I-5.849 J-12.973 E.41276
G1 X124.033 Y139.666 E0
G3 X128.826 Y111.794 I3.967 J-13.666 E1.70443
G3 X134.572 Y138.625 I-.821 J14.207 E1.5216
G1 X133.912 Y138.948 E.03017
M204 S10000
; WIPE_START
G1 F24000
G1 X133.854 Y138.974 E-.0242
G1 X133.118 Y139.284 E-.3034
G1 X132.365 Y139.55 E-.30344
G1 X132.039 Y139.645 E-.12896
; WIPE_END
G1 E-.04 F1800
G1 X136.015 Y137.107 Z16.56 F30000
G1 Z16.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X139.27 Y133.48 I-14.098 J-15.927 E.21725
G1 X139.573 Y132.995 E.02543
G1 X134.99 Y137.578 E.2883
G3 X133.798 Y138.216 I-7.977 J-13.474 E.06017
G1 X140.215 Y131.799 E.40367
G2 X140.636 Y130.823 I-8.477 J-4.242 E.04732
G1 X132.823 Y138.636 E.49152
G3 X131.982 Y138.923 I-2.976 J-7.346 E.03956
G1 X140.926 Y129.979 E.56264
G2 X141.136 Y129.215 I-6.702 J-2.255 E.03529
G1 X131.217 Y139.134 E.624
G3 X130.508 Y139.288 I-1.724 J-6.228 E.03225
G1 X141.29 Y128.506 E.67824
G2 X141.4 Y127.842 I-5.868 J-1.316 E.02999
G1 X129.844 Y139.398 E.72697
G1 X129.217 Y139.471 E.02807
G1 X141.469 Y127.219 E.77069
G2 X141.507 Y126.627 I-5.258 J-.639 E.02644
G1 X128.626 Y139.508 E.81032
G3 X128.058 Y139.521 I-.402 J-5.046 E.02526
G1 X141.521 Y126.058 E.84693
G2 X141.516 Y125.509 I-4.887 J-.224 E.02442
G1 X127.511 Y139.514 E.88102
G1 X126.984 Y139.486 E.02345
G1 X141.485 Y124.986 E.91217
G2 X141.436 Y124.481 I-8.706 J.593 E.02258
G1 X126.481 Y139.436 E.94076
G3 X125.99 Y139.373 I.316 J-4.406 E.02204
G1 X141.374 Y123.988 E.96779
G1 X141.292 Y123.516 E.02133
G1 X125.515 Y139.293 E.99253
G3 X125.057 Y139.197 I.63 J-4.124 E.02082
G1 X141.197 Y123.056 E1.01536
G1 X141.093 Y122.606 E.02055
G1 X124.607 Y139.093 E1.0371
G1 X124.176 Y138.97 E.01995
G1 X140.969 Y122.176 E1.05644
G2 X140.839 Y121.752 I-3.843 J.945 E.01975
G1 X123.753 Y138.838 E1.07487
G1 X123.341 Y138.696 E.01938
G1 X140.695 Y121.342 E1.09166
G2 X140.541 Y120.942 I-3.641 J1.171 E.01909
M73 P75 R5
G1 X122.942 Y138.54 E1.10705
G1 X122.55 Y138.379 E.01889
G1 X140.377 Y120.551 E1.12149
G2 X140.201 Y120.173 I-3.456 J1.377 E.01857
G1 X122.173 Y138.201 E1.13412
G3 X121.799 Y138.021 I1.421 J-3.417 E.01847
G1 X140.02 Y119.799 E1.14623
G2 X139.824 Y119.441 I-3.287 J1.568 E.01817
G1 X121.441 Y137.824 E1.15641
G3 X121.087 Y137.624 I1.604 J-3.253 E.0181
G1 X139.626 Y119.086 E1.1662
G1 X139.411 Y118.746 E.01787
G1 X120.746 Y137.411 E1.17416
G3 X120.41 Y137.193 I1.777 J-3.099 E.01783
G1 X139.194 Y118.409 E1.18164
G1 X138.963 Y118.085 E.01767
G1 X120.085 Y136.963 E1.18757
G3 X119.767 Y136.727 I1.942 J-2.952 E.01763
G1 X138.729 Y117.766 E1.19284
G1 X138.482 Y117.458 E.01754
G1 X119.457 Y136.482 E1.19677
G3 X119.156 Y136.229 I2.102 J-2.808 E.01751
G1 X138.23 Y117.155 E1.19991
G1 X137.968 Y116.863 E.01746
G1 X118.863 Y135.969 E1.20187
G3 X118.578 Y135.699 I2.258 J-2.669 E.01745
G1 X137.7 Y116.577 E1.20291
G1 X137.422 Y116.301 E.01743
G1 X118.3 Y135.423 E1.20291
G3 X118.032 Y135.137 I2.414 J-2.529 E.01745
G1 X137.137 Y116.031 E1.20187
G1 X136.844 Y115.77 E.01746
G1 X117.769 Y134.845 E1.19991
G3 X117.518 Y134.542 I2.571 J-2.39 E.01752
G1 X136.543 Y115.517 E1.19677
G1 X136.233 Y115.272 E.01755
G1 X117.271 Y134.234 E1.19284
G3 X117.037 Y133.915 I2.731 J-2.247 E.01765
G1 X135.915 Y115.036 E1.18756
G1 X135.59 Y114.807 E.01769
G1 X116.806 Y133.591 E1.18164
G3 X116.589 Y133.254 I2.896 J-2.1 E.01785
G1 X135.254 Y114.589 E1.17416
G1 X134.913 Y114.376 E.01789
G1 X116.374 Y132.914 E1.1662
G3 X116.176 Y132.559 I3.064 J-1.943 E.01813
G1 X134.559 Y114.176 E1.1564
G1 X134.201 Y113.979 E.01816
G1 X115.98 Y132.2 E1.14623
G1 X115.799 Y131.827 E.01845
G1 X133.827 Y113.799 E1.13412
G2 X133.45 Y113.621 I-1.769 J3.265 E.01853
G1 X115.623 Y131.449 E1.12149
G1 X115.459 Y131.058 E.01885
G1 X133.057 Y113.46 E1.10704
G2 X132.659 Y113.304 I-1.585 J3.471 E.01905
G1 X115.305 Y130.658 E1.09166
G1 X115.161 Y130.248 E.01932
G1 X132.247 Y113.162 E1.07486
G2 X131.824 Y113.03 I-1.382 J3.699 E.01971
G1 X115.031 Y129.824 E1.05644
G3 X114.907 Y129.394 I3.769 J-1.318 E.01993
G1 X131.393 Y112.907 E1.03709
G2 X130.943 Y112.803 I-1.155 J3.953 E.02055
G1 X114.803 Y128.943 E1.01535
G3 X114.708 Y128.484 I4.042 J-1.075 E.02088
G1 X130.485 Y112.706 E.99252
G1 X130.01 Y112.627 E.02142
G1 X114.626 Y128.012 E.96778
G3 X114.564 Y127.519 I4.356 J-.795 E.0221
G1 X129.519 Y112.564 E.94076
G2 X129.015 Y112.514 I-.703 J4.458 E.02253
G1 X114.515 Y127.014 E.91217
G1 X114.484 Y126.491 E.02332
G1 X128.489 Y112.486 E.88101
G2 X127.942 Y112.479 I-.334 J4.869 E.02437
G1 X114.479 Y125.942 E.84692
G3 X114.493 Y125.373 I5.07 J-.155 E.02532
G1 X127.374 Y112.492 E.81031
G2 X126.783 Y112.529 I.036 J5.286 E.02638
G1 X114.531 Y124.78 E.77068
G1 X114.6 Y124.158 E.02785
G1 X126.156 Y112.602 E.72696
G2 X125.492 Y112.712 I.647 J5.968 E.02996
G1 X114.71 Y123.493 E.67823
G3 X114.864 Y122.785 I6.383 J1.017 E.03226
G1 X124.783 Y112.866 E.62399
G2 X124.018 Y113.077 I1.495 J6.919 E.03532
G1 X115.074 Y122.02 E.56263
G3 X115.364 Y121.177 I25.774 J8.367 E.03967
G1 X123.177 Y113.364 E.49151
G2 X122.202 Y113.784 I6.886 J17.298 E.04724
G1 X115.785 Y120.201 E.40365
G3 X116.427 Y119.005 I12.834 J6.117 E.0604
G1 X121.01 Y114.422 E.28827
G2 X118.69 Y116.188 I9.74 J15.205 E.12979
G1 X116.891 Y117.987 E.1132
; CHANGE_LAYER
; Z_HEIGHT: 16.44
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X118.305 Y116.573 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 59/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z16.56 I-.998 J.697 P1  F30000
G1 X133.665 Y138.556 Z16.56
G1 Z16.44
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X127.57 Y112.223 I-5.673 J-12.559 E2.16705
G3 X129.085 Y112.26 I.429 J13.499 E.06741
G3 X133.72 Y138.531 I-1.092 J13.737 E1.61438
G1 X133.825 Y138.905 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.822 Y138.903 E.00017
G3 X126.766 Y111.895 I-5.829 J-12.903 E2.02253
G3 X129.105 Y111.885 I1.234 J15.741 E.09611
G3 X134.536 Y138.556 I-1.111 J14.115 E1.50138
G1 X133.879 Y138.879 E.03006
M204 S10000
; WIPE_START
G1 F24000
G1 X133.822 Y138.903 E-.0236
G1 X133.091 Y139.212 E-.30176
G1 X132.342 Y139.477 E-.30181
G1 X132.006 Y139.575 E-.13283
; WIPE_END
G1 E-.04 F1800
G1 X124.855 Y136.907 Z16.84 F30000
G1 X116.946 Y133.957 Z16.84
G1 Z16.44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X118.795 Y135.807 E.11633
G2 X121.072 Y137.525 I11.96 J-13.484 E.12704
G1 X116.47 Y132.922 E.28954
G3 X115.837 Y131.73 I14.183 J-8.294 E.06005
G1 X122.269 Y138.163 E.40464
G2 X123.249 Y138.583 I8.563 J-18.605 E.04741
G1 X115.421 Y130.755 E.49244
G3 X115.135 Y129.91 I7.374 J-2.961 E.03966
G1 X124.091 Y138.866 E.56339
G2 X124.858 Y139.074 I2.234 J-6.726 E.03536
G1 X114.927 Y129.143 E.62474
G3 X114.776 Y128.433 I6.245 J-1.698 E.0323
G1 X125.568 Y139.225 E.6789
G2 X126.234 Y139.332 I1.285 J-5.878 E.03002
G1 X114.67 Y127.767 E.72749
G3 X114.599 Y127.137 I5.575 J-.947 E.02822
G1 X126.862 Y139.401 E.77146
G2 X127.456 Y139.435 I.602 J-5.267 E.02645
G1 X114.564 Y126.543 E.811
G3 X114.555 Y125.975 I5.052 J-.362 E.02528
G1 X128.025 Y139.445 E.84735
G2 X128.574 Y139.434 I.182 J-4.892 E.02443
G1 X114.567 Y125.427 E.88114
G3 X114.595 Y124.897 I4.74 J-.007 E.02363
G1 X129.102 Y139.403 E.91253
G2 X129.606 Y139.349 I-.233 J-4.522 E.02259
G1 X114.651 Y124.393 E.94081
G3 X114.719 Y123.903 I4.403 J.365 E.02205
G1 X130.098 Y139.282 E.96745
G1 X130.575 Y139.199 E.02152
G1 X114.799 Y123.423 E.99241
G3 X114.902 Y122.967 I4.119 J.684 E.02083
G1 X131.033 Y139.098 E1.0148
G2 X131.483 Y138.989 I-.747 J-4.063 E.02061
G1 X115.012 Y122.518 E1.03615
G1 X115.136 Y122.083 E.02013
G1 X131.916 Y138.863 E1.05559
G2 X132.339 Y138.726 I-1.004 J-3.831 E.01977
G1 X115.274 Y121.662 E1.0735
G1 X115.418 Y121.246 E.01955
G1 X132.752 Y138.58 E1.09043
G2 X133.15 Y138.419 I-1.234 J-3.625 E.01911
G1 X115.581 Y120.85 E1.10526
G3 X115.747 Y120.457 I3.576 J1.29 E.01897
G1 X133.544 Y138.254 E1.11953
G1 X133.92 Y138.071 E.0186
G1 X115.928 Y120.079 E1.13179
G3 X116.116 Y119.708 I3.396 J1.49 E.01851
G1 X134.293 Y137.885 E1.14343
G1 X134.652 Y137.685 E.01829
G1 X116.315 Y119.347 E1.15356
G3 X116.523 Y118.996 I3.229 J1.678 E.01816
G1 X135.005 Y137.478 E1.16265
G1 X135.347 Y137.261 E.01803
G1 X116.738 Y118.652 E1.17068
G3 X116.965 Y118.32 I3.184 J1.943 E.0179
G1 X135.681 Y137.036 E1.17735
G1 X136.007 Y136.803 E.01783
G1 X117.196 Y117.992 E1.18337
G3 X117.441 Y117.677 I2.817 J1.942 E.01773
G1 X136.323 Y136.56 E1.18783
G1 X136.633 Y136.311 E.01769
G1 X117.688 Y117.365 E1.1918
G3 X117.95 Y117.069 I2.771 J2.187 E.01763
G1 X136.931 Y136.05 E1.19405
G1 X137.226 Y135.785 E.01761
G1 X118.214 Y116.773 E1.19597
G1 X118.493 Y116.493 E.01759
G1 X137.507 Y135.507 E1.19612
G1 X137.786 Y135.227 E.01759
G1 X118.774 Y116.215 E1.19597
G1 X119.068 Y115.95 E.01761
G1 X138.05 Y134.931 E1.19405
G2 X138.312 Y134.635 I-2.513 J-2.487 E.01763
G1 X119.367 Y115.689 E1.1918
G1 X119.677 Y115.44 E.01769
G1 X138.559 Y134.323 E1.18783
G2 X138.804 Y134.008 I-2.675 J-2.338 E.01773
G1 X119.993 Y115.197 E1.18338
G1 X120.319 Y114.964 E.01783
G1 X139.035 Y133.681 E1.1774
G2 X139.262 Y133.348 I-2.844 J-2.186 E.01791
G1 X120.653 Y114.739 E1.17068
G1 X120.995 Y114.522 E.01803
G1 X139.477 Y133.004 E1.16265
G2 X139.685 Y132.653 I-3.022 J-2.029 E.01816
M73 P76 R5
G1 X121.348 Y114.315 E1.15356
G1 X121.707 Y114.115 E.01829
G1 X139.883 Y132.292 E1.14343
G2 X140.072 Y131.921 I-3.208 J-1.861 E.01851
G1 X122.079 Y113.929 E1.13184
G1 X122.456 Y113.746 E.01861
G1 X140.253 Y131.543 E1.11953
G2 X140.419 Y131.15 I-3.409 J-1.682 E.01897
G1 X122.85 Y113.581 E1.10526
G3 X123.248 Y113.42 I1.632 J3.464 E.01911
G1 X140.582 Y130.754 E1.09044
G1 X140.726 Y130.338 E.01955
G1 X123.661 Y113.274 E1.0735
G3 X124.084 Y113.137 I1.427 J3.695 E.01977
G1 X140.864 Y129.917 E1.05559
G1 X140.988 Y129.482 E.02013
G1 X124.517 Y113.011 E1.03615
G3 X124.967 Y112.902 I1.197 J3.952 E.02061
G1 X141.098 Y129.034 E1.0148
G2 X141.201 Y128.577 I-4.025 J-1.142 E.02083
G1 X125.425 Y112.801 E.99241
G1 X125.902 Y112.718 E.02152
G1 X141.281 Y128.097 E.96745
G2 X141.349 Y127.607 I-4.334 J-.856 E.02205
G1 X126.394 Y112.651 E.94081
G3 X126.898 Y112.597 I.737 J4.466 E.02259
G1 X141.405 Y127.103 E.91253
G2 X141.433 Y126.573 I-4.706 J-.523 E.02363
G1 X127.426 Y112.566 E.88115
G3 X127.975 Y112.555 I.367 J4.881 E.02443
G1 X141.445 Y126.025 E.84736
G2 X141.436 Y125.457 I-5.06 J-.206 E.02528
G1 X128.544 Y112.565 E.81101
G3 X129.139 Y112.601 I-.036 J5.532 E.02653
G1 X141.401 Y124.863 E.77135
G2 X141.33 Y124.233 I-5.646 J.317 E.02822
G1 X129.766 Y112.668 E.72748
G3 X130.432 Y112.775 I-.581 J5.758 E.03001
G1 X141.224 Y123.567 E.6789
G2 X141.073 Y122.857 I-6.395 J.987 E.0323
G1 X131.142 Y112.926 E.62475
G3 X131.909 Y113.134 I-1.466 J6.933 E.03536
G1 X140.865 Y122.09 E.5634
G2 X140.579 Y121.245 I-7.658 J2.116 E.03966
G1 X132.751 Y113.417 E.49245
G3 X133.731 Y113.837 I-7.577 J19.011 E.04741
G1 X140.164 Y120.271 E.40472
G2 X139.53 Y119.078 I-14.928 J7.166 E.06011
G1 X134.927 Y114.475 E.28956
G1 X135.438 Y114.793 E.02676
G3 X139.054 Y118.043 I-12.896 J17.992 E.21671
; CHANGE_LAYER
; Z_HEIGHT: 16.72
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X137.64 Y116.629 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 60/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z16.84 I-1.197 J-.22 P1  F30000
G1 X133.629 Y138.476 Z16.84
G1 Z16.72
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X121.677 Y113.854 I-5.638 J-12.475 E1.87967
G3 X128.558 Y112.322 I6.307 J12.113 E.31717
G3 X133.684 Y138.451 I-.567 J13.678 E1.62676
G1 X133.784 Y138.825 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.057 Y139.124 E.03228
G3 X121.504 Y113.521 I-5.065 J-13.122 E1.75029
G3 X128.578 Y111.948 I6.479 J12.444 E.30097
G3 X133.834 Y138.797 I-.587 J14.054 E1.54291
M204 S10000
; WIPE_START
G1 F24000
G1 X133.057 Y139.124 E-.32042
G1 X132.095 Y139.454 E-.38621
G1 X131.961 Y139.494 E-.05337
; WIPE_END
G1 E-.04 F1800
G1 X135.905 Y136.981 Z17.12 F30000
G1 Z16.72
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X139.438 Y132.892 I-14.25 J-15.884 E.24098
G1 X134.88 Y137.45 E.28669
G3 X133.694 Y138.081 I-13.05 J-23.108 E.05978
G1 X140.079 Y131.695 E.40169
G2 X140.497 Y130.722 I-18.647 J-8.584 E.04713
G1 X132.727 Y138.492 E.4888
G3 X131.886 Y138.777 I-3.682 J-9.469 E.03951
G1 X140.779 Y129.884 E.55943
G2 X140.986 Y129.122 I-6.681 J-2.22 E.03514
G1 X131.124 Y138.984 E.62039
G3 X130.418 Y139.134 I-1.688 J-6.205 E.0321
G1 X141.136 Y128.417 E.6742
G2 X141.242 Y127.755 I-5.837 J-1.277 E.02983
G1 X129.757 Y139.24 E.72248
G3 X129.131 Y139.311 I-.942 J-5.538 E.02804
G1 X141.31 Y127.131 E.76617
G2 X141.344 Y126.542 I-5.231 J-.598 E.02628
G1 X128.541 Y139.346 E.80546
G3 X127.976 Y139.355 I-.36 J-5.019 E.02511
G1 X141.354 Y125.977 E.84157
G2 X141.344 Y125.431 I-4.859 J-.181 E.02427
G1 X127.432 Y139.343 E.87515
G3 X126.906 Y139.314 I-.008 J-4.71 E.02348
G1 X141.313 Y124.907 E.90633
G2 X141.259 Y124.406 I-4.492 J.231 E.02244
G1 X126.405 Y139.26 E.93443
G3 X125.918 Y139.192 I.362 J-4.374 E.0219
G1 X141.192 Y123.917 E.9609
G2 X141.106 Y123.448 I-5.399 J.753 E.02122
G1 X125.441 Y139.112 E.98541
G3 X124.988 Y139.011 I.677 J-4.083 E.0207
G1 X141.006 Y122.992 E1.00768
G2 X140.902 Y122.541 I-3.342 J.536 E.02061
G1 X124.542 Y138.901 E1.02915
G1 X124.11 Y138.778 E.02
G1 X140.777 Y122.111 E1.04846
G2 X140.641 Y121.691 I-3.805 J.997 E.01964
G1 X123.691 Y138.64 E1.06625
G1 X123.279 Y138.498 E.01942
G1 X140.496 Y121.28 E1.08308
G2 X140.336 Y120.885 I-3.602 J1.226 E.01899
G1 X122.885 Y138.336 E1.0978
G3 X122.495 Y138.17 I1.281 J-3.552 E.01885
G1 X140.172 Y120.494 E1.11198
G1 X139.99 Y120.12 E.01849
G1 X122.119 Y137.991 E1.12421
G3 X121.751 Y137.804 I1.48 J-3.374 E.01839
G1 X139.805 Y119.75 E1.13572
G1 X139.606 Y119.393 E.01817
G1 X121.392 Y137.607 E1.14579
G3 X121.043 Y137.4 I1.666 J-3.208 E.01804
G1 X139.401 Y119.043 E1.15482
G1 X139.186 Y118.702 E.01791
G1 X120.701 Y137.187 E1.1628
G3 X120.371 Y136.961 I1.842 J-3.051 E.01779
G1 X138.962 Y118.371 E1.16947
G1 X138.73 Y118.047 E.01771
G1 X120.046 Y136.732 E1.17541
G3 X119.733 Y136.488 I2.011 J-2.901 E.01761
G1 X138.489 Y117.733 E1.17984
G1 X138.241 Y117.425 E.01758
G1 X119.424 Y136.243 E1.18378
G3 X119.129 Y135.982 I2.174 J-2.755 E.01751
G1 X137.982 Y117.129 E1.18602
G1 X137.719 Y116.836 E.0175
G1 X118.836 Y135.72 E1.18792
G1 X118.557 Y135.443 E.01747
G1 X137.443 Y116.557 E1.18807
G1 X137.164 Y116.28 E.01747
G1 X118.281 Y135.164 E1.18792
G1 X118.018 Y134.871 E.0175
G1 X136.871 Y116.018 E1.18602
G2 X136.576 Y115.757 I-2.47 J2.495 E.01751
G1 X117.759 Y134.575 E1.18377
G1 X117.511 Y134.267 E.01758
G1 X136.267 Y115.512 E1.17984
G2 X135.954 Y115.268 I-2.322 J2.657 E.01761
G1 X117.269 Y133.953 E1.17541
G1 X117.038 Y133.629 E.01771
G1 X135.629 Y115.039 E1.16947
G2 X135.299 Y114.813 I-2.173 J2.827 E.01779
G1 X116.814 Y133.298 E1.16279
G1 X116.599 Y132.957 E.01791
G1 X134.957 Y114.6 E1.15482
G2 X134.608 Y114.393 I-2.015 J3.001 E.01804
G1 X116.396 Y132.605 E1.14564
G1 X116.201 Y132.244 E.01823
G1 X134.249 Y114.196 E1.13534
G2 X133.881 Y114.009 I-1.849 J3.187 E.01839
G1 X116.01 Y131.88 E1.12421
G1 X115.828 Y131.506 E.01849
G1 X133.505 Y113.83 E1.11198
G2 X133.115 Y113.664 I-1.671 J3.388 E.01885
G1 X115.664 Y131.115 E1.0978
G3 X115.505 Y130.719 I2.812 J-1.357 E.01902
G1 X132.721 Y113.502 E1.08301
G1 X132.309 Y113.36 E.01942
G1 X115.364 Y130.304 E1.06592
G1 X115.223 Y129.889 E.01948
G1 X131.89 Y113.222 E1.04845
G1 X131.458 Y113.099 E.02
G1 X115.098 Y129.459 E1.02914
G3 X114.99 Y129.012 I3.926 J-1.189 E.02047
G1 X131.012 Y112.989 E1.00793
G2 X130.558 Y112.888 I-1.132 J3.987 E.0207
G1 X114.89 Y128.557 E.98568
G1 X114.808 Y128.083 E.02138
G1 X130.082 Y112.808 E.96089
G2 X129.595 Y112.74 I-.849 J4.304 E.0219
G1 X114.741 Y127.594 E.93442
G3 X114.687 Y127.093 I4.437 J-.732 E.02244
G1 X129.094 Y112.686 E.90633
G2 X128.568 Y112.657 I-.519 J4.674 E.02348
G1 X114.656 Y126.569 E.87514
G3 X114.646 Y126.023 I4.849 J-.364 E.02427
G1 X128.018 Y112.651 E.84122
G2 X127.459 Y112.654 I-.256 J4.076 E.02487
G1 X114.656 Y125.458 E.80545
G3 X114.69 Y124.868 I5.267 J.009 E.02628
G1 X126.869 Y112.689 E.76616
G2 X126.243 Y112.76 I.316 J5.609 E.02804
G1 X114.758 Y124.245 E.72247
G3 X114.864 Y123.583 I5.945 J.615 E.02983
G1 X125.582 Y112.866 E.67419
G2 X124.876 Y113.016 I.982 J6.355 E.0321
G1 X115.014 Y122.877 E.62038
G3 X115.221 Y122.115 I6.89 J1.459 E.03514
G1 X124.114 Y113.223 E.55941
G2 X123.275 Y113.506 I2.104 J7.611 E.03941
G1 X115.503 Y121.278 E.48891
G3 X115.921 Y120.304 I19.084 J7.619 E.04713
G1 X122.306 Y113.919 E.40167
G2 X121.119 Y114.55 I7.029 J14.647 E.0598
G1 X116.556 Y119.114 E.28709
G3 X120.095 Y115.02 I18 J11.982 E.24136
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X118.7 Y116.453 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 61/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z17.12 I-1.007 J.683 P1  F30000
G1 X133.591 Y138.392 Z17.12
M73 P77 R5
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X121.72 Y113.937 I-5.6 J-12.39 E1.867
G3 X128.836 Y112.43 I6.263 J12.029 E.32754
G3 X133.646 Y138.367 I-.845 J13.571 E1.60313
G1 X133.742 Y138.741 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.023 Y139.037 E.03192
G3 X120.862 Y113.985 I-5.031 J-13.035 E1.70645
G3 X128.856 Y112.056 I7.145 J12.081 E.34266
G3 X133.793 Y138.713 I-.864 J13.946 E1.52118
M204 S10000
; WIPE_START
G1 F24000
G1 X133.023 Y139.037 E-.31761
G1 X132.285 Y139.302 E-.29785
G1 X131.92 Y139.408 E-.14454
; WIPE_END
G1 E-.04 F1800
G1 X124.773 Y136.729 Z17.4 F30000
G1 X117.096 Y133.851 Z17.4
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X118.403 Y135.158 E.08221
G2 X121.158 Y137.361 I9.813 J-9.446 E.15735
G1 X116.634 Y132.837 E.28459
G3 X116.005 Y131.658 I13.76 J-8.083 E.05947
G1 X122.341 Y137.993 E.39855
G2 X123.308 Y138.409 I4.183 J-8.399 E.04683
G1 X115.594 Y130.695 E.48524
G3 X115.313 Y129.862 I7.278 J-2.925 E.03915
G1 X124.14 Y138.689 E.55532
G2 X124.897 Y138.895 I2.207 J-6.638 E.03491
G1 X115.107 Y129.104 E.61588
G3 X114.958 Y128.403 I6.163 J-1.677 E.03188
G1 X125.598 Y139.044 E.66935
G2 X126.255 Y139.149 I1.269 J-5.799 E.02963
G1 X114.853 Y127.747 E.71731
G3 X114.782 Y127.125 I5.499 J-.936 E.02785
G1 X126.875 Y139.217 E.7607
G2 X127.46 Y139.251 I.595 J-5.198 E.02611
G1 X114.747 Y126.538 E.79972
G3 X114.739 Y125.978 I4.986 J-.358 E.02494
G1 X128.022 Y139.261 E.83561
G2 X128.563 Y139.251 I.181 J-4.827 E.0241
G1 X114.75 Y125.438 E.86896
G3 X114.778 Y124.914 I4.669 J-.009 E.02332
G1 X129.084 Y139.22 E.89993
G2 X129.582 Y139.167 I-.228 J-4.46 E.02229
G1 X114.833 Y124.417 E.92783
G3 X114.9 Y123.933 I4.344 J.359 E.02175
G1 X130.068 Y139.1 E.95413
G1 X130.538 Y139.019 E.02123
G1 X114.979 Y123.46 E.97875
G3 X115.08 Y123.01 I4.053 J.671 E.02056
G1 X130.99 Y138.92 E1.00085
G2 X131.434 Y138.812 I-.736 J-4.007 E.02033
G1 X115.189 Y122.567 E1.02192
G1 X115.312 Y122.138 E.01986
G1 X131.861 Y138.687 E1.0411
G2 X132.278 Y138.553 I-.99 J-3.781 E.0195
G1 X115.448 Y121.722 E1.05877
G1 X115.59 Y121.312 E.01929
G1 X132.686 Y138.409 E1.07548
G2 X133.079 Y138.25 I-1.217 J-3.577 E.01886
G1 X115.75 Y120.921 E1.09011
G3 X115.915 Y120.534 I3.528 J1.272 E.01872
G1 X133.467 Y138.087 E1.1042
G1 X133.839 Y137.907 E.01836
G1 X116.093 Y120.161 E1.11634
G3 X116.279 Y119.795 I3.351 J1.47 E.01826
G1 X134.206 Y137.723 E1.12778
G1 X134.561 Y137.525 E.01804
G1 X116.474 Y119.439 E1.13778
G3 X116.679 Y119.092 I3.186 J1.655 E.01792
G1 X134.908 Y137.322 E1.14674
G1 X135.246 Y137.108 E.01778
G1 X116.891 Y118.753 E1.15467
G3 X117.115 Y118.425 I3.03 J1.829 E.01767
G1 X135.576 Y136.885 E1.1613
G1 X135.897 Y136.656 E.01759
G1 X117.343 Y118.101 E1.1672
G3 X117.585 Y117.791 I2.882 J1.997 E.01749
G1 X136.209 Y136.416 E1.17159
G1 X136.515 Y136.17 E.01745
G1 X117.836 Y117.491 E1.17504
G1 X118.091 Y117.195 E.0174
G1 X136.809 Y135.913 E1.17749
G1 X137.1 Y135.651 E.01738
G1 X118.348 Y116.9 E1.17962
G1 X118.623 Y116.623 E.01735
G1 X137.377 Y135.377 E1.17977
G1 X137.652 Y135.1 E.01735
G1 X118.9 Y116.349 E1.17962
G1 X119.191 Y116.087 E.01738
G1 X137.912 Y134.809 E1.17773
G2 X138.171 Y134.516 I-2.473 J-2.448 E.01739
G1 X119.485 Y115.83 E1.1755
G1 X119.791 Y115.584 E.01745
G1 X138.415 Y134.209 E1.17159
G2 X138.657 Y133.899 I-2.639 J-2.306 E.01749
G1 X120.103 Y115.344 E1.1672
G1 X120.424 Y115.115 E.01759
G1 X138.885 Y133.575 E1.1613
G2 X139.109 Y133.247 I-2.807 J-2.157 E.01767
G1 X120.754 Y114.892 E1.15467
G1 X121.092 Y114.678 E.01778
G1 X139.321 Y132.908 E1.14675
G2 X139.526 Y132.561 I-2.981 J-2.001 E.01792
G1 X121.439 Y114.475 E1.13778
G1 X121.794 Y114.277 E.01804
G1 X139.721 Y132.205 E1.12778
G2 X139.907 Y131.839 I-3.165 J-1.836 E.01826
G1 X122.161 Y114.093 E1.11634
G1 X122.533 Y113.913 E.01836
G1 X140.085 Y131.466 E1.1042
G2 X140.25 Y131.079 I-3.364 J-1.659 E.01872
G1 X122.921 Y113.75 E1.09011
G3 X123.314 Y113.591 I1.61 J3.418 E.01886
G1 X140.41 Y130.688 E1.07549
G1 X140.552 Y130.278 E.01929
G1 X123.722 Y113.447 E1.05877
G3 X124.139 Y113.313 I1.407 J3.646 E.0195
G1 X140.688 Y129.862 E1.0411
G1 X140.811 Y129.433 E.01986
G1 X124.566 Y113.188 E1.02192
G3 X125.01 Y113.08 I1.18 J3.9 E.02033
G1 X140.92 Y128.99 E1.00085
G2 X141.021 Y128.54 I-3.964 J-1.124 E.02056
G1 X125.462 Y112.981 E.97876
G1 X125.932 Y112.9 E.02123
G1 X141.1 Y128.067 E.95413
G2 X141.167 Y127.583 I-4.277 J-.843 E.02175
G1 X126.418 Y112.833 E.92784
G3 X126.916 Y112.78 I.726 J4.406 E.02229
G1 X141.222 Y127.086 E.89993
G2 X141.25 Y126.562 I-4.642 J-.514 E.02332
G1 X127.437 Y112.749 E.86896
G3 X127.978 Y112.739 I.361 J4.817 E.0241
G1 X141.261 Y126.022 E.83561
G2 X141.25 Y125.46 I-3.984 J-.204 E.02505
G1 X128.54 Y112.749 E.79959
G3 X129.137 Y112.794 I-.245 J7.189 E.02664
G1 X141.206 Y124.864 E.75928
G2 X141.147 Y124.253 I-7.36 J.402 E.02729
G1 X129.746 Y112.852 E.71723
G3 X130.402 Y112.956 I-.41 J4.692 E.02957
G1 X141.042 Y123.597 E.66935
G2 X140.893 Y122.896 I-6.313 J.977 E.03188
G1 X131.103 Y113.105 E.61589
G3 X131.86 Y113.311 I-1.449 J6.842 E.03491
G1 X140.687 Y122.139 E.55533
G2 X140.406 Y121.305 I-7.559 J2.091 E.03915
G1 X132.691 Y113.591 E.48528
G3 X133.659 Y114.007 I-7.648 J19.127 E.04685
G1 X139.987 Y120.335 E.39808
G2 X139.367 Y119.163 I-13.397 J6.341 E.05901
G1 X134.842 Y114.638 E.28461
G1 X135.336 Y114.947 E.02589
G3 X138.904 Y118.149 I-12.144 J17.121 E.21374
; CHANGE_LAYER
; Z_HEIGHT: 17.28
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X137.489 Y116.736 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 62/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z17.4 I-1.197 J-.218 P1  F30000
G1 X133.553 Y138.308 Z17.4
G1 Z17.28
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X128.34 Y112.498 I-5.551 J-12.31 E2.15663
G1 X129.093 Y112.538 E.03355
G3 X133.608 Y138.283 I-1.091 J13.46 E1.58134
G1 X133.7 Y138.657 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.989 Y138.949 E.03156
G3 X128.35 Y112.123 I-4.987 J-12.952 E2.01401
G1 X129.124 Y112.164 E.03183
G3 X133.752 Y138.629 I-1.122 J13.834 E1.50071
M204 S10000
; WIPE_START
G1 F24000
G1 X132.989 Y138.949 E-.31453
G1 X132.257 Y139.213 E-.29585
G1 X131.879 Y139.323 E-.14961
; WIPE_END
G1 E-.04 F1800
G1 X135.783 Y136.838 Z17.68 F30000
G1 Z17.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X139.298 Y132.767 I-13.877 J-15.535 E.23991
G1 X134.761 Y137.304 E.28542
G3 X133.582 Y137.927 I-8.559 J-14.765 E.05934
G1 X139.925 Y131.584 E.39905
G2 X140.336 Y130.618 I-16.17 J-7.436 E.04669
G1 X132.621 Y138.333 E.48531
G3 X131.785 Y138.612 I-2.906 J-7.298 E.0392
G1 X140.614 Y129.784 E.55534
G2 X140.816 Y129.026 I-6.651 J-2.182 E.03493
G1 X131.027 Y138.815 E.61582
G3 X130.325 Y138.961 I-1.649 J-6.173 E.03189
G1 X140.962 Y128.324 E.66914
G2 X141.064 Y127.666 I-5.807 J-1.237 E.02963
G1 X129.668 Y139.062 E.7169
M73 P78 R5
G3 X129.045 Y139.129 I-.901 J-5.506 E.02784
G1 X141.131 Y127.044 E.76024
G1 X141.162 Y126.457 E.02615
G1 X128.455 Y139.164 E.79938
G3 X127.895 Y139.168 I-.318 J-4.985 E.02493
G1 X141.167 Y125.895 E.83495
G2 X141.152 Y125.354 I-4.824 J-.138 E.02408
G1 X127.355 Y139.152 E.86797
G3 X126.832 Y139.118 I.036 J-4.669 E.0233
G1 X141.12 Y124.831 E.8988
G1 X141.062 Y124.333 E.02231
G1 X126.331 Y139.064 E.92669
G3 X125.848 Y138.991 I.408 J-4.336 E.02174
G1 X140.991 Y123.848 E.95257
G2 X140.908 Y123.375 I-4.252 J.5 E.02137
G1 X125.377 Y138.907 E.97704
G1 X124.923 Y138.804 E.02069
G1 X140.804 Y122.924 E.99901
G2 X140.69 Y122.482 I-3.994 J.791 E.02032
G1 X124.482 Y138.689 E1.01958
G1 X124.05 Y138.566 E.02001
G1 X140.565 Y122.051 E1.0389
G2 X140.424 Y121.636 I-3.763 J1.048 E.0195
G1 X123.636 Y138.424 E1.05604
G3 X123.229 Y138.275 I1.117 J-3.703 E.0193
G1 X140.277 Y121.227 E1.07244
G1 X140.113 Y120.835 E.0189
G1 X122.835 Y138.113 E1.08692
G3 X122.45 Y137.942 I1.336 J-3.507 E.01873
G1 X139.943 Y120.45 E1.10039
G1 X139.761 Y120.075 E.0185
G1 X122.074 Y137.762 E1.11262
G3 X121.711 Y137.569 I1.538 J-3.327 E.01829
G1 X139.569 Y119.711 E1.12339
G1 X139.371 Y119.354 E.01818
G1 X121.353 Y137.372 E1.13347
G3 X121.01 Y137.159 I1.719 J-3.146 E.01796
G1 X139.159 Y119.01 E1.14171
G1 X138.944 Y118.669 E.01792
G1 X120.67 Y136.943 E1.14956
G1 X120.344 Y136.713 E.01774
G1 X138.713 Y118.344 E1.15556
G2 X138.48 Y118.021 I-2.992 J1.912 E.01772
G1 X120.022 Y136.479 E1.16113
M73 P78 R4
G1 X119.712 Y136.233 E.0176
G1 X138.233 Y117.713 E1.16507
G2 X137.982 Y117.408 I-2.841 J2.08 E.01758
G1 X119.409 Y135.981 E1.16839
G1 X119.114 Y135.719 E.01751
G1 X137.719 Y117.115 E1.17035
G2 X137.45 Y116.828 I-2.693 J2.246 E.0175
G1 X118.828 Y135.449 E1.17145
G1 X118.55 Y135.172 E.01748
G1 X137.172 Y116.55 E1.17145
G2 X136.886 Y116.281 I-2.547 J2.411 E.0175
G1 X118.281 Y134.885 E1.17035
G1 X118.018 Y134.592 E.01751
G1 X136.591 Y116.019 E1.16839
G2 X136.288 Y115.767 I-2.399 J2.576 E.01757
G1 X117.767 Y134.287 E1.16507
G1 X117.52 Y133.979 E.01759
G1 X135.978 Y115.521 E1.16113
G2 X135.656 Y115.287 I-2.248 J2.745 E.01771
G1 X117.287 Y133.656 E1.15556
G3 X117.056 Y133.331 I2.794 J-2.226 E.01774
G1 X135.33 Y115.057 E1.14955
G2 X134.99 Y114.841 I-2.091 J2.918 E.01792
G1 X116.841 Y132.99 E1.14172
G3 X116.629 Y132.646 I2.96 J-2.056 E.01798
G1 X134.647 Y114.628 E1.13347
G1 X134.288 Y114.431 E.01821
G1 X116.43 Y132.289 E1.12339
G3 X116.239 Y131.925 I3.148 J-1.888 E.01832
G1 X133.926 Y114.238 E1.11262
G1 X133.55 Y114.058 E.01854
G1 X116.057 Y131.55 E1.10039
G3 X115.887 Y131.165 I3.348 J-1.707 E.01876
G1 X133.165 Y113.886 E1.08692
G1 X132.771 Y113.725 E.01895
G1 X115.723 Y130.773 E1.07243
G3 X115.576 Y130.364 I3.568 J-1.512 E.01934
G1 X132.364 Y113.576 E1.05604
G2 X131.95 Y113.434 I-1.477 J3.614 E.01946
G1 X115.435 Y129.949 E1.03891
G1 X115.31 Y129.518 E.01994
G1 X131.518 Y113.311 E1.01958
G2 X131.077 Y113.196 I-1.245 J3.866 E.02027
G1 X115.196 Y129.076 E.99901
G1 X115.092 Y128.625 E.02061
G1 X130.623 Y113.093 E.97704
G2 X130.151 Y113.009 I-.985 J4.158 E.02133
G1 X115.009 Y128.152 E.95256
G3 X114.937 Y127.667 I4.276 J-.879 E.02179
G1 X129.669 Y112.936 E.92669
G1 X129.168 Y112.882 E.02242
G1 X114.88 Y127.169 E.8988
G3 X114.848 Y126.646 I4.646 J-.549 E.02335
G1 X128.645 Y112.848 E.86796
G2 X128.105 Y112.832 I-.413 J4.82 E.02404
G1 X114.833 Y126.105 E.83494
G3 X114.838 Y125.543 I5 J-.232 E.02498
G1 X127.545 Y112.836 E.79937
G1 X126.954 Y112.871 E.02633
G1 X114.869 Y124.956 E.76024
G3 X114.936 Y124.334 I5.581 J.285 E.02788
G1 X126.332 Y112.938 E.7169
G2 X125.675 Y113.039 I.575 J5.904 E.0296
G1 X115.038 Y123.676 E.66913
G3 X115.184 Y122.974 I6.321 J.948 E.0319
G1 X124.973 Y113.185 E.61581
G2 X124.214 Y113.388 I1.428 J6.857 E.03496
G1 X115.387 Y122.215 E.55532
G3 X115.664 Y121.382 I7.593 J2.067 E.0391
G1 X123.379 Y113.667 E.4853
G2 X122.418 Y114.073 I5.755 J14.988 E.04641
G1 X116.075 Y120.416 E.39903
G3 X116.702 Y119.233 I13.139 J6.208 E.05959
G1 X121.239 Y114.696 E.28538
G2 X118.942 Y116.437 I9.444 J14.846 E.12833
G1 X117.16 Y118.219 E.11208
; CHANGE_LAYER
; Z_HEIGHT: 17.56
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X118.574 Y116.804 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 63/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z17.68 I-.998 J.696 P1  F30000
G1 X133.507 Y138.211 Z17.68
G1 Z17.56
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G1 X132.815 Y138.496 E.03332
G3 X121.815 Y114.118 I-4.824 J-12.494 E1.80557
G3 X128.6 Y112.623 I6.168 J11.846 E.31268
G3 X133.558 Y138.183 I-.61 J13.379 E1.58912
G1 X133.652 Y138.557 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.949 Y138.845 E.03119
G3 X120.967 Y114.161 I-4.958 J-12.844 E1.68147
G3 X128.62 Y112.248 I7.041 J11.906 E.32848
G3 X133.704 Y138.528 I-.629 J13.753 E1.50823
M204 S10000
; WIPE_START
G1 F24000
G1 X132.949 Y138.845 E-.31102
G1 X132.223 Y139.107 E-.29349
G1 X131.83 Y139.222 E-.15549
; WIPE_END
G1 E-.04 F1800
G1 X124.691 Y136.522 Z17.96 F30000
G1 X117.242 Y133.705 Z17.96
G1 Z17.56
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X119.063 Y135.526 E.11453
G2 X121.312 Y137.215 I10.713 J-11.92 E.12525
G1 X116.774 Y132.677 E.28546
G3 X116.156 Y131.499 I16.218 J-9.263 E.05917
G1 X122.498 Y137.842 E.39899
G2 X123.462 Y138.246 I6.769 J-14.79 E.04648
G1 X115.757 Y130.541 E.48471
G3 X115.48 Y129.704 I7.309 J-2.884 E.03921
G1 X124.297 Y138.521 E.55465
G2 X125.055 Y138.721 I2.155 J-6.657 E.03492
G1 X115.287 Y128.952 E.61451
G3 X115.137 Y128.243 I8.48 J-2.159 E.03224
G1 X125.757 Y138.863 E.66807
G2 X126.415 Y138.961 I1.203 J-5.806 E.02959
G1 X115.04 Y127.586 E.71559
G3 X114.978 Y126.964 I5.503 J-.864 E.0278
G1 X127.037 Y139.024 E.75864
G1 X127.628 Y139.055 E.02632
G1 X114.944 Y126.372 E.79789
G1 X114.943 Y125.81 E.02496
G1 X128.188 Y139.056 E.83325
G2 X128.728 Y139.036 I.094 J-4.816 E.02404
G1 X114.964 Y125.272 E.86589
G3 X115.002 Y124.751 I4.658 J.082 E.02325
G1 X129.25 Y138.999 E.89632
G1 X129.752 Y138.941 E.02245
G1 X115.057 Y124.247 E.92438
G3 X115.136 Y123.766 I4.322 J.457 E.02169
G1 X130.234 Y138.864 E.94981
G2 X130.698 Y138.768 I-.928 J-5.639 E.02106
G1 X115.225 Y123.296 E.97331
G1 X115.328 Y122.839 E.02082
G1 X131.158 Y138.669 E.99579
G2 X131.599 Y138.551 I-.609 J-3.174 E.02035
G1 X115.449 Y122.401 E1.01596
G3 X115.578 Y121.97 I3.898 J.932 E.02
G1 X132.031 Y138.423 E1.03503
G1 X132.445 Y138.277 E.0195
G1 X115.722 Y121.555 E1.05198
G3 X115.877 Y121.15 I3.68 J1.177 E.01928
G1 X132.851 Y138.124 E1.06777
G1 X133.245 Y137.959 E.01902
G1 X116.04 Y120.753 E1.08235
G3 X116.218 Y120.372 I3.481 J1.399 E.01872
G1 X133.628 Y137.782 E1.09518
G1 X134.004 Y137.599 E.01862
G1 X116.401 Y119.996 E1.10736
G1 X116.6 Y119.635 E.01833
G1 X134.365 Y137.4 E1.11757
G2 X134.722 Y137.198 I-1.624 J-3.278 E.01826
G1 X116.804 Y119.279 E1.12719
G1 X117.018 Y118.935 E.01806
G1 X135.065 Y136.981 E1.13522
G2 X135.402 Y136.759 I-1.811 J-3.113 E.01797
M73 P79 R4
G1 X117.242 Y118.599 E1.14235
G1 X117.474 Y118.271 E.01786
G1 X135.728 Y136.525 E1.14833
G2 X136.046 Y136.284 I-1.989 J-2.953 E.01777
G1 X117.716 Y117.954 E1.15307
G1 X117.964 Y117.642 E.01771
G1 X136.357 Y136.035 E1.15704
G2 X136.656 Y135.775 I-2.162 J-2.798 E.01765
G1 X118.225 Y117.344 E1.15946
G3 X118.489 Y117.048 I2.768 J2.201 E.01764
G1 X136.951 Y135.51 E1.16141
G2 X137.233 Y135.233 I-2.333 J-2.647 E.01761
G1 X118.767 Y116.767 E1.16158
G3 X119.049 Y116.49 I2.614 J2.368 E.01761
G1 X137.511 Y134.952 E1.16141
G2 X137.775 Y134.656 I-2.501 J-2.494 E.01764
G1 X119.344 Y116.225 E1.15946
G3 X119.643 Y115.965 I2.462 J2.539 E.01765
G1 X138.029 Y134.351 E1.15658
G1 X138.28 Y134.043 E.01769
G1 X119.954 Y115.716 E1.15288
G3 X120.272 Y115.475 I2.308 J2.712 E.01777
G1 X138.526 Y133.729 E1.14833
G1 X138.758 Y133.401 E.01786
G1 X120.598 Y115.242 E1.14235
G3 X120.935 Y115.019 I2.148 J2.89 E.01797
G1 X138.981 Y133.065 E1.13522
G1 X139.196 Y132.721 E.01806
G1 X121.278 Y114.802 E1.12719
G3 X121.635 Y114.6 I1.982 J3.077 E.01826
G1 X139.4 Y132.365 E1.11757
G1 X139.599 Y132.004 E.01833
G1 X121.996 Y114.401 E1.10736
G1 X122.372 Y114.218 E.01862
G1 X139.782 Y131.628 E1.09518
G2 X139.96 Y131.247 I-3.303 J-1.78 E.01872
G1 X122.755 Y114.041 E1.08235
G1 X123.149 Y113.876 E.01902
G1 X140.123 Y130.85 E1.06777
G2 X140.278 Y130.445 I-3.525 J-1.582 E.01928
G1 X123.555 Y113.723 E1.05198
G1 X123.969 Y113.577 E.0195
G1 X140.422 Y130.03 E1.03503
G2 X140.551 Y129.599 I-3.769 J-1.363 E.02
G1 X124.401 Y113.449 E1.01596
G3 X124.84 Y113.329 I1.285 J3.856 E.02029
G1 X140.672 Y129.161 E.99592
G1 X140.775 Y128.704 E.02082
G1 X125.295 Y113.224 E.9738
G3 X125.766 Y113.136 I1.023 J4.15 E.02133
G1 X140.864 Y128.235 E.94981
G2 X140.943 Y127.753 I-4.246 J-.938 E.02169
G1 X126.248 Y113.059 E.92439
G1 X126.75 Y113.001 E.02245
G1 X140.998 Y127.249 E.89632
G2 X141.036 Y126.728 I-4.618 J-.603 E.02325
G1 X127.272 Y112.964 E.86589
G3 X127.815 Y112.947 I.386 J3.822 E.02419
G1 X141.057 Y126.19 E.83304
G1 X141.056 Y125.628 E.02496
G1 X128.381 Y112.954 E.79732
G3 X128.963 Y112.976 I.023 J7.032 E.0259
G1 X141.022 Y125.036 E.75865
G2 X140.96 Y124.414 I-5.565 J.242 E.0278
G1 X129.585 Y113.039 E.71559
G3 X130.243 Y113.137 I-.545 J5.904 E.02959
G1 X140.863 Y123.757 E.66808
G2 X140.72 Y123.055 I-6.32 J.916 E.03187
G1 X130.944 Y113.279 E.61497
G3 X131.703 Y113.479 I-1.396 J6.855 E.03492
G1 X140.52 Y122.296 E.55465
G2 X140.243 Y121.459 I-7.583 J2.047 E.03921
G1 X132.538 Y113.754 E.48471
G3 X133.502 Y114.158 I-5.805 J15.195 E.04648
G1 X139.844 Y120.501 E.399
G2 X139.226 Y119.323 I-35.109 J17.677 E.05916
G1 X134.683 Y114.78 E.28581
G1 X135.223 Y115.117 E.02831
G3 X138.758 Y118.295 I-12.576 J17.541 E.21188
; CHANGE_LAYER
; Z_HEIGHT: 17.84
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X137.343 Y116.881 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 64/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z17.96 I-1.197 J-.219 P1  F30000
G1 X133.459 Y138.111 Z17.96
G1 Z17.84
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G1 X132.775 Y138.392 E.03293
G3 X122.536 Y113.891 I-4.783 J-12.391 E1.82372
G3 X128.877 Y112.748 I5.506 J12.393 E.28936
G3 X133.51 Y138.083 I-.885 J13.253 E1.56356
G1 X133.604 Y138.457 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.91 Y138.742 E.03082
G3 X122.382 Y113.549 I-4.918 J-12.741 E1.73093
G3 X128.897 Y112.374 I5.662 J12.746 E.27443
G3 X133.656 Y138.428 I-.906 J13.627 E1.48464
M204 S10000
; WIPE_START
G1 F24000
G1 X132.91 Y138.742 E-.30777
G1 X132.189 Y139.002 E-.29113
G1 X131.782 Y139.12 E-.1611
; WIPE_END
G1 E-.04 F1800
G1 X135.641 Y136.667 Z18.24 F30000
G1 Z17.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X138.791 Y133.162 I-13.611 J-15.397 E.21008
G1 X139.121 Y132.632 E.02776
G1 X134.626 Y137.127 E.28276
G3 X133.457 Y137.742 I-8.993 J-15.691 E.05877
G1 X139.739 Y131.459 E.39522
G2 X140.139 Y130.505 I-13.719 J-6.306 E.04604
G1 X132.505 Y138.138 E.48021
G3 X131.676 Y138.413 I-2.862 J-7.249 E.0389
G1 X140.414 Y129.675 E.54971
G2 X140.612 Y128.922 I-6.604 J-2.139 E.03464
G1 X130.922 Y138.612 E.60955
G3 X130.226 Y138.753 I-1.606 J-6.127 E.03161
G1 X140.753 Y128.226 E.66223
G2 X140.851 Y127.574 I-5.76 J-1.194 E.02935
G1 X129.574 Y138.85 E.70937
G3 X128.958 Y138.912 I-.858 J-5.459 E.02758
G1 X140.913 Y126.956 E.75208
G1 X140.944 Y126.37 E.0261
G1 X128.37 Y138.945 E.79101
G1 X127.814 Y138.946 E.02476
G1 X140.945 Y125.815 E.82608
G2 X140.926 Y125.279 I-4.775 J-.094 E.02384
G1 X127.279 Y138.926 E.85845
G3 X126.763 Y138.888 I.081 J-4.62 E.02306
G1 X140.889 Y124.762 E.88863
G1 X140.831 Y124.264 E.02226
G1 X126.263 Y138.833 E.91647
G3 X125.786 Y138.755 I.453 J-4.289 E.02151
G1 X140.755 Y123.786 E.94168
G2 X140.667 Y123.319 I-4.203 J.546 E.02115
G1 X125.32 Y138.666 E.96548
G1 X124.867 Y138.565 E.02065
G1 X140.563 Y122.868 E.98741
G2 X140.445 Y122.432 I-3.943 J.838 E.02012
G1 X124.432 Y138.444 E1.0073
G3 X124.005 Y138.317 I.924 J-3.865 E.01984
G1 X140.318 Y122.004 E1.02621
G1 X140.173 Y121.594 E.01934
G1 X123.593 Y138.174 E1.04301
G3 X123.192 Y138.02 I1.167 J-3.649 E.01912
G1 X140.021 Y121.191 E1.05868
G1 X139.858 Y120.8 E.01886
G1 X122.798 Y137.859 E1.07314
G3 X122.421 Y137.682 I1.387 J-3.452 E.01857
G1 X139.682 Y120.421 E1.08586
G1 X139.501 Y120.047 E.01847
G1 X122.047 Y137.5 E1.09794
G1 X121.689 Y137.304 E.01818
G1 X139.304 Y119.689 E1.10807
G2 X139.103 Y119.335 I-3.251 J1.611 E.01811
G1 X121.337 Y137.102 E1.11761
G1 X120.995 Y136.888 E.01791
G1 X138.888 Y118.996 E1.12558
G2 X138.667 Y118.661 I-3.087 J1.796 E.01782
G1 X120.662 Y136.666 E1.13264
G1 X120.337 Y136.437 E.01771
G1 X138.436 Y118.338 E1.13857
G2 X138.197 Y118.022 I-2.928 J1.972 E.01762
G1 X120.023 Y136.196 E1.14328
G1 X119.713 Y135.951 E.01757
G1 X137.95 Y117.714 E1.14721
G2 X137.692 Y117.417 I-2.776 J2.145 E.0175
G1 X119.417 Y135.692 E1.14961
G3 X119.124 Y135.431 I2.181 J-2.743 E.01749
G1 X137.43 Y117.125 E1.15154
G2 X137.154 Y116.846 I-2.625 J2.313 E.01746
G1 X118.846 Y135.154 E1.15172
G3 X118.57 Y134.875 I2.349 J-2.593 E.01746
G1 X136.876 Y116.569 E1.15154
G2 X136.579 Y116.311 I-2.048 J2.055 E.01751
G1 X118.308 Y134.583 E1.1494
G3 X118.05 Y134.285 I2.518 J-2.442 E.0175
G1 X136.282 Y116.054 E1.14691
G2 X135.977 Y115.804 I-2.971 J3.314 E.01754
G1 X117.803 Y133.978 E1.14327
G3 X117.564 Y133.662 I2.689 J-2.288 E.01762
G1 X135.663 Y115.563 E1.13857
G1 X135.338 Y115.334 E.01771
G1 X117.333 Y133.339 E1.13264
G3 X117.112 Y133.004 I2.866 J-2.13 E.01782
G1 X135.005 Y115.112 E1.12557
G1 X134.663 Y114.898 E.01791
G1 X116.897 Y132.664 E1.11761
G3 X116.696 Y132.31 I3.051 J-1.965 E.01811
G1 X134.311 Y114.696 E1.10807
G1 X133.952 Y114.5 E.01818
G1 X116.499 Y131.953 E1.09793
G1 X116.318 Y131.579 E.01847
G1 X133.579 Y114.318 E1.08586
G2 X133.201 Y114.141 I-1.765 J3.275 E.01857
G1 X116.142 Y131.2 E1.07313
G1 X115.979 Y130.809 E.01886
G1 X132.808 Y113.98 E1.05868
G2 X132.407 Y113.826 I-1.568 J3.496 E.01912
G1 X115.827 Y130.406 E1.04301
G1 X115.682 Y129.996 E.01934
G1 X131.995 Y113.683 E1.0262
G2 X131.568 Y113.556 I-1.351 J3.738 E.01984
G1 X115.555 Y129.568 E1.00729
G3 X115.437 Y129.132 I3.824 J-1.274 E.02012
G1 X131.133 Y113.435 E.9874
G1 X130.68 Y113.334 E.02065
G1 X115.333 Y128.681 E.96547
G3 X115.245 Y128.214 I4.116 J-1.014 E.02115
G1 X130.214 Y113.245 E.94168
G2 X129.737 Y113.168 I-.806 J3.472 E.02154
G1 X115.169 Y127.736 E.91643
G1 X115.111 Y127.238 E.02226
G1 X129.231 Y113.118 E.88826
G2 X128.72 Y113.074 I-.751 J5.739 E.02281
G1 X115.074 Y126.72 E.85844
G3 X115.055 Y126.185 I4.757 J-.441 E.02384
G1 X128.186 Y113.054 E.82607
G1 X127.63 Y113.055 E.02476
G1 X115.056 Y125.629 E.791
G1 X115.087 Y125.044 E.0261
G1 X127.042 Y113.088 E.75207
G2 X126.425 Y113.15 I.242 J5.521 E.02758
G1 X115.149 Y124.426 E.70936
G3 X115.247 Y123.774 I5.856 J.542 E.02935
G1 X125.774 Y113.247 E.66222
G2 X125.078 Y113.388 I.91 J6.268 E.03161
G1 X115.388 Y123.078 E.60954
G3 X115.586 Y122.325 I6.801 J1.386 E.03464
G1 X124.324 Y113.587 E.5497
M73 P80 R4
G2 X123.495 Y113.862 I2.033 J7.524 E.0389
G1 X115.859 Y121.497 E.48031
G3 X116.261 Y120.541 I15.117 J5.784 E.04614
G1 X122.543 Y114.258 E.39519
G2 X121.374 Y114.873 I7.811 J16.281 E.05878
G1 X116.879 Y119.368 E.28273
G3 X118.819 Y116.873 I11.244 J6.742 E.14088
G1 X120.359 Y115.333 E.09687
; CHANGE_LAYER
; Z_HEIGHT: 18.12
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X118.944 Y116.748 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 65/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z18.24 I-1.006 J.685 P1  F30000
G1 X133.41 Y138.006 Z18.24
G1 Z18.12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G1 X132.732 Y138.282 E.03255
G3 X126.118 Y112.966 I-4.74 J-12.283 E1.97199
G3 X128.381 Y112.838 I1.866 J12.9 E.10093
G3 X133.458 Y137.976 I-.389 J13.161 E1.57185
G1 X133.555 Y138.352 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.868 Y138.635 E.03048
G3 X128.401 Y112.463 I-4.867 J-12.636 E1.96749
G3 X141.493 Y127.159 I-.401 J13.537 E.90464
G1 X141.493 Y127.159 E0
G3 X133.608 Y138.325 I-13.491 J-1.161 E.58831
M204 S10000
; WIPE_START
G1 F24000
G1 X132.868 Y138.635 E-.30469
G1 X132.153 Y138.892 E-.28865
G1 X131.732 Y139.014 E-.16665
; WIPE_END
G1 E-.04 F1800
G1 X124.271 Y137.408 Z18.52 F30000
G1 X120.441 Y136.584 Z18.52
G1 Z18.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X118.67 Y134.813 E.11136
G3 X116.958 Y132.542 I9.958 J-9.292 E.12677
G1 X121.454 Y137.039 E.28284
G2 X122.625 Y137.651 I7.775 J-13.431 E.05882
G1 X116.346 Y131.372 E.39501
G3 X115.955 Y130.424 I14.288 J-6.434 E.04564
G1 X123.578 Y138.047 E.47955
G2 X124.407 Y138.317 I2.825 J-7.246 E.03881
G1 X115.683 Y129.593 E.54882
G3 X115.488 Y128.839 I6.612 J-2.116 E.03465
G1 X125.16 Y138.512 E.60849
G2 X125.857 Y138.65 I1.576 J-6.129 E.03158
G1 X115.35 Y128.143 E.66094
G3 X115.258 Y127.493 I5.377 J-1.09 E.02921
G1 X126.508 Y138.744 E.70772
G2 X127.125 Y138.802 I.827 J-5.46 E.02756
G1 X115.199 Y126.876 E.75022
G3 X115.17 Y126.289 I5.211 J-.548 E.02615
G1 X127.713 Y138.831 E.78898
G1 X128.269 Y138.83 E.02475
G1 X115.169 Y125.729 E.8241
G3 X115.194 Y125.197 I4.757 J-.039 E.02374
G1 X128.803 Y138.805 E.85608
G2 X129.319 Y138.763 I-.115 J-4.617 E.02305
G1 X115.237 Y124.681 E.88585
G3 X115.296 Y124.182 I4.481 J.27 E.0224
G1 X129.82 Y138.705 E.91365
G2 X130.296 Y138.624 I-.489 J-4.283 E.02152
G1 X115.376 Y123.703 E.93861
G3 X115.47 Y123.239 I4.176 J.61 E.02106
G1 X130.761 Y138.53 E.96192
G1 X131.214 Y138.426 E.0207
G1 X115.575 Y122.786 E.98384
G1 X115.699 Y122.351 E.0201
G1 X131.648 Y138.301 E1.00334
G2 X132.074 Y138.168 I-.968 J-3.855 E.01984
G1 X115.833 Y121.927 E1.02169
G1 X115.976 Y121.512 E.01952
G1 X132.486 Y138.023 E1.0386
G2 X132.886 Y137.864 I-1.213 J-3.636 E.01913
G1 X116.136 Y121.114 E1.05366
G3 X116.302 Y120.722 I3.575 J1.281 E.01896
G1 X133.279 Y137.699 E1.06799
G1 X133.655 Y137.517 E.01858
G1 X116.483 Y120.344 E1.08028
G3 X116.671 Y119.975 I3.385 J1.494 E.01847
G1 X134.026 Y137.33 E1.09175
G1 X134.385 Y137.13 E.01826
G1 X116.869 Y119.614 E1.10187
G3 X117.08 Y119.267 I3.006 J1.584 E.01809
G1 X134.735 Y136.922 E1.11063
G1 X135.077 Y136.705 E.018
G1 X117.295 Y118.924 E1.11858
G3 X117.523 Y118.594 I3.265 J2.01 E.01786
G1 X135.407 Y136.477 E1.12498
G1 X135.732 Y136.244 E.0178
G1 X117.756 Y118.268 E1.1308
G1 X118.003 Y117.957 E.01768
G1 X136.043 Y135.997 E1.13482
G2 X136.35 Y135.746 I-2.077 J-2.864 E.01766
G1 X118.255 Y117.651 E1.13831
G1 X118.518 Y117.355 E.01759
G1 X136.644 Y135.482 E1.14028
G2 X136.933 Y135.212 I-2.252 J-2.708 E.01758
G1 X118.788 Y117.068 E1.14144
G1 X119.067 Y116.788 E.01756
G1 X137.212 Y134.932 E1.14144
G2 X137.482 Y134.645 I-2.425 J-2.553 E.01758
G1 X119.356 Y116.518 E1.14028
G1 X119.65 Y116.254 E.01758
G1 X137.745 Y134.349 E1.13831
G2 X137.996 Y134.042 I-2.808 J-2.547 E.01766
G1 X119.957 Y116.003 E1.13474
G3 X120.268 Y115.756 I2.36 J2.641 E.01768
G1 X138.243 Y133.731 E1.13079
G2 X138.477 Y133.406 I-2.595 J-2.109 E.0178
G1 X120.593 Y115.523 E1.12499
G3 X120.923 Y115.295 I2.199 J2.822 E.01786
G1 X138.707 Y133.078 E1.1187
G1 X138.921 Y132.734 E.01802
G1 X121.265 Y115.078 E1.11068
G3 X121.615 Y114.87 I2.03 J3.011 E.01812
G1 X139.131 Y132.386 E1.10187
G1 X139.329 Y132.025 E.01829
G1 X121.974 Y114.67 E1.09176
G3 X122.345 Y114.483 I1.852 J3.21 E.0185
G1 X139.517 Y131.656 E1.08028
G1 X139.698 Y131.278 E.01862
G1 X122.72 Y114.301 E1.06799
G1 X123.114 Y114.136 E.01898
G1 X139.864 Y130.886 E1.05366
G2 X140.024 Y130.488 I-3.465 J-1.624 E.0191
G1 X123.514 Y113.977 E1.0386
G1 X123.926 Y113.832 E.01946
G1 X140.167 Y130.073 E1.02169
G2 X140.301 Y129.649 I-3.711 J-1.405 E.0198
G1 X124.352 Y113.699 E1.00334
G3 X124.785 Y113.575 I1.326 J3.8 E.02008
G1 X140.425 Y129.214 E.98384
G2 X140.53 Y128.761 I-3.984 J-1.16 E.02071
G1 X125.239 Y113.47 E.96192
G3 X125.704 Y113.376 I1.063 J4.094 E.02111
G1 X140.624 Y128.297 E.93862
G1 X140.704 Y127.819 E.02158
G1 X126.18 Y113.295 E.91365
G1 X126.681 Y113.237 E.0224
G1 X140.763 Y127.319 E.88586
G2 X140.804 Y126.802 I-4.91 J-.653 E.02308
G1 X127.197 Y113.195 E.85598
G3 X127.731 Y113.171 I.466 J4.449 E.02381
G1 X140.831 Y126.271 E.82407
G1 X140.83 Y125.711 E.02491
G1 X128.29 Y113.171 E.78882
G3 X128.875 Y113.198 I.038 J5.594 E.02606
G1 X140.801 Y125.124 E.75023
G2 X140.743 Y124.508 I-5.513 J.205 E.02753
G1 X129.491 Y113.256 E.70782
G3 X130.143 Y113.35 I-.508 J5.85 E.02931
G1 X140.65 Y123.857 E.66095
G2 X140.51 Y123.159 I-6.73 J.986 E.03169
G1 X130.839 Y113.488 E.60836
G3 X131.592 Y113.683 I-1.358 J6.801 E.03462
G1 X140.317 Y122.407 E.54883
G2 X140.045 Y121.577 I-7.528 J2.008 E.0389
G1 X132.421 Y113.953 E.47956
G3 X133.375 Y114.348 I-5.389 J14.349 E.04592
G1 X139.654 Y120.628 E.39503
G2 X139.042 Y119.458 I-10.725 J4.864 E.05877
G1 X134.547 Y114.962 E.2828
G1 X135.14 Y115.336 E.03119
G3 X138.583 Y118.44 I-12.513 J17.337 E.2066
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X137.169 Y117.026 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 66/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z18.52 I-1.197 J-.219 P1  F30000
G1 X133.356 Y137.889 Z18.52
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G1 X132.687 Y138.165 E.03218
G3 X121.34 Y114.789 I-4.696 J-12.162 E1.72507
G3 X128.657 Y112.982 I6.644 J11.181 E.34013
G3 X133.408 Y137.861 I-.665 J13.02 E1.54382
G1 X133.5 Y138.235 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.822 Y138.515 E.03014
G3 X121.148 Y114.467 I-4.831 J-12.512 E1.63814
G3 X128.677 Y112.607 I6.835 J11.503 E.32303
G3 X133.553 Y138.207 I-.685 J13.395 E1.46646
M204 S10000
; WIPE_START
G1 F24000
G1 X132.822 Y138.515 E-.30156
G1 X132.114 Y138.769 E-.28592
G1 X131.678 Y138.896 E-.17253
; WIPE_END
G1 E-.04 F1800
G1 X135.486 Y136.477 Z18.8 F30000
G1 Z18.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X138.587 Y133.026 I-13.436 J-15.192 E.20682
G1 X138.923 Y132.487 E.02826
G1 X134.482 Y136.928 E.27936
G3 X133.323 Y137.535 I-5.981 J-10.019 E.05824
G1 X139.532 Y131.326 E.39059
G2 X139.924 Y130.381 I-13.819 J-6.29 E.04552
G1 X132.383 Y137.922 E.4744
G3 X131.56 Y138.192 I-2.814 J-7.188 E.03853
G1 X140.192 Y129.56 E.54303
G2 X140.385 Y128.814 I-6.544 J-2.093 E.03429
G1 X130.814 Y138.386 E.60213
G3 X130.124 Y138.522 I-1.561 J-6.069 E.03128
G1 X140.522 Y128.124 E.65409
M73 P81 R4
G2 X140.615 Y127.479 I-5.703 J-1.15 E.02903
G1 X129.479 Y138.615 E.70052
G3 X128.869 Y138.672 I-.814 J-5.401 E.02726
G1 X140.673 Y126.868 E.74252
G2 X140.702 Y126.286 I-5.168 J-.551 E.02593
G1 X128.288 Y138.7 E.78091
G1 X127.734 Y138.702 E.02466
G1 X140.7 Y125.735 E.81568
G2 X140.676 Y125.207 I-4.719 J-.051 E.02356
G1 X127.206 Y138.677 E.84736
G3 X126.696 Y138.634 I.124 J-4.563 E.02278
G1 X140.635 Y124.696 E.87684
G1 X140.577 Y124.2 E.02218
G1 X126.201 Y138.576 E.90437
G1 X125.727 Y138.497 E.02136
G1 X140.497 Y123.728 E.92909
G2 X140.404 Y123.268 I-4.146 J.591 E.0209
G1 X125.268 Y138.404 E.95217
G3 X124.819 Y138.3 I.699 J-4.05 E.02051
G1 X140.301 Y122.819 E.97388
G2 X140.177 Y122.39 I-3.885 J.883 E.01988
G1 X124.389 Y138.178 E.99318
G3 X123.969 Y138.045 I.97 J-3.807 E.01961
G1 X140.046 Y121.968 E1.01135
G1 X139.902 Y121.56 E.01927
G1 X123.559 Y137.903 E1.0281
G3 X123.164 Y137.744 I1.213 J-3.588 E.01891
G1 X139.745 Y121.164 E1.04302
G1 X139.582 Y120.774 E.01879
G1 X122.776 Y137.58 E1.05721
G1 X122.402 Y137.402 E.01844
G1 X139.401 Y120.402 E1.06937
G2 X139.216 Y120.035 I-3.363 J1.466 E.01831
G1 X122.036 Y137.215 E1.08074
G1 X121.679 Y137.019 E.01811
G1 X139.018 Y119.68 E1.09076
G2 X138.812 Y119.333 I-3.187 J1.664 E.01794
G1 X121.334 Y136.811 E1.09948
G1 X120.994 Y136.599 E.01784
G1 X138.598 Y118.995 E1.10742
G2 X138.371 Y118.668 I-3.02 J1.85 E.01768
G1 X120.668 Y136.371 E1.11364
G3 X120.347 Y136.141 I1.894 J-2.982 E.01763
G1 X138.141 Y118.346 E1.11941
G2 X137.896 Y118.038 I-2.859 J2.028 E.0175
G1 X120.038 Y135.896 E1.12338
G3 X119.735 Y135.647 I2.07 J-2.824 E.01748
G1 X137.648 Y117.734 E1.12684
G1 X137.386 Y117.443 E.01741
G1 X119.442 Y135.387 E1.12879
G3 X119.158 Y135.119 I2.243 J-2.669 E.0174
G1 X137.12 Y117.157 E1.12994
G1 X136.842 Y116.881 E.01738
G1 X118.88 Y134.843 E1.12994
G3 X118.614 Y134.557 I2.415 J-2.516 E.0174
G1 X136.558 Y116.613 E1.12879
G1 X136.265 Y116.353 E.01741
G1 X118.352 Y134.266 E1.12684
G3 X118.104 Y133.962 I2.587 J-2.361 E.01748
G1 X135.962 Y116.104 E1.12338
G1 X135.653 Y115.859 E.0175
G1 X117.859 Y133.654 E1.11941
G1 X117.629 Y133.332 E.01762
G1 X135.332 Y115.629 E1.11364
G2 X135.006 Y115.401 I-2.189 J2.781 E.01766
G1 X117.402 Y133.005 E1.10742
G1 X117.188 Y132.667 E.01782
G1 X134.666 Y115.189 E1.09948
G2 X134.321 Y114.981 I-2.022 J2.968 E.01792
G1 X116.982 Y132.32 E1.09075
G1 X116.784 Y131.965 E.01808
G1 X133.964 Y114.785 E1.08074
G2 X133.598 Y114.598 I-1.845 J3.165 E.01829
G1 X116.599 Y131.598 E1.06937
G1 X116.418 Y131.226 E.0184
G1 X133.224 Y114.42 E1.05721
G2 X132.836 Y114.256 I-1.656 J3.377 E.01877
G1 X116.255 Y130.836 E1.04302
G3 X116.098 Y130.44 I3.444 J-1.596 E.01894
G1 X132.441 Y114.097 E1.0281
G1 X132.031 Y113.955 E.01932
G1 X115.954 Y130.032 E1.01135
G3 X115.823 Y129.61 I3.686 J-1.379 E.01965
G1 X131.611 Y113.822 E.99318
G1 X131.181 Y113.7 E.0199
G1 X115.699 Y129.181 E.97387
G1 X115.596 Y128.732 E.02049
G1 X130.732 Y113.596 E.95217
G2 X130.272 Y113.503 I-1.062 J4.042 E.02086
G1 X115.503 Y128.272 E.92908
G3 X115.423 Y127.8 I4.157 J-.955 E.02131
G1 X129.799 Y113.424 E.90437
G2 X129.304 Y113.366 I-.762 J4.378 E.02218
G1 X115.365 Y127.304 E.87684
G3 X115.324 Y126.793 I4.532 J-.625 E.02283
G1 X128.794 Y113.323 E.84736
G1 X128.639 Y113.315 E.00689
G2 X128.266 Y113.298 I-.337 J3.311 E.01661
G1 X115.3 Y126.264 E.81568
G1 X115.298 Y125.713 E.02451
G1 X127.712 Y113.3 E.78091
G2 X127.131 Y113.328 I-.038 J5.187 E.02589
G1 X115.327 Y125.132 E.74252
G3 X115.385 Y124.521 I5.464 J.209 E.02729
G1 X126.521 Y113.385 E.70051
G2 X125.876 Y113.478 I.5 J5.789 E.029
G1 X115.478 Y123.876 E.65409
G3 X115.615 Y123.186 I6.207 J.873 E.03128
G1 X125.186 Y113.614 E.60212
G2 X124.44 Y113.808 I1.351 J6.743 E.03432
G1 X115.808 Y122.44 E.54302
G3 X116.076 Y121.619 I7.443 J1.978 E.03844
G1 X123.617 Y114.078 E.4744
G2 X122.677 Y114.466 I5.402 J14.441 E.04524
G1 X116.468 Y120.674 E.39058
G3 X117.077 Y119.513 I13.693 J6.437 E.05835
G1 X121.518 Y115.072 E.27934
G2 X117.522 Y118.515 I10.416 J16.128 E.23536
; CHANGE_LAYER
; Z_HEIGHT: 18.68
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X118.953 Y117.118 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 67/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z18.8 I-.999 J.694 P1  F30000
G1 X133.303 Y137.771 Z18.8
G1 Z18.68
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G1 X132.64 Y138.043 E.03185
G3 X124.736 Y113.509 I-4.648 J-12.043 E1.869
G3 X128.932 Y113.126 I3.25 J12.433 E.18827
G3 X133.354 Y137.742 I-.941 J12.874 E1.51605
G1 X133.447 Y138.117 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.889 Y138.347 E.02477
G3 X124.641 Y113.146 I-4.898 J-12.347 E1.7804
G3 X128.952 Y112.752 I3.344 J12.791 E.17854
G3 X133.499 Y138.088 I-.961 J13.249 E1.44077
M204 S10000
; WIPE_START
G1 F24000
G1 X132.889 Y138.347 E-.25169
G1 X132.074 Y138.646 E-.33
G1 X131.623 Y138.777 E-.17831
; WIPE_END
G1 E-.04 F1800
G1 X124.499 Y136.04 Z19.08 F30000
G1 X117.619 Y133.397 Z19.08
G1 Z18.68
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X121.605 Y136.828 I15.034 J-13.437 E.23463
G1 X117.171 Y132.394 E.27894
G3 X116.566 Y131.233 I10.034 J-5.971 E.05827
G1 X122.764 Y137.431 E.38991
G2 X123.705 Y137.817 I6.074 J-13.483 E.04526
G1 X116.191 Y130.303 E.4727
G3 X115.918 Y129.474 I6.362 J-2.556 E.03883
G1 X124.526 Y138.082 E.54153
G2 X125.271 Y138.272 I2.063 J-6.542 E.03423
G1 X115.727 Y128.728 E.60039
G3 X115.594 Y128.039 I6.064 J-1.528 E.03121
G1 X125.96 Y138.405 E.65208
G2 X126.605 Y138.494 I1.114 J-5.693 E.02896
G1 X115.506 Y127.395 E.69819
G3 X115.453 Y126.787 I5.392 J-.776 E.02719
G1 X127.214 Y138.548 E.73985
G2 X127.794 Y138.572 I.51 J-5.154 E.02585
G1 X115.429 Y126.207 E.77786
G3 X115.429 Y125.652 I4.946 J-.276 E.02472
G1 X128.348 Y138.571 E.81269
G2 X128.875 Y138.542 I.007 J-4.707 E.02348
G1 X115.457 Y125.124 E.84407
G3 X115.505 Y124.616 I4.546 J.17 E.02271
G1 X129.384 Y138.495 E.8731
G2 X129.878 Y138.434 I-.304 J-4.427 E.02215
G1 X115.568 Y124.124 E.9002
G1 X115.647 Y123.647 E.02147
G1 X130.351 Y138.352 E.925
G2 X130.809 Y138.254 I-.642 J-4.125 E.02083
G1 X115.746 Y123.191 E.94757
G3 X115.855 Y122.745 I4.028 J.752 E.02044
G1 X131.256 Y138.146 E.96883
G1 X131.687 Y138.02 E.01993
G1 X115.979 Y122.313 E.98811
G1 X116.119 Y121.898 E.0195
G1 X132.103 Y137.881 E1.00549
G1 X132.511 Y137.734 E.0193
G1 X116.263 Y121.486 E1.02211
G1 X116.425 Y121.092 E.01894
G1 X132.908 Y137.574 E1.03687
G2 X133.294 Y137.405 I-1.316 J-3.522 E.01877
G1 X116.596 Y120.707 E1.05041
G1 X116.775 Y120.331 E.01853
G1 X133.668 Y137.223 E1.06264
G2 X134.031 Y137.031 I-1.53 J-3.33 E.01829
G1 X116.969 Y119.969 E1.07331
G3 X117.167 Y119.612 I3.28 J1.588 E.01818
G1 X134.388 Y136.832 E1.08328
G2 X134.73 Y136.619 I-1.731 J-3.151 E.01794
G1 X117.381 Y119.27 E1.09136
G3 X117.6 Y118.934 I3.105 J1.782 E.01787
G1 X135.068 Y136.401 E1.09884
G1 X135.392 Y136.17 E.01772
G1 X117.83 Y118.608 E1.10477
G3 X118.069 Y118.291 I2.94 J1.968 E.01766
G1 X135.71 Y135.932 E1.10976
G1 X136.018 Y135.685 E.01758
G1 X118.314 Y117.981 E1.1137
G3 X118.572 Y117.683 I2.778 J2.149 E.01753
G1 X136.317 Y135.428 E1.11627
G1 X136.609 Y135.165 E.0175
G1 X118.834 Y117.388 E1.11824
G1 X119.11 Y117.11 E.01743
G1 X136.89 Y134.89 E1.11844
M73 P82 R4
G1 X137.166 Y134.611 E.01747
G1 X119.39 Y116.835 E1.11823
G1 X119.683 Y116.572 E.0175
G1 X137.426 Y134.315 E1.11614
G1 X137.685 Y134.018 E.01751
G1 X119.982 Y116.315 E1.11364
G1 X120.29 Y116.068 E.01758
G1 X137.931 Y133.709 E1.10976
G2 X138.17 Y133.392 I-2.701 J-2.285 E.01766
G1 X120.608 Y115.83 E1.10477
G1 X120.932 Y115.599 E.01772
G1 X138.4 Y133.067 E1.09884
G2 X138.619 Y132.73 I-2.887 J-2.118 E.01787
G1 X121.27 Y115.381 E1.09136
G3 X121.612 Y115.168 I2.073 J2.937 E.01794
G1 X138.832 Y132.388 E1.08328
G2 X139.031 Y132.031 I-3.081 J-1.945 E.01818
G1 X121.969 Y114.969 E1.07331
G3 X122.332 Y114.777 I1.894 J3.138 E.01829
G1 X139.225 Y131.669 E1.06264
G1 X139.404 Y131.293 E.01853
G1 X122.706 Y114.595 E1.05041
G3 X123.092 Y114.426 I1.702 J3.352 E.01877
G1 X139.575 Y130.908 E1.03687
G1 X139.737 Y130.514 E.01894
G1 X123.485 Y114.262 E1.02237
G1 X123.895 Y114.117 E.01937
G1 X139.883 Y130.105 E1.00574
G2 X140.021 Y129.688 I-3.644 J-1.443 E.01956
G1 X124.313 Y113.98 E.98815
G1 X124.744 Y113.854 E.01993
G1 X140.145 Y129.255 E.96883
G2 X140.254 Y128.809 I-3.917 J-1.197 E.02044
G1 X125.191 Y113.746 E.94757
G3 X125.649 Y113.648 I1.099 J4.027 E.02083
G1 X140.353 Y128.353 E.92501
G1 X140.432 Y127.876 E.02147
G1 X126.122 Y113.566 E.90021
G3 X126.616 Y113.505 I.797 J4.365 E.02215
G1 X140.495 Y127.384 E.87311
G2 X140.542 Y126.875 I-3.969 J-.619 E.02275
G1 X127.125 Y113.458 E.844
G3 X127.652 Y113.429 I.52 J4.678 E.02348
G1 X140.566 Y126.343 E.81238
G2 X140.571 Y125.793 I-5.662 J-.328 E.02449
G1 X128.206 Y113.428 E.77787
G3 X128.786 Y113.452 I.07 J5.179 E.02585
G1 X140.547 Y125.213 E.73985
G2 X140.494 Y124.605 I-5.445 J.168 E.02719
G1 X129.398 Y113.509 E.69802
G3 X130.04 Y113.595 I-.354 J5.076 E.02882
G1 X140.406 Y123.961 E.65209
G2 X140.273 Y123.272 I-6.196 J.839 E.03121
G1 X130.728 Y113.728 E.6004
G3 X131.474 Y113.918 I-1.317 J6.732 E.03423
G1 X140.082 Y122.526 E.54154
G2 X139.809 Y121.698 I-6.635 J1.727 E.03883
G1 X132.295 Y114.183 E.47272
G3 X133.236 Y114.569 I-5.133 J13.869 E.04525
G1 X139.435 Y120.767 E.38993
G2 X138.829 Y119.606 I-10.64 J4.81 E.05827
G1 X134.395 Y115.172 E.27897
G3 X138.382 Y118.603 I-10.958 J16.764 E.23467
; CHANGE_LAYER
; Z_HEIGHT: 18.96
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X136.949 Y117.208 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 68/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z19.08 I-1.197 J-.217 P1  F30000
G1 X133.246 Y137.643 Z19.08
G1 Z18.96
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G1 X132.59 Y137.912 E.03155
G3 X124.084 Y113.845 I-4.599 J-11.911 E1.81692
G3 X128.455 Y113.241 I3.938 J12.38 E.19722
G3 X133.297 Y137.614 I-.464 J12.76 E1.52027
G1 X133.391 Y137.989 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.725 Y138.262 E.02956
G3 X123.274 Y113.733 I-4.733 J-12.262 E1.69603
G3 X128.475 Y112.866 I4.71 J12.221 E.21798
G3 X133.443 Y137.96 I-.483 J13.134 E1.44477
M204 S10000
; WIPE_START
G1 F24000
G1 X132.725 Y138.262 E-.29607
G1 X132.031 Y138.512 E-.28016
G1 X131.567 Y138.648 E-.18377
; WIPE_END
G1 E-.04 F1800
G1 X135.302 Y136.278 Z19.36 F30000
G1 Z18.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X138.362 Y132.877 I-13.806 J-15.503 E.20392
G1 X138.724 Y132.297 E.03043
G1 X134.3 Y136.721 E.27831
G3 X133.138 Y137.325 I-5.956 J-10.042 E.05827
G1 X139.321 Y131.142 E.38894
G2 X139.7 Y130.205 I-13.558 J-6.027 E.04496
G1 X132.206 Y137.699 E.4714
G3 X131.384 Y137.963 I-2.76 J-7.185 E.03842
G1 X139.962 Y129.385 E.53961
G2 X140.148 Y128.64 I-6.534 J-2.031 E.03415
G1 X130.639 Y138.15 E.59819
G3 X129.952 Y138.279 I-1.494 J-6.054 E.03112
G1 X140.278 Y127.953 E.64956
G2 X140.363 Y127.31 I-5.683 J-1.077 E.02886
G1 X129.31 Y138.363 E.69532
G3 X128.703 Y138.412 I-.737 J-5.378 E.02709
G1 X140.412 Y126.703 E.7366
G2 X140.432 Y126.124 I-5.138 J-.469 E.02575
G1 X128.125 Y138.431 E.7742
G3 X127.572 Y138.427 I-.233 J-4.927 E.02462
G1 X140.428 Y125.57 E.80874
G1 X140.397 Y125.044 E.02348
G1 X127.042 Y138.398 E.84012
G3 X126.537 Y138.346 I.216 J-4.527 E.02262
G1 X140.345 Y124.537 E.86868
G2 X140.278 Y124.046 I-4.405 J.351 E.02206
G1 X126.047 Y138.278 E.89528
G3 X125.57 Y138.196 I.49 J-4.28 E.02151
G1 X140.196 Y123.57 E.92006
G2 X140.093 Y123.115 I-4.099 J.692 E.02076
G1 X125.115 Y138.093 E.94222
G3 X124.672 Y137.978 I.804 J-4.002 E.02037
G1 X139.979 Y122.671 E.96292
G1 X139.853 Y122.239 E.02002
G1 X124.238 Y137.854 E.98226
G1 X123.824 Y137.71 E.01951
G1 X139.71 Y121.824 E.99932
G2 X139.559 Y121.417 I-3.7 J1.141 E.01932
G1 X123.418 Y137.558 E1.01534
G1 X123.023 Y137.395 E.01902
M73 P82 R3
G1 X139.394 Y121.024 E1.02988
G2 X139.218 Y120.642 I-3.489 J1.377 E.01872
G1 X122.642 Y137.218 E1.04276
G3 X122.267 Y137.035 I1.444 J-3.428 E.01857
G1 X139.036 Y120.266 E1.05486
G2 X138.836 Y119.907 I-3.297 J1.596 E.01827
G1 X121.907 Y136.837 E1.065
G3 X121.554 Y136.631 I1.654 J-3.242 E.01816
G1 X138.632 Y119.553 E1.07433
G1 X138.416 Y119.211 E.01799
G1 X121.21 Y136.417 E1.08235
G3 X120.879 Y136.19 I1.852 J-3.065 E.01787
G1 X138.191 Y118.879 E1.08903
G1 X137.958 Y118.553 E.0178
G1 X120.552 Y135.96 E1.09499
G1 X120.24 Y135.713 E.01767
G1 X137.713 Y118.24 E1.09914
G2 X137.464 Y117.932 I-2.872 J2.064 E.01766
G1 X119.933 Y135.462 E1.1028
G1 X119.637 Y135.2 E.01758
G1 X137.199 Y117.638 E1.10477
G2 X136.931 Y117.348 I-2.711 J2.248 E.01757
G1 X119.349 Y134.93 E1.10599
G1 X119.069 Y134.652 E.01755
G1 X136.651 Y117.07 E1.10599
G2 X136.363 Y116.8 I-2.548 J2.429 E.01757
G1 X118.801 Y134.362 E1.10477
G1 X118.536 Y134.068 E.01758
G1 X136.067 Y116.538 E1.1028
G2 X135.76 Y116.287 I-2.386 J2.613 E.01765
G1 X118.287 Y133.76 E1.09914
G3 X118.042 Y133.447 I2.661 J-2.342 E.01769
G1 X135.448 Y116.04 E1.09499
G1 X135.121 Y115.81 E.01781
G1 X117.809 Y133.121 E1.08903
G3 X117.584 Y132.789 I2.851 J-2.172 E.01789
G1 X134.786 Y115.587 E1.0821
G1 X134.445 Y115.37 E.01798
G1 X117.368 Y132.447 E1.07425
G3 X117.163 Y132.093 I3.048 J-1.995 E.01818
G1 X134.093 Y115.163 E1.065
G1 X133.733 Y114.965 E.01828
G1 X116.964 Y131.734 E1.05486
G1 X116.782 Y131.358 E.01858
G1 X133.358 Y114.782 E1.04275
G2 X132.977 Y114.605 I-1.769 J3.3 E.01869
G1 X116.606 Y130.976 E1.02988
G1 X116.441 Y130.583 E.01898
G1 X132.582 Y114.442 E1.01534
G2 X132.176 Y114.29 I-1.559 J3.538 E.01929
G1 X116.29 Y130.176 E.99931
G3 X116.147 Y129.761 I3.62 J-1.483 E.01953
G1 X131.761 Y114.146 E.98226
G2 X131.328 Y114.022 I-1.328 J3.798 E.02007
G1 X116.021 Y129.329 E.96292
G3 X115.909 Y128.882 I3.368 J-1.081 E.02048
G1 X130.885 Y113.907 E.94209
G1 X130.43 Y113.804 E.02077
G1 X115.808 Y128.426 E.91981
G3 X115.722 Y127.954 I4.958 J-1.151 E.02134
G1 X129.953 Y113.722 E.89528
G2 X129.463 Y113.654 I-.852 J4.328 E.02201
G1 X115.655 Y127.463 E.86867
G3 X115.603 Y126.956 I4.485 J-.712 E.02266
G1 X128.958 Y113.602 E.84011
G2 X128.427 Y113.574 I-.555 J5.616 E.02365
G1 X115.572 Y126.43 E.80869
G3 X115.568 Y125.876 I4.931 J-.313 E.02466
G1 X127.872 Y113.571 E.77404
G2 X127.297 Y113.588 I-.157 J4.421 E.02561
G1 X115.592 Y125.293 E.73635
G3 X115.637 Y124.69 I6.42 J.18 E.02693
G1 X126.69 Y113.637 E.69531
G2 X126.048 Y113.721 I.431 J5.763 E.02884
G1 X115.722 Y124.047 E.64955
G3 X115.852 Y123.359 I6.184 J.807 E.03113
G1 X125.361 Y113.85 E.59818
G2 X124.616 Y114.037 I1.292 J6.727 E.03418
G1 X116.038 Y122.615 E.5396
G3 X116.3 Y121.795 I7.434 J1.925 E.03833
G1 X123.794 Y114.301 E.47139
G2 X122.862 Y114.675 I5.996 J16.292 E.04468
G1 X116.679 Y120.858 E.38892
G3 X117.276 Y119.703 I15.737 J7.401 E.05784
G1 X121.7 Y115.279 E.27829
G2 X119.461 Y116.96 I6.664 J11.208 E.12479
G1 X117.722 Y118.698 E.10934
; CHANGE_LAYER
; Z_HEIGHT: 19.24
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X119.137 Y117.284 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 69/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z19.36 I-.999 J.694 P1  F30000
G1 X133.187 Y137.506 Z19.36
G1 Z19.24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G1 X132.536 Y137.774 E.0313
G3 X122.172 Y114.804 I-4.545 J-11.772 E1.70127
G3 X128.729 Y113.404 I5.824 J11.221 E.30187
G3 X133.238 Y137.478 I-.738 J12.598 E1.4899
G1 X133.332 Y137.852 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
M73 P83 R3
G1 X132.671 Y138.124 E.02932
G3 X121.999 Y114.472 I-4.68 J-12.122 E1.61704
G3 X128.749 Y113.03 I5.997 J11.554 E.28685
G3 X133.384 Y137.824 I-.758 J12.972 E1.41665
M204 S10000
; WIPE_START
G1 F24000
G1 X132.671 Y138.124 E-.29386
G1 X131.985 Y138.371 E-.277
G1 X131.508 Y138.51 E-.18914
; WIPE_END
G1 E-.04 F1800
G1 X124.58 Y135.305 Z19.64 F30000
G1 X116.958 Y131.779 Z19.64
G1 Z19.24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X121.77 Y136.591 E.30268
G2 X122.913 Y137.183 I8.219 J-14.473 E.0573
G1 X116.814 Y131.083 E.38372
G3 X116.443 Y130.161 I15.387 J-6.722 E.04422
G1 X123.84 Y137.558 E.46536
G2 X124.651 Y137.818 I2.717 J-7.091 E.0379
G1 X116.182 Y129.348 E.53281
G3 X115.997 Y128.612 I6.465 J-2.016 E.0338
G1 X125.387 Y138.002 E.59075
G2 X126.067 Y138.13 I1.48 J-5.986 E.03077
G1 X115.869 Y127.932 E.64155
G3 X115.785 Y127.297 I5.614 J-1.063 E.02851
G1 X126.703 Y138.214 E.68679
G2 X127.303 Y138.263 I.736 J-5.321 E.02681
G1 X115.737 Y126.697 E.72761
G3 X115.717 Y126.126 I5.074 J-.458 E.02542
G1 X127.875 Y138.284 E.76479
G2 X128.422 Y138.28 I.239 J-4.877 E.02437
G1 X115.722 Y125.579 E.79894
G1 X115.75 Y125.056 E.02333
G1 X128.943 Y138.249 E.82994
G2 X129.444 Y138.198 I-.202 J-4.484 E.0224
G1 X115.802 Y124.556 E.85818
G3 X115.869 Y124.072 I4.345 J.357 E.02176
G1 X129.929 Y138.132 E.88448
G1 X130.399 Y138.05 E.02122
G1 X115.95 Y123.601 E.90898
G1 X116.051 Y123.151 E.02053
G1 X130.849 Y137.949 E.93088
G2 X131.288 Y137.836 I-.782 J-3.965 E.02017
G1 X116.165 Y122.713 E.95135
G3 X116.288 Y122.285 I3.876 J.883 E.01983
G1 X131.715 Y137.712 E.97046
G2 X132.125 Y137.57 I-1.055 J-3.719 E.0193
G1 X116.43 Y121.875 E.98732
G3 X116.58 Y121.474 I3.646 J1.139 E.01906
G1 X132.527 Y137.421 E1.00316
G1 X132.916 Y137.258 E.01875
G1 X116.741 Y121.083 E1.01753
G3 X116.916 Y120.707 I3.437 J1.372 E.01847
G1 X133.293 Y137.084 E1.03026
G1 X133.665 Y136.904 E.01836
G1 X117.097 Y120.336 E1.04222
G1 X117.292 Y119.98 E.01807
G1 X134.019 Y136.707 E1.05225
G2 X134.369 Y136.505 I-1.621 J-3.214 E.01797
G1 X117.495 Y119.632 E1.06147
G1 X117.707 Y119.292 E.01781
G1 X134.707 Y136.292 E1.06939
G2 X135.036 Y136.069 I-1.817 J-3.04 E.01768
G1 X117.931 Y118.965 E1.076
G1 X118.159 Y118.641 E.0176
G1 X135.358 Y135.839 E1.08189
G2 X135.667 Y135.597 I-2.005 J-2.872 E.01748
G1 X118.403 Y118.333 E1.08599
G3 X118.651 Y118.03 I2.829 J2.053 E.01745
G1 X135.972 Y135.351 E1.08961
G1 X136.262 Y135.089 E.01737
G1 X118.91 Y117.737 E1.09156
G3 X119.177 Y117.453 I2.667 J2.233 E.01736
G1 X136.548 Y134.824 E1.09276
G1 X136.823 Y134.547 E.01735
G1 X119.452 Y117.176 E1.09276
G3 X119.738 Y116.911 I2.507 J2.413 E.01737
G1 X137.09 Y134.263 E1.09156
G1 X137.349 Y133.971 E.01738
G1 X120.028 Y116.65 E1.08961
G3 X120.333 Y116.403 I2.346 J2.594 E.01745
G1 X137.597 Y133.667 E1.08599
G1 X137.841 Y133.359 E.01746
G1 X120.642 Y116.161 E1.08189
G1 X120.964 Y115.931 E.01759
G1 X138.064 Y133.031 E1.0757
G1 X138.287 Y132.703 E.01766
G1 X121.293 Y115.708 E1.06906
G1 X121.631 Y115.495 E.01778
G1 X138.505 Y132.368 E1.06147
G2 X138.708 Y132.02 I-3.001 J-1.982 E.01795
G1 X121.981 Y115.293 E1.05225
G3 X122.335 Y115.096 I1.928 J3.056 E.01805
G1 X138.903 Y131.664 E1.04223
G2 X139.084 Y131.293 I-3.208 J-1.797 E.01835
G1 X122.706 Y114.916 E1.03026
G3 X123.084 Y114.742 I1.737 J3.274 E.0185
G1 X139.259 Y130.917 E1.01754
G1 X139.42 Y130.526 E.0188
G1 X123.473 Y114.579 E1.00317
G3 X123.875 Y114.43 I1.53 J3.509 E.0191
G1 X139.57 Y130.125 E.98732
G1 X139.712 Y129.715 E.01928
G1 X124.285 Y114.288 E.97046
G1 X124.712 Y114.164 E.01979
G1 X139.835 Y129.287 E.95135
G2 X139.949 Y128.849 I-3.841 J-1.231 E.02013
G1 X125.151 Y114.052 E.93089
G3 X125.61 Y113.959 I1.396 J5.729 E.02083
G1 X140.05 Y128.399 E.90839
G2 X140.131 Y127.928 I-4.152 J-.955 E.02126
G1 X126.074 Y113.871 E.88432
G3 X126.556 Y113.802 I.715 J3.289 E.02171
G1 X140.198 Y127.444 E.85819
G2 X140.25 Y126.945 I-4.422 J-.712 E.02236
G1 X127.057 Y113.751 E.82995
G1 X127.578 Y113.72 E.0232
G1 X140.278 Y126.421 E.79895
G2 X140.283 Y125.874 I-4.866 J-.315 E.02434
G1 X128.125 Y113.716 E.7648
G3 X128.697 Y113.737 I.106 J5.099 E.02546
G1 X140.263 Y125.303 E.72762
G2 X140.215 Y124.703 I-5.366 J.13 E.02678
G1 X129.304 Y113.793 E.68635
G3 X129.933 Y113.87 I-.215 J4.364 E.02818
G1 X140.131 Y124.068 E.64156
G2 X140.003 Y123.389 I-6.113 J.799 E.03077
G1 X130.612 Y113.998 E.59077
G3 X131.348 Y114.182 I-1.274 J6.644 E.03377
G1 X139.818 Y122.652 E.53283
G2 X139.557 Y121.839 I-7.367 J1.919 E.03799
G1 X132.159 Y114.442 E.46538
G3 X133.086 Y114.817 I-4.999 J13.674 E.0445
G1 X139.187 Y120.917 E.38374
G2 X138.589 Y119.768 I-10.531 J4.747 E.05764
G1 X134.23 Y115.409 E.27421
G1 X134.549 Y115.608 E.01672
G3 X138.156 Y118.783 I-10.506 J15.57 E.21434
; CHANGE_LAYER
; Z_HEIGHT: 19.52
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X136.722 Y117.389 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 70/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z19.64 I-1.198 J-.215 P1  F30000
G1 X133.129 Y137.369 Z19.64
G1 Z19.52
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G1 X132.483 Y137.634 E.03109
G3 X127.611 Y113.533 I-4.488 J-11.636 E1.92993
G3 X128.988 Y113.567 I.388 J12.271 E.06128
G3 X133.177 Y137.342 I-.993 J12.432 E1.46081
G1 X133.274 Y137.715 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.617 Y137.984 E.02913
G3 X127.6 Y113.158 I-4.623 J-11.986 E1.83501
G3 X129.018 Y113.193 I.4 J12.644 E.05828
G3 X133.325 Y137.686 I-1.023 J12.805 E1.3893
M204 S10000
; WIPE_START
G1 F24000
G1 X132.617 Y137.984 E-.29186
G1 X131.94 Y138.229 E-.27382
G1 X131.449 Y138.372 E-.19432
; WIPE_END
G1 E-.04 F1800
G1 X135.117 Y136.044 Z19.92 F30000
G1 Z19.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X138.126 Y132.694 I-12.877 J-14.594 E.20075
G2 X138.478 Y132.13 I-4.851 J-3.416 E.02962
G1 X134.134 Y136.473 E.27324
G3 X132.986 Y137.068 I-8.593 J-15.186 E.05753
G1 X139.064 Y130.989 E.38237
G2 X139.433 Y130.067 I-13.757 J-6.032 E.04417
G1 X132.068 Y137.432 E.46331
G3 X131.256 Y137.69 I-2.702 J-7.096 E.0379
G1 X139.689 Y129.257 E.53048
G2 X139.87 Y128.523 I-6.449 J-1.978 E.03366
G1 X130.521 Y137.872 E.5881
G3 X129.844 Y137.996 I-1.444 J-5.972 E.03066
G1 X139.994 Y127.845 E.63854
G2 X140.074 Y127.212 I-5.6 J-1.029 E.02842
G1 X129.211 Y138.075 E.68341
G3 X128.613 Y138.119 I-.698 J-5.456 E.02665
G1 X140.119 Y126.613 E.72378
G2 X140.135 Y126.044 I-5.06 J-.424 E.02534
G1 X128.044 Y138.134 E.76056
G3 X127.5 Y138.125 I-.189 J-4.85 E.02422
G1 X140.126 Y125.499 E.79426
G1 X140.095 Y124.977 E.02329
G1 X126.977 Y138.095 E.82524
G1 X126.478 Y138.04 E.02233
G1 X140.039 Y124.479 E.85312
G2 X139.968 Y123.996 I-4.33 J.394 E.0217
G1 X125.997 Y137.968 E.87891
G3 X125.529 Y137.882 I.533 J-4.206 E.02116
G1 X139.883 Y123.528 E.90297
G1 X139.779 Y123.078 E.02052
G1 X125.077 Y137.78 E.92485
G3 X124.643 Y137.661 I.845 J-3.926 E.02004
G1 X139.661 Y122.643 E.94474
G2 X139.533 Y122.217 I-3.854 J.925 E.01978
G1 X124.218 Y137.532 E.96341
G1 X123.807 Y137.389 E.01936
G1 X139.388 Y121.808 E.98018
G2 X139.233 Y121.41 I-3.623 J1.183 E.01903
G1 X123.41 Y137.233 E.99538
G3 X123.02 Y137.069 I1.264 J-3.553 E.01882
G1 X139.07 Y121.019 E1.00964
G2 X138.889 Y120.647 I-3.316 J1.379 E.01844
G1 X122.646 Y136.89 E1.02183
M73 P84 R3
G3 X122.28 Y136.702 I1.488 J-3.351 E.0183
G1 X138.703 Y120.279 E1.03315
G1 X138.505 Y119.923 E.0181
G1 X121.922 Y136.506 E1.04318
G3 X121.579 Y136.296 I1.698 J-3.164 E.01792
G1 X138.296 Y119.579 E1.05166
G1 X138.082 Y119.24 E.01785
G1 X121.241 Y136.08 E1.05941
G1 X120.916 Y135.852 E.01768
G1 X137.852 Y118.916 E1.0654
G2 X137.618 Y118.597 I-2.959 J1.928 E.01762
G1 X120.598 Y135.617 E1.07067
G1 X120.289 Y135.372 E.01753
G1 X137.371 Y118.29 E1.07459
G2 X137.117 Y117.991 I-2.79 J2.116 E.01748
G1 X119.991 Y135.116 E1.07732
G1 X119.698 Y134.856 E.01744
G1 X136.855 Y117.699 E1.07928
G2 X136.58 Y117.42 I-2.625 J2.301 E.01742
G1 X119.42 Y134.58 E1.07953
G3 X119.145 Y134.301 I2.351 J-2.58 E.01742
G1 X136.302 Y117.144 E1.07928
G1 X136.009 Y116.884 E.01744
G1 X118.883 Y134.009 E1.07732
G3 X118.629 Y133.71 I2.536 J-2.415 E.01748
G1 X135.711 Y116.628 E1.07459
G1 X135.402 Y116.383 E.01753
G1 X118.382 Y133.403 E1.07067
G3 X118.148 Y133.084 I2.724 J-2.247 E.01762
G1 X135.084 Y116.148 E1.0654
G1 X134.759 Y115.92 E.01768
G1 X117.918 Y132.76 E1.05941
G1 X117.704 Y132.421 E.01785
G1 X134.421 Y115.704 E1.05166
G2 X134.078 Y115.494 I-2.042 J2.954 E.01792
G1 X117.495 Y132.077 E1.04318
G1 X117.297 Y131.721 E.0181
G1 X133.72 Y115.298 E1.03315
G2 X133.354 Y115.11 I-1.854 J3.164 E.0183
G1 X117.11 Y131.354 E1.02186
G3 X116.93 Y130.981 I3.234 J-1.793 E.01845
G1 X132.98 Y114.931 E1.00964
G2 X132.59 Y114.767 I-1.653 J3.388 E.01882
G1 X116.767 Y130.59 E.99538
G3 X116.612 Y130.192 I3.468 J-1.582 E.01903
G1 X132.193 Y114.611 E.98018
G1 X131.782 Y114.468 E.01936
G1 X116.467 Y129.783 E.96341
G3 X116.339 Y129.357 I3.726 J-1.351 E.01978
G1 X131.357 Y114.339 E.94474
G2 X130.923 Y114.22 I-1.279 J3.806 E.02004
G1 X116.221 Y128.922 E.92485
G1 X116.117 Y128.472 E.02052
G1 X130.471 Y114.118 E.90297
G2 X130.003 Y114.032 I-1 J4.119 E.02116
G1 X116.032 Y128.004 E.87891
G3 X115.961 Y127.521 I4.259 J-.876 E.0217
G1 X129.522 Y113.96 E.8531
G1 X129.022 Y113.906 E.02236
G1 X115.906 Y127.022 E.82511
G1 X115.874 Y126.501 E.02325
G1 X128.5 Y113.875 E.79424
G2 X127.956 Y113.866 I-.356 J4.84 E.02422
G1 X115.865 Y125.956 E.76056
G3 X115.881 Y125.387 I5.077 J-.145 E.02534
G1 X127.387 Y113.881 E.72381
G2 X126.789 Y113.925 I.093 J5.343 E.02667
G1 X115.926 Y124.788 E.6834
G3 X116.006 Y124.155 I5.681 J.396 E.02842
G1 X126.156 Y114.005 E.63852
G2 X125.478 Y114.128 I.797 J6.276 E.03065
G1 X116.13 Y123.477 E.58809
G3 X116.311 Y122.743 I6.629 J1.243 E.03366
G1 X124.743 Y114.31 E.53048
G2 X123.932 Y114.568 I1.89 J7.353 E.0379
G1 X116.567 Y121.933 E.4633
G3 X116.936 Y121.011 I14.127 J5.111 E.04418
G1 X123.014 Y114.932 E.38237
G2 X121.866 Y115.527 I7.447 J15.786 E.05754
G1 X117.522 Y119.87 E.27322
G3 X119.462 Y117.377 I12.545 J7.758 E.14076
G1 X120.883 Y115.956 E.08943
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X119.469 Y117.37 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 71/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z19.92 I-1.004 J.688 P1  F30000
G1 X133.059 Y137.212 Z19.92
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X122.939 Y114.784 I-5.068 J-11.21 E1.72008
G3 X128.547 Y113.711 I5.069 J11.308 E.25626
G3 X133.114 Y137.187 I-.556 J12.29 E1.45949
G1 X133.21 Y137.561 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.559 Y137.832 E.02896
G3 X128.566 Y113.337 I-4.56 J-11.83 E1.8502
G3 X138.655 Y119.134 I-.568 J12.667 E.49635
G1 X138.655 Y119.134 E0
G3 X133.264 Y137.535 I-10.657 J6.868 E.89274
M204 S10000
; WIPE_START
G1 F24000
G1 X132.559 Y137.832 E-.2908
G1 X131.888 Y138.07 E-.27029
G1 X131.386 Y138.216 E-.19891
; WIPE_END
G1 E-.04 F1800
G1 X123.934 Y136.567 Z20.2 F30000
G1 X120.994 Y135.917 Z20.2
G1 Z19.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G3 X117.66 Y132.028 I11.854 J-13.536 E.22862
G1 X121.976 Y136.345 E.27153
G2 X123.115 Y136.928 I5.767 J-9.846 E.05695
G1 X117.072 Y130.886 E.38014
G3 X116.711 Y129.969 I7.976 J-3.674 E.04383
G1 X124.031 Y137.289 E.46048
G2 X124.838 Y137.542 I2.654 J-7.064 E.03766
G1 X116.456 Y129.16 E.52729
G3 X116.291 Y128.44 I5.014 J-1.533 E.03292
G1 X125.57 Y137.719 E.58376
G2 X126.245 Y137.839 I1.407 J-5.95 E.03051
G1 X116.159 Y127.753 E.63452
G3 X116.083 Y127.123 I5.574 J-.987 E.02825
G1 X126.876 Y137.915 E.67894
G2 X127.471 Y137.956 I.657 J-5.279 E.02655
G1 X116.043 Y126.528 E.71888
G3 X116.033 Y125.963 I5.028 J-.376 E.02516
G1 X128.037 Y137.967 E.75515
G2 X128.579 Y137.954 I.153 J-4.828 E.02411
G1 X116.047 Y125.422 E.78834
G3 X116.082 Y124.902 I4.647 J.05 E.02319
G1 X129.1 Y137.919 E.8189
G1 X129.597 Y137.862 E.02227
G1 X116.137 Y124.402 E.84674
G3 X116.214 Y123.924 I4.291 J.451 E.02153
G1 X130.075 Y137.786 E.87197
G2 X130.534 Y137.689 I-.929 J-5.55 E.02084
G1 X116.305 Y123.461 E.89507
G3 X116.409 Y123.009 I4.068 J.697 E.0206
G1 X130.99 Y137.59 E.91724
G2 X131.422 Y137.467 I-.654 J-3.115 E.01999
G1 X116.532 Y122.578 E.93667
G3 X116.667 Y122.157 I3.808 J.988 E.01964
G1 X131.843 Y137.334 E.95471
G1 X132.253 Y137.189 E.01934
G1 X116.81 Y121.746 E.97146
G1 X116.972 Y121.353 E.01891
G1 X132.647 Y137.028 E.98607
G2 X133.033 Y136.859 I-1.309 J-3.522 E.01875
G1 X117.142 Y120.968 E.99967
G1 X117.321 Y120.592 E.01851
G1 X133.407 Y136.678 E1.01188
G2 X133.768 Y136.485 I-1.536 J-3.319 E.01825
G1 X117.515 Y120.232 E1.02245
G3 X117.715 Y119.877 I3.26 J1.605 E.01813
G1 X134.124 Y136.286 E1.03225
G1 X134.464 Y136.071 E.01789
G1 X117.929 Y119.535 E1.04021
G3 X118.151 Y119.202 I3.074 J1.81 E.01781
G1 X134.798 Y135.85 E1.04726
G1 X135.122 Y135.619 E.01769
G1 X118.38 Y118.877 E1.05319
G3 X118.623 Y118.565 I2.898 J2.008 E.0176
G1 X135.435 Y135.377 E1.05759
G1 X135.743 Y135.13 E.01756
G1 X118.871 Y118.258 E1.06137
G1 X119.132 Y117.964 E.01748
G1 X136.035 Y134.868 E1.06336
G2 X136.324 Y134.601 I-2.231 J-2.698 E.01747
G1 X119.4 Y117.677 E1.06462
G1 X119.676 Y117.399 E.01745
G1 X136.6 Y134.323 E1.06462
G2 X136.868 Y134.036 I-2.42 J-2.53 E.01747
G1 X119.964 Y117.132 E1.06336
G3 X120.257 Y116.87 I2.483 J2.476 E.01749
G1 X137.129 Y133.742 E1.06137
G2 X137.377 Y133.435 I-2.609 J-2.359 E.01756
G1 X120.565 Y116.623 E1.05759
G3 X120.878 Y116.381 I2.309 J2.666 E.0176
G1 X137.62 Y133.123 E1.05319
G2 X137.849 Y132.797 I-3.805 J-2.913 E.01772
G1 X121.202 Y116.15 E1.04722
G3 X121.536 Y115.929 I2.133 J2.863 E.01782
G1 X138.066 Y132.46 E1.03989
G1 X138.284 Y132.122 E.01786
G1 X121.876 Y115.714 E1.03218
G3 X122.231 Y115.515 I1.948 J3.067 E.01815
G1 X138.485 Y131.768 E1.02245
G2 X138.679 Y131.408 I-3.114 J-1.908 E.01823
G1 X122.593 Y115.322 E1.01189
G1 X122.967 Y115.141 E.01847
G1 X138.858 Y131.032 E.99967
G2 X139.028 Y130.647 I-3.343 J-1.705 E.01873
G1 X123.353 Y114.972 E.98607
G3 X123.747 Y114.811 I1.633 J3.425 E.01893
G1 X139.19 Y130.254 E.97147
G2 X139.333 Y129.843 I-3.59 J-1.485 E.01938
G1 X124.157 Y114.666 E.95472
G3 X124.578 Y114.533 I1.399 J3.684 E.01967
G1 X139.468 Y129.422 E.93668
G1 X139.591 Y128.991 E.01998
G1 X125.009 Y114.409 E.91728
G1 X125.46 Y114.305 E.02057
G1 X139.695 Y128.539 E.89546
G2 X139.786 Y128.076 I-4.081 J-1.044 E.02103
G1 X125.925 Y114.214 E.87198
G3 X126.403 Y114.138 I.919 J4.222 E.02157
G1 X139.863 Y127.598 E.84674
G1 X139.918 Y127.098 E.02238
G1 X126.9 Y114.081 E.81891
G3 X127.421 Y114.046 I.564 J4.62 E.02323
G1 X139.953 Y126.578 E.78834
G2 X139.967 Y126.037 I-4.808 J-.395 E.02408
G1 X127.968 Y114.038 E.75483
G1 X128.529 Y114.045 E.02497
G1 X139.957 Y125.472 E.71887
G2 X139.917 Y124.878 I-5.315 J.056 E.02652
G1 X129.124 Y114.085 E.67895
G3 X129.755 Y114.161 I-.36 J5.654 E.02827
G1 X139.841 Y124.247 E.63453
G2 X139.721 Y123.572 I-6.069 J.732 E.03051
G1 X130.43 Y114.281 E.58451
G3 X131.166 Y114.463 I-.919 J5.303 E.03379
G1 X139.544 Y122.84 E.52699
G2 X139.289 Y122.031 I-7.332 J1.86 E.03775
G1 X131.969 Y114.71 E.46049
G3 X132.885 Y115.071 I-5.459 J15.192 E.04379
G1 X138.928 Y121.115 E.38016
G2 X138.34 Y119.972 I-14.041 J6.5 E.05717
G1 X134.024 Y115.655 E.27155
G3 X137.894 Y118.971 I-10.539 J16.22 E.22737
; CHANGE_LAYER
; Z_HEIGHT: 20.08
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X136.461 Y117.576 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 72/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z20.2 I-1.198 J-.214 P1  F30000
G1 X132.989 Y137.057 Z20.2
G1 Z20.08
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
M73 P85 R3
G3 X124.279 Y114.449 I-4.998 J-11.056 E1.75696
G3 X128.82 Y113.895 I3.733 J11.72 E.2047
G3 X133.044 Y137.032 I-.829 J12.105 E1.42688
G1 X133.144 Y137.399 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G3 X123.502 Y114.325 I-5.152 J-11.398 E1.64301
G3 X128.84 Y113.521 I4.483 J11.632 E.22343
G3 X133.198 Y137.374 I-.848 J12.48 E1.35818
M204 S10000
; WIPE_START
G1 F24000
G1 X132.498 Y137.675 E-.28942
G1 X131.836 Y137.908 E-.26668
G1 X131.321 Y138.059 E-.2039
; WIPE_END
G1 E-.04 F1800
G1 X136.183 Y134.388 Z20.48 F30000
G1 Z20.08
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.485167
G1 F10586.292
G1 X135.961 Y134.597 E.01478
G1 X136.402 Y134.28 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X138.212 Y131.913 I-10.157 J-9.647 E.1328
G1 X133.917 Y136.208 E.27018
G3 X132.781 Y136.788 I-9.597 J-17.398 E.05674
G1 X138.792 Y130.778 E.37808
G2 X139.145 Y129.868 I-7.927 J-3.607 E.04346
G1 X131.868 Y137.146 E.45783
G3 X131.061 Y137.396 I-2.634 J-7.057 E.03759
G1 X139.394 Y129.063 E.52422
G2 X139.445 Y128.879 I-1.614 J-.541 E.00849
G1 X139.097 Y128.804 E.01581
G1 X130.332 Y137.569 E.55141
G3 X129.661 Y137.684 I-1.357 J-5.917 E.03029
G1 X139.079 Y128.267 E.59242
G1 X139.21 Y127.632 E.02884
G1 X139.634 Y127.711 E.0192
G2 X139.691 Y127.613 I-.04 J-.089 E.00537
G1 X139.755 Y127.034 E.02592
G1 X129.032 Y137.757 E.67453
G3 X128.441 Y137.792 I-.609 J-5.235 E.02636
G1 X139.791 Y126.442 E.71399
G2 X139.797 Y125.88 I-5.007 J-.34 E.02504
G1 X127.879 Y137.798 E.74975
G3 X127.345 Y137.776 I-.025 J-5.901 E.02379
G1 X139.503 Y125.618 E.76483
G1 X139.313 Y125.631 E.00847
G1 X139.286 Y125.279 E.0157
G1 X126.825 Y137.739 E.78386
G3 X126.327 Y137.682 I.267 J-4.463 E.02232
G1 X139.683 Y124.326 E.84015
G2 X139.601 Y123.851 I-4.267 J.488 E.02143
G1 X125.851 Y137.602 E.86501
G3 X125.391 Y137.506 I.63 J-4.139 E.0209
G1 X139.506 Y123.391 E.88791
G2 X139.397 Y122.943 I-4.044 J.739 E.02051
G1 X124.944 Y137.396 E.90922
G1 X124.511 Y137.273 E.02002
G1 X139.272 Y122.512 E.92856
G2 X139.133 Y122.095 I-3.781 J1.031 E.01956
G1 X124.095 Y137.133 E.94595
G3 X123.689 Y136.983 I1.129 J-3.695 E.01928
G1 X138.984 Y121.688 E.96218
G1 X138.82 Y121.296 E.01891
G1 X123.295 Y136.821 E.97668
G3 X122.915 Y136.645 I1.377 J-3.471 E.01864
G1 X138.643 Y120.917 E.98944
G1 X138.458 Y120.546 E.01844
G1 X122.542 Y136.462 E1.00125
G1 X122.183 Y136.265 E.01822
G1 X138.264 Y120.183 E1.01164
G2 X138.128 Y119.943 I-2.207 J1.09 E.01229
G1 X137.709 Y120.183 E.02151
G1 X121.834 Y136.058 E.99865
G1 X121.491 Y135.845 E.01795
G1 X137.488 Y119.848 E1.00632
G1 X137.268 Y119.512 E.01786
G1 X121.164 Y135.615 E1.01302
G3 X120.843 Y135.381 I1.927 J-2.98 E.01771
G1 X137.382 Y118.841 E1.04045
G1 X137.134 Y118.533 E.0176
G1 X120.532 Y135.135 E1.04439
G3 X120.232 Y134.88 I2.125 J-2.804 E.01756
G1 X136.88 Y118.231 E1.04729
G1 X136.617 Y117.938 E.01752
G1 X119.937 Y134.618 E1.04926
G3 X119.657 Y134.342 I2.32 J-2.631 E.0175
G1 X136.342 Y117.657 E1.04957
G2 X136.062 Y117.381 I-2.6 J2.355 E.0175
G1 X119.382 Y134.061 E1.04925
G1 X119.119 Y133.768 E.01752
G1 X135.767 Y117.12 E1.04729
G2 X135.467 Y116.864 I-2.425 J2.548 E.01756
G1 X118.865 Y133.466 E1.04438
G1 X118.617 Y133.158 E.0176
G1 X135.156 Y116.618 E1.04043
G2 X134.833 Y116.386 I-1.895 J2.301 E.01774
G1 X118.384 Y132.835 E1.03474
G3 X118.156 Y132.507 I2.809 J-2.193 E.01778
G1 X134.503 Y116.159 E1.02835
G2 X134.165 Y115.941 I-2.576 J3.618 E.0179
G1 X117.941 Y132.166 E1.02065
G3 X117.735 Y131.815 I3.018 J-2.006 E.01808
G1 X133.816 Y115.734 E1.01161
G1 X133.457 Y115.537 E.01822
G1 X117.541 Y131.453 E1.00122
G1 X117.356 Y131.082 E.01844
G1 X133.084 Y115.354 E.9894
G2 X132.704 Y115.178 I-1.757 J3.297 E.01864
G1 X117.179 Y130.703 E.97663
G1 X117.015 Y130.311 E.01891
G1 X132.31 Y115.016 E.96214
G2 X131.903 Y114.867 I-1.534 J3.545 E.01928
G1 X116.867 Y129.903 E.9459
G3 X116.728 Y129.486 I3.643 J-1.447 E.01956
G1 X131.487 Y114.726 E.9285
G1 X131.055 Y114.603 E.02002
G1 X116.602 Y129.056 E.90916
G3 X116.494 Y128.608 I3.935 J-1.186 E.02051
G1 X130.608 Y114.494 E.88784
G2 X130.148 Y114.398 I-1.089 J4.043 E.0209
G1 X116.399 Y128.147 E.86493
G3 X116.317 Y127.672 I4.181 J-.961 E.02144
G1 X129.671 Y114.318 E.84007
G2 X129.169 Y114.265 I-.65 J3.724 E.0225
G1 X116.26 Y127.174 E.81208
G3 X116.221 Y126.657 I4.585 J-.605 E.02308
G1 X128.657 Y114.221 E.78232
G2 X128.119 Y114.202 I-.435 J4.775 E.02393
G1 X116.203 Y126.119 E.74964
G3 X116.215 Y125.55 I6.279 J-.146 E.02531
G1 X127.557 Y114.208 E.71349
G2 X126.966 Y114.243 I.02 J5.293 E.02637
G1 X116.245 Y124.964 E.67439
G3 X116.317 Y124.336 I5.624 J.324 E.02812
G1 X126.337 Y114.316 E.63032
G2 X125.666 Y114.431 I.686 J6.027 E.03029
G1 X116.433 Y123.664 E.58081
G3 X116.606 Y122.935 I6.581 J1.178 E.03336
G1 X124.936 Y114.604 E.52403
G2 X124.13 Y114.855 I1.829 J7.308 E.0376
G1 X116.855 Y122.129 E.4576
G3 X117.21 Y121.219 I8.284 J2.7 E.04347
G1 X123.216 Y115.213 E.37782
G2 X122.079 Y115.794 I8.545 J18.129 E.0568
G1 X117.79 Y120.083 E.2698
G3 X121.106 Y116.211 I15.536 J9.949 E.2275
G1 X137.842 Y119.641 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.488145
G1 F10512.643
G1 X137.674 Y119.387 E.01488
G1 X139.69 Y125.195 F30000
; LINE_WIDTH: 0.488147
G1 F10512.594
G1 X139.665 Y124.892 E.01487
G1 X139.528 Y128.106 F30000
; LINE_WIDTH: 0.485167
G1 F10586.292
G1 X139.467 Y128.404 E.01477
; CHANGE_LAYER
; Z_HEIGHT: 20.36
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X139.528 Y128.106 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 73/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z20.48 I-.972 J-.732 P1  F30000
G1 X132.916 Y136.895 Z20.48
G1 Z20.36
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G3 X125.63 Y114.279 I-4.925 J-10.895 E1.79096
G3 X128.386 Y114.05 I2.406 J12.275 E.12327
G3 X132.97 Y136.87 I-.396 J11.95 E1.42475
G1 X133.074 Y137.241 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X133.07 Y137.236 E.00029
G3 X124.882 Y114.067 I-5.078 J-11.236 E1.67641
G3 X128.406 Y113.676 I3.102 J11.863 E.1461
G3 X133.692 Y136.934 I-.415 J12.324 E1.33024
G1 X133.128 Y137.214 E.02585
M204 S10000
; WIPE_START
G1 F24000
G1 X133.07 Y137.236 E-.02364
G1 X132.434 Y137.509 E-.26283
G1 X131.782 Y137.739 E-.26289
G1 X131.25 Y137.894 E-.21064
; WIPE_END
G1 E-.04 F1800
G1 X136.16 Y132.051 Z20.76 F30000
G1 X139.31 Y128.302 Z20.76
G1 Z20.36
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.499776
G1 F10234.544
G2 X138.269 Y131.272 I-11.311 J-2.295 E3.47919
G2 X139.296 Y128.36 I-10.592 J-5.373 E.1553
G1 X137.27 Y119.537 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X133.624 Y116.397 I-12.716 J11.079 E.21473
G1 X133.522 Y116.341 E.00519
G1 X137.656 Y120.475 E.26009
G3 X138.21 Y121.581 I-10.194 J5.795 E.05502
G1 X132.417 Y115.788 E.36441
G2 X131.525 Y115.448 I-3.471 J7.771 E.04247
G1 X138.553 Y122.476 E.44212
G3 X138.784 Y123.259 I-14.844 J4.8 E.0363
G1 X130.739 Y115.214 E.50611
G2 X130.034 Y115.061 I-1.71 J6.196 E.03208
G1 X138.937 Y123.965 E.56008
G3 X139.039 Y124.618 I-5.765 J1.227 E.02942
G1 X129.382 Y114.961 E.60749
G2 X128.77 Y114.901 I-.857 J5.596 E.02736
G1 X139.097 Y125.229 E.64968
G3 X139.124 Y125.807 I-4.98 J.518 E.02577
G1 X128.192 Y114.875 E.6877
G2 X127.642 Y114.877 I-.254 J4.896 E.02446
G1 X139.121 Y126.356 E.72211
G1 X139.093 Y126.881 E.02335
G1 X127.121 Y114.908 E.75314
G2 X126.622 Y114.961 I.22 J4.472 E.02235
G1 X139.04 Y127.379 E.78119
G3 X138.968 Y127.859 I-4.31 J-.4 E.02161
G1 X126.141 Y115.033 E.80689
G2 X125.676 Y115.12 I.567 J4.32 E.02106
G1 X138.88 Y128.323 E.8306
G3 X138.777 Y128.773 I-4.051 J-.689 E.02051
G1 X125.228 Y115.223 E.85234
G2 X124.798 Y115.346 I.878 J3.884 E.01987
G1 X138.655 Y129.202 E.87165
G3 X138.519 Y129.619 I-3.777 J-.997 E.0195
G1 X124.381 Y115.48 E.8894
M73 P86 R3
G2 X123.974 Y115.626 I1.091 J3.694 E.01922
G1 X138.373 Y130.025 E.90579
G1 X138.212 Y130.416 E.01882
G1 X123.585 Y115.789 E.92017
G2 X123.206 Y115.962 I1.307 J3.354 E.01853
G1 X138.038 Y130.794 E.93304
G3 X137.856 Y131.163 I-3.38 J-1.441 E.01834
G1 X122.835 Y116.143 E.94488
G1 X122.481 Y116.341 E.01805
G1 X137.66 Y131.52 E.95488
G3 X137.453 Y131.865 I-3.173 J-1.673 E.0179
G1 X122.135 Y116.547 E.9636
G1 X121.797 Y116.761 E.0178
G1 X137.238 Y132.201 E.97132
G1 X137.01 Y132.526 E.01763
G1 X121.475 Y116.99 E.97728
G2 X121.159 Y117.227 I1.945 J2.929 E.01755
G1 X136.773 Y132.841 E.98223
G1 X136.529 Y133.149 E.01748
G1 X120.852 Y117.472 E.98614
G2 X120.559 Y117.731 I2.154 J2.744 E.01741
G1 X136.269 Y133.441 E.9883
G3 X136.004 Y133.728 I-2.682 J-2.222 E.01738
G1 X120.271 Y117.996 E.98966
G1 X119.996 Y118.272 E.01736
G1 X135.728 Y134.005 E.98966
G3 X135.441 Y134.269 I-2.5 J-2.426 E.01739
G1 X119.731 Y118.559 E.9883
G2 X119.471 Y118.851 I2.472 J2.453 E.0174
G1 X135.147 Y134.528 E.98614
G1 X134.841 Y134.773 E.01747
G1 X119.227 Y119.159 E.98223
G2 X118.99 Y119.474 I2.684 J2.271 E.01754
G1 X134.525 Y135.01 E.9773
G3 X134.203 Y135.239 I-2.206 J-2.757 E.01762
G1 X118.762 Y119.798 E.97137
G2 X118.547 Y120.135 I2.898 J2.079 E.0178
G1 X133.865 Y135.453 E.96359
G3 X133.519 Y135.659 I-2.009 J-2.975 E.01792
G1 X118.34 Y120.48 E.95488
G1 X118.144 Y120.837 E.01809
G1 X133.164 Y135.857 E.94488
G3 X132.794 Y136.038 I-1.852 J-3.317 E.01837
G1 X117.962 Y121.207 E.93301
G2 X117.788 Y121.584 I3.384 J1.793 E.01851
G1 X132.415 Y136.212 E.92017
G1 X132.026 Y136.374 E.01877
G1 X117.627 Y121.975 E.90578
G2 X117.481 Y122.381 I3.54 J1.505 E.0192
G1 X131.619 Y136.52 E.8894
G3 X131.201 Y136.654 I-1.406 J-3.65 E.01952
G1 X117.345 Y122.798 E.87165
G1 X117.223 Y123.228 E.01987
G1 X130.772 Y136.777 E.85234
G1 X130.324 Y136.88 E.02047
G1 X117.12 Y123.677 E.8306
G2 X117.032 Y124.141 I4.086 J1.017 E.02101
G1 X129.859 Y136.968 E.80691
G3 X129.378 Y137.039 I-.874 J-4.247 E.02164
G1 X116.96 Y124.621 E.78118
G2 X116.907 Y125.12 I4.413 J.725 E.02232
G1 X128.878 Y137.091 E.75308
G1 X128.358 Y137.123 E.02319
G1 X116.879 Y125.644 E.7221
G2 X116.876 Y126.193 I4.891 J.299 E.02445
G1 X127.808 Y137.125 E.68769
G3 X127.23 Y137.099 I-.059 J-5.159 E.02574
G1 X116.903 Y126.772 E.64967
G2 X116.961 Y127.382 I5.645 J-.235 E.02731
G1 X126.619 Y137.04 E.6075
G3 X125.966 Y136.939 I.571 J-5.863 E.0294
G1 X117.063 Y128.036 E.56007
G2 X117.216 Y128.741 I6.359 J-1.014 E.03213
G1 X125.261 Y136.786 E.5061
G3 X124.475 Y136.552 I4.818 J-17.594 E.03651
G1 X117.447 Y129.524 E.4421
G2 X117.79 Y130.419 I8.146 J-2.61 E.04268
G1 X123.583 Y136.212 E.36439
G3 X122.478 Y135.659 I5.397 J-12.165 E.05498
G1 X118.344 Y131.525 E.26006
G2 X121.534 Y135.267 I14.355 J-9.007 E.2195
; CHANGE_LAYER
; Z_HEIGHT: 20.64
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X120.136 Y133.837 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 74/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z20.76 I-.269 J1.187 P1  F30000
G1 X132.837 Y136.721 Z20.76
G1 Z20.64
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X122.567 Y115.562 I-4.846 J-10.72 E1.61533
G3 X128.659 Y114.256 I5.418 J10.405 E.28052
G3 X132.892 Y136.696 I-.667 J11.745 E1.38941
G1 X132.999 Y137.065 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.992 Y137.064 E.00028
G3 X122.393 Y115.23 I-5.001 J-11.062 E1.53868
G3 X128.679 Y113.881 I5.59 J10.737 E.26715
G3 X133.604 Y136.766 I-.687 J12.12 E1.2981
G1 X133.053 Y137.039 E.02527
M204 S10000
; WIPE_START
G1 F24000
G1 X132.992 Y137.064 E-.02487
G1 X132.366 Y137.33 E-.25876
G1 X131.723 Y137.557 E-.25883
G1 X131.174 Y137.717 E-.21754
; WIPE_END
G1 E-.04 F1800
G1 X134.31 Y135.117 Z21.04 F30000
G1 Z20.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X137.095 Y132.036 I-12.276 J-13.894 E.18515
G2 X137.503 Y131.363 I-5.787 J-3.972 E.03503
G1 X133.365 Y135.501 E.26033
G3 X132.26 Y136.046 I-5.413 J-9.6 E.05482
G1 X138.047 Y130.259 E.36403
G2 X138.383 Y129.361 I-7.822 J-3.444 E.04265
G1 X131.359 Y136.386 E.44188
G3 X130.585 Y136.598 I-4.073 J-13.303 E.0357
G1 X138.604 Y128.58 E.50443
G2 X138.75 Y127.873 I-6.223 J-1.654 E.03213
G1 X129.873 Y136.749 E.5584
G3 X129.218 Y136.843 I-1.163 J-5.784 E.02944
G1 X138.843 Y127.218 E.60547
G2 X138.894 Y126.606 I-5.427 J-.764 E.02735
G1 X128.606 Y136.894 E.64722
G3 X128.028 Y136.911 I-.438 J-5.136 E.02572
G1 X138.911 Y126.028 E.68463
G2 X138.899 Y125.479 I-4.896 J-.169 E.02444
G1 X127.483 Y136.895 E.71816
G1 X126.958 Y136.859 E.02341
G1 X138.863 Y124.954 E.7489
G1 X138.805 Y124.452 E.02251
G1 X126.453 Y136.804 E.77704
G1 X125.972 Y136.724 E.02168
G1 X138.719 Y123.976 E.80191
G1 X138.62 Y123.515 E.021
G1 X125.51 Y136.624 E.82466
G3 X125.064 Y136.509 I.799 J-4.03 E.0205
G1 X138.509 Y123.064 E.84579
G2 X138.382 Y122.631 I-3.921 J.92 E.0201
G1 X124.632 Y136.381 E.86497
G1 X124.215 Y136.236 E.01961
G1 X138.235 Y122.216 E.88196
G2 X138.076 Y121.814 I-3.66 J1.214 E.01924
G1 X123.814 Y136.076 E.8972
G3 X123.423 Y135.906 I1.322 J-3.563 E.01897
G1 X137.907 Y121.423 E.91111
G1 X137.723 Y121.045 E.01867
G1 X123.044 Y135.725 E.92346
G3 X122.68 Y135.527 I1.578 J-3.334 E.01841
G1 X137.527 Y120.681 E.93394
G2 X137.321 Y120.325 I-3.268 J1.652 E.01827
G1 X122.326 Y135.321 E.94332
G1 X121.98 Y135.105 E.01811
G1 X137.104 Y119.982 E.95137
G2 X136.874 Y119.651 I-3.059 J1.884 E.01794
G1 X121.651 Y134.874 E.95764
G3 X121.328 Y134.635 I1.966 J-2.988 E.01785
G1 X136.636 Y119.328 E.96293
G1 X136.386 Y119.017 E.01775
G1 X121.015 Y134.387 E.96691
G3 X120.717 Y134.125 I2.186 J-2.791 E.01769
G1 X136.125 Y118.717 E.96926
G2 X135.856 Y118.424 I-2.739 J2.245 E.01767
G1 X120.425 Y133.855 E.97071
G1 X120.144 Y133.576 E.01765
G1 X135.575 Y118.145 E.97071
G2 X135.283 Y117.875 I-2.545 J2.461 E.01767
G1 X119.875 Y133.283 E.96926
G3 X119.614 Y132.983 I2.538 J-2.477 E.0177
G1 X134.984 Y117.613 E.96691
G1 X134.671 Y117.365 E.01776
G1 X119.364 Y132.672 E.96293
G3 X119.126 Y132.349 I2.757 J-2.28 E.01786
G1 X134.349 Y117.126 E.95764
G2 X134.013 Y116.902 I-2.916 J4.009 E.018
G1 X118.896 Y132.018 E.95095
G1 X118.679 Y131.675 E.01809
G1 X133.672 Y116.682 E.94317
G2 X133.32 Y116.473 I-1.635 J2.359 E.01823
G1 X118.473 Y131.319 E.93394
G3 X118.277 Y130.955 I3.145 J-1.934 E.01842
G1 X132.956 Y116.275 E.92346
G1 X132.577 Y116.094 E.01871
G1 X118.093 Y130.577 E.91111
G3 X117.924 Y130.186 I3.4 J-1.705 E.01899
G1 X132.186 Y115.924 E.8972
G2 X131.785 Y115.764 I-1.624 J3.494 E.01922
G1 X117.765 Y129.784 E.88196
G1 X117.618 Y129.369 E.01956
G1 X131.363 Y115.624 E.86467
G1 X130.932 Y115.494 E.02003
G1 X117.491 Y128.936 E.84558
G3 X117.38 Y128.485 I3.096 J-.996 E.02066
G1 X130.489 Y115.376 E.82466
G2 X130.028 Y115.276 I-1.119 J4.056 E.021
G1 X117.281 Y128.024 E.8019
G3 X117.195 Y127.548 I14.063 J-2.778 E.02149
G1 X129.547 Y115.196 E.77704
G2 X129.045 Y115.138 I-.77 J4.448 E.02253
G1 X117.137 Y127.046 E.74908
G3 X117.101 Y126.521 I4.652 J-.587 E.0234
G1 X128.521 Y115.101 E.7184
G2 X127.967 Y115.094 I-.366 J6.77 E.02464
G1 X117.089 Y125.972 E.68431
G3 X117.111 Y125.388 I4.092 J-.133 E.02601
G1 X127.394 Y115.106 E.64686
G2 X126.782 Y115.157 I.151 J5.478 E.02735
G1 X117.157 Y124.782 E.60546
G3 X117.25 Y124.127 I5.874 J.505 E.02942
G1 X126.127 Y115.251 E.55839
G2 X125.419 Y115.398 I.955 J6.376 E.03218
G1 X117.396 Y123.42 E.50467
G3 X117.617 Y122.639 I14.316 J3.619 E.03613
G1 X124.641 Y115.614 E.44187
G2 X123.74 Y115.955 I2.578 J8.194 E.04286
G1 X117.953 Y121.741 E.36402
G3 X118.497 Y120.637 I10.503 J4.482 E.05479
G1 X122.625 Y116.508 E.25971
G2 X120.524 Y118.049 I5.291 J9.422 E.11621
G1 X118.886 Y119.687 E.10302
G1 X139.29 Y125.019 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.522258
G1 F9736.692
G2 X131.472 Y136.797 I-11.293 J.988 E2.95082
G2 X139.294 Y125.078 I-3.467 J-10.784 E.80171
; CHANGE_LAYER
; Z_HEIGHT: 20.92
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X139.336 Y125.653 E-.21894
G1 X139.337 Y126.289 E-.24174
G1 X139.303 Y126.924 E-.24176
G1 X139.287 Y127.075 E-.05756
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 75/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z21.04 I-1.002 J-.691 P1  F30000
G1 X132.758 Y136.547 Z21.04
G1 Z20.92
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G3 X127.639 Y114.43 I-4.764 J-10.548 E1.82001
G3 X128.915 Y114.461 I.36 J11.376 E.05681
G3 X132.813 Y136.522 I-.921 J11.538 E1.35538
G1 X132.923 Y136.89 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.913 Y136.889 E.00042
G3 X127.628 Y114.055 I-4.918 J-10.89 E1.73442
G3 X128.945 Y114.087 I.372 J11.748 E.05415
G3 X133.535 Y136.585 I-.951 J11.911 E1.26572
M73 P86 R2
G1 X132.977 Y136.863 E.02561
M204 S10000
; WIPE_START
G1 F24000
G1 X132.913 Y136.889 E-.02617
G1 X132.297 Y137.152 E-.25462
G1 X131.665 Y137.375 E-.25474
G1 X131.098 Y137.54 E-.22447
; WIPE_END
G1 E-.04 F1800
G1 X124.126 Y134.434 Z21.32 F30000
G1 X119.048 Y132.172 Z21.32
M73 P87 R2
G1 Z20.92
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X120.688 Y133.812 E.10314
G2 X122.764 Y135.328 I7.46 J-8.036 E.11462
G1 X118.673 Y131.237 E.25733
G3 X118.138 Y130.142 I9.35 J-5.248 E.05427
G1 X123.859 Y135.863 E.3599
G2 X124.751 Y136.194 I3.4 J-7.775 E.04236
G1 X117.806 Y129.249 E.43692
G3 X117.594 Y128.478 I6.763 J-2.266 E.03559
G1 X125.523 Y136.406 E.49878
G2 X126.225 Y136.548 I1.611 J-6.177 E.03186
G1 X117.452 Y127.775 E.55188
G3 X117.363 Y127.126 I5.737 J-1.12 E.02918
G1 X126.874 Y136.637 E.59833
G2 X127.481 Y136.684 I.721 J-5.381 E.0271
G1 X117.316 Y126.518 E.63947
G3 X117.304 Y125.946 I5.089 J-.395 E.02548
G1 X128.053 Y136.696 E.67625
G2 X128.597 Y136.68 I.125 J-4.849 E.02421
G1 X117.32 Y125.403 E.70939
G3 X117.362 Y124.884 I4.638 J.111 E.02315
G1 X129.116 Y136.639 E.73942
G2 X129.614 Y136.576 I-.308 J-4.462 E.02232
G1 X117.425 Y124.387 E.76676
G3 X117.507 Y123.909 I4.298 J.489 E.0216
G1 X130.091 Y136.493 E.79165
G2 X130.547 Y136.389 I-.697 J-4.114 E.02082
G1 X117.61 Y123.452 E.81388
G3 X117.73 Y123.011 I3.98 J.847 E.02031
G1 X130.988 Y136.27 E.83408
G2 X131.416 Y136.137 I-.969 J-3.871 E.01991
G1 X117.863 Y122.585 E.85255
G3 X118.009 Y122.171 I3.759 J1.095 E.01954
G1 X131.83 Y135.991 E.86939
G2 X132.225 Y135.827 I-1.265 J-3.607 E.01907
G1 X118.172 Y121.774 E.88404
G3 X118.348 Y121.39 I3.508 J1.374 E.01881
G1 X132.611 Y135.652 E.89719
G2 X132.985 Y135.467 I-1.461 J-3.431 E.01861
G1 X118.534 Y121.015 E.90908
G1 X118.733 Y120.654 E.01835
G1 X133.345 Y135.266 E.91923
G2 X133.694 Y135.055 I-1.708 J-3.21 E.01815
G1 X118.945 Y120.306 E.9278
G3 X119.166 Y119.967 I3.13 J1.798 E.01802
G1 X134.034 Y134.835 E.93529
G1 X134.361 Y134.601 E.01786
G1 X119.398 Y119.638 E.94128
G3 X119.643 Y119.324 I2.925 J2.027 E.01776
G1 X134.676 Y134.357 E.9457
G2 X134.984 Y134.104 I-2.093 J-2.867 E.01771
G1 X119.896 Y119.017 E.94913
G1 X120.16 Y118.72 E.01765
G1 X135.279 Y133.839 E.95111
G2 X135.563 Y133.563 I-2.314 J-2.67 E.01763
G1 X120.437 Y118.437 E.95159
G3 X120.721 Y118.161 I2.598 J2.394 E.01763
G1 X135.84 Y133.28 E.95111
G1 X136.104 Y132.983 E.01765
G1 X121.016 Y117.896 E.94913
G3 X121.324 Y117.643 I2.401 J2.614 E.01771
G1 X136.357 Y132.676 E.9457
G2 X136.602 Y132.362 I-2.68 J-2.342 E.01776
G1 X121.639 Y117.399 E.94128
G1 X121.966 Y117.165 E.01786
G1 X136.834 Y132.033 E.93529
G2 X137.055 Y131.694 I-2.909 J-2.137 E.01802
G1 X122.306 Y116.945 E.92781
G3 X122.655 Y116.734 I2.057 J2.999 E.01815
G1 X137.267 Y131.346 E.91923
G1 X137.466 Y130.985 E.01835
G1 X123.014 Y116.533 E.90908
G3 X123.389 Y116.348 I1.836 J3.245 E.01861
G1 X137.652 Y130.61 E.8972
G2 X137.828 Y130.226 I-3.333 J-1.758 E.01881
G1 X123.774 Y116.173 E.88404
G3 X124.17 Y116.009 I1.66 J3.44 E.01907
G1 X137.991 Y129.829 E.86939
G2 X138.137 Y129.415 I-3.612 J-1.509 E.01954
G1 X124.584 Y115.863 E.85256
G3 X125.011 Y115.73 I1.397 J3.738 E.01991
G1 X138.27 Y128.989 E.83408
G2 X138.39 Y128.548 I-3.86 J-1.287 E.02031
G1 X125.452 Y115.611 E.81388
G3 X125.909 Y115.507 I1.154 J4.011 E.02082
G1 X138.493 Y128.091 E.79165
G2 X138.575 Y127.613 I-4.218 J-.968 E.0216
G1 X126.386 Y115.424 E.76676
G3 X126.884 Y115.362 I.805 J4.4 E.02232
G1 X138.638 Y127.116 E.73942
G2 X138.68 Y126.597 I-4.596 J-.63 E.02315
G1 X127.403 Y115.32 E.70939
G3 X127.946 Y115.304 I.419 J4.83 E.02421
G1 X138.696 Y126.054 E.67626
G2 X138.684 Y125.482 I-5.102 J-.178 E.02548
G1 X128.519 Y115.316 E.63948
G3 X129.129 Y115.366 I-.22 J6.411 E.02725
G1 X138.637 Y124.875 E.59813
G2 X138.548 Y124.225 I-5.828 J.471 E.02918
G1 X129.775 Y115.452 E.55189
G3 X130.477 Y115.594 I-.909 J6.318 E.03186
G1 X138.406 Y123.522 E.49879
G2 X138.194 Y122.751 I-6.973 J1.495 E.03559
G1 X131.249 Y115.806 E.43693
G3 X132.141 Y116.137 I-2.508 J8.107 E.04235
G1 X137.862 Y121.859 E.35991
G2 X137.327 Y120.763 I-11.857 J5.116 E.05426
G1 X133.236 Y116.672 E.25736
G3 X133.917 Y117.084 I-3.33 J6.273 E.03544
G3 X136.952 Y119.828 I-10.659 J14.839 E.18237
G1 X128.88 Y114.899 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.545177
G1 F9276.649
G2 X131.946 Y115.584 I-.871 J11.102 E3.69778
G2 X128.94 Y114.906 I-3.989 J10.671 E.17108
; CHANGE_LAYER
; Z_HEIGHT: 21.2
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X129.53 Y114.968 E-.2257
G1 X130.146 Y115.071 E-.23701
G1 X130.755 Y115.208 E-.2374
G1 X130.907 Y115.251 E-.0599
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 76/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z21.32 I-1.213 J.102 P1  F30000
G1 X132.675 Y136.357 Z21.32
G1 Z21.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X132.671 Y136.353 E.00022
G3 X123.327 Y115.643 I-4.68 J-10.351 E1.58831
G3 X128.522 Y114.653 I4.68 J10.439 E.2374
G3 X133.244 Y136.074 I-.531 J11.348 E1.321
G1 X132.728 Y136.33 E.02561
G1 X132.838 Y136.694 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.826 Y136.694 E.00053
G3 X123.172 Y115.301 I-4.835 J-10.693 E1.5145
G3 X128.542 Y114.279 I4.834 J10.783 E.22647
G3 X133.417 Y136.407 I-.551 J11.722 E1.2595
G1 X132.892 Y136.667 E.02407
M204 S10000
; WIPE_START
G1 F24000
G1 X132.826 Y136.694 E-.02733
G1 X132.22 Y136.953 E-.25013
G1 X131.599 Y137.172 E-.2502
G1 X131.012 Y137.343 E-.23233
; WIPE_END
G1 E-.04 F1800
G1 X134.026 Y134.774 Z21.6 F30000
G1 Z21.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X136.724 Y131.79 I-11.924 J-13.495 E.17934
G2 X137.139 Y131.102 I-5.92 J-4.04 E.03577
G1 X133.103 Y135.139 E.25394
G3 X132.018 Y135.665 I-5.106 J-9.146 E.05365
G1 X137.665 Y130.018 E.35523
G2 X137.99 Y129.134 I-13.283 J-5.393 E.04191
G1 X131.136 Y135.988 E.43118
G3 X130.371 Y136.195 I-2.221 J-6.709 E.03526
G1 X138.195 Y128.371 E.49216
G2 X138.332 Y127.676 I-6.122 J-1.567 E.03154
G1 X129.675 Y136.333 E.54458
G3 X129.037 Y136.412 I-.913 J-4.748 E.0286
G1 X138.416 Y127.033 E.59
G2 X138.459 Y126.432 I-5.329 J-.677 E.02681
G1 X128.431 Y136.46 E.63081
G3 X127.865 Y136.467 I-.351 J-5.038 E.0252
G1 X138.466 Y125.866 E.66692
G2 X138.445 Y125.328 I-4.796 J-.081 E.02394
G1 X127.328 Y136.446 E.69938
G3 X126.815 Y136.4 I.155 J-4.585 E.02289
G1 X138.4 Y124.815 E.72873
G2 X138.332 Y124.324 I-4.408 J.353 E.02207
G1 X126.325 Y136.332 E.75537
G3 X125.853 Y136.245 I.535 J-4.244 E.02135
G1 X138.246 Y123.852 E.77964
G1 X138.141 Y123.398 E.02071
G1 X125.398 Y136.142 E.80166
G1 X124.963 Y136.018 E.02011
G1 X138.017 Y122.964 E.82121
G2 X137.879 Y122.543 I-3.814 J1.017 E.0197
G1 X124.543 Y135.879 E.83895
G3 X124.136 Y135.728 I1.144 J-3.701 E.01933
G1 X137.729 Y122.135 E.85509
G1 X137.564 Y121.741 E.01899
G1 X123.741 Y135.565 E.86959
G1 X123.366 Y135.381 E.01856
G1 X137.384 Y121.363 E.88182
G2 X137.193 Y120.995 I-3.37 J1.513 E.01844
G1 X122.996 Y135.193 E.89313
G3 X122.638 Y134.992 I1.614 J-3.282 E.01825
G1 X136.993 Y120.637 E.903
G1 X136.776 Y120.295 E.01801
G1 X122.294 Y134.777 E.91102
G3 X121.963 Y134.55 I1.854 J-3.066 E.01788
G1 X136.55 Y119.963 E.91766
G2 X136.316 Y119.639 I-3.001 J1.928 E.0178
G1 X121.64 Y134.315 E.92321
G1 X121.328 Y134.068 E.01768
G1 X136.067 Y119.329 E.92717
G2 X135.808 Y119.03 I-2.797 J2.155 E.01762
G1 X121.03 Y133.808 E.92968
G3 X120.739 Y133.54 I2.239 J-2.722 E.01759
G1 X135.541 Y118.738 E.93117
G1 X135.261 Y118.46 E.01757
G1 X120.459 Y133.262 E.93117
G3 X120.192 Y132.97 I2.462 J-2.523 E.01759
G1 X134.97 Y118.192 E.92968
G2 X134.672 Y117.932 I-2.462 J2.53 E.01762
G1 X119.933 Y132.671 E.92717
G1 X119.684 Y132.361 E.01767
G1 X134.36 Y117.685 E.92321
G2 X134.037 Y117.45 I-2.258 J2.757 E.01779
G1 X119.45 Y132.037 E.91765
G3 X119.224 Y131.705 I2.846 J-2.178 E.01789
G1 X133.705 Y117.223 E.91101
G1 X133.362 Y117.008 E.01803
G1 X119.007 Y131.363 E.903
G3 X118.807 Y131.005 I3.086 J-1.963 E.01826
G1 X133.004 Y116.807 E.89313
G2 X132.637 Y116.616 I-1.888 J3.171 E.01842
G1 X118.616 Y130.637 E.88204
G3 X118.436 Y130.259 I3.278 J-1.795 E.01865
G1 X132.259 Y116.435 E.86961
G2 X131.864 Y116.272 I-1.65 J3.439 E.01903
G1 X118.271 Y129.865 E.85509
G3 X118.12 Y129.457 I3.556 J-1.545 E.01935
G1 X131.457 Y116.12 E.83895
G2 X131.037 Y115.982 I-1.444 J3.669 E.01968
G1 X117.983 Y129.036 E.82121
G3 X117.859 Y128.602 I3.807 J-1.321 E.02011
G1 X130.602 Y115.858 E.80166
G2 X130.147 Y115.755 I-1.148 J3.997 E.02077
G1 X117.754 Y128.148 E.77964
G3 X117.668 Y127.676 I4.163 J-1.002 E.02137
G1 X129.675 Y115.668 E.75537
G2 X129.185 Y115.6 I-.848 J4.336 E.02205
G1 X117.6 Y127.184 E.72872
G3 X117.555 Y126.672 I4.542 J-.664 E.02291
G1 X128.672 Y115.554 E.69938
G2 X128.13 Y115.538 I-.451 J5.919 E.02413
G1 X117.534 Y126.134 E.66661
M73 P88 R2
G3 X117.541 Y125.568 I5.045 J-.213 E.02521
G1 X127.569 Y115.54 E.63081
G2 X126.968 Y115.583 I.077 J5.372 E.02681
G1 X117.584 Y124.967 E.59035
G3 X117.668 Y124.324 I5.765 J.43 E.02886
G1 X126.325 Y115.668 E.54458
G2 X125.629 Y115.805 I.879 J6.269 E.03159
G1 X117.805 Y123.629 E.49216
G3 X118.01 Y122.866 I6.896 J1.44 E.03516
G1 X124.864 Y116.012 E.43117
G2 X123.982 Y116.335 I3.721 J11.51 E.04179
G1 X118.335 Y121.982 E.35522
G3 X118.861 Y120.898 I9.767 J4.066 E.05362
G1 X122.897 Y116.861 E.25393
G2 X120.818 Y118.382 I5.198 J9.289 E.11488
G1 X119.23 Y119.97 E.09988
G1 X128.948 Y136.867 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.559826
G1 F9004.722
G2 X137.411 Y131.52 I-.931 J-10.844 E.59303
G1 X137.973 Y130.439 E.06944
G2 X128.89 Y115.126 I-9.97 J-4.437 E1.1871
G1 X127.673 Y115.089 E.06944
G2 X128.888 Y136.871 I.325 J10.907 E1.98668
; CHANGE_LAYER
; Z_HEIGHT: 21.48
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X128.333 Y136.912 E-.21141
G1 X127.721 Y136.913 E-.23269
G1 X127.11 Y136.876 E-.23261
G1 X126.892 Y136.851 E-.08328
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 77/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z21.6 I.147 J1.208 P1  F30000
G1 X132.589 Y136.159 Z21.6
G1 Z21.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X132.583 Y136.156 E.00031
G3 X125.791 Y115.073 I-4.592 J-10.156 E1.66962
G3 X128.793 Y114.883 I2.221 J11.273 E.13418
G3 X133.145 Y135.883 I-.802 J11.117 E1.28352
G1 X132.642 Y136.133 E.02495
G1 X132.752 Y136.497 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.737 Y136.498 E.00063
G3 X125.087 Y114.851 I-4.746 J-10.498 E1.56638
G3 X128.813 Y114.509 I2.899 J11.088 E.15431
G3 X133.318 Y136.216 I-.821 J11.492 E1.225
G1 X132.806 Y136.47 E.02347
M204 S10000
; WIPE_START
G1 F24000
G1 X132.737 Y136.498 E-.02838
G1 X132.143 Y136.752 E-.24556
G1 X131.533 Y136.968 E-.24562
G1 X130.926 Y137.145 E-.24045
; WIPE_END
G1 E-.04 F1800
G1 X123.986 Y133.968 Z21.88 F30000
G1 X119.413 Y131.874 Z21.88
G1 Z21.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X123.036 Y134.941 I11.742 J-10.198 E.21196
G1 X119.06 Y130.964 E.25014
G3 X118.543 Y129.892 I8.98 J-4.985 E.05299
G1 X124.108 Y135.457 E.35007
G2 X124.981 Y135.773 I4.591 J-11.302 E.04129
G1 X118.229 Y129.021 E.42472
G3 X118.028 Y128.264 I6.646 J-2.173 E.03489
G1 X125.736 Y135.972 E.48494
G2 X126.425 Y136.105 I1.521 J-6.063 E.0312
G1 X117.894 Y127.574 E.53662
G3 X117.814 Y126.938 I5.624 J-1.032 E.02854
G1 X127.061 Y136.184 E.58167
G2 X127.655 Y136.222 I.633 J-5.27 E.02649
G1 X117.776 Y126.344 E.62141
G3 X117.773 Y125.785 I4.977 J-.308 E.02489
G1 X128.214 Y136.225 E.65681
G2 X128.745 Y136.2 I.038 J-4.737 E.02364
G1 X117.799 Y125.254 E.68856
G3 X117.85 Y124.749 I4.526 J.199 E.02261
G1 X129.251 Y136.15 E.71719
G2 X129.735 Y136.078 I-.397 J-4.349 E.02179
G1 X117.922 Y124.265 E.74312
G3 X118.013 Y123.8 I4.185 J.58 E.02109
G1 X130.201 Y135.987 E.76666
G2 X130.649 Y135.879 I-.734 J-4.048 E.02053
G1 X118.121 Y123.352 E.78807
G3 X118.245 Y122.919 I3.928 J.887 E.02003
G1 X131.08 Y135.754 E.80739
G2 X131.493 Y135.611 I-1.063 J-3.752 E.01947
G1 X118.388 Y122.506 E.82441
G3 X118.544 Y122.106 I3.64 J1.191 E.01911
G1 X131.894 Y135.456 E.83979
G2 X132.283 Y135.288 I-1.297 J-3.545 E.01884
G1 X118.712 Y121.718 E.85366
G1 X118.892 Y121.342 E.01855
G1 X132.657 Y135.107 E.8659
G2 X133.017 Y134.911 I-1.564 J-3.306 E.01825
G1 X119.089 Y120.982 E.8762
G3 X119.296 Y120.633 I3.215 J1.665 E.01807
G1 X133.368 Y134.705 E.88524
G1 X133.708 Y134.489 E.01793
G1 X119.512 Y120.293 E.89306
G1 X119.742 Y119.967 E.01775
G1 X134.033 Y134.258 E.89901
G2 X134.348 Y134.017 I-1.984 J-2.93 E.01766
G1 X119.983 Y119.652 E.90368
G3 X120.233 Y119.346 I2.85 J2.073 E.01759
G1 X134.655 Y133.768 E.90726
G1 X134.948 Y133.504 E.01752
G1 X120.495 Y119.051 E.90922
G3 X120.769 Y118.769 I2.648 J2.301 E.0175
G1 X135.231 Y133.231 E.90975
G2 X135.505 Y132.949 I-2.373 J-2.583 E.0175
G1 X121.052 Y118.496 E.90922
G1 X121.345 Y118.232 E.01752
G1 X135.767 Y132.654 E.90726
G2 X136.017 Y132.348 I-2.6 J-2.379 E.01759
G1 X121.651 Y117.983 E.90369
G3 X121.967 Y117.742 I2.3 J2.69 E.01766
G1 X136.258 Y132.034 E.89901
G1 X136.488 Y131.707 E.01775
G1 X122.292 Y117.511 E.89307
G1 X122.632 Y117.295 E.01793
G1 X136.704 Y131.367 E.88524
G2 X136.911 Y131.018 I-3.008 J-2.014 E.01807
G1 X122.983 Y117.089 E.8762
G3 X123.343 Y116.893 I1.924 J3.11 E.01825
G1 X137.108 Y130.658 E.8659
G1 X137.287 Y130.282 E.01855
G1 X123.717 Y116.712 E.85366
G3 X124.106 Y116.544 I1.685 J3.376 E.01884
G1 X137.456 Y129.894 E.83979
G2 X137.612 Y129.494 I-3.482 J-1.591 E.01911
G1 X124.507 Y116.389 E.82441
G3 X124.92 Y116.246 I1.476 J3.61 E.01947
G1 X137.755 Y129.081 E.8074
G2 X137.878 Y128.648 I-3.791 J-1.316 E.02003
G1 X125.351 Y116.121 E.78808
G3 X125.799 Y116.013 I1.183 J3.94 E.02053
G1 X137.987 Y128.2 E.76666
G2 X138.078 Y127.735 I-4.094 J-1.045 E.02109
G1 X126.265 Y115.922 E.74312
G3 X126.749 Y115.85 I.881 J4.277 E.02179
G1 X138.15 Y127.251 E.7172
G2 X138.201 Y126.746 I-4.475 J-.704 E.02261
G1 X127.255 Y115.8 E.68856
G3 X127.786 Y115.775 I.493 J4.71 E.02364
G1 X138.227 Y126.216 E.65682
G2 X138.224 Y125.656 I-4.982 J-.252 E.02489
G1 X128.345 Y115.778 E.62142
G3 X128.946 Y115.823 I-.22 J7.013 E.02681
G1 X138.186 Y125.062 E.58124
G2 X138.106 Y124.426 I-5.706 J.395 E.02854
G1 X129.575 Y115.895 E.53663
G3 X130.263 Y116.028 I-.833 J6.196 E.03119
G1 X137.973 Y123.737 E.48496
G2 X137.771 Y122.979 I-6.847 J1.415 E.03489
G1 X131.019 Y116.227 E.42474
G3 X131.892 Y116.543 I-3.717 J11.616 E.04129
G1 X137.457 Y122.109 E.35009
G2 X136.94 Y121.036 I-9.498 J3.912 E.05299
G1 X132.964 Y117.059 E.25017
G3 X136.587 Y120.127 I-8.003 J13.128 E.21202
G1 X133.399 Y116.782 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.587648
G1 F8529.838
G2 X128.758 Y115.342 I-5.347 J9.03 E.29514
G1 X127.68 Y115.316 E.06486
G2 X133.909 Y117.097 I.314 J10.682 E3.64511
G1 X133.45 Y116.814 E.03246
; CHANGE_LAYER
; Z_HEIGHT: 21.76
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X133.909 Y117.097 E-.20493
G1 X134.408 Y117.445 E-.23123
G1 X134.876 Y117.817 E-.2272
G1 X135.066 Y117.986 E-.09664
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 78/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z21.88 I-1.205 J-.172 P1  F30000
G1 X132.496 Y135.949 Z21.88
G1 Z21.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X132.488 Y135.946 E.00041
G3 X124.652 Y115.608 I-4.496 J-9.946 E1.58053
G3 X128.411 Y115.093 I3.363 J10.568 E.16962
G3 X133.038 Y135.678 I-.42 J10.907 E1.27326
G1 X132.55 Y135.922 E.02429
G1 X132.66 Y136.287 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.643 Y136.289 E.00071
G3 X124.537 Y115.251 I-4.652 J-10.288 E1.50922
G3 X128.431 Y114.718 I3.478 J10.927 E.16218
G3 X133.212 Y136.012 I-.44 J11.283 E1.21552
G1 X132.714 Y136.26 E.02285
M204 S10000
; WIPE_START
G1 F24000
G1 X132.643 Y136.289 E-.02915
G1 X132.06 Y136.538 E-.24066
G1 X131.463 Y136.749 E-.24073
G1 X130.855 Y136.926 E-.2407
G1 X130.832 Y136.932 E-.00876
; WIPE_END
G1 E-.04 F1800
G1 X133.717 Y134.393 Z22.16 F30000
G1 Z21.76
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X136.612 Y131.044 I-10.095 J-11.656 E.1976
G1 X136.734 Y130.822 E.01127
G1 X132.822 Y134.734 E.24609
G3 X131.762 Y135.24 I-4.882 J-8.852 E.05228
G1 X137.24 Y129.763 E.34459
G2 X137.542 Y128.907 I-8.67 J-3.548 E.0404
G1 X130.904 Y135.545 E.41761
G3 X130.157 Y135.739 I-1.931 J-5.917 E.03433
G1 X137.741 Y128.155 E.47707
G2 X137.868 Y127.474 I-5.996 J-1.474 E.03082
G1 X129.473 Y135.87 E.52816
G3 X128.845 Y135.944 I-3.24 J-24.789 E.02809
G1 X137.944 Y126.846 E.57234
G2 X137.977 Y126.259 I-5.207 J-.589 E.02615
G1 X128.26 Y135.976 E.61124
G3 X127.708 Y135.975 I-.27 J-4.92 E.02459
G1 X137.976 Y125.707 E.64593
G2 X137.946 Y125.184 I-4.677 J.006 E.02333
G1 X127.183 Y135.947 E.67706
G1 X126.684 Y135.892 E.02232
G1 X137.891 Y124.685 E.70499
G2 X137.815 Y124.208 I-4.285 J.44 E.0215
G1 X126.207 Y135.815 E.73018
G3 X125.75 Y135.72 I.623 J-4.122 E.02081
G1 X137.718 Y123.751 E.75288
G2 X137.607 Y123.309 I-3.62 J.671 E.02031
G1 X125.309 Y135.607 E.77363
G3 X124.884 Y135.479 I.928 J-3.85 E.01976
G1 X137.48 Y122.883 E.79235
G1 X137.335 Y122.474 E.01929
G1 X124.473 Y135.336 E.80911
G1 X124.081 Y135.176 E.01887
G1 X137.175 Y122.081 E.82372
G2 X137.003 Y121.7 I-3.478 J1.344 E.01861
G1 X123.7 Y135.002 E.8368
G3 X123.332 Y134.818 I1.457 J-3.376 E.01835
G1 X136.819 Y121.331 E.84845
G1 X136.621 Y120.975 E.01809
G1 X122.974 Y134.622 E.85847
G3 X122.633 Y134.41 I1.713 J-3.144 E.01789
G1 X136.41 Y120.633 E.86669
G2 X136.189 Y120.301 I-3.07 J1.8 E.01776
G1 X122.301 Y134.189 E.87366
G3 X121.979 Y133.958 I1.896 J-2.984 E.01765
G1 X135.959 Y119.978 E.87943
G2 X135.712 Y119.671 I-2.858 J2.038 E.01752
G1 X121.67 Y133.713 E.88337
G3 X121.373 Y133.457 I2.13 J-2.776 E.01746
G1 X135.457 Y119.373 E.88602
G2 X135.193 Y119.083 I-2.707 J2.207 E.01743
G1 X121.084 Y133.192 E.88755
G1 X120.807 Y132.917 E.0174
G1 X134.916 Y118.808 E.88755
M73 P89 R2
G2 X134.627 Y118.543 I-2.503 J2.437 E.01743
G1 X120.543 Y132.627 E.88602
G3 X120.287 Y132.329 I2.527 J-2.421 E.01746
G1 X134.33 Y118.287 E.88337
G1 X134.021 Y118.042 E.01752
G1 X120.041 Y132.022 E.87943
G1 X119.811 Y131.699 E.01764
G1 X133.699 Y117.811 E.87366
G2 X133.367 Y117.59 I-2.139 J2.843 E.01775
G1 X119.59 Y131.367 E.86668
G3 X119.379 Y131.025 I2.942 J-2.05 E.0179
G1 X133.026 Y117.378 E.85847
G1 X132.668 Y117.182 E.01813
G1 X119.181 Y130.669 E.84844
G3 X118.997 Y130.3 I3.199 J-1.821 E.01837
G1 X132.299 Y116.997 E.8368
G2 X131.919 Y116.824 I-1.73 J3.298 E.01859
G1 X118.825 Y129.919 E.82372
G3 X118.665 Y129.526 I3.421 J-1.623 E.01889
G1 X131.527 Y116.664 E.80911
G1 X131.116 Y116.521 E.01935
G1 X118.52 Y129.117 E.79235
G3 X118.393 Y128.691 I3.724 J-1.348 E.01978
G1 X130.689 Y116.394 E.77355
G2 X130.25 Y116.28 I-1.137 J3.481 E.0202
G1 X118.282 Y128.248 E.75288
G3 X118.185 Y127.792 I4.497 J-1.19 E.02077
G1 X129.792 Y116.185 E.73017
G2 X129.316 Y116.108 I-.921 J4.205 E.02148
G1 X118.109 Y127.315 E.70498
G3 X118.054 Y126.816 I4.413 J-.737 E.02232
G1 X128.817 Y116.053 E.67706
G2 X128.291 Y116.026 I-2.284 J39.143 E.02344
G1 X118.024 Y126.293 E.64585
G3 X118.023 Y125.741 I4.914 J-.286 E.02457
G1 X127.739 Y116.025 E.61121
G2 X127.154 Y116.056 I-.039 J4.725 E.02607
G1 X118.056 Y125.154 E.57233
G3 X118.132 Y124.526 I5.632 J.355 E.02817
G1 X126.527 Y116.13 E.52814
G2 X125.846 Y116.258 I.802 J6.133 E.03087
G1 X118.259 Y123.845 E.47725
G3 X118.458 Y123.093 I6.154 J1.223 E.03462
G1 X125.096 Y116.455 E.4176
G2 X124.238 Y116.76 I3.096 J10.077 E.04052
G1 X118.76 Y122.237 E.34457
G3 X119.266 Y121.178 I9.261 J3.773 E.05225
G1 X123.178 Y117.266 E.24607
G2 X119.613 Y120.278 I7.861 J12.922 E.20843
G1 X128.318 Y136.437 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.606828
G1 F8230.608
G2 X120.424 Y133.197 I-.326 J-10.441 E3.54562
G2 X128.258 Y136.438 I7.567 J-7.202 E.5445
; CHANGE_LAYER
; Z_HEIGHT: 22.04
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X127.732 Y136.446 E-.19994
G1 X127.147 Y136.414 E-.22274
G1 X126.564 Y136.35 E-.2227
G1 X126.267 Y136.3 E-.11462
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 79/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z22.16 I.113 J1.212 P1  F30000
G1 X132.398 Y135.729 Z22.16
G1 Z22.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X132.389 Y135.728 E.0004
G3 X124.726 Y115.837 I-4.399 J-9.727 E1.54589
G3 X128.681 Y115.348 I3.281 J10.298 E.1783
G3 X132.928 Y135.466 I-.691 J10.653 E1.23275
G1 X132.452 Y135.702 E.02363
G1 X132.562 Y136.066 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.543 Y136.068 E.00078
G3 X124.026 Y115.687 I-4.552 J-10.068 E1.45141
G3 X128.701 Y114.974 I3.958 J10.269 E.19568
G3 X133.1 Y135.797 I-.71 J11.027 E1.17805
G1 X132.616 Y136.04 E.02225
M204 S10000
; WIPE_START
G1 F24000
G1 X132.543 Y136.068 E-.02963
G1 X131.974 Y136.313 E-.23552
G1 X131.389 Y136.52 E-.23559
G1 X130.794 Y136.693 E-.23557
G1 X130.733 Y136.707 E-.02368
; WIPE_END
G1 E-.04 F1800
G1 X123.432 Y134.484 Z22.44 F30000
G1 X122.464 Y134.189 Z22.44
G1 Z22.04
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X120.925 Y132.65 E.0968
G3 X119.47 Y130.635 I7.219 J-6.746 E.11087
G1 X123.364 Y134.529 E.24497
G2 X124.419 Y135.023 I4.722 J-8.701 E.05184
G1 X118.975 Y129.58 E.34244
G3 X118.684 Y128.728 I9.993 J-3.892 E.04003
G1 X125.272 Y135.316 E.41444
G2 X126.02 Y135.505 I2.05 J-6.57 E.03434
G1 X118.494 Y127.978 E.47347
G3 X118.379 Y127.303 I14.721 J-2.858 E.03048
G1 X126.699 Y135.623 E.5234
G2 X127.321 Y135.685 I.864 J-5.508 E.02783
G1 X118.316 Y126.68 E.56649
G3 X118.293 Y126.097 I5.181 J-.496 E.02598
G1 X127.904 Y135.708 E.60461
G2 X128.454 Y135.697 I.184 J-4.901 E.02448
G1 X118.303 Y125.546 E.63857
G3 X118.341 Y125.025 I4.665 J.081 E.02329
G1 X128.976 Y135.659 E.66899
G2 X129.474 Y135.597 I-.308 J-4.462 E.02232
G1 X118.404 Y124.527 E.69634
G3 X118.488 Y124.051 I4.279 J.512 E.02151
G1 X129.95 Y135.513 E.72101
G1 X130.405 Y135.407 E.02077
G1 X118.592 Y123.594 E.74312
G1 X118.716 Y123.158 E.02017
G1 X130.841 Y135.283 E.76274
G2 X131.261 Y135.143 I-1.036 J-3.811 E.01971
G1 X118.856 Y122.739 E.78034
G3 X119.012 Y122.334 I3.684 J1.179 E.0193
G1 X131.667 Y134.989 E.79609
G2 X132.059 Y134.82 I-1.301 J-3.574 E.01898
G1 X119.18 Y121.942 E.81014
G3 X119.362 Y121.563 I3.462 J1.425 E.01869
G1 X132.436 Y134.637 E.82245
G2 X132.798 Y134.439 I-1.583 J-3.323 E.01837
G1 X119.56 Y121.202 E.83274
G3 X119.77 Y120.852 I3.221 J1.696 E.01817
G1 X133.149 Y134.23 E.84158
G2 X133.488 Y134.009 I-1.793 J-3.135 E.01802
G1 X119.992 Y120.512 E.84904
G1 X120.223 Y120.184 E.01788
G1 X133.815 Y133.776 E.85503
G2 X134.128 Y133.529 I-2.043 J-2.911 E.01775
G1 X120.471 Y119.871 E.85915
G3 X120.729 Y119.569 I2.822 J2.144 E.01769
G1 X134.431 Y133.272 E.862
G2 X134.725 Y133.005 I-2.231 J-2.745 E.01765
G1 X120.996 Y119.276 E.86361
G1 X121.275 Y118.995 E.01762
G1 X135.004 Y132.724 E.86361
G2 X135.271 Y132.431 I-2.471 J-2.529 E.01765
G1 X121.569 Y118.728 E.862
G3 X121.872 Y118.471 I2.44 J2.57 E.01769
G1 X135.529 Y132.129 E.85915
G1 X135.777 Y131.816 E.01774
G1 X122.185 Y118.224 E.85503
G1 X122.512 Y117.991 E.01786
G1 X136.008 Y131.488 E.84904
G2 X136.23 Y131.148 I-2.909 J-2.138 E.01802
G1 X122.851 Y117.77 E.84158
G3 X123.202 Y117.561 I2.041 J3.017 E.01818
G1 X136.44 Y130.798 E.83274
G1 X136.638 Y130.437 E.01835
G1 X123.564 Y117.363 E.82245
G1 X123.941 Y117.18 E.01865
G1 X136.82 Y130.058 E.81014
G2 X136.988 Y129.666 I-3.401 J-1.698 E.01897
G1 X124.334 Y117.012 E.79603
G1 X124.743 Y116.861 E.01938
G1 X137.144 Y129.261 E.78009
G2 X137.284 Y128.842 I-3.665 J-1.461 E.0197
G1 X125.159 Y116.717 E.76275
G3 X125.595 Y116.593 I1.323 J3.821 E.02018
G1 X137.408 Y128.406 E.74312
G2 X137.512 Y127.949 I-4.01 J-1.147 E.02085
G1 X126.05 Y116.487 E.72101
G3 X126.526 Y116.403 I.986 J4.199 E.02152
G1 X137.596 Y127.473 E.69635
G2 X137.659 Y126.975 I-4.398 J-.808 E.02231
G1 X127.024 Y116.341 E.66899
G3 X127.546 Y116.303 I.602 J4.628 E.02329
G1 X137.697 Y126.454 E.63857
G2 X137.707 Y125.904 I-4.892 J-.365 E.02448
G1 X128.096 Y116.292 E.60462
G3 X128.684 Y116.32 I-.023 J6.719 E.02619
G1 X137.677 Y125.314 E.56575
G2 X137.621 Y124.697 I-7.688 J.387 E.02753
G1 X129.302 Y116.378 E.52336
G3 X129.98 Y116.495 I-2.105 J14.155 E.0306
G1 X137.506 Y124.022 E.47348
G2 X137.316 Y123.272 I-6.777 J1.318 E.03445
G1 X130.728 Y116.684 E.41444
G3 X131.581 Y116.977 I-2.876 J9.761 E.04015
G1 X137.025 Y122.42 E.34245
G2 X136.526 Y121.361 I-7.595 J2.932 E.05215
G1 X132.636 Y117.471 E.2447
G3 X133.37 Y117.909 I-3.531 J6.759 E.03805
G3 X136.195 Y120.47 I-9.863 J13.717 E.16999
G1 X128.605 Y115.833 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.636199
G1 F7811.006
G2 X136.759 Y120.796 I-.603 J10.17 E3.55435
G2 X128.665 Y115.838 I-8.756 J5.208 E.64898
; CHANGE_LAYER
; Z_HEIGHT: 22.32
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X129.404 Y115.903 E-.28188
G1 X129.966 Y115.997 E-.21652
G1 X130.523 Y116.123 E-.21728
G1 X130.635 Y116.155 E-.04432
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 80/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z22.44 I-1.213 J.104 P1  F30000
G1 X132.296 Y135.501 Z22.44
G1 Z22.32
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X132.286 Y135.499 E.00044
G3 X125.934 Y115.779 I-4.294 J-9.5 E1.56155
G3 X128.329 Y115.579 I2.101 J10.725 E.10712
G3 X132.812 Y135.244 I-.336 J10.42 E1.21906
G1 X132.349 Y135.475 E.023
G1 X132.459 Y135.839 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.44 Y135.841 E.00079
G3 X125.859 Y115.411 I-4.449 J-9.841 E1.4933
G3 X128.349 Y115.205 I2.174 J11.09 E.10276
G3 X132.985 Y135.576 I-.357 J10.794 E1.16535
G1 X132.513 Y135.812 E.02166
M204 S10000
; WIPE_START
G1 F24000
G1 X132.44 Y135.841 E-.02977
G1 X131.884 Y136.08 E-.23019
G1 X131.313 Y136.282 E-.23027
G1 X130.731 Y136.452 E-.23026
G1 X130.63 Y136.475 E-.0395
; WIPE_END
G1 E-.04 F1800
G17
G3 Z22.72 I.821 J.898 P1  F30000
G1 X133.361 Y133.978 Z22.72
G1 Z22.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X136.299 Y130.484 I-9.315 J-10.816 E.20397
G1 X132.483 Y134.301 E.2401
G3 X131.443 Y134.785 I-4.859 J-9.078 E.05105
G1 X136.783 Y129.445 E.33593
G2 X137.066 Y128.606 I-9.431 J-3.651 E.0394
G1 X130.606 Y135.066 E.40639
G3 X129.868 Y135.248 I-1.877 J-6.033 E.0338
G1 X137.249 Y127.867 E.46427
G2 X137.358 Y127.202 I-20.615 J-3.722 E.02997
G1 X129.203 Y135.357 E.51295
G3 X128.59 Y135.415 I-.823 J-5.435 E.02744
G1 X137.415 Y126.589 E.55517
G2 X137.433 Y126.015 I-5.1 J-.448 E.02555
G1 X128.016 Y135.433 E.59242
G3 X127.474 Y135.418 I-.14 J-4.826 E.02409
G1 X137.418 Y125.474 E.62554
G2 X137.376 Y124.961 I-4.59 J.123 E.02292
G1 X126.961 Y135.376 E.65514
G3 X126.474 Y135.308 I.321 J-4.084 E.02192
G1 X137.309 Y124.472 E.68161
G2 X137.219 Y124.006 I-4.517 J.628 E.02112
G1 X126.005 Y135.22 E.70542
G3 X125.557 Y135.112 I.735 J-4.045 E.02051
G1 X137.113 Y123.556 E.72695
G1 X136.988 Y123.126 E.01994
G1 X125.126 Y134.987 E.74617
G1 X124.714 Y134.844 E.01943
G1 X136.844 Y122.714 E.76306
G2 X136.685 Y122.318 I-3.613 J1.217 E.01903
G1 X124.317 Y134.685 E.778
G3 X123.934 Y134.512 I1.35 J-3.494 E.01869
G1 X136.512 Y121.934 E.79121
G2 X136.327 Y121.564 I-3.391 J1.466 E.01843
G1 X123.565 Y134.326 E.80282
G3 X123.207 Y134.128 I1.583 J-3.282 E.0182
G1 X136.128 Y121.207 E.81282
G2 X135.914 Y120.865 I-3.151 J1.737 E.01795
G1 X122.865 Y133.914 E.82088
G3 X122.535 Y133.688 I1.846 J-3.051 E.01779
G1 X135.687 Y120.536 E.8274
G2 X135.452 Y120.215 I-2.781 J1.793 E.0177
M73 P90 R2
G1 X122.216 Y133.452 E.83269
G3 X121.907 Y133.205 I2.046 J-2.871 E.0176
G1 X135.205 Y119.907 E.83653
G2 X134.943 Y119.613 I-2.744 J2.188 E.01752
G1 X121.613 Y132.943 E.83855
G3 X121.33 Y132.67 I2.29 J-2.654 E.01749
G1 X134.67 Y119.33 E.83919
G2 X134.387 Y119.057 I-2.573 J2.38 E.01749
G1 X121.057 Y132.387 E.83855
G3 X120.795 Y132.093 I2.482 J-2.481 E.01752
G1 X134.093 Y118.795 E.83653
G2 X133.784 Y118.548 I-2.355 J2.625 E.0176
G1 X120.548 Y131.785 E.83269
G3 X120.312 Y131.465 I2.728 J-2.261 E.01769
G1 X133.465 Y118.312 E.82746
G2 X133.135 Y118.086 I-2.176 J2.825 E.01779
G1 X120.086 Y131.135 E.82087
G3 X119.872 Y130.793 I2.935 J-2.077 E.01795
G1 X132.793 Y117.872 E.81282
G2 X132.435 Y117.674 I-1.941 J3.084 E.0182
G1 X119.673 Y130.436 E.80282
G3 X119.488 Y130.066 I3.206 J-1.836 E.01843
G1 X132.065 Y117.488 E.79121
G2 X131.683 Y117.315 I-1.732 J3.32 E.01869
G1 X119.315 Y129.682 E.778
G3 X119.156 Y129.286 I3.454 J-1.614 E.01903
G1 X131.286 Y117.156 E.76306
G1 X130.874 Y117.013 E.01943
G1 X119.012 Y128.874 E.74617
G1 X118.887 Y128.444 E.01994
G1 X130.443 Y116.888 E.72695
G2 X129.995 Y116.78 I-1.183 J3.937 E.02051
G1 X118.781 Y127.994 E.70542
G3 X118.691 Y127.528 I4.428 J-1.094 E.02112
G1 X129.527 Y116.692 E.68167
G2 X129.039 Y116.624 I-.842 J4.316 E.02195
G1 X118.624 Y127.039 E.65513
G3 X118.582 Y126.526 I4.548 J-.636 E.02292
G1 X128.526 Y116.582 E.62554
G2 X127.983 Y116.568 I-.399 J5.199 E.02415
G1 X118.567 Y125.984 E.59234
G3 X118.585 Y125.411 I5.119 J-.126 E.02555
G1 X127.41 Y116.585 E.55516
G2 X126.796 Y116.643 I.209 J5.492 E.02744
G1 X118.642 Y124.798 E.51295
G3 X118.751 Y124.133 I20.716 J3.056 E.02997
G1 X126.134 Y116.75 E.46444
G2 X125.394 Y116.934 I3.051 J13.83 E.03393
G1 X118.934 Y123.394 E.40639
G3 X119.217 Y122.555 I9.71 J2.811 E.0394
G1 X124.557 Y117.215 E.33592
G2 X123.517 Y117.699 I3.818 J9.56 E.05105
G1 X119.701 Y121.516 E.24008
G3 X122.639 Y118.022 I12.318 J7.376 E.20394
G1 X128.323 Y115.928 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.360985
G1 F12000
G2 X134.047 Y117.933 I-.315 J10.075 E1.96251
G2 X128.383 Y115.931 I-6.047 J8.093 E.20941
G1 X128.311 Y116.235 F30000
; LINE_WIDTH: 0.361129
G1 F12000
G1 X129.333 Y116.309 E.03519
G3 X137.59 Y124.13 I-1.326 J9.669 E.41694
G1 X137.744 Y125.143 E.0352
G3 X129.87 Y135.59 I-9.729 J.858 E.49228
G1 X128.857 Y135.744 E.0352
G3 X118.41 Y127.87 I-.859 J-9.727 E.49229
G1 X118.256 Y126.857 E.0352
G3 X128.251 Y116.234 I9.73 J-.859 E.56558
; CHANGE_LAYER
; Z_HEIGHT: 22.6
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X127.689 Y116.223 E-.21348
G1 X127.143 Y116.256 E-.20785
G1 X126.598 Y116.319 E-.2085
G1 X126.261 Y116.378 E-.13017
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 81/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z22.72 I-1.161 J.364 P1  F30000
G1 X132.184 Y135.256 Z22.72
G1 Z22.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X132.176 Y135.255 E.00036
G3 X124.348 Y116.521 I-4.185 J-9.254 E1.44542
G3 X128.597 Y115.863 I3.636 J9.433 E.19274
G3 X132.688 Y135.006 I-.606 J10.138 E1.17511
G1 X132.238 Y135.23 E.02237
G1 X132.348 Y135.594 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.33 Y135.597 E.00073
G3 X124.213 Y116.171 I-4.34 J-9.596 E1.38347
G3 X128.617 Y115.489 I3.77 J9.781 E.18439
G3 X132.861 Y135.339 I-.626 J10.513 E1.12483
G1 X132.402 Y135.567 E.02108
M204 S10000
; WIPE_START
G1 F24000
G1 X132.33 Y135.597 E-.02936
G1 X131.787 Y135.829 E-.22447
G1 X131.23 Y136.026 E-.22453
G1 X130.663 Y136.191 E-.22452
G1 X130.516 Y136.225 E-.05713
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23 I.538 J-1.091 P1  F30000
G1 X120.253 Y131.164 Z23
G1 Z22.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X121.768 Y132.679 E.09528
G2 X123.717 Y134.066 I6.348 J-6.855 E.10669
G1 X119.931 Y130.281 E.23812
G3 X119.464 Y129.252 I32.649 J-15.461 E.05028
G1 X124.749 Y134.537 E.33247
G2 X125.579 Y134.806 I4.114 J-11.291 E.03882
G1 X119.193 Y128.42 E.40169
G3 X119.025 Y127.69 I10.196 J-2.74 E.03333
G1 X126.303 Y134.968 E.45784
G2 X126.962 Y135.067 I.984 J-4.344 E.02969
G1 X118.926 Y127.03 E.50553
G3 X118.877 Y126.42 I5.413 J-.746 E.02727
G1 X127.58 Y135.123 E.54748
G2 X128.15 Y135.132 I.366 J-5.073 E.02539
G1 X118.867 Y125.849 E.58395
G3 X118.892 Y125.312 I4.794 J-.053 E.02393
G1 X128.681 Y135.101 E.6158
G2 X129.19 Y135.049 I-.092 J-3.417 E.02279
G1 X118.953 Y124.812 E.64397
G3 X119.027 Y124.325 I3.281 J.25 E.02194
G1 X129.677 Y134.975 E.66995
G2 X130.142 Y134.878 I-.4 J-3.085 E.02113
G1 X119.123 Y123.86 E.69312
G3 X119.241 Y123.416 I3.09 J.579 E.02045
G1 X130.584 Y134.759 E.71358
G2 X131.009 Y134.622 I-1.004 J-3.85 E.01986
G1 X119.378 Y122.991 E.73168
G3 X119.531 Y122.583 I3.711 J1.161 E.0194
G1 X131.417 Y134.469 E.74773
G2 X131.811 Y134.301 I-1.299 J-3.586 E.01904
G1 X119.699 Y122.19 E.76188
G3 X119.882 Y121.811 I3.466 J1.436 E.01872
G1 X132.189 Y134.118 E.77418
G2 X132.55 Y133.919 I-1.594 J-3.322 E.01839
G1 X120.081 Y121.449 E.78444
G3 X120.293 Y121.1 I3.211 J1.719 E.01818
G1 X132.9 Y133.706 E.79303
G2 X133.237 Y133.482 I-1.829 J-3.112 E.01802
G1 X120.518 Y120.764 E.80008
G3 X120.755 Y120.439 I3.009 J1.945 E.01788
G1 X133.562 Y133.246 E.80564
G1 X133.873 Y132.996 E.01776
G1 X121.003 Y120.126 E.80959
G1 X121.273 Y119.835 E.01767
G1 X134.171 Y132.732 E.81136
G2 X134.457 Y132.457 I-2.303 J-2.688 E.01767
G1 X121.543 Y119.543 E.81241
G3 X121.833 Y119.272 I1.947 J1.797 E.01768
G1 X134.733 Y132.171 E.81146
G1 X134.997 Y131.874 E.01769
G1 X122.127 Y119.004 E.80961
G1 X122.438 Y118.754 E.01776
G1 X135.245 Y131.561 E.80564
G2 X135.482 Y131.236 I-2.771 J-2.27 E.01788
G1 X122.763 Y118.518 E.80008
G3 X123.1 Y118.294 I2.167 J2.888 E.01802
G1 X135.707 Y130.9 E.79303
G2 X135.919 Y130.551 I-2.998 J-2.067 E.01818
G1 X123.449 Y118.081 E.78444
G3 X123.811 Y117.882 I1.955 J3.121 E.01839
G1 X136.118 Y130.189 E.77418
G2 X136.301 Y129.81 I-3.281 J-1.814 E.01872
G1 X124.189 Y117.699 E.76189
G3 X124.583 Y117.531 I1.693 J3.419 E.01904
G1 X136.469 Y129.417 E.74773
G2 X136.622 Y129.009 I-3.556 J-1.569 E.0194
G1 X124.991 Y117.378 E.73168
G3 X125.416 Y117.241 I1.429 J3.713 E.01986
G1 X136.759 Y128.584 E.71358
G2 X136.877 Y128.14 I-2.972 J-1.023 E.02045
G1 X125.858 Y117.122 E.69313
G3 X126.32 Y117.023 I1.115 J4.064 E.02103
G1 X136.973 Y127.675 E.67013
G2 X137.047 Y127.188 I-3.207 J-.737 E.02194
G1 X126.804 Y116.945 E.64435
G3 X127.313 Y116.893 I.724 J4.502 E.02276
G1 X137.108 Y126.688 E.61622
G2 X137.133 Y126.151 I-4.77 J-.484 E.02393
G1 X127.853 Y116.871 E.58376
G1 X128.424 Y116.881 E.02541
G1 X137.123 Y125.581 E.54725
G2 X137.074 Y124.97 I-5.462 J.135 E.02727
G1 X129.035 Y116.931 E.50572
G3 X129.689 Y117.023 I-.307 J4.513 E.02942
G1 X136.975 Y124.31 E.45837
G2 X136.807 Y123.58 I-10.364 J2.01 E.03333
G1 X130.421 Y117.194 E.40171
G3 X131.251 Y117.463 I-3.288 J11.574 E.03882
G1 X136.522 Y122.734 E.33159
G2 X136.069 Y121.719 I-13.347 J5.355 E.04945
G1 X132.283 Y117.934 E.23815
G3 X133.052 Y118.388 I-3.662 J7.072 E.03974
G3 X135.747 Y120.836 I-9.348 J12.999 E.1623
G1 X136.692 Y121.489 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.376527
G1 F12000
G2 X128.57 Y116.222 I-8.647 J4.439 E.36582
G2 X137.706 Y124.617 I-.566 J9.785 E1.73815
G2 X136.719 Y121.543 I-9.387 J1.317 E.11713
G1 X128.233 Y116.522 F30000
; LINE_WIDTH: 0.376685
G1 F12000
G1 X129.292 Y116.6 E.03836
G3 X120.727 Y119.906 I-1.294 J9.397 E1.80657
G3 X128.173 Y116.521 I7.254 J6.075 E.3055
; CHANGE_LAYER
; Z_HEIGHT: 22.88
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X127.697 Y116.516 E-.18081
G1 X127.169 Y116.548 E-.20127
G1 X126.64 Y116.609 E-.20227
G1 X126.184 Y116.688 E-.17566
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 82/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z23 I-1.159 J.372 P1  F30000
G1 X132.069 Y135.007 Z23
G1 Z22.88
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X132.063 Y135.004 E.00034
G3 X126.588 Y116.218 I-4.069 J-9.005 E1.50474
G3 X128.291 Y116.122 I1.461 J10.762 E.07595
G3 X132.561 Y134.761 I-.298 J9.877 E1.15645
G1 X132.123 Y134.98 E.02178
G1 X132.233 Y135.344 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.217 Y135.345 E.00067
G3 X126.534 Y115.846 I-4.224 J-9.347 E1.44166
G3 X128.301 Y115.747 I1.517 J11.175 E.07273
G3 X132.734 Y135.094 I-.308 J10.252 E1.10803
G1 X132.287 Y135.318 E.02054
M204 S10000
; WIPE_START
G1 F24000
G1 X132.217 Y135.345 E-.02855
G1 X131.688 Y135.573 E-.21862
G1 X131.146 Y135.765 E-.21867
G1 X130.594 Y135.926 E-.21851
G1 X130.4 Y135.97 E-.07565
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.28 I.841 J.879 P1  F30000
G1 X132.981 Y133.501 Z23.28
G1 Z22.88
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X135.807 Y130.12 I-8.658 J-10.11 E.19695
G1 X132.117 Y133.81 E.23215
G3 X131.11 Y134.262 I-13.571 J-28.871 E.0491
G1 X136.264 Y129.108 E.32425
G2 X136.523 Y128.294 I-7.621 J-2.874 E.03801
G1 X130.292 Y134.526 E.39201
G3 X129.578 Y134.684 I-2.664 J-10.291 E.03252
G1 X136.685 Y127.578 E.44707
G2 X136.777 Y126.931 I-5.712 J-1.143 E.02907
G1 X128.932 Y134.776 E.49353
G3 X128.331 Y134.822 I-.74 J-5.699 E.02682
G1 X136.821 Y126.332 E.53409
G2 X136.826 Y125.773 I-4.978 J-.32 E.02489
G1 X127.772 Y134.827 E.56955
G3 X127.247 Y134.797 I.005 J-4.687 E.02339
G1 X136.796 Y125.248 E.60071
G1 X136.74 Y124.749 E.02233
G1 X126.749 Y134.74 E.6285
G3 X126.275 Y134.659 I.482 J-4.263 E.0214
G1 X136.659 Y124.275 E.65321
G2 X136.556 Y123.824 I-4.073 J.692 E.02062
G1 X125.822 Y134.557 E.67521
G1 X125.392 Y134.433 E.01993
G1 X136.433 Y123.391 E.69458
G2 X136.293 Y122.977 I-3.759 J1.042 E.01947
G1 X124.976 Y134.294 E.71189
G3 X124.579 Y134.137 I1.199 J-3.621 E.01903
G1 X136.136 Y122.579 E.72706
G2 X135.965 Y122.196 I-3.496 J1.337 E.01868
G1 X124.196 Y133.965 E.74033
G3 X123.827 Y133.778 I1.475 J-3.375 E.01838
G1 X135.779 Y121.827 E.75182
G2 X135.579 Y121.472 I-3.264 J1.597 E.01814
G1 X123.472 Y133.579 E.76162
G1 X123.131 Y133.365 E.01791
G1 X135.364 Y121.132 E.76958
G2 X135.136 Y120.806 I-3.221 J2.017 E.01772
M73 P91 R2
G1 X122.805 Y133.137 E.7757
G3 X122.491 Y132.896 I1.986 J-2.916 E.01761
G1 X134.896 Y120.491 E.78037
G2 X134.644 Y120.188 I-2.821 J2.092 E.01753
G1 X122.189 Y132.643 E.78353
G3 X121.898 Y132.379 I2.206 J-2.72 E.01748
G1 X134.38 Y119.897 E.78523
G1 X134.102 Y119.621 E.01745
G1 X121.62 Y132.103 E.78523
G3 X121.356 Y131.812 I2.458 J-2.491 E.01748
G1 X133.811 Y119.356 E.78353
G2 X133.509 Y119.104 I-2.399 J2.565 E.01753
G1 X121.104 Y131.509 E.78037
G3 X120.864 Y131.195 I2.679 J-2.296 E.01761
G1 X133.195 Y118.863 E.77573
G2 X132.869 Y118.635 I-2.2 J2.789 E.01772
G1 X120.635 Y130.868 E.76958
G1 X120.42 Y130.528 E.01788
G1 X132.527 Y118.421 E.76161
G2 X132.172 Y118.222 I-1.955 J3.061 E.01813
G1 X120.221 Y130.173 E.75182
G3 X120.035 Y129.804 I3.191 J-1.84 E.01838
G1 X131.804 Y118.035 E.74033
G2 X131.421 Y117.863 I-1.723 J3.32 E.01867
G1 X119.864 Y129.421 E.72706
G3 X119.707 Y129.023 I3.467 J-1.593 E.01904
G1 X131.023 Y117.706 E.71188
G2 X130.608 Y117.567 I-1.534 J3.888 E.0195
G1 X119.567 Y128.608 E.69457
G3 X119.444 Y128.176 I3.787 J-1.308 E.01999
G1 X130.177 Y117.443 E.6752
G1 X129.725 Y117.341 E.02065
G1 X119.341 Y127.725 E.6532
G3 X119.26 Y127.251 I3.919 J-.916 E.02138
G1 X129.251 Y117.26 E.62849
G2 X128.753 Y117.203 I-.756 J4.402 E.0223
G1 X119.204 Y126.752 E.6007
G3 X119.174 Y126.227 I18.986 J-1.328 E.0234
G1 X128.227 Y117.175 E.56945
G2 X127.669 Y117.178 I-.254 J4.663 E.02482
G1 X119.179 Y125.668 E.53408
G3 X119.223 Y125.069 I5.352 J.092 E.02672
G1 X127.07 Y117.222 E.49361
G2 X126.422 Y117.316 I.506 J5.815 E.02913
G1 X119.315 Y124.422 E.44706
G3 X119.477 Y123.706 I9.484 J1.765 E.03268
G1 X125.708 Y117.474 E.392
G2 X124.89 Y117.738 I1.936 J7.416 E.03825
G1 X119.736 Y122.892 E.32423
G3 X120.193 Y121.88 I29.476 J12.707 E.04939
G1 X123.883 Y118.19 E.23212
G2 X120.495 Y121.023 I6.865 J11.651 E.19734
G1 X137.213 Y128.363 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.392033
G1 F12000
G2 X121.47 Y132.93 I-9.219 J-2.361 E1.5164
G2 X137.198 Y128.421 I6.525 J-6.925 E.74577
G1 X135.638 Y120.908 F30000
; LINE_WIDTH: 0.392169
G1 F12000
G1 X136.15 Y121.752 E.03739
G3 X127.707 Y116.814 I-8.149 J4.246 E1.79654
G3 X129.76 Y116.979 I.064 J12.02 E.07812
G3 X135.604 Y120.859 I-1.744 J8.97 E.27273
; CHANGE_LAYER
; Z_HEIGHT: 23.16
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X135.322 Y120.446 E-.18998
G1 X135 Y120.045 E-.19534
G1 X134.656 Y119.662 E-.19589
G1 X134.322 Y119.33 E-.17879
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 83/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z23.28 I-1.203 J-.186 P1  F30000
G1 X131.939 Y134.73 Z23.28
G1 Z23.16
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G3 X124.555 Y117.058 I-3.948 J-8.729 E1.36346
G3 X128.542 Y116.436 I3.429 J8.897 E.18089
G3 X131.994 Y134.705 I-.551 J9.565 E1.13061
G1 X132.106 Y135.072 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X132.094 Y135.073 E.00048
G3 X120.964 Y118.959 I-4.094 J-9.073 E1.1364
G1 X120.964 Y118.959 E0
G3 X128.562 Y116.062 I7.02 J7 E.34402
G3 X132.596 Y134.829 I-.562 J9.938 E1.06475
G1 X132.159 Y135.045 E.02001
M204 S10000
; WIPE_START
G1 F24000
G1 X132.094 Y135.073 E-.02698
G1 X131.58 Y135.292 E-.21222
G1 X131.054 Y135.478 E-.21226
G1 X130.517 Y135.635 E-.21225
G1 X130.27 Y135.692 E-.09629
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.56 I.925 J.791 P1  F30000
G1 X137.03 Y127.789 Z23.56
G1 Z23.16
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.412607
G1 F12000
G1 X137.179 Y126.774 E.04126
G2 X136.598 Y122.71 I-9.178 J-.761 E.16648
G1 X136.184 Y121.771 E.04126
M73 P91 R1
G2 X121.664 Y119.321 I-8.18 J4.229 E.6862
G1 X120.962 Y120.058 E.04095
G2 X126.211 Y135.03 I7.04 J5.939 E.76891
G1 X127.226 Y135.179 E.04126
G2 X137.017 Y127.847 I.768 J-9.178 E.53798
G1 X127.228 Y117.182 F30000
; LINE_WIDTH: 0.411546
G1 F12000
G3 X129.204 Y117.22 I.803 J9.599 E.07936
G3 X130.71 Y117.563 I-1.815 J11.437 E.06198
G1 X131.586 Y117.895 E.03757
G3 X133.299 Y118.896 I-4.444 J9.573 E.07968
G3 X134.747 Y120.254 I-6.461 J8.343 E.07969
G3 X135.857 Y121.899 I-8.155 J6.696 E.07969
G3 X136.728 Y127.495 I-7.968 J4.106 E.23101
G3 X131.182 Y134.272 I-8.767 J-1.516 E.36712
G1 X130.25 Y134.572 E.03926
G3 X128.286 Y134.858 I-2.538 J-10.561 E.07968
G3 X119.14 Y125.789 I-.264 J-8.881 E.57768
G3 X119.409 Y123.823 I10.851 J.485 E.07968
G3 X120.109 Y121.966 I10.157 J2.767 E.07969
G3 X121.205 Y120.311 I9.308 J4.972 E.07969
G3 X125.285 Y117.574 I6.825 J5.766 E.19958
G1 X125.764 Y117.424 E.02012
G1 X126.724 Y117.23 E.03926
G1 X127.169 Y117.187 E.01791
G1 X135.239 Y121.236 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X132.292 Y118.672 I-10.309 J8.873 E.17438
G1 X131.904 Y118.458 E.01972
G1 X135.542 Y122.097 E.2289
G3 X135.975 Y123.088 I-8.24 J4.188 E.04812
G1 X130.911 Y118.024 E.31858
G1 X130.597 Y117.915 E.01476
G2 X130.099 Y117.771 I-1.535 J4.362 E.02307
G1 X136.228 Y123.899 E.38551
G3 X136.374 Y124.604 I-6.538 J1.726 E.03203
G1 X129.396 Y117.626 E.43894
G2 X128.761 Y117.55 I-.857 J4.431 E.02847
G1 X136.459 Y125.247 E.48423
G3 X136.489 Y125.835 I-15.099 J1.064 E.0262
G1 X128.173 Y117.519 E.52316
G1 X127.614 Y117.519 E.02485
G1 X136.481 Y126.386 E.5578
G3 X136.441 Y126.904 I-4.637 J-.095 E.02315
G1 X127.096 Y117.559 E.58791
G2 X126.605 Y117.626 I.354 J4.404 E.02206
G1 X136.374 Y127.395 E.61457
G3 X136.283 Y127.862 I-4.204 J-.58 E.02118
G1 X126.138 Y117.717 E.6382
G2 X125.692 Y117.83 I.782 J4.023 E.02045
G1 X136.17 Y128.308 E.65912
G3 X136.037 Y128.734 I-3.858 J-.965 E.01985
G1 X125.266 Y117.962 E.6776
G2 X124.858 Y118.112 I1.132 J3.711 E.01936
G1 X135.887 Y129.142 E.69383
G3 X135.72 Y129.533 I-3.57 J-1.289 E.01894
G1 X124.466 Y118.279 E.70799
G1 X124.09 Y118.461 E.01858
G1 X135.538 Y129.909 E.72018
G1 X135.341 Y130.27 E.01829
G1 X123.731 Y118.66 E.73033
G2 X123.386 Y118.873 I1.725 J3.18 E.01805
G1 X135.127 Y130.615 E.73861
G3 X134.9 Y130.946 I-3.063 J-1.855 E.01787
G1 X123.054 Y119.1 E.7452
G2 X122.735 Y119.34 I1.975 J2.957 E.01774
G1 X134.66 Y131.264 E.75015
G3 X134.407 Y131.57 I-2.847 J-2.097 E.01765
G1 X122.43 Y119.592 E.75349
G2 X122.136 Y119.857 I2.213 J2.746 E.01759
G1 X134.142 Y131.863 E.75526
G1 X133.864 Y132.143 E.01756
G1 X121.858 Y120.137 E.75526
G2 X121.593 Y120.43 I2.476 J2.508 E.01759
G1 X133.57 Y132.408 E.75349
G3 X133.264 Y132.66 I-2.4 J-2.597 E.01765
G1 X121.34 Y120.736 E.75014
G2 X121.1 Y121.054 I2.714 J2.296 E.01774
G1 X132.946 Y132.9 E.7452
G3 X132.614 Y133.127 I-2.184 J-2.84 E.01788
G1 X120.873 Y121.385 E.73861
G2 X120.659 Y121.73 I2.962 J2.073 E.01805
G1 X132.269 Y133.34 E.73033
G3 X131.91 Y133.539 I-1.951 J-3.096 E.01828
G1 X120.462 Y122.091 E.72017
G2 X120.279 Y122.467 I3.258 J1.81 E.0186
G1 X131.534 Y133.721 E.70799
G3 X131.142 Y133.888 I-1.678 J-3.406 E.01895
G1 X120.113 Y122.858 E.69383
G2 X119.963 Y123.266 I3.559 J1.542 E.01935
G1 X130.734 Y134.038 E.67759
G3 X130.308 Y134.17 I-1.39 J-3.727 E.01985
G1 X119.83 Y123.692 E.65912
G2 X119.717 Y124.138 I3.91 J1.228 E.02045
G1 X129.862 Y134.283 E.63819
G3 X129.395 Y134.374 I-1.148 J-4.632 E.02117
G1 X119.626 Y124.605 E.61456
G2 X119.559 Y125.096 I4.338 J.844 E.02206
G1 X128.904 Y134.441 E.5879
G3 X128.386 Y134.481 I-.615 J-4.595 E.02314
G1 X119.519 Y125.614 E.5578
G2 X119.511 Y126.165 I4.895 J.347 E.02449
G1 X127.836 Y134.49 E.52372
G3 X127.246 Y134.458 I.449 J-13.581 E.02632
G1 X119.541 Y126.753 E.48467
G2 X119.626 Y127.396 I5.77 J-.435 E.02888
G1 X126.603 Y134.374 E.43893
G3 X125.9 Y134.229 I2.147 J-12.21 E.03193
G1 X119.772 Y128.101 E.38549
G2 X120.025 Y128.912 I9.847 J-2.623 E.0378
G1 X125.089 Y133.976 E.31856
G3 X124.096 Y133.541 I10.411 J-25.136 E.04821
G1 X120.474 Y129.92 E.22784
G1 X120.56 Y130.089 E.00843
G2 X123.239 Y133.243 I11.268 J-6.857 E.18486
; CHANGE_LAYER
; Z_HEIGHT: 23.44
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X121.838 Y131.815 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 84/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L84
M991 S0 P83 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z23.56 I-.311 J1.177 P1  F30000
G1 X131.813 Y134.451 Z23.56
G1 Z23.44
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G3 X127.191 Y116.758 I-3.822 J-8.452 E1.43579
G3 X128.269 Y116.728 I.793 J8.988 E.04796
G3 X131.868 Y134.426 I-.277 J9.271 E1.106
G1 X131.975 Y134.795 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X131.967 Y134.793 E.00032
G3 X127.159 Y116.385 I-3.976 J-8.794 E1.3789
G3 X128.279 Y116.353 I.825 J9.344 E.04603
G3 X132.454 Y134.556 I-.287 J9.646 E1.04258
G1 X132.029 Y134.769 E.01953
M204 S10000
; WIPE_START
G1 F24000
G1 X131.967 Y134.793 E-.02496
G1 X131.47 Y135.007 E-.20569
G1 X130.96 Y135.187 E-.20573
G1 X130.44 Y135.339 E-.20574
G1 X130.138 Y135.409 E-.11788
; WIPE_END
G1 E-.04 F1800
G17
G3 Z23.84 I.874 J.847 P1  F30000
G1 X132.525 Y132.944 Z23.84
G1 Z23.44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11541.081
G2 X135.003 Y130.101 I-8.527 J-9.933 E.16832
G2 X135.235 Y129.675 I-3.679 J-2.278 E.0216
G1 X131.677 Y133.232 E.22378
G3 X130.701 Y133.649 I-3.783 J-7.507 E.04726
G1 X135.65 Y128.701 E.31131
G2 X135.887 Y127.904 I-8.183 J-2.868 E.03698
G1 X129.905 Y133.886 E.37628
G3 X129.208 Y134.024 I-1.579 J-6.142 E.03165
G1 X136.023 Y127.209 E.42872
G2 X136.093 Y126.579 I-9.95 J-1.429 E.02819
G1 X128.58 Y134.092 E.47263
G3 X128 Y134.112 I-.469 J-5.151 E.02581
G1 X136.112 Y126 E.51031
G2 X136.094 Y125.459 I-4.831 J-.111 E.02412
G1 X127.458 Y134.095 E.54329
G3 X126.948 Y134.046 I.185 J-4.567 E.02281
G1 X136.045 Y124.949 E.57225
G2 X135.967 Y124.467 I-4.333 J.447 E.02173
G1 X126.466 Y133.968 E.59774
G3 X126.008 Y133.867 I.676 J-4.128 E.02087
G1 X135.866 Y124.009 E.62014
G2 X135.742 Y123.573 I-3.943 J.881 E.02017
G1 X125.572 Y133.743 E.6398
G3 X125.156 Y133.6 I1.068 J-3.773 E.01959
G1 X135.599 Y123.157 E.65696
G2 X135.438 Y122.759 I-3.624 J1.239 E.01911
G1 X124.758 Y133.438 E.67183
G3 X124.377 Y133.26 I1.4 J-3.479 E.01872
G1 X135.259 Y122.378 E.68456
G2 X135.065 Y122.012 I-4.955 J2.404 E.0184
G1 X124.012 Y133.065 E.69529
G3 X123.662 Y132.855 I1.693 J-3.22 E.01815
G1 X134.855 Y121.662 E.70411
G2 X134.631 Y121.327 I-3.099 J1.826 E.01795
G1 X123.327 Y132.631 E.71112
G3 X123.006 Y132.393 I1.96 J-2.979 E.0178
G1 X134.393 Y121.005 E.71636
G2 X134.142 Y120.698 I-2.867 J2.087 E.0177
G1 X122.698 Y132.141 E.71988
G3 X122.404 Y131.876 I2.215 J-2.752 E.01763
G1 X133.877 Y120.403 E.7217
G1 X133.596 Y120.124 E.0176
G1 X122.123 Y131.597 E.7217
G1 X121.858 Y131.302 E.01762
G1 X133.302 Y119.859 E.71988
G2 X132.994 Y119.607 I-2.396 J2.613 E.01769
G1 X121.607 Y130.995 E.71636
G3 X121.369 Y130.673 I2.744 J-2.28 E.0178
G1 X132.673 Y119.369 E.71112
G2 X132.338 Y119.145 I-2.164 J2.874 E.01795
G1 X121.145 Y130.338 E.70411
G3 X120.935 Y129.988 I3.012 J-2.04 E.01815
G1 X131.988 Y118.935 E.69529
G2 X131.623 Y118.74 I-1.915 J3.152 E.0184
G1 X120.741 Y129.622 E.68456
G3 X120.562 Y129.241 I3.303 J-1.779 E.01873
G1 X131.242 Y118.562 E.67183
G2 X130.844 Y118.4 I-1.638 J3.462 E.01911
M73 P92 R1
G1 X120.401 Y128.843 E.65696
G3 X120.258 Y128.427 I3.633 J-1.483 E.01959
G1 X130.428 Y118.257 E.6398
G2 X129.992 Y118.133 I-1.317 J3.819 E.02017
G1 X120.134 Y127.991 E.62014
G3 X120.033 Y127.533 I4.026 J-1.134 E.02087
G1 X129.534 Y118.032 E.59773
G2 X129.052 Y117.954 I-.928 J4.256 E.02174
G1 X119.955 Y127.051 E.57225
G1 X119.931 Y126.843 E.0093
G3 X119.906 Y126.541 I2.677 J-.379 E.01349
G1 X128.52 Y117.904 E.54263
G2 X128 Y117.888 I-.404 J4.623 E.02316
G1 X119.888 Y126 E.51031
G3 X119.907 Y125.421 I5.163 J-.117 E.02578
G1 X127.42 Y117.908 E.47263
G2 X126.792 Y117.976 I.822 J10.476 E.02809
G1 X119.977 Y124.791 E.42872
G3 X120.113 Y124.096 I6.261 J.864 E.03155
G1 X126.095 Y118.114 E.37627
G2 X125.299 Y118.351 I1.953 J8.035 E.03694
G1 X120.35 Y123.299 E.3113
G3 X120.765 Y122.325 I8.148 J2.894 E.04714
G1 X124.322 Y118.768 E.22376
G2 X121.053 Y121.477 I6.098 J10.684 E.18982
G1 X128.708 Y117.15 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.447329
G1 F11620.69
G1 X128.208 Y117.115 E.02218
G1 X127.252 Y117.143 E.04222
G2 X119.695 Y122.859 I.756 J8.853 E.44149
G1 X119.394 Y123.78 E.04282
G2 X124.859 Y134.305 I8.601 J2.215 E.57365
G1 X125.78 Y134.606 E.04282
G2 X136.305 Y129.141 I2.216 J-8.599 E.57367
G1 X136.606 Y128.22 E.04281
G2 X128.768 Y117.155 I-8.601 J-2.216 E.68155
G1 X136.091 Y128.583 F30000
; LINE_WIDTH: 0.44776
G1 F11607.778
G1 X135.761 Y129.45 E.041
G1 X135.33 Y130.294 E.04194
G1 X134.815 Y131.086 E.04176
G1 X134.204 Y131.814 E.04205
G1 X133.514 Y132.472 E.04217
G1 X132.755 Y133.049 E.04217
G3 X125.417 Y134.091 I-4.75 J-7.095 E.33908
G1 X124.55 Y133.761 E.041
G1 X123.706 Y133.33 E.04194
G1 X122.914 Y132.815 E.04176
G1 X122.186 Y132.204 E.04205
G1 X121.528 Y131.514 E.04217
G1 X120.951 Y130.755 E.04217
G3 X119.909 Y123.417 I7.095 J-4.75 E.33908
G1 X120.239 Y122.55 E.041
G1 X120.671 Y121.707 E.04189
G1 X121.198 Y120.914 E.04213
G1 X121.81 Y120.184 E.04212
G1 X122.5 Y119.528 E.04213
G1 X123.259 Y118.953 E.04212
G1 X124.078 Y118.466 E.04212
G1 X124.946 Y118.074 E.04212
G1 X125.853 Y117.782 E.04213
G1 X126.786 Y117.594 E.04212
G3 X128.237 Y117.501 I1.412 J10.674 E.06435
G3 X130.094 Y117.769 I-.396 J9.312 E.08309
G1 X130.576 Y117.897 E.02206
G1 X131.439 Y118.224 E.04082
G1 X132.288 Y118.657 E.04216
G1 X133.083 Y119.184 E.04217
G1 X133.814 Y119.796 E.04217
G1 X134.473 Y120.486 E.04217
G1 X135.049 Y121.245 E.04217
G3 X136.243 Y128.088 I-7.148 J4.773 E.31623
G1 X136.108 Y128.526 E.02027
; CHANGE_LAYER
; Z_HEIGHT: 23.72
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X136.243 Y128.088 E-.17415
G1 X136.425 Y127.152 E-.36236
G1 X136.471 Y126.565 E-.22349
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 85/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L85
M991 S0 P84 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z23.84 I-1.028 J-.651 P1  F30000
G1 X131.675 Y134.144 Z23.84
G1 Z23.72
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11345
G3 X125.258 Y117.49 I-3.684 J-8.144 E1.29445
G3 X128.518 Y117.078 I2.745 J8.612 E.14696
G3 X131.729 Y134.119 I-.527 J8.923 E1.05401
G1 X131.825 Y134.494 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F11345
G1 X131.348 Y134.689 E.02116
G3 X125.143 Y117.133 I-3.357 J-8.687 E1.22362
G3 X128.538 Y116.704 I2.86 J8.973 E.14127
G3 X131.876 Y134.465 I-.547 J9.298 E1.01431
M204 S10000
; WIPE_START
G1 F24000
G1 X131.348 Y134.689 E-.21807
G1 X130.857 Y134.867 E-.19853
G1 X130.355 Y135.013 E-.19856
G1 X129.984 Y135.099 E-.14483
; WIPE_END
G1 E-.04 F1800
G17
G3 Z24.12 I.446 J-1.132 P1  F30000
G1 X123.727 Y132.632 Z24.12
G1 Z23.72
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F11345
G3 X121.098 Y129.444 I7.564 J-8.916 E.18479
G1 X124.558 Y132.904 E.21765
G2 X125.516 Y133.302 I3.536 J-7.147 E.04617
G1 X120.697 Y128.484 E.3031
G3 X120.478 Y127.705 I7.563 J-2.552 E.03601
G1 X126.295 Y133.522 E.36594
G2 X126.979 Y133.647 I2.055 J-9.304 E.03095
G1 X120.354 Y127.022 E.41679
G3 X120.298 Y126.406 I5.451 J-.808 E.02751
G1 X127.593 Y133.702 E.45896
G2 X128.163 Y133.713 I.376 J-5.065 E.02535
G1 X120.286 Y125.836 E.49549
G3 X120.317 Y125.307 I13.227 J.493 E.02357
G1 X128.694 Y133.684 E.52698
G2 X129.19 Y133.622 I-.309 J-4.453 E.02228
G1 X120.379 Y124.81 E.55431
G3 X120.468 Y124.34 I4.232 J.555 E.02131
G1 X129.661 Y133.533 E.57829
G2 X130.107 Y133.42 I-.78 J-4.031 E.02049
G1 X120.58 Y123.893 E.5993
G3 X120.714 Y123.468 I3.851 J.981 E.01984
G1 X130.532 Y133.286 E.6176
G2 X130.938 Y133.132 I-1.167 J-3.686 E.0193
G1 X120.868 Y123.063 E.63343
G3 X121.04 Y122.675 I3.533 J1.338 E.01886
G1 X131.325 Y132.96 E.64696
G2 X131.695 Y132.771 I-1.498 J-3.389 E.0185
G1 X121.23 Y122.305 E.65835
G3 X121.435 Y121.951 I3.254 J1.652 E.01821
G1 X132.049 Y132.565 E.66769
G2 X132.387 Y132.345 I-1.796 J-3.124 E.01798
G1 X121.656 Y121.613 E.67509
G3 X121.892 Y121.29 I2.997 J1.938 E.01781
G1 X132.711 Y132.109 E.68061
G2 X133.02 Y131.859 I-2.073 J-2.876 E.0177
G1 X122.142 Y120.981 E.6843
G3 X122.407 Y120.686 I2.754 J2.21 E.01762
G1 X133.314 Y131.594 E.68617
G2 X133.593 Y131.314 I-2.358 J-2.626 E.0176
G1 X122.686 Y120.406 E.68617
G1 X122.98 Y120.141 E.01761
G1 X133.858 Y131.019 E.6843
G2 X134.108 Y130.71 I-2.625 J-2.384 E.01769
G1 X123.289 Y119.891 E.68061
G3 X123.613 Y119.655 I2.261 J2.763 E.01781
G1 X134.344 Y130.387 E.67509
G2 X134.565 Y130.049 I-2.903 J-2.136 E.01798
G1 X123.951 Y119.435 E.6677
G3 X124.305 Y119.229 I2.005 J3.05 E.01821
G1 X134.77 Y129.695 E.65835
G2 X134.96 Y129.325 I-3.2 J-1.869 E.0185
G1 X124.675 Y119.04 E.64696
G3 X125.062 Y118.868 I1.725 J3.362 E.01886
G1 X135.132 Y128.938 E.63343
G2 X135.285 Y128.532 I-3.533 J-1.572 E.0193
G1 X125.468 Y118.714 E.6176
G3 X125.893 Y118.58 I1.408 J3.719 E.01984
G1 X135.42 Y128.107 E.5993
G2 X135.532 Y127.66 I-3.92 J-1.226 E.0205
G1 X126.339 Y118.468 E.5783
G3 X126.809 Y118.378 I1.028 J4.141 E.0213
G1 X135.621 Y127.19 E.55431
G2 X135.683 Y126.693 I-4.394 J-.802 E.02229
G1 X127.306 Y118.316 E.52698
G3 X127.837 Y118.287 I.979 J13.342 E.02365
G1 X135.714 Y126.164 E.49549
G2 X135.702 Y125.594 I-5.083 J-.186 E.02539
G1 X128.406 Y118.298 E.45897
G3 X129.021 Y118.353 I-.182 J5.495 E.02744
G1 X135.646 Y124.978 E.4168
G2 X135.522 Y124.295 I-8.421 J1.175 E.03089
G1 X129.705 Y118.478 E.36596
G3 X130.484 Y118.698 I-1.718 J7.571 E.03604
G1 X135.303 Y123.516 E.30312
G2 X134.902 Y122.557 I-7.511 J2.571 E.04629
G1 X131.442 Y119.096 E.21768
G1 X131.52 Y119.134 E.00386
G3 X134.63 Y121.726 I-5.874 J10.211 E.18099
G1 X120.917 Y130.733 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.475624
G1 F10829.395
G1 X121.199 Y131.154 E.02404
G1 X121.81 Y131.873 E.0447
G2 X123.711 Y133.369 I6.69 J-6.545 E.11501
G2 X124.982 Y133.982 I5.102 J-8.955 E.06694
G2 X127.333 Y134.5 I3.2 J-8.925 E.11444
G2 X128.744 Y134.501 I.712 J-10.282 E.06694
G2 X131.087 Y133.948 I-.989 J-9.43 E.11444
G2 X132.359 Y133.337 I-3.82 J-9.572 E.06694
G2 X134.23 Y131.821 I-4.983 J-8.067 E.11444
G2 X135.11 Y130.719 I-7.594 J-6.966 E.06694
G2 X136.139 Y128.542 I-7.989 J-5.106 E.11444
G2 X136.453 Y127.167 I-9.865 J-2.982 E.06694
G2 X136.436 Y124.759 I-9.413 J-1.134 E.11444
G2 X136.122 Y123.383 I-10.182 J1.594 E.06694
G2 X134.821 Y120.869 I-9.05 J3.091 E.13472
G1 X134.208 Y120.143 E.04504
G1 X133.513 Y119.484 E.04537
G1 X132.749 Y118.908 E.04537
G1 X131.925 Y118.421 E.04537
G1 X131.052 Y118.029 E.04537
G1 X130.14 Y117.738 E.04537
G1 X129.201 Y117.55 E.04537
G1 X128.51 Y117.483 E.03294
G1 X127.299 Y117.495 E.05739
G1 X126.343 Y117.627 E.04574
G1 X125.416 Y117.866 E.04537
G1 X124.522 Y118.206 E.04537
G1 X123.671 Y118.644 E.04537
G1 X122.875 Y119.175 E.04537
G1 X122.143 Y119.792 E.04537
G1 X121.484 Y120.487 E.04537
G1 X120.908 Y121.251 E.04537
G1 X120.421 Y122.075 E.04537
G1 X120.029 Y122.948 E.04537
G1 X119.738 Y123.86 E.04537
G1 X119.55 Y124.799 E.04537
G2 X119.466 Y125.799 I13.975 J1.673 E.04759
G1 X119.495 Y126.709 E.04316
G2 X120.885 Y130.682 I8.533 J-.758 E.2016
G1 X120.281 Y128.487 F30000
; LINE_WIDTH: 0.473783
G1 F10877.598
G1 X120.044 Y127.605 E.0431
G1 X119.913 Y126.718 E.04229
G1 X119.883 Y125.809 E.04293
G1 X119.956 Y124.902 E.04297
G1 X120.129 Y124.008 E.04297
G1 X120.402 Y123.139 E.04297
G1 X120.77 Y122.306 E.04297
G1 X121.229 Y121.52 E.04297
G1 X121.773 Y120.79 E.04297
G1 X122.395 Y120.126 E.04297
G1 X123.088 Y119.535 E.04297
G1 X123.843 Y119.026 E.04297
G1 X124.65 Y118.604 E.04297
G1 X125.499 Y118.276 E.04297
G1 X126.38 Y118.044 E.04297
G1 X127.281 Y117.913 E.04297
G1 X128.305 Y117.892 E.04837
G1 X129.099 Y117.956 E.03758
G1 X129.992 Y118.129 E.04293
G1 X130.861 Y118.402 E.04297
G1 X131.694 Y118.77 E.04297
G1 X132.48 Y119.229 E.04297
G1 X133.21 Y119.773 E.04297
G1 X133.874 Y120.395 E.04297
G1 X134.465 Y121.088 E.04297
G3 X136.09 Y126.645 I-6.644 J4.96 E.27914
G1 X135.967 Y127.547 E.04295
G1 X135.744 Y128.43 E.04295
G1 X135.423 Y129.281 E.04296
G1 X135.009 Y130.092 E.04295
G1 X134.507 Y130.851 E.04295
G1 X133.923 Y131.549 E.04296
G1 X133.264 Y132.177 E.04295
G1 X132.54 Y132.728 E.04296
G1 X131.758 Y133.194 E.04295
G1 X130.929 Y133.569 E.04295
G1 X130.063 Y133.85 E.04295
G1 X129.171 Y134.031 E.04295
G1 X128.264 Y134.112 E.04295
G1 X127.355 Y134.09 E.04296
G1 X126.453 Y133.967 E.04295
G1 X125.57 Y133.744 E.04295
G1 X124.719 Y133.423 E.04296
G1 X123.908 Y133.009 E.04295
G1 X123.149 Y132.507 E.04295
G1 X122.451 Y131.923 E.04295
G1 X121.823 Y131.264 E.04295
G1 X121.274 Y130.538 E.04296
G3 X120.302 Y128.543 I7.247 J-4.764 E.10503
; CHANGE_LAYER
; Z_HEIGHT: 24
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X120.608 Y129.336 E-.32313
G1 X120.885 Y129.898 E-.23792
G1 X121.157 Y130.345 E-.19895
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 86/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L86
M991 S0 P85 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z24.12 I-.389 J1.153 P1  F30000
G1 X131.524 Y133.838 Z24.12
G1 Z24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F10313
G1 X131.088 Y134.015 E.02092
G3 X126.772 Y117.494 I-3.095 J-8.016 E1.28709
G3 X128.263 Y117.411 I1.214 J8.389 E.0665
G3 X131.575 Y133.809 I-.27 J8.588 E1.02434
G1 X131.668 Y134.184 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F10313
G1 X131.224 Y134.367 E.01974
G3 X129.719 Y134.801 I-3.23 J-8.371 E.0644
G1 X129.719 Y134.801 E0
G3 X119.199 Y127.719 I-1.715 J-8.807 E.5783
G1 X119.199 Y127.719 E0
G3 X128.283 Y117.037 I8.801 J-1.719 E.66101
G3 X136.801 Y124.281 I-.289 J8.971 E.49568
G1 X136.801 Y124.281 E0
G3 X131.722 Y134.158 I-8.807 J1.715 E.4917
M204 S10000
; WIPE_START
G1 F24000
G1 X131.224 Y134.367 E-.20546
G1 X130.75 Y134.537 E-.19117
G1 X130.267 Y134.678 E-.19117
G1 X129.825 Y134.777 E-.17221
; WIPE_END
G1 E-.04 F1800
G1 X132.01 Y132.295 Z24.4 F30000
G1 Z24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F10313
G2 X134.549 Y129.199 I-7.096 J-8.408 E.17908
G1 X131.2 Y132.548 E.21069
G3 X130.26 Y132.932 I-3.373 J-6.933 E.04519
G1 X134.93 Y128.261 E.2938
G2 X135.133 Y127.501 I-7.758 J-2.477 E.035
G1 X129.5 Y133.134 E.35432
G3 X128.837 Y133.24 I-1.647 J-8.152 E.0299
G1 X135.24 Y126.837 E.40282
G2 X135.286 Y126.234 I-5.344 J-.71 E.02691
G1 X128.233 Y133.287 E.44372
G3 X127.681 Y133.282 I-.158 J-11.502 E.02453
G1 X135.282 Y125.681 E.47816
G2 X135.241 Y125.166 I-4.608 J.114 E.02301
G1 X127.165 Y133.241 E.50798
G3 X126.68 Y133.169 I.395 J-4.358 E.02184
G1 X135.168 Y124.681 E.53398
G2 X135.07 Y124.222 I-4.129 J.65 E.02086
G1 X126.221 Y133.07 E.55661
G3 X125.788 Y132.947 I5.702 J-20.855 E.02005
G1 X134.947 Y123.788 E.57617
G2 X134.802 Y123.375 I-29.739 J10.187 E.01944
G1 X125.376 Y132.802 E.59297
G3 X124.984 Y132.637 I1.273 J-3.574 E.01893
G1 X134.637 Y122.983 E.60726
G2 X134.454 Y122.609 I-3.421 J1.444 E.01853
G1 X124.61 Y132.454 E.61926
G3 X124.253 Y132.253 I1.605 J-3.276 E.01821
G1 X134.254 Y122.253 E.6291
G2 X134.037 Y121.912 I-3.141 J1.762 E.01796
G1 X123.913 Y132.036 E.63687
G3 X123.589 Y131.804 I1.909 J-3.005 E.01777
G1 X133.805 Y121.588 E.64264
G1 X133.557 Y121.279 E.01763
G1 X123.28 Y131.556 E.64648
G3 X122.986 Y131.293 I2.197 J-2.748 E.01756
G1 X133.293 Y120.986 E.64837
G2 X133.014 Y120.707 I-2.615 J2.342 E.01753
G1 X122.707 Y131.014 E.64837
G1 X122.443 Y130.721 E.01755
G1 X132.72 Y120.444 E.64648
G1 X132.411 Y120.196 E.01763
G1 X122.195 Y130.412 E.64264
G3 X121.963 Y130.087 I2.773 J-2.233 E.01777
G1 X132.087 Y119.964 E.63687
G2 X131.746 Y119.747 I-2.101 J2.922 E.01796
G1 X121.746 Y129.747 E.62909
G3 X121.546 Y129.39 I3.077 J-1.963 E.01821
G1 X131.39 Y119.546 E.61926
G2 X131.016 Y119.363 I-1.817 J3.237 E.01853
G1 X121.363 Y129.017 E.60726
G3 X121.198 Y128.625 I3.411 J-1.666 E.01893
G1 X130.624 Y119.198 E.59297
G2 X130.212 Y119.053 I-1.502 J3.595 E.01943
G1 X121.053 Y128.212 E.57617
G3 X120.93 Y127.778 I3.805 J-1.309 E.02009
G1 X129.778 Y118.929 E.55661
G2 X129.32 Y118.831 I-1.106 J4.033 E.02087
G1 X120.832 Y127.319 E.53398
G3 X120.759 Y126.834 I4.281 J-.884 E.02182
G1 X128.834 Y118.759 E.50798
G2 X128.319 Y118.718 I-.647 J4.859 E.02303
G1 X120.718 Y126.319 E.47815
G3 X120.714 Y125.766 I9.59 J-.345 E.02461
G1 X127.767 Y118.713 E.44371
G2 X127.163 Y118.76 I.118 J5.404 E.02698
G1 X120.76 Y125.163 E.40281
G3 X120.867 Y124.498 I7.672 J.901 E.02996
G1 X126.499 Y118.866 E.35431
G2 X125.74 Y119.068 I2.045 J9.202 E.03496
G1 X121.07 Y123.739 E.29379
G3 X121.451 Y122.8 I7.211 J2.383 E.04507
G1 X124.8 Y119.452 E.21067
G2 X121.704 Y121.99 I5.377 J9.714 E.17906
G1 X130.507 Y118.228 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.516089
G1 F9868.414
G1 X130.018 Y118.082 E.02651
G1 X129.155 Y117.913 E.04578
G1 X128.264 Y117.835 E.04652
G1 X127.327 Y117.859 E.04873
G1 X126.419 Y117.986 E.0477
G1 X125.532 Y118.213 E.04765
G1 X124.675 Y118.538 E.04766
G1 X123.861 Y118.958 E.04766
G1 X123.098 Y119.465 E.04765
G1 X122.397 Y120.055 E.04766
G1 X121.767 Y120.72 E.04765
G1 X121.215 Y121.451 E.04765
G1 X120.748 Y122.239 E.04766
G1 X120.373 Y123.075 E.04766
G1 X120.093 Y123.947 E.04765
G1 X119.913 Y124.845 E.04766
G2 X119.832 Y125.809 I13.238 J1.597 E.05032
G1 X119.859 Y126.674 E.045
G1 X119.982 Y127.56 E.04653
G1 X120.213 Y128.467 E.04873
G1 X120.538 Y129.325 E.0477
G1 X120.958 Y130.139 E.04765
G1 X121.465 Y130.902 E.04766
G1 X122.055 Y131.603 E.04766
G1 X122.72 Y132.233 E.04766
G1 X123.451 Y132.785 E.04765
G1 X124.239 Y133.252 E.04766
G1 X125.075 Y133.627 E.04765
G1 X125.947 Y133.907 E.04766
G1 X126.845 Y134.087 E.04766
G1 X127.758 Y134.165 E.04765
G1 X128.674 Y134.141 E.04765
G1 X129.56 Y134.018 E.04653
G1 X130.467 Y133.787 E.04873
G1 X131.325 Y133.462 E.0477
G1 X132.139 Y133.042 E.04765
G1 X132.902 Y132.535 E.04765
G1 X133.603 Y131.945 E.04766
G1 X134.233 Y131.28 E.04766
G1 X134.785 Y130.549 E.04765
G1 X135.252 Y129.761 E.04766
G1 X135.627 Y128.925 E.04766
G1 X135.907 Y128.053 E.04765
M73 P93 R1
G1 X136.087 Y127.155 E.04766
G1 X136.165 Y126.242 E.04765
G1 X136.141 Y125.326 E.04765
G1 X136.018 Y124.44 E.04653
G1 X135.787 Y123.533 E.04873
G1 X135.462 Y122.675 E.0477
G1 X135.042 Y121.861 E.04765
G1 X134.535 Y121.098 E.04766
G1 X133.945 Y120.397 E.04765
G1 X133.28 Y119.767 E.04765
G1 X132.562 Y119.223 E.04687
G1 X132.13 Y118.953 E.0265
G1 X131.324 Y118.54 E.0471
G1 X130.563 Y118.249 E.0424
G1 X131.507 Y119.132 F30000
; LINE_WIDTH: 0.515436
G1 F9882.552
G1 X132.255 Y119.566 E.04492
G1 X132.949 Y120.083 E.04494
G1 X133.58 Y120.674 E.04494
G1 X134.141 Y121.332 E.04494
G1 X134.625 Y122.049 E.04494
G1 X135.026 Y122.816 E.04493
G1 X135.338 Y123.622 E.04494
G3 X135.712 Y126.18 I-8.333 J2.523 E.13474
G1 X135.643 Y127.042 E.04493
G1 X135.478 Y127.891 E.04494
G1 X135.22 Y128.716 E.04494
G1 X134.87 Y129.508 E.04494
G1 X134.434 Y130.255 E.04494
G1 X133.917 Y130.949 E.04493
G1 X133.326 Y131.58 E.04494
G1 X132.668 Y132.141 E.04494
G1 X131.951 Y132.625 E.04494
G1 X131.184 Y133.026 E.04494
G1 X130.378 Y133.338 E.04494
G3 X127.82 Y133.712 I-2.523 J-8.334 E.13474
G1 X126.958 Y133.643 E.04493
G1 X126.109 Y133.478 E.04494
G1 X125.284 Y133.22 E.04494
G1 X124.492 Y132.87 E.04494
G1 X123.745 Y132.434 E.04494
G1 X123.051 Y131.917 E.04493
G1 X122.42 Y131.326 E.04494
G1 X121.859 Y130.668 E.04494
G1 X121.375 Y129.951 E.04494
G1 X120.974 Y129.184 E.04494
G1 X120.662 Y128.378 E.04494
G3 X120.288 Y125.82 I8.334 J-2.523 E.13474
G1 X120.357 Y124.958 E.04493
G1 X120.522 Y124.109 E.04494
G1 X120.78 Y123.284 E.04494
G1 X121.13 Y122.492 E.04494
G1 X121.566 Y121.745 E.04494
G1 X122.083 Y121.051 E.04494
G1 X122.674 Y120.42 E.04493
G1 X123.332 Y119.859 E.04494
G1 X124.049 Y119.375 E.04494
G1 X124.816 Y118.974 E.04494
G1 X125.622 Y118.662 E.04494
G1 X126.459 Y118.442 E.04493
G1 X127.315 Y118.317 E.04494
G3 X129.891 Y118.522 I.605 J8.686 E.13474
G1 X130.716 Y118.783 E.04493
G1 X131.452 Y119.108 E.0418
; CHANGE_LAYER
; Z_HEIGHT: 24.28
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X130.716 Y118.783 E-.3058
G1 X129.891 Y118.522 E-.3287
G1 X129.567 Y118.459 E-.12551
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 87/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L87
M991 S0 P86 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z24.4 I-1.208 J.144 P1  F30000
G1 X131.354 Y133.5 Z24.4
G1 Z24.28
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F9219
G1 X130.952 Y133.662 E.01926
G3 X125.923 Y118.05 I-2.961 J-7.662 E1.18967
G3 X128.525 Y117.803 I2.063 J7.887 E.11679
G3 X131.406 Y133.471 I-.534 J8.197 E.96754
G1 X131.498 Y133.846 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F9219
G1 X131.088 Y134.014 E.01821
G3 X123.377 Y133.238 I-3.088 J-8.016 E.33014
G1 X123.377 Y133.238 E0
G3 X128.545 Y117.428 I4.624 J-7.238 E.92982
G3 X135.238 Y130.623 I-.553 J8.576 E.73177
G1 X135.238 Y130.623 E0
G3 X131.552 Y133.82 I-7.239 J-4.625 E.20313
M204 S10000
; WIPE_START
G1 F24000
G1 X131.088 Y134.014 E-.19124
G1 X130.635 Y134.178 E-.18312
G1 X130.172 Y134.313 E-.18312
G1 X129.702 Y134.422 E-.18315
G1 X129.652 Y134.43 E-.01937
; WIPE_END
G1 E-.04 F1800
G1 X123.175 Y130.392 Z24.68 F30000
G1 X122.067 Y129.701 Z24.68
G1 Z24.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F9219
G1 X123.383 Y131.017 E.08278
G2 X125.104 Y132.172 I5.08 J-5.713 E.0925
G1 X121.827 Y128.895 E.20616
G3 X121.475 Y127.976 I12.061 J-5.15 E.04379
G1 X126.025 Y132.526 E.28624
G2 X126.773 Y132.707 I2.13 J-7.169 E.03423
G1 X121.294 Y127.228 E.34465
G3 X121.205 Y126.572 I8.572 J-1.5 E.02946
G1 X127.428 Y132.795 E.39149
G2 X128.017 Y132.817 I.625 J-8.895 E.0262
G1 X121.183 Y125.983 E.42991
G3 X121.203 Y125.438 I9.801 J.102 E.0243
G1 X128.562 Y132.796 E.4629
G2 X129.067 Y132.734 I-.912 J-9.521 E.02263
G1 X121.266 Y124.934 E.4907
G3 X121.359 Y124.459 I4.268 J.586 E.0215
G1 X129.54 Y132.641 E.51468
G2 X129.988 Y132.522 I-.839 J-4.041 E.02061
G1 X121.478 Y124.012 E.53534
G3 X121.621 Y123.588 I3.843 J1.06 E.0199
G1 X130.411 Y132.378 E.55298
G2 X130.812 Y132.213 I-6.329 J-15.91 E.01931
G1 X121.788 Y123.188 E.56771
G3 X121.975 Y122.809 I3.473 J1.475 E.01884
G1 X131.192 Y132.026 E.57982
G1 X131.305 Y131.963 E.00574
G2 X131.553 Y131.82 I-1.152 J-2.279 E.01274
G1 X122.181 Y122.448 E.58955
G1 X122.223 Y122.38 E.00357
G3 X122.405 Y122.105 I2.538 J1.479 E.01466
G1 X131.895 Y131.596 E.59702
G2 X132.221 Y131.354 I-1.987 J-3.017 E.01803
G1 X122.646 Y121.78 E.60231
G3 X122.904 Y121.471 I2.876 J2.146 E.0179
G1 X132.529 Y131.096 E.60546
G2 X132.821 Y130.821 I-2.303 J-2.734 E.01784
G1 X123.179 Y121.179 E.6065
G3 X123.471 Y120.904 I2.595 J2.459 E.01784
G1 X133.096 Y130.529 E.60546
G2 X133.354 Y130.221 I-2.617 J-2.454 E.0179
G1 X123.779 Y120.646 E.60231
G3 X124.105 Y120.405 I2.312 J2.775 E.01803
G1 X133.595 Y129.895 E.59702
G2 X133.777 Y129.62 I-2.358 J-1.754 E.01466
G1 X133.819 Y129.552 E.00356
G1 X124.447 Y120.18 E.58955
G3 X124.808 Y119.974 I2.015 J3.109 E.01849
G1 X134.025 Y129.191 E.57982
G2 X134.212 Y128.812 I-3.287 J-1.855 E.01884
G1 X125.187 Y119.787 E.56771
G3 X125.589 Y119.622 I6.728 J15.737 E.01931
G1 X134.379 Y128.412 E.55299
G2 X134.522 Y127.988 I-3.702 J-1.485 E.0199
G1 X126.012 Y119.478 E.53534
G3 X126.459 Y119.359 I1.287 J3.923 E.02061
G1 X134.641 Y127.541 E.51469
G2 X134.734 Y127.066 I-4.176 J-1.061 E.0215
G1 X126.933 Y119.266 E.49071
G3 X127.438 Y119.204 I1.418 J9.47 E.02263
G1 X134.797 Y126.563 E.46291
G2 X134.817 Y126.017 I-9.773 J-.648 E.0243
G1 X127.983 Y119.183 E.42991
G3 X128.572 Y119.204 I-.037 J8.924 E.0262
G1 X134.795 Y125.428 E.3915
G2 X134.706 Y124.772 I-8.658 J.844 E.02945
G1 X129.227 Y119.293 E.34466
G3 X129.975 Y119.474 I-1.381 J7.346 E.03423
G1 X134.525 Y124.024 E.28625
G2 X134.173 Y123.105 I-12.418 J4.232 E.04378
G1 X130.895 Y119.828 E.20619
G3 X131.447 Y120.115 I-2.282 J5.053 E.02767
G3 X133.933 Y122.299 I-6.106 J9.459 E.14775
G1 X134.449 Y121.697 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.562784
G1 F8951.737
G1 X133.932 Y120.996 E.04994
G1 X133.334 Y120.363 E.04991
G1 X132.669 Y119.802 E.04991
G1 X131.946 Y119.318 E.04991
G1 X131.173 Y118.918 E.04991
G1 X130.36 Y118.607 E.04991
G2 X128.66 Y118.263 I-2.457 J7.767 E.09965
G1 X127.77 Y118.24 E.05106
G1 X126.904 Y118.311 E.04982
G1 X126.051 Y118.482 E.04995
G1 X125.221 Y118.748 E.04995
G1 X124.427 Y119.105 E.04994
G1 X123.677 Y119.548 E.04995
G1 X122.982 Y120.073 E.04995
G1 X122.348 Y120.674 E.05009
G2 X120.236 Y125.764 I5.663 J5.333 E.32308
G1 X120.232 Y125.806 E.00243
G2 X131.686 Y132.836 I7.777 J.174 E.93031
G2 X133.637 Y131.334 I-4.507 J-7.873 E.14165
G2 X135.517 Y127.958 I-5.777 J-5.429 E.22389
G1 X135.689 Y127.104 E.04996
G1 X135.764 Y126.236 E.04995
G1 X135.742 Y125.365 E.04996
G1 X135.622 Y124.502 E.04996
G1 X135.406 Y123.658 E.04995
G1 X135.098 Y122.844 E.04996
G2 X134.481 Y121.748 I-5.723 J2.501 E.07227
G1 X127.766 Y118.753 F30000
; LINE_WIDTH: 0.564465
G1 F8921.905
G3 X133.782 Y121.613 I.251 J7.231 E.39832
G1 X134.347 Y122.471 E.05909
G1 X134.619 Y123.001 E.03427
G3 X121.62 Y129.461 I-6.617 J2.993 E1.28242
G1 X121.383 Y129.001 E.02975
G3 X127.706 Y118.758 I6.606 J-2.995 E.81699
; CHANGE_LAYER
; Z_HEIGHT: 24.56
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X126.963 Y118.816 E-.28324
G1 X126.165 Y118.977 E-.3093
G1 X125.746 Y119.113 E-.16745
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 88/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L88
M991 S0 P87 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z24.68 I-1.135 J.439 P1  F30000
G1 X131.174 Y133.143 Z24.68
G1 Z24.56
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F8967
G1 X130.809 Y133.29 E.0175
G3 X126.451 Y118.338 I-2.818 J-7.29 E1.1515
G3 X128.305 Y118.191 I1.56 J7.92 E.08291
G3 X131.226 Y133.114 I-.315 J7.809 E.92975
G1 X131.318 Y133.489 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8967
G1 X130.944 Y133.641 E.01659
G3 X125.929 Y118.074 I-2.952 J-7.64 E1.09497
G3 X128.325 Y117.817 I2.055 J7.858 E.0993
G3 X131.372 Y133.461 I-.333 J8.184 E.89981
M204 S10000
; WIPE_START
G1 F24000
G1 X130.944 Y133.641 E-.17627
G1 X130.512 Y133.798 E-.1746
G1 X130.071 Y133.926 E-.17461
G1 X129.623 Y134.03 E-.17463
G1 X129.468 Y134.057 E-.0599
; WIPE_END
G1 E-.04 F1800
G1 X131.396 Y131.53 Z24.96 F30000
G1 Z24.56
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8967
G2 X133.743 Y128.626 I-6.14 J-7.361 E.16718
G1 X130.624 Y131.745 E.19622
G3 X129.742 Y132.069 I-4.816 J-11.741 E.04182
G1 X134.069 Y127.742 E.27221
G2 X134.231 Y127.022 I-6.079 J-1.744 E.03283
G1 X129.022 Y132.231 E.32767
G3 X128.393 Y132.302 I-1.033 J-6.349 E.02815
G1 X134.302 Y126.393 E.37171
G2 X134.314 Y125.824 I-5.065 J-.387 E.02535
G1 X127.824 Y132.314 E.40826
G3 X127.304 Y132.276 I.079 J-4.647 E.0232
G1 X134.276 Y125.304 E.43859
G2 X134.203 Y124.818 I-4.361 J.401 E.02185
G1 X126.817 Y132.204 E.46464
G3 X126.364 Y132.099 I1.805 J-8.839 E.02069
G1 X134.1 Y124.364 E.48663
G2 X133.968 Y123.938 I-3.858 J.961 E.01985
G1 X125.938 Y131.968 E.50516
G3 X125.534 Y131.813 I1.175 J-3.669 E.01922
G1 X133.813 Y123.535 E.52079
G2 X133.637 Y123.153 I-3.487 J1.379 E.01871
G1 X125.152 Y131.637 E.53372
G3 X124.791 Y131.44 I6.237 J-11.866 E.01829
G1 X133.44 Y122.791 E.54408
G2 X133.224 Y122.45 I-12.457 J7.666 E.01798
G1 X124.451 Y131.223 E.55189
G3 X124.128 Y130.988 I1.933 J-2.99 E.01777
G1 X132.988 Y122.128 E.55738
G2 X132.735 Y121.823 I-2.841 J2.101 E.01763
G1 X123.823 Y130.735 E.56065
G3 X123.535 Y130.465 I2.262 J-2.696 E.01757
G1 X132.465 Y121.535 E.56173
G2 X132.177 Y121.265 I-2.55 J2.426 E.01757
G1 X123.265 Y130.177 E.56064
G3 X123.012 Y129.872 I2.589 J-2.406 E.01763
G1 X131.872 Y121.012 E.55738
G2 X131.549 Y120.777 I-2.256 J2.755 E.01777
G1 X122.776 Y129.55 E.55189
G3 X122.56 Y129.209 I12.241 J-8.007 E.01798
G1 X131.209 Y120.56 E.54408
G2 X130.848 Y120.363 I-6.59 J11.656 E.01829
G1 X122.363 Y128.847 E.53372
G3 X122.187 Y128.465 I3.31 J-1.761 E.01871
G1 X130.466 Y120.187 E.52078
G2 X130.062 Y120.032 I-1.578 J3.514 E.01922
G1 X122.032 Y128.062 E.50516
G3 X121.9 Y127.636 I3.727 J-1.388 E.01985
G1 X129.636 Y119.901 E.48663
G2 X129.183 Y119.796 I-2.258 J8.734 E.02069
G1 X121.797 Y127.182 E.46463
G3 X121.724 Y126.696 I4.289 J-.886 E.02185
G1 X128.696 Y119.724 E.43858
G2 X128.176 Y119.686 I-.857 J8.151 E.02319
G1 X121.686 Y126.176 E.40826
G3 X121.698 Y125.607 I5.076 J-.183 E.02535
G1 X127.607 Y119.698 E.3717
G2 X126.978 Y119.769 I.405 J6.421 E.02816
G1 X121.769 Y124.978 E.32766
G3 X121.931 Y124.258 I6.241 J1.025 E.03283
G1 X126.258 Y119.931 E.27219
G2 X125.376 Y120.255 I3.93 J12.054 E.04182
G1 X122.257 Y123.374 E.1962
G3 X124.603 Y120.47 I8.49 J4.459 E.16715
G1 X128.29 Y118.566 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F8967
G1 X127.351 Y118.586 E.03859
G2 X120.688 Y127.371 I.676 J7.432 E.50938
G1 X120.917 Y128.283 E.03859
G2 X128.35 Y118.571 I7.08 J-2.281 E1.32964
G1 X134.831 Y124.215 F30000
; LINE_WIDTH: 0.452781
G1 F8967
G2 X128.284 Y118.942 I-6.834 J1.784 E.40335
G1 X127.42 Y118.959 E.03875
G2 X121.055 Y127.293 I.579 J7.039 E.52941
G1 X121.265 Y128.133 E.03875
G2 X134.99 Y124.991 I6.732 J-2.138 E.94195
G1 X134.843 Y124.274 E.03278
G1 X134.57 Y124.74 F30000
; LINE_WIDTH: 0.42
G1 F8967
G3 X130.061 Y132.366 I-6.604 J1.241 E.39715
G1 X129.26 Y132.57 E.03396
G3 X121.634 Y128.061 I-1.241 J-6.604 E.39715
G1 X121.43 Y127.26 E.03396
G3 X127.407 Y119.335 I6.594 J-1.243 E.45874
G1 X128.234 Y119.314 E.03396
G3 X134.555 Y124.682 I-.226 J6.673 E.36738
; CHANGE_LAYER
; Z_HEIGHT: 24.84
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X134.366 Y123.939 E-.29149
G1 X134.095 Y123.239 E-.28514
G1 X133.872 Y122.811 E-.18337
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 89/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L89
M991 S0 P88 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z24.96 I-1.169 J-.34 P1  F30000
G1 X130.982 Y132.752 Z24.96
G1 Z24.84
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7876
G1 X130.656 Y132.892 E.01581
G3 X127.77 Y118.611 I-2.664 J-6.894 E1.14412
G3 X128.565 Y118.63 I.229 J7.09 E.0354
G3 X131.41 Y132.551 I-.573 J7.368 E.84923
G1 X131.037 Y132.726 E.01836
G1 X131.128 Y133.108 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7876
G1 X130.792 Y133.246 E.01491
G3 X125.707 Y133.42 I-2.795 J-7.251 E.21284
G1 X125.707 Y133.42 E0
G3 X120.58 Y123.707 I2.293 J-7.42 E.50092
G1 X120.58 Y123.707 E0
G3 X128.585 Y118.255 I7.42 J2.293 E.42936
G3 X135.42 Y128.293 I-.585 J7.745 E.57248
G1 X135.42 Y128.293 E0
G3 X131.194 Y133.078 I-7.423 J-2.299 E.27011
G1 X131.182 Y133.083 E.00051
M204 S10000
; WIPE_START
G1 F24000
G1 X130.792 Y133.246 E-.16077
G1 X130.382 Y133.394 E-.16555
G1 X129.964 Y133.515 E-.16556
G1 X129.539 Y133.614 E-.16557
G1 X129.273 Y133.66 E-.10255
; WIPE_END
G1 E-.04 F1800
G1 X124.951 Y131.1 Z25.24 F30000
G1 Z24.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7876
G3 X122.712 Y128.299 I5.576 J-6.753 E.16064
G1 X125.702 Y131.289 E.18808
G2 X126.559 Y131.585 I2.491 J-5.836 E.04038
G1 X122.415 Y127.441 E.26068
G3 X122.282 Y126.745 I6.233 J-1.555 E.03151
G1 X127.255 Y131.719 E.31285
G2 X127.861 Y131.766 I.72 J-5.294 E.02705
G1 X122.235 Y126.136 E.35406
G3 X122.248 Y125.587 I4.891 J-.155 E.02442
G1 X128.412 Y131.751 E.38776
G2 X128.916 Y131.693 I-.467 J-6.224 E.02256
G1 X122.307 Y125.085 E.41571
G3 X122.401 Y124.617 I4.211 J.603 E.02124
G1 X129.383 Y131.598 E.43918
G2 X129.819 Y131.472 I-1.742 J-6.863 E.0202
G1 X122.528 Y124.182 E.45864
G3 X122.682 Y123.773 I3.664 J1.142 E.01943
G1 X130.227 Y131.318 E.47465
G2 X130.612 Y131.141 I-1.363 J-3.466 E.01885
G1 X122.858 Y123.387 E.48775
G3 X123.059 Y123.027 I7.89 J4.159 E.01838
G1 X130.974 Y130.941 E.49788
G2 X131.314 Y130.719 I-1.811 J-3.134 E.01807
G1 X123.281 Y122.687 E.50527
G3 X123.523 Y122.366 I2.974 J1.991 E.01786
G1 X131.634 Y130.477 E.51021
G2 X131.935 Y130.216 I-2.173 J-2.811 E.01773
G1 X123.784 Y122.065 E.51275
G3 X124.065 Y121.784 I7.108 J6.854 E.01768
G1 X132.216 Y129.935 E.51275
G2 X132.477 Y129.634 I-2.553 J-2.471 E.01773
G1 X124.366 Y121.523 E.51021
G3 X124.686 Y121.281 I2.314 J2.729 E.01786
G1 X132.718 Y129.313 E.50527
G2 X132.941 Y128.974 I-2.916 J-2.148 E.01807
G1 X125.026 Y121.059 E.49789
G3 X125.388 Y120.859 I4.153 J7.098 E.0184
G1 X133.142 Y128.613 E.48775
G2 X133.318 Y128.227 I-3.343 J-1.765 E.01887
G1 X125.773 Y120.682 E.47466
G3 X126.181 Y120.528 I1.576 J3.555 E.01941
G1 X133.472 Y127.819 E.45864
G2 X133.599 Y127.383 I-6.741 J-2.202 E.02016
G1 X126.617 Y120.402 E.43918
G3 X127.084 Y120.307 I1.078 J4.111 E.02121
G1 X133.693 Y126.916 E.41571
G2 X133.752 Y126.413 I-6.421 J-1.012 E.02252
G1 X127.588 Y120.249 E.38776
G3 X128.135 Y120.234 I.405 J4.862 E.02436
G1 X133.765 Y125.864 E.35418
G2 X133.718 Y125.255 I-6.683 J.213 E.0272
G1 X128.745 Y120.281 E.31285
G3 X129.44 Y120.415 I-4.22 J23.811 E.03152
G1 X133.585 Y124.56 E.2607
G2 X133.288 Y123.701 I-10.707 J3.218 E.04042
G1 X130.298 Y120.711 E.1881
M73 P94 R1
G3 X130.631 Y120.867 I-1.226 J3.046 E.01639
G3 X133.103 Y122.954 I-4.673 J8.043 E.14463
G1 X126.581 Y119.129 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F7876
G1 X125.447 Y119.465 E.04854
G2 X124.085 Y120.176 I2.512 J6.464 E.06322
G1 X123.163 Y120.916 E.04853
G2 X121.757 Y122.796 I5.537 J5.607 E.09678
G1 X121.299 Y123.921 E.04987
G2 X120.986 Y126.216 I7.557 J2.197 E.09545
G1 X121.122 Y127.39 E.04853
G1 X121.32 Y128.149 E.03221
G1 X121.776 Y129.24 E.04853
G1 X122.176 Y129.914 E.03221
G1 X122.939 Y130.86 E.04987
G2 X124.797 Y132.243 I5.578 J-5.551 E.09545
G1 X125.89 Y132.692 E.04853
G2 X128.216 Y133.014 I2.23 J-7.559 E.09679
G1 X129.39 Y132.878 E.04853
G1 X130.149 Y132.68 E.03221
G1 X131.24 Y132.224 E.04853
G2 X132.542 Y131.349 I-3.235 J-6.215 E.06456
G1 X133.375 Y130.511 E.04853
G2 X134.243 Y129.204 I-5.366 J-4.504 E.06455
G1 X134.701 Y128.079 E.04987
G1 X134.886 Y127.35 E.03087
G1 X135.015 Y126.175 E.04854
G2 X134.68 Y123.851 I-7.881 J-.05 E.09679
G1 X134.224 Y122.76 E.04853
G2 X133.349 Y121.458 I-6.215 J3.234 E.06455
G1 X132.485 Y120.604 E.04987
G2 X129.734 Y119.201 I-4.479 J5.38 E.12786
G1 X128.536 Y119.004 E.04987
G1 X127.784 Y118.986 E.03085
G1 X126.64 Y119.122 E.0473
G1 X123.559 Y130.243 F30000
G1 F7876
G3 X124.059 Y130.712 I4.439 J-4.239 E1.55525
G1 X123.603 Y130.284 E.02569
G1 X134.13 Y128.355 F30000
; LINE_WIDTH: 0.564939
G1 F7876
G2 X134.502 Y126.932 I-5.262 J-2.137 E.08495
G2 X134.001 Y123.33 I-6.514 J-.928 E.21221
G2 X132.253 Y120.985 I-6.257 J2.839 E.16974
G2 X128.931 Y119.5 I-4.274 J5.1 E.21227
G1 X128.198 Y119.429 E.04243
G2 X124.672 Y120.331 I-.136 J6.814 E.21222
G2 X122.162 Y122.968 I3.49 J5.834 E.21229
G2 X121.492 Y125.067 I6.711 J3.297 E.12736
G2 X121.428 Y126.196 I6.612 J.942 E.0652
G1 X121.546 Y127.27 E.06219
G2 X121.999 Y128.67 I5.692 J-1.067 E.08501
G2 X122.744 Y129.939 I5.285 J-2.249 E.08495
G2 X125.645 Y132.131 I5.258 J-3.942 E.21221
G2 X129.984 Y132.272 I2.375 J-6.254 E.25466
G2 X133.016 Y130.254 I-2.197 J-6.588 E.21224
G2 X134.106 Y128.41 I-4.684 J-4.012 E.12403
; CHANGE_LAYER
; Z_HEIGHT: 25.12
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X133.838 Y129.032 E-.25744
G1 X133.462 Y129.666 E-.28036
G1 X133.109 Y130.132 E-.2222
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 90/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L90
M991 S0 P89 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z25.24 I-.835 J-.885 P1  F30000
G1 X130.77 Y132.338 Z25.24
G1 Z25.12
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7289
G1 X130.122 Y132.585 E.03086
G3 X126.25 Y119.303 I-2.13 J-6.584 E.98509
G3 X128.38 Y119.092 I1.829 J7.583 E.09548
G3 X130.845 Y132.305 I-.388 J6.909 E.81893
G1 X130.825 Y132.314 E.00098
G1 X130.929 Y132.671 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7289
G1 X130.621 Y132.803 E.01374
G3 X128.399 Y118.717 I-2.616 J-6.805 E1.0665
G3 X134.181 Y129.872 I-.408 J7.287 E.62135
G1 X134.181 Y129.872 E0
G3 X131.366 Y132.467 I-6.176 J-3.875 E.15903
G1 X130.983 Y132.645 E.01737
M204 S10000
; WIPE_START
G1 F24000
G1 X130.621 Y132.803 E-.14995
G1 X129.844 Y133.059 E-.31081
G1 X129.446 Y133.152 E-.15552
G1 X129.072 Y133.209 E-.14372
; WIPE_END
G1 E-.04 F1800
G1 X130.664 Y130.594 Z25.52 F30000
G1 Z25.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7289
G2 X132.749 Y127.95 I-4.959 J-6.056 E.15095
G1 X129.95 Y130.75 E.17609
G3 X129.134 Y131.007 I-2.765 J-7.328 E.0381
G1 X133.007 Y127.134 E.24367
G2 X133.113 Y126.47 I-5.176 J-1.167 E.02995
G1 X128.469 Y131.114 E.29218
G3 X127.89 Y131.135 I-.521 J-6.589 E.02576
G1 X133.134 Y125.891 E.32987
G2 X133.096 Y125.371 I-5.664 J.155 E.0232
G1 X127.37 Y131.096 E.36015
G3 X126.894 Y131.014 I.682 J-5.373 E.0215
G1 X133.014 Y124.894 E.38497
G2 X132.897 Y124.453 I-3.986 J.821 E.02032
G1 X126.452 Y130.897 E.4054
G3 X126.044 Y130.747 I1.134 J-3.708 E.01935
G1 X132.747 Y124.044 E.42166
G2 X132.572 Y123.661 I-3.499 J1.37 E.01875
G1 X125.657 Y130.571 E.43482
G3 X125.305 Y130.37 I1.61 J-3.234 E.01803
G1 X132.37 Y123.305 E.44446
G2 X132.146 Y122.971 I-3.085 J1.832 E.0179
G1 X124.971 Y130.146 E.45137
G3 X124.659 Y129.899 I3.836 J-5.166 E.01768
G1 X131.9 Y122.658 E.45551
G2 X131.63 Y122.37 I-2.707 J2.255 E.01758
G1 X124.37 Y129.63 E.45676
G3 X124.1 Y129.342 I2.438 J-2.544 E.01758
G1 X131.341 Y122.101 E.45551
G2 X131.029 Y121.854 I-4.148 J4.921 E.01768
G1 X123.854 Y129.029 E.45137
G3 X123.63 Y128.695 I2.861 J-2.166 E.0179
G1 X130.695 Y121.63 E.44446
G2 X130.339 Y121.428 I-3.951 J6.531 E.01821
G1 X123.428 Y128.339 E.43476
G3 X123.253 Y127.956 I3.323 J-1.753 E.01875
G1 X129.956 Y121.253 E.42165
G2 X129.548 Y121.103 I-1.542 J3.559 E.01935
G1 X123.103 Y127.547 E.4054
G3 X122.986 Y127.106 I3.869 J-1.263 E.02032
G1 X129.106 Y120.986 E.38496
G2 X128.629 Y120.904 I-1.158 J5.289 E.0215
G1 X122.904 Y126.629 E.36015
G3 X122.866 Y126.109 I5.626 J-.675 E.0232
G1 X128.11 Y120.865 E.32986
G2 X127.531 Y120.886 I-.057 J6.603 E.02576
G1 X122.887 Y125.53 E.29217
G3 X122.993 Y124.866 I5.281 J.502 E.02995
G1 X126.866 Y120.993 E.24366
G2 X126.05 Y121.251 I1.949 J7.586 E.0381
G1 X123.251 Y124.05 E.17607
G3 X125.336 Y121.406 I7.048 J3.415 E.15093
G1 X126.146 Y120.104 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.395974
G1 F7289
G2 X122.868 Y122.553 I1.761 J5.775 E.15996
G2 X121.883 Y125.112 I4.619 J3.246 E.10613
G2 X122.664 Y129.12 I5.958 J.919 E.15959
G2 X125.131 Y131.49 I5.422 J-3.173 E.13276
G2 X127.115 Y132.126 I3.205 J-6.59 E.08012
G2 X131.724 Y121.051 I.88 J-6.13 E.62601
G1 X130.872 Y120.514 E.0386
G2 X127.829 Y119.808 I-2.939 J5.761 E.12092
G1 X126.825 Y119.92 E.03869
G1 X126.204 Y120.088 E.02467
G1 X123.351 Y129.558 F30000
; LINE_WIDTH: 0.394239
G1 F7289
G3 X122.182 Y126.657 I4.788 J-3.616 E.12064
G3 X122.145 Y125.854 I7.321 J-.743 E.03065
G3 X132.958 Y129.114 I5.853 J.151 E.82037
G1 X132.505 Y129.742 E.02951
G3 X128.657 Y131.818 I-4.549 J-3.829 E.17071
G1 X127.883 Y131.856 E.02951
G3 X123.39 Y129.604 I.124 J-5.855 E.19802
G1 X128.607 Y131.472 F30000
; LINE_WIDTH: 0.42
G1 F7289
G1 X127.873 Y131.509 E.03018
G3 X122.528 Y126.607 I.147 J-5.525 E.32483
G3 X122.491 Y125.863 I7.817 J-.764 E.0306
G3 X132.657 Y128.938 I5.505 J.141 E.83161
G1 X132.228 Y129.535 E.03018
G3 X128.666 Y131.464 I-4.255 J-3.604 E.17022
G1 X133.545 Y129.475 F30000
G1 F7289
G2 X131.922 Y120.759 I-5.552 J-3.475 E.39984
G1 X130.986 Y120.175 E.04528
G2 X127.8 Y119.457 I-3.063 J6.163 E.1354
G1 X126.706 Y119.584 E.04524
G1 X125.647 Y119.892 E.04528
G2 X122.759 Y122.078 I2.518 J6.326 E.15053
G1 X122.175 Y123.014 E.04527
G2 X121.657 Y124.382 I5.816 J2.982 E.06022
G1 X121.476 Y125.47 E.04527
G2 X122.032 Y128.69 I6.755 J.49 E.13551
G1 X122.567 Y129.651 E.04517
G1 X123.257 Y130.512 E.04528
G2 X125.011 Y131.824 I5.231 J-5.165 E.09028
G1 X126.031 Y132.243 E.04528
G2 X133.511 Y129.525 I1.952 J-6.279 E.35095
; CHANGE_LAYER
; Z_HEIGHT: 25.4
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X133.244 Y129.918 E-.18081
G1 X132.771 Y130.482 E-.27969
G1 X132.239 Y130.988 E-.27895
G1 X132.196 Y131.021 E-.02056
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 91/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L91
M991 S0 P90 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z25.52 I-.566 J-1.078 P1  F30000
G1 X130.549 Y131.885 Z25.52
G1 Z25.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6180
G1 X129.967 Y132.105 E.0277
G3 X127.083 Y119.648 I-1.976 J-6.105 E.94556
G3 X128.233 Y119.588 I1.108 J10.18 E.05124
G3 X130.638 Y131.846 I-.242 J6.412 E.76461
G1 X130.604 Y131.861 E.00163
G1 X130.684 Y132.234 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6180
G1 X130.082 Y132.462 E.02643
G3 X127.029 Y119.277 I-2.092 J-6.462 E.92385
G3 X128.253 Y119.214 I1.163 J10.65 E.05032
G3 X130.792 Y132.187 I-.263 J6.787 E.74672
G1 X130.739 Y132.21 E.00237
M204 S10000
; WIPE_START
G1 F24000
G1 X130.082 Y132.462 E-.26736
G1 X129.717 Y132.572 E-.14476
G1 X128.971 Y132.723 E-.28948
G1 X128.817 Y132.737 E-.0584
; WIPE_END
G1 E-.04 F1800
G1 X129.526 Y131.846 Z25.8 F30000
G1 Z25.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F6180
G1 X130.485 Y131.508 E.04177
G2 X134.02 Y125.476 I-2.53 J-5.534 E.3058
G1 X133.846 Y124.472 E.04183
G2 X131.056 Y120.787 I-5.947 J1.605 E.19452
G1 X130.137 Y120.348 E.0418
G2 X128.828 Y120.015 I-2.135 J5.643 E.05559
G1 X127.811 Y119.961 E.04183
G2 X122.787 Y122.944 I.228 J6.105 E.25014
G1 X122.348 Y123.863 E.0418
G2 X121.98 Y126.524 I5.651 J2.137 E.11126
G1 X122.154 Y127.528 E.04183
G2 X124.944 Y131.213 I5.947 J-1.605 E.19452
G1 X125.863 Y131.652 E.0418
G2 X128.524 Y132.02 I2.137 J-5.651 E.11126
G1 X129.467 Y131.857 E.03926
G1 X129.435 Y131.497 F30000
G1 F6180
G1 X130.341 Y131.177 E.03948
G2 X133.661 Y125.512 I-2.382 J-5.201 E.28713
G1 X133.496 Y124.558 E.03975
G2 X130.878 Y121.101 I-5.588 J1.512 E.18249
G1 X130.005 Y120.684 E.03972
G2 X128.784 Y120.373 I-1.991 J5.264 E.05185
G1 X127.817 Y120.321 E.03975
G2 X123.101 Y123.122 I.219 J5.739 E.23479
G1 X122.684 Y123.995 E.03973
G2 X122.339 Y126.488 I5.3 J2.002 E.1042
G1 X122.504 Y127.442 E.03975
G2 X125.122 Y130.899 I5.588 J-1.512 E.18249
G1 X125.995 Y131.316 E.03973
G2 X128.488 Y131.661 I2.002 J-5.3 E.1042
G1 X129.375 Y131.507 E.03698
G1 X129.343 Y131.147 F30000
G1 F6180
G1 X130.198 Y130.846 E.0372
G2 X133.302 Y125.548 I-2.234 J-4.867 E.26846
G1 X133.145 Y124.644 E.03767
G2 X130.7 Y121.415 I-5.229 J1.419 E.17046
G1 X129.873 Y121.019 E.03765
G2 X128.74 Y120.731 I-1.848 J4.884 E.04811
G1 X127.823 Y120.682 E.03767
G2 X123.415 Y123.3 I.209 J5.372 E.21944
G1 X123.019 Y124.127 E.03765
G2 X122.698 Y126.452 I4.949 J1.868 E.09714
G1 X122.855 Y127.356 E.03767
G2 X125.3 Y130.585 I5.229 J-1.419 E.17046
G1 X126.127 Y130.981 E.03765
G2 X128.452 Y131.302 I1.868 J-4.949 E.09714
G1 X129.284 Y131.158 E.0347
G1 X129.252 Y130.798 F30000
G1 F6180
G1 X130.054 Y130.515 E.03491
G2 X132.943 Y125.585 I-2.087 J-4.534 E.24979
G1 X132.795 Y124.731 E.0356
G2 X130.522 Y121.729 I-4.87 J1.326 E.15843
G1 X129.74 Y121.355 E.03557
G2 X128.695 Y121.089 I-1.704 J4.505 E.04437
G1 X127.829 Y121.043 E.0356
G2 X123.729 Y123.478 I.2 J5.006 E.20409
G1 X123.355 Y124.26 E.03557
G2 X123.057 Y126.415 I4.598 J1.734 E.09008
G1 X123.205 Y127.269 E.0356
G2 X125.478 Y130.271 I4.87 J-1.326 E.15843
G1 X126.26 Y130.645 E.03557
G2 X129.193 Y130.808 I1.735 J-4.739 E.1224
G1 X128.426 Y130.575 F30000
G1 F6180
G1 X129.161 Y130.448 E.03061
G1 X129.91 Y130.184 E.03263
G2 X132.576 Y125.574 I-1.941 J-4.197 E.23299
G1 X132.445 Y124.817 E.03155
G2 X130.3 Y122.022 I-4.505 J1.236 E.14832
G1 X129.608 Y121.691 E.03151
G2 X127.836 Y121.404 I-1.696 J4.856 E.0741
G2 X124.022 Y123.7 I.193 J4.636 E.19062
G1 X123.691 Y124.392 E.03153
G2 X123.424 Y126.426 I4.303 J1.598 E.08493
G1 X123.555 Y127.183 E.03155
G2 X125.7 Y129.978 I4.505 J-1.236 E.14831
G1 X126.392 Y130.309 E.03151
G2 X128.366 Y130.578 I1.587 J-4.267 E.08248
G1 X128.294 Y129.64 F30000
; LINE_WIDTH: 0.56496
G1 F6180
G1 X127.704 Y129.65 E.03399
G3 X126.546 Y129.356 I.45 J-4.197 E.06902
G3 X124.478 Y125.018 I1.471 J-3.363 E.30172
G1 X124.719 Y124.381 E.03922
G1 X125.079 Y123.807 E.03905
G1 X125.412 Y123.41 E.02982
G1 X125.892 Y123.013 E.03589
G3 X128.894 Y122.458 I2.103 J2.977 E.18147
G1 X129.537 Y122.68 E.03915
G1 X130.123 Y123.024 E.03913
G3 X131.652 Y126.173 I-2.178 J3.003 E.21
G1 X131.575 Y126.792 E.03589
G3 X131.16 Y127.851 I-4.409 J-1.116 E.06569
G3 X130.439 Y128.731 I-3.849 J-2.418 E.06569
G1 X129.937 Y129.1 E.03589
G3 X128.353 Y129.631 I-1.909 J-3.07 E.09712
G1 X128.268 Y129.206 F30000
; LINE_WIDTH: 0.42
G1 F6180
G1 X127.738 Y129.221 E.02175
G3 X126.731 Y128.969 I.601 J-4.541 E.04273
G3 X125.02 Y127.246 I1.415 J-3.117 E.10195
G1 X124.816 Y126.506 E.0315
G3 X124.888 Y125.16 I3.621 J-.483 E.05564
G1 X125.104 Y124.566 E.02598
G3 X125.709 Y123.723 I4.134 J2.326 E.04268
G1 X126.163 Y123.351 E.0241
G1 X126.552 Y123.12 E.01859
G1 X127.096 Y122.899 E.02409
G1 X127.854 Y122.78 E.03151
G1 X128.464 Y122.802 E.02507
G1 X129.097 Y122.969 E.0269
G3 X130.24 Y123.682 I-1.329 J3.402 E.05564
G1 X130.629 Y124.122 E.02409
G1 X130.991 Y124.798 E.0315
G3 X131.221 Y126.126 I-2.991 J1.202 E.05573
G1 X131.152 Y126.709 E.0241
G1 X130.889 Y127.43 E.03151
G1 X130.66 Y127.821 E.01859
G1 X130.291 Y128.277 E.02409
G1 X129.686 Y128.748 E.0315
G3 X128.327 Y129.197 I-1.621 J-2.623 E.05929
G1 X126.57 Y127.59 F30000
G1 F6180
G1 X126.243 Y127.236 E.0198
G1 X125.992 Y126.774 E.0216
G1 X125.868 Y126.262 E.0216
G1 X125.879 Y125.662 E.02466
G1 X126.055 Y125.088 E.02466
G1 X126.384 Y124.585 E.02466
G1 X126.839 Y124.193 E.02466
G1 X127.384 Y123.942 E.02466
G1 X127.978 Y123.852 E.02466
G1 X128.368 Y123.884 E.01607
G1 X128.887 Y124.04 E.02223
G1 X129.322 Y124.307 E.02098
G1 X129.739 Y124.739 E.02466
G1 X130.02 Y125.27 E.02466
G1 X130.143 Y125.858 E.02466
G1 X130.099 Y126.457 E.02466
G1 X129.89 Y127.02 E.02466
G1 X129.534 Y127.503 E.02466
G1 X129.058 Y127.869 E.02466
G1 X128.499 Y128.089 E.02466
G1 X127.901 Y128.146 E.02466
G1 X127.311 Y128.035 E.02466
G1 X126.848 Y127.805 E.02123
G1 X126.618 Y127.627 E.01195
G1 X128.381 Y124.262 F30000
G1 F6180
G1 X128.749 Y124.374 E.0158
G1 X129.17 Y124.645 E.02055
G1 X129.499 Y125.022 E.02055
G1 X129.712 Y125.475 E.02055
G1 X129.79 Y125.969 E.02055
G1 X129.729 Y126.466 E.02055
G1 X129.532 Y126.926 E.02055
G1 X129.216 Y127.314 E.02055
G1 X128.804 Y127.6 E.02055
G1 X128.33 Y127.76 E.02055
G1 X127.83 Y127.782 E.02055
G1 X127.343 Y127.666 E.02055
G1 X126.908 Y127.419 E.02055
G1 X126.558 Y127.061 E.02055
G1 X126.32 Y126.62 E.02055
G1 X126.219 Y126.181 E.01851
G1 X126.238 Y125.681 E.02055
G1 X126.395 Y125.206 E.02055
G1 X126.678 Y124.793 E.02055
G1 X127.064 Y124.474 E.02055
G1 X127.523 Y124.274 E.02055
G1 X128.02 Y124.21 E.02055
G1 X128.322 Y124.253 E.01253
G1 X129.256 Y123.841 F30000
G1 F6180
G1 X129.678 Y124.135 E.02113
G1 X130.055 Y124.557 E.02323
G1 X130.344 Y125.113 E.02572
G1 X130.421 Y125.352 E.01033
G1 X130.505 Y125.849 E.02067
G3 X130.167 Y127.269 I-2.905 J.06 E.06062
G1 X129.816 Y127.727 E.02367
G3 X129.093 Y128.259 I-2.285 J-2.345 E.03701
G1 X128.619 Y128.428 E.02065
G3 X127.712 Y128.493 I-.687 J-3.265 E.03747
G1 X127.159 Y128.366 E.02327
G3 X125.998 Y127.517 I1.064 J-2.674 E.05971
G1 X125.71 Y127.017 E.02367
G3 X125.502 Y125.977 I2.585 J-1.058 E.04381
G1 X125.555 Y125.434 E.0224
G1 X125.754 Y124.876 E.02432
G1 X126.09 Y124.378 E.02468
G3 X127.317 Y123.584 I2.084 J1.875 E.0607
G1 X127.937 Y123.495 E.02572
G1 X128.393 Y123.52 E.01877
G1 X128.9 Y123.661 E.02161
G1 X129.202 Y123.814 E.01389
G1 X129.446 Y123.536 F30000
G1 F6180
G1 X129.935 Y123.883 E.02461
G3 X130.733 Y125.119 I-2.495 J2.487 E.06089
G1 X130.852 Y125.735 E.02574
G1 X130.863 Y126.087 E.01446
G1 X130.798 Y126.64 E.02285
G1 X130.556 Y127.293 E.02861
G1 X130.378 Y127.597 E.01446
G1 X130.029 Y128.03 E.02285
G1 X129.476 Y128.455 E.02861
G3 X128.685 Y128.786 I-1.546 J-2.588 E.03534
G1 X127.944 Y128.864 E.03059
G1 X127.593 Y128.836 E.01446
G1 X127.051 Y128.709 E.02285
G1 X126.502 Y128.436 E.02518
G3 X125.789 Y127.827 I1.421 J-2.388 E.03868
G1 X125.451 Y127.293 E.02592
G3 X125.142 Y125.958 I2.621 J-1.31 E.0568
G1 X125.182 Y125.449 E.02099
G1 X125.375 Y124.852 E.02574
G1 X125.536 Y124.539 E.01446
G1 X125.86 Y124.087 E.02285
G1 X126.388 Y123.632 E.02861
G1 X126.691 Y123.452 E.01446
G1 X127.206 Y123.241 E.02285
G1 X127.895 Y123.137 E.02861
G1 X128.41 Y123.158 E.02114
G1 X128.999 Y123.315 E.02503
G1 X129.392 Y123.51 E.01802
M73 P95 R1
G1 X128.239 Y121.853 F30000
; LINE_WIDTH: 0.565283
G1 F6180
G1 X127.753 Y121.846 E.02803
G1 X127.087 Y121.938 E.03876
G1 X126.516 Y122.11 E.03432
G1 X125.874 Y122.421 E.04116
G1 X125.313 Y122.82 E.03967
G1 X124.87 Y123.255 E.03581
G1 X124.47 Y123.796 E.03876
G2 X123.875 Y125.416 I4.209 J2.464 E.10001
G1 X123.837 Y125.896 E.02774
G2 X124.169 Y127.629 I4.792 J-.019 E.1023
G1 X124.483 Y128.224 E.03876
G1 X124.818 Y128.689 E.03303
G1 X125.247 Y129.12 E.03506
G1 X125.786 Y129.524 E.03879
G2 X127.882 Y130.164 I2.313 J-3.815 E.12764
G2 X130.116 Y129.589 I.023 J-4.532 E.13442
G1 X130.615 Y129.237 E.03521
G1 X131.103 Y128.773 E.03879
G2 X131.937 Y127.35 I-3.289 J-2.883 E.09566
G1 X132.103 Y126.697 E.03879
G2 X132.051 Y125.07 I-4.222 J-.68 E.09441
G1 X131.893 Y124.515 E.03324
G1 X131.629 Y123.964 E.03521
G1 X131.254 Y123.406 E.03879
G2 X129.981 Y122.347 I-3.276 J2.644 E.09605
G2 X128.299 Y121.861 I-1.973 J3.673 E.10167
G1 X129.52 Y125.526 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6180
G2 X128.426 Y124.649 I-2.028 J1.409 E.06324
G2 X128.008 Y124.584 I-.455 J1.55 E.01888
G1 X129.416 Y125.992 E.08861
G3 X129.333 Y126.479 I-1.419 J.008 E.02207
G1 X127.521 Y124.667 E.11397
G2 X127.151 Y124.866 I.568 J1.501 E.01877
G1 X129.134 Y126.849 E.12477
G3 X128.849 Y127.134 I-1.311 J-1.027 E.01796
G1 X126.865 Y125.151 E.12476
G2 X126.667 Y125.521 I1.318 J.945 E.01873
G1 X128.478 Y127.333 E.11397
G3 X127.992 Y127.416 I-.479 J-1.335 E.02207
G1 X126.584 Y126.008 E.0886
G2 X126.908 Y126.902 I1.418 J-.008 E.04312
G1 X127.526 Y127.52 E.03891
; CHANGE_LAYER
; Z_HEIGHT: 25.68
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X126.908 Y126.902 E-.33236
G1 X126.678 Y126.509 E-.17275
G1 X126.584 Y126.008 E-.19386
G1 X126.697 Y126.122 E-.06103
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 92/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L92
M991 S0 P91 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z25.8 I-1.003 J.689 P1  F30000
G1 X130.313 Y131.389 Z25.8
G1 Z25.68
G1 E.8 F1800
; FEATURE: Inner wall
G1 F5341
G1 X129.799 Y131.583 E.02447
G3 X128.146 Y120.133 I-1.801 J-5.585 E.90807
G1 X128.47 Y120.15 E.01442
G3 X130.412 Y131.347 I-.472 J5.849 E.68828
G1 X130.368 Y131.365 E.00212
G1 X130.448 Y131.738 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F5341
G1 X129.914 Y131.94 E.02345
G3 X128.156 Y119.758 I-1.916 J-5.942 E.89176
G1 X128.5 Y119.776 E.01417
G3 X130.567 Y131.688 I-.503 J6.223 E.67592
G1 X130.503 Y131.715 E.00282
M204 S10000
; WIPE_START
G1 F24000
G1 X129.914 Y131.94 E-.23979
G1 X129.237 Y132.121 E-.26601
G1 X128.575 Y132.216 E-.25419
; WIPE_END
G1 E-.04 F1800
G1 X129.699 Y130.053 Z26.08 F30000
G1 Z25.68
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F5341
G1 X130.163 Y129.839 E.02097
G2 X132.073 Y127.649 I-2.169 J-3.82 E.12163
G2 X132.41 Y126.095 I-4.282 J-1.743 E.06562
G2 X130.418 Y122.329 I-4.413 J-.075 E.18254
G1 X129.922 Y122.033 E.02373
G1 X129.325 Y121.799 E.02634
G2 X128.254 Y121.599 I-1.729 J6.321 E.04478
G2 X126.587 Y121.828 I-.146 J5.122 E.0694
G1 X125.946 Y122.096 E.02853
G1 X125.484 Y122.38 E.02225
G1 X124.933 Y122.838 E.02943
G1 X124.531 Y123.28 E.02453
G2 X123.605 Y125.625 I3.898 J2.896 E.10473
G1 X123.607 Y126.404 E.03198
G2 X124.096 Y128.054 I5.054 J-.6 E.07102
G1 X124.38 Y128.516 E.02225
G1 X124.838 Y129.067 E.02943
G1 X125.28 Y129.469 E.02453
G2 X126.831 Y130.248 I3.4 J-4.831 E.07152
G2 X127.993 Y130.408 I1.452 J-6.268 E.04825
G2 X129.642 Y130.073 I-.075 J-4.59 E.06948
G1 X130.637 Y127.821 F30000
; LINE_WIDTH: 0.64922
G1 F5341
G1 X130.976 Y127.199 E.04764
G1 X131.143 Y126.65 E.03853
G1 X131.213 Y126.048 E.04074
G1 X131.15 Y125.363 E.04621
G1 X130.934 Y124.704 E.04663
G1 X130.667 Y124.207 E.03796
G1 X130.268 Y123.724 E.04204
G1 X129.953 Y123.445 E.02831
G1 X129.435 Y123.129 E.04074
G1 X128.967 Y122.935 E.03412
G2 X127.333 Y122.863 I-.962 J3.258 E.111
G1 X126.759 Y123.042 E.04042
G1 X126.298 Y123.281 E.0349
G1 X125.754 Y123.701 E.04619
G1 X125.447 Y124.049 E.03116
G1 X125.144 Y124.533 E.03841
G1 X124.923 Y125.068 E.03889
G2 X124.922 Y126.919 I3.224 J.927 E.12602
G1 X125.166 Y127.516 E.04336
G2 X126.179 Y128.637 I2.901 J-1.602 E.10244
G1 X126.801 Y128.976 E.04764
G1 X127.301 Y129.133 E.03522
G1 X127.956 Y129.215 E.04434
G2 X130.344 Y128.203 I-.022 J-3.374 E.17896
G1 X130.601 Y127.869 E.02829
G1 X132.245 Y128.179 F30000
; LINE_WIDTH: 0.42
G1 F5341
G1 X132.556 Y127.421 E.03364
G1 X132.681 Y126.929 E.02085
G1 X132.771 Y126.109 E.03387
G2 X132.546 Y124.549 I-5.325 J-.029 E.06496
G1 X132.226 Y123.783 E.03406
G2 X130.868 Y122.186 I-4.198 J2.192 E.08684
G1 X130.168 Y121.749 E.03386
G2 X129.19 Y121.379 I-2.132 J4.157 E.04304
G1 X128.372 Y121.242 E.03406
G1 X127.864 Y121.23 E.02086
G1 X127.045 Y121.324 E.03387
G1 X126.549 Y121.454 E.02104
G1 X125.783 Y121.774 E.03406
G2 X124.186 Y123.132 I2.192 J4.198 E.08684
G1 X123.755 Y123.821 E.03334
G1 X123.444 Y124.579 E.03364
G2 X123.245 Y125.601 I4.444 J1.399 E.04285
G1 X123.247 Y126.43 E.03406
G2 X123.454 Y127.451 I4.642 J-.408 E.04285
G1 X123.774 Y128.217 E.03406
G2 X125.132 Y129.814 I4.198 J-2.192 E.08684
G1 X125.821 Y130.245 E.03334
G1 X126.579 Y130.556 E.03364
G1 X127.071 Y130.681 E.02084
G1 X127.896 Y130.771 E.03406
G2 X129.451 Y130.546 I.024 J-5.323 E.06477
G1 X130.217 Y130.226 E.03406
G2 X132.213 Y128.23 I-2.292 J-4.288 E.11761
G1 X132.566 Y128.344 F30000
G1 F5341
G1 X132.898 Y127.534 E.03593
G1 X133.036 Y126.993 E.02293
G1 X133.132 Y126.123 E.03594
G2 X132.888 Y124.433 I-5.747 J-.034 E.07036
G1 X132.548 Y123.621 E.03614
G2 X131.08 Y121.894 I-4.532 J2.364 E.09389
G1 X130.337 Y121.43 E.03594
G2 X129.274 Y121.028 I-2.317 J4.518 E.04678
G1 X128.406 Y120.883 E.03613
G1 X127.848 Y120.869 E.02293
G1 X126.978 Y120.97 E.03594
G1 X126.433 Y121.112 E.02312
G1 X125.621 Y121.452 E.03613
G2 X123.894 Y122.92 I2.364 J4.532 E.09389
G1 X123.434 Y123.656 E.03562
G1 X123.102 Y124.466 E.03593
G2 X122.885 Y125.577 I4.832 J1.521 E.04658
G1 X122.887 Y126.457 E.03613
G2 X123.112 Y127.567 I5.046 J-.444 E.04659
G1 X123.452 Y128.379 E.03614
G2 X124.92 Y130.106 I4.532 J-2.364 E.09389
G1 X125.656 Y130.566 E.03562
G1 X126.466 Y130.898 E.03593
G1 X127.007 Y131.036 E.02292
G1 X127.882 Y131.132 E.03614
G2 X129.567 Y130.888 I.03 J-5.745 E.07016
G1 X130.379 Y130.548 E.03614
G2 X132.534 Y128.395 I-2.47 J-4.627 E.12694
G1 X132.887 Y128.509 F30000
G1 F5341
G1 X133.241 Y127.648 E.03822
G1 X133.391 Y127.057 E.025
G1 X133.492 Y126.137 E.03801
G2 X133.23 Y124.318 I-6.169 J-.039 E.07575
G1 X132.871 Y123.459 E.03821
G2 X131.292 Y121.602 I-4.865 J2.536 E.10094
G1 X130.506 Y121.111 E.03801
G2 X129.358 Y120.677 I-2.502 J4.88 E.05052
G1 X128.44 Y120.524 E.03821
G1 X127.831 Y120.509 E.025
G1 X126.912 Y120.615 E.03801
G1 X126.318 Y120.77 E.0252
G1 X125.459 Y121.129 E.03821
G2 X123.602 Y122.708 I2.536 J4.865 E.10094
G1 X123.113 Y123.491 E.03791
G1 X122.759 Y124.353 E.03822
G2 X122.525 Y125.553 I5.219 J1.643 E.05032
G1 X122.528 Y126.483 E.03821
G2 X122.77 Y127.682 I5.451 J-.479 E.05032
G1 X123.129 Y128.541 E.03821
G2 X124.708 Y130.398 I4.865 J-2.536 E.10094
G1 X125.491 Y130.887 E.03791
G1 X126.352 Y131.241 E.03822
G1 X126.942 Y131.391 E.025
G1 X127.868 Y131.492 E.03822
G2 X129.682 Y131.23 I.035 J-6.167 E.07555
G1 X130.541 Y130.871 E.03821
G2 X132.398 Y129.292 I-2.536 J-4.865 E.10094
G1 X132.856 Y128.56 E.03545
G1 X129.567 Y125.486 F30000
G1 F5341
G1 X129.66 Y125.905 E.01765
G1 X129.603 Y126.409 E.02081
G1 X129.477 Y126.746 E.01478
G1 X129.176 Y127.174 E.02149
G1 X128.758 Y127.476 E.02117
G1 X128.481 Y127.583 E.01218
G1 X127.988 Y127.662 E.02051
G1 X127.487 Y127.58 E.02084
G1 X127.001 Y127.32 E.02265
G1 X126.739 Y127.07 E.01485
G1 X126.468 Y126.645 E.02071
G1 X126.356 Y126.19 E.01924
G1 X126.351 Y125.85 E.01397
G1 X126.454 Y125.388 E.0194
G1 X126.712 Y124.954 E.02076
G1 X126.93 Y124.739 E.01256
G1 X127.355 Y124.468 E.02071
G1 X127.85 Y124.353 E.02086
G1 X128.167 Y124.35 E.01302
G1 X128.594 Y124.45 E.01803
G1 X129.069 Y124.726 E.02255
G1 X129.406 Y125.12 E.02127
G1 X129.543 Y125.431 E.01396
G1 X128.339 Y125.127 F30000
G1 F5341
G1 X128.631 Y125.303 E.01398
G1 X128.85 Y125.597 E.01506
G1 X128.939 Y125.958 E.01526
G1 X128.866 Y126.365 E.01697
G1 X128.659 Y126.67 E.01515
G1 X128.335 Y126.878 E.01582
G1 X127.975 Y126.94 E.01497
G1 X127.635 Y126.866 E.0143
G1 X127.33 Y126.659 E.01515
G1 X127.122 Y126.335 E.01582
G1 X127.061 Y126.043 E.01222
G1 X127.134 Y125.635 E.01704
G1 X127.341 Y125.33 E.01515
G1 X127.668 Y125.121 E.01593
G1 X128.049 Y125.06 E.01583
G1 X128.281 Y125.114 E.00979
G1 X127.465 Y124.061 F30000
G1 F5341
G1 X127.975 Y123.978 E.02123
G1 X128.536 Y124.05 E.02322
G1 X128.859 Y124.181 E.01427
G1 X129.3 Y124.45 E.02125
G1 X129.659 Y124.859 E.02233
G1 X129.839 Y125.162 E.01445
G1 X129.986 Y125.641 E.02058
G1 X130.012 Y126.071 E.01769
G1 X129.935 Y126.581 E.02116
G1 X129.783 Y126.937 E.01591
G1 X129.474 Y127.385 E.02234
G1 X129.018 Y127.736 E.02364
G1 X128.617 Y127.921 E.01814
G1 X128.046 Y128.022 E.02378
G1 X127.51 Y127.954 E.02218
G1 X127.116 Y127.814 E.0172
G1 X126.668 Y127.521 E.02196
G1 X126.444 Y127.276 E.01364
G1 X126.136 Y126.784 E.02383
G1 X126.004 Y126.263 E.02205
G1 X125.989 Y125.835 E.01762
G1 X126.121 Y125.252 E.02453
G1 X126.375 Y124.811 E.0209
G1 X126.662 Y124.49 E.01767
G1 X127.077 Y124.204 E.02069
G1 X127.409 Y124.081 E.01452
G1 X127.714 Y123.646 F30000
G1 F5341
G1 X128.154 Y123.623 E.01809
G1 X128.717 Y123.728 E.02347
G1 X129.27 Y123.995 E.02523
G1 X129.664 Y124.299 E.02044
G1 X129.989 Y124.698 E.0211
G1 X130.171 Y125.023 E.01532
G1 X130.327 Y125.524 E.02156
G1 X130.378 Y126.009 E.02002
G3 X130.212 Y126.885 I-3.03 J-.12 E.03674
G1 X129.93 Y127.38 E.02339
G1 X129.673 Y127.696 E.01674
G1 X129.223 Y128.031 E.02302
G1 X128.923 Y128.196 E.01408
G1 X128.337 Y128.348 E.02487
G1 X127.973 Y128.382 E.01498
G3 X127.115 Y128.212 I.159 J-3.054 E.03604
G1 X126.62 Y127.93 E.02339
G1 X126.304 Y127.673 E.01674
G1 X125.969 Y127.223 E.02302
G1 X125.804 Y126.923 E.01408
G1 X125.652 Y126.337 E.02487
G1 X125.618 Y126.012 E.0134
G1 X125.691 Y125.448 E.02338
G1 X125.788 Y125.115 E.01421
G1 X126.07 Y124.62 E.02339
G1 X126.327 Y124.304 E.01675
G1 X126.776 Y123.969 E.02301
G1 X127.077 Y123.804 E.01408
G1 X127.656 Y123.661 E.02449
G1 X127.423 Y123.336 F30000
G1 F5341
G1 X127.95 Y123.259 E.02187
G1 X128.555 Y123.32 E.02495
G1 X129.032 Y123.463 E.02046
G1 X129.539 Y123.736 E.02365
G1 X129.925 Y124.051 E.02043
G3 X130.503 Y124.884 I-2.194 J2.141 E.04183
G3 X130.739 Y125.872 I-3.145 J1.272 E.04185
G1 X130.675 Y126.541 E.02758
G1 X130.545 Y127.022 E.02046
G1 X130.236 Y127.57 E.02587
G1 X129.921 Y127.957 E.02047
G3 X129.062 Y128.529 I-2.62 J-3.005 E.04249
G3 X127.966 Y128.742 I-1.237 J-3.435 E.04602
G3 X126.978 Y128.545 I.205 J-3.602 E.04147
G1 X126.43 Y128.236 E.02587
G1 X126.043 Y127.921 E.02046
G3 X125.471 Y127.062 I3.005 J-2.62 E.04249
G3 X125.258 Y126.013 I3.463 J-1.252 E.04409
G3 X125.455 Y124.978 I3.599 J.15 E.04341
G1 X125.764 Y124.43 E.02587
G1 X126.079 Y124.043 E.02047
G3 X126.938 Y123.471 I2.62 J3.005 E.04249
G1 X127.366 Y123.352 E.01822
G1 X126.709 Y126.117 F30000
G1 F5341
G1 X126.706 Y125.913 E.00838
G1 X126.815 Y125.467 E.01885
G1 X127.109 Y125.054 E.0208
G1 X127.558 Y124.777 E.02167
G1 X128.064 Y124.699 E.02103
G1 X128.489 Y124.799 E.01792
G1 X128.882 Y125.043 E.01899
G1 X129.175 Y125.439 E.02023
G1 X129.3 Y125.917 E.02026
G1 X129.234 Y126.416 E.02066
G1 X128.97 Y126.87 E.02156
G1 X128.566 Y127.171 E.02069
G1 X128.067 Y127.299 E.02116
G1 X127.584 Y127.234 E.01999
G1 X127.13 Y126.97 E.02156
G1 X126.829 Y126.566 E.02069
G1 X126.724 Y126.175 E.01663
G1 X124.612 Y127.421 F30000
G1 F5341
G1 X124.869 Y127.947 E.02404
G1 X125.171 Y128.369 E.0213
G1 X125.598 Y128.796 E.0248
G1 X126.181 Y129.196 E.02903
G1 X126.888 Y129.515 E.03185
G1 X127.297 Y129.619 E.01734
G1 X127.938 Y129.689 E.02645
G1 X128.575 Y129.641 E.02626
G1 X129.072 Y129.529 E.02092
G1 X129.699 Y129.272 E.02782
G1 X130.249 Y128.92 E.02679
G1 X130.671 Y128.546 E.02317
G2 X131.528 Y127.081 I-3.348 J-2.942 E.07011
G2 X131.272 Y124.301 I-3.682 J-1.063 E.11735
G2 X130.232 Y123.061 I-3.745 J2.088 E.06684
G1 X129.661 Y122.705 E.02763
G1 X129.108 Y122.485 E.02441
G2 X127.946 Y122.312 I-1.288 J4.66 E.04838
G1 X127.278 Y122.384 E.0276
G1 X126.864 Y122.492 E.01754
G1 X126.27 Y122.741 E.02645
G2 X125.329 Y123.454 I1.951 J3.55 E.04865
G2 X124.472 Y124.919 I3.348 J2.942 E.07011
G2 X124.325 Y125.673 I5.254 J1.418 E.0316
G1 X124.327 Y126.351 E.02782
G1 X124.431 Y126.919 E.02371
G1 X124.591 Y127.365 E.01944
G1 X124.28 Y127.56 F30000
G1 F5341
G1 X124.56 Y128.131 E.02611
G2 X125.606 Y129.262 I3.676 J-2.351 E.06359
G1 X126.151 Y129.602 E.02636
G1 X126.806 Y129.871 E.02906
G2 X128.11 Y130.044 I1.351 J-5.164 E.05416
G2 X129.13 Y129.886 I-.114 J-4.109 E.0425
G1 X129.838 Y129.604 E.03129
G1 X130.299 Y129.334 E.02195
G1 X130.819 Y128.902 E.02777
G2 X131.502 Y128.01 I-2.377 J-2.525 E.0463
G1 X131.74 Y127.512 E.02266
G1 X131.956 Y126.857 E.02833
G2 X131.978 Y125.244 I-4.909 J-.873 E.06654
G1 X131.84 Y124.725 E.02203
G1 X131.582 Y124.108 E.02748
G1 X131.302 Y123.659 E.0217
G1 X130.872 Y123.15 E.02737
G1 X130.488 Y122.807 E.02113
G1 X129.88 Y122.417 E.02966
G1 X129.388 Y122.196 E.02213
G2 X128.245 Y121.959 I-1.755 J5.598 E.04803
G2 X126.725 Y122.16 I-.136 J4.814 E.06319
G1 X126.108 Y122.418 E.02749
G1 X125.534 Y122.793 E.02814
G1 X125.081 Y123.193 E.02482
G2 X124.398 Y124.151 I3.199 J3.003 E.04843
G1 X124.129 Y124.806 E.02906
G2 X123.965 Y125.649 I5.818 J1.575 E.03533
G1 X123.967 Y126.378 E.0299
G1 X124.083 Y127.01 E.02641
G1 X124.259 Y127.503 E.02152
G1 X128.005 Y126.743 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F5341
G1 X128.546 Y126.158 E.03547
G2 X128.442 Y125.644 I-.552 J-.156 E.0242
G1 X127.644 Y126.442 E.05023
G1 X127.529 Y126.317 E.00757
G3 X127.432 Y125.993 I.475 J-.318 E.01529
G1 X128.152 Y125.272 E.04531
; CHANGE_LAYER
; Z_HEIGHT: 25.96
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X127.432 Y125.993 E-.38703
G1 X127.529 Y126.317 E-.12868
G1 X127.644 Y126.442 E-.0647
G1 X127.978 Y126.108 E-.17958
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 93/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L93
M991 S0 P92 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z26.08 I-1.116 J.485 P1  F30000
G1 X129.551 Y129.731 Z26.08
G1 Z25.96
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6291
G1 X129.453 Y129.771 E.00471
G3 X127.647 Y121.97 I-1.46 J-3.772 E.61627
G3 X128.275 Y121.965 I.348 J4.386 E.02795
G3 X129.866 Y129.584 I-.283 J4.035 E.46598
G1 X129.605 Y129.706 E.01279
; WIPE_START
G1 F24000
G1 X129.453 Y129.771 E-.06299
G1 X129.24 Y129.85 E-.08619
G1 X128.802 Y129.965 E-.17238
G1 X128.578 Y130.004 E-.08623
G1 X128.126 Y130.043 E-.17239
G1 X127.899 Y130.044 E-.08623
G1 X127.654 Y130.024 E-.09359
; WIPE_END
G1 E-.04 F1800
G1 X130.195 Y131.158 Z26.36 F30000
G1 Z25.96
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6291
G1 X130.015 Y131.23 E.00795
G3 X122.512 Y127.171 I-2.018 J-5.233 E.39794
G1 X122.512 Y127.171 E0
G3 X126.829 Y120.512 I5.49 J-1.169 E.36187
G1 X126.829 Y120.512 E0
G3 X128.394 Y120.403 I1.233 J6.38 E.06457
G3 X130.588 Y130.971 I-.398 J5.594 E.59651
G1 X130.249 Y131.132 E.01541
M204 S10000
; WIPE_START
G1 F24000
G1 X130.015 Y131.23 E-.0963
G1 X129.721 Y131.342 E-.11959
G1 X129.112 Y131.501 E-.23916
G1 X128.802 Y131.555 E-.11964
G1 X128.316 Y131.598 E-.1853
; WIPE_END
G1 E-.04 F1800
G1 X128.821 Y126.862 Z26.36 F30000
G1 Z25.96
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F6291
G1 X129.066 Y126.547 E.01643
G1 X129.179 Y126.163 E.01643
G1 X129.174 Y125.763 E.01643
G1 X129.023 Y125.392 E.01643
G1 X128.77 Y125.082 E.01643
G1 X128.421 Y124.886 E.01643
G1 X128.03 Y124.802 E.01643
G1 X127.635 Y124.867 E.01643
G1 X127.277 Y125.045 E.01643
G1 X127.008 Y125.342 E.01643
G1 X126.839 Y125.704 E.01643
G1 X126.802 Y125.97 E.01101
G1 X126.867 Y126.365 E.01643
G1 X127.045 Y126.723 E.01643
G1 X127.342 Y126.992 E.01643
G1 X127.704 Y127.161 E.01643
G1 X128.104 Y127.186 E.01643
G1 X128.493 Y127.092 E.01643
G1 X128.771 Y126.897 E.01397
G1 X127.856 Y125.552 F30000
G1 F6291
G1 X127.637 Y125.696 E.01073
G1 X127.526 Y125.988 E.01284
G1 X127.595 Y126.24 E.01074
G1 X127.784 Y126.421 E.01073
G1 X128.041 Y126.469 E.01074
G1 X128.286 Y126.378 E.01073
G1 X128.44 Y126.166 E.01074
G1 X128.464 Y125.906 E.01073
G1 X128.341 Y125.676 E.01074
G1 X128.117 Y125.541 E.01073
G1 X127.916 Y125.549 E.00827
G1 X128.036 Y125.937 F30000
; LINE_WIDTH: 0.641513
G1 F6291
G2 X128.043 Y126.052 I-.033 J.059 E.01916
G1 X128.762 Y125.656 F30000
; LINE_WIDTH: 0.42
G1 F6291
G1 X128.537 Y125.36 E.01527
G1 X128.206 Y125.19 E.01527
G1 X127.834 Y125.181 E.01527
G1 X127.495 Y125.334 E.01527
G1 X127.256 Y125.619 E.01527
G1 X127.164 Y125.979 E.01527
G1 X127.238 Y126.344 E.01528
G1 X127.463 Y126.64 E.01527
G1 X127.794 Y126.81 E.01527
G1 X128.166 Y126.819 E.01527
G1 X128.505 Y126.666 E.01527
G1 X128.744 Y126.381 E.01527
G1 X128.836 Y126.021 E.01527
G1 X128.774 Y125.715 E.01281
G1 X129.529 Y125.691 F30000
G1 F6291
G2 X129.56 Y126.039 I-1.524 J.309 E.38687
G1 X129.535 Y125.751 E.01188
G1 X129.884 Y125.619 F30000
G1 F6291
G1 X129.752 Y125.209 E.01768
G1 X129.532 Y124.839 E.01767
G1 X129.236 Y124.527 E.01768
G1 X128.877 Y124.289 E.01767
G1 X128.474 Y124.137 E.01768
G1 X128.048 Y124.078 E.01767
G1 X127.619 Y124.116 E.01768
G1 X127.209 Y124.248 E.01768
G1 X126.839 Y124.468 E.01767
G1 X126.527 Y124.764 E.01768
G1 X126.289 Y125.123 E.01767
G1 X126.137 Y125.526 E.01768
G1 X126.078 Y125.952 E.01767
G1 X126.116 Y126.381 E.01768
G1 X126.248 Y126.791 E.01768
G1 X126.468 Y127.161 E.01767
G1 X126.764 Y127.473 E.01768
G1 X127.123 Y127.711 E.01767
G1 X127.526 Y127.863 E.01768
G1 X127.952 Y127.922 E.01768
G1 X128.381 Y127.884 E.01768
G1 X128.791 Y127.752 E.01768
G1 X129.161 Y127.532 E.01767
G1 X129.473 Y127.236 E.01768
G1 X129.711 Y126.877 E.01767
G1 X129.863 Y126.474 E.01767
G1 X129.922 Y126.048 E.01767
G1 X129.89 Y125.679 E.01521
G1 X131.693 Y125.006 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6291
G1 X128.989 Y122.302 E.17015
G1 X128.321 Y122.185
G1 X131.816 Y125.681 E.21991
G1 X131.822 Y126.238
G1 X127.766 Y122.181 E.25518
G1 X127.277 Y122.244
G1 X131.756 Y126.723 E.28174
M204 S10000
G1 X130.085 Y125.604 F30000
M204 S2000
G1 F6291
G1 X131.644 Y127.162 E.09804
G1 X131.491 Y127.561
G1 X130.115 Y126.185 E.0866
G1 X130.023 Y126.644
G1 X131.309 Y127.93 E.0809
G1 X131.089 Y128.262
G1 X129.856 Y127.029 E.07756
G1 X129.632 Y127.357
G1 X130.84 Y128.565 E.07599
G1 X130.564 Y128.84
G1 X129.357 Y127.632 E.07595
G1 X129.029 Y127.856
G1 X130.259 Y129.086 E.0774
G1 X129.926 Y129.304
G1 X128.644 Y128.023 E.08063
G1 X128.185 Y128.115
G1 X129.561 Y129.491 E.08659
G1 X129.167 Y129.648
G1 X127.604 Y128.085 E.09833
M204 S10000
G1 X128.396 Y123.915 F30000
M204 S2000
G1 F6291
G1 X126.833 Y122.352 E.09832
G1 X126.434 Y122.505
G1 X127.815 Y123.885 E.08684
G1 X127.356 Y123.977
G1 X126.071 Y122.692 E.08082
G1 X125.741 Y122.914
G1 X126.971 Y124.144 E.0774
G1 X126.643 Y124.368
G1 X125.434 Y123.158 E.0761
G1 X125.161 Y123.437
G1 X126.367 Y124.643 E.07591
G1 X126.144 Y124.971
G1 X124.914 Y123.741 E.07739
G1 X124.696 Y124.074
G1 X125.977 Y125.356 E.08062
G1 X125.885 Y125.815
G1 X124.509 Y124.439 E.0866
G1 X124.352 Y124.833
G1 X125.915 Y126.396 E.09834
M204 S10000
G1 X124.24 Y125.272 F30000
M204 S2000
G1 F6291
G1 X128.723 Y129.756 E.28203
G1 X128.234 Y129.819
G1 X124.18 Y125.764 E.25504
G1 X124.189 Y126.325
G1 X127.681 Y129.817 E.21966
G1 X127.006 Y129.694
G1 X124.299 Y126.986 E.17034
M204 S10000
G1 X126.552 Y129.547 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.147715
G1 F6291
G1 X126.417 Y129.453 E.00164
; LINE_WIDTH: 0.182929
G1 X126.283 Y129.358 E.0023
; LINE_WIDTH: 0.218144
G1 X126.17 Y129.271 E.00257
; LINE_WIDTH: 0.254434
G1 X126.058 Y129.184 E.00316
; LINE_WIDTH: 0.290724
G1 X125.945 Y129.096 E.00375
; LINE_WIDTH: 0.327014
G1 X125.788 Y128.96 E.00634
; LINE_WIDTH: 0.382199
G3 X125.195 Y128.39 I5.591 J-6.409 E.03023
; LINE_WIDTH: 0.38925
G1 X125.057 Y128.232 E.0079
; LINE_WIDTH: 0.360412
G1 X124.918 Y128.073 E.00721
; LINE_WIDTH: 0.331574
G1 X124.831 Y127.961 E.00441
; LINE_WIDTH: 0.2962
G1 X124.744 Y127.848 E.00383
; LINE_WIDTH: 0.260825
G1 X124.656 Y127.736 E.00326
; LINE_WIDTH: 0.225451
G1 X124.555 Y127.593 E.00331
; LINE_WIDTH: 0.19095
G1 X124.453 Y127.45 E.00262
G1 X127.533 Y128.157 F30000
; LINE_WIDTH: 0.149516
G1 F6291
G1 X127.254 Y127.988 E.00332
G1 X127.536 Y128.153 F30000
; LINE_WIDTH: 0.213426
G1 F6291
G3 X127.251 Y127.992 I5.718 J-10.468 E.00573
G1 X128.968 Y127.889 F30000
; LINE_WIDTH: 0.111227
G1 F6291
G1 X128.891 Y127.944 E.00055
G1 X128.83 Y127.933 E.00036
G1 X130.157 Y125.532 F30000
; LINE_WIDTH: 0.142857
G1 F6291
G1 X129.987 Y125.254 E.00307
G1 X130.153 Y125.536 F30000
; LINE_WIDTH: 0.208147
G1 F6291
G2 X129.991 Y125.252 I-10.194 J5.6 E.00553
G1 X131.549 Y124.549 F30000
; LINE_WIDTH: 0.155124
G1 F6291
G1 X131.436 Y124.395 E.00207
; LINE_WIDTH: 0.198945
G1 X131.323 Y124.241 E.00302
; LINE_WIDTH: 0.242766
G1 X131.21 Y124.088 E.00397
; LINE_WIDTH: 0.286589
G1 X131.085 Y123.93 E.0052
; LINE_WIDTH: 0.331026
G1 X130.947 Y123.772 E.0065
; LINE_WIDTH: 0.384672
G2 X130.336 Y123.146 I-6.101 J5.34 E.03239
; LINE_WIDTH: 0.381726
G1 X130.196 Y123.025 E.0068
; LINE_WIDTH: 0.354494
G1 X130.056 Y122.904 E.00623
; LINE_WIDTH: 0.327263
G1 X129.944 Y122.818 E.00431
; LINE_WIDTH: 0.291258
G1 X129.832 Y122.731 E.00373
; LINE_WIDTH: 0.255252
G1 X129.72 Y122.645 E.00315
; LINE_WIDTH: 0.219246
G1 X129.629 Y122.582 E.002
; LINE_WIDTH: 0.18179
G1 X129.538 Y122.52 E.00153
; LINE_WIDTH: 0.144334
G1 X129.447 Y122.458 E.00106
G1 X128.748 Y124.008 F30000
; LINE_WIDTH: 0.211253
G1 F6291
G2 X128.463 Y123.847 I-5.756 J9.865 E.00565
G1 X128.746 Y124.012 F30000
; LINE_WIDTH: 0.148197
G1 F6291
G1 X128.467 Y123.843 E.00328
G1 X127.17 Y124.067 F30000
; LINE_WIDTH: 0.123472
G1 F6291
G1 X127.109 Y124.056 E.00045
G1 X127.031 Y124.111 E.00069
G1 X126.009 Y126.749 F30000
; LINE_WIDTH: 0.20408
G1 F6291
G3 X125.847 Y126.464 I10.152 J-5.95 E.00538
G1 X126.013 Y126.746 F30000
; LINE_WIDTH: 0.141844
G1 F6291
G1 X125.843 Y126.468 E.00304
; WIPE_START
G1 F24000
G1 X126.013 Y126.746 E-.76
; WIPE_END
M73 P95 R0
G1 E-.04 F1800
G1 X133.108 Y124.216 Z26.36 F30000
G1 Z25.96
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F6291
G1 X129.784 Y120.892 E.2091
G1 X129.027 Y120.686
G1 X133.314 Y124.972 E.26967
M204 S10000
; WIPE_START
G1 F24000
G1 X131.899 Y123.558 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.723 Y123.933 Z26.36 F30000
G1 Z25.96
G1 E.8 F1800
M204 S2000
G1 F6291
G1 X133.397 Y125.607 E.10532
G1 X133.409 Y126.171
G1 X132.105 Y124.867 E.08206
G1 X132.234 Y125.547
G1 X133.369 Y126.682 E.07136
G1 X133.287 Y127.152
G1 X132.258 Y126.122 E.06476
G1 X132.212 Y126.628
G1 X133.173 Y127.589 E.06047
G1 X133.029 Y127.997
G1 X132.118 Y127.086 E.05732
G1 X131.985 Y127.504
G1 X132.86 Y128.379 E.05503
G1 X132.669 Y128.739
G1 X131.817 Y127.888 E.05356
G1 X131.62 Y128.242
G1 X132.453 Y129.074 E.05238
G1 X132.217 Y129.39
G1 X131.397 Y128.57 E.05162
G1 X131.146 Y128.87
G1 X131.962 Y129.687 E.05137
G1 X131.686 Y129.962
G1 X130.87 Y129.146 E.05135
G1 X130.57 Y129.397
G1 X131.39 Y130.217 E.05159
G1 X131.075 Y130.453
G1 X130.242 Y129.62 E.05239
G1 X129.887 Y129.817
G1 X130.738 Y130.668 E.05354
G1 X130.379 Y130.86
G1 X129.504 Y129.985 E.05505
G1 X129.086 Y130.119
G1 X129.997 Y131.03 E.05731
G1 X129.589 Y131.173
G1 X128.628 Y130.213 E.06041
G1 X128.122 Y130.258
G1 X129.152 Y131.287 E.06477
G1 X128.681 Y131.368
G1 X127.547 Y130.234 E.07135
G1 X126.866 Y130.105
G1 X128.172 Y131.41 E.08214
G1 X127.608 Y131.398
G1 X125.933 Y129.723 E.10536
M204 S10000
G1 X130.067 Y122.277 F30000
M204 S2000
G1 F6291
G1 X128.392 Y120.602 E.10535
G1 X127.828 Y120.59
G1 X129.134 Y121.895 E.08213
G1 X128.453 Y121.766
G1 X127.319 Y120.632 E.07135
G1 X126.848 Y120.713
G1 X127.878 Y121.742 E.06477
G1 X127.371 Y121.787
G1 X126.411 Y120.827 E.06041
G1 X126.003 Y120.97
G1 X126.914 Y121.881 E.05731
G1 X126.496 Y122.015
G1 X125.621 Y121.14 E.05505
G1 X125.261 Y121.332
G1 X126.113 Y122.183 E.05354
G1 X125.758 Y122.38
G1 X124.925 Y121.547 E.05239
G1 X124.61 Y121.783
G1 X125.43 Y122.603 E.05159
G1 X125.13 Y122.854
G1 X124.314 Y122.038 E.05135
G1 X124.037 Y122.313
G1 X124.854 Y123.13 E.05137
G1 X124.603 Y123.43
G1 X123.783 Y122.61 E.05162
G1 X123.547 Y122.926
G1 X124.38 Y123.758 E.05238
G1 X124.183 Y124.113
G1 X123.331 Y123.261 E.05356
G1 X123.14 Y123.621
G1 X124.015 Y124.496 E.05503
G1 X123.882 Y124.914
G1 X122.97 Y124.003 E.05732
G1 X122.826 Y124.411
G1 X123.788 Y125.372 E.06047
G1 X123.742 Y125.878
G1 X122.713 Y124.849 E.06476
G1 X122.631 Y125.318
G1 X123.766 Y126.453 E.07137
G1 X123.895 Y127.134
G1 X122.59 Y125.829 E.08206
G1 X122.603 Y126.393
G1 X124.277 Y128.067 E.10533
M204 S10000
; WIPE_START
G1 F24000
G1 X122.863 Y126.653 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.686 Y127.028 Z26.36 F30000
G1 Z25.96
G1 E.8 F1800
M204 S2000
G1 F6291
G1 X126.973 Y131.314 E.26966
G1 X126.215 Y131.108
G1 X122.892 Y127.785 E.20909
M204 S10000
; WIPE_START
G1 F24000
G1 X124.306 Y129.199 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.048 Y130.332 Z26.36 F30000
G1 Z25.96
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.115339
G1 F6291
G1 X127.826 Y130.237 E.00152
G1 X126.8 Y130.171 F30000
; LINE_WIDTH: 0.21149
G1 F6291
G3 X126.493 Y129.987 I6.458 J-11.096 E.00618
; WIPE_START
G1 F24000
G1 X126.8 Y130.171 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.704 Y130.9 Z26.36 F30000
G1 Z25.96
G1 E.8 F1800
; LINE_WIDTH: 0.106878
G1 F6291
G1 X125.625 Y130.844 E.00052
; LINE_WIDTH: 0.135718
G1 X125.545 Y130.788 E.00084
; LINE_WIDTH: 0.164558
G1 X125.424 Y130.697 E.00181
; LINE_WIDTH: 0.207482
G1 X125.303 Y130.606 E.00255
; LINE_WIDTH: 0.250406
G1 X125.185 Y130.512 E.00326
; LINE_WIDTH: 0.284494
G1 X125.067 Y130.419 E.00384
; LINE_WIDTH: 0.318581
G1 X124.953 Y130.323 E.00439
; LINE_WIDTH: 0.344082
G1 X124.84 Y130.227 E.00483
; LINE_WIDTH: 0.369583
G1 X124.618 Y130.03 E.01045
; LINE_WIDTH: 0.413346
G3 X123.795 Y129.185 I9.607 J-10.194 E.04756
; LINE_WIDTH: 0.374206
G1 X123.602 Y128.958 E.01067
; LINE_WIDTH: 0.32509
G1 X123.509 Y128.841 E.00454
; LINE_WIDTH: 0.29196
G1 X123.415 Y128.724 E.00397
; LINE_WIDTH: 0.258832
G1 X123.324 Y128.603 E.00344
; LINE_WIDTH: 0.216912
G1 X123.232 Y128.482 E.00271
; LINE_WIDTH: 0.174993
G1 X123.166 Y128.389 E.0015
; LINE_WIDTH: 0.140936
G1 X123.1 Y128.296 E.00105
; WIPE_START
G1 F24000
G1 X123.166 Y128.389 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X125.945 Y129.711 Z26.36 F30000
G1 Z25.96
G1 E.8 F1800
; LINE_WIDTH: 0.215638
G1 F6291
G1 X125.795 Y129.73 E.00268
; LINE_WIDTH: 0.245492
G1 X125.707 Y129.66 E.00237
; LINE_WIDTH: 0.219201
G1 X125.617 Y129.588 E.0021
; LINE_WIDTH: 0.193378
G1 X125.432 Y129.432 E.00367
; LINE_WIDTH: 0.124294
G1 X124.91 Y128.94 E.00525
G1 X124.584 Y128.586 E.00353
; LINE_WIDTH: 0.149767
G1 X124.427 Y128.401 E.00248
; LINE_WIDTH: 0.189261
G1 X124.352 Y128.308 E.00176
; LINE_WIDTH: 0.228633
G1 X124.214 Y128.13 E.00433
G1 X124.015 Y127.507 F30000
; LINE_WIDTH: 0.198745
G1 F6291
G3 X123.829 Y127.2 I11.527 J-7.167 E.00568
; WIPE_START
G1 F24000
G1 X124.015 Y127.507 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X122.957 Y127.719 Z26.36 F30000
G1 Z25.96
G1 E.8 F1800
; LINE_WIDTH: 0.227567
G1 F6291
G1 X122.769 Y127.421 E.00675
G1 X122.75 Y126.964 F30000
; LINE_WIDTH: 0.128698
G1 F6291
M73 P96 R0
G1 X122.632 Y126.72 E.00212
; WIPE_START
G1 F24000
G1 X122.75 Y126.964 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.157 Y124.165 Z26.36 F30000
G1 Z25.96
G1 E.8 F1800
; LINE_WIDTH: 0.111509
G1 F6291
G1 X124.097 Y124.25 E.00061
G1 X124.109 Y124.315 E.00038
G1 X128.174 Y121.763 F30000
; LINE_WIDTH: 0.114002
G1 F6291
G1 X127.952 Y121.668 E.00148
G1 X129.506 Y122.013 F30000
; LINE_WIDTH: 0.205788
G1 F6291
G2 X129.2 Y121.829 I-6.697 J10.797 E.00594
; WIPE_START
G1 F24000
G1 X129.506 Y122.013 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.9 Y123.705 Z26.36 F30000
G1 Z25.96
G1 E.8 F1800
; LINE_WIDTH: 0.106878
G1 F6291
G1 X132.834 Y123.611 E.00061
; LINE_WIDTH: 0.140985
G1 X132.768 Y123.518 E.00106
; LINE_WIDTH: 0.175091
G1 X132.676 Y123.397 E.00199
; LINE_WIDTH: 0.21701
G1 X132.585 Y123.276 E.00271
; LINE_WIDTH: 0.258931
G1 X132.491 Y123.159 E.0034
; LINE_WIDTH: 0.292063
G1 X132.398 Y123.042 E.00397
; LINE_WIDTH: 0.325192
G1 X132.205 Y122.815 E.009
; LINE_WIDTH: 0.406045
G2 X131.381 Y121.97 I-10.43 J9.348 E.04658
; LINE_WIDTH: 0.403798
G1 X131.16 Y121.773 E.01161
; LINE_WIDTH: 0.36968
G1 X131.047 Y121.677 E.00526
; LINE_WIDTH: 0.344185
G1 X130.933 Y121.581 E.00483
; LINE_WIDTH: 0.318691
G1 X130.815 Y121.488 E.00443
; LINE_WIDTH: 0.284591
G1 X130.697 Y121.394 E.00385
; LINE_WIDTH: 0.250491
G1 X130.576 Y121.303 E.0033
; LINE_WIDTH: 0.207571
G1 X130.455 Y121.212 E.00255
; LINE_WIDTH: 0.164651
G1 X130.375 Y121.156 E.00116
; LINE_WIDTH: 0.135765
G1 X130.296 Y121.1 E.00084
; WIPE_START
G1 F24000
G1 X130.375 Y121.156 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.786 Y123.87 Z26.36 F30000
G1 Z25.96
G1 E.8 F1800
; LINE_WIDTH: 0.245166
G1 F6291
G1 X131.722 Y123.786 E.00223
; LINE_WIDTH: 0.242007
G1 X131.648 Y123.692 E.00248
; LINE_WIDTH: 0.214806
G1 X131.571 Y123.596 E.00218
; LINE_WIDTH: 0.188052
G1 X131.415 Y123.412 E.00352
; LINE_WIDTH: 0.12347
G1 X130.921 Y122.892 E.00518
G1 X130.566 Y122.566 E.00349
; LINE_WIDTH: 0.153487
G1 X130.38 Y122.41 E.00258
; LINE_WIDTH: 0.194482
G1 X130.292 Y122.34 E.00172
; LINE_WIDTH: 0.222905
G1 X130.205 Y122.27 E.00209
G1 X130.054 Y122.289 E.00281
G1 X132.173 Y124.799 F30000
; LINE_WIDTH: 0.193996
G1 F6291
G1 X131.986 Y124.493 E.00548
; WIPE_START
G1 F24000
G1 X132.173 Y124.799 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X133.231 Y124.58 Z26.36 F30000
G1 Z25.96
G1 E.8 F1800
; LINE_WIDTH: 0.224526
G1 F6291
G1 X133.043 Y124.281 E.00663
; WIPE_START
G1 F24000
G1 X133.231 Y124.58 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X133.368 Y125.28 Z26.36 F30000
G1 Z25.96
G1 E.8 F1800
; LINE_WIDTH: 0.106878
G1 F6291
G1 X133.25 Y125.036 E.00144
; WIPE_START
G1 F24000
G1 X133.368 Y125.28 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.891 Y127.686 Z26.36 F30000
G1 Z25.96
G1 E.8 F1800
; LINE_WIDTH: 0.125441
G1 F6291
G1 X131.903 Y127.75 E.00049
G1 X131.842 Y127.835 E.00078
; CHANGE_LAYER
; Z_HEIGHT: 26.24
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X131.903 Y127.75 E-.46808
G1 X131.891 Y127.686 E-.29192
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 94/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L94
M991 S0 P93 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z26.36 I-.513 J-1.103 P1  F30000
G1 X129.023 Y129.02 Z26.36
G1 Z26.24
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F4508
G1 X128.633 Y129.13 E.01805
G3 X127.9 Y122.805 I-.642 J-3.131 E.47139
G3 X128.214 Y122.812 I.098 J2.791 E.01394
G3 X129.148 Y128.979 I-.223 J3.188 E.384
G1 X129.08 Y129.001 E.00316
; WIPE_START
G1 F24000
G1 X128.633 Y129.13 E-.17696
G1 X128.324 Y129.179 E-.11897
G1 X127.92 Y129.195 E-.15336
G1 X127.563 Y129.166 E-.1362
G1 X127.211 Y129.098 E-.13621
G1 X127.116 Y129.065 E-.03829
; WIPE_END
G1 E-.04 F1800
G1 X129.5 Y130.657 Z26.64 F30000
G1 Z26.24
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F4508
G3 X128.32 Y121.117 I-1.5 J-4.657 E.7069
G3 X132.867 Y125.498 I-.321 J4.884 E.28175
G1 X132.867 Y125.498 E0
G3 X129.557 Y130.638 I-4.867 J.502 E.27115
M204 S10000
; WIPE_START
G1 F24000
G1 X129.237 Y130.736 E-.1271
G1 X128.699 Y130.844 E-.20857
G1 X128.427 Y130.876 E-.10434
G1 X127.878 Y130.893 E-.20857
G1 X127.586 Y130.869 E-.11142
; WIPE_END
G1 E-.04 F1800
G1 X128.687 Y128.898 Z26.64 F30000
G1 Z26.24
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F4508
G1 X130.897 Y126.688 E.13902
G1 X130.977 Y126.056
G1 X128.053 Y128.979 E.18389
G1 X127.545 Y128.936
G1 X130.943 Y125.539 E.2137
G1 X130.839 Y125.091
G1 X127.094 Y128.836 E.23557
M204 S10000
G1 X128.111 Y127.268 F30000
M204 S2000
G1 F4508
G1 X126.699 Y128.68 E.08882
G1 X126.353 Y128.474
G1 X127.613 Y127.214 E.07927
G1 X127.248 Y127.028
G1 X126.037 Y128.239 E.07617
G1 X125.76 Y127.964
G1 X126.972 Y126.752 E.07626
G1 X126.786 Y126.387
G1 X125.519 Y127.653 E.07968
G1 X125.32 Y127.302
G1 X126.731 Y125.891 E.08876
M204 S10000
G1 X129.269 Y126.109 F30000
M204 S2000
G1 F4508
G1 X130.679 Y124.699 E.08869
G1 X130.474 Y124.353
G1 X129.214 Y125.613 E.07928
G1 X129.028 Y125.248
G1 X130.239 Y124.037 E.07618
G1 X129.962 Y123.762
G1 X128.752 Y124.972 E.07612
G1 X128.387 Y124.786
G1 X129.654 Y123.519 E.07969
G1 X129.301 Y123.32
G1 X127.891 Y124.731 E.08871
M204 S10000
G1 X128.906 Y123.164 F30000
M204 S2000
G1 F4508
G1 X125.161 Y126.909 E.2356
G1 X125.058 Y126.461
G1 X128.462 Y123.057 E.21412
G1 X127.947 Y123.021
G1 X125.023 Y125.944 E.18389
G1 X125.103 Y125.313
G1 X127.304 Y123.112 E.13844
M204 S10000
G1 X127.813 Y124.653 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116797
G1 F4508
G2 X127.568 Y124.803 I5.279 J8.869 E.00186
G1 X127.82 Y124.66 F30000
; LINE_WIDTH: 0.166648
G1 F4508
G1 X127.567 Y124.801 E.00352
G1 X127.906 Y124.746 F30000
; LINE_WIDTH: 0.131102
G1 F4508
G1 X127.676 Y124.67 E.00197
G1 X130.755 Y127.132 F30000
; LINE_WIDTH: 0.106878
G1 F4508
G1 X130.685 Y127.234 E.00066
; LINE_WIDTH: 0.147977
G1 X130.615 Y127.336 E.00124
; LINE_WIDTH: 0.189075
G1 X130.511 Y127.467 E.00245
; LINE_WIDTH: 0.226927
G1 X130.407 Y127.597 E.00317
; LINE_WIDTH: 0.264778
G1 X130.303 Y127.728 E.00389
; LINE_WIDTH: 0.316576
G3 X129.858 Y128.187 I-4.31 J-3.734 E.01872
; LINE_WIDTH: 0.322348
G1 X129.614 Y128.4 E.00971
; LINE_WIDTH: 0.277887
G1 X129.5 Y128.489 E.00358
; LINE_WIDTH: 0.242604
G1 X129.386 Y128.578 E.003
; LINE_WIDTH: 0.207322
G1 X129.26 Y128.669 E.00263
; LINE_WIDTH: 0.173352
G1 X129.133 Y128.76 E.00202
G1 X126.867 Y123.24 F30000
; LINE_WIDTH: 0.139289
G1 F4508
G1 X126.74 Y123.331 E.00141
; LINE_WIDTH: 0.173257
G1 X126.614 Y123.422 E.00202
; LINE_WIDTH: 0.207223
G1 X126.5 Y123.511 E.00242
; LINE_WIDTH: 0.242504
G1 X126.386 Y123.6 E.003
; LINE_WIDTH: 0.277787
G1 X126.142 Y123.813 E.00806
; LINE_WIDTH: 0.326236
G2 X125.696 Y124.272 I3.865 J4.192 E.01942
; LINE_WIDTH: 0.302529
G1 X125.593 Y124.403 E.00461
; LINE_WIDTH: 0.264679
G1 X125.489 Y124.533 E.00389
; LINE_WIDTH: 0.226828
G1 X125.385 Y124.664 E.00317
; LINE_WIDTH: 0.188977
G1 X125.315 Y124.766 E.00182
; LINE_WIDTH: 0.147928
G1 X125.245 Y124.868 E.00124
G1 X127.977 Y126.699 F30000
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.42
G1 F4508
G1 X128.277 Y126.651 E.01249
G2 X128.25 Y125.339 I-.294 J-.65 E.0684
G1 X127.919 Y125.302 E.01367
G1 X127.605 Y125.413 E.01367
G2 X127.643 Y126.61 I.395 J.587 E.05861
G1 X127.919 Y126.684 E.01173
G1 X128.02 Y125.965 F30000
; LINE_WIDTH: 0.372641
G1 F4508
G1 X127.961 Y125.999 E.00241
G1 X128.002 Y126.023 E.00167
G1 X127.658 Y126.001 F30000
; LINE_WIDTH: 0.42
G1 F4508
G1 X127.739 Y126.221 E.00963
G1 X127.94 Y126.338 E.00951
G1 X128.127 Y126.319 E.00773
G1 X128.304 Y126.156 E.00988
G1 X128.335 Y125.932 E.00927
G1 X128.22 Y125.738 E.00927
G1 X127.996 Y125.656 E.0098
G1 X127.809 Y125.716 E.00806
G1 X127.673 Y125.899 E.00937
G1 X127.667 Y125.942 E.00177
G1 X126.928 Y126.02 F30000
G1 F4508
G1 X127 Y126.386 E.01532
G1 X127.183 Y126.694 E.01472
G1 X127.458 Y126.925 E.01475
G1 X127.795 Y127.053 E.01479
G1 X128.124 Y127.065 E.01352
G1 X128.427 Y126.983 E.01289
G1 X128.739 Y126.776 E.01537
G1 X128.954 Y126.489 E.01472
G1 X129.062 Y126.147 E.01475
G1 X129.051 Y125.788 E.01475
G1 X128.922 Y125.452 E.01475
G1 X128.689 Y125.179 E.01475
G1 X128.379 Y124.997 E.01475
G1 X128.024 Y124.928 E.01485
G1 X127.731 Y124.962 E.0121
G1 X127.402 Y125.11 E.01485
G1 X127.141 Y125.358 E.01475
G1 X126.977 Y125.678 E.01477
G1 X126.937 Y125.96 E.01171
; WIPE_START
G1 F24000
G1 X126.977 Y125.678 E-.1084
G1 X127.141 Y125.358 E-.13667
G1 X127.402 Y125.11 E-.13647
G1 X127.731 Y124.962 E-.13748
G1 X128.024 Y124.928 E-.11202
G1 X128.357 Y124.993 E-.12895
; WIPE_END
G1 E-.04 F1800
G1 X132.152 Y128.189 Z26.64 F30000
G1 Z26.24
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F4508
G1 X130.188 Y130.154 E.12358
G1 X129.272 Y130.518
G1 X132.517 Y127.272 E.20416
G1 X132.658 Y126.581
G1 X128.581 Y130.657 E.25644
M204 S10000
; WIPE_START
G1 F24000
G1 X129.995 Y129.243 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.775 Y128.911 Z26.64 F30000
G1 Z26.24
G1 E.8 F1800
M204 S2000
G1 F4508
G1 X127.994 Y130.693 E.11208
G1 X127.472 Y130.663
G1 X128.827 Y129.308 E.08524
G1 X128.18 Y129.404
G1 X126.999 Y130.585 E.07431
G1 X126.564 Y130.469
G1 X127.642 Y129.391 E.06784
G1 X127.173 Y129.309
G1 X126.162 Y130.319 E.06355
G1 X125.79 Y130.14
G1 X126.755 Y129.175 E.06074
G1 X126.379 Y129
G1 X125.442 Y129.936 E.0589
G1 X125.121 Y129.706
G1 X126.038 Y128.789 E.05772
G1 X125.731 Y128.545
G1 X124.822 Y129.454 E.05719
G1 X124.546 Y129.178
G1 X125.455 Y128.269 E.05717
G1 X125.211 Y127.962
G1 X124.293 Y128.88 E.05774
G1 X124.064 Y128.557
G1 X125 Y127.621 E.05887
G1 X124.825 Y127.245
G1 X123.859 Y128.211 E.06074
G1 X123.681 Y127.837
G1 X124.692 Y126.827 E.06356
G1 X124.609 Y126.358
G1 X123.53 Y127.437 E.06786
G1 X123.414 Y127.001
G1 X124.595 Y125.821 E.07427
G1 X124.691 Y125.173
G1 X123.337 Y126.528 E.08521
G1 X123.307 Y126.006
G1 X125.09 Y124.223 E.11215
M204 S10000
G1 X130.911 Y127.776 F30000
M204 S2000
G1 F4508
G1 X132.693 Y125.994 E.11214
G1 X132.663 Y125.472
G1 X131.308 Y126.827 E.08524
G1 X131.405 Y126.179
G1 X132.586 Y124.999 E.07426
G1 X132.47 Y124.563
G1 X131.391 Y125.642 E.06786
G1 X131.308 Y125.173
G1 X132.319 Y124.163 E.06355
G1 X132.141 Y123.789
G1 X131.175 Y124.755 E.06074
G1 X131 Y124.379
G1 X131.936 Y123.443 E.05887
G1 X131.707 Y123.12
G1 X130.789 Y124.038 E.05774
G1 X130.545 Y123.731
G1 X131.454 Y122.822 E.05717
G1 X131.178 Y122.546
G1 X130.269 Y123.455 E.05719
G1 X129.962 Y123.211
G1 X130.879 Y122.294 E.05772
G1 X130.557 Y122.064
G1 X129.621 Y123 E.0589
G1 X129.245 Y122.825
G1 X130.21 Y121.86 E.06074
G1 X129.837 Y121.681
G1 X128.827 Y122.691 E.06355
G1 X128.357 Y122.61
G1 X129.436 Y121.531 E.06791
G1 X129.001 Y121.415
G1 X127.821 Y122.595 E.07425
G1 X127.173 Y122.692
G1 X128.528 Y121.337 E.08525
G1 X128.006 Y121.307
G1 X126.224 Y123.089 E.1121
M204 S10000
; WIPE_START
G1 F24000
G1 X127.638 Y121.675 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.419 Y121.343 Z26.64 F30000
G1 Z26.24
G1 E.8 F1800
M204 S2000
G1 F4508
G1 X123.342 Y125.419 E.25643
G1 X123.483 Y124.727
G1 X126.728 Y121.482 E.20414
G1 X125.812 Y121.847
G1 X123.848 Y123.811 E.12355
M204 S10000
; WIPE_START
G1 F24000
G1 X125.262 Y122.396 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.472 Y125.837 Z26.64 F30000
G1 Z26.24
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.120527
G1 F4508
G1 X131.39 Y125.663 E.00133
G1 X131.377 Y126.896 F30000
; LINE_WIDTH: 0.178485
G1 F4508
G1 X131.197 Y127.192 E.00469
G1 X130.973 Y127.839 F30000
; LINE_WIDTH: 0.247357
G1 F4508
G1 X130.776 Y128.078 E.00662
; LINE_WIDTH: 0.19024
G1 X130.38 Y128.499 E.00858
G1 X130.092 Y128.765 E.00582
; LINE_WIDTH: 0.224179
G1 X129.838 Y128.974 E.00615
; WIPE_START
G1 F24000
G1 X130.092 Y128.765 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.37 Y127.73 Z26.64 F30000
G1 Z26.24
G1 E.8 F1800
; LINE_WIDTH: 0.174201
G1 F4508
G1 X132.229 Y127.928 E.00316
; LINE_WIDTH: 0.207792
G1 X132.089 Y128.126 E.00409
; WIPE_START
G1 F24000
G1 X132.229 Y127.928 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.053 Y129.358 Z26.64 F30000
G1 Z26.24
G1 E.8 F1800
; LINE_WIDTH: 0.114658
G1 F4508
G1 X128.812 Y129.293 E.00155
G1 X129.193 Y129.196 F30000
; LINE_WIDTH: 0.166505
G1 F4508
G1 X128.896 Y129.377 E.00422
G1 X127.837 Y129.471 F30000
; LINE_WIDTH: 0.135852
G1 F4508
G3 X127.662 Y129.389 I2.812 J-6.234 E.00167
G1 X124.804 Y124.807 F30000
; LINE_WIDTH: 0.176967
G1 F4508
G1 X124.623 Y125.105 E.00464
; WIPE_START
G1 F24000
G1 X124.804 Y124.807 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X123.911 Y123.873 Z26.64 F30000
G1 Z26.24
G1 E.8 F1800
; LINE_WIDTH: 0.241398
G1 F4508
G1 X123.771 Y124.071 E.00502
; LINE_WIDTH: 0.207749
G1 X123.631 Y124.27 E.00409
; WIPE_START
G1 F24000
G1 X123.771 Y124.071 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.161 Y123.026 Z26.64 F30000
G1 Z26.24
G1 E.8 F1800
; LINE_WIDTH: 0.245349
G1 F4508
G1 X125.905 Y123.238 E.00703
; LINE_WIDTH: 0.18977
G1 X125.486 Y123.636 E.00855
G1 X125.221 Y123.925 E.0058
; LINE_WIDTH: 0.226341
G1 X125.027 Y124.16 E.00579
G1 X127.104 Y122.623 F30000
; LINE_WIDTH: 0.168062
G1 F4508
G1 X126.807 Y122.804 E.00429
G1 X127.188 Y122.707 F30000
; LINE_WIDTH: 0.11273
G1 F4508
G1 X126.947 Y122.642 E.0015
; CHANGE_LAYER
; Z_HEIGHT: 26.52
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X127.188 Y122.707 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 95/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L95
M991 S0 P94 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z26.64 I-1.166 J.348 P1  F30000
G1 X128.754 Y127.957 Z26.64
G1 Z26.52
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F3087
G3 X127.931 Y123.901 I-.76 J-1.958 E.32521
G1 X128.073 Y123.901 E.00633
G3 X128.81 Y127.935 I-.079 J2.098 E.25268
; WIPE_START
G1 F24000
G1 X128.534 Y128.031 E-.11083
G1 X128.3 Y128.079 E-.09088
G1 X127.948 Y128.1 E-.13417
G1 X127.713 Y128.081 E-.08951
G1 X127.482 Y128.035 E-.0895
G1 X127.148 Y127.92 E-.13417
G1 X126.892 Y127.779 E-.11094
; WIPE_END
G1 E-.04 F1800
G1 X129.54 Y129.739 Z26.92 F30000
G1 Z26.52
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F3087
G1 X129.453 Y129.771 E.0038
G3 X127.647 Y121.97 I-1.46 J-3.772 E.56885
G3 X128.278 Y121.965 I.348 J4.393 E.02592
G3 X129.661 Y129.684 I-.285 J4.035 E.43941
G1 X129.595 Y129.715 E.00301
M204 S10000
; WIPE_START
G1 F24000
G1 X129.453 Y129.771 E-.05793
G1 X129.241 Y129.851 E-.08622
G1 X128.802 Y129.966 E-.17239
G1 X128.402 Y130.025 E-.15364
G1 X128.125 Y130.044 E-.10537
G1 X127.673 Y130.032 E-.17201
G1 X127.64 Y130.028 E-.01243
; WIPE_END
G1 E-.04 F1800
G1 X128.021 Y125.963 Z26.92 F30000
G1 Z26.52
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.400089
G1 F3087
G1 X127.957 Y126 E.00286
G1 X128.006 Y126.028 E.00218
G1 X128.047 Y124.117 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F3087
G1 X129.879 Y125.949 E.11521
G1 X129.83 Y126.452
G1 X127.549 Y124.17 E.1435
G1 X127.151 Y124.324
G1 X129.679 Y126.852 E.15903
G1 X129.46 Y127.185
G1 X126.813 Y124.538 E.16651
G1 X126.54 Y124.815
G1 X129.187 Y127.462 E.16651
G1 X128.849 Y127.676
G1 X126.321 Y125.148 E.15902
G1 X126.17 Y125.549
G1 X128.451 Y127.829 E.14348
G1 X127.954 Y127.885
G1 X126.121 Y126.051 E.11533
M204 S10000
G1 X127.569 Y127.854 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.286897
G1 F3087
G1 X127.34 Y127.687 E.00735
; LINE_WIDTH: 0.317509
G1 X127.11 Y127.519 E.00834
; LINE_WIDTH: 0.348122
G1 X126.961 Y127.398 E.00632
; LINE_WIDTH: 0.393315
G3 X126.613 Y127.051 I2.295 J-2.655 E.01871
; LINE_WIDTH: 0.388937
G1 X126.49 Y126.902 E.00721
; LINE_WIDTH: 0.351833
G1 X126.375 Y126.74 E.00664
; LINE_WIDTH: 0.317178
G1 X126.259 Y126.577 E.00585
; LINE_WIDTH: 0.282524
G1 X126.143 Y126.415 E.00506
G1 X126.434 Y124.985 F30000
; LINE_WIDTH: 0.121351
G1 F3087
G2 X126.351 Y125.09 I.895 J.787 E.00093
G1 X127.097 Y124.35 F30000
; LINE_WIDTH: 0.114611
G1 F3087
G2 X126.986 Y124.435 I.55 J.833 E.00087
G1 X129.857 Y125.585 F30000
; LINE_WIDTH: 0.247947
G1 F3087
G1 X129.741 Y125.423 E.00427
; LINE_WIDTH: 0.282606
G1 X129.625 Y125.26 E.00506
; LINE_WIDTH: 0.317266
G1 X129.51 Y125.098 E.00585
; LINE_WIDTH: 0.351926
G1 X129.387 Y124.949 E.0064
; LINE_WIDTH: 0.398475
G2 X129.039 Y124.602 I-2.642 J2.307 E.01899
; LINE_WIDTH: 0.386522
G1 X128.887 Y124.479 E.0073
; LINE_WIDTH: 0.347263
G1 X128.659 Y124.312 E.00925
; LINE_WIDTH: 0.317144
G1 X128.431 Y124.146 E.00828
; WIPE_START
G1 F24000
G1 X128.659 Y124.312 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.964 Y122.277 Z26.92 F30000
G1 Z26.52
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F3087
G1 X131.723 Y125.036 E.17358
G1 X131.834 Y125.698
G1 X128.303 Y122.168 E.22207
G1 X127.748 Y122.164
G1 X131.837 Y126.253 E.25723
G1 X131.772 Y126.739
G1 X130.131 Y125.099 E.10322
G1 X130.308 Y125.827
G1 X131.66 Y127.179 E.08509
G1 X131.507 Y127.577
G1 X130.287 Y126.357 E.0768
G1 X130.174 Y126.795
G1 X131.32 Y127.942 E.07212
G1 X131.101 Y128.274
G1 X129.997 Y127.17 E.06943
G1 X129.769 Y127.493
G1 X130.853 Y128.577 E.06821
G1 X130.577 Y128.853
G1 X129.493 Y127.769 E.0682
G1 X129.17 Y127.997
G1 X130.274 Y129.101 E.06943
G1 X129.941 Y129.32
G1 X128.795 Y128.173 E.07211
G1 X128.357 Y128.287
G1 X129.578 Y129.508 E.0768
G1 X129.179 Y129.661
G1 X127.827 Y128.308 E.0851
G1 X127.098 Y128.131
G1 X128.741 Y129.774 E.10331
M204 S10000
; WIPE_START
G1 F24000
G1 X127.327 Y128.359 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.901 Y123.869 Z26.92 F30000
G1 Z26.52
G1 E.8 F1800
M204 S2000
G1 F3087
G1 X127.261 Y122.228 E.10319
G1 X126.82 Y122.339
G1 X128.173 Y123.692 E.0851
G1 X127.643 Y123.713
G1 X126.422 Y122.492 E.0768
G1 X126.059 Y122.68
G1 X127.205 Y123.827 E.07211
G1 X126.83 Y124.003
G1 X125.726 Y122.899 E.06942
G1 X125.423 Y123.147
G1 X126.507 Y124.231 E.0682
G1 X126.231 Y124.507
G1 X125.147 Y123.423 E.06821
G1 X124.899 Y123.726
G1 X126.003 Y124.83 E.06943
G1 X125.826 Y125.205
G1 X124.68 Y124.058 E.07213
G1 X124.493 Y124.423
G1 X125.713 Y125.643 E.0768
G1 X125.692 Y126.174
G1 X124.34 Y124.821 E.08509
G1 X124.226 Y125.259
G1 X125.869 Y126.902 E.10335
M204 S10000
; WIPE_START
G1 F24000
G1 X124.455 Y125.487 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X124.163 Y125.748 Z26.92 F30000
G1 Z26.52
G1 E.8 F1800
M204 S2000
G1 F3087
G1 X128.251 Y129.835 E.25714
G1 X127.698 Y129.834
G1 X124.169 Y126.304 E.22205
G1 X124.277 Y126.964
G1 X127.036 Y129.723 E.17356
M204 S10000
; WIPE_START
G1 F24000
G1 X125.622 Y128.309 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.383 Y123.728 Z26.92 F30000
G1 Z26.52
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.119768
G1 F3087
G1 X127.243 Y123.815 E.00112
G1 X129.583 Y124.307 F30000
; LINE_WIDTH: 0.11562
G1 F3087
G1 X129.31 Y124.063 E.00232
; LINE_WIDTH: 0.147754
G1 X129.187 Y123.964 E.00158
; LINE_WIDTH: 0.183089
G1 X129.082 Y123.886 E.00185
; LINE_WIDTH: 0.21917
G1 X128.966 Y123.804 E.00257
G1 X130.196 Y125.034 F30000
; LINE_WIDTH: 0.236071
G1 F3087
G1 X130.103 Y124.903 E.00322
; LINE_WIDTH: 0.212325
G1 X130.023 Y124.796 E.00232
; LINE_WIDTH: 0.175909
G1 X129.94 Y124.693 E.00174
; LINE_WIDTH: 0.128914
G1 X129.691 Y124.415 E.00294
; WIPE_START
G1 F24000
G1 X129.94 Y124.693 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X126.585 Y129.581 Z26.92 F30000
G1 Z26.52
G1 E.8 F1800
; LINE_WIDTH: 0.161402
G1 F3087
G1 X126.431 Y129.472 E.00219
; LINE_WIDTH: 0.197929
G1 X126.276 Y129.362 E.00297
; LINE_WIDTH: 0.234456
G1 X126.191 Y129.298 E.00212
; LINE_WIDTH: 0.264593
G1 X126.106 Y129.234 E.00249
; LINE_WIDTH: 0.29473
G1 X125.94 Y129.103 E.00565
; LINE_WIDTH: 0.342629
G1 X125.78 Y128.968 E.00674
; LINE_WIDTH: 0.403009
G3 X125.047 Y128.237 I5.051 J-5.801 E.04056
; LINE_WIDTH: 0.381684
G1 X124.912 Y128.078 E.00767
; LINE_WIDTH: 0.347194
G1 X124.78 Y127.913 E.0069
; LINE_WIDTH: 0.300662
M73 P97 R0
G1 X124.681 Y127.782 E.00451
; LINE_WIDTH: 0.255245
G1 X124.603 Y127.674 E.00297
; LINE_WIDTH: 0.212279
G1 X124.525 Y127.565 E.00231
; LINE_WIDTH: 0.169313
G1 X124.474 Y127.489 E.00115
; LINE_WIDTH: 0.138096
G1 X124.423 Y127.412 E.00082
; WIPE_START
G1 F24000
G1 X124.474 Y127.489 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.034 Y128.196 Z26.92 F30000
G1 Z26.52
G1 E.8 F1800
; LINE_WIDTH: 0.236196
G1 F3087
G1 X126.915 Y128.112 E.00293
; LINE_WIDTH: 0.216941
G1 X126.808 Y128.032 E.00239
; LINE_WIDTH: 0.179664
G1 X126.705 Y127.949 E.0018
; LINE_WIDTH: 0.130477
G1 X126.416 Y127.692 E.00311
G1 X126.31 Y127.587 F30000
; LINE_WIDTH: 0.115515
G1 F3087
G1 X126.058 Y127.305 E.00239
; LINE_WIDTH: 0.148643
G1 X125.975 Y127.201 E.00134
; LINE_WIDTH: 0.178646
G1 X125.894 Y127.093 E.00182
; LINE_WIDTH: 0.214784
G1 X125.804 Y126.966 E.00275
G1 X125.815 Y125.242 F30000
; LINE_WIDTH: 0.118482
G1 F3087
G1 X125.729 Y125.383 E.0011
; WIPE_START
G1 F24000
G1 X125.815 Y125.242 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X131.578 Y124.588 Z26.92 F30000
G1 Z26.52
G1 E.8 F1800
; LINE_WIDTH: 0.106878
G1 F3087
G1 X131.525 Y124.51 E.0005
; LINE_WIDTH: 0.138574
G1 X131.473 Y124.433 E.00084
; LINE_WIDTH: 0.170271
G1 X131.411 Y124.345 E.00136
; LINE_WIDTH: 0.206074
G1 X131.348 Y124.257 E.0018
; LINE_WIDTH: 0.241877
G1 X131.284 Y124.172 E.00221
; LINE_WIDTH: 0.271318
G1 X131.22 Y124.087 E.00257
; LINE_WIDTH: 0.300757
G1 X131.088 Y123.922 E.00579
; LINE_WIDTH: 0.347297
G1 X130.953 Y123.763 E.00685
; LINE_WIDTH: 0.403756
G2 X130.22 Y123.032 I-5.785 J5.07 E.04065
; LINE_WIDTH: 0.378538
G1 X130.059 Y122.897 E.0076
; LINE_WIDTH: 0.342719
G1 X129.894 Y122.766 E.0068
; LINE_WIDTH: 0.294834
G1 X129.809 Y122.702 E.00286
; LINE_WIDTH: 0.264694
G1 X129.724 Y122.638 E.00249
; LINE_WIDTH: 0.234554
G1 X129.569 Y122.528 E.00377
; LINE_WIDTH: 0.198029
G1 X129.415 Y122.419 E.00298
; CHANGE_LAYER
; Z_HEIGHT: 26.8
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X129.569 Y122.528 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 96/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L96
M991 S0 P95 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z26.92 I-1.124 J-.466 P1  F30000
G1 X128.042 Y126.209 Z26.92
G1 Z26.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F1582
G3 X128.027 Y125.788 I-.043 J-.209 E.03304
G1 X128.053 Y125.793 E.00118
G3 X128.099 Y126.188 I-.054 J.207 E.02278
; WIPE_START
G1 F24000
G1 X127.965 Y126.211 E-.07753
G1 X127.884 Y126.181 E-.04904
G1 X127.823 Y126.119 E-.04952
G1 X127.791 Y126.042 E-.04751
G1 X127.788 Y125.971 E-.0408
G1 X127.816 Y125.892 E-.04751
G1 X127.857 Y125.841 E-.03746
G1 X127.946 Y125.793 E-.05756
G1 X128.027 Y125.788 E-.04605
G1 X128.053 Y125.793 E-.01517
G1 X128.133 Y125.832 E-.05091
G1 X128.176 Y125.877 E-.03555
G1 X128.209 Y125.958 E-.04953
G1 X128.21 Y126.041 E-.04752
G1 X128.181 Y126.116 E-.04565
G1 X128.119 Y126.177 E-.04952
G1 X128.099 Y126.188 E-.01316
; WIPE_END
G1 E-.04 F1800
G1 X129.059 Y128.749 Z27.2 F30000
G1 Z26.8
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1582
G3 X127.907 Y123.052 I-1.068 J-2.749 E.42179
G1 X128.097 Y123.053 E.0078
G3 X129.115 Y128.726 I-.106 J2.947 E.32873
M204 S10000
G1 X129.039 Y128.545 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F1582
G1 X130.545 Y127.039 E.09475
G1 X130.733 Y126.3
G1 X128.3 Y128.733 E.15302
G1 X127.744 Y128.737
G1 X130.738 Y125.744 E.18833
G1 X130.653 Y125.277
G1 X127.277 Y128.653 E.21234
G1 X126.871 Y128.507
G1 X130.508 Y124.871 E.22876
G1 X130.313 Y124.514
G1 X126.514 Y128.313 E.23898
G1 X126.199 Y128.077
G1 X127.868 Y126.408 E.10502
G1 X127.592 Y126.132
G1 X125.923 Y127.801 E.10502
M204 S10000
; WIPE_START
G1 F24000
G1 X127.337 Y126.387 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.408 Y125.868 Z27.2 F30000
G1 Z26.8
G1 E.8 F1800
M204 S2000
G1 F1582
G1 X130.077 Y124.199 E.10502
G1 X129.801 Y123.923
G1 X128.131 Y125.593 E.10504
M204 S10000
; WIPE_START
G1 F24000
G1 X129.546 Y124.179 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X129.485 Y123.688 Z27.2 F30000
G1 Z26.8
G1 E.8 F1800
M204 S2000
G1 F1582
G1 X125.687 Y127.486 E.23894
G1 X125.492 Y127.129
G1 X129.129 Y123.493 E.22875
G1 X128.723 Y123.347
G1 X125.347 Y126.723 E.21233
G1 X125.262 Y126.256
G1 X128.256 Y123.263 E.18833
G1 X127.7 Y123.267
G1 X125.267 Y125.7 E.15301
G1 X125.455 Y124.961
G1 X126.961 Y123.455 E.09473
M204 S10000
; WIPE_START
G1 F24000
G1 X125.547 Y124.869 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.986 Y128.492 Z27.2 F30000
G1 Z26.8
G1 E.8 F1800
; FEATURE: Gap infill
; LINE_WIDTH: 0.114988
G1 F1582
G1 X128.661 Y128.671 E.00232
; WIPE_START
G1 F24000
G1 X128.986 Y128.492 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X127.584 Y125.879 Z27.2 F30000
G1 Z26.8
G1 E.8 F1800
; LINE_WIDTH: 0.167585
G1 F1582
G1 X127.535 Y125.994 E.00154
G1 X127.555 Y126.041 E.00063
; LINE_WIDTH: 0.135957
G1 X127.586 Y126.103 E.0006
G1 X128.105 Y125.582 F30000
; LINE_WIDTH: 0.171062
G1 F1582
G1 X127.994 Y125.534 E.00153
G1 X127.879 Y125.585 E.00159
G1 X128.415 Y126.121 F30000
; LINE_WIDTH: 0.159854
G1 F1582
G1 X128.46 Y126.02 E.00126
G2 X128.445 Y125.959 I-.102 J-.008 E.00073
; LINE_WIDTH: 0.136017
G1 X128.414 Y125.897 E.0006
G1 X128.12 Y126.413 F30000
; LINE_WIDTH: 0.154231
G1 F1582
G1 X128.037 Y126.452 E.00098
G3 X127.991 Y126.459 I-.027 J-.019 E.00055
G1 X127.895 Y126.418 E.00112
; WIPE_START
G1 F24000
G1 X127.991 Y126.459 E-.32794
G1 X128.037 Y126.452 E-.14508
G1 X128.12 Y126.413 E-.28698
; WIPE_END
G1 E-.04 F1800
G1 X127.339 Y123.329 Z27.2 F30000
G1 Z26.8
G1 E.8 F1800
; LINE_WIDTH: 0.106879
G1 F1582
G1 X127.015 Y123.509 E.00198
; CHANGE_LAYER
; Z_HEIGHT: 27.08
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X127.339 Y123.329 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 97/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L97
M991 S0 P96 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z27.2 I-1.209 J-.142 P1  F30000
G1 X127.088 Y125.465 Z27.2
G1 Z27.08
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.147 Y125.358 E.005
G3 X127.968 Y124.936 I.848 J.641 E.03923
G1 X128.043 Y124.937 E.00308
G3 X127.023 Y125.57 I-.048 J1.062 E.2219
G1 X127.056 Y125.516 E.0026
M204 S10000
; WIPE_START
G1 F24000
G1 X127.147 Y125.358 E-.06905
G1 X127.269 Y125.227 E-.06808
G1 X127.406 Y125.117 E-.06685
G1 X127.617 Y125.007 E-.09054
G1 X127.848 Y124.947 E-.09053
G1 X127.968 Y124.936 E-.04594
G1 X128.043 Y124.937 E-.02852
G1 X128.263 Y124.969 E-.08413
G1 X128.429 Y125.026 E-.06685
G1 X128.64 Y125.15 E-.09277
G1 X128.751 Y125.249 E-.05674
; WIPE_END
G1 E-.04 F1800
G1 X128.864 Y126.037 Z27.48 F30000
G1 Z27.08
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F1200
G1 X127.964 Y125.137 E.05659
G1 X127.543 Y125.268
G1 X128.733 Y126.457 E.07483
G1 X128.457 Y126.732
G1 X127.268 Y125.543 E.0748
G1 X127.137 Y125.964
G1 X128.035 Y126.862 E.05648
M204 S10000
G1 X127.669 Y126.799 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.116517
G1 F1200
G3 X127.526 Y126.692 I1.027 J-1.514 E.00115
; LINE_WIDTH: 0.156142
G3 X127.245 Y126.393 I1.058 J-1.278 E.00451
; LINE_WIDTH: 0.124469
G1 X127.204 Y126.334 E.00053
; WIPE_START
G1 F24000
G1 X127.245 Y126.393 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X128.796 Y125.667 Z27.48 F30000
G1 Z27.08
G1 E.8 F1800
; LINE_WIDTH: 0.124186
G1 F1200
G2 X128.668 Y125.498 I-1.564 J1.055 E.00155
; LINE_WIDTH: 0.158922
G2 X128.427 Y125.27 I-1.477 J1.325 E.00374
; LINE_WIDTH: 0.136507
G1 X128.331 Y125.2 E.00104
; CHANGE_LAYER
; Z_HEIGHT: 27.36
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X128.427 Y125.27 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 98/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L98
M991 S0 P97 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z27.48 I-1.044 J-.626 P1  F30000
G1 X127.927 Y126.104 Z27.48
G1 Z27.36
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X128.601 Y126.104 E.02768
G1 X128.601 Y126.684 E.02381
G1 X127.927 Y126.684 E.02768
G1 X127.927 Y126.164 E.02135
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 27.64
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X128.601 Y126.104 E-.2572
G1 X128.601 Y126.684 E-.2204
G1 X127.927 Y126.684 E-.25619
G1 X127.927 Y126.616 E-.0262
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 99/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L99
M991 S0 P98 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z27.76 I1.217 J0 P1  F30000
G1 X127.927 Y126.104 Z27.76
G1 Z27.64
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X128.601 Y126.104 E.02768
G1 X128.601 Y126.684 E.02381
G1 X127.927 Y126.684 E.02768
G1 X127.927 Y126.164 E.02135
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 27.92
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X128.601 Y126.104 E-.2572
G1 X128.601 Y126.684 E-.2204
G1 X127.927 Y126.684 E-.25619
G1 X127.927 Y126.616 E-.0262
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 100/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L100
M991 S0 P99 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z28.04 I1.217 J0 P1  F30000
G1 X127.927 Y126.104 Z28.04
G1 Z27.92
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X128.601 Y126.104 E.02768
G1 X128.601 Y126.684 E.02381
G1 X127.927 Y126.684 E.02768
G1 X127.927 Y126.164 E.02135
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 28.2
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X128.601 Y126.104 E-.2572
G1 X128.601 Y126.684 E-.2204
G1 X127.927 Y126.684 E-.25619
G1 X127.927 Y126.616 E-.0262
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 101/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L101
M991 S0 P100 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z28.32 I1.217 J0 P1  F30000
G1 X127.927 Y126.104 Z28.32
G1 Z28.2
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X128.601 Y126.104 E.02768
G1 X128.601 Y126.684 E.02381
G1 X127.927 Y126.684 E.02768
G1 X127.927 Y126.164 E.02135
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 28.48
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X128.601 Y126.104 E-.2572
G1 X128.601 Y126.684 E-.2204
G1 X127.927 Y126.684 E-.25619
G1 X127.927 Y126.616 E-.0262
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 102/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L102
M991 S0 P101 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z28.6 I1.217 J0 P1  F30000
G1 X127.927 Y126.104 Z28.6
G1 Z28.48
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X128.601 Y126.104 E.02768
G1 X128.601 Y126.684 E.02381
G1 X127.927 Y126.684 E.02768
G1 X127.927 Y126.164 E.02135
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 28.76
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X128.601 Y126.104 E-.2572
G1 X128.601 Y126.684 E-.2204
G1 X127.927 Y126.684 E-.25619
G1 X127.927 Y126.616 E-.0262
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 103/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L103
M991 S0 P102 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z28.88 I1.217 J0 P1  F30000
G1 X127.927 Y126.104 Z28.88
G1 Z28.76
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X128.601 Y126.104 E.02768
G1 X128.601 Y126.684 E.02381
G1 X127.927 Y126.684 E.02768
G1 X127.927 Y126.164 E.02135
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 29.04
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X128.601 Y126.104 E-.2572
G1 X128.601 Y126.684 E-.2204
G1 X127.927 Y126.684 E-.25619
G1 X127.927 Y126.616 E-.0262
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 104/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L104
M991 S0 P103 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z29.16 I1.217 J0 P1  F30000
G1 X127.927 Y126.104 Z29.16
G1 Z29.04
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X128.601 Y126.104 E.02768
G1 X128.601 Y126.684 E.02381
G1 X127.927 Y126.684 E.02768
G1 X127.927 Y126.164 E.02135
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 29.32
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X128.601 Y126.104 E-.2572
G1 X128.601 Y126.684 E-.2204
G1 X127.927 Y126.684 E-.25619
G1 X127.927 Y126.616 E-.0262
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 105/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L105
M991 S0 P104 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z29.44 I1.217 J0 P1  F30000
G1 X127.927 Y126.104 Z29.44
G1 Z29.32
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X128.601 Y126.104 E.02768
G1 X128.601 Y126.684 E.02381
G1 X127.927 Y126.684 E.02768
G1 X127.927 Y126.164 E.02135
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 29.6
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X128.601 Y126.104 E-.2572
G1 X128.601 Y126.684 E-.2204
G1 X127.927 Y126.684 E-.25619
G1 X127.927 Y126.616 E-.0262
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 106/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L106
M991 S0 P105 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z29.72 I1.217 J0 P1  F30000
G1 X127.927 Y126.104 Z29.72
G1 Z29.6
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X128.601 Y126.104 E.02768
G1 X128.601 Y126.684 E.02381
G1 X127.927 Y126.684 E.02768
G1 X127.927 Y126.164 E.02135
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 29.88
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X128.601 Y126.104 E-.2572
G1 X128.601 Y126.684 E-.2204
G1 X127.927 Y126.684 E-.25619
G1 X127.927 Y126.616 E-.0262
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 107/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L107
M991 S0 P106 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z30 I.735 J.97 P1  F30000
G1 X128.601 Y126.104 Z30
G1 Z29.88
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X128.601 Y126.684 E.02381
G1 X127.517 Y126.684 E.04452
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X126.932 Y126.684 E.02603
G1 X126.932 Y126.104 E.0258
G1 X127.517 Y126.104 E.02603
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.886 Y126.104 E.01515
G1 X128.541 Y126.104 E.0269
M204 S10000
G1 X128.414 Y126.394 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.265179
G1 F1200
G1 X127.119 Y126.394 E.03029
; CHANGE_LAYER
; Z_HEIGHT: 30.16
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X128.414 Y126.394 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 108/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L108
M991 S0 P107 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z30.28 I1.022 J.661 P1  F30000
G1 X128.601 Y126.104 Z30.28
G1 Z30.16
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X128.601 Y126.684 E.02381
G1 X126.522 Y126.684 E.08538
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X126.407 Y126.684 E.00512
G1 X126.407 Y126.104 E.0258
G1 X126.522 Y126.104 E.00512
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.891 Y126.104 E.01515
G1 X128.541 Y126.104 E.06777
M204 S10000
G1 X128.414 Y126.394 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.265179
G1 F1200
G1 X126.594 Y126.394 E.04257
; CHANGE_LAYER
; Z_HEIGHT: 30.44
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X128.414 Y126.394 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 109/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L109
M991 S0 P108 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z30.56 I.171 J-1.205 P1  F30000
G1 X126.366 Y126.104 Z30.56
G1 Z30.44
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X128.541 Y126.104 E.08932
G1 X128.541 Y126.684 E.02381
G1 X126.049 Y126.684 E.10234
G1 X126.049 Y126.104 E.02381
G1 X126.306 Y126.104 E.01056
M204 S10000
G1 X126.236 Y126.394 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.265179
G1 F1200
G1 X128.354 Y126.394 E.04954
; CHANGE_LAYER
; Z_HEIGHT: 30.72
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X126.354 Y126.394 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 110/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L110
M991 S0 P109 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z30.84 I.187 J1.203 P1  F30000
G1 X128.35 Y126.085 Z30.84
G1 Z30.72
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.380409
G1 F1200
G1 X128.438 Y126.085 E.00322
G1 X128.438 Y126.704 E.02264
G1 X128.35 Y126.704 E.00322
G1 X128.35 Y126.145 E.02045
M204 S10000
; WIPE_START
G1 F24000
G1 X128.438 Y126.085 E-.05896
G1 X128.438 Y126.704 E-.34276
G1 X128.35 Y126.704 E-.04872
G1 X128.35 Y126.145 E-.30956
; WIPE_END
G1 E-.04 F1800
G1 X127.326 Y126.104 Z31.12 F30000
G1 Z30.72
G1 E.8 F1800
M204 S5000
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.326 Y126.684 E.02381
G1 X125.779 Y126.684 E.06349
G1 X125.779 Y126.104 E.02381
G1 X126.008 Y126.104 E.00938
G1 X127.266 Y126.104 E.05164
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 31
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X127.326 Y126.684 E-.22158
G1 X125.909 Y126.684 E-.53842
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 111/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L111
M991 S0 P110 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z31.12 I.789 J.926 P1  F30000
G1 X126.589 Y126.104 Z31.12
G1 Z31
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X126.589 Y126.684 E.02381
G1 X125.571 Y126.684 E.04183
G1 X125.571 Y126.104 E.02381
G1 X125.738 Y126.104 E.00688
G1 X126.529 Y126.104 E.03249
M204 S10000
G1 X126.402 Y126.394 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.265179
G1 F1200
G1 X125.758 Y126.394 E.01507
; CHANGE_LAYER
; Z_HEIGHT: 31.28
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X126.402 Y126.394 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 112/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L112
M991 S0 P111 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z31.4 I1.071 J-.578 P1  F30000
G1 X126.246 Y126.104 Z31.4
G1 Z31.28
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.246 Y126.684 E.02381
G1 X125.408 Y126.684 E.0344
G1 X125.408 Y126.104 E.02381
G1 X125.53 Y126.104 E.00501
G1 X126.186 Y126.104 E.02693
M204 S10000
G1 X126.058 Y126.394 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.265179
G1 F1200
G1 X125.595 Y126.394 E.01083
; CHANGE_LAYER
; Z_HEIGHT: 31.56
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X126.058 Y126.394 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 113/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L113
M991 S0 P112 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z31.68 I1.203 J-.181 P1  F30000
G1 X126.014 Y126.104 Z31.68
G1 Z31.56
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.014 Y126.684 E.02381
G1 X125.281 Y126.684 E.0301
G1 X125.281 Y126.104 E.02381
G1 X125.367 Y126.104 E.00351
G1 X125.954 Y126.104 E.02413
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 31.84
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X126.014 Y126.684 E-.22158
G1 X125.281 Y126.684 E-.27859
G1 X125.281 Y126.104 E-.2204
G1 X125.367 Y126.104 E-.03246
G1 X125.385 Y126.104 E-.00697
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 114/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L114
M991 S0 P113 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z31.96 I0 J1.217 P1  F30000
G1 X125.86 Y126.104 Z31.96
G1 Z31.84
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X125.86 Y126.684 E.02381
G1 X125.186 Y126.684 E.02769
G1 X125.186 Y126.104 E.02381
G1 X125.24 Y126.104 E.00224
G1 X125.8 Y126.104 E.02299
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 32.12
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X125.86 Y126.684 E-.22158
G1 X125.186 Y126.684 E-.25627
G1 X125.186 Y126.104 E-.2204
G1 X125.24 Y126.104 E-.02072
G1 X125.348 Y126.104 E-.04104
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 115/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L115
M991 S0 P114 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z32.24 I0 J1.217 P1  F30000
G1 X125.759 Y126.104 Z32.24
G1 Z32.12
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X125.759 Y126.684 E.02381
G1 X125.121 Y126.684 E.02622
G1 X125.121 Y126.104 E.02381
G1 X125.145 Y126.104 E.00099
G1 X125.699 Y126.104 E.02276
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 32.4
; LAYER_HEIGHT: 0.280003
; WIPE_START
G1 F24000
M73 P98 R0
G1 X125.759 Y126.684 E-.22158
G1 X125.121 Y126.684 E-.24262
G1 X125.121 Y126.104 E-.2204
G1 X125.145 Y126.104 E-.00913
G1 X125.319 Y126.104 E-.06627
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 116/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L116
M991 S0 P115 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z32.52 I0 J1.217 P1  F30000
G1 X125.703 Y126.104 Z32.52
G1 Z32.4
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X125.703 Y126.684 E.02381
G1 X125.088 Y126.684 E.02523
G1 X125.088 Y126.104 E.02381
G1 X125.643 Y126.104 E.02277
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 32.68
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X125.703 Y126.684 E-.22158
G1 X125.088 Y126.684 E-.23351
G1 X125.088 Y126.104 E-.2204
G1 X125.31 Y126.104 E-.08451
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 117/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L117
M991 S0 P116 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z32.8 I0 J1.217 P1  F30000
G1 X125.689 Y126.104 Z32.8
G1 Z32.68
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X125.689 Y126.684 E.02381
G1 X125.08 Y126.684 E.02503
G1 X125.08 Y126.104 E.02381
G1 X125.629 Y126.104 E.02256
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 32.96
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X125.689 Y126.684 E-.22158
G1 X125.08 Y126.684 E-.2316
G1 X125.08 Y126.104 E-.2204
G1 X125.307 Y126.104 E-.08642
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 118/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L118
M991 S0 P117 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z33.08 I0 J1.217 P1  F30000
G1 X125.716 Y126.104 Z33.08
G1 Z32.96
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X125.716 Y126.684 E.02381
G1 X125.095 Y126.684 E.02551
G1 X125.095 Y126.104 E.02381
G1 X125.656 Y126.104 E.02305
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 33.24
; LAYER_HEIGHT: 0.280003
; WIPE_START
G1 F24000
G1 X125.716 Y126.684 E-.22158
G1 X125.095 Y126.684 E-.23614
G1 X125.095 Y126.104 E-.2204
G1 X125.31 Y126.104 E-.08189
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 119/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L119
M991 S0 P118 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z33.36 I-.152 J1.207 P1  F30000
G1 X129.908 Y126.684 Z33.36
G1 Z33.24
G1 E.8 F1800
M204 S5000
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X129.908 Y126.104 E.0258
G1 X130.38 Y126.104 E.021
G1 X130.38 Y126.684 E.0258
G1 X129.968 Y126.684 E.01833
M204 S10000
G1 X130.144 Y126.497 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.157343
G1 F1200
G1 X130.144 Y126.292 E.00228
; WIPE_START
G1 F24000
G1 X130.144 Y126.497 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.64 I.109 J-1.212 P1  F30000
G1 X125.785 Y126.104 Z33.64
G1 Z33.24
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.785 Y126.684 E.02381
G1 X125.757 Y126.684 E.00114
G1 X125.135 Y126.684 E.02554
G1 X125.135 Y126.104 E.02381
G1 X125.725 Y126.104 E.02422
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 33.52
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X125.785 Y126.684 E-.22158
G1 X125.757 Y126.684 E-.01058
G1 X125.135 Y126.684 E-.23641
G1 X125.135 Y126.104 E-.2204
G1 X125.322 Y126.104 E-.07103
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 120/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L120
M991 S0 P119 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z33.64 I0 J1.217 P1  F30000
G1 X129.792 Y126.104 Z33.64
G1 Z33.52
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X130.484 Y126.104 E.0284
G1 X130.484 Y126.684 E.02381
G1 X130.421 Y126.684 E.00259
G1 X129.792 Y126.684 E.02581
G1 X129.792 Y126.164 E.02135
M204 S10000
; WIPE_START
G1 F24000
G1 X130.484 Y126.104 E-.26384
G1 X130.484 Y126.684 E-.2204
G1 X130.421 Y126.684 E-.02395
G1 X129.792 Y126.684 E-.2389
G1 X129.792 Y126.65 E-.01291
; WIPE_END
G1 E-.04 F1800
G17
G3 Z33.92 I.169 J-1.205 P1  F30000
G1 X125.9 Y126.104 Z33.92
G1 Z33.52
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X125.9 Y126.684 E.02381
G1 X125.826 Y126.684 E.00304
G1 X125.211 Y126.684 E.02526
G1 X125.211 Y126.104 E.02381
G1 X125.84 Y126.104 E.02584
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 33.8
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X125.9 Y126.684 E-.22158
G1 X125.826 Y126.684 E-.02817
G1 X125.211 Y126.684 E-.23382
G1 X125.211 Y126.104 E-.2204
G1 X125.358 Y126.104 E-.05603
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 121/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L121
M991 S0 P120 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z33.92 I0 J1.217 P1  F30000
G1 X129.62 Y126.104 Z33.92
G1 Z33.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X129.751 Y126.104 E.00538
G1 X130.381 Y126.104 E.02585
G1 X130.381 Y126.684 E.02381
G1 X129.62 Y126.684 E.03123
G1 X129.62 Y126.164 E.02135
M204 S10000
; WIPE_START
G1 F24000
G1 X129.751 Y126.104 E-.05477
G1 X130.381 Y126.104 E-.23927
G1 X130.381 Y126.684 E-.2204
G1 X129.735 Y126.684 E-.24556
; WIPE_END
G1 E-.04 F1800
G1 X126.071 Y126.104 Z34.2 F30000
G1 Z33.8
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X126.071 Y126.684 E.02381
G1 X125.941 Y126.684 E.00532
G1 X125.315 Y126.684 E.02573
G1 X125.315 Y126.104 E.02381
G1 X126.011 Y126.104 E.02858
M204 S10000
; CHANGE_LAYER
; Z_HEIGHT: 34.08
; LAYER_HEIGHT: 0.280003
; WIPE_START
G1 F24000
G1 X126.071 Y126.684 E-.22158
G1 X125.941 Y126.684 E-.04919
G1 X125.315 Y126.684 E-.23811
G1 X125.315 Y126.104 E-.2204
G1 X125.395 Y126.104 E-.03072
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 122/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L122
M991 S0 P121 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z34.2 I0 J1.217 P1  F30000
G1 X129.415 Y126.104 Z34.2
G1 Z34.08
G1 E.8 F1800
M204 S5000
G1 F1200
G1 X129.579 Y126.104 E.00673
G1 X130.246 Y126.104 E.02736
G1 X130.246 Y126.684 E.02381
G1 X129.415 Y126.684 E.03409
G1 X129.371 Y126.684 E.00181
G1 X129.371 Y126.12 E.02316
M204 S10000
G1 X129.559 Y126.394 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.26518
G1 F1200
G1 X130.058 Y126.394 E.01168
; WIPE_START
G1 F24000
G1 X129.559 Y126.394 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.48 I.107 J-1.212 P1  F30000
G1 X126.276 Y126.104 Z34.48
G1 Z34.08
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.33 Y126.104 E.00223
G1 X126.33 Y126.684 E.02381
G1 X126.276 Y126.684 E.00223
G1 X126.112 Y126.684 E.00673
G1 X125.451 Y126.684 E.02714
G1 X125.451 Y126.104 E.02381
G1 X126.216 Y126.104 E.03141
M204 S10000
G1 X126.143 Y126.394 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.265179
G1 F1200
G1 X125.638 Y126.394 E.0118
; CHANGE_LAYER
; Z_HEIGHT: 34.36
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X126.143 Y126.394 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 123/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L123
M991 S0 P122 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z34.48 I.11 J1.212 P1  F30000
G1 X129.33 Y126.104 Z34.48
G1 Z34.36
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X130.071 Y126.104 E.03042
G1 X130.071 Y126.684 E.02381
G1 X129.33 Y126.684 E.03042
G1 X128.966 Y126.684 E.01496
G1 X128.966 Y126.104 E.02381
G1 X129.27 Y126.104 E.01249
M204 S10000
G1 X129.153 Y126.394 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.265179
G1 F1200
G1 X129.884 Y126.394 E.01709
; WIPE_START
G1 F24000
G1 X129.153 Y126.394 E-.76
; WIPE_END
G1 E-.04 F1800
G17
G3 Z34.76 I.126 J-1.21 P1  F30000
G1 X126.371 Y126.104 Z34.76
G1 Z34.36
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.723 Y126.104 E.01447
G1 X126.723 Y126.684 E.02381
G1 X126.371 Y126.684 E.01447
G1 X125.626 Y126.684 E.03061
G1 X125.626 Y126.104 E.02381
G1 X126.311 Y126.104 E.02814
M204 S10000
G1 X126.536 Y126.394 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.265179
G1 F1200
G1 X125.813 Y126.394 E.01691
; CHANGE_LAYER
; Z_HEIGHT: 34.64
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X126.536 Y126.394 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 124/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L124
M991 S0 P123 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z34.76 I-.474 J-1.121 P1  F30000
G1 X125.85 Y126.684 Z34.76
G1 Z34.64
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X125.85 Y126.104 E.02381
G1 X127.133 Y126.104 E.0527
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X128.556 Y126.104 E.06328
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X129.847 Y126.104 E.05302
G1 X129.847 Y126.684 E.02381
G1 X128.556 Y126.684 E.05302
; FEATURE: Overhang wall
; LINE_WIDTH: 0.45
G1 F3000
G1 X127.133 Y126.684 E.06328
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.764 Y126.684 E.01515
G1 X125.91 Y126.684 E.03509
M204 S10000
G1 X126.037 Y126.394 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.265179
G1 F1200
G1 X129.66 Y126.394 E.08475
; CHANGE_LAYER
; Z_HEIGHT: 34.92
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X127.66 Y126.394 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 125/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L125
M991 S0 P124 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z35.04 I-.228 J-1.195 P1  F30000
G1 X126.142 Y126.684 Z35.04
G1 Z34.92
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.142 Y126.104 E.02381
G1 X129.555 Y126.104 E.14016
G1 X129.555 Y126.684 E.02381
G1 X126.202 Y126.684 E.1377
M204 S10000
G1 X126.329 Y126.394 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.265179
G1 F1200
G1 X129.368 Y126.394 E.0711
; CHANGE_LAYER
; Z_HEIGHT: 35.2
; LAYER_HEIGHT: 0.280003
; WIPE_START
G1 F24000
G1 X127.368 Y126.394 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 126/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L126
M991 S0 P125 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z35.32 I-.4 J-1.149 P1  F30000
G1 X126.534 Y126.684 Z35.32
G1 Z35.2
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X126.534 Y126.104 E.02381
G1 X129.16 Y126.104 E.10781
G1 X129.16 Y126.684 E.02381
G1 X126.594 Y126.684 E.10535
M204 S10000
G1 X126.722 Y126.394 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.265179
G1 F1200
G1 X128.973 Y126.394 E.05266
; CHANGE_LAYER
; Z_HEIGHT: 35.48
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X126.973 Y126.394 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
; layer num/total_layer_count: 127/127
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L127
M991 S0 P126 ;notify layer change
; start printing object, unique label id: 1776
M624 AQAAAAAAAAA=
G17
G3 Z35.6 I-1.02 J.664 P1  F30000
G1 X127.161 Y126.684 Z35.6
G1 Z35.48
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F1200
G1 X127.161 Y126.104 E.02381
G1 X128.534 Y126.104 E.05636
G1 X128.534 Y126.684 E.02381
G1 X127.221 Y126.684 E.0539
M204 S10000
G1 X127.349 Y126.394 F30000
; FEATURE: Gap infill
; LINE_WIDTH: 0.26518
G1 F1200
G1 X128.347 Y126.394 E.02335
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X127.349 Y126.394 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1776
M625
M106 S0
M106 P2 S0
M981 S0 P20000 ; close spaghetti detector
; FEATURE: Custom
; filament end gcode 
M106 P3 S0
;===== date: 20230428 =====================
M400 ; wait for buffer to clear
G92 E0 ; zero the extruder
G1 E-0.8 F1800 ; retract
G1 Z35.98 F900 ; lower z a little
G1 X65 Y245 F12000 ; move to safe pos 
G1 Y265 F3000

G1 X65 Y245 F12000
G1 Y265 F3000
M140 S0 ; turn off bed
M106 S0 ; turn off fan
M106 P2 S0 ; turn off remote part cooling fan
M106 P3 S0 ; turn off chamber cooling fan

G1 X100 F12000 ; wipe
; pull back filament to AMS
M620 S255
G1 X20 Y50 F12000
G1 Y-3
T255
G1 X65 F12000
G1 Y265
G1 X100 F12000 ; wipe
M621 S255
M104 S0 ; turn off hotend

M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
    M400 ; wait all motion done
    M991 S0 P-1 ;end smooth timelapse at safe pos
    M400 S3 ;wait for last picture to be taken
M623; end of "timelapse_record_flag"

M400 ; wait all motion done
M17 S
M17 Z0.4 ; lower z motor current to reduce impact if there is something in the bottom

    G1 Z135.48 F600
    G1 Z133.48

M400 P100
M17 R ; restore z current

G90
G1 X128 Y250 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M141 S0;set chamber_temperature
M73 P100 R0
; EXECUTABLE_BLOCK_END

