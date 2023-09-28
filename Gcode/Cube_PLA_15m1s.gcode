; HEADER_BLOCK_START
; BambuStudio 01.07.06.92
; model printing time: 7m 34s; total estimated time: 15m 1s
; total layer number: 2
; model label id: 1207,1295,1332
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; activate_air_filtration = 0,0,0,0,0,0,0,0,0,0
; additional_cooling_fan_speed = 70,70,70,70,70,70,70,70,70,70
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
; chamber_temperatures = 0,0,0,0,0,0,0,0,0,0
; change_filament_gcode = M620 S[next_extruder]A\nM204 S9000\n{if toolchange_count > 1 && (z_hop_types[current_extruder] == 0 || z_hop_types[current_extruder] == 3)}\nG17\nG2 Z{z_after_toolchange + 0.4} I0.86 J0.86 P1 F10000 ; spiral lift a little from second lift\n{endif}\nG1 Z{max_layer_z + 3.0} F1200\n\nG1 X70 F21000\nG1 Y245\nG1 Y265 F3000\nM400\nM106 P1 S0\nM106 P2 S0\n{if old_filament_temp > 142 && next_extruder < 255}\nM104 S[old_filament_temp]\n{endif}\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 X120 F15000\n\nG1 X20 Y50 F21000\nG1 Y-3\n{if toolchange_count == 2}\n; get travel path for change filament\nM620.1 X[travel_point_1_x] Y[travel_point_1_y] F21000 P0\nM620.1 X[travel_point_2_x] Y[travel_point_2_y] F21000 P1\nM620.1 X[travel_point_3_x] Y[travel_point_3_y] F21000 P2\n{endif}\nM620.1 E F[old_filament_e_feedrate] T{nozzle_temperature_range_high[previous_extruder]}\nT[next_extruder]\nM620.1 E F[new_filament_e_feedrate] T{nozzle_temperature_range_high[next_extruder]}\n\n{if next_extruder < 255}\nM400\n\nG92 E0\n{if flush_length_1 > 1}\n; FLUSH_START\n; always use highest temperature to flush\nM400\nM109 S[nozzle_temperature_range_high]\n{if flush_length_1 > 23.7}\nG1 E23.7 F{old_filament_e_feedrate} ; do not need pulsatile flushing for start part\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{old_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\nG1 E{(flush_length_1 - 23.7) * 0.02} F50\nG1 E{(flush_length_1 - 23.7) * 0.23} F{new_filament_e_feedrate}\n{else}\nG1 E{flush_length_1} F{old_filament_e_feedrate}\n{endif}\n; FLUSH_END\nG1 E-[old_retract_length_toolchange] F1800\nG1 E[old_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_2 > 1}\n; FLUSH_START\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\nG1 E{flush_length_2 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_2 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_3 > 1}\n; FLUSH_START\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\nG1 E{flush_length_3 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_3 * 0.02} F50\n; FLUSH_END\nG1 E-[new_retract_length_toolchange] F1800\nG1 E[new_retract_length_toolchange] F300\n{endif}\n\n{if flush_length_4 > 1}\n; FLUSH_START\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\nG1 E{flush_length_4 * 0.18} F{new_filament_e_feedrate}\nG1 E{flush_length_4 * 0.02} F50\n; FLUSH_END\n{endif}\n; FLUSH_START\nM400\nM109 S[new_filament_temp]\nG1 E2 F{new_filament_e_feedrate} ;Compensate for filament spillage during waiting temperature\n; FLUSH_END\nM400\nG92 E0\nG1 E-[new_retract_length_toolchange] F1800\nM106 P1 S255\nM400 S3\nG1 X80 F15000\nG1 X60 F15000\nG1 X80 F15000\nG1 X60 F15000; shake to put down garbage\n\nG1 X70 F5000\nG1 X90 F3000\nG1 Y255 F4000\nG1 X100 F5000\nG1 Y265 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X70 F10000\nG1 X100 F5000\nG1 X165 F15000; wipe and shake\nG1 Y256 ; move Y to aside, prevent collision\nM400\nG1 Z{max_layer_z + 3.0} F3000\n{if layer_z <= (initial_layer_print_height + 0.001)}\nM204 S[initial_layer_acceleration]\n{else}\nM204 S[default_acceleration]\n{endif}\n{else}\nG1 X[x_after_toolchange] Y[y_after_toolchange] Z[z_after_toolchange] F12000\n{endif}\nM621 S[next_extruder]A
; close_fan_the_first_x_layers = 1,1,1,1,1,1,1,1,1,1
; complete_print_exhaust_fan_speed = 70,70,70,70,70,70,70,70,70,70
; cool_plate_temp = 35,35,35,35,35,35,35,35,35,35
; cool_plate_temp_initial_layer = 35,35,35,35,35,35,35,35,35,35
; curr_bed_type = Textured PEI Plate
; default_acceleration = 10000
; default_filament_colour = ;;;;;;;;;
; default_filament_profile = "Bambu PLA Basic @BBL X1C"
; default_jerk = 0
; default_print_profile = 0.20mm Standard @BBL X1C
; deretraction_speed = 30
; detect_narrow_internal_solid_infill = 1
; detect_overhang_wall = 1
; detect_thin_wall = 0
; draft_shield = disabled
; during_print_exhaust_fan_speed = 70,70,70,70,70,70,70,70,70,70
; elefant_foot_compensation = 0.15
; enable_arc_fitting = 1
; enable_overhang_bridge_fan = 1,1,1,1,1,1,1,1,1,1
; enable_overhang_speed = 1
; enable_pressure_advance = 0,0,0,0,0,0,0,0,0,0
; enable_prime_tower = 1
; enable_support = 0
; enforce_support_layers = 0
; eng_plate_temp = 0,0,0,0,0,0,0,0,0,0
; eng_plate_temp_initial_layer = 0,0,0,0,0,0,0,0,0,0
; ensure_vertical_shell_thickness = 1
; exclude_object = 1
; extruder_clearance_height_to_lid = 90
; extruder_clearance_height_to_rod = 36
; extruder_clearance_max_radius = 68
; extruder_clearance_radius = 57
; extruder_colour = #018001
; extruder_offset = 0x2
; extruder_type = DirectDrive
; fan_cooling_layer_time = 100,100,100,100,100,100,100,100,100,100
; fan_max_speed = 100,100,100,100,100,100,100,100,100,100
; fan_min_speed = 100,100,100,100,100,100,100,100,100,100
; filament_colour = #FECC66;#FFFFFF;#FB0207;#118002;#B3B3B3;#804003;#0F80FF;#FFFF0A;#21FFFF;#FB02FF
; filament_cost = 24.99,24.99,24.99,24.99,24.99,24.99,24.99,24.99,24.99,24.99
; filament_density = 1.26,1.26,1.26,1.26,1.26,1.26,1.26,1.26,1.26,1.26
; filament_diameter = 1.75,1.75,1.75,1.75,1.75,1.75,1.75,1.75,1.75,1.75
; filament_end_gcode = "; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n";"; filament end gcode \nM106 P3 S0\n"
; filament_flow_ratio = 0.98,0.98,0.98,0.98,0.98,0.98,0.98,0.98,0.98,0.98
; filament_ids = GFA00;GFA00;GFA00;GFA00;GFA00;GFA00;GFA00;GFA00;GFA00;GFA00
; filament_is_support = 0,0,0,0,0,0,0,0,0,0
; filament_max_volumetric_speed = 21,21,21,21,21,21,21,21,21,21
; filament_minimal_purge_on_wipe_tower = 15,15,15,15,15,15,15,15,15,15
; filament_settings_id = "Bambu PLA Basic @BBL X1C";"Bambu PLA Basic @BBL X1C";"Bambu PLA Basic @BBL X1C";"Bambu PLA Basic @BBL X1C";"Bambu PLA Basic @BBL X1C";"Bambu PLA Basic @BBL X1C";"Bambu PLA Basic @BBL X1C";"Bambu PLA Basic @BBL X1C";"Bambu PLA Basic @BBL X1C";"Bambu PLA Basic @BBL X1C"
; filament_soluble = 0,0,0,0,0,0,0,0,0,0
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}\n\n{if activate_air_filtration[current_extruder] && support_air_filtration}\nM106 P3 S{during_print_exhaust_fan_speed_num[current_extruder]} \n{endif}"
; filament_type = PLA;PLA;PLA;PLA;PLA;PLA;PLA;PLA;PLA;PLA
; filament_vendor = "Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab";"Bambu Lab"
; filename_format = {input_filename_base}_{filament_type[0]}_{print_time}.gcode
; filter_out_gap_fill = 0
; first_layer_print_sequence = 0
; flush_into_infill = 0
; flush_into_objects = 0
; flush_into_support = 1
; flush_multiplier = 1
; flush_volumes_matrix = 0,280,280,280,280,280,280,280,280,280,280,0,280,280,280,280,280,280,280,280,280,280,0,280,280,280,280,280,280,280,280,280,280,0,280,280,280,280,280,280,280,280,280,280,0,280,280,280,280,280,280,280,280,280,280,0,280,280,280,280,280,280,280,280,280,280,0,280,280,280,280,280,280,280,280,280,280,0,280,280,280,280,280,280,280,280,280,280,0,280,280,280,280,280,280,280,280,280,280,0
; flush_volumes_vector = 140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140,140
; full_fan_speed_layer = 0,0,0,0,0,0,0,0,0,0
; fuzzy_skin = none
; fuzzy_skin_point_distance = 0.8
; fuzzy_skin_thickness = 0.3
; gap_infill_speed = 200
; gcode_add_line_number = 0
; gcode_flavor = marlin
; host_type = octoprint
; hot_plate_temp = 55,55,55,55,55,55,55,55,55,55
; hot_plate_temp_initial_layer = 55,55,55,55,55,55,55,55,55,55
; independent_support_layer_height = 0
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
; nozzle_temperature = 220,220,220,220,220,220,220,220,220,220
; nozzle_temperature_initial_layer = 220,220,220,220,220,220,220,220,220,220
; nozzle_temperature_range_high = 240,240,240,240,240,240,240,240,240,240
; nozzle_temperature_range_low = 190,190,190,190,190,190,190,190,190,190
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
; overhang_fan_speed = 100,100,100,100,100,100,100,100,100,100
; overhang_fan_threshold = 50%,50%,50%,50%,50%,50%,50%,50%,50%,50%
; post_process = 
; pressure_advance = 0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02,0.02
; prime_tower_brim_width = 3
; prime_tower_width = 35
; prime_volume = 45
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
; reduce_fan_stop_start_freq = 1,1,1,1,1,1,1,1,1,1
; reduce_infill_retraction = 1
; required_nozzle_HRC = 3,3,3,3,3,3,3,3,3,3
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
; slow_down_for_layer_cooling = 1,1,1,1,1,1,1,1,1,1
; slow_down_layer_time = 4,4,4,4,4,4,4,4,4,4
; slow_down_min_speed = 20,20,20,20,20,20,20,20,20,20
; solid_infill_filament = 1
; sparse_infill_acceleration = 100%
; sparse_infill_anchor = 400%
; sparse_infill_anchor_max = 20
; sparse_infill_density = 15%
; sparse_infill_filament = 1
; sparse_infill_line_width = 0.45
; sparse_infill_pattern = grid
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
; temperature_vitrification = 55,55,55,55,55,55,55,55,55,55
; template_custom_gcode = 
; textured_plate_temp = 55,55,55,55,55,55,55,55,55,55
; textured_plate_temp_initial_layer = 55,55,55,55,55,55,55,55,55,55
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
; wipe_tower_x = 155
; wipe_tower_y = 220
; xy_contour_compensation = 0
; xy_hole_compensation = 0
; z_hop = 0.4
; z_hop_types = Auto Lift
; CONFIG_BLOCK_END

; EXECUTABLE_BLOCK_START
M73 P0 R15
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
M73 P28 R10
G1 X60 F12000
M73 P29 R10
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
M73 P31 R10
G1 E-0.5 F300

M73 P32 R10
G1 X70 F9000
M73 P33 R10
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
M73 P33 R9
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
M73 P34 R9
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
    G29 A X109.055 Y63.5415 I94.4203 J179.387
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
M73 P35 R9
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
M73 P36 R9
    G1 X115.000 E0.31181 F6033.27
    G1 X120.000 E0.31181 F1508.32
    G1 X125.000 E0.31181 F6033.27
    G1 X130.000 E0.31181 F1508.32
    G1 X135.000 E0.31181 F6033.27
    G1 X140.000 E0.31181 F1508.32
    G1 X145.000 E0.31181 F6033.27
    G1 X150.000 E0.31181 F1508.32
    G1 X155.000 E0.31181 F6033.27
