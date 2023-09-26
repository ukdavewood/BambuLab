; HEADER_BLOCK_START
; BambuStudio 01.07.04.52
; model printing time: 8m 57s; total estimated time: 15m 43s
; total layer number: 92
; model label id: 58
; HEADER_BLOCK_END

; CONFIG_BLOCK_START
; accel_to_decel_enable = 0
; accel_to_decel_factor = 50%
; additional_cooling_fan_speed = 70,70,70,70,70,70,70,70,70,70
; auxiliary_fan = 1
; bed_custom_model = 
; bed_custom_texture = 
; bed_exclude_area = 0x0,18x0,18x28,0x28
; bed_temperature_difference = 10,10,10,10,10,10,10,10,10,10
; before_layer_change_gcode = 
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
; elefant_foot_compensation = 0.15
; enable_arc_fitting = 1
; enable_overhang_bridge_fan = 1,1,1,1,1,1,1,1,1,1
; enable_overhang_speed = 1
; enable_pressure_advance = 0,0,0,0,0,0,0,0,0,0
; enable_prime_tower = 0
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
; filament_start_gcode = "; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}";"; filament start gcode\n{if  (bed_temperature[current_extruder] >55)||(bed_temperature_initial_layer[current_extruder] >55)}M106 P3 S200\n{elsif(bed_temperature[current_extruder] >50)||(bed_temperature_initial_layer[current_extruder] >50)}M106 P3 S150\n{elsif(bed_temperature[current_extruder] >45)||(bed_temperature_initial_layer[current_extruder] >45)}M106 P3 S50\n{endif}"
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
; support_angle = 0
; support_base_pattern = default
; support_base_pattern_spacing = 2.5
; support_bottom_interface_spacing = 0.5
; support_bottom_z_distance = 0.2
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
; upward_compatible_machine = "Bambu Lab P1P 0.4 nozzle";"Bambu Lab P1S 0.4 nozzle";"Bambu Lab X1 0.4 nozzle"
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
M73 P27 R11
G1 X60 F12000
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
M73 P28 R11
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
M73 P29 R11
G1 E-0.5 F300

M73 P31 R10
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
M73 P32 R10
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
    G29 A X117.2 Y117.2 I25.6 J25.6
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

M73 P33 R10
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
    G1 X65.000 E1.24726 F1508.32
    G1 X70.000 E0.31181 F1508.32
    G1 X75.000 E0.31181 F6033.27
    G1 X80.000 E0.31181 F1508.32
    G1 X85.000 E0.31181 F6033.27
M73 P34 R10
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
M73 P35 R10
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
M73 P36 R10
    G1 X105.000 E0.31181 F6033.27
    G1 X110.000 E0.31181 F1508.32
    G1 X115.000 E0.31181 F6033.27
    G1 X120.000 E0.31181 F1508.32
    G1 X125.000 E0.31181 F6033.27
    G1 X130.000 E0.31181 F1508.32