M73 P37 R9
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
M73 P38 R9
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
M73 P39 R9
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
    G1 X95.000 E0.31181 F6033.27
    G1 X100.000 E0.31181 F1508.32
    G1 X105.000 E0.31181 F6033.27
    G1 X110.000 E0.31181 F1508.32
    G1 X115.000 E0.31181 F6033.27
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
M620 S0A
M204 S9000

M73 P40 R9
G1 Z3 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90 F3000
M73 P40 R8
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T0
M620.1 E F523 T240


M400

G92 E0







; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60 F15000
G1 X80 F15000
G1 X60 F15000; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265 F5000
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z3 F3000

M204 S500


M621 S0A
;_FORCE_RESUME_FAN_SPEED
; filament start gcode
M106 P3 S150


M981 S1 P20000 ;open spaghetti detector
G1 Z.2 F30000
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
; layer num/total_layer_count: 1/2
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
; PURGING FINISHED
G1 E-.8 F1800
; start printing object, unique label id: 1207
M624 AQAAAAAAAAA=
G1 X133.798 Y145.524 F30000
G1 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.2
G1 F3000
G1 X109.912 Y145.524 E.88966
G1 X109.912 Y121.639 E.88966
G1 X133.798 Y121.639 E.88966
G1 X133.798 Y145.464 E.88742
G1 X134.255 Y145.981 F30000
; FEATURE: Outer wall
M73 P41 R8
G1 F3000
G1 X109.455 Y145.981 E.92371
G1 X109.455 Y121.181 E.92371
G1 X134.255 Y121.181 E.92371
G1 X134.255 Y145.921 E.92147
; WIPE_START
G1 F24000
G1 X132.255 Y145.926 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X132.389 Y138.295 Z.6 F30000
G1 X132.679 Y121.821 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.505798
G1 F6300
G1 X133.409 Y122.552 E.03897
G1 X133.409 Y123.207 E.02469
G1 X132.23 Y122.027 E.06292
M73 P43 R8
G1 X131.575 Y122.027 E.02469
G1 X133.409 Y123.861 E.09784
G1 X133.409 Y124.516 E.02469
G1 X130.92 Y122.027 E.13275
G1 X130.266 Y122.027 E.02469
G1 X133.409 Y125.17 E.16767
G1 X133.409 Y125.825 E.02469
G1 X129.611 Y122.027 E.20259
G1 X128.957 Y122.027 E.02469
G1 X133.409 Y126.48 E.23751
M73 P44 R8
G1 X133.409 Y127.134 E.02469
G1 X128.302 Y122.027 E.27243
G1 X127.647 Y122.027 E.02469
G1 X133.409 Y127.789 E.30735
G1 X133.409 Y128.443 E.02469
G1 X126.993 Y122.027 E.34226
G1 X126.338 Y122.027 E.02469
G1 X133.409 Y129.098 E.37718
G1 X133.409 Y129.753 E.02469
G1 X125.684 Y122.027 E.4121
G1 X125.029 Y122.027 E.02469
G1 X133.409 Y130.407 E.44702
G1 X133.409 Y131.062 E.02469
G1 X124.374 Y122.027 E.48194
G1 X123.72 Y122.027 E.02469
G1 X133.409 Y131.716 E.51686
G1 X133.409 Y132.371 E.02469
G1 X123.065 Y122.027 E.55177
G1 X122.411 Y122.027 E.02469
G1 X133.409 Y133.026 E.58669
G1 X133.409 Y133.68 E.02469
G1 X121.756 Y122.027 E.62161
G1 X121.101 Y122.027 E.02469
G1 X133.409 Y134.335 E.65653
G1 X133.409 Y134.99 E.02469
G1 X120.447 Y122.027 E.69145
G1 X119.792 Y122.027 E.02469
G1 X133.409 Y135.644 E.72637
G1 X133.409 Y136.299 E.02469
G1 X119.137 Y122.027 E.76128
G1 X118.483 Y122.027 E.02469
G1 X133.409 Y136.953 E.7962
G1 X133.409 Y137.608 E.02469
G1 X117.828 Y122.027 E.83112
G1 X117.174 Y122.027 E.02469
G1 X133.409 Y138.263 E.86604
G1 X133.409 Y138.917 E.02469
M73 P45 R8
G1 X116.519 Y122.027 E.90096
G1 X115.864 Y122.027 E.02469
G1 X133.409 Y139.572 E.93588
G1 X133.409 Y140.226 E.02469
G1 X115.21 Y122.027 E.97079
G1 X114.555 Y122.027 E.02469
G1 X133.409 Y140.881 E1.00571
G1 X133.409 Y141.536 E.02469
G1 X113.901 Y122.027 E1.04063
G1 X113.246 Y122.027 E.02469
G1 X133.409 Y142.19 E1.07555
G1 X133.409 Y142.845 E.02469
G1 X112.591 Y122.027 E1.11047
G1 X111.937 Y122.027 E.02469
M73 P48 R7
G1 X133.409 Y143.499 E1.14539
G1 X133.409 Y144.154 E.02469
G1 X111.282 Y122.027 E1.1803
G1 X110.628 Y122.027 E.02469
G1 X133.409 Y144.809 E1.21522
G1 X133.409 Y145.136 E.01234
M73 P49 R7
G1 X133.082 Y145.136 E.01235
G1 X110.3 Y122.354 E1.21522
G1 X110.3 Y123.009 E.02469
G1 X132.427 Y145.136 E1.1803
G1 X131.773 Y145.136 E.02469
G1 X110.3 Y123.664 E1.14538
G1 X110.3 Y124.318 E.02469
G1 X131.118 Y145.136 E1.11046
G1 X130.463 Y145.136 E.02469
G1 X110.3 Y124.973 E1.07554
G1 X110.3 Y125.627 E.02469
G1 X129.809 Y145.136 E1.04062
G1 X129.154 Y145.136 E.02469
G1 X110.3 Y126.282 E1.00571
G1 X110.3 Y126.937 E.02469
G1 X128.5 Y145.136 E.97079
G1 X127.845 Y145.136 E.02469
G1 X110.3 Y127.591 E.93587
G1 X110.3 Y128.246 E.02469
G1 X127.19 Y145.136 E.90095
G1 X126.536 Y145.136 E.02469
G1 X110.3 Y128.9 E.86603
G1 X110.3 Y129.555 E.02469
G1 X125.881 Y145.136 E.83111
G1 X125.226 Y145.136 E.02469
M73 P50 R7
G1 X110.3 Y130.21 E.7962
G1 X110.3 Y130.864 E.02469
G1 X124.572 Y145.136 E.76128
G1 X123.917 Y145.136 E.02469
G1 X110.3 Y131.519 E.72636
G1 X110.3 Y132.174 E.02469
G1 X123.263 Y145.136 E.69144
G1 X122.608 Y145.136 E.02469
G1 X110.3 Y132.828 E.65652
G1 X110.3 Y133.483 E.02469
G1 X121.953 Y145.136 E.6216
G1 X121.299 Y145.136 E.02469
G1 X110.3 Y134.137 E.58669
G1 X110.3 Y134.792 E.02469
G1 X120.644 Y145.136 E.55177
G1 X119.99 Y145.136 E.02469
G1 X110.3 Y135.447 E.51685
G1 X110.3 Y136.101 E.02469
G1 X119.335 Y145.136 E.48193
G1 X118.68 Y145.136 E.02469
G1 X110.3 Y136.756 E.44701
G1 X110.3 Y137.41 E.02469
G1 X118.026 Y145.136 E.41209
G1 X117.371 Y145.136 E.02469
G1 X110.3 Y138.065 E.37718
G1 X110.3 Y138.72 E.02469
G1 X116.717 Y145.136 E.34226
G1 X116.062 Y145.136 E.02469
G1 X110.3 Y139.374 E.30734
G1 X110.3 Y140.029 E.02469
G1 X115.407 Y145.136 E.27242
G1 X114.753 Y145.136 E.02469
G1 X110.3 Y140.683 E.2375
G1 X110.3 Y141.338 E.02469
G1 X114.098 Y145.136 E.20258
G1 X113.444 Y145.136 E.02469
G1 X110.3 Y141.993 E.16767
G1 X110.3 Y142.647 E.02469
G1 X112.789 Y145.136 E.13275
G1 X112.134 Y145.136 E.02469
G1 X110.3 Y143.302 E.09783
G1 X110.3 Y143.956 E.02469
G1 X111.48 Y145.136 E.06291
G1 X110.825 Y145.136 E.02469
G1 X110.095 Y144.405 E.03896
; stop printing object, unique label id: 1207
M625
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #1
; material : PLA -> PLA
;--------------------
M220 S100
; filament end gcode 
M106 P3 S0

; WIPE_START
G1 F24000
G1 X110.825 Y145.136 E-.98139
G1 X111.48 Y145.136 E-.62188
G1 X111.259 Y144.915 E-.29674
; WIPE_END
G1 E-.1 F1800
M620 S1A
M204 S9000

G17
G2 Z0.6 I0.86 J0.86 P1 F10000 ; spiral lift a little from second lift

G1 Z3.2 F1200

G1 X70 F21000
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
M73 P51 R7
G1 Y-3

; get travel path for change filament
M620.1 X54 Y0 F21000 P0
M620.1 X54 Y0 F21000 P1
M620.1 X54 Y245 F21000 P2

M620.1 E F523 T240
T1
M620.1 E F523 T240


M400

G92 E0







; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z3.2 F3000

M204 S500


M621 S1A
M106 S0
M106 P2 S0
G1 X155.5 Y218.5 F30000
G1 Z3.6
G1 Z.2
G1 E2 F1800

; filament start gcode
M106 P3 S150



G4 S0
G1  X155.000 Y218.500 
G1  Y218.000 
G1  X190.000  E1.3302
G1  Y237.500  E0.7411
G1  X155.000  E1.3302
G1  Y218.000  E0.7411
G1  X155.500 Y218.500  
; CP TOOLCHANGE WIPE
; LINE_WIDTH: 0.575000
G1  X189.625  E1.4915 F990
G1  Y219.000  E0.0219
G1  X155.375  E1.4970 F1125
G1  Y219.500  E0.0219
G1  X189.625  E1.4970 F1374
G1  Y220.000  E0.0219
G1  X155.375  E1.4970 F2625
M73 P52 R7
G1  Y220.500  E0.0219
G1  X189.625  E1.4970 F2675
G1  Y221.000  E0.0219
G1  X155.375  E1.4970 F2725
G1  Y221.500  E0.0219
G1  X189.625  E1.4970 F2775
G1  Y222.000  E0.0219
G1  X155.375  E1.4970 F2825
G1  Y222.500  E0.0219
G1  X189.625  E1.4970 F2875
G1  Y223.000  E0.0219
G1  X155.375  E1.4970 F2925
G1  Y223.500  E0.0219
G1  X189.625  E1.4970 F2975
G1  Y224.000  E0.0219
G1  X155.375  E1.4970 F3000
G1  Y224.500  E0.0219
G1  X189.625  E1.4970
G1  Y225.000  E0.0219
G1  X155.375  E1.4970
G1  Y225.500  E0.0219
G1  X189.625  E1.4970
G1  Y226.000  E0.0219
G1  X155.375  E1.4970
G1  Y226.500  E0.0219
G1  X189.625  E1.4970
G1  Y227.000  E0.0219
G1  X155.375  E1.4970
G1  Y227.500  E0.0219
G1  X189.625  E1.4970
G1  Y228.000  E0.0219
G1  X155.375  E1.4970
G1  Y228.500  E0.0219
G1  X189.625  E1.4970
G1  Y229.000  E0.0219
G1  X155.375  E1.4970
G1  Y229.500  E0.0219
G1  X189.625  E1.4970
G1  Y230.000  E0.0219
G1  X155.375  E1.4970
G1  Y230.500  E0.0219
G1  X189.625  E1.4970
G1  Y231.000  E0.0219
G1  X155.375  E1.4970
G1  Y231.500  E0.0219
G1  X189.625  E1.4970
G1  Y232.000  E0.0219
G1  X155.375  E1.4970
G1  Y232.500  E0.0219
G1  X189.625  E1.4970
G1  Y233.000  E0.0219
G1  X155.375  E1.4970
G1  Y233.500  E0.0219
G1  X189.625  E1.4970
G1  Y234.000  E0.0219
G1  X155.375  E1.4970
G1  Y234.500  E0.0219
G1  X189.625  E1.4970
G1  Y235.000  E0.0219
G1  X155.375  E1.4970
G1  Y235.500  E0.0219
G1  X189.625  E1.4970
M73 P53 R7
G1  Y236.000  E0.0219
G1  X155.375  E1.4970
G1  Y236.500  E0.0219
G1  X189.625  E1.4970
G1  Y237.000  E0.0219
G1  X155.375  E1.4970
; LINE_WIDTH: 0.500000
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------


M73 P53 R6
G1  X155.500   F7200
; LAYER_HEIGHT: 0.200000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
G1  X154.543 
G1  Y237.957 
G1  Y217.543  E0.7759
G1  X190.457  E1.3650
G1  Y237.957  E0.7759
G1  X154.543  E1.3650
G1  X154.086 
M73 P54 R6
G1  Y238.414 
G1  Y217.086  E0.8106
G1  X190.914  E1.3997
G1  Y238.414  E0.8106
G1  X154.086  E1.3997
G1  X153.629 
G1  Y238.871 
G1  Y216.629  E0.8454
G1  X191.371  E1.4345
G1  Y238.871  E0.8454
G1  X153.629  E1.4345
G1  X153.172 
G1  Y239.328 
G1  Y216.172  E0.8801
G1  X191.828  E1.4692
G1  Y239.328  E0.8801
G1  X153.172  E1.4692
G1  X152.715 
G1  Y239.785 
G1  Y215.715  E0.9148
G1  X192.285  E1.5039
M73 P55 R6
G1  Y239.785  E0.9148
G1  X152.715  E1.5039
G1  X152.258 
G1  Y240.242 
G1  Y215.258  E0.9496
G1  X192.742  E1.5387
G1  Y240.242  E0.9496
G1  X152.258  E1.5387
G1  X151.800 
G1  Y240.700 
G1  Y214.800  E0.9843
G1  X193.200  E1.5734
G1  Y240.700  E0.9843
G1  X151.800  E1.5734