M73 P36 R9
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
M73 P37 R9
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
M73 P38 R9
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
; layer num/total_layer_count: 1/92
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
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X141.943 Y139.943 F30000
G1 Z.4
G1 Z.2
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.5
G1 F3000
G1 X118.057 Y139.943 E.88966
G1 X118.057 Y116.057 E.88966
G1 X141.943 Y116.057 E.88966
G1 X141.943 Y139.883 E.88742
G1 X142.4 Y140.4 F30000
; FEATURE: Outer wall
G1 F3000
G1 X117.6 Y140.4 E.92371
G1 X117.6 Y115.6 E.92371
G1 X142.4 Y115.6 E.92371
G1 X142.4 Y140.34 E.92147
; WIPE_START
G1 F24000
G1 X140.4 Y140.345 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.534 Y132.714 Z.6 F30000
G1 X140.824 Y116.24 Z.6
G1 Z.2
G1 E.8 F1800
; FEATURE: Bottom surface
; LINE_WIDTH: 0.505798
G1 F6300
G1 X141.554 Y116.97 E.03897
G1 X141.554 Y117.625 E.02469
G1 X140.375 Y116.446 E.06292
G1 X139.72 Y116.446 E.02469
G1 X141.554 Y118.28 E.09784
G1 X141.554 Y118.934 E.02469
G1 X139.066 Y116.446 E.13275
G1 X138.411 Y116.446 E.02469
G1 X141.554 Y119.589 E.16767
G1 X141.554 Y120.244 E.02469
G1 X137.756 Y116.446 E.20259
G1 X137.102 Y116.446 E.02469
M73 P39 R9
G1 X141.554 Y120.898 E.23751
G1 X141.554 Y121.553 E.02469
G1 X136.447 Y116.446 E.27243
G1 X135.793 Y116.446 E.02469
G1 X141.554 Y122.207 E.30735
G1 X141.554 Y122.862 E.02469
G1 X135.138 Y116.446 E.34226
G1 X134.483 Y116.446 E.02469
G1 X141.554 Y123.517 E.37718
G1 X141.554 Y124.171 E.02469
G1 X133.829 Y116.446 E.4121
G1 X133.174 Y116.446 E.02469
G1 X141.554 Y124.826 E.44702
G1 X141.554 Y125.48 E.02469
G1 X132.52 Y116.446 E.48194
G1 X131.865 Y116.446 E.02469
G1 X141.554 Y126.135 E.51686
G1 X141.554 Y126.79 E.02469
G1 X131.21 Y116.446 E.55177
G1 X130.556 Y116.446 E.02469
M73 P41 R9
G1 X141.554 Y127.444 E.58669
G1 X141.554 Y128.099 E.02469
G1 X129.901 Y116.446 E.62161
G1 X129.247 Y116.446 E.02469
G1 X141.554 Y128.753 E.65653
G1 X141.554 Y129.408 E.02469
G1 X128.592 Y116.446 E.69145
G1 X127.937 Y116.446 E.02469
G1 X141.554 Y130.063 E.72637
G1 X141.554 Y130.717 E.02469
G1 X127.283 Y116.446 E.76128
G1 X126.628 Y116.446 E.02469
G1 X141.554 Y131.372 E.7962
G1 X141.554 Y132.026 E.02469
G1 X125.974 Y116.446 E.83112
G1 X125.319 Y116.446 E.02469
G1 X141.554 Y132.681 E.86604
G1 X141.554 Y133.336 E.02469
G1 X124.664 Y116.446 E.90096
G1 X124.01 Y116.446 E.02469
G1 X141.554 Y133.99 E.93588
G1 X141.554 Y134.645 E.02469
G1 X123.355 Y116.446 E.97079
G1 X122.7 Y116.446 E.02469
G1 X141.554 Y135.3 E1.00571
G1 X141.554 Y135.954 E.02469
G1 X122.046 Y116.446 E1.04063
G1 X121.391 Y116.446 E.02469
G1 X141.554 Y136.609 E1.07555
M73 P42 R9
G1 X141.554 Y137.263 E.02469
G1 X120.737 Y116.446 E1.11047
G1 X120.082 Y116.446 E.02469
G1 X141.554 Y137.918 E1.14539
G1 X141.554 Y138.573 E.02469
G1 X119.427 Y116.446 E1.1803
G1 X118.773 Y116.446 E.02469
G1 X141.554 Y139.227 E1.21522
G1 X141.554 Y139.554 E.01234
G1 X141.227 Y139.554 E.01235
G1 X118.446 Y116.773 E1.21522
G1 X118.446 Y117.428 E.02469
G1 X140.572 Y139.554 E1.1803
G1 X139.918 Y139.554 E.02469
G1 X118.446 Y118.082 E1.14538
G1 X118.446 Y118.737 E.02469
G1 X139.263 Y139.554 E1.11046
G1 X138.609 Y139.554 E.02469
G1 X118.446 Y119.391 E1.07554
M73 P42 R8
G1 X118.446 Y120.046 E.02469
G1 X137.954 Y139.554 E1.04062
G1 X137.299 Y139.554 E.02469
G1 X118.446 Y120.701 E1.00571
G1 X118.446 Y121.355 E.02469
G1 X136.645 Y139.554 E.97079
G1 X135.99 Y139.554 E.02469
M73 P43 R8
G1 X118.446 Y122.01 E.93587
G1 X118.446 Y122.664 E.02469
G1 X135.336 Y139.554 E.90095
G1 X134.681 Y139.554 E.02469
G1 X118.446 Y123.319 E.86603
G1 X118.446 Y123.974 E.02469
G1 X134.026 Y139.554 E.83111
G1 X133.372 Y139.554 E.02469
G1 X118.446 Y124.628 E.7962
G1 X118.446 Y125.283 E.02469
G1 X132.717 Y139.554 E.76128
G1 X132.063 Y139.554 E.02469
G1 X118.446 Y125.937 E.72636
G1 X118.446 Y126.592 E.02469
G1 X131.408 Y139.554 E.69144
G1 X130.753 Y139.554 E.02469
G1 X118.446 Y127.247 E.65652
G1 X118.446 Y127.901 E.02469
G1 X130.099 Y139.554 E.6216
G1 X129.444 Y139.554 E.02469
G1 X118.446 Y128.556 E.58669
G1 X118.446 Y129.211 E.02469
G1 X128.789 Y139.554 E.55177
G1 X128.135 Y139.554 E.02469
G1 X118.446 Y129.865 E.51685
G1 X118.446 Y130.52 E.02469
G1 X127.48 Y139.554 E.48193
G1 X126.826 Y139.554 E.02469
G1 X118.446 Y131.174 E.44701
G1 X118.446 Y131.829 E.02469
G1 X126.171 Y139.554 E.41209
G1 X125.516 Y139.554 E.02469
G1 X118.446 Y132.484 E.37718
G1 X118.446 Y133.138 E.02469
G1 X124.862 Y139.554 E.34226
G1 X124.207 Y139.554 E.02469
G1 X118.446 Y133.793 E.30734
G1 X118.446 Y134.447 E.02469
G1 X123.553 Y139.554 E.27242
G1 X122.898 Y139.554 E.02469
G1 X118.446 Y135.102 E.2375
G1 X118.446 Y135.757 E.02469
G1 X122.243 Y139.554 E.20258
G1 X121.589 Y139.554 E.02469
G1 X118.446 Y136.411 E.16767
G1 X118.446 Y137.066 E.02469
G1 X120.934 Y139.554 E.13275
G1 X120.28 Y139.554 E.02469
G1 X118.446 Y137.72 E.09783
G1 X118.446 Y138.375 E.02469
G1 X119.625 Y139.554 E.06291
G1 X118.97 Y139.554 E.02469
M73 P44 R8
G1 X118.24 Y138.824 E.03896
; CHANGE_LAYER
; Z_HEIGHT: 0.48
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X118.97 Y139.554 E-.39255
G1 X119.625 Y139.554 E-.24875
G1 X119.404 Y139.334 E-.11869
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 2/92
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
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G1 X127.031 Y139.628 Z.6 F30000
G1 X142.215 Y140.215 Z.6
G1 Z.48
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.323 Y140.058 Z.88 F30000
G1 Z.48
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423462
G1 F12000
G1 X141.896 Y139.485 E.03359
G1 X141.896 Y138.972 E.0213
G1 X140.972 Y139.896 E.05422
G1 X140.458 Y139.896 E.0213
G1 X141.896 Y138.458 E.08435
G1 X141.896 Y137.944 E.0213
G1 X139.944 Y139.896 E.11448
G1 X139.43 Y139.896 E.0213
G1 X141.896 Y137.43 E.1446
G1 X141.896 Y136.916 E.0213
G1 X138.916 Y139.896 E.17473
G1 X138.402 Y139.896 E.0213
G1 X141.896 Y136.402 E.20486
M73 P45 R8
G1 X141.896 Y135.888 E.0213
G1 X137.888 Y139.896 E.23498
G1 X137.374 Y139.896 E.0213
G1 X141.896 Y135.374 E.26511
G1 X141.896 Y134.86 E.0213
G1 X136.86 Y139.896 E.29524
G1 X136.347 Y139.896 E.0213
G1 X141.896 Y134.347 E.32536
G1 X141.896 Y133.833 E.0213
G1 X135.833 Y139.896 E.35549
G1 X135.319 Y139.896 E.0213
G1 X141.896 Y133.319 E.38562
G1 X141.896 Y132.805 E.0213
G1 X134.805 Y139.896 E.41574
G1 X134.291 Y139.896 E.0213
G1 X141.896 Y132.291 E.44587
G1 X141.896 Y131.777 E.0213
G1 X133.777 Y139.896 E.476
G1 X133.263 Y139.896 E.0213
G1 X141.896 Y131.263 E.50612
G1 X141.896 Y130.749 E.0213
G1 X132.749 Y139.896 E.53625
G1 X132.235 Y139.896 E.0213
G1 X141.896 Y130.235 E.56638
G1 X141.896 Y129.722 E.0213
G1 X131.722 Y139.896 E.5965
G1 X131.208 Y139.896 E.0213
G1 X141.896 Y129.208 E.62663
G1 X141.896 Y128.694 E.0213
G1 X130.694 Y139.896 E.65676
G1 X130.18 Y139.896 E.0213
G1 X141.896 Y128.18 E.68688
G1 X141.896 Y127.666 E.0213
G1 X129.666 Y139.896 E.71701
G1 X129.152 Y139.896 E.0213
G1 X141.896 Y127.152 E.74714
G1 X141.896 Y126.638 E.0213
G1 X128.638 Y139.896 E.77727
G1 X128.124 Y139.896 E.0213
G1 X141.896 Y126.124 E.80739
G1 X141.896 Y125.61 E.0213
G1 X127.61 Y139.896 E.83752
G1 X127.097 Y139.896 E.0213
G1 X141.896 Y125.097 E.86765
G1 X141.896 Y124.583 E.0213
G1 X126.583 Y139.896 E.89777
G1 X126.069 Y139.896 E.0213
G1 X141.896 Y124.069 E.9279
G1 X141.896 Y123.555 E.0213
G1 X125.555 Y139.896 E.95803
M73 P46 R8
G1 X125.041 Y139.896 E.0213
G1 X141.896 Y123.041 E.98815
G1 X141.896 Y122.527 E.0213
G1 X124.527 Y139.896 E1.01828
G1 X124.013 Y139.896 E.0213
G1 X141.896 Y122.013 E1.04841
G1 X141.896 Y121.499 E.0213
G1 X123.499 Y139.896 E1.07853
G1 X122.985 Y139.896 E.0213
G1 X141.896 Y120.985 E1.10866
G1 X141.896 Y120.472 E.0213
G1 X122.472 Y139.896 E1.13879
G1 X121.958 Y139.896 E.0213
G1 X141.896 Y119.958 E1.16891
G1 X141.896 Y119.444 E.0213
G1 X121.444 Y139.896 E1.19904
G1 X120.93 Y139.896 E.0213
G1 X141.896 Y118.93 E1.22917
G1 X141.896 Y118.416 E.0213
G1 X120.416 Y139.896 E1.25929
G1 X119.902 Y139.896 E.0213
G1 X141.896 Y117.902 E1.28942
G1 X141.896 Y117.388 E.0213
G1 X119.388 Y139.896 E1.31955
G1 X118.874 Y139.896 E.0213
G1 X141.896 Y116.874 E1.34968
G1 X141.896 Y116.361 E.0213
G1 X118.361 Y139.896 E1.3798
G1 X118.104 Y139.896 E.01065
G1 X118.104 Y139.639 E.01065
G1 X141.639 Y116.104 E1.3798
G1 X141.126 Y116.104 E.0213
G1 X118.104 Y139.126 E1.34967
G1 X118.104 Y138.612 E.0213
G1 X140.612 Y116.104 E1.31955
G1 X140.098 Y116.104 E.0213
G1 X118.104 Y138.098 E1.28942
G1 X118.104 Y137.584 E.0213
G1 X139.584 Y116.104 E1.25929
G1 X139.07 Y116.104 E.0213
G1 X118.104 Y137.07 E1.22917
G1 X118.104 Y136.556 E.0213
G1 X138.556 Y116.104 E1.19904
G1 X138.042 Y116.104 E.0213
G1 X118.104 Y136.042 E1.16891
G1 X118.104 Y135.528 E.0213
G1 X137.528 Y116.104 E1.13879
G1 X137.014 Y116.104 E.0213
G1 X118.104 Y135.014 E1.10866
G1 X118.104 Y134.501 E.0213
G1 X136.501 Y116.104 E1.07853
G1 X135.987 Y116.104 E.0213
G1 X118.104 Y133.987 E1.0484
G1 X118.104 Y133.473 E.0213
G1 X135.473 Y116.104 E1.01828
G1 X134.959 Y116.104 E.0213
G1 X118.104 Y132.959 E.98815
G1 X118.104 Y132.445 E.0213
G1 X134.445 Y116.104 E.95802
G1 X133.931 Y116.104 E.0213
G1 X118.104 Y131.931 E.9279
G1 X118.104 Y131.417 E.0213
G1 X133.417 Y116.104 E.89777
G1 X132.903 Y116.104 E.0213
G1 X118.104 Y130.903 E.86764
G1 X118.104 Y130.389 E.0213
G1 X132.389 Y116.104 E.83752
G1 X131.876 Y116.104 E.0213
G1 X118.104 Y129.876 E.80739
G1 X118.104 Y129.362 E.0213
G1 X131.362 Y116.104 E.77726
G1 X130.848 Y116.104 E.0213
G1 X118.104 Y128.848 E.74714
G1 X118.104 Y128.334 E.0213
G1 X130.334 Y116.104 E.71701
G1 X129.82 Y116.104 E.0213
G1 X118.104 Y127.82 E.68688
G1 X118.104 Y127.306 E.0213
G1 X129.306 Y116.104 E.65676
G1 X128.792 Y116.104 E.0213
G1 X118.104 Y126.792 E.62663
G1 X118.104 Y126.278 E.0213
G1 X128.278 Y116.104 E.5965
G1 X127.765 Y116.104 E.0213
G1 X118.104 Y125.765 E.56638
G1 X118.104 Y125.251 E.0213
G1 X127.251 Y116.104 E.53625
G1 X126.737 Y116.104 E.0213
G1 X118.104 Y124.737 E.50612
G1 X118.104 Y124.223 E.0213
G1 X126.223 Y116.104 E.47599
G1 X125.709 Y116.104 E.0213
G1 X118.104 Y123.709 E.44587
G1 X118.104 Y123.195 E.0213
G1 X125.195 Y116.104 E.41574
G1 X124.681 Y116.104 E.0213
G1 X118.104 Y122.681 E.38561
G1 X118.104 Y122.167 E.0213
G1 X124.167 Y116.104 E.35549
G1 X123.653 Y116.104 E.0213
G1 X118.104 Y121.653 E.32536
G1 X118.104 Y121.14 E.0213
G1 X123.14 Y116.104 E.29523
G1 X122.626 Y116.104 E.0213
G1 X118.104 Y120.626 E.26511
G1 X118.104 Y120.112 E.0213
G1 X122.112 Y116.104 E.23498
G1 X121.598 Y116.104 E.0213
G1 X118.104 Y119.598 E.20485
G1 X118.104 Y119.084 E.0213
G1 X121.084 Y116.104 E.17473
G1 X120.57 Y116.104 E.0213
G1 X118.104 Y118.57 E.1446
G1 X118.104 Y118.056 E.0213
G1 X120.056 Y116.104 E.11447
G1 X119.542 Y116.104 E.0213
G1 X118.104 Y117.542 E.08435
G1 X118.104 Y117.028 E.0213
G1 X119.028 Y116.104 E.05422
G1 X118.515 Y116.104 E.0213
G1 X117.942 Y116.677 E.03359
; CHANGE_LAYER
; Z_HEIGHT: 0.76
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X118.515 Y116.104 E-.30789
G1 X119.028 Y116.104 E-.19528
G1 X118.551 Y116.582 E-.25684
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 3/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L3
M991 S0 P2 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z.88 I-.86 J.861 P1  F30000
G1 X142.215 Y140.215 Z.88
G1 Z.76
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.059 Y132.917 Z1.16 F30000
G1 X142.058 Y116.677 Z1.16
G1 Z.76
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423462
G1 F12000
M73 P47 R8
G1 X141.485 Y116.104 E.03359
G1 X140.972 Y116.104 E.0213
G1 X141.896 Y117.028 E.05422
G1 X141.896 Y117.542 E.0213
G1 X140.458 Y116.104 E.08435
G1 X139.944 Y116.104 E.0213
G1 X141.896 Y118.056 E.11448
G1 X141.896 Y118.57 E.0213
G1 X139.43 Y116.104 E.1446
G1 X138.916 Y116.104 E.0213
G1 X141.896 Y119.084 E.17473
G1 X141.896 Y119.598 E.0213
G1 X138.402 Y116.104 E.20486
G1 X137.888 Y116.104 E.0213
G1 X141.896 Y120.112 E.23498
G1 X141.896 Y120.626 E.0213
G1 X137.374 Y116.104 E.26511
G1 X136.86 Y116.104 E.0213
G1 X141.896 Y121.14 E.29524
G1 X141.896 Y121.653 E.0213
G1 X136.347 Y116.104 E.32536
G1 X135.833 Y116.104 E.0213
G1 X141.896 Y122.167 E.35549
G1 X141.896 Y122.681 E.0213
G1 X135.319 Y116.104 E.38562
G1 X134.805 Y116.104 E.0213
G1 X141.896 Y123.195 E.41574
G1 X141.896 Y123.709 E.0213
G1 X134.291 Y116.104 E.44587
G1 X133.777 Y116.104 E.0213
G1 X141.896 Y124.223 E.476
G1 X141.896 Y124.737 E.0213
G1 X133.263 Y116.104 E.50612
G1 X132.749 Y116.104 E.0213
G1 X141.896 Y125.251 E.53625
G1 X141.896 Y125.765 E.0213
G1 X132.235 Y116.104 E.56638
G1 X131.722 Y116.104 E.0213
G1 X141.896 Y126.278 E.5965
G1 X141.896 Y126.792 E.0213
G1 X131.208 Y116.104 E.62663
G1 X130.694 Y116.104 E.0213
G1 X141.896 Y127.306 E.65676
G1 X141.896 Y127.82 E.0213
G1 X130.18 Y116.104 E.68688
G1 X129.666 Y116.104 E.0213
G1 X141.896 Y128.334 E.71701
G1 X141.896 Y128.848 E.0213
G1 X129.152 Y116.104 E.74714
G1 X128.638 Y116.104 E.0213
G1 X141.896 Y129.362 E.77727
G1 X141.896 Y129.876 E.0213
G1 X128.124 Y116.104 E.80739
G1 X127.61 Y116.104 E.0213
G1 X141.896 Y130.39 E.83752
G1 X141.896 Y130.903 E.0213
G1 X127.097 Y116.104 E.86765
G1 X126.583 Y116.104 E.0213
G1 X141.896 Y131.417 E.89777
G1 X141.896 Y131.931 E.0213
G1 X126.069 Y116.104 E.9279
G1 X125.555 Y116.104 E.0213
G1 X141.896 Y132.445 E.95803
G1 X141.896 Y132.959 E.0213
G1 X125.041 Y116.104 E.98815
G1 X124.527 Y116.104 E.0213
G1 X141.896 Y133.473 E1.01828
G1 X141.896 Y133.987 E.0213
G1 X124.013 Y116.104 E1.04841
G1 X123.499 Y116.104 E.0213
G1 X141.896 Y134.501 E1.07853
G1 X141.896 Y135.015 E.0213
G1 X122.985 Y116.104 E1.10866
G1 X122.472 Y116.104 E.0213
G1 X141.896 Y135.528 E1.13879
G1 X141.896 Y136.042 E.0213
G1 X121.958 Y116.104 E1.16891
G1 X121.444 Y116.104 E.0213
G1 X141.896 Y136.556 E1.19904
G1 X141.896 Y137.07 E.0213
G1 X120.93 Y116.104 E1.22917
G1 X120.416 Y116.104 E.0213
G1 X141.896 Y137.584 E1.25929
G1 X141.896 Y138.098 E.0213
G1 X119.902 Y116.104 E1.28942
G1 X119.388 Y116.104 E.0213
G1 X141.896 Y138.612 E1.31955
G1 X141.896 Y139.126 E.0213
G1 X118.874 Y116.104 E1.34968
G1 X118.361 Y116.104 E.0213
G1 X141.896 Y139.639 E1.3798
G1 X141.896 Y139.896 E.01065
G1 X141.639 Y139.896 E.01065
G1 X118.104 Y116.361 E1.3798
G1 X118.104 Y116.874 E.0213
G1 X141.126 Y139.896 E1.34967
G1 X140.612 Y139.896 E.0213
G1 X118.104 Y117.388 E1.31955
G1 X118.104 Y117.902 E.0213
G1 X140.098 Y139.896 E1.28942
G1 X139.584 Y139.896 E.0213
G1 X118.104 Y118.416 E1.25929
G1 X118.104 Y118.93 E.0213
G1 X139.07 Y139.896 E1.22917
G1 X138.556 Y139.896 E.0213
G1 X118.104 Y119.444 E1.19904
G1 X118.104 Y119.958 E.0213
G1 X138.042 Y139.896 E1.16891
G1 X137.528 Y139.896 E.0213
G1 X118.104 Y120.472 E1.13879
G1 X118.104 Y120.986 E.0213
G1 X137.014 Y139.896 E1.10866
G1 X136.501 Y139.896 E.0213
G1 X118.104 Y121.499 E1.07853
G1 X118.104 Y122.013 E.0213
G1 X135.987 Y139.896 E1.0484
G1 X135.473 Y139.896 E.0213
G1 X118.104 Y122.527 E1.01828
G1 X118.104 Y123.041 E.0213
G1 X134.959 Y139.896 E.98815
G1 X134.445 Y139.896 E.0213
G1 X118.104 Y123.555 E.95802
G1 X118.104 Y124.069 E.0213
G1 X133.931 Y139.896 E.9279
G1 X133.417 Y139.896 E.0213
G1 X118.104 Y124.583 E.89777
G1 X118.104 Y125.097 E.0213
G1 X132.903 Y139.896 E.86764
G1 X132.389 Y139.896 E.0213
G1 X118.104 Y125.611 E.83752
G1 X118.104 Y126.124 E.0213
G1 X131.876 Y139.896 E.80739
G1 X131.362 Y139.896 E.0213
G1 X118.104 Y126.638 E.77726
G1 X118.104 Y127.152 E.0213
G1 X130.848 Y139.896 E.74714
G1 X130.334 Y139.896 E.0213
G1 X118.104 Y127.666 E.71701
G1 X118.104 Y128.18 E.0213
G1 X129.82 Y139.896 E.68688
G1 X129.306 Y139.896 E.0213
G1 X118.104 Y128.694 E.65676
G1 X118.104 Y129.208 E.0213
G1 X128.792 Y139.896 E.62663
G1 X128.278 Y139.896 E.0213
G1 X118.104 Y129.722 E.5965
G1 X118.104 Y130.235 E.0213
G1 X127.765 Y139.896 E.56638
G1 X127.251 Y139.896 E.0213
G1 X118.104 Y130.749 E.53625
G1 X118.104 Y131.263 E.0213
G1 X126.737 Y139.896 E.50612
G1 X126.223 Y139.896 E.0213
G1 X118.104 Y131.777 E.47599
G1 X118.104 Y132.291 E.0213
G1 X125.709 Y139.896 E.44587
G1 X125.195 Y139.896 E.0213
G1 X118.104 Y132.805 E.41574
G1 X118.104 Y133.319 E.0213
G1 X124.681 Y139.896 E.38561
G1 X124.167 Y139.896 E.0213
G1 X118.104 Y133.833 E.35549
G1 X118.104 Y134.347 E.0213
G1 X123.653 Y139.896 E.32536
G1 X123.14 Y139.896 E.0213
G1 X118.104 Y134.86 E.29523
G1 X118.104 Y135.374 E.0213
G1 X122.626 Y139.896 E.26511
G1 X122.112 Y139.896 E.0213
G1 X118.104 Y135.888 E.23498
G1 X118.104 Y136.402 E.0213
G1 X121.598 Y139.896 E.20485
G1 X121.084 Y139.896 E.0213
G1 X118.104 Y136.916 E.17473
G1 X118.104 Y137.43 E.0213
G1 X120.57 Y139.896 E.1446
G1 X120.056 Y139.896 E.0213
G1 X118.104 Y137.944 E.11447
G1 X118.104 Y138.458 E.0213
G1 X119.542 Y139.896 E.08435
G1 X119.028 Y139.896 E.0213
M73 P48 R8
G1 X118.104 Y138.972 E.05422
G1 X118.104 Y139.485 E.0213
G1 X118.676 Y140.058 E.03359
; CHANGE_LAYER
; Z_HEIGHT: 1.04
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X118.104 Y139.485 E-.30789
G1 X118.104 Y138.972 E-.19528
G1 X118.582 Y139.449 E-.25684
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 4/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L4
M991 S0 P3 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z1.16 I-.039 J1.216 P1  F30000
G1 X142.215 Y140.215 Z1.16
G1 Z1.04
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F7272
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7272
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z1.44 F30000
G1 X138.616 Y116.119 Z1.44
G1 Z1.04
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7272
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7272
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 1.32
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 5/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L5
M991 S0 P4 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z1.44 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z1.44
G1 Z1.32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z1.72 F30000
G1 Z1.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 6/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L6
M991 S0 P5 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z1.72 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z1.72
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
M73 P49 R8
G1 E-.04 F1800
G1 X139.975 Y132.927 Z2 F30000
G1 X138.616 Y116.119 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
M73 P49 R7
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 1.88
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 7/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L7
M991 S0 P6 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z2 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z2
G1 Z1.88
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z2.28 F30000
G1 Z1.88
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 2.16
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 8/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L8
M991 S0 P7 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z2.28 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z2.28
G1 Z2.16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
M73 P50 R7
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z2.56 F30000
G1 X138.616 Y116.119 Z2.56
G1 Z2.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 2.44
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 9/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L9
M991 S0 P8 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z2.56 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z2.56
G1 Z2.44
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z2.84 F30000
G1 Z2.44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 2.72
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 10/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L10
M991 S0 P9 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z2.84 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z2.84
G1 Z2.72
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
M73 P51 R7
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z3.12 F30000
G1 X138.616 Y116.119 Z3.12
G1 Z2.72
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 11/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L11
M991 S0 P10 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z3.12 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z3.12
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 3.28
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 12/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L12
M991 S0 P11 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z3.4 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z3.4
G1 Z3.28
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
M73 P52 R7
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z3.68 F30000
G1 X138.616 Y116.119 Z3.68
G1 Z3.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 3.56
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 13/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L13
M991 S0 P12 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z3.68 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z3.68
G1 Z3.56
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z3.96 F30000
G1 Z3.56
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 3.84
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 14/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L14
M991 S0 P13 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z3.96 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z3.96
G1 Z3.84
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
M73 P53 R7
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z4.24 F30000
G1 X138.616 Y116.119 Z4.24
G1 Z3.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 4.12
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 15/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L15
M991 S0 P14 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z4.24 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z4.24
G1 Z4.12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z4.52 F30000
G1 Z4.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 16/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L16
M991 S0 P15 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z4.52 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z4.52
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
M73 P54 R7
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z4.8 F30000
G1 X138.616 Y116.119 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 4.68
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 17/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L17
M991 S0 P16 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z4.8 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z4.8
G1 Z4.68
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z5.08 F30000
G1 Z4.68
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 4.96
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 18/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L18
M991 S0 P17 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z5.08 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z5.08
G1 Z4.96
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
M73 P55 R7
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z5.36 F30000
G1 X138.616 Y116.119 Z5.36
G1 Z4.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 5.24
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 19/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L19
M991 S0 P18 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z5.36 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z5.36
G1 Z5.24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
M73 P55 R6
G1 E-.04 F1800
G1 X141.881 Y136.616 Z5.64 F30000
G1 Z5.24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 5.52
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 20/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L20
M991 S0 P19 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z5.64 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z5.64
G1 Z5.52
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
M73 P56 R6
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z5.92 F30000
G1 X138.616 Y116.119 Z5.92
G1 Z5.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 21/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L21
M991 S0 P20 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z5.92 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z5.92
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 6.08
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 22/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L22
M991 S0 P21 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z6.2 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z6.2
G1 Z6.08
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
M73 P57 R6
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z6.48 F30000
G1 X138.616 Y116.119 Z6.48
G1 Z6.08
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 6.36
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 23/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L23
M991 S0 P22 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z6.48 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z6.48
G1 Z6.36
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z6.76 F30000
G1 Z6.36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 6.64
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 24/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L24
M991 S0 P23 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z6.76 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z6.76
G1 Z6.64
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
M73 P58 R6
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z7.04 F30000
G1 X138.616 Y116.119 Z7.04
G1 Z6.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 6.92
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 25/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L25
M991 S0 P24 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z7.04 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z7.04
G1 Z6.92
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z7.32 F30000
G1 Z6.92
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 26/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L26
M991 S0 P25 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z7.32 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z7.32
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
M73 P59 R6
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z7.6 F30000
G1 X138.616 Y116.119 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 7.48
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 27/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L27
M991 S0 P26 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z7.6 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z7.6
G1 Z7.48
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z7.88 F30000
G1 Z7.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 7.76
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 28/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L28
M991 S0 P27 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z7.88 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z7.88
G1 Z7.76
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
M73 P60 R6
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z8.16 F30000
G1 X138.616 Y116.119 Z8.16
G1 Z7.76
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 8.04
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 29/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L29
M991 S0 P28 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z8.16 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z8.16
G1 Z8.04
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z8.44 F30000
G1 Z8.04
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 8.32
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 30/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L30
M991 S0 P29 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z8.44 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z8.44
G1 Z8.32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
M73 P61 R6
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z8.72 F30000
G1 X138.616 Y116.119 Z8.72
G1 Z8.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 31/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L31
M991 S0 P30 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z8.72 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z8.72
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z9 F30000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 8.88
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
M73 P61 R5
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 32/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L32
M991 S0 P31 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z9 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z9
G1 Z8.88
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
M73 P62 R5
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z9.28 F30000
G1 X138.616 Y116.119 Z9.28
G1 Z8.88
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 9.16
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 33/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L33
M991 S0 P32 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z9.28 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z9.28
G1 Z9.16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z9.56 F30000
G1 Z9.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 9.44
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 34/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L34
M991 S0 P33 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z9.56 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z9.56
G1 Z9.44
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
M73 P63 R5
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z9.84 F30000
G1 X138.616 Y116.119 Z9.84
G1 Z9.44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 9.72
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 35/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L35
M991 S0 P34 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z9.84 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z9.84
G1 Z9.72
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z10.12 F30000
G1 Z9.72
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 36/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L36
M991 S0 P35 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z10.12 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z10.12
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
M73 P64 R5
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z10.4 F30000
G1 X138.616 Y116.119 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 10.28
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 37/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L37
M991 S0 P36 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z10.4 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z10.4
G1 Z10.28
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z10.68 F30000
G1 Z10.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 10.56
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 38/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L38
M991 S0 P37 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z10.68 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z10.68
G1 Z10.56
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
M73 P65 R5
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z10.96 F30000
G1 X138.616 Y116.119 Z10.96
G1 Z10.56
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 10.84
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 39/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L39
M991 S0 P38 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z10.96 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z10.96
G1 Z10.84
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z11.24 F30000
G1 Z10.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 11.12
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 40/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L40
M991 S0 P39 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z11.24 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z11.24
G1 Z11.12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
M73 P66 R5
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z11.52 F30000
G1 X138.616 Y116.119 Z11.52
G1 Z11.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 41/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L41
M991 S0 P40 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z11.52 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z11.52
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z11.8 F30000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 11.68
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 42/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L42
M991 S0 P41 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z11.8 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z11.8
G1 Z11.68
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
M73 P67 R5
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z12.08 F30000
G1 X138.616 Y116.119 Z12.08
G1 Z11.68
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 11.96
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 43/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L43
M991 S0 P42 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z12.08 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z12.08
G1 Z11.96
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z12.36 F30000
G1 Z11.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 12.24
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 44/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L44
M991 S0 P43 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z12.36 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z12.36
G1 Z12.24
G1 E.8 F1800
; FEATURE: Inner wall
M73 P68 R5
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z12.64 F30000
G1 X138.616 Y116.119 Z12.64
G1 Z12.24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
M73 P68 R4
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 12.52
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 45/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L45
M991 S0 P44 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z12.64 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z12.64
G1 Z12.52
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z12.92 F30000
G1 Z12.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 46/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L46
M991 S0 P45 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z12.92 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z12.92
M73 P69 R4
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z13.2 F30000
G1 X138.616 Y116.119 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 13.08
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 47/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L47
M991 S0 P46 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z13.2 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z13.2
G1 Z13.08
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z13.48 F30000
G1 Z13.08
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 13.36
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 48/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L48
M991 S0 P47 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z13.48 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z13.48
M73 P70 R4
G1 Z13.36
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z13.76 F30000
G1 X138.616 Y116.119 Z13.76
G1 Z13.36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 13.64
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 49/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L49
M991 S0 P48 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z13.76 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z13.76
G1 Z13.64
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z14.04 F30000
G1 Z13.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 13.92
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 50/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L50
M991 S0 P49 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z14.04 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z14.04
M73 P71 R4
G1 Z13.92
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z14.32 F30000
G1 X138.616 Y116.119 Z14.32
G1 Z13.92
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 51/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L51
M991 S0 P50 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z14.32 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z14.32
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z14.6 F30000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 14.48
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 52/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L52
M991 S0 P51 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z14.6 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z14.6
M73 P72 R4
G1 Z14.48
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z14.88 F30000
G1 X138.616 Y116.119 Z14.88
G1 Z14.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 14.76
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 53/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L53
M991 S0 P52 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z14.88 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z14.88
G1 Z14.76
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z15.16 F30000
G1 Z14.76
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 15.04
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 54/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L54
M991 S0 P53 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z15.16 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z15.16
M73 P73 R4
G1 Z15.04
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z15.44 F30000
G1 X138.616 Y116.119 Z15.44
G1 Z15.04
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 15.32
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 55/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L55
M991 S0 P54 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z15.44 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z15.44
G1 Z15.32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z15.72 F30000
G1 Z15.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 56/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L56
M991 S0 P55 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z15.72 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z15.72
M73 P74 R4
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z16 F30000
G1 X138.616 Y116.119 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 15.88
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 57/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L57
M991 S0 P56 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z16 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z16
G1 Z15.88
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z16.28 F30000
G1 Z15.88
M73 P74 R3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 16.16
; LAYER_HEIGHT: 0.28
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 58/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L58
M991 S0 P57 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z16.28 I-1.214 J.088 P1  F30000
M73 P75 R3
G1 X142.215 Y140.215 Z16.28
G1 Z16.16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z16.56 F30000
G1 X138.616 Y116.119 Z16.56
G1 Z16.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 16.44
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 59/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L59
M991 S0 P58 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z16.56 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z16.56
G1 Z16.44
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z16.84 F30000
G1 Z16.44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 16.72
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 60/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L60
M991 S0 P59 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z16.84 I-1.214 J.088 P1  F30000
M73 P76 R3
G1 X142.215 Y140.215 Z16.84
G1 Z16.72
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z17.12 F30000
G1 X138.616 Y116.119 Z17.12
G1 Z16.72
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 61/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L61
M991 S0 P60 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z17.12 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z17.12
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z17.4 F30000
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 17.28
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 62/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L62
M991 S0 P61 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z17.4 I-1.214 J.088 P1  F30000
M73 P77 R3
G1 X142.215 Y140.215 Z17.4
G1 Z17.28
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z17.68 F30000
G1 X138.616 Y116.119 Z17.68
G1 Z17.28
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 17.56
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 63/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L63
M991 S0 P62 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z17.68 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z17.68
G1 Z17.56
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z17.96 F30000
G1 Z17.56
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 17.84
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 64/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L64
M991 S0 P63 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z17.96 I-1.214 J.088 P1  F30000
M73 P78 R3
G1 X142.215 Y140.215 Z17.96
G1 Z17.84
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z18.24 F30000
G1 X138.616 Y116.119 Z18.24
G1 Z17.84
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 18.12
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 65/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L65
M991 S0 P64 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z18.24 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z18.24
G1 Z18.12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z18.52 F30000
G1 Z18.12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 66/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L66
M991 S0 P65 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z18.52 I-1.214 J.088 P1  F30000
M73 P79 R3
G1 X142.215 Y140.215 Z18.52
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z18.8 F30000
G1 X138.616 Y116.119 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 18.68
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 67/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L67
M991 S0 P66 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z18.8 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z18.8
G1 Z18.68
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z19.08 F30000
G1 Z18.68
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 18.96
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 68/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L68
M991 S0 P67 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z19.08 I-1.214 J.088 P1  F30000
M73 P80 R3
G1 X142.215 Y140.215 Z19.08
G1 Z18.96
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z19.36 F30000
G1 X138.616 Y116.119 Z19.36
G1 Z18.96
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 19.24
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 69/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L69
M991 S0 P68 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z19.36 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z19.36
G1 Z19.24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z19.64 F30000
G1 Z19.24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 19.52
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
M73 P80 R2
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 70/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L70
M991 S0 P69 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
M73 P81 R2
G3 Z19.64 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z19.64
G1 Z19.52
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z19.92 F30000
G1 X138.616 Y116.119 Z19.92
G1 Z19.52
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 71/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L71
M991 S0 P70 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z19.92 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z19.92
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z20.2 F30000
G1 Z19.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 20.08
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 72/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L72
M991 S0 P71 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
M73 P82 R2
G3 Z20.2 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z20.2
G1 Z20.08
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z20.48 F30000
G1 X138.616 Y116.119 Z20.48
G1 Z20.08
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 20.36
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 73/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L73
M991 S0 P72 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z20.48 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z20.48
G1 Z20.36
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z20.76 F30000
G1 Z20.36
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 20.64
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 74/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L74
M991 S0 P73 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
M73 P83 R2
G3 Z20.76 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z20.76
G1 Z20.64
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z21.04 F30000
G1 X138.616 Y116.119 Z21.04
G1 Z20.64
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 20.92
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 75/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L75
M991 S0 P74 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z21.04 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z21.04
G1 Z20.92
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z21.32 F30000
G1 Z20.92
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 21.2
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 76/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L76
M991 S0 P75 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
M73 P84 R2
G3 Z21.32 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z21.32
G1 Z21.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z21.6 F30000
G1 X138.616 Y116.119 Z21.6
G1 Z21.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 21.48
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 77/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L77
M991 S0 P76 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z21.6 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z21.6
G1 Z21.48
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z21.88 F30000
G1 Z21.48
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 21.76
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 78/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L78
M991 S0 P77 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
M73 P85 R2
G3 Z21.88 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z21.88
G1 Z21.76
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z22.16 F30000
G1 X138.616 Y116.119 Z22.16
G1 Z21.76
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 22.04
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 79/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L79
M991 S0 P78 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z22.16 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z22.16
G1 Z22.04
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z22.44 F30000
G1 Z22.04
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 22.32
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 80/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L80
M991 S0 P79 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
M73 P86 R2
G3 Z22.44 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z22.44
G1 Z22.32
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z22.72 F30000
G1 X138.616 Y116.119 Z22.72
G1 Z22.32
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 22.6
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 81/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L81
M991 S0 P80 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z22.72 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z22.72
G1 Z22.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z23 F30000
G1 Z22.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 22.88
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 82/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L82
M991 S0 P81 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
M73 P87 R2
G3 Z23 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z23
G1 Z22.88
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z23.28 F30000
G1 X138.616 Y116.119 Z23.28
G1 Z22.88
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
M73 P87 R1
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 23.16
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 83/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L83
M991 S0 P82 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z23.28 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z23.28
G1 Z23.16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z23.56 F30000
G1 Z23.16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 23.44
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
M73 P88 R1
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 84/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L84
M991 S0 P83 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z23.56 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z23.56
G1 Z23.44
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z23.84 F30000
G1 X138.616 Y116.119 Z23.84
G1 Z23.44
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 23.72
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 85/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L85
M991 S0 P84 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z23.84 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z23.84
G1 Z23.72
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7113
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7113
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.881 Y136.616 Z24.12 F30000
G1 Z23.72
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7113
G1 X141.881 Y138.175 E.06938
G1 X140.175 Y139.881 E.10733
G1 X141.881 Y139.881 E.07589
G1 X118.119 Y116.119 E1.49485
G1 X119.825 Y116.119 E.07589
G1 X118.119 Y117.825 E.10733
G1 X118.119 Y119.384 E.06938
G1 X136.089 Y139.881 F30000
G1 F7113
G1 X134.529 Y139.881 E.06938
G1 X118.119 Y123.471 E1.03234
G1 X118.119 Y125.177 E.07589
G1 X127.177 Y116.119 E.56983
G1 X125.471 Y116.119 E.07589
G1 X141.881 Y132.529 E1.03234
G1 X141.881 Y130.823 E.07589
G1 X132.823 Y139.881 E.56983
G1 X127.177 Y139.881 E.25115
G1 X118.119 Y130.823 E.56983
G1 X118.119 Y132.529 E.07589
G1 X134.529 Y116.119 E1.03234
G1 X132.823 Y116.119 E.07589
G1 X141.881 Y125.177 E.56983
G1 X141.881 Y123.471 E.07589
G1 X125.471 Y139.881 E1.03234
G1 X119.825 Y139.881 E.25115
G1 X118.119 Y138.175 E.10733
G1 X118.119 Y139.881 E.07589
G1 X141.881 Y116.119 E1.49485
G1 X141.881 Y117.825 E.07589
G1 X140.175 Y116.119 E.10733
G1 X138.616 Y116.119 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 24
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X140.175 Y116.119 E-.59267
G1 X140.487 Y116.43 E-.16733
; WIPE_END
M73 P89 R1
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 86/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L86
M991 S0 P85 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z24.12 I-1.214 J.088 P1  F30000
G1 X142.215 Y140.215 Z24.12
G1 Z24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7273
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7273
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X139.975 Y132.927 Z24.4 F30000
G1 X138.616 Y116.119 Z24.4
G1 Z24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7273
G1 X140.175 Y116.119 E.06938
G1 X141.881 Y117.825 E.10733
G1 X141.881 Y116.119 E.07589
G1 X118.119 Y139.881 E1.49485
G1 X118.119 Y138.175 E.07589
G1 X119.825 Y139.881 E.10733
G1 X125.471 Y139.881 E.25115
G1 X141.881 Y123.471 E1.03234
G1 X141.881 Y125.177 E.07589
G1 X132.823 Y116.119 E.56983
G1 X134.529 Y116.119 E.07589
G1 X118.119 Y132.529 E1.03234
G1 X118.119 Y130.823 E.07589
G1 X127.177 Y139.881 E.56983
G1 X132.823 Y139.881 E.25115
G1 X141.881 Y130.823 E.56983
G1 X141.881 Y132.529 E.07589
G1 X125.471 Y116.119 E1.03234
G1 X127.177 Y116.119 E.07589
G1 X118.119 Y125.177 E.56983
G1 X118.119 Y123.471 E.07589
G1 X134.529 Y139.881 E1.03234
G1 X136.089 Y139.881 E.06938
G1 X118.119 Y119.384 F30000
G1 F7273
G1 X118.119 Y117.825 E.06938
G1 X119.825 Y116.119 E.10733
G1 X118.119 Y116.119 E.07589
G1 X141.881 Y139.881 E1.49485
G1 X140.175 Y139.881 E.07589
G1 X141.881 Y138.175 E.10733
G1 X141.881 Y136.616 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 24.28
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X141.881 Y138.175 E-.59267
G1 X141.57 Y138.487 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 87/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L87
M991 S0 P86 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z24.4 I-1.14 J.426 P1  F30000
G1 X142.215 Y140.215 Z24.4
G1 Z24.28
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8195
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8195
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
G1 X141.881 Y139.881 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8195
G1 X118.119 Y139.881 E1.05702
G1 X118.119 Y116.119 E1.05702
G1 X141.881 Y116.119 E1.05702
G1 X141.881 Y139.821 E1.05435
G1 X141.492 Y137.006 F30000
G1 F8195
G1 X141.492 Y138.565 E.06938
G1 X140.565 Y139.492 E.05827
G1 X141.492 Y139.492 E.0412
G1 X118.508 Y116.508 E1.44579
G1 X119.435 Y116.508 E.0412
G1 X118.508 Y117.435 E.05827
G1 X118.508 Y118.994 E.06938
G1 X135.699 Y139.492 F30000
G1 F8195
G1 X134.139 Y139.492 E.06938
G1 X118.508 Y123.861 E.98329
G1 X118.508 Y124.787 E.0412
G1 X126.787 Y116.508 E.52078
G1 X125.861 Y116.508 E.0412
G1 X141.492 Y132.139 E.98329
G1 X141.492 Y131.213 E.0412
G1 X133.213 Y139.492 E.52078
G1 X126.787 Y139.492 E.28584
G1 X118.508 Y131.213 E.52078
G1 X118.508 Y132.139 E.0412
G1 X134.139 Y116.508 E.98329
G1 X133.213 Y116.508 E.0412
G1 X141.492 Y124.787 E.52078
G1 X141.492 Y123.861 E.0412
G1 X125.861 Y139.492 E.98329
G1 X119.435 Y139.492 E.28584
G1 X118.508 Y138.565 E.05827
G1 X118.508 Y139.492 E.0412
G1 X141.492 Y116.509 E1.44579
G1 X141.492 Y117.435 E.0412
G1 X140.565 Y116.508 E.05827
G1 X139.006 Y116.508 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 24.56
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X140.565 Y116.508 E-.59267
M73 P90 R1
G1 X140.877 Y116.82 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 88/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L88
M991 S0 P87 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z24.68 I-1.215 J.07 P1  F30000
G1 X142.215 Y140.215 Z24.68
G1 Z24.56
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8377
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8377
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
G1 X141.881 Y139.881 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8377
G1 X118.119 Y139.881 E1.05702
G1 X118.119 Y116.119 E1.05702
G1 X141.881 Y116.119 E1.05702
G1 X141.881 Y139.821 E1.05435
G1 X139.006 Y116.508 F30000
G1 F8377
G1 X140.565 Y116.508 E.06938
G1 X141.492 Y117.435 E.05827
G1 X141.492 Y116.509 E.0412
G1 X118.508 Y139.492 E1.44579
G1 X118.508 Y138.565 E.0412
G1 X119.435 Y139.492 E.05827
G1 X125.861 Y139.492 E.28584
G1 X141.492 Y123.861 E.98329
G1 X141.492 Y124.787 E.0412
G1 X133.213 Y116.508 E.52078
G1 X134.139 Y116.508 E.0412
G1 X118.508 Y132.139 E.98329
G1 X118.508 Y131.213 E.0412
G1 X126.787 Y139.492 E.52078
G1 X133.213 Y139.492 E.28584
G1 X141.492 Y131.213 E.52078
G1 X141.492 Y132.139 E.0412
G1 X125.861 Y116.508 E.98329
G1 X126.787 Y116.508 E.0412
G1 X118.508 Y124.787 E.52078
G1 X118.508 Y123.861 E.0412
G1 X134.139 Y139.492 E.98329
G1 X135.699 Y139.492 E.06938
G1 X118.508 Y118.994 F30000
G1 F8377
G1 X118.508 Y117.435 E.06938
G1 X119.435 Y116.508 E.05827
G1 X118.508 Y116.508 E.0412
G1 X141.492 Y139.492 E1.44579
G1 X140.565 Y139.492 E.0412
G1 X141.492 Y138.565 E.05827
G1 X141.492 Y137.006 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 24.84
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X141.492 Y138.565 E-.59267
G1 X141.18 Y138.877 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 89/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L89
M991 S0 P88 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z24.96 I-.963 J.744 P1  F30000
G1 X142.215 Y140.215 Z24.96
G1 Z24.84
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8194
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8194
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
G1 X141.881 Y139.881 F30000
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8194
G1 X118.119 Y139.881 E1.05702
G1 X118.119 Y116.119 E1.05702
G1 X141.881 Y116.119 E1.05702
G1 X141.881 Y139.821 E1.05435
G1 X141.492 Y137.006 F30000
G1 F8194
G1 X141.492 Y138.565 E.06938
G1 X140.565 Y139.492 E.05827
G1 X141.492 Y139.492 E.0412
G1 X118.508 Y116.508 E1.44579
G1 X119.435 Y116.508 E.0412
G1 X118.508 Y117.435 E.05827
G1 X118.508 Y118.994 E.06938
G1 X135.699 Y139.492 F30000
G1 F8194
G1 X134.139 Y139.492 E.06938
G1 X118.508 Y123.861 E.98329
G1 X118.508 Y124.787 E.0412
G1 X126.787 Y116.508 E.52078
G1 X125.861 Y116.508 E.0412
G1 X141.492 Y132.139 E.98329
G1 X141.492 Y131.213 E.0412
G1 X133.213 Y139.492 E.52078
G1 X126.787 Y139.492 E.28584
G1 X118.508 Y131.213 E.52078
G1 X118.508 Y132.139 E.0412
G1 X134.139 Y116.508 E.98329
G1 X133.213 Y116.508 E.0412
G1 X141.492 Y124.787 E.52078
G1 X141.492 Y123.861 E.0412
G1 X125.861 Y139.492 E.98329
G1 X119.435 Y139.492 E.28584
G1 X118.508 Y138.565 E.05827
G1 X118.508 Y139.492 E.0412
G1 X141.492 Y116.509 E1.44579
G1 X141.492 Y117.435 E.0412
G1 X140.565 Y116.508 E.05827
G1 X139.006 Y116.508 E.06938
; CHANGE_LAYER
; Z_HEIGHT: 25.12
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X140.565 Y116.508 E-.59267
M73 P91 R1
G1 X140.877 Y116.82 E-.16733
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 90/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L90
M991 S0 P89 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z25.24 I-1.215 J.07 P1  F30000
G1 X142.215 Y140.215 Z25.24
G1 Z25.12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F11541.081
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.047 Y132.916 Z25.52 F30000
G1 X142.054 Y116.152 Z25.52
G1 Z25.12
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.405712
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X118.149 Y116.152 E1.25915
G1 X118.149 Y116.607 E.024
G1 X141.851 Y116.607 E1.24849
G1 X141.851 Y117.063 E.024
G1 X118.149 Y117.063 E1.24849
G1 X118.149 Y117.519 E.024
G1 X141.851 Y117.519 E1.24849
G1 X141.851 Y117.974 E.024
G1 X118.149 Y117.974 E1.24849
G1 X118.149 Y118.43 E.024
G1 X141.851 Y118.43 E1.24849
G1 X141.851 Y118.886 E.024
G1 X118.149 Y118.886 E1.24849
G1 X118.149 Y119.342 E.024
G1 X141.851 Y119.342 E1.24849
G1 X141.851 Y119.797 E.024
G1 X118.149 Y119.797 E1.24849
G1 X118.149 Y120.253 E.024
G1 X141.851 Y120.253 E1.24849
G1 X141.851 Y120.709 E.024
G1 X118.149 Y120.709 E1.24849
G1 X118.149 Y121.164 E.024
G1 X141.851 Y121.164 E1.24849
G1 X141.851 Y121.62 E.024
G1 X118.149 Y121.62 E1.24849
G1 X118.149 Y122.076 E.024
G1 X141.851 Y122.076 E1.24849
G1 X141.851 Y122.532 E.024
G1 X118.149 Y122.532 E1.24849
G1 X118.149 Y122.987 E.024
G1 X141.851 Y122.987 E1.24849
G1 X141.851 Y123.443 E.024
G1 X118.149 Y123.443 E1.24849
G1 X118.149 Y123.899 E.024
G1 X141.851 Y123.899 E1.24849
G1 X141.851 Y124.354 E.024
G1 X118.149 Y124.354 E1.24849
G1 X118.149 Y124.81 E.024
G1 X141.851 Y124.81 E1.24849
G1 X141.851 Y125.266 E.024
G1 X118.149 Y125.266 E1.24849
G1 X118.149 Y125.721 E.024
G1 X141.851 Y125.721 E1.24849
G1 X141.851 Y126.177 E.024
G1 X118.149 Y126.177 E1.24849
G1 X118.149 Y126.633 E.024
G1 X141.851 Y126.633 E1.24849
G1 X141.851 Y127.089 E.024
G1 X118.149 Y127.089 E1.24849
G1 X118.149 Y127.544 E.024
G1 X141.851 Y127.544 E1.24849
G1 X141.851 Y128 E.024
G1 X118.149 Y128 E1.24849
G1 X118.149 Y128.456 E.024
G1 X141.851 Y128.456 E1.24849
G1 X141.851 Y128.911 E.024
G1 X118.149 Y128.911 E1.24849
G1 X118.149 Y129.367 E.024
G1 X141.851 Y129.367 E1.24849
G1 X141.851 Y129.823 E.024
G1 X118.149 Y129.823 E1.24849
G1 X118.149 Y130.279 E.024
G1 X141.851 Y130.279 E1.24849
G1 X141.851 Y130.734 E.024
G1 X118.149 Y130.734 E1.24849
G1 X118.149 Y131.19 E.024
G1 X141.851 Y131.19 E1.24849
G1 X141.851 Y131.646 E.024
G1 X118.149 Y131.646 E1.24849
G1 X118.149 Y132.101 E.024
G1 X141.851 Y132.101 E1.24849
G1 X141.851 Y132.557 E.024
G1 X118.149 Y132.557 E1.24849
G1 X118.149 Y133.013 E.024
G1 X141.851 Y133.013 E1.24849
G1 X141.851 Y133.469 E.024
G1 X118.149 Y133.469 E1.24849
G1 X118.149 Y133.924 E.024
G1 X141.851 Y133.924 E1.24849
G1 X141.851 Y134.38 E.024
G1 X118.149 Y134.38 E1.24849
G1 X118.149 Y134.836 E.024
G1 X141.851 Y134.836 E1.24849
G1 X141.851 Y135.291 E.024
G1 X118.149 Y135.291 E1.24849
G1 X118.149 Y135.747 E.024
G1 X141.851 Y135.747 E1.24849
G1 X141.851 Y136.203 E.024
G1 X118.149 Y136.203 E1.24849
G1 X118.149 Y136.659 E.024
G1 X141.851 Y136.659 E1.24849
G1 X141.851 Y137.114 E.024
G1 X118.149 Y137.114 E1.24849
G1 X118.149 Y137.57 E.024
M73 P92 R1
G1 X141.851 Y137.57 E1.24849
G1 X141.851 Y138.026 E.024
G1 X118.149 Y138.026 E1.24849
G1 X118.149 Y138.481 E.024
G1 X141.851 Y138.481 E1.24849
G1 X141.851 Y138.937 E.024
G1 X118.149 Y138.937 E1.24849
G1 X118.149 Y139.393 E.024
G1 X141.851 Y139.393 E1.24849
G1 X141.851 Y139.849 E.024
G1 X117.946 Y139.849 E1.25915
; CHANGE_LAYER
; Z_HEIGHT: 25.4
; LAYER_HEIGHT: 0.279999
; WIPE_START
G1 F24000
G1 X119.946 Y139.849 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 91/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L91
M991 S0 P90 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z25.52 I-.02 J1.217 P1  F30000
G1 X142.215 Y140.215 Z25.52
G1 Z25.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X117.785 Y140.215 E1.0867
G1 X117.785 Y115.785 E1.0867
G1 X142.215 Y115.785 E1.0867
G1 X142.215 Y140.155 E1.08403
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.059 Y132.917 Z25.8 F30000
G1 X142.058 Y116.677 Z25.8
G1 Z25.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.423462
G1 F12000
G1 X141.485 Y116.104 E.03359
G1 X140.972 Y116.104 E.0213
G1 X141.896 Y117.028 E.05422
G1 X141.896 Y117.542 E.0213
G1 X140.458 Y116.104 E.08435
G1 X139.944 Y116.104 E.0213
G1 X141.896 Y118.056 E.11448
G1 X141.896 Y118.57 E.0213
M73 P93 R1
G1 X139.43 Y116.104 E.1446
G1 X138.916 Y116.104 E.0213
G1 X141.896 Y119.084 E.17473
G1 X141.896 Y119.598 E.0213
G1 X138.402 Y116.104 E.20486
G1 X137.888 Y116.104 E.0213
G1 X141.896 Y120.112 E.23498
G1 X141.896 Y120.626 E.0213
G1 X137.374 Y116.104 E.26511
G1 X136.86 Y116.104 E.0213
G1 X141.896 Y121.14 E.29524
G1 X141.896 Y121.653 E.0213
G1 X136.347 Y116.104 E.32536
G1 X135.833 Y116.104 E.0213
G1 X141.896 Y122.167 E.35549
G1 X141.896 Y122.681 E.0213
G1 X135.319 Y116.104 E.38562
G1 X134.805 Y116.104 E.0213
G1 X141.896 Y123.195 E.41574
G1 X141.896 Y123.709 E.0213
G1 X134.291 Y116.104 E.44587
G1 X133.777 Y116.104 E.0213
G1 X141.896 Y124.223 E.476
G1 X141.896 Y124.737 E.0213
G1 X133.263 Y116.104 E.50612
G1 X132.749 Y116.104 E.0213
G1 X141.896 Y125.251 E.53625
G1 X141.896 Y125.765 E.0213
M73 P93 R0
G1 X132.235 Y116.104 E.56638
G1 X131.722 Y116.104 E.0213
G1 X141.896 Y126.278 E.5965
G1 X141.896 Y126.792 E.0213
G1 X131.208 Y116.104 E.62663
G1 X130.694 Y116.104 E.0213
G1 X141.896 Y127.306 E.65676
G1 X141.896 Y127.82 E.0213
G1 X130.18 Y116.104 E.68688
G1 X129.666 Y116.104 E.0213
G1 X141.896 Y128.334 E.71701
G1 X141.896 Y128.848 E.0213
M73 P94 R0
G1 X129.152 Y116.104 E.74714
G1 X128.638 Y116.104 E.0213
G1 X141.896 Y129.362 E.77727
G1 X141.896 Y129.876 E.0213
G1 X128.124 Y116.104 E.80739
G1 X127.61 Y116.104 E.0213
G1 X141.896 Y130.39 E.83752
G1 X141.896 Y130.903 E.0213
G1 X127.097 Y116.104 E.86765
G1 X126.583 Y116.104 E.0213
G1 X141.896 Y131.417 E.89777
G1 X141.896 Y131.931 E.0213
G1 X126.069 Y116.104 E.9279
G1 X125.555 Y116.104 E.0213
G1 X141.896 Y132.445 E.95803
G1 X141.896 Y132.959 E.0213
G1 X125.041 Y116.104 E.98815
G1 X124.527 Y116.104 E.0213
G1 X141.896 Y133.473 E1.01828
G1 X141.896 Y133.987 E.0213
G1 X124.013 Y116.104 E1.04841
G1 X123.499 Y116.104 E.0213
G1 X141.896 Y134.501 E1.07853
G1 X141.896 Y135.015 E.0213
G1 X122.985 Y116.104 E1.10866
G1 X122.472 Y116.104 E.0213
G1 X141.896 Y135.528 E1.13879
G1 X141.896 Y136.042 E.0213
G1 X121.958 Y116.104 E1.16891
G1 X121.444 Y116.104 E.0213
G1 X141.896 Y136.556 E1.19904
G1 X141.896 Y137.07 E.0213
G1 X120.93 Y116.104 E1.22917
G1 X120.416 Y116.104 E.0213
G1 X141.896 Y137.584 E1.25929
G1 X141.896 Y138.098 E.0213
G1 X119.902 Y116.104 E1.28942
G1 X119.388 Y116.104 E.0213
G1 X141.896 Y138.612 E1.31955
G1 X141.896 Y139.126 E.0213
G1 X118.874 Y116.104 E1.34968
G1 X118.361 Y116.104 E.0213
G1 X141.896 Y139.639 E1.3798
G1 X141.896 Y139.896 E.01065
G1 X141.639 Y139.896 E.01065
G1 X118.104 Y116.361 E1.3798
G1 X118.104 Y116.874 E.0213
G1 X141.126 Y139.896 E1.34967
G1 X140.612 Y139.896 E.0213
G1 X118.104 Y117.388 E1.31955
G1 X118.104 Y117.902 E.0213
G1 X140.098 Y139.896 E1.28942
G1 X139.584 Y139.896 E.0213
G1 X118.104 Y118.416 E1.25929
G1 X118.104 Y118.93 E.0213
M73 P95 R0
G1 X139.07 Y139.896 E1.22917
G1 X138.556 Y139.896 E.0213
G1 X118.104 Y119.444 E1.19904
G1 X118.104 Y119.958 E.0213
G1 X138.042 Y139.896 E1.16891
G1 X137.528 Y139.896 E.0213
G1 X118.104 Y120.472 E1.13879
G1 X118.104 Y120.986 E.0213
G1 X137.014 Y139.896 E1.10866
G1 X136.501 Y139.896 E.0213
G1 X118.104 Y121.499 E1.07853
G1 X118.104 Y122.013 E.0213
G1 X135.987 Y139.896 E1.0484
G1 X135.473 Y139.896 E.0213
G1 X118.104 Y122.527 E1.01828
G1 X118.104 Y123.041 E.0213
G1 X134.959 Y139.896 E.98815
G1 X134.445 Y139.896 E.0213
G1 X118.104 Y123.555 E.95802
G1 X118.104 Y124.069 E.0213
G1 X133.931 Y139.896 E.9279
G1 X133.417 Y139.896 E.0213
G1 X118.104 Y124.583 E.89777
G1 X118.104 Y125.097 E.0213
G1 X132.903 Y139.896 E.86764
G1 X132.389 Y139.896 E.0213
G1 X118.104 Y125.611 E.83752
G1 X118.104 Y126.124 E.0213
G1 X131.876 Y139.896 E.80739
G1 X131.362 Y139.896 E.0213
G1 X118.104 Y126.638 E.77726
G1 X118.104 Y127.152 E.0213
G1 X130.848 Y139.896 E.74714
G1 X130.334 Y139.896 E.0213
G1 X118.104 Y127.666 E.71701
G1 X118.104 Y128.18 E.0213
G1 X129.82 Y139.896 E.68688
G1 X129.306 Y139.896 E.0213
G1 X118.104 Y128.694 E.65676
G1 X118.104 Y129.208 E.0213
G1 X128.792 Y139.896 E.62663
G1 X128.278 Y139.896 E.0213
G1 X118.104 Y129.722 E.5965
G1 X118.104 Y130.235 E.0213
G1 X127.765 Y139.896 E.56638
G1 X127.251 Y139.896 E.0213
G1 X118.104 Y130.749 E.53625
G1 X118.104 Y131.263 E.0213
G1 X126.737 Y139.896 E.50612
G1 X126.223 Y139.896 E.0213
G1 X118.104 Y131.777 E.47599
G1 X118.104 Y132.291 E.0213
G1 X125.709 Y139.896 E.44587
G1 X125.195 Y139.896 E.0213
G1 X118.104 Y132.805 E.41574
G1 X118.104 Y133.319 E.0213
G1 X124.681 Y139.896 E.38561
G1 X124.167 Y139.896 E.0213
G1 X118.104 Y133.833 E.35549
G1 X118.104 Y134.347 E.0213
G1 X123.653 Y139.896 E.32536
G1 X123.14 Y139.896 E.0213
G1 X118.104 Y134.86 E.29523
G1 X118.104 Y135.374 E.0213
G1 X122.626 Y139.896 E.26511
G1 X122.112 Y139.896 E.0213
G1 X118.104 Y135.888 E.23498
G1 X118.104 Y136.402 E.0213
G1 X121.598 Y139.896 E.20485
G1 X121.084 Y139.896 E.0213
G1 X118.104 Y136.916 E.17473
G1 X118.104 Y137.43 E.0213
G1 X120.57 Y139.896 E.1446
G1 X120.056 Y139.896 E.0213
G1 X118.104 Y137.944 E.11447
G1 X118.104 Y138.458 E.0213
G1 X119.542 Y139.896 E.08435
G1 X119.028 Y139.896 E.0213
G1 X118.104 Y138.972 E.05422
G1 X118.104 Y139.485 E.0213
G1 X118.676 Y140.058 E.03359
; CHANGE_LAYER
; Z_HEIGHT: 25.68
; LAYER_HEIGHT: 0.280001
; WIPE_START
G1 F24000
G1 X118.104 Y139.485 E-.30789
G1 X118.104 Y138.972 E-.19528
G1 X118.582 Y139.449 E-.25684
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 92/92
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L92
M991 S0 P91 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z25.8 I-.058 J1.216 P1  F30000
G1 X142.59 Y140.59 Z25.8
G1 Z25.68
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X117.41 Y140.59 E1.03388
G1 X117.41 Y115.41 E1.03388
G1 X142.59 Y115.41 E1.03388
G1 X142.59 Y140.53 E1.03142
M204 S10000
G1 X142.391 Y139.596 F30000
M204 S2000
; FEATURE: Top surface
; LINE_WIDTH: 0.45
G1 F11541.081
G1 X141.596 Y140.391 E.04998
G1 X141.045 Y140.391
G1 X142.391 Y139.045 E.08467
G1 X142.391 Y138.493
G1 X140.493 Y140.391 E.11936
G1 X139.942 Y140.391
G1 X142.391 Y137.942 E.15404
G1 X142.391 Y137.39
G1 X139.39 Y140.391 E.18873
G1 X138.839 Y140.391
G1 X142.391 Y136.839 E.22342
G1 X142.391 Y136.288
G1 X138.288 Y140.391 E.25811
G1 X137.736 Y140.391
G1 X142.391 Y135.736 E.2928
G1 X142.391 Y135.185
G1 X137.185 Y140.391 E.32748
G1 X136.633 Y140.391
G1 X142.391 Y134.633 E.36217
G1 X142.391 Y134.082
G1 X136.082 Y140.391 E.39686
G1 X135.53 Y140.391
G1 X142.391 Y133.53 E.43155
G1 X142.391 Y132.979
G1 X134.979 Y140.391 E.46624
G1 X134.428 Y140.391
G1 X142.391 Y132.428 E.50092
G1 X142.391 Y131.876
G1 X133.876 Y140.391 E.53561
G1 X133.325 Y140.391
G1 X142.391 Y131.325 E.5703
G1 X142.391 Y130.773
G1 X132.773 Y140.391 E.60499
G1 X132.222 Y140.391
G1 X142.391 Y130.222 E.63968
G1 X142.391 Y129.671
G1 X131.671 Y140.391 E.67437
G1 X131.119 Y140.391
G1 X142.391 Y129.119 E.70905
M73 P96 R0
G1 X142.391 Y128.568
G1 X130.568 Y140.391 E.74374
G1 X130.016 Y140.391
G1 X142.391 Y128.016 E.77843
G1 X142.391 Y127.465
G1 X129.465 Y140.391 E.81312
G1 X128.913 Y140.391
G1 X142.391 Y126.913 E.84781
G1 X142.391 Y126.362
G1 X128.362 Y140.391 E.88249
G1 X127.811 Y140.391
G1 X142.391 Y125.811 E.91718
G1 X142.391 Y125.259
G1 X127.259 Y140.391 E.95187
G1 X126.708 Y140.391
G1 X142.391 Y124.708 E.98656
G1 X142.391 Y124.156
G1 X126.156 Y140.391 E1.02125
G1 X125.605 Y140.391
G1 X142.391 Y123.605 E1.05593
G1 X142.391 Y123.054
G1 X125.054 Y140.391 E1.09062
G1 X124.502 Y140.391
G1 X142.391 Y122.502 E1.12531
G1 X142.391 Y121.951
G1 X123.951 Y140.391 E1.16
G1 X123.399 Y140.391
G1 X142.391 Y121.399 E1.19469
G1 X142.391 Y120.848
G1 X122.848 Y140.391 E1.22937
G1 X122.296 Y140.391
G1 X142.391 Y120.296 E1.26406
G1 X142.391 Y119.745
G1 X121.745 Y140.391 E1.29875
G1 X121.194 Y140.391
G1 X142.391 Y119.194 E1.33344
G1 X142.391 Y118.642
G1 X120.642 Y140.391 E1.36813
G1 X120.091 Y140.391
G1 X142.391 Y118.091 E1.40281
G1 X142.391 Y117.539
G1 X119.539 Y140.391 E1.4375
G1 X118.988 Y140.391
G1 X142.391 Y116.988 E1.47219
G1 X142.391 Y116.437
G1 X118.437 Y140.391 E1.50688
G1 X117.885 Y140.391
G1 X142.391 Y115.885 E1.54157
G1 X142.115 Y115.609
G1 X117.609 Y140.115 E1.54156
G1 X117.609 Y139.563
G1 X141.563 Y115.609 E1.50687
G1 X141.012 Y115.609
G1 X117.609 Y139.012 E1.47218
G1 X117.609 Y138.461
G1 X140.461 Y115.609 E1.43749
G1 X139.909 Y115.609
G1 X117.609 Y137.909 E1.4028
G1 X117.609 Y137.358
G1 X139.358 Y115.609 E1.36812
G1 X138.806 Y115.609
G1 X117.609 Y136.806 E1.33343
G1 X117.609 Y136.255
G1 X138.255 Y115.609 E1.29874
G1 X137.703 Y115.609
G1 X117.609 Y135.703 E1.26405
G1 X117.609 Y135.152
G1 X137.152 Y115.609 E1.22936
G1 X136.601 Y115.609
G1 X117.609 Y134.601 E1.19468
G1 X117.609 Y134.049
G1 X136.049 Y115.609 E1.15999
G1 X135.498 Y115.609
G1 X117.609 Y133.498 E1.1253
G1 X117.609 Y132.946
G1 X134.946 Y115.609 E1.09061
G1 X134.395 Y115.609
G1 X117.609 Y132.395 E1.05592
G1 X117.609 Y131.844
G1 X133.844 Y115.609 E1.02124
G1 X133.292 Y115.609
G1 X117.609 Y131.292 E.98655
G1 X117.609 Y130.741
G1 X132.741 Y115.609 E.95186
G1 X132.189 Y115.609
G1 X117.609 Y130.189 E.91717
G1 X117.609 Y129.638
G1 X131.638 Y115.609 E.88248
G1 X131.086 Y115.609
G1 X117.609 Y129.086 E.8478
G1 X117.609 Y128.535
G1 X130.535 Y115.609 E.81311
G1 X129.984 Y115.609
G1 X117.609 Y127.984 E.77842
G1 X117.609 Y127.432
G1 X129.432 Y115.609 E.74373
G1 X128.881 Y115.609
G1 X117.609 Y126.881 E.70904
G1 X117.609 Y126.329
G1 X128.329 Y115.609 E.67436
G1 X127.778 Y115.609
G1 X117.609 Y125.778 E.63967
G1 X117.609 Y125.227
G1 X127.227 Y115.609 E.60498
G1 X126.675 Y115.609
G1 X117.609 Y124.675 E.57029
G1 X117.609 Y124.124
G1 X126.124 Y115.609 E.5356
G1 X125.572 Y115.609
G1 X117.609 Y123.572 E.50092
G1 X117.609 Y123.021
G1 X125.021 Y115.609 E.46623
G1 X124.469 Y115.609
G1 X117.609 Y122.469 E.43154
G1 X117.609 Y121.918
G1 X123.918 Y115.609 E.39685
G1 X123.367 Y115.609
G1 X117.609 Y121.367 E.36216
G1 X117.609 Y120.815
G1 X122.815 Y115.609 E.32748
M73 P97 R0
G1 X122.264 Y115.609
G1 X117.609 Y120.264 E.29279
G1 X117.609 Y119.712
G1 X121.712 Y115.609 E.2581
G1 X121.161 Y115.609
G1 X117.609 Y119.161 E.22341
G1 X117.609 Y118.609
G1 X120.609 Y115.609 E.18872
G1 X120.058 Y115.609
G1 X117.609 Y118.058 E.15404
G1 X117.609 Y117.507
G1 X119.507 Y115.609 E.11935
G1 X118.955 Y115.609
G1 X117.609 Y116.955 E.08466
G1 X117.609 Y116.404
G1 X118.404 Y115.609 E.04997
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X117.609 Y116.404 E-.4269
G1 X117.609 Y116.955 E-.20954
G1 X117.839 Y116.725 E-.12356
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
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
G1 Z26.18 F900 ; lower z a little
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

    G1 Z125.68 F600
    G1 Z123.68

M400 P100
M17 R ; restore z current

G90
G1 X128 Y250 F3600

M220 S100  ; Reset feedrate magnitude
M201.2 K1.0 ; Reset acc magnitude
M73.2   R1.0 ;Reset left time magnitude
M1002 set_gcode_claim_speed_level : 0

M17 X0.8 Y0.8 Z0.5 ; lower motor current to 45% power
M73 P100 R0
; EXECUTABLE_BLOCK_END