; WIPE_START
G1 F24000
G1 X151.8 Y238.7 E-.76
; WIPE_END
G1 E-.04 F1800
; start printing object, unique label id: 1295
M624 AgAAAAAAAAA=
G1 X151.881 Y231.068 Z.6 F30000
M73 P56 R6
G1 X153.132 Y112.745 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
; LAYER_HEIGHT: 0.2
G1 F3000
G1 X202.618 Y112.745 E1.84316
G1 X202.618 Y162.231 E1.84316
G1 X153.132 Y162.231 E1.84316
G1 X153.132 Y112.805 E1.84092
G1 X152.675 Y112.288 F30000
; FEATURE: Outer wall
G1 F3000
G1 X203.075 Y112.288 E1.87721
G1 X203.075 Y162.688 E1.87721
G1 X152.675 Y162.688 E1.87721
G1 X152.675 Y112.348 E1.87497
; WIPE_START
G1 F24000
G1 X154.675 Y112.345 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X162.307 Y112.44 Z.6 F30000
G1 X201.51 Y112.928 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.500361
G1 F6300
M73 P57 R6
G1 X202.229 Y113.647 E.03791
G1 X202.229 Y114.294 E.02411
G1 X201.069 Y113.133 E.06117
G1 X200.422 Y113.133 E.02411
G1 X202.229 Y114.94 E.09527
G1 X202.229 Y115.587 E.02411
G1 X199.775 Y113.133 E.12937
G1 X199.128 Y113.133 E.02411
G1 X202.229 Y116.234 E.16347
G1 X202.229 Y116.881 E.02411
G1 X198.481 Y113.133 E.19758
G1 X197.835 Y113.133 E.02411
G1 X202.229 Y117.528 E.23168
G1 X202.229 Y118.175 E.02411
G1 X197.188 Y113.133 E.26578
G1 X196.541 Y113.133 E.02411
G1 X202.229 Y118.822 E.29989
G1 X202.229 Y119.469 E.02411
G1 X195.894 Y113.133 E.33399
G1 X195.247 Y113.133 E.02411
G1 X202.229 Y120.116 E.36809
G1 X202.229 Y120.763 E.02411
M73 P58 R6
G1 X194.6 Y113.133 E.40219
G1 X193.953 Y113.133 E.02411
G1 X202.229 Y121.41 E.4363
G1 X202.229 Y122.057 E.02411
G1 X193.306 Y113.133 E.4704
G1 X192.659 Y113.133 E.02411
G1 X202.229 Y122.703 E.5045
G1 X202.229 Y123.35 E.02411
G1 X192.012 Y113.133 E.5386
G1 X191.365 Y113.133 E.02411
G1 X202.229 Y123.997 E.57271
G1 X202.229 Y124.644 E.02411
G1 X190.718 Y113.133 E.60681
G1 X190.072 Y113.133 E.02411
G1 X202.229 Y125.291 E.64091
G1 X202.229 Y125.938 E.02411
G1 X189.425 Y113.133 E.67502
G1 X188.778 Y113.133 E.02411
G1 X202.229 Y126.585 E.70912
G1 X202.229 Y127.232 E.02411
G1 X188.131 Y113.133 E.74322
G1 X187.484 Y113.133 E.02411
G1 X202.229 Y127.879 E.77732
G1 X202.229 Y128.526 E.02411
G1 X186.837 Y113.133 E.81143
G1 X186.19 Y113.133 E.02411
G1 X202.229 Y129.173 E.84553
G1 X202.229 Y129.82 E.02411
G1 X185.543 Y113.133 E.87963
G1 X184.896 Y113.133 E.02411
M73 P59 R6
G1 X202.229 Y130.467 E.91374
G1 X202.229 Y131.113 E.02411
G1 X184.249 Y113.133 E.94784
G1 X183.602 Y113.133 E.02411
G1 X202.229 Y131.76 E.98194
G1 X202.229 Y132.407 E.02411
G1 X182.955 Y113.133 E1.01604
G1 X182.308 Y113.133 E.02411
G1 X202.229 Y133.054 E1.05015
G1 X202.229 Y133.701 E.02411
G1 X181.662 Y113.133 E1.08425
G1 X181.015 Y113.133 E.02411
G1 X202.229 Y134.348 E1.11835
G1 X202.229 Y134.995 E.02411
G1 X180.368 Y113.133 E1.15246
G1 X179.721 Y113.133 E.02411
G1 X202.229 Y135.642 E1.18656
G1 X202.229 Y136.289 E.02411
G1 X179.074 Y113.133 E1.22066
G1 X178.427 Y113.133 E.02411
G1 X202.229 Y136.936 E1.25476
G1 X202.229 Y137.583 E.02411
G1 X177.78 Y113.133 E1.28887
G1 X177.133 Y113.133 E.02411
G1 X202.229 Y138.23 E1.32297
G1 X202.229 Y138.876 E.02411
M73 P60 R6
G1 X176.486 Y113.133 E1.35707
G1 X175.839 Y113.133 E.02411
G1 X202.229 Y139.523 E1.39118
G1 X202.229 Y140.17 E.02411
G1 X175.192 Y113.133 E1.42528
M73 P60 R5
G1 X174.545 Y113.133 E.02411
G1 X202.229 Y140.817 E1.45938
G1 X202.229 Y141.464 E.02411
G1 X173.899 Y113.133 E1.49348
G1 X173.252 Y113.133 E.02411
G1 X202.229 Y142.111 E1.52759
G1 X202.229 Y142.758 E.02411
G1 X172.605 Y113.133 E1.56169
G1 X171.958 Y113.133 E.02411
G1 X202.229 Y143.405 E1.59579
G1 X202.229 Y144.052 E.02411
G1 X171.311 Y113.133 E1.62989
G1 X170.664 Y113.133 E.02411
M73 P61 R5
G1 X202.229 Y144.699 E1.664
G1 X202.229 Y145.346 E.02411
G1 X170.017 Y113.133 E1.6981
G1 X169.37 Y113.133 E.02411
G1 X202.229 Y145.993 E1.7322
G1 X202.229 Y146.639 E.02411
G1 X168.723 Y113.133 E1.76631
G1 X168.076 Y113.133 E.02411
G1 X202.229 Y147.286 E1.80041
G1 X202.229 Y147.933 E.02411
G1 X167.429 Y113.133 E1.83451
G1 X166.782 Y113.133 E.02411
G1 X202.229 Y148.58 E1.86861
G1 X202.229 Y149.227 E.02411
G1 X166.136 Y113.133 E1.90272
G1 X165.489 Y113.133 E.02411
G1 X202.229 Y149.874 E1.93682
G1 X202.229 Y150.521 E.02411
G1 X164.842 Y113.133 E1.97092
G1 X164.195 Y113.133 E.02411
G1 X202.229 Y151.168 E2.00503
G1 X202.229 Y151.815 E.02411
G1 X163.548 Y113.133 E2.03913
G1 X162.901 Y113.133 E.02411
G1 X202.229 Y152.462 E2.07323
G1 X202.229 Y153.109 E.02411
G1 X162.254 Y113.133 E2.10733
G1 X161.607 Y113.133 E.02411
G1 X202.229 Y153.756 E2.14144
G1 X202.229 Y154.403 E.02411
G1 X160.96 Y113.133 E2.17554
G1 X160.313 Y113.133 E.02411
G1 X202.229 Y155.049 E2.20964
G1 X202.229 Y155.696 E.02411
G1 X159.666 Y113.133 E2.24375
G1 X159.019 Y113.133 E.02411
G1 X202.229 Y156.343 E2.27785
G1 X202.229 Y156.99 E.02411
G1 X158.372 Y113.133 E2.31195
G1 X157.726 Y113.133 E.02411
G1 X202.229 Y157.637 E2.34605
G1 X202.229 Y158.284 E.02411
G1 X157.079 Y113.133 E2.38016
G1 X156.432 Y113.133 E.02411
G1 X202.229 Y158.931 E2.41426
G1 X202.229 Y159.578 E.02411
G1 X155.785 Y113.133 E2.44836
G1 X155.138 Y113.133 E.02411
G1 X202.229 Y160.225 E2.48247
G1 X202.229 Y160.872 E.02411
G1 X154.491 Y113.133 E2.51657
G1 X153.844 Y113.133 E.02411
G1 X202.229 Y161.519 E2.55067
G1 X202.229 Y161.842 E.01206
G1 X201.906 Y161.842 E.01206
G1 X153.521 Y113.457 E2.55067
G1 X153.521 Y114.104 E.02411
G1 X201.259 Y161.842 E2.51657
G1 X200.612 Y161.842 E.02411
M73 P62 R5
G1 X153.521 Y114.751 E2.48246
G1 X153.521 Y115.397 E.02411
G1 X199.965 Y161.842 E2.44836
G1 X199.318 Y161.842 E.02411
G1 X153.521 Y116.044 E2.41426
G1 X153.521 Y116.691 E.02411
G1 X198.671 Y161.842 E2.38016
G1 X198.024 Y161.842 E.02411
G1 X153.521 Y117.338 E2.34605
G1 X153.521 Y117.985 E.02411
G1 X197.378 Y161.842 E2.31195
G1 X196.731 Y161.842 E.02411
G1 X153.521 Y118.632 E2.27785
G1 X153.521 Y119.279 E.02411
G1 X196.084 Y161.842 E2.24374
G1 X195.437 Y161.842 E.02411
G1 X153.521 Y119.926 E2.20964
G1 X153.521 Y120.573 E.02411
G1 X194.79 Y161.842 E2.17554
G1 X194.143 Y161.842 E.02411
G1 X153.521 Y121.22 E2.14144
G1 X153.521 Y121.867 E.02411
G1 X193.496 Y161.842 E2.10733
G1 X192.849 Y161.842 E.02411
G1 X153.521 Y122.514 E2.07323
G1 X153.521 Y123.16 E.02411
G1 X192.202 Y161.842 E2.03913
G1 X191.555 Y161.842 E.02411
G1 X153.521 Y123.807 E2.00503
G1 X153.521 Y124.454 E.02411
G1 X190.908 Y161.842 E1.97092
G1 X190.261 Y161.842 E.02411
G1 X153.521 Y125.101 E1.93682
G1 X153.521 Y125.748 E.02411
M73 P63 R5
G1 X189.615 Y161.842 E1.90272
G1 X188.968 Y161.842 E.02411
G1 X153.521 Y126.395 E1.86861
G1 X153.521 Y127.042 E.02411
G1 X188.321 Y161.842 E1.83451
G1 X187.674 Y161.842 E.02411
G1 X153.521 Y127.689 E1.80041
G1 X153.521 Y128.336 E.02411
G1 X187.027 Y161.842 E1.76631
G1 X186.38 Y161.842 E.02411
G1 X153.521 Y128.983 E1.7322
G1 X153.521 Y129.63 E.02411
G1 X185.733 Y161.842 E1.6981
G1 X185.086 Y161.842 E.02411
G1 X153.521 Y130.277 E1.664
G1 X153.521 Y130.924 E.02411
G1 X184.439 Y161.842 E1.62989
G1 X183.792 Y161.842 E.02411
G1 X153.521 Y131.57 E1.59579
G1 X153.521 Y132.217 E.02411
G1 X183.145 Y161.842 E1.56169
G1 X182.498 Y161.842 E.02411
G1 X153.521 Y132.864 E1.52759
G1 X153.521 Y133.511 E.02411
G1 X181.851 Y161.842 E1.49348
G1 X181.205 Y161.842 E.02411
G1 X153.521 Y134.158 E1.45938
G1 X153.521 Y134.805 E.02411
M73 P64 R5
G1 X180.558 Y161.842 E1.42528
G1 X179.911 Y161.842 E.02411
G1 X153.521 Y135.452 E1.39117
G1 X153.521 Y136.099 E.02411
G1 X179.264 Y161.842 E1.35707
G1 X178.617 Y161.842 E.02411
G1 X153.521 Y136.746 E1.32297
G1 X153.521 Y137.393 E.02411
G1 X177.97 Y161.842 E1.28887
G1 X177.323 Y161.842 E.02411
G1 X153.521 Y138.04 E1.25476
G1 X153.521 Y138.687 E.02411
G1 X176.676 Y161.842 E1.22066
G1 X176.029 Y161.842 E.02411
G1 X153.521 Y139.333 E1.18656
G1 X153.521 Y139.98 E.02411
G1 X175.382 Y161.842 E1.15245
G1 X174.735 Y161.842 E.02411
G1 X153.521 Y140.627 E1.11835
G1 X153.521 Y141.274 E.02411
G1 X174.088 Y161.842 E1.08425
G1 X173.442 Y161.842 E.02411
G1 X153.521 Y141.921 E1.05015
G1 X153.521 Y142.568 E.02411
M73 P65 R5
G1 X172.795 Y161.842 E1.01604
G1 X172.148 Y161.842 E.02411
G1 X153.521 Y143.215 E.98194
G1 X153.521 Y143.862 E.02411
G1 X171.501 Y161.842 E.94784
G1 X170.854 Y161.842 E.02411
G1 X153.521 Y144.509 E.91374
G1 X153.521 Y145.156 E.02411
G1 X170.207 Y161.842 E.87963
G1 X169.56 Y161.842 E.02411
G1 X153.521 Y145.803 E.84553
G1 X153.521 Y146.45 E.02411
G1 X168.913 Y161.842 E.81143
G1 X168.266 Y161.842 E.02411
G1 X153.521 Y147.097 E.77732
G1 X153.521 Y147.743 E.02411
G1 X167.619 Y161.842 E.74322
G1 X166.972 Y161.842 E.02411
G1 X153.521 Y148.39 E.70912
G1 X153.521 Y149.037 E.02411
G1 X166.325 Y161.842 E.67502
G1 X165.678 Y161.842 E.02411
G1 X153.521 Y149.684 E.64091
M73 P66 R5
G1 X153.521 Y150.331 E.02411
G1 X165.032 Y161.842 E.60681
G1 X164.385 Y161.842 E.02411
G1 X153.521 Y150.978 E.57271
G1 X153.521 Y151.625 E.02411
G1 X163.738 Y161.842 E.5386
G1 X163.091 Y161.842 E.02411
G1 X153.521 Y152.272 E.5045
G1 X153.521 Y152.919 E.02411
G1 X162.444 Y161.842 E.4704
G1 X161.797 Y161.842 E.02411
G1 X153.521 Y153.566 E.4363
G1 X153.521 Y154.213 E.02411
G1 X161.15 Y161.842 E.40219
G1 X160.503 Y161.842 E.02411
G1 X153.521 Y154.86 E.36809
G1 X153.521 Y155.506 E.02411
G1 X159.856 Y161.842 E.33399
M73 P66 R4
G1 X159.209 Y161.842 E.02411
G1 X153.521 Y156.153 E.29988
G1 X153.521 Y156.8 E.02411
G1 X158.562 Y161.842 E.26578
G1 X157.915 Y161.842 E.02411
M73 P67 R4
G1 X153.521 Y157.447 E.23168
G1 X153.521 Y158.094 E.02411
G1 X157.269 Y161.842 E.19758
G1 X156.622 Y161.842 E.02411
G1 X153.521 Y158.741 E.16347
G1 X153.521 Y159.388 E.02411
G1 X155.975 Y161.842 E.12937
G1 X155.328 Y161.842 E.02411
G1 X153.521 Y160.035 E.09527
G1 X153.521 Y160.682 E.02411
G1 X154.681 Y161.842 E.06116
G1 X154.034 Y161.842 E.02411
G1 X153.315 Y161.123 E.0379
; WIPE_START
G1 F24000
G1 X154.034 Y161.842 E-.38642
G1 X154.681 Y161.842 E-.24583
G1 X154.443 Y161.604 E-.12776
; WIPE_END
G1 E-.04 F1800
G1 X153.546 Y154.025 Z.6 F30000
G1 X146.342 Y93.14 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X122.456 Y93.14 E.88966
G1 X122.456 Y69.254 E.88966
G1 X146.342 Y69.254 E.88966
G1 X146.342 Y93.08 E.88742
M73 P68 R4
G1 X146.799 Y93.597 F30000
; FEATURE: Outer wall
G1 F3000
G1 X121.999 Y93.597 E.92371
G1 X121.999 Y68.797 E.92371
G1 X146.799 Y68.797 E.92371
G1 X146.799 Y93.537 E.92147
; PURGING FINISHED
; WIPE_START
G1 F24000
G1 X144.799 Y93.541 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1295
M625
; start printing object, unique label id: 1295
M624 AgAAAAAAAAA=
G1 X144.933 Y85.91 Z.6 F30000
G1 X145.223 Y69.437 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.505798
G1 F6300
G1 X145.953 Y70.167 E.03897
G1 X145.953 Y70.822 E.02469
G1 X144.774 Y69.642 E.06292
G1 X144.119 Y69.642 E.02469
G1 X145.953 Y71.476 E.09784
G1 X145.953 Y72.131 E.02469
G1 X143.465 Y69.642 E.13275
G1 X142.81 Y69.642 E.02469
G1 X145.953 Y72.786 E.16767
G1 X145.953 Y73.44 E.02469
G1 X142.155 Y69.642 E.20259
G1 X141.501 Y69.642 E.02469
G1 X145.953 Y74.095 E.23751
G1 X145.953 Y74.749 E.02469
G1 X140.846 Y69.642 E.27243
G1 X140.192 Y69.642 E.02469
G1 X145.953 Y75.404 E.30735
G1 X145.953 Y76.059 E.02469
G1 X139.537 Y69.642 E.34226
G1 X138.882 Y69.642 E.02469
M73 P69 R4
G1 X145.953 Y76.713 E.37718
G1 X145.953 Y77.368 E.02469
G1 X138.228 Y69.642 E.4121
G1 X137.573 Y69.642 E.02469
G1 X145.953 Y78.022 E.44702
G1 X145.953 Y78.677 E.02469
G1 X136.919 Y69.642 E.48194
G1 X136.264 Y69.642 E.02469
G1 X145.953 Y79.332 E.51686
G1 X145.953 Y79.986 E.02469
G1 X135.609 Y69.642 E.55177
G1 X134.955 Y69.642 E.02469
G1 X145.953 Y80.641 E.58669
G1 X145.953 Y81.295 E.02469
G1 X134.3 Y69.642 E.62161
G1 X133.645 Y69.642 E.02469
G1 X145.953 Y81.95 E.65653
G1 X145.953 Y82.605 E.02469
G1 X132.991 Y69.642 E.69145
G1 X132.336 Y69.642 E.02469
G1 X145.953 Y83.259 E.72637
G1 X145.953 Y83.914 E.02469
G1 X131.682 Y69.642 E.76128
G1 X131.027 Y69.642 E.02469
G1 X145.953 Y84.569 E.7962
G1 X145.953 Y85.223 E.02469
G1 X130.372 Y69.642 E.83112
G1 X129.718 Y69.642 E.02469
G1 X145.953 Y85.878 E.86604
G1 X145.953 Y86.532 E.02469
G1 X129.063 Y69.642 E.90096
G1 X128.409 Y69.642 E.02469
G1 X145.953 Y87.187 E.93588
G1 X145.953 Y87.842 E.02469
G1 X127.754 Y69.642 E.97079
G1 X127.099 Y69.642 E.02469
G1 X145.953 Y88.496 E1.00571
G1 X145.953 Y89.151 E.02469
G1 X126.445 Y69.642 E1.04063
G1 X125.79 Y69.642 E.02469
G1 X145.953 Y89.805 E1.07555
G1 X145.953 Y90.46 E.02469
G1 X125.136 Y69.642 E1.11047
G1 X124.481 Y69.642 E.02469
G1 X145.953 Y91.115 E1.14539
G1 X145.953 Y91.769 E.02469
G1 X123.826 Y69.642 E1.1803
G1 X123.172 Y69.642 E.02469
G1 X145.953 Y92.424 E1.21522
G1 X145.953 Y92.751 E.01234
G1 X145.626 Y92.751 E.01235
G1 X122.845 Y69.97 E1.21522
G1 X122.845 Y70.624 E.02469
G1 X144.971 Y92.751 E1.1803
G1 X144.317 Y92.751 E.02469
G1 X122.845 Y71.279 E1.14538
G1 X122.845 Y71.933 E.02469
G1 X143.662 Y92.751 E1.11046
G1 X143.008 Y92.751 E.02469
M73 P70 R4
G1 X122.845 Y72.588 E1.07554
G1 X122.845 Y73.243 E.02469
G1 X142.353 Y92.751 E1.04063
G1 X141.698 Y92.751 E.02469
G1 X122.845 Y73.897 E1.00571
G1 X122.845 Y74.552 E.02469
G1 X141.044 Y92.751 E.97079
G1 X140.389 Y92.751 E.02469
G1 X122.845 Y75.206 E.93587
G1 X122.845 Y75.861 E.02469
G1 X139.735 Y92.751 E.90095
G1 X139.08 Y92.751 E.02469
G1 X122.845 Y76.516 E.86603
G1 X122.845 Y77.17 E.02469
G1 X138.425 Y92.751 E.83112
G1 X137.771 Y92.751 E.02469
G1 X122.845 Y77.825 E.7962
G1 X122.845 Y78.479 E.02469
G1 X137.116 Y92.751 E.76128
G1 X136.461 Y92.751 E.02469
G1 X122.845 Y79.134 E.72636
G1 X122.845 Y79.789 E.02469
G1 X135.807 Y92.751 E.69144
G1 X135.152 Y92.751 E.02469
G1 X122.845 Y80.443 E.65652
G1 X122.845 Y81.098 E.02469
G1 X134.498 Y92.751 E.62161
G1 X133.843 Y92.751 E.02469
G1 X122.845 Y81.753 E.58669
G1 X122.845 Y82.407 E.02469
G1 X133.188 Y92.751 E.55177
G1 X132.534 Y92.751 E.02469
G1 X122.845 Y83.062 E.51685
G1 X122.845 Y83.716 E.02469
G1 X131.879 Y92.751 E.48193
G1 X131.225 Y92.751 E.02469
G1 X122.845 Y84.371 E.44701
G1 X122.845 Y85.026 E.02469
G1 X130.57 Y92.751 E.4121
G1 X129.915 Y92.751 E.02469
G1 X122.845 Y85.68 E.37718
G1 X122.845 Y86.335 E.02469
G1 X129.261 Y92.751 E.34226
G1 X128.606 Y92.751 E.02469
G1 X122.845 Y86.989 E.30734
G1 X122.845 Y87.644 E.02469
G1 X127.952 Y92.751 E.27242
G1 X127.297 Y92.751 E.02469
G1 X122.845 Y88.299 E.2375
G1 X122.845 Y88.953 E.02469
G1 X126.642 Y92.751 E.20259
G1 X125.988 Y92.751 E.02469
M73 P71 R4
G1 X122.845 Y89.608 E.16767
G1 X122.845 Y90.262 E.02469
G1 X125.333 Y92.751 E.13275
G1 X124.679 Y92.751 E.02469
G1 X122.845 Y90.917 E.09783
G1 X122.845 Y91.572 E.02469
G1 X124.024 Y92.751 E.06291
G1 X123.369 Y92.751 E.02469
G1 X122.639 Y92.021 E.03897
; WIPE_START
G1 F24000
G1 X123.369 Y92.751 E-.39257
G1 X124.024 Y92.751 E-.24875
G1 X123.803 Y92.53 E-.11868
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1295
M625
; start printing object, unique label id: 1332
M624 BAAAAAAAAAA=
G1 X131.405 Y91.843 Z.6 F30000
G1 X192.892 Y86.284 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X169.006 Y86.284 E.88966
G1 X169.006 Y62.399 E.88966
G1 X192.892 Y62.399 E.88966
G1 X192.892 Y86.224 E.88742
G1 X193.349 Y86.741 F30000
; FEATURE: Outer wall
G1 F3000
G1 X168.549 Y86.741 E.92371
G1 X168.549 Y61.941 E.92371
G1 X193.349 Y61.941 E.92371
G1 X193.349 Y86.681 E.92147
; WIPE_START
G1 F24000
G1 X191.349 Y86.686 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X191.483 Y79.055 Z.6 F30000
G1 X191.773 Y62.581 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.505798
G1 F6300
G1 X192.503 Y63.312 E.03897
G1 X192.503 Y63.967 E.02469
G1 X191.324 Y62.787 E.06292
G1 X190.669 Y62.787 E.02469
G1 X192.503 Y64.621 E.09784
M73 P72 R4
G1 X192.503 Y65.276 E.02469
G1 X190.015 Y62.787 E.13275
G1 X189.36 Y62.787 E.02469
G1 X192.503 Y65.93 E.16767
G1 X192.503 Y66.585 E.02469
G1 X188.705 Y62.787 E.20259
G1 X188.051 Y62.787 E.02469
G1 X192.503 Y67.24 E.23751
G1 X192.503 Y67.894 E.02469
G1 X187.396 Y62.787 E.27243
G1 X186.741 Y62.787 E.02469
G1 X192.503 Y68.549 E.30735
G1 X192.503 Y69.203 E.02469
G1 X186.087 Y62.787 E.34226
G1 X185.432 Y62.787 E.02469
G1 X192.503 Y69.858 E.37718
G1 X192.503 Y70.513 E.02469
G1 X184.778 Y62.787 E.4121
G1 X184.123 Y62.787 E.02469
G1 X192.503 Y71.167 E.44702
G1 X192.503 Y71.822 E.02469
G1 X183.468 Y62.787 E.48194
G1 X182.814 Y62.787 E.02469
G1 X192.503 Y72.476 E.51686
G1 X192.503 Y73.131 E.02469
G1 X182.159 Y62.787 E.55177
G1 X181.505 Y62.787 E.02469
G1 X192.503 Y73.786 E.58669
G1 X192.503 Y74.44 E.02469
G1 X180.85 Y62.787 E.62161
G1 X180.195 Y62.787 E.02469
G1 X192.503 Y75.095 E.65653
G1 X192.503 Y75.75 E.02469
G1 X179.541 Y62.787 E.69145
G1 X178.886 Y62.787 E.02469
G1 X192.503 Y76.404 E.72637
G1 X192.503 Y77.059 E.02469
G1 X178.232 Y62.787 E.76128
G1 X177.577 Y62.787 E.02469
G1 X192.503 Y77.713 E.7962
G1 X192.503 Y78.368 E.02469
G1 X176.922 Y62.787 E.83112
G1 X176.268 Y62.787 E.02469
M73 P73 R4
G1 X192.503 Y79.023 E.86604
G1 X192.503 Y79.677 E.02469
G1 X175.613 Y62.787 E.90096
G1 X174.959 Y62.787 E.02469
G1 X192.503 Y80.332 E.93588
G1 X192.503 Y80.986 E.02469
G1 X174.304 Y62.787 E.97079
G1 X173.649 Y62.787 E.02469
G1 X192.503 Y81.641 E1.00571
G1 X192.503 Y82.296 E.02469
G1 X172.995 Y62.787 E1.04063
G1 X172.34 Y62.787 E.02469
G1 X192.503 Y82.95 E1.07555
G1 X192.503 Y83.605 E.02469
G1 X171.685 Y62.787 E1.11047
G1 X171.031 Y62.787 E.02469
G1 X192.503 Y84.259 E1.14539
G1 X192.503 Y84.914 E.02469
G1 X170.376 Y62.787 E1.1803
G1 X169.722 Y62.787 E.02469
G1 X192.503 Y85.569 E1.21522
G1 X192.503 Y85.896 E.01234
G1 X192.176 Y85.896 E.01235
G1 X169.394 Y63.114 E1.21522
G1 X169.394 Y63.769 E.02469
G1 X191.521 Y85.896 E1.1803
G1 X190.867 Y85.896 E.02469
G1 X169.394 Y64.424 E1.14538
G1 X169.394 Y65.078 E.02469
G1 X190.212 Y85.896 E1.11046
G1 X189.557 Y85.896 E.02469
G1 X169.394 Y65.733 E1.07554
G1 X169.394 Y66.387 E.02469
G1 X188.903 Y85.896 E1.04062
G1 X188.248 Y85.896 E.02469
M73 P73 R3
G1 X169.394 Y67.042 E1.00571
G1 X169.394 Y67.697 E.02469
G1 X187.594 Y85.896 E.97079
G1 X186.939 Y85.896 E.02469
G1 X169.394 Y68.351 E.93587
G1 X169.394 Y69.006 E.02469
G1 X186.284 Y85.896 E.90095
G1 X185.63 Y85.896 E.02469
G1 X169.394 Y69.66 E.86603
G1 X169.394 Y70.315 E.02469
G1 X184.975 Y85.896 E.83111
G1 X184.321 Y85.896 E.02469
G1 X169.394 Y70.97 E.7962
G1 X169.394 Y71.624 E.02469
G1 X183.666 Y85.896 E.76128
G1 X183.011 Y85.896 E.02469
G1 X169.394 Y72.279 E.72636
M73 P74 R3
G1 X169.394 Y72.934 E.02469
G1 X182.357 Y85.896 E.69144
G1 X181.702 Y85.896 E.02469
G1 X169.394 Y73.588 E.65652
G1 X169.394 Y74.243 E.02469
G1 X181.048 Y85.896 E.6216
G1 X180.393 Y85.896 E.02469
G1 X169.394 Y74.897 E.58669
G1 X169.394 Y75.552 E.02469
G1 X179.738 Y85.896 E.55177
G1 X179.084 Y85.896 E.02469
G1 X169.394 Y76.207 E.51685
G1 X169.394 Y76.861 E.02469
G1 X178.429 Y85.896 E.48193
G1 X177.774 Y85.896 E.02469
G1 X169.394 Y77.516 E.44701
G1 X169.394 Y78.17 E.02469
G1 X177.12 Y85.896 E.41209
G1 X176.465 Y85.896 E.02469
G1 X169.394 Y78.825 E.37718
G1 X169.394 Y79.48 E.02469
G1 X175.811 Y85.896 E.34226
G1 X175.156 Y85.896 E.02469
G1 X169.394 Y80.134 E.30734
G1 X169.394 Y80.789 E.02469
G1 X174.501 Y85.896 E.27242
G1 X173.847 Y85.896 E.02469
G1 X169.394 Y81.443 E.2375
G1 X169.394 Y82.098 E.02469
G1 X173.192 Y85.896 E.20258
G1 X172.538 Y85.896 E.02469
G1 X169.394 Y82.753 E.16767
G1 X169.394 Y83.407 E.02469
G1 X171.883 Y85.896 E.13275
G1 X171.228 Y85.896 E.02469
G1 X169.394 Y84.062 E.09783
G1 X169.394 Y84.716 E.02469
G1 X170.574 Y85.896 E.06291
G1 X169.919 Y85.896 E.02469
G1 X169.189 Y85.165 E.03896
; CHANGE_LAYER
; Z_HEIGHT: 0.48
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X169.919 Y85.896 E-.39255
G1 X170.574 Y85.896 E-.24875
G1 X170.353 Y85.675 E-.11869
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1332
M625
; layer num/total_layer_count: 2/2
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
; PURGING FINISHED
G1 E-.8
; start printing object, unique label id: 1332
M624 BAAAAAAAAAA=
G1 X177.974 Y86.088 Z.6 F30000
G1 X193.539 Y86.931 Z.6
G1 Z.48
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F12000
G1 X168.359 Y86.931 E1.03388
G1 X168.359 Y61.751 E1.03388
G1 X193.539 Y61.751 E1.03388
G1 X193.539 Y86.871 E1.03142
M204 S10000
G1 X193.339 Y85.937 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X192.545 Y86.732 E.04998
M73 P75 R3
G1 X191.993 Y86.732
G1 X193.339 Y85.386 E.08467
G1 X193.339 Y84.835
G1 X191.442 Y86.732 E.11936
G1 X190.891 Y86.732
G1 X193.339 Y84.283 E.15404
G1 X193.339 Y83.732
G1 X190.339 Y86.732 E.18873
G1 X189.788 Y86.732
G1 X193.339 Y83.18 E.22342
G1 X193.339 Y82.629
G1 X189.236 Y86.732 E.25811
G1 X188.685 Y86.732
G1 X193.339 Y82.078 E.2928
G1 X193.339 Y81.526
G1 X188.134 Y86.732 E.32748
G1 X187.582 Y86.732
G1 X193.339 Y80.975 E.36217
G1 X193.339 Y80.423
G1 X187.031 Y86.732 E.39686
G1 X186.479 Y86.732
G1 X193.339 Y79.872 E.43155
G1 X193.339 Y79.32
G1 X185.928 Y86.732 E.46624
G1 X185.376 Y86.732
G1 X193.339 Y78.769 E.50092
G1 X193.339 Y78.218
G1 X184.825 Y86.732 E.53561
G1 X184.274 Y86.732
G1 X193.339 Y77.666 E.5703
G1 X193.339 Y77.115
G1 X183.722 Y86.732 E.60499
G1 X183.171 Y86.732
G1 X193.339 Y76.563 E.63968
G1 X193.339 Y76.012
G1 X182.619 Y86.732 E.67437
G1 X182.068 Y86.732
G1 X193.339 Y75.461 E.70905
G1 X193.339 Y74.909
M73 P76 R3
G1 X181.517 Y86.732 E.74374
G1 X180.965 Y86.732
G1 X193.339 Y74.358 E.77843
G1 X193.339 Y73.806
G1 X180.414 Y86.732 E.81312
G1 X179.862 Y86.732
G1 X193.339 Y73.255 E.84781
G1 X193.339 Y72.703
G1 X179.311 Y86.732 E.88249
G1 X178.759 Y86.732
G1 X193.339 Y72.152 E.91718
G1 X193.339 Y71.601
G1 X178.208 Y86.732 E.95187
G1 X177.657 Y86.732
G1 X193.339 Y71.049 E.98656
G1 X193.339 Y70.498
G1 X177.105 Y86.732 E1.02125
G1 X176.554 Y86.732
G1 X193.339 Y69.946 E1.05593
G1 X193.339 Y69.395
G1 X176.002 Y86.732 E1.09062
G1 X175.451 Y86.732
G1 X193.339 Y68.844 E1.12531
G1 X193.339 Y68.292
G1 X174.899 Y86.732 E1.16
G1 X174.348 Y86.732
G1 X193.339 Y67.741 E1.19469
G1 X193.339 Y67.189
G1 X173.797 Y86.732 E1.22937
G1 X173.245 Y86.732
G1 X193.339 Y66.638 E1.26406
G1 X193.339 Y66.086
G1 X172.694 Y86.732 E1.29875
G1 X172.142 Y86.732
G1 X193.339 Y65.535 E1.33344
G1 X193.339 Y64.984
G1 X171.591 Y86.732 E1.36813
G1 X171.04 Y86.732
G1 X193.339 Y64.432 E1.40281
G1 X193.339 Y63.881
G1 X170.488 Y86.732 E1.4375
G1 X169.937 Y86.732
G1 X193.339 Y63.329 E1.47219
G1 X193.339 Y62.778
G1 X169.385 Y86.732 E1.50688
G1 X168.834 Y86.732
G1 X193.339 Y62.227 E1.54157
G1 X193.064 Y61.951
G1 X168.558 Y86.456 E1.54156
G1 X168.558 Y85.905
G1 X192.512 Y61.951 E1.50687
G1 X191.961 Y61.951
M73 P83 R2
G1 X168.558 Y85.353 E1.47218
G1 X168.558 Y84.802
G1 X191.409 Y61.951 E1.43749
G1 X190.858 Y61.951
G1 X168.558 Y84.251 E1.4028
G1 X168.558 Y83.699
G1 X190.307 Y61.951 E1.36812
G1 X189.755 Y61.951
G1 X168.558 Y83.148 E1.33343
G1 X168.558 Y82.596
G1 X189.204 Y61.951 E1.29874
G1 X188.652 Y61.951
G1 X168.558 Y82.045 E1.26405
G1 X168.558 Y81.493
G1 X188.101 Y61.951 E1.22936
G1 X187.549 Y61.951
G1 X168.558 Y80.942 E1.19468
G1 X168.558 Y80.391
G1 X186.998 Y61.951 E1.15999
G1 X186.447 Y61.951
G1 X168.558 Y79.839 E1.1253
G1 X168.558 Y79.288
G1 X185.895 Y61.951 E1.09061
G1 X185.344 Y61.951
G1 X168.558 Y78.736 E1.05592
G1 X168.558 Y78.185
G1 X184.792 Y61.951 E1.02124
G1 X184.241 Y61.951
G1 X168.558 Y77.634 E.98655
G1 X168.558 Y77.082
G1 X183.689 Y61.951 E.95186
G1 X183.138 Y61.951
G1 X168.558 Y76.531 E.91717
G1 X168.558 Y75.979
G1 X182.587 Y61.951 E.88248
G1 X182.035 Y61.951
G1 X168.558 Y75.428 E.8478
G1 X168.558 Y74.876
G1 X181.484 Y61.951 E.81311
G1 X180.932 Y61.951
G1 X168.558 Y74.325 E.77842
G1 X168.558 Y73.774
G1 X180.381 Y61.951 E.74373
G1 X179.83 Y61.951
G1 X168.558 Y73.222 E.70904
G1 X168.558 Y72.671
G1 X179.278 Y61.951 E.67436
G1 X178.727 Y61.951
G1 X168.558 Y72.119 E.63967
G1 X168.558 Y71.568
G1 X178.175 Y61.951 E.60498
G1 X177.624 Y61.951
G1 X168.558 Y71.017 E.57029
G1 X168.558 Y70.465
G1 X177.072 Y61.951 E.5356
G1 X176.521 Y61.951
G1 X168.558 Y69.914 E.50092
G1 X168.558 Y69.362
G1 X175.97 Y61.951 E.46623
G1 X175.418 Y61.951
G1 X168.558 Y68.811 E.43154
G1 X168.558 Y68.259
G1 X174.867 Y61.951 E.39685
G1 X174.315 Y61.951
G1 X168.558 Y67.708 E.36216
G1 X168.558 Y67.157
G1 X173.764 Y61.951 E.32748
G1 X173.213 Y61.951
G1 X168.558 Y66.605 E.29279
G1 X168.558 Y66.054
G1 X172.661 Y61.951 E.2581
G1 X172.11 Y61.951
G1 X168.558 Y65.502 E.22341
G1 X168.558 Y64.951
G1 X171.558 Y61.951 E.18872
G1 X171.007 Y61.951
G1 X168.558 Y64.4 E.15404
G1 X168.558 Y63.848
G1 X170.455 Y61.951 E.11935
G1 X169.904 Y61.951
G1 X168.558 Y63.297 E.08466
G1 X168.558 Y62.745
G1 X169.353 Y61.951 E.04997
M204 S10000
; stop printing object, unique label id: 1332
M625
; LAYER_HEIGHT: 0.280000
; FEATURE: Prime tower
; LINE_WIDTH: 0.500000
;--------------------
; CP TOOLCHANGE START
; toolchange #2
; material : PLA -> PLA
;--------------------
M220 S100
; filament end gcode 
M106 P3 S0

; WIPE_START
G1 F24000
G1 X168.558 Y62.745 E-1.06724
G1 X168.558 Y63.297 E-.52385
G1 X168.788 Y63.067 E-.30891
; WIPE_END
G1 E-.1 F1800
M620 S0A
M204 S9000

G17
G2 Z0.88 I0.86 J0.86 P1 F10000 ; spiral lift a little from second lift

G1 Z3.48 F1200

G1 X70 F21000
M73 P84 R2
G1 Y245
G1 Y265 F3000
M400
M106 P1 S0
M106 P2 S0

M104 S220

G1 X90
G1 Y255 F4000
G1 X100 F5000
G1 X120 F15000

G1 X20 Y50 F21000
G1 Y-3

M620.1 E F523 T240
T0
M620.1 E F523 T240


M400

G92 E0







; FLUSH_START
M400
M109 S220
G1 E2 F523 ;Compensate for filament spillage during waiting temperature
; FLUSH_END
M400
G92 E0
G1 E-2 F1800
M106 P1 S255
M400 S3
G1 X80 F15000
G1 X60
G1 X80
G1 X60; shake to put down garbage

G1 X70 F5000
G1 X90 F3000
G1 Y255 F4000
G1 X100 F5000
G1 Y265
G1 X70 F10000
G1 X100 F5000
G1 X70 F10000
G1 X100 F5000
G1 X165 F15000; wipe and shake
G1 Y256 ; move Y to aside, prevent collision
M400
G1 Z3.48 F3000

M204 S10000


M621 S0A
M106 S255
M106 P2 S178
G1 X155.5 Y221.167 F30000
G1 Z3.88
G1 Z.48
G1 E2 F1800

; filament start gcode
M106 P3 S150



G4 S0
G1  X155.000 Y221.167 
G1  Y219.833 
G1  X190.000  E1.7924
G1  Y235.833  E0.8194
G1  X155.000  E1.7924
G1  Y219.833  E0.8194
G1  X155.500 Y221.167  
; CP TOOLCHANGE WIPE
G1  X189.625  E1.7476 F1584
G1  Y222.500  E0.0683
G1  X155.375  E1.7540 F1800
G1  Y223.833  E0.0683
G1  X189.625  E1.7540 F2198
G1  Y225.167  E0.0683
G1  X155.375  E1.7540 F4200
G1  Y226.500  E0.0683
G1  X189.625  E1.7540 F4250
G1  Y227.833  E0.0683
G1  X155.375  E1.7540 F4300
G1  Y229.167  E0.0683
G1  X189.625  E1.7540 F4350
G1  Y230.500  E0.0683
G1  X155.375  E1.7540 F4400
G1  Y231.833  E0.0683
G1  X189.625  E1.7540 F4450
G1  Y233.167  E0.0683
G1  X155.375  E1.7540 F4500
G1  Y234.500  E0.0683
G1  X189.625  E1.7540 F4550
G1 F30000
G4 S0
G92 E0
; CP TOOLCHANGE END
;------------------



; WIPE_START
G1 F24000
G1 X187.625 Y234.5 E-.76
; WIPE_END
G1 E-.04 F1800
; start printing object, unique label id: 1295
M624 AgAAAAAAAAA=
G1 X185.519 Y227.164 Z.88 F30000
G1 X152.485 Y112.098 Z.88
G1 Z.48
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
; LAYER_HEIGHT: 0.28
G1 F12000
G1 X203.265 Y112.098 E2.085
G1 X203.265 Y162.878 E2.085
G1 X152.485 Y162.878 E2.085
G1 X152.485 Y112.158 E2.08254
M204 S10000
; WIPE_START
G1 F24000
G1 X154.485 Y112.155 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X159.74 Y117.691 Z.88 F30000
G1 X202.449 Y162.678 Z.88
G1 Z.48
G1 E.8 F1800
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X203.066 Y162.062 E.03878
G1 X203.066 Y161.51
M73 P85 R2
G1 X201.898 Y162.678 E.07347
G1 X201.346 Y162.678
G1 X203.066 Y160.959 E.10816
G1 X203.066 Y160.407
G1 X200.795 Y162.678 E.14284
G1 X200.243 Y162.678
G1 X203.066 Y159.856 E.17753
G1 X203.066 Y159.305
G1 X199.692 Y162.678 E.21222
G1 X199.141 Y162.678
G1 X203.066 Y158.753 E.24691
G1 X203.066 Y158.202
G1 X198.589 Y162.678 E.2816
G1 X198.038 Y162.678
G1 X203.066 Y157.65 E.31628
G1 X203.066 Y157.099
G1 X197.486 Y162.678 E.35097
G1 X196.935 Y162.678
G1 X203.066 Y156.548 E.38566
G1 X203.066 Y155.996
G1 X196.383 Y162.678 E.42035
G1 X195.832 Y162.678
G1 X203.066 Y155.445 E.45504
G1 X203.066 Y154.893
G1 X195.281 Y162.678 E.48972
G1 X194.729 Y162.678
G1 X203.066 Y154.342 E.52441
G1 X203.066 Y153.79
G1 X194.178 Y162.678 E.5591
G1 X193.626 Y162.678
G1 X203.066 Y153.239 E.59379
G1 X203.066 Y152.688
G1 X193.075 Y162.678 E.62848
G1 X192.524 Y162.678
G1 X203.066 Y152.136 E.66317
G1 X203.066 Y151.585
G1 X191.972 Y162.678 E.69785
G1 X191.421 Y162.678
G1 X203.066 Y151.033 E.73254
G1 X203.066 Y150.482
M73 P86 R2
G1 X190.869 Y162.678 E.76723
G1 X190.318 Y162.678
G1 X203.066 Y149.931 E.80192
G1 X203.066 Y149.379
G1 X189.766 Y162.678 E.83661
G1 X189.215 Y162.678
G1 X203.066 Y148.828 E.87129
G1 X203.066 Y148.276
G1 X188.664 Y162.678 E.90598
G1 X188.112 Y162.678
G1 X203.066 Y147.725 E.94067
G1 X203.066 Y147.173
G1 X187.561 Y162.678 E.97536
G1 X187.009 Y162.678
G1 X203.066 Y146.622 E1.01005
G1 X203.066 Y146.071
G1 X186.458 Y162.678 E1.04473
M73 P86 R1
G1 X185.907 Y162.678
G1 X203.066 Y145.519 E1.07942
G1 X203.066 Y144.968
G1 X185.355 Y162.678 E1.11411
M73 P87 R1
G1 X184.804 Y162.678
G1 X203.066 Y144.416 E1.1488
G1 X203.066 Y143.865
G1 X184.252 Y162.678 E1.18349
G1 X183.701 Y162.678
G1 X203.066 Y143.314 E1.21817
G1 X203.066 Y142.762
G1 X183.149 Y162.678 E1.25286
G1 X182.598 Y162.678
G1 X203.066 Y142.211 E1.28755
G1 X203.066 Y141.659
G1 X182.047 Y162.678 E1.32224
G1 X181.495 Y162.678
G1 X203.066 Y141.108 E1.35693
G1 X203.066 Y140.556
G1 X180.944 Y162.678 E1.39161
G1 X180.392 Y162.678
G1 X203.066 Y140.005 E1.4263
G1 X203.066 Y139.454
G1 X179.841 Y162.678 E1.46099
G1 X179.29 Y162.678
G1 X203.066 Y138.902 E1.49568
G1 X203.066 Y138.351
G1 X178.738 Y162.678 E1.53037
G1 X178.187 Y162.678
G1 X203.066 Y137.799 E1.56505
G1 X203.066 Y137.248
G1 X177.635 Y162.678 E1.59974
G1 X177.084 Y162.678
G1 X203.066 Y136.697 E1.63443
G1 X203.066 Y136.145
G1 X176.532 Y162.678 E1.66912
G1 X175.981 Y162.678
G1 X203.066 Y135.594 E1.70381
G1 X203.066 Y135.042
M73 P88 R1
G1 X175.43 Y162.678 E1.73849
G1 X174.878 Y162.678
G1 X203.066 Y134.491 E1.77318
G1 X203.066 Y133.939
G1 X174.327 Y162.678 E1.80787
G1 X173.775 Y162.678
G1 X203.066 Y133.388 E1.84256
G1 X203.066 Y132.837
G1 X173.224 Y162.678 E1.87725
G1 X172.673 Y162.678
G1 X203.066 Y132.285 E1.91193
G1 X203.066 Y131.734
G1 X172.121 Y162.678 E1.94662
G1 X171.57 Y162.678
G1 X203.066 Y131.182 E1.98131
G1 X203.066 Y130.631
G1 X171.018 Y162.678 E2.016
G1 X170.467 Y162.678
G1 X203.066 Y130.08 E2.05069
G1 X203.066 Y129.528
G1 X169.915 Y162.678 E2.08537
G1 X169.364 Y162.678
G1 X203.066 Y128.977 E2.12006
G1 X203.066 Y128.425
G1 X168.813 Y162.678 E2.15475
G1 X168.261 Y162.678
G1 X203.066 Y127.874 E2.18944
G1 X203.066 Y127.322
G1 X167.71 Y162.678 E2.22413
G1 X167.158 Y162.678
G1 X203.066 Y126.771 E2.25881
G1 X203.066 Y126.22
G1 X166.607 Y162.678 E2.2935
G1 X166.056 Y162.678
G1 X203.066 Y125.668 E2.32819
G1 X203.066 Y125.117
G1 X165.504 Y162.678 E2.36288
G1 X164.953 Y162.678
G1 X203.066 Y124.565 E2.39757
G1 X203.066 Y124.014
G1 X164.401 Y162.678 E2.43225
G1 X163.85 Y162.678
G1 X203.066 Y123.463 E2.46694
G1 X203.066 Y122.911
G1 X163.298 Y162.678 E2.50163
G1 X162.747 Y162.678
G1 X203.066 Y122.36 E2.53632
G1 X203.066 Y121.808
G1 X162.196 Y162.678 E2.57101
G1 X161.644 Y162.678
G1 X203.066 Y121.257 E2.60569
G1 X203.066 Y120.705
G1 X161.093 Y162.678 E2.64038
G1 X160.541 Y162.678
G1 X203.066 Y120.154 E2.67507
G1 X203.066 Y119.603
G1 X159.99 Y162.678 E2.70976
G1 X159.439 Y162.678
G1 X203.066 Y119.051 E2.74445
G1 X203.066 Y118.5
G1 X158.887 Y162.678 E2.77913
G1 X158.336 Y162.678
G1 X203.066 Y117.948 E2.81382
G1 X203.066 Y117.397
G1 X157.784 Y162.678 E2.84851
G1 X157.233 Y162.678
G1 X203.066 Y116.846 E2.8832
G1 X203.066 Y116.294
G1 X156.681 Y162.678 E2.91789
G1 X156.13 Y162.678
G1 X203.066 Y115.743 E2.95257
G1 X203.066 Y115.191
G1 X155.579 Y162.678 E2.98726
G1 X155.027 Y162.678
G1 X203.066 Y114.64 E3.02195
G1 X203.066 Y114.088
G1 X154.476 Y162.678 E3.05664
G1 X153.924 Y162.678
G1 X203.066 Y113.537 E3.09133
G1 X203.066 Y112.986
G1 X153.373 Y162.678 E3.12602
G1 X152.822 Y162.678
G1 X203.066 Y112.434 E3.1607
G1 X202.651 Y112.297
G1 X152.684 Y162.264 E3.14326
G1 X152.684 Y161.712
G1 X202.1 Y112.297 E3.10857
G1 X201.548 Y112.297
G1 X152.684 Y161.161 E3.07388
G1 X152.684 Y160.61
G1 X200.997 Y112.297 E3.0392
G1 X200.446 Y112.297
G1 X152.684 Y160.058 E3.00451
G1 X152.684 Y159.507
G1 X199.894 Y112.297 E2.96982
M73 P89 R1
G1 X199.343 Y112.297
G1 X152.684 Y158.955 E2.93513
G1 X152.684 Y158.404
G1 X198.791 Y112.297 E2.90044
G1 X198.24 Y112.297
G1 X152.684 Y157.853 E2.86575
G1 X152.684 Y157.301
G1 X197.688 Y112.297 E2.83107
G1 X197.137 Y112.297
G1 X152.684 Y156.75 E2.79638
G1 X152.684 Y156.198
G1 X196.586 Y112.297 E2.76169
G1 X196.034 Y112.297
G1 X152.684 Y155.647 E2.727
G1 X152.684 Y155.095
G1 X195.483 Y112.297 E2.69231
G1 X194.931 Y112.297
G1 X152.684 Y154.544 E2.65763
G1 X152.684 Y153.993
G1 X194.38 Y112.297 E2.62294
G1 X193.829 Y112.297
G1 X152.684 Y153.441 E2.58825
G1 X152.684 Y152.89
G1 X193.277 Y112.297 E2.55356
G1 X192.726 Y112.297
G1 X152.684 Y152.338 E2.51887
G1 X152.684 Y151.787
G1 X192.174 Y112.297 E2.48419
G1 X191.623 Y112.297
G1 X152.684 Y151.235 E2.4495
G1 X152.684 Y150.684
G1 X191.071 Y112.297 E2.41481
G1 X190.52 Y112.297
G1 X152.684 Y150.133 E2.38012
G1 X152.684 Y149.581
G1 X189.969 Y112.297 E2.34543
G1 X189.417 Y112.297
G1 X152.684 Y149.03 E2.31075
G1 X152.684 Y148.478
G1 X188.866 Y112.297 E2.27606
G1 X188.314 Y112.297
G1 X152.684 Y147.927 E2.24137
G1 X152.684 Y147.376
G1 X187.763 Y112.297 E2.20668
G1 X187.212 Y112.297
G1 X152.684 Y146.824 E2.17199
G1 X152.684 Y146.273
G1 X186.66 Y112.297 E2.13731
G1 X186.109 Y112.297
G1 X152.684 Y145.721 E2.10262
G1 X152.684 Y145.17
G1 X185.557 Y112.297 E2.06793
M73 P90 R1
G1 X185.006 Y112.297
G1 X152.684 Y144.618 E2.03324
G1 X152.684 Y144.067
G1 X184.454 Y112.297 E1.99855
G1 X183.903 Y112.297
G1 X152.684 Y143.516 E1.96387
G1 X152.684 Y142.964
G1 X183.352 Y112.297 E1.92918
G1 X182.8 Y112.297
G1 X152.684 Y142.413 E1.89449
G1 X152.684 Y141.861
G1 X182.249 Y112.297 E1.8598
G1 X181.697 Y112.297
G1 X152.684 Y141.31 E1.82511
G1 X152.684 Y140.759
G1 X181.146 Y112.297 E1.79043
G1 X180.595 Y112.297
G1 X152.684 Y140.207 E1.75574
G1 X152.684 Y139.656
G1 X180.043 Y112.297 E1.72105
G1 X179.492 Y112.297
G1 X152.684 Y139.104 E1.68636
G1 X152.684 Y138.553
G1 X178.94 Y112.297 E1.65167
G1 X178.389 Y112.297
G1 X152.684 Y138.001 E1.61699
G1 X152.684 Y137.45
G1 X177.837 Y112.297 E1.5823
G1 X177.286 Y112.297
G1 X152.684 Y136.899 E1.54761
G1 X152.684 Y136.347
G1 X176.735 Y112.297 E1.51292
G1 X176.183 Y112.297
G1 X152.684 Y135.796 E1.47823
G1 X152.684 Y135.244
G1 X175.632 Y112.297 E1.44355
G1 X175.08 Y112.297
G1 X152.684 Y134.693 E1.40886
G1 X152.684 Y134.142
G1 X174.529 Y112.297 E1.37417
G1 X173.977 Y112.297
G1 X152.684 Y133.59 E1.33948
M73 P91 R1
G1 X152.684 Y133.039
G1 X173.426 Y112.297 E1.30479
G1 X172.875 Y112.297
G1 X152.684 Y132.487 E1.27011
G1 X152.684 Y131.936
G1 X172.323 Y112.297 E1.23542
G1 X171.772 Y112.297
G1 X152.684 Y131.384 E1.20073
G1 X152.684 Y130.833
G1 X171.22 Y112.297 E1.16604
G1 X170.669 Y112.297
G1 X152.684 Y130.282 E1.13135
G1 X152.684 Y129.73
G1 X170.118 Y112.297 E1.09667
G1 X169.566 Y112.297
G1 X152.684 Y129.179 E1.06198
G1 X152.684 Y128.627
G1 X169.015 Y112.297 E1.02729
G1 X168.463 Y112.297
G1 X152.684 Y128.076 E.9926
G1 X152.684 Y127.525
G1 X167.912 Y112.297 E.95791
G1 X167.36 Y112.297
G1 X152.684 Y126.973 E.92323
G1 X152.684 Y126.422
G1 X166.809 Y112.297 E.88854
G1 X166.258 Y112.297
G1 X152.684 Y125.87 E.85385
G1 X152.684 Y125.319
G1 X165.706 Y112.297 E.81916
G1 X165.155 Y112.297
G1 X152.684 Y124.767 E.78447
G1 X152.684 Y124.216
G1 X164.603 Y112.297 E.74979
G1 X164.052 Y112.297
G1 X152.684 Y123.665 E.7151
G1 X152.684 Y123.113
G1 X163.501 Y112.297 E.68041
G1 X162.949 Y112.297
G1 X152.684 Y122.562 E.64572
M73 P92 R1
G1 X152.684 Y122.01
G1 X162.398 Y112.297 E.61103
G1 X161.846 Y112.297
G1 X152.684 Y121.459 E.57634
G1 X152.684 Y120.908
G1 X161.295 Y112.297 E.54166
G1 X160.743 Y112.297
G1 X152.684 Y120.356 E.50697
G1 X152.684 Y119.805
G1 X160.192 Y112.297 E.47228
G1 X159.641 Y112.297
G1 X152.684 Y119.253 E.43759
G1 X152.684 Y118.702
G1 X159.089 Y112.297 E.4029
G1 X158.538 Y112.297
G1 X152.684 Y118.15 E.36822
G1 X152.684 Y117.599
G1 X157.986 Y112.297 E.33353
G1 X157.435 Y112.297
G1 X152.684 Y117.048 E.29884
G1 X152.684 Y116.496
G1 X156.884 Y112.297 E.26415
G1 X156.332 Y112.297
G1 X152.684 Y115.945 E.22946
G1 X152.684 Y115.393
G1 X155.781 Y112.297 E.19478
G1 X155.229 Y112.297
G1 X152.684 Y114.842 E.16009
G1 X152.684 Y114.291
G1 X154.678 Y112.297 E.1254
G1 X154.126 Y112.297
G1 X152.684 Y113.739 E.09071
G1 X152.684 Y113.188
G1 X153.575 Y112.297 E.05602
M204 S10000
; WIPE_START
G1 F24000
G1 X152.684 Y113.188 E-.47861
G1 X152.684 Y113.739 E-.20954
G1 X152.818 Y113.605 E-.07186
; WIPE_END
G1 E-.04 F1800
G1 X150.664 Y106.283 Z.88 F30000
G1 X146.989 Y93.787 Z.88
G1 Z.48
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X121.809 Y93.787 E1.03388
G1 X121.809 Y68.607 E1.03388
G1 X146.989 Y68.607 E1.03388
G1 X146.989 Y93.727 E1.03142
M204 S10000
G1 X146.789 Y93.166 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X146.368 Y93.587 E.02649
G1 X145.817 Y93.587
G1 X146.789 Y92.615 E.06118
G1 X146.789 Y92.063
M73 P93 R1
G1 X145.266 Y93.587 E.09587
G1 X144.714 Y93.587
G1 X146.789 Y91.512 E.13056
G1 X146.789 Y90.96
G1 X144.163 Y93.587 E.16524
G1 X143.611 Y93.587
G1 X146.789 Y90.409 E.19993
G1 X146.789 Y89.858
G1 X143.06 Y93.587 E.23462
G1 X142.508 Y93.587
G1 X146.789 Y89.306 E.26931
G1 X146.789 Y88.755
G1 X141.957 Y93.587 E.304
G1 X141.406 Y93.587
G1 X146.789 Y88.203 E.33868
G1 X146.789 Y87.652
G1 X140.854 Y93.587 E.37337
G1 X140.303 Y93.587
G1 X146.789 Y87.1 E.40806
G1 X146.789 Y86.549
G1 X139.751 Y93.587 E.44275
G1 X139.2 Y93.587
G1 X146.789 Y85.998 E.47744
G1 X146.789 Y85.446
G1 X138.649 Y93.587 E.51212
G1 X138.097 Y93.587
G1 X146.789 Y84.895 E.54681
M73 P93 R0
G1 X146.789 Y84.343
G1 X137.546 Y93.587 E.5815
G1 X136.994 Y93.587
G1 X146.789 Y83.792 E.61619
G1 X146.789 Y83.241
G1 X136.443 Y93.587 E.65088
G1 X135.891 Y93.587
G1 X146.789 Y82.689 E.68556
G1 X146.789 Y82.138
G1 X135.34 Y93.587 E.72025
G1 X134.789 Y93.587
G1 X146.789 Y81.586 E.75494
G1 X146.789 Y81.035
G1 X134.237 Y93.587 E.78963
G1 X133.686 Y93.587
G1 X146.789 Y80.483 E.82432
G1 X146.789 Y79.932
G1 X133.134 Y93.587 E.859
G1 X132.583 Y93.587
G1 X146.789 Y79.381 E.89369
G1 X146.789 Y78.829
G1 X132.031 Y93.587 E.92838
G1 X131.48 Y93.587
G1 X146.789 Y78.278 E.96307
G1 X146.789 Y77.726
G1 X130.929 Y93.587 E.99776
G1 X130.377 Y93.587
G1 X146.789 Y77.175 E1.03245
G1 X146.789 Y76.624
G1 X129.826 Y93.587 E1.06713
G1 X129.274 Y93.587
G1 X146.789 Y76.072 E1.10182
G1 X146.789 Y75.521
G1 X128.723 Y93.587 E1.13651
G1 X128.172 Y93.587
G1 X146.789 Y74.969 E1.1712
G1 X146.789 Y74.418
G1 X127.62 Y93.587 E1.20589
G1 X127.069 Y93.587
G1 X146.789 Y73.866 E1.24057
G1 X146.789 Y73.315
G1 X126.517 Y93.587 E1.27526
G1 X125.966 Y93.587
G1 X146.789 Y72.764 E1.30995
G1 X146.789 Y72.212
G1 X125.414 Y93.587 E1.34464
G1 X124.863 Y93.587
G1 X146.789 Y71.661 E1.37933
G1 X146.789 Y71.109
G1 X124.312 Y93.587 E1.41401
G1 X123.76 Y93.587
G1 X146.789 Y70.558 E1.4487
G1 X146.789 Y70.007
G1 X123.209 Y93.587 E1.48339
G1 X122.657 Y93.587
G1 X146.789 Y69.455 E1.51808
G1 X146.789 Y68.904
G1 X122.106 Y93.587 E1.55277
G1 X122.008 Y93.133
G1 X146.336 Y68.806 E1.53036
G1 X145.784 Y68.806
G1 X122.008 Y92.582 E1.49567
G1 X122.008 Y92.031
G1 X145.233 Y68.806 E1.46098
G1 X144.681 Y68.806
G1 X122.008 Y91.479 E1.42629
G1 X122.008 Y90.928
G1 X144.13 Y68.806 E1.39161
G1 X143.579 Y68.806
G1 X122.008 Y90.376 E1.35692
M73 P94 R0
G1 X122.008 Y89.825
G1 X143.027 Y68.806 E1.32223
G1 X142.476 Y68.806
G1 X122.008 Y89.273 E1.28754
G1 X122.008 Y88.722
G1 X141.924 Y68.806 E1.25285
G1 X141.373 Y68.806
G1 X122.008 Y88.171 E1.21816
G1 X122.008 Y87.619
G1 X140.821 Y68.806 E1.18348
G1 X140.27 Y68.806
G1 X122.008 Y87.068 E1.14879
G1 X122.008 Y86.516
G1 X139.719 Y68.806 E1.1141
G1 X139.167 Y68.806
G1 X122.008 Y85.965 E1.07941
G1 X122.008 Y85.414
G1 X138.616 Y68.806 E1.04472
G1 X138.064 Y68.806
G1 X122.008 Y84.862 E1.01004
G1 X122.008 Y84.311
G1 X137.513 Y68.806 E.97535
G1 X136.962 Y68.806
G1 X122.008 Y83.759 E.94066
G1 X122.008 Y83.208
G1 X136.41 Y68.806 E.90597
G1 X135.859 Y68.806
G1 X122.008 Y82.656 E.87128
G1 X122.008 Y82.105
G1 X135.307 Y68.806 E.8366
G1 X134.756 Y68.806
G1 X122.008 Y81.554 E.80191
G1 X122.008 Y81.002
G1 X134.204 Y68.806 E.76722
G1 X133.653 Y68.806
G1 X122.008 Y80.451 E.73253
G1 X122.008 Y79.899
G1 X133.102 Y68.806 E.69784
G1 X132.55 Y68.806
G1 X122.008 Y79.348 E.66316
G1 X122.008 Y78.797
G1 X131.999 Y68.806 E.62847
G1 X131.447 Y68.806
G1 X122.008 Y78.245 E.59378
G1 X122.008 Y77.694
G1 X130.896 Y68.806 E.55909
G1 X130.345 Y68.806
G1 X122.008 Y77.142 E.5244
G1 X122.008 Y76.591
G1 X129.793 Y68.806 E.48972
G1 X129.242 Y68.806
G1 X122.008 Y76.039 E.45503
G1 X122.008 Y75.488
G1 X128.69 Y68.806 E.42034
G1 X128.139 Y68.806
G1 X122.008 Y74.937 E.38565
G1 X122.008 Y74.385
G1 X127.587 Y68.806 E.35096
G1 X127.036 Y68.806
G1 X122.008 Y73.834 E.31628
G1 X122.008 Y73.282
G1 X126.485 Y68.806 E.28159
G1 X125.933 Y68.806
G1 X122.008 Y72.731 E.2469
G1 X122.008 Y72.18
G1 X125.382 Y68.806 E.21221
G1 X124.83 Y68.806
G1 X122.008 Y71.628 E.17752
G1 X122.008 Y71.077
G1 X124.279 Y68.806 E.14284
G1 X123.728 Y68.806
G1 X122.008 Y70.525 E.10815
G1 X122.008 Y69.974
G1 X123.176 Y68.806 E.07346
G1 X122.625 Y68.806
G1 X122.008 Y69.422 E.03877
M204 S10000
; PURGING FINISHED
; WIPE_START
G1 F24000
G1 X122.625 Y68.806 E-.33122
G1 X123.176 Y68.806 E-.20954
G1 X122.768 Y69.214 E-.21924
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1295
M625
; start printing object, unique label id: 1207
M624 AQAAAAAAAAA=
G1 X123.913 Y76.76 Z.88 F30000
G1 X134.445 Y146.171 Z.88
G1 Z.48
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X109.265 Y146.171 E1.03388
G1 X109.265 Y120.991 E1.03388
G1 X134.445 Y120.991 E1.03388
G1 X134.445 Y146.111 E1.03142
M204 S10000
G1 X134.245 Y145.177 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X133.451 Y145.972 E.04998
G1 X132.899 Y145.972
M73 P95 R0
G1 X134.245 Y144.626 E.08467
G1 X134.245 Y144.075
G1 X132.348 Y145.972 E.11936
G1 X131.797 Y145.972
G1 X134.245 Y143.523 E.15404
G1 X134.245 Y142.972
G1 X131.245 Y145.972 E.18873
G1 X130.694 Y145.972
G1 X134.245 Y142.42 E.22342
G1 X134.245 Y141.869
G1 X130.142 Y145.972 E.25811
G1 X129.591 Y145.972
G1 X134.245 Y141.318 E.2928
G1 X134.245 Y140.766
G1 X129.039 Y145.972 E.32748
G1 X128.488 Y145.972
G1 X134.245 Y140.215 E.36217
G1 X134.245 Y139.663
G1 X127.937 Y145.972 E.39686
G1 X127.385 Y145.972
G1 X134.245 Y139.112 E.43155
G1 X134.245 Y138.56
G1 X126.834 Y145.972 E.46624
G1 X126.282 Y145.972
G1 X134.245 Y138.009 E.50092
G1 X134.245 Y137.458
G1 X125.731 Y145.972 E.53561
G1 X125.179 Y145.972
G1 X134.245 Y136.906 E.5703
G1 X134.245 Y136.355
G1 X124.628 Y145.972 E.60499
G1 X124.077 Y145.972
G1 X134.245 Y135.803 E.63968
G1 X134.245 Y135.252
G1 X123.525 Y145.972 E.67437
G1 X122.974 Y145.972
G1 X134.245 Y134.701 E.70905
G1 X134.245 Y134.149
G1 X122.422 Y145.972 E.74374
G1 X121.871 Y145.972
G1 X134.245 Y133.598 E.77843
G1 X134.245 Y133.046
G1 X121.32 Y145.972 E.81312
G1 X120.768 Y145.972
G1 X134.245 Y132.495 E.84781
G1 X134.245 Y131.943
G1 X120.217 Y145.972 E.88249
G1 X119.665 Y145.972
G1 X134.245 Y131.392 E.91718
G1 X134.245 Y130.841
G1 X119.114 Y145.972 E.95187
G1 X118.562 Y145.972
G1 X134.245 Y130.289 E.98656
G1 X134.245 Y129.738
G1 X118.011 Y145.972 E1.02125
G1 X117.46 Y145.972
G1 X134.245 Y129.186 E1.05593
G1 X134.245 Y128.635
G1 X116.908 Y145.972 E1.09062
G1 X116.357 Y145.972
G1 X134.245 Y128.084 E1.12531
G1 X134.245 Y127.532
G1 X115.805 Y145.972 E1.16
G1 X115.254 Y145.972
G1 X134.245 Y126.981 E1.19469
G1 X134.245 Y126.429
G1 X114.703 Y145.972 E1.22937
G1 X114.151 Y145.972
G1 X134.245 Y125.878 E1.26406
G1 X134.245 Y125.326
G1 X113.6 Y145.972 E1.29875
G1 X113.048 Y145.972
G1 X134.245 Y124.775 E1.33344
G1 X134.245 Y124.224
G1 X112.497 Y145.972 E1.36813
G1 X111.945 Y145.972
G1 X134.245 Y123.672 E1.40281
G1 X134.245 Y123.121
G1 X111.394 Y145.972 E1.4375
G1 X110.843 Y145.972
G1 X134.245 Y122.569 E1.47219
G1 X134.245 Y122.018
G1 X110.291 Y145.972 E1.50688
G1 X109.74 Y145.972
G1 X134.245 Y121.467 E1.54157
G1 X133.969 Y121.191
G1 X109.464 Y145.696 E1.54156
G1 X109.464 Y145.145
G1 X133.418 Y121.191 E1.50687
G1 X132.867 Y121.191
G1 X109.464 Y144.593 E1.47218
G1 X109.464 Y144.042
G1 X132.315 Y121.191 E1.43749
G1 X131.764 Y121.191
G1 X109.464 Y143.491 E1.4028
G1 X109.464 Y142.939
G1 X131.212 Y121.191 E1.36812
G1 X130.661 Y121.191
M73 P96 R0
G1 X109.464 Y142.388 E1.33343
G1 X109.464 Y141.836
G1 X130.11 Y121.191 E1.29874
G1 X129.558 Y121.191
G1 X109.464 Y141.285 E1.26405
G1 X109.464 Y140.733
G1 X129.007 Y121.191 E1.22936
G1 X128.455 Y121.191
G1 X109.464 Y140.182 E1.19468
G1 X109.464 Y139.631
G1 X127.904 Y121.191 E1.15999
G1 X127.352 Y121.191
G1 X109.464 Y139.079 E1.1253
G1 X109.464 Y138.528
G1 X126.801 Y121.191 E1.09061
G1 X126.25 Y121.191
G1 X109.464 Y137.976 E1.05592
G1 X109.464 Y137.425
G1 X125.698 Y121.191 E1.02124
G1 X125.147 Y121.191
G1 X109.464 Y136.874 E.98655
G1 X109.464 Y136.322
G1 X124.595 Y121.191 E.95186
G1 X124.044 Y121.191
G1 X109.464 Y135.771 E.91717
G1 X109.464 Y135.219
G1 X123.493 Y121.191 E.88248
G1 X122.941 Y121.191
G1 X109.464 Y134.668 E.8478
G1 X109.464 Y134.116
G1 X122.39 Y121.191 E.81311
G1 X121.838 Y121.191
G1 X109.464 Y133.565 E.77842
G1 X109.464 Y133.014
G1 X121.287 Y121.191 E.74373
G1 X120.735 Y121.191
G1 X109.464 Y132.462 E.70904
G1 X109.464 Y131.911
G1 X120.184 Y121.191 E.67436
G1 X119.633 Y121.191
G1 X109.464 Y131.359 E.63967
G1 X109.464 Y130.808
G1 X119.081 Y121.191 E.60498
G1 X118.53 Y121.191
G1 X109.464 Y130.257 E.57029
G1 X109.464 Y129.705
G1 X117.978 Y121.191 E.5356
G1 X117.427 Y121.191
G1 X109.464 Y129.154 E.50092
G1 X109.464 Y128.602
G1 X116.876 Y121.191 E.46623
G1 X116.324 Y121.191
G1 X109.464 Y128.051 E.43154
G1 X109.464 Y127.499
G1 X115.773 Y121.191 E.39685
G1 X115.221 Y121.191
G1 X109.464 Y126.948 E.36216
G1 X109.464 Y126.397
G1 X114.67 Y121.191 E.32748
G1 X114.118 Y121.191
G1 X109.464 Y125.845 E.29279
G1 X109.464 Y125.294
G1 X113.567 Y121.191 E.2581
G1 X113.016 Y121.191
G1 X109.464 Y124.742 E.22341
G1 X109.464 Y124.191
G1 X112.464 Y121.191 E.18872
G1 X111.913 Y121.191
G1 X109.464 Y123.64 E.15404
M73 P97 R0
G1 X109.464 Y123.088
G1 X111.361 Y121.191 E.11935
G1 X110.81 Y121.191
G1 X109.464 Y122.537 E.08466
G1 X109.464 Y121.985
G1 X110.259 Y121.191 E.04997
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X109.464 Y121.985 E-.4269
G1 X109.464 Y122.537 E-.20954
G1 X109.694 Y122.307 E-.12356
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 1207
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
G1 Z0.98 F900 ; lower z a little
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

    G1 Z100.48 F600
    G1 Z98.48

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

