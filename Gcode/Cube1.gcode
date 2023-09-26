; HEADER_BLOCK_START
; BambuStudio 01.07.04.52
; model printing time: 11m 39s; total estimated time: 18m 25s
; total layer number: 128
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
; gap_infill_speed = 250
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
; inner_wall_speed = 300
; interface_shells = 0
; internal_bridge_support_thickness = 0.8
; internal_solid_infill_line_width = 0.42
; internal_solid_infill_pattern = zig-zag
; internal_solid_infill_speed = 250
; ironing_flow = 10%
; ironing_pattern = zig-zag
; ironing_spacing = 0.15
; ironing_speed = 30
; ironing_type = no ironing
; layer_change_gcode = ; layer num/total_layer_count: {layer_num+1}/[total_layer_count]\nM622.1 S1 ; for prev firware, default turned on\nM1002 judge_flag timelapse_record_flag\nM622 J1\n{if timelapse_type == 0} ; timelapse without wipe tower\nM971 S11 C10 O0\n{elsif timelapse_type == 1} ; timelapse with wipe tower\nG92 E0\nG1 E-[retraction_length] F1800\nG17\nG2 Z{layer_z + 0.4} I0.86 J0.86 P1 F20000 ; spiral lift a little\nG1 X65 Y245 F20000 ; move to safe pos\nG17\nG2 Z{layer_z} I0.86 J0.86 P1 F20000\nG1 Y265 F3000\nM400 P300\nM971 S11 C10 O0\nG92 E0\nG1 E[retraction_length] F300\nG1 X100 F5000\nG1 Y255 F20000\n{endif}\nM623\n; update layer progress\nM73 L{layer_num+1}\nM991 S0 P{layer_num} ;notify layer change
; layer_height = 0.2
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
; print_settings_id = 0.20mm Standard @BBL X1C
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
; sparse_infill_speed = 270
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
; support_threshold_angle = 30
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
; top_surface_line_width = 0.42
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
M73 P0 R18
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
M73 P23 R14
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
M73 P24 R14
G1 E50 F200
M400
M106 P1 S255
G92 E0
M73 P24 R13
G1 E5 F300
M109 S200 ; drop nozzle temp, make filament shink a bit
G92 E0
M73 P25 R13
G1 E-0.5 F300

M73 P26 R13
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
M73 P27 R13
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
M73 P28 R13
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
    G1 X65.000 E1.24726 F1508.32
    G1 X70.000 E0.31181 F1508.32
    G1 X75.000 E0.31181 F6033.27
    G1 X80.000 E0.31181 F1508.32
    G1 X85.000 E0.31181 F6033.27
M73 P29 R13
    G1 X90.000 E0.31181 F1508.32
    G1 X95.000 E0.31181 F6033.27
    G1 X100.000 E0.31181 F1508.32
    G1 X105.000 E0.31181 F6033.27
    G1 X110.000 E0.31181 F1508.32
    G1 X115.000 E0.31181 F6033.27
M73 P29 R12
    G1 X120.000 E0.31181 F1508.32
    G1 X125.000 E0.31181 F6033.27
    G1 X130.000 E0.31181 F1508.32
    G1 X135.000 E0.31181 F6033.27
    G1 X140.000 E0.31181 F1508.32
M73 P30 R12
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
M73 P31 R12
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
M73 P32 R12
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
; filament start gcode
M106 P3 S150
M981 S1 P20000 ;open spaghetti detector
; CHANGE_LAYER
; Z_HEIGHT: 0.2
; LAYER_HEIGHT: 0.2
G1 E-.8 F1800
; layer num/total_layer_count: 1/128
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
M73 P33 R12
G1 X141.554 Y120.244 E.02469
G1 X137.756 Y116.446 E.20259
G1 X137.102 Y116.446 E.02469
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
M73 P35 R11
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
M73 P36 R11
G1 X139.918 Y139.554 E.02469
G1 X118.446 Y118.082 E1.14538
G1 X118.446 Y118.737 E.02469
G1 X139.263 Y139.554 E1.11046
G1 X138.609 Y139.554 E.02469
G1 X118.446 Y119.391 E1.07554
G1 X118.446 Y120.046 E.02469
G1 X137.954 Y139.554 E1.04062
G1 X137.299 Y139.554 E.02469
G1 X118.446 Y120.701 E1.00571
G1 X118.446 Y121.355 E.02469
G1 X136.645 Y139.554 E.97079
G1 X135.99 Y139.554 E.02469
G1 X118.446 Y122.01 E.93587
G1 X118.446 Y122.664 E.02469
G1 X135.336 Y139.554 E.90095
G1 X134.681 Y139.554 E.02469
G1 X118.446 Y123.319 E.86603
G1 X118.446 Y123.974 E.02469
G1 X134.026 Y139.554 E.83111
G1 X133.372 Y139.554 E.02469
M73 P37 R11
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
G1 X118.24 Y138.824 E.03896
; CHANGE_LAYER
; Z_HEIGHT: 0.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.97 Y139.554 E-.39255
G1 X119.625 Y139.554 E-.24875
G1 X119.404 Y139.334 E-.11869
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 2/128
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
G1 X127.031 Y139.623 Z.6 F30000
G1 X142.198 Y140.198 Z.6
G1 Z.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
M73 P38 R11
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.268 Y140.034 Z.8 F30000
G1 Z.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421715
G1 F15000
G1 X141.865 Y139.438 E.02603
G1 X141.865 Y138.902 E.01654
G1 X140.902 Y139.865 E.042
G1 X140.367 Y139.865 E.01654
G1 X141.865 Y138.367 E.06539
G1 X141.865 Y137.831 E.01654
G1 X139.831 Y139.865 E.08877
G1 X139.295 Y139.865 E.01654
G1 X141.865 Y137.295 E.11216
G1 X141.865 Y136.76 E.01654
G1 X138.76 Y139.865 E.13554
G1 X138.224 Y139.865 E.01654
G1 X141.865 Y136.224 E.15893
G1 X141.865 Y135.688 E.01654
G1 X137.688 Y139.865 E.18231
G1 X137.153 Y139.865 E.01654
G1 X141.865 Y135.153 E.2057
G1 X141.865 Y134.617 E.01654
G1 X136.617 Y139.865 E.22908
G1 X136.081 Y139.865 E.01654
G1 X141.865 Y134.081 E.25246
G1 X141.865 Y133.545 E.01654
G1 X135.545 Y139.865 E.27585
G1 X135.01 Y139.865 E.01654
G1 X141.865 Y133.01 E.29923
G1 X141.865 Y132.474 E.01654
G1 X134.474 Y139.865 E.32262
G1 X133.938 Y139.865 E.01654
G1 X141.865 Y131.938 E.346
G1 X141.865 Y131.403 E.01654
G1 X133.403 Y139.865 E.36939
G1 X132.867 Y139.865 E.01654
G1 X141.865 Y130.867 E.39277
G1 X141.865 Y130.331 E.01654
G1 X132.331 Y139.865 E.41616
G1 X131.796 Y139.865 E.01654
G1 X141.865 Y129.796 E.43954
G1 X141.865 Y129.26 E.01654
G1 X131.26 Y139.865 E.46293
G1 X130.724 Y139.865 E.01654
G1 X141.865 Y128.724 E.48631
G1 X141.865 Y128.188 E.01654
G1 X130.188 Y139.865 E.50969
G1 X129.653 Y139.865 E.01654
G1 X141.865 Y127.653 E.53308
M73 P39 R11
G1 X141.865 Y127.117 E.01654
G1 X129.117 Y139.865 E.55646
G1 X128.581 Y139.865 E.01654
G1 X141.865 Y126.581 E.57985
G1 X141.865 Y126.046 E.01654
G1 X128.046 Y139.865 E.60323
G1 X127.51 Y139.865 E.01654
G1 X141.865 Y125.51 E.62662
G1 X141.865 Y124.974 E.01654
G1 X126.974 Y139.865 E.65
G1 X126.439 Y139.865 E.01654
G1 X141.865 Y124.439 E.67339
G1 X141.865 Y123.903 E.01654
G1 X125.903 Y139.865 E.69677
G1 X125.367 Y139.865 E.01654
G1 X141.865 Y123.367 E.72016
G1 X141.865 Y122.832 E.01654
G1 X124.832 Y139.865 E.74354
G1 X124.296 Y139.865 E.01654
G1 X141.865 Y122.296 E.76692
G1 X141.865 Y121.76 E.01654
G1 X123.76 Y139.865 E.79031
G1 X123.224 Y139.865 E.01654
G1 X141.865 Y121.224 E.81369
G1 X141.865 Y120.689 E.01654
G1 X122.689 Y139.865 E.83708
G1 X122.153 Y139.865 E.01654
G1 X141.865 Y120.153 E.86046
G1 X141.865 Y119.617 E.01654
G1 X121.617 Y139.865 E.88385
G1 X121.082 Y139.865 E.01654
G1 X141.865 Y119.082 E.90723
G1 X141.865 Y118.546 E.01654
G1 X120.546 Y139.865 E.93062
G1 X120.01 Y139.865 E.01654
G1 X141.865 Y118.01 E.954
G1 X141.865 Y117.475 E.01654
G1 X119.475 Y139.865 E.97739
G1 X118.939 Y139.865 E.01654
G1 X141.865 Y116.939 E1.00077
G1 X141.865 Y116.403 E.01654
G1 X118.403 Y139.865 E1.02415
G1 X118.135 Y139.865 E.00827
G1 X118.135 Y139.597 E.00827
G1 X141.597 Y116.135 E1.02415
G1 X141.061 Y116.135 E.01654
G1 X118.135 Y139.061 E1.00077
G1 X118.135 Y138.525 E.01654
G1 X140.525 Y116.135 E.97738
G1 X139.99 Y116.135 E.01654
G1 X118.135 Y137.99 E.954
G1 X118.135 Y137.454 E.01654
G1 X139.454 Y116.135 E.93061
G1 X138.918 Y116.135 E.01654
G1 X118.135 Y136.918 E.90723
G1 X118.135 Y136.383 E.01654
G1 X138.383 Y116.135 E.88384
G1 X137.847 Y116.135 E.01654
G1 X118.135 Y135.847 E.86046
G1 X118.135 Y135.311 E.01654
G1 X137.311 Y116.135 E.83707
G1 X136.775 Y116.135 E.01654
G1 X118.135 Y134.775 E.81369
G1 X118.135 Y134.24 E.01654
G1 X136.24 Y116.135 E.7903
G1 X135.704 Y116.135 E.01654
G1 X118.135 Y133.704 E.76692
G1 X118.135 Y133.168 E.01654
G1 X135.168 Y116.135 E.74354
G1 X134.633 Y116.135 E.01654
G1 X118.135 Y132.633 E.72015
G1 X118.135 Y132.097 E.01654
G1 X134.097 Y116.135 E.69677
G1 X133.561 Y116.135 E.01654
G1 X118.135 Y131.561 E.67338
G1 X118.135 Y131.026 E.01654
G1 X133.026 Y116.135 E.65
G1 X132.49 Y116.135 E.01654
G1 X118.135 Y130.49 E.62661
G1 X118.135 Y129.954 E.01654
G1 X131.954 Y116.135 E.60323
G1 X131.419 Y116.135 E.01654
G1 X118.135 Y129.419 E.57984
G1 X118.135 Y128.883 E.01654
G1 X130.883 Y116.135 E.55646
G1 X130.347 Y116.135 E.01654
G1 X118.135 Y128.347 E.53308
G1 X118.135 Y127.811 E.01654
G1 X129.811 Y116.135 E.50969
G1 X129.276 Y116.135 E.01654
G1 X118.135 Y127.276 E.48631
G1 X118.135 Y126.74 E.01654
G1 X128.74 Y116.135 E.46292
G1 X128.204 Y116.135 E.01654
G1 X118.135 Y126.204 E.43954
G1 X118.135 Y125.669 E.01654
G1 X127.669 Y116.135 E.41615
G1 X127.133 Y116.135 E.01654
G1 X118.135 Y125.133 E.39277
G1 X118.135 Y124.597 E.01654
G1 X126.597 Y116.135 E.36938
G1 X126.062 Y116.135 E.01654
G1 X118.135 Y124.062 E.346
G1 X118.135 Y123.526 E.01654
G1 X125.526 Y116.135 E.32261
G1 X124.99 Y116.135 E.01654
G1 X118.135 Y122.99 E.29923
G1 X118.135 Y122.454 E.01654
G1 X124.454 Y116.135 E.27585
G1 X123.919 Y116.135 E.01654
G1 X118.135 Y121.919 E.25246
G1 X118.135 Y121.383 E.01654
G1 X123.383 Y116.135 E.22908
G1 X122.847 Y116.135 E.01654
G1 X118.135 Y120.847 E.20569
G1 X118.135 Y120.312 E.01654
G1 X122.312 Y116.135 E.18231
G1 X121.776 Y116.135 E.01654
G1 X118.135 Y119.776 E.15892
G1 X118.135 Y119.24 E.01654
G1 X121.24 Y116.135 E.13554
G1 X120.705 Y116.135 E.01654
G1 X118.135 Y118.705 E.11215
G1 X118.135 Y118.169 E.01654
G1 X120.169 Y116.135 E.08877
G1 X119.633 Y116.135 E.01654
G1 X118.135 Y117.633 E.06538
G1 X118.135 Y117.097 E.01654
G1 X119.097 Y116.135 E.042
G1 X118.562 Y116.135 E.01654
G1 X117.966 Y116.731 E.02602
; CHANGE_LAYER
; Z_HEIGHT: 0.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.562 Y116.135 E-.32036
G1 X119.097 Y116.135 E-.20356
G1 X118.658 Y116.575 E-.23607
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 3/128
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
G3 Z.8 I-.862 J.859 P1  F30000
G1 X142.198 Y140.198 Z.8
G1 Z.6
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.052 Y132.916 Z1 F30000
G1 X142.034 Y116.732 Z1
G1 Z.6
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421715
G1 F15000
G1 X141.438 Y116.135 E.02603
G1 X140.902 Y116.135 E.01654
G1 X141.865 Y117.098 E.042
G1 X141.865 Y117.633 E.01654
M73 P40 R11
G1 X140.367 Y116.135 E.06539
G1 X139.831 Y116.135 E.01654
G1 X141.865 Y118.169 E.08877
G1 X141.865 Y118.705 E.01654
G1 X139.295 Y116.135 E.11216
G1 X138.76 Y116.135 E.01654
G1 X141.865 Y119.24 E.13554
G1 X141.865 Y119.776 E.01654
G1 X138.224 Y116.135 E.15893
G1 X137.688 Y116.135 E.01654
G1 X141.865 Y120.312 E.18231
G1 X141.865 Y120.847 E.01654
G1 X137.153 Y116.135 E.2057
G1 X136.617 Y116.135 E.01654
G1 X141.865 Y121.383 E.22908
G1 X141.865 Y121.919 E.01654
G1 X136.081 Y116.135 E.25246
G1 X135.545 Y116.135 E.01654
G1 X141.865 Y122.455 E.27585
G1 X141.865 Y122.99 E.01654
G1 X135.01 Y116.135 E.29923
G1 X134.474 Y116.135 E.01654
G1 X141.865 Y123.526 E.32262
G1 X141.865 Y124.062 E.01654
G1 X133.938 Y116.135 E.346
G1 X133.403 Y116.135 E.01654
G1 X141.865 Y124.597 E.36939
G1 X141.865 Y125.133 E.01654
G1 X132.867 Y116.135 E.39277
G1 X132.331 Y116.135 E.01654
G1 X141.865 Y125.669 E.41616
G1 X141.865 Y126.204 E.01654
G1 X131.796 Y116.135 E.43954
G1 X131.26 Y116.135 E.01654
G1 X141.865 Y126.74 E.46293
G1 X141.865 Y127.276 E.01654
G1 X130.724 Y116.135 E.48631
G1 X130.188 Y116.135 E.01654
G1 X141.865 Y127.812 E.50969
G1 X141.865 Y128.347 E.01654
G1 X129.653 Y116.135 E.53308
G1 X129.117 Y116.135 E.01654
G1 X141.865 Y128.883 E.55646
G1 X141.865 Y129.419 E.01654
G1 X128.581 Y116.135 E.57985
G1 X128.046 Y116.135 E.01654
G1 X141.865 Y129.954 E.60323
G1 X141.865 Y130.49 E.01654
G1 X127.51 Y116.135 E.62662
G1 X126.974 Y116.135 E.01654
G1 X141.865 Y131.026 E.65
G1 X141.865 Y131.561 E.01654
G1 X126.439 Y116.135 E.67339
G1 X125.903 Y116.135 E.01654
G1 X141.865 Y132.097 E.69677
G1 X141.865 Y132.633 E.01654
G1 X125.367 Y116.135 E.72016
G1 X124.832 Y116.135 E.01654
G1 X141.865 Y133.168 E.74354
G1 X141.865 Y133.704 E.01654
G1 X124.296 Y116.135 E.76692
G1 X123.76 Y116.135 E.01654
G1 X141.865 Y134.24 E.79031
G1 X141.865 Y134.776 E.01654
G1 X123.224 Y116.135 E.81369
G1 X122.689 Y116.135 E.01654
G1 X141.865 Y135.311 E.83708
G1 X141.865 Y135.847 E.01654
G1 X122.153 Y116.135 E.86046
G1 X121.617 Y116.135 E.01654
G1 X141.865 Y136.383 E.88385
G1 X141.865 Y136.918 E.01654
G1 X121.082 Y116.135 E.90723
G1 X120.546 Y116.135 E.01654
G1 X141.865 Y137.454 E.93062
G1 X141.865 Y137.99 E.01654
G1 X120.01 Y116.135 E.954
G1 X119.475 Y116.135 E.01654
G1 X141.865 Y138.525 E.97739
G1 X141.865 Y139.061 E.01654
G1 X118.939 Y116.135 E1.00077
G1 X118.403 Y116.135 E.01654
G1 X141.865 Y139.597 E1.02415
G1 X141.865 Y139.865 E.00827
M73 P40 R10
G1 X141.597 Y139.865 E.00827
G1 X118.135 Y116.403 E1.02415
G1 X118.135 Y116.939 E.01654
G1 X141.061 Y139.865 E1.00077
G1 X140.525 Y139.865 E.01654
G1 X118.135 Y117.475 E.97738
G1 X118.135 Y118.01 E.01654
G1 X139.99 Y139.865 E.954
G1 X139.454 Y139.865 E.01654
G1 X118.135 Y118.546 E.93061
G1 X118.135 Y119.082 E.01654
G1 X138.918 Y139.865 E.90723
G1 X138.383 Y139.865 E.01654
G1 X118.135 Y119.617 E.88384
G1 X118.135 Y120.153 E.01654
G1 X137.847 Y139.865 E.86046
G1 X137.311 Y139.865 E.01654
G1 X118.135 Y120.689 E.83707
G1 X118.135 Y121.225 E.01654
G1 X136.775 Y139.865 E.81369
G1 X136.24 Y139.865 E.01654
G1 X118.135 Y121.76 E.7903
G1 X118.135 Y122.296 E.01654
G1 X135.704 Y139.865 E.76692
G1 X135.168 Y139.865 E.01654
G1 X118.135 Y122.832 E.74354
G1 X118.135 Y123.367 E.01654
G1 X134.633 Y139.865 E.72015
G1 X134.097 Y139.865 E.01654
G1 X118.135 Y123.903 E.69677
G1 X118.135 Y124.439 E.01654
G1 X133.561 Y139.865 E.67338
G1 X133.026 Y139.865 E.01654
G1 X118.135 Y124.974 E.65
G1 X118.135 Y125.51 E.01654
G1 X132.49 Y139.865 E.62661
G1 X131.954 Y139.865 E.01654
G1 X118.135 Y126.046 E.60323
G1 X118.135 Y126.581 E.01654
G1 X131.419 Y139.865 E.57984
G1 X130.883 Y139.865 E.01654
G1 X118.135 Y127.117 E.55646
G1 X118.135 Y127.653 E.01654
G1 X130.347 Y139.865 E.53308
G1 X129.811 Y139.865 E.01654
G1 X118.135 Y128.189 E.50969
G1 X118.135 Y128.724 E.01654
G1 X129.276 Y139.865 E.48631
G1 X128.74 Y139.865 E.01654
G1 X118.135 Y129.26 E.46292
G1 X118.135 Y129.796 E.01654
G1 X128.204 Y139.865 E.43954
G1 X127.669 Y139.865 E.01654
G1 X118.135 Y130.331 E.41615
G1 X118.135 Y130.867 E.01654
G1 X127.133 Y139.865 E.39277
G1 X126.597 Y139.865 E.01654
G1 X118.135 Y131.403 E.36938
G1 X118.135 Y131.938 E.01654
G1 X126.062 Y139.865 E.346
G1 X125.526 Y139.865 E.01654
G1 X118.135 Y132.474 E.32261
G1 X118.135 Y133.01 E.01654
G1 X124.99 Y139.865 E.29923
G1 X124.454 Y139.865 E.01654
G1 X118.135 Y133.546 E.27585
G1 X118.135 Y134.081 E.01654
G1 X123.919 Y139.865 E.25246
G1 X123.383 Y139.865 E.01654
G1 X118.135 Y134.617 E.22908
G1 X118.135 Y135.153 E.01654
G1 X122.847 Y139.865 E.20569
G1 X122.312 Y139.865 E.01654
G1 X118.135 Y135.688 E.18231
G1 X118.135 Y136.224 E.01654
G1 X121.776 Y139.865 E.15892
G1 X121.24 Y139.865 E.01654
G1 X118.135 Y136.76 E.13554
G1 X118.135 Y137.295 E.01654
G1 X120.705 Y139.865 E.11215
G1 X120.169 Y139.865 E.01654
G1 X118.135 Y137.831 E.08877
G1 X118.135 Y138.367 E.01654
G1 X119.633 Y139.865 E.06538
G1 X119.097 Y139.865 E.01654
G1 X118.135 Y138.903 E.042
G1 X118.135 Y139.438 E.01654
G1 X118.731 Y140.034 E.02602
; CHANGE_LAYER
; Z_HEIGHT: 0.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X118.135 Y139.438 E-.32036
G1 X118.135 Y138.903 E-.20356
G1 X118.575 Y139.342 E-.23607
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 4/128
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
G3 Z1 I-.044 J1.216 P1  F30000
G1 X142.198 Y140.198 Z1
G1 Z.8
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F6954
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6954
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z1.2 F30000
G1 X139.55 Y116.15 Z1.2
G1 Z.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6954
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
M73 P41 R10
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6954
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 5/128
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
G3 Z1.2 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z1.2
G1 Z1
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z1.4 F30000
G1 Z1
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 6/128
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
G3 Z1.4 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z1.4
G1 Z1.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z1.6 F30000
G1 X139.55 Y116.15 Z1.6
G1 Z1.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 7/128
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
G3 Z1.6 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z1.6
G1 Z1.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z1.8 F30000
G1 Z1.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
M73 P42 R10
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 8/128
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
G3 Z1.8 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z1.8
G1 Z1.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z2 F30000
G1 X139.55 Y116.15 Z2
G1 Z1.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 1.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 9/128
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
G3 Z2 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z2
G1 Z1.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z2.2 F30000
G1 Z1.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
M73 P43 R10
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 10/128
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
G3 Z2.2 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z2.2
G1 Z2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z2.4 F30000
G1 X139.55 Y116.15 Z2.4
G1 Z2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 11/128
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
G3 Z2.4 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z2.4
G1 Z2.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z2.6 F30000
G1 Z2.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 12/128
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
G3 Z2.6 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z2.6
M73 P44 R10
G1 Z2.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z2.8 F30000
G1 X139.55 Y116.15 Z2.8
G1 Z2.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 13/128
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
G3 Z2.8 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z2.8
G1 Z2.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z3 F30000
G1 Z2.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 2.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 14/128
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
G3 Z3 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z3
G1 Z2.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z3.2 F30000
G1 X139.55 Y116.15 Z3.2
G1 Z2.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
M73 P45 R10
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 15/128
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
G3 Z3.2 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z3.2
G1 Z3
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z3.4 F30000
G1 Z3
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 16/128
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
G3 Z3.4 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z3.4
G1 Z3.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
M73 P45 R9
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z3.6 F30000
G1 X139.55 Y116.15 Z3.6
G1 Z3.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
M73 P46 R9
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 17/128
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
G3 Z3.6 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z3.6
G1 Z3.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z3.8 F30000
G1 Z3.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 18/128
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
G3 Z3.8 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z3.8
G1 Z3.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z4 F30000
G1 X139.55 Y116.15 Z4
G1 Z3.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 3.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 19/128
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
G3 Z4 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z4
G1 Z3.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
M73 P47 R9
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z4.2 F30000
G1 Z3.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 20/128
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
G3 Z4.2 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z4.2
G1 Z4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z4.4 F30000
G1 X139.55 Y116.15 Z4.4
G1 Z4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 21/128
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
G3 Z4.4 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z4.4
G1 Z4.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z4.6 F30000
G1 Z4.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
M73 P48 R9
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 22/128
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
G3 Z4.6 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z4.6
G1 Z4.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z4.8 F30000
G1 X139.55 Y116.15 Z4.8
G1 Z4.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 23/128
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
G3 Z4.8 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z4.8
G1 Z4.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z5 F30000
G1 Z4.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
M73 P49 R9
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 4.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 24/128
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
G3 Z5 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z5
G1 Z4.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z5.2 F30000
G1 X139.55 Y116.15 Z5.2
G1 Z4.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 25/128
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
G3 Z5.2 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z5.2
G1 Z5
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z5.4 F30000
G1 Z5
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 26/128
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
G3 Z5.4 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z5.4
G1 Z5.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
M73 P50 R9
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z5.6 F30000
G1 X139.55 Y116.15 Z5.6
G1 Z5.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 27/128
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
G3 Z5.6 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z5.6
G1 Z5.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z5.8 F30000
G1 Z5.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 28/128
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
G3 Z5.8 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z5.8
G1 Z5.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z6 F30000
G1 X139.55 Y116.15 Z6
G1 Z5.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
M73 P51 R9
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 5.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 29/128
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
M73 P51 R8
G3 Z6 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z6
G1 Z5.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z6.2 F30000
G1 Z5.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 30/128
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
G3 Z6.2 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z6.2
G1 Z6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z6.4 F30000
G1 X139.55 Y116.15 Z6.4
G1 Z6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.2
; LAYER_HEIGHT: 0.2
; WIPE_START
M73 P52 R8
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 31/128
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
G3 Z6.4 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z6.4
G1 Z6.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z6.6 F30000
G1 Z6.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 32/128
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
G3 Z6.6 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z6.6
G1 Z6.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z6.8 F30000
G1 X139.55 Y116.15 Z6.8
G1 Z6.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 33/128
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
G3 Z6.8 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z6.8
G1 Z6.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
M73 P53 R8
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z7 F30000
G1 Z6.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 6.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 34/128
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
G3 Z7 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z7
G1 Z6.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z7.2 F30000
G1 X139.55 Y116.15 Z7.2
G1 Z6.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 35/128
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
G3 Z7.2 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z7.2
G1 Z7
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z7.4 F30000
G1 Z7
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
M73 P54 R8
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 36/128
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
G3 Z7.4 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z7.4
G1 Z7.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z7.6 F30000
G1 X139.55 Y116.15 Z7.6
G1 Z7.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 37/128
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
G3 Z7.6 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z7.6
G1 Z7.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z7.8 F30000
G1 Z7.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.6
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
M73 P55 R8
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 38/128
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
G3 Z7.8 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z7.8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z8 F30000
G1 X139.55 Y116.15 Z8
G1 Z7.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 7.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 39/128
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
G3 Z8 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z8
G1 Z7.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z8.2 F30000
G1 Z7.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 40/128
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
G3 Z8.2 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z8.2
G1 Z8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
M73 P56 R8
G1 X140.265 Y132.909 Z8.4 F30000
G1 X139.55 Y116.15 Z8.4
G1 Z8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 41/128
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
G3 Z8.4 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z8.4
G1 Z8.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z8.6 F30000
G1 Z8.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
M73 P56 R7
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 42/128
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
G3 Z8.6 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z8.6
G1 Z8.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z8.8 F30000
G1 X139.55 Y116.15 Z8.8
G1 Z8.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
M73 P57 R7
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 43/128
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
G3 Z8.8 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z8.8
G1 Z8.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z9 F30000
G1 Z8.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 8.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 44/128
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
G3 Z9 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z9
G1 Z8.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z9.2 F30000
G1 X139.55 Y116.15 Z9.2
G1 Z8.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 45/128
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
M73 P58 R7
G3 Z9.2 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z9.2
G1 Z9
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z9.4 F30000
G1 Z9
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 46/128
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
G3 Z9.4 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z9.4
G1 Z9.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z9.6 F30000
G1 X139.55 Y116.15 Z9.6
G1 Z9.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 47/128
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
G3 Z9.6 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z9.6
G1 Z9.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z9.8 F30000
G1 Z9.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
M73 P59 R7
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 48/128
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
G3 Z9.8 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z9.8
G1 Z9.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z10 F30000
G1 X139.55 Y116.15 Z10
G1 Z9.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 9.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 49/128
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
G3 Z10 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z10
G1 Z9.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z10.2 F30000
G1 Z9.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
M73 P60 R7
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 50/128
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
G3 Z10.2 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z10.2
G1 Z10
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z10.4 F30000
G1 X139.55 Y116.15 Z10.4
G1 Z10
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 51/128
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
G3 Z10.4 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z10.4
G1 Z10.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z10.6 F30000
G1 Z10.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 52/128
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
G3 Z10.6 I-1.216 J.039 P1  F30000
M73 P61 R7
G1 X142.198 Y140.198 Z10.6
G1 Z10.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z10.8 F30000
G1 X139.55 Y116.15 Z10.8
G1 Z10.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 53/128
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
G3 Z10.8 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z10.8
G1 Z10.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z11 F30000
G1 Z10.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 10.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 54/128
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
G3 Z11 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z11
G1 Z10.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z11.2 F30000
G1 X139.55 Y116.15 Z11.2
G1 Z10.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
M73 P62 R7
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
M73 P62 R6
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 55/128
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
G3 Z11.2 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z11.2
G1 Z11
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z11.4 F30000
G1 Z11
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 56/128
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
G3 Z11.4 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z11.4
G1 Z11.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z11.6 F30000
G1 X139.55 Y116.15 Z11.6
G1 Z11.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
M73 P63 R6
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 57/128
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
G3 Z11.6 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z11.6
G1 Z11.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z11.8 F30000
G1 Z11.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 58/128
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
G3 Z11.8 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z11.8
G1 Z11.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z12 F30000
G1 X139.55 Y116.15 Z12
G1 Z11.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 11.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 59/128
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
G3 Z12 I-.947 J.764 P1  F30000
M73 P64 R6
G1 X142.198 Y140.198 Z12
G1 Z11.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z12.2 F30000
G1 Z11.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 60/128
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
G3 Z12.2 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z12.2
G1 Z12
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z12.4 F30000
G1 X139.55 Y116.15 Z12.4
G1 Z12
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 61/128
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
G3 Z12.4 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z12.4
G1 Z12.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z12.6 F30000
G1 Z12.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
M73 P65 R6
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 62/128
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
G3 Z12.6 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z12.6
G1 Z12.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z12.8 F30000
G1 X139.55 Y116.15 Z12.8
G1 Z12.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 63/128
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
G3 Z12.8 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z12.8
G1 Z12.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z13 F30000
G1 Z12.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
M73 P66 R6
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 12.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 64/128
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
G3 Z13 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z13
G1 Z12.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z13.2 F30000
G1 X139.55 Y116.15 Z13.2
G1 Z12.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 65/128
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
G3 Z13.2 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z13.2
G1 Z13
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z13.4 F30000
G1 Z13
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 66/128
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
G3 Z13.4 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z13.4
M73 P67 R6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z13.6 F30000
G1 X139.55 Y116.15 Z13.6
G1 Z13.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 67/128
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
G3 Z13.6 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z13.6
G1 Z13.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
M73 P67 R5
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z13.8 F30000
G1 Z13.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 68/128
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
G3 Z13.8 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z13.8
G1 Z13.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z14 F30000
G1 X139.55 Y116.15 Z14
G1 Z13.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
M73 P68 R5
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 13.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 69/128
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
G3 Z14 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z14
G1 Z13.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z14.2 F30000
G1 Z13.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 70/128
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
G3 Z14.2 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z14.2
G1 Z14
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z14.4 F30000
G1 X139.55 Y116.15 Z14.4
G1 Z14
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
M73 P69 R5
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 71/128
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
G3 Z14.4 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z14.4
G1 Z14.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z14.6 F30000
G1 Z14.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 72/128
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
G3 Z14.6 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z14.6
G1 Z14.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z14.8 F30000
G1 X139.55 Y116.15 Z14.8
G1 Z14.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 73/128
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
G3 Z14.8 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z14.8
G1 Z14.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
M73 P70 R5
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z15 F30000
G1 Z14.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 14.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 74/128
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
G3 Z15 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z15
G1 Z14.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z15.2 F30000
G1 X139.55 Y116.15 Z15.2
G1 Z14.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 75/128
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
G3 Z15.2 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z15.2
G1 Z15
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z15.4 F30000
G1 Z15
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
M73 P71 R5
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.2
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 76/128
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
G3 Z15.4 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z15.4
G1 Z15.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z15.6 F30000
G1 X139.55 Y116.15 Z15.6
G1 Z15.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.4
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 77/128
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
G3 Z15.6 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z15.6
G1 Z15.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z15.8 F30000
G1 Z15.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
M73 P72 R5
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 78/128
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
G3 Z15.8 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z15.8
G1 Z15.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z16 F30000
G1 X139.55 Y116.15 Z16
G1 Z15.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 15.8
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 79/128
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
G3 Z16 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z16
G1 Z15.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z16.2 F30000
G1 Z15.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16
; LAYER_HEIGHT: 0.2
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 80/128
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
M73 P72 R4
G3 Z16.2 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z16.2
G1 Z16
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
M73 P73 R4
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z16.4 F30000
G1 X139.55 Y116.15 Z16.4
G1 Z16
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 81/128
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
G3 Z16.4 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z16.4
G1 Z16.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z16.6 F30000
G1 Z16.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 82/128
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
G3 Z16.6 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z16.6
G1 Z16.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z16.8 F30000
G1 X139.55 Y116.15 Z16.8
G1 Z16.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
M73 P74 R4
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 83/128
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
G3 Z16.8 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z16.8
G1 Z16.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z17 F30000
G1 Z16.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 16.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 84/128
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
G3 Z17 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z17
G1 Z16.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z17.2 F30000
G1 X139.55 Y116.15 Z17.2
G1 Z16.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17
; LAYER_HEIGHT: 0.200001
; WIPE_START
M73 P75 R4
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 85/128
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
G3 Z17.2 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z17.2
G1 Z17
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z17.4 F30000
G1 Z17
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 86/128
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
G3 Z17.4 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z17.4
G1 Z17.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z17.6 F30000
G1 X139.55 Y116.15 Z17.6
G1 Z17.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 87/128
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
G3 Z17.6 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z17.6
G1 Z17.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
M73 P76 R4
G1 E-.04 F1800
G1 X141.85 Y137.55 Z17.8 F30000
G1 Z17.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 88/128
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
G3 Z17.8 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z17.8
G1 Z17.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z18 F30000
G1 X139.55 Y116.15 Z18
G1 Z17.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 17.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 89/128
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
G3 Z18 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z18
G1 Z17.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z18.2 F30000
G1 Z17.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
M73 P77 R4
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 90/128
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
G3 Z18.2 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z18.2
G1 Z18
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z18.4 F30000
G1 X139.55 Y116.15 Z18.4
G1 Z18
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 91/128
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
G3 Z18.4 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z18.4
G1 Z18.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z18.6 F30000
G1 Z18.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
M73 P78 R4
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 92/128
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
G3 Z18.6 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z18.6
G1 Z18.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z18.8 F30000
G1 X139.55 Y116.15 Z18.8
G1 Z18.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
M73 P78 R3
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 93/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L93
M991 S0 P92 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z18.8 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z18.8
G1 Z18.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z19 F30000
G1 Z18.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 18.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 94/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L94
M991 S0 P93 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z19 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z19
G1 Z18.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
M73 P79 R3
G1 X140.265 Y132.909 Z19.2 F30000
G1 X139.55 Y116.15 Z19.2
G1 Z18.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 95/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L95
M991 S0 P94 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z19.2 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z19.2
G1 Z19
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z19.4 F30000
G1 Z19
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 96/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L96
M991 S0 P95 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z19.4 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z19.4
G1 Z19.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z19.6 F30000
G1 X139.55 Y116.15 Z19.6
G1 Z19.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
M73 P80 R3
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 97/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L97
M991 S0 P96 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z19.6 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z19.6
G1 Z19.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z19.8 F30000
G1 Z19.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 98/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L98
M991 S0 P97 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z19.8 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z19.8
G1 Z19.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z20 F30000
G1 X139.55 Y116.15 Z20
G1 Z19.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 19.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 99/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L99
M991 S0 P98 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
M73 P81 R3
G3 Z20 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z20
G1 Z19.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z20.2 F30000
G1 Z19.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 100/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L100
M991 S0 P99 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z20.2 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z20.2
G1 Z20
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z20.4 F30000
G1 X139.55 Y116.15 Z20.4
G1 Z20
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 101/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L101
M991 S0 P100 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z20.4 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z20.4
G1 Z20.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z20.6 F30000
G1 Z20.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
M73 P82 R3
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 102/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L102
M991 S0 P101 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z20.6 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z20.6
G1 Z20.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z20.8 F30000
G1 X139.55 Y116.15 Z20.8
G1 Z20.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 103/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L103
M991 S0 P102 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z20.8 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z20.8
G1 Z20.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z21 F30000
G1 Z20.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
M73 P83 R3
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 20.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 104/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L104
M991 S0 P103 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z21 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z21
G1 Z20.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z21.2 F30000
G1 X139.55 Y116.15 Z21.2
G1 Z20.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 105/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L105
M991 S0 P104 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z21.2 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z21.2
G1 Z21
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z21.4 F30000
G1 Z21
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
M73 P83 R2
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 106/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L106
M991 S0 P105 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z21.4 I-1.216 J.039 P1  F30000
M73 P84 R2
G1 X142.198 Y140.198 Z21.4
G1 Z21.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z21.6 F30000
G1 X139.55 Y116.15 Z21.6
G1 Z21.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 107/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L107
M991 S0 P106 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z21.6 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z21.6
G1 Z21.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z21.8 F30000
G1 Z21.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 108/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L108
M991 S0 P107 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z21.8 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z21.8
G1 Z21.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z22 F30000
G1 X139.55 Y116.15 Z22
G1 Z21.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
M73 P85 R2
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 21.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 109/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L109
M991 S0 P108 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z22 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z22
G1 Z21.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z22.2 F30000
G1 Z21.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 110/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L110
M991 S0 P109 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z22.2 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z22.2
G1 Z22
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z22.4 F30000
G1 X139.55 Y116.15 Z22.4
G1 Z22
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
M73 P86 R2
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 111/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L111
M991 S0 P110 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z22.4 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z22.4
G1 Z22.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z22.6 F30000
G1 Z22.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 112/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L112
M991 S0 P111 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z22.6 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z22.6
G1 Z22.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z22.8 F30000
G1 X139.55 Y116.15 Z22.8
G1 Z22.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 113/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L113
M991 S0 P112 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z22.8 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z22.8
M73 P87 R2
G1 Z22.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z23 F30000
G1 Z22.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 22.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 114/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L114
M991 S0 P113 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z23 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z23
G1 Z22.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z23.2 F30000
G1 X139.55 Y116.15 Z23.2
G1 Z22.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 115/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L115
M991 S0 P114 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z23.2 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z23.2
G1 Z23
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z23.4 F30000
G1 Z23
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
M73 P88 R2
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 116/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L116
M991 S0 P115 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z23.4 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z23.4
G1 Z23.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z23.6 F30000
G1 X139.55 Y116.15 Z23.6
G1 Z23.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 117/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L117
M991 S0 P116 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z23.6 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z23.6
G1 Z23.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z23.8 F30000
G1 Z23.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
M73 P89 R2
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 118/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L118
M991 S0 P117 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z23.8 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z23.8
G1 Z23.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
M73 P89 R1
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z24 F30000
G1 X139.55 Y116.15 Z24
G1 Z23.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 23.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 119/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L119
M991 S0 P118 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z24 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z24
G1 Z23.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z24.2 F30000
G1 Z23.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 120/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L120
M991 S0 P119 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z24.2 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z24.2
G1 Z24
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6955
G1 X117.802 Y140.198 E.80925
M73 P90 R1
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6955
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X140.265 Y132.909 Z24.4 F30000
G1 X139.55 Y116.15 Z24.4
G1 Z24
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6955
G1 X141.178 Y116.15 E.05401
G1 X141.85 Y116.822 E.0315
G1 X141.85 Y116.15 E.02227
G1 X118.15 Y139.85 E1.11178
G1 X118.15 Y139.178 E.02227
G1 X118.822 Y139.85 E.0315
G1 X125.826 Y139.85 E.23235
G1 X141.85 Y123.826 E.75169
G1 X141.85 Y124.498 E.02227
G1 X133.502 Y116.15 E.39159
G1 X134.174 Y116.15 E.02227
G1 X118.15 Y132.174 E.75169
G1 X118.15 Y131.502 E.02227
G1 X126.498 Y139.85 E.39159
G1 X133.502 Y139.85 E.23235
G1 X141.85 Y131.502 E.39159
G1 X141.85 Y132.174 E.02227
G1 X125.826 Y116.15 E.75169
G1 X126.498 Y116.15 E.02227
G1 X118.15 Y124.498 E.39159
G1 X118.15 Y123.826 E.02227
G1 X134.174 Y139.85 E.75169
G1 X135.802 Y139.85 E.05401
G1 X118.15 Y118.45 F30000
G1 F6955
G1 X118.15 Y116.822 E.05401
G1 X118.822 Y116.15 E.0315
G1 X118.15 Y116.15 E.02227
G1 X141.85 Y139.85 E1.11178
G1 X141.178 Y139.85 E.02227
G1 X141.85 Y139.178 E.0315
G1 X141.85 Y137.55 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.85 Y139.178 E-.61876
G1 X141.587 Y139.441 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 121/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L121
M991 S0 P120 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z24.4 I-.947 J.764 P1  F30000
G1 X142.198 Y140.198 Z24.4
G1 Z24.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F6796
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F6796
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y137.55 Z24.6 F30000
G1 Z24.2
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F6796
G1 X141.85 Y139.178 E.05401
G1 X141.178 Y139.85 E.0315
G1 X141.85 Y139.85 E.02227
G1 X118.15 Y116.15 E1.11178
G1 X118.822 Y116.15 E.02227
G1 X118.15 Y116.822 E.0315
G1 X118.15 Y118.45 E.05401
G1 X135.802 Y139.85 F30000
G1 F6796
G1 X134.174 Y139.85 E.05401
G1 X118.15 Y123.826 E.75169
G1 X118.15 Y124.498 E.02227
G1 X126.498 Y116.15 E.39159
G1 X125.826 Y116.15 E.02227
G1 X141.85 Y132.174 E.75169
G1 X141.85 Y131.502 E.02227
G1 X133.502 Y139.85 E.39159
G1 X126.498 Y139.85 E.23235
G1 X118.15 Y131.502 E.39159
G1 X118.15 Y132.174 E.02227
G1 X134.174 Y116.15 E.75169
G1 X133.502 Y116.15 E.02227
G1 X141.85 Y124.498 E.39159
G1 X141.85 Y123.826 E.02227
G1 X125.826 Y139.85 E.75169
G1 X118.822 Y139.85 E.23235
G1 X118.15 Y139.178 E.0315
G1 X118.15 Y139.85 E.02227
G1 X141.85 Y116.15 E1.11178
G1 X141.85 Y116.822 E.02227
G1 X141.178 Y116.15 E.0315
G1 X139.55 Y116.15 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.178 Y116.15 E-.61876
G1 X141.441 Y116.413 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 122/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L122
M991 S0 P121 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z24.6 I-1.216 J.039 P1  F30000
G1 X142.198 Y140.198 Z24.6
G1 Z24.4
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8017
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8017
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y139.85 Z24.8 F30000
G1 Z24.4
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8017
G1 X118.15 Y139.85 E.78615
G1 X118.15 Y116.15 E.78615
G1 X141.85 Y116.15 E.78615
G1 X141.85 Y139.79 E.78416
G1 X139.814 Y139.443 F30000
G1 F8017
M73 P91 R1
G1 X141.443 Y139.443 E.05401
G1 X118.557 Y116.557 E1.07359
G1 X118.557 Y124.091 E.24989
G1 X126.091 Y116.557 E.3534
G1 X126.233 Y116.557 E.00474
G1 X141.443 Y131.767 E.71349
G1 X141.443 Y131.909 E.00474
G1 X133.909 Y139.443 E.3534
G1 X133.767 Y139.443 E.00474
G1 X118.557 Y124.233 E.71349
G1 X118.557 Y131.767 E.24989
G1 X133.767 Y116.557 E.71349
G1 X133.909 Y116.557 E.00474
G1 X141.443 Y124.091 E.3534
G1 X141.443 Y124.233 E.00474
G1 X126.233 Y139.443 E.71349
G1 X126.091 Y139.443 E.00474
G1 X118.557 Y131.909 E.3534
G1 X118.557 Y139.443 E.24989
G1 X141.443 Y116.557 E1.07359
G1 X139.814 Y116.557 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.443 Y116.557 E-.61876
G1 X141.18 Y116.82 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 123/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L123
M991 S0 P122 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z24.8 I-1.216 J.053 P1  F30000
G1 X142.198 Y140.198 Z24.8
G1 Z24.6
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8104
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8104
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y139.85 Z25 F30000
G1 Z24.6
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8104
G1 X118.15 Y139.85 E.78615
G1 X118.15 Y116.15 E.78615
G1 X141.85 Y116.15 E.78615
G1 X141.85 Y139.79 E.78416
G1 X139.814 Y116.557 F30000
G1 F8104
G1 X141.443 Y116.557 E.05401
G1 X118.557 Y139.443 E1.07359
G1 X118.557 Y131.909 E.24989
G1 X126.091 Y139.443 E.3534
G1 X126.233 Y139.443 E.00474
G1 X141.443 Y124.233 E.71349
G1 X141.443 Y124.091 E.00474
G1 X133.909 Y116.557 E.3534
G1 X133.767 Y116.557 E.00474
G1 X118.557 Y131.767 E.71349
G1 X118.557 Y124.233 E.24989
G1 X133.767 Y139.443 E.71349
G1 X133.909 Y139.443 E.00474
G1 X141.443 Y131.909 E.3534
G1 X141.443 Y131.767 E.00474
G1 X126.233 Y116.557 E.71349
G1 X126.091 Y116.557 E.00474
G1 X118.557 Y124.091 E.3534
G1 X118.557 Y116.557 E.24989
G1 X141.443 Y139.443 E1.07359
G1 X139.814 Y139.443 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 24.8
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X141.443 Y139.443 E-.61876
G1 X141.18 Y139.18 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 124/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L124
M991 S0 P123 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z25 I-.861 J.861 P1  F30000
G1 X142.198 Y140.198 Z25
G1 Z24.8
G1 E.8 F1800
; FEATURE: Inner wall
G1 F7925
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F7925
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y139.85 Z25.2 F30000
G1 Z24.8
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F7925
G1 X118.15 Y139.85 E.78615
G1 X118.15 Y116.15 E.78615
G1 X141.85 Y116.15 E.78615
G1 X141.85 Y139.79 E.78416
G1 X139.814 Y139.443 F30000
G1 F7925
G1 X141.443 Y139.443 E.05401
G1 X118.557 Y116.557 E1.07359
G1 X118.557 Y124.091 E.24989
G1 X126.091 Y116.557 E.3534
G1 X126.233 Y116.557 E.00474
G1 X141.443 Y131.767 E.71349
G1 X141.443 Y131.909 E.00474
G1 X133.909 Y139.443 E.3534
G1 X133.767 Y139.443 E.00474
G1 X118.557 Y124.233 E.71349
G1 X118.557 Y131.767 E.24989
G1 X133.767 Y116.557 E.71349
G1 X133.909 Y116.557 E.00474
G1 X141.443 Y124.091 E.3534
G1 X141.443 Y124.233 E.00474
G1 X126.233 Y139.443 E.71349
G1 X126.091 Y139.443 E.00474
G1 X118.557 Y131.909 E.3534
G1 X118.557 Y139.443 E.24989
G1 X141.443 Y116.557 E1.07359
G1 X139.814 Y116.557 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.443 Y116.557 E-.61876
G1 X141.18 Y116.82 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 125/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L125
M991 S0 P124 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z25.2 I-1.216 J.053 P1  F30000
G1 X142.198 Y140.198 Z25.2
G1 Z25
G1 E.8 F1800
; FEATURE: Inner wall
G1 F8104
G1 X117.802 Y140.198 E.80925
M73 P92 R1
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F8104
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.85 Y139.85 Z25.4 F30000
G1 Z25
G1 E.8 F1800
; FEATURE: Sparse infill
; LINE_WIDTH: 0.45
G1 F8104
G1 X118.15 Y139.85 E.78615
G1 X118.15 Y116.15 E.78615
G1 X141.85 Y116.15 E.78615
G1 X141.85 Y139.79 E.78416
G1 X139.814 Y116.557 F30000
G1 F8104
G1 X141.443 Y116.557 E.05401
G1 X118.557 Y139.443 E1.07359
G1 X118.557 Y131.909 E.24989
G1 X126.091 Y139.443 E.3534
G1 X126.233 Y139.443 E.00474
G1 X141.443 Y124.233 E.71349
G1 X141.443 Y124.091 E.00474
G1 X133.909 Y116.557 E.3534
G1 X133.767 Y116.557 E.00474
G1 X118.557 Y131.767 E.71349
G1 X118.557 Y124.233 E.24989
G1 X133.767 Y139.443 E.71349
G1 X133.909 Y139.443 E.00474
G1 X141.443 Y131.909 E.3534
G1 X141.443 Y131.767 E.00474
G1 X126.233 Y116.557 E.71349
G1 X126.091 Y116.557 E.00474
G1 X118.557 Y124.091 E.3534
G1 X118.557 Y116.557 E.24989
G1 X141.443 Y139.443 E1.07359
G1 X139.814 Y139.443 E.05401
; CHANGE_LAYER
; Z_HEIGHT: 25.2
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X141.443 Y139.443 E-.61876
G1 X141.18 Y139.18 E-.14124
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 126/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L126
M991 S0 P125 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z25.4 I-.861 J.861 P1  F30000
G1 X142.198 Y140.198 Z25.4
G1 Z25.2
G1 E.8 F1800
; FEATURE: Inner wall
G1 F15476.087
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.041 Y132.916 Z25.6 F30000
G1 X142.031 Y116.174 Z25.6
G1 Z25.2
G1 E.8 F1800
; FEATURE: Bridge
; LINE_WIDTH: 0.404837
; LAYER_HEIGHT: 0.4
G1 F3000
G1 X118.172 Y116.174 E1.2513
G1 X118.172 Y116.629 E.02385
G1 X141.828 Y116.629 E1.24068
G1 X141.828 Y117.084 E.02385
G1 X118.172 Y117.084 E1.24068
G1 X118.172 Y117.539 E.02385
G1 X141.828 Y117.539 E1.24068
G1 X141.828 Y117.994 E.02385
G1 X118.172 Y117.994 E1.24068
G1 X118.172 Y118.448 E.02385
G1 X141.828 Y118.448 E1.24068
G1 X141.828 Y118.903 E.02385
G1 X118.172 Y118.903 E1.24068
G1 X118.172 Y119.358 E.02385
G1 X141.828 Y119.358 E1.24068
G1 X141.828 Y119.813 E.02385
G1 X118.172 Y119.813 E1.24068
G1 X118.172 Y120.268 E.02385
G1 X141.828 Y120.268 E1.24068
G1 X141.828 Y120.723 E.02385
G1 X118.172 Y120.723 E1.24068
G1 X118.172 Y121.177 E.02385
G1 X141.828 Y121.177 E1.24068
G1 X141.828 Y121.632 E.02385
G1 X118.172 Y121.632 E1.24068
G1 X118.172 Y122.087 E.02385
G1 X141.828 Y122.087 E1.24068
G1 X141.828 Y122.542 E.02385
G1 X118.172 Y122.542 E1.24068
G1 X118.172 Y122.997 E.02385
G1 X141.828 Y122.997 E1.24068
G1 X141.828 Y123.452 E.02385
G1 X118.172 Y123.452 E1.24068
G1 X118.172 Y123.906 E.02385
G1 X141.828 Y123.907 E1.24068
G1 X141.828 Y124.361 E.02385
G1 X118.172 Y124.361 E1.24068
G1 X118.172 Y124.816 E.02385
G1 X141.828 Y124.816 E1.24068
G1 X141.828 Y125.271 E.02385
G1 X118.172 Y125.271 E1.24068
G1 X118.172 Y125.726 E.02385
G1 X141.828 Y125.726 E1.24068
G1 X141.828 Y126.181 E.02385
G1 X118.172 Y126.181 E1.24068
G1 X118.172 Y126.636 E.02385
G1 X141.828 Y126.636 E1.24068
G1 X141.828 Y127.09 E.02385
G1 X118.172 Y127.09 E1.24068
G1 X118.172 Y127.545 E.02385
G1 X141.828 Y127.545 E1.24068
G1 X141.828 Y128 E.02385
G1 X118.172 Y128 E1.24068
M73 P93 R1
G1 X118.172 Y128.455 E.02385
G1 X141.828 Y128.455 E1.24068
G1 X141.828 Y128.91 E.02385
G1 X118.172 Y128.91 E1.24068
G1 X118.172 Y129.365 E.02385
G1 X141.828 Y129.365 E1.24068
G1 X141.828 Y129.819 E.02385
G1 X118.172 Y129.819 E1.24068
G1 X118.172 Y130.274 E.02385
G1 X141.828 Y130.274 E1.24068
G1 X141.828 Y130.729 E.02385
G1 X118.172 Y130.729 E1.24068
G1 X118.172 Y131.184 E.02385
G1 X141.828 Y131.184 E1.24068
G1 X141.828 Y131.639 E.02385
G1 X118.172 Y131.639 E1.24068
G1 X118.172 Y132.094 E.02385
G1 X141.828 Y132.094 E1.24068
G1 X141.828 Y132.548 E.02385
G1 X118.172 Y132.548 E1.24068
G1 X118.172 Y133.003 E.02385
G1 X141.828 Y133.003 E1.24068
G1 X141.828 Y133.458 E.02385
G1 X118.172 Y133.458 E1.24068
G1 X118.172 Y133.913 E.02385
G1 X141.828 Y133.913 E1.24068
G1 X141.828 Y134.368 E.02385
G1 X118.172 Y134.368 E1.24068
G1 X118.172 Y134.823 E.02385
G1 X141.828 Y134.823 E1.24068
G1 X141.828 Y135.277 E.02385
G1 X118.172 Y135.277 E1.24068
G1 X118.172 Y135.732 E.02385
G1 X141.828 Y135.732 E1.24068
G1 X141.828 Y136.187 E.02385
G1 X118.172 Y136.187 E1.24068
G1 X118.172 Y136.642 E.02385
G1 X141.828 Y136.642 E1.24068
G1 X141.828 Y137.097 E.02385
G1 X118.172 Y137.097 E1.24068
G1 X118.172 Y137.552 E.02385
G1 X141.828 Y137.552 E1.24068
G1 X141.828 Y138.006 E.02385
G1 X118.172 Y138.006 E1.24068
G1 X118.172 Y138.461 E.02385
G1 X141.828 Y138.461 E1.24068
G1 X141.828 Y138.916 E.02385
G1 X118.172 Y138.916 E1.24068
G1 X118.172 Y139.371 E.02385
G1 X141.828 Y139.371 E1.24068
G1 X141.828 Y139.826 E.02385
G1 X117.969 Y139.826 E1.2513
; CHANGE_LAYER
; Z_HEIGHT: 25.4
; LAYER_HEIGHT: 0.199999
; WIPE_START
G1 F24000
G1 X119.969 Y139.826 E-.76
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 127/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L127
M991 S0 P126 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z25.6 I-.02 J1.217 P1  F30000
G1 X142.198 Y140.198 Z25.6
G1 Z25.4
G1 E.8 F1800
; FEATURE: Inner wall
; LINE_WIDTH: 0.45
G1 F15476.087
G1 X117.802 Y140.198 E.80925
G1 X117.802 Y115.802 E.80925
G1 X142.198 Y115.802 E.80925
G1 X142.198 Y140.138 E.80726
G1 X142.59 Y140.59 F30000
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
; WIPE_START
G1 F24000
G1 X140.59 Y140.535 E-.76
; WIPE_END
G1 E-.04 F1800
G1 X141.052 Y132.916 Z25.8 F30000
G1 X142.034 Y116.732 Z25.8
G1 Z25.4
G1 E.8 F1800
; FEATURE: Internal solid infill
; LINE_WIDTH: 0.421715
G1 F15000
G1 X141.438 Y116.135 E.02603
G1 X140.902 Y116.135 E.01654
M73 P94 R1
G1 X141.865 Y117.098 E.042
G1 X141.865 Y117.633 E.01654
G1 X140.367 Y116.135 E.06539
G1 X139.831 Y116.135 E.01654
G1 X141.865 Y118.169 E.08877
G1 X141.865 Y118.705 E.01654
G1 X139.295 Y116.135 E.11216
G1 X138.76 Y116.135 E.01654
G1 X141.865 Y119.24 E.13554
G1 X141.865 Y119.776 E.01654
G1 X138.224 Y116.135 E.15893
G1 X137.688 Y116.135 E.01654
G1 X141.865 Y120.312 E.18231
G1 X141.865 Y120.847 E.01654
G1 X137.153 Y116.135 E.2057
G1 X136.617 Y116.135 E.01654
G1 X141.865 Y121.383 E.22908
G1 X141.865 Y121.919 E.01654
G1 X136.081 Y116.135 E.25246
G1 X135.545 Y116.135 E.01654
G1 X141.865 Y122.455 E.27585
G1 X141.865 Y122.99 E.01654
G1 X135.01 Y116.135 E.29923
G1 X134.474 Y116.135 E.01654
G1 X141.865 Y123.526 E.32262
G1 X141.865 Y124.062 E.01654
G1 X133.938 Y116.135 E.346
G1 X133.403 Y116.135 E.01654
M73 P94 R0
G1 X141.865 Y124.597 E.36939
G1 X141.865 Y125.133 E.01654
G1 X132.867 Y116.135 E.39277
G1 X132.331 Y116.135 E.01654
G1 X141.865 Y125.669 E.41616
G1 X141.865 Y126.204 E.01654
G1 X131.796 Y116.135 E.43954
G1 X131.26 Y116.135 E.01654
G1 X141.865 Y126.74 E.46293
G1 X141.865 Y127.276 E.01654
G1 X130.724 Y116.135 E.48631
G1 X130.188 Y116.135 E.01654
G1 X141.865 Y127.812 E.50969
G1 X141.865 Y128.347 E.01654
G1 X129.653 Y116.135 E.53308
G1 X129.117 Y116.135 E.01654
G1 X141.865 Y128.883 E.55646
G1 X141.865 Y129.419 E.01654
M73 P95 R0
G1 X128.581 Y116.135 E.57985
G1 X128.046 Y116.135 E.01654
G1 X141.865 Y129.954 E.60323
G1 X141.865 Y130.49 E.01654
G1 X127.51 Y116.135 E.62662
G1 X126.974 Y116.135 E.01654
G1 X141.865 Y131.026 E.65
G1 X141.865 Y131.561 E.01654
G1 X126.439 Y116.135 E.67339
G1 X125.903 Y116.135 E.01654
G1 X141.865 Y132.097 E.69677
G1 X141.865 Y132.633 E.01654
G1 X125.367 Y116.135 E.72016
G1 X124.832 Y116.135 E.01654
G1 X141.865 Y133.168 E.74354
G1 X141.865 Y133.704 E.01654
G1 X124.296 Y116.135 E.76692
G1 X123.76 Y116.135 E.01654
G1 X141.865 Y134.24 E.79031
G1 X141.865 Y134.776 E.01654
G1 X123.224 Y116.135 E.81369
G1 X122.689 Y116.135 E.01654
G1 X141.865 Y135.311 E.83708
G1 X141.865 Y135.847 E.01654
G1 X122.153 Y116.135 E.86046
G1 X121.617 Y116.135 E.01654
G1 X141.865 Y136.383 E.88385
G1 X141.865 Y136.918 E.01654
G1 X121.082 Y116.135 E.90723
G1 X120.546 Y116.135 E.01654
G1 X141.865 Y137.454 E.93062
G1 X141.865 Y137.99 E.01654
G1 X120.01 Y116.135 E.954
G1 X119.475 Y116.135 E.01654
G1 X141.865 Y138.525 E.97739
G1 X141.865 Y139.061 E.01654
G1 X118.939 Y116.135 E1.00077
G1 X118.403 Y116.135 E.01654
G1 X141.865 Y139.597 E1.02415
G1 X141.865 Y139.865 E.00827
G1 X141.597 Y139.865 E.00827
G1 X118.135 Y116.403 E1.02415
G1 X118.135 Y116.939 E.01654
G1 X141.061 Y139.865 E1.00077
G1 X140.525 Y139.865 E.01654
G1 X118.135 Y117.475 E.97738
G1 X118.135 Y118.01 E.01654
G1 X139.99 Y139.865 E.954
G1 X139.454 Y139.865 E.01654
G1 X118.135 Y118.546 E.93061
G1 X118.135 Y119.082 E.01654
G1 X138.918 Y139.865 E.90723
G1 X138.383 Y139.865 E.01654
G1 X118.135 Y119.617 E.88384
G1 X118.135 Y120.153 E.01654
G1 X137.847 Y139.865 E.86046
G1 X137.311 Y139.865 E.01654
G1 X118.135 Y120.689 E.83707
G1 X118.135 Y121.225 E.01654
G1 X136.775 Y139.865 E.81369
G1 X136.24 Y139.865 E.01654
G1 X118.135 Y121.76 E.7903
G1 X118.135 Y122.296 E.01654
G1 X135.704 Y139.865 E.76692
G1 X135.168 Y139.865 E.01654
G1 X118.135 Y122.832 E.74354
G1 X118.135 Y123.367 E.01654
G1 X134.633 Y139.865 E.72015
G1 X134.097 Y139.865 E.01654
G1 X118.135 Y123.903 E.69677
G1 X118.135 Y124.439 E.01654
G1 X133.561 Y139.865 E.67338
G1 X133.026 Y139.865 E.01654
G1 X118.135 Y124.974 E.65
G1 X118.135 Y125.51 E.01654
G1 X132.49 Y139.865 E.62661
G1 X131.954 Y139.865 E.01654
G1 X118.135 Y126.046 E.60323
G1 X118.135 Y126.581 E.01654
G1 X131.419 Y139.865 E.57984
G1 X130.883 Y139.865 E.01654
G1 X118.135 Y127.117 E.55646
G1 X118.135 Y127.653 E.01654
G1 X130.347 Y139.865 E.53308
G1 X129.811 Y139.865 E.01654
G1 X118.135 Y128.189 E.50969
G1 X118.135 Y128.724 E.01654
G1 X129.276 Y139.865 E.48631
G1 X128.74 Y139.865 E.01654
G1 X118.135 Y129.26 E.46292
G1 X118.135 Y129.796 E.01654
G1 X128.204 Y139.865 E.43954
G1 X127.669 Y139.865 E.01654
G1 X118.135 Y130.331 E.41615
G1 X118.135 Y130.867 E.01654
G1 X127.133 Y139.865 E.39277
G1 X126.597 Y139.865 E.01654
G1 X118.135 Y131.403 E.36938
G1 X118.135 Y131.938 E.01654
G1 X126.062 Y139.865 E.346
G1 X125.526 Y139.865 E.01654
G1 X118.135 Y132.474 E.32261
G1 X118.135 Y133.01 E.01654
G1 X124.99 Y139.865 E.29923
G1 X124.454 Y139.865 E.01654
G1 X118.135 Y133.546 E.27585
G1 X118.135 Y134.081 E.01654
M73 P96 R0
G1 X123.919 Y139.865 E.25246
G1 X123.383 Y139.865 E.01654
G1 X118.135 Y134.617 E.22908
G1 X118.135 Y135.153 E.01654
G1 X122.847 Y139.865 E.20569
G1 X122.312 Y139.865 E.01654
G1 X118.135 Y135.688 E.18231
G1 X118.135 Y136.224 E.01654
G1 X121.776 Y139.865 E.15892
G1 X121.24 Y139.865 E.01654
G1 X118.135 Y136.76 E.13554
G1 X118.135 Y137.295 E.01654
G1 X120.705 Y139.865 E.11215
G1 X120.169 Y139.865 E.01654
G1 X118.135 Y137.831 E.08877
G1 X118.135 Y138.367 E.01654
G1 X119.633 Y139.865 E.06538
G1 X119.097 Y139.865 E.01654
G1 X118.135 Y138.903 E.042
G1 X118.135 Y139.438 E.01654
G1 X118.731 Y140.034 E.02602
; CHANGE_LAYER
; Z_HEIGHT: 25.6
; LAYER_HEIGHT: 0.200001
; WIPE_START
G1 F24000
G1 X118.135 Y139.438 E-.32036
G1 X118.135 Y138.903 E-.20356
G1 X118.575 Y139.342 E-.23607
; WIPE_END
G1 E-.04 F1800
; stop printing object, unique label id: 58
M625
; layer num/total_layer_count: 128/128
M622.1 S1 ; for prev firware, default turned on
M1002 judge_flag timelapse_record_flag
M622 J1
 ; timelapse without wipe tower
M971 S11 C10 O0

M623
; update layer progress
M73 L128
M991 S0 P127 ;notify layer change
; start printing object, unique label id: 58
M624 AQAAAAAAAAA=
G17
G3 Z25.8 I-.063 J1.215 P1  F30000
G1 X142.59 Y140.59 Z25.8
G1 Z25.6
G1 E.8 F1800
M204 S5000
; FEATURE: Outer wall
; LINE_WIDTH: 0.42
G1 F12000
G1 X117.41 Y140.59 E.77371
G1 X117.41 Y115.41 E.77371
G1 X142.59 Y115.41 E.77371
G1 X142.59 Y140.53 E.77187
M204 S10000
G1 X142.383 Y139.881 F30000
M204 S2000
; FEATURE: Top surface
G1 F12000
G1 X141.881 Y140.383 E.02179
G1 X141.348 Y140.383
G1 X142.383 Y139.348 E.04497
G1 X142.383 Y138.815
G1 X140.815 Y140.383 E.06814
G1 X140.281 Y140.383
G1 X142.383 Y138.281 E.09131
G1 X142.383 Y137.748
G1 X139.748 Y140.383 E.11448
G1 X139.215 Y140.383
G1 X142.383 Y137.215 E.13766
G1 X142.383 Y136.681
G1 X138.681 Y140.383 E.16083
G1 X138.148 Y140.383
G1 X142.383 Y136.148 E.184
G1 X142.383 Y135.615
G1 X137.615 Y140.383 E.20718
G1 X137.082 Y140.383
G1 X142.383 Y135.082 E.23035
G1 X142.383 Y134.548
G1 X136.548 Y140.383 E.25352
G1 X136.015 Y140.383
G1 X142.383 Y134.015 E.2767
G1 X142.383 Y133.482
G1 X135.482 Y140.383 E.29987
G1 X134.949 Y140.383
G1 X142.383 Y132.949 E.32304
G1 X142.383 Y132.415
G1 X134.415 Y140.383 E.34622
G1 X133.882 Y140.383
G1 X142.383 Y131.882 E.36939
G1 X142.383 Y131.349
G1 X133.349 Y140.383 E.39256
G1 X132.816 Y140.383
G1 X142.383 Y130.816 E.41574
G1 X142.383 Y130.282
G1 X132.282 Y140.383 E.43891
G1 X131.749 Y140.383
G1 X142.383 Y129.749 E.46208
G1 X142.383 Y129.216
G1 X131.216 Y140.383 E.48526
G1 X130.682 Y140.383
G1 X142.383 Y128.682 E.50843
G1 X142.383 Y128.149
G1 X130.149 Y140.383 E.5316
G1 X129.616 Y140.383
G1 X142.383 Y127.616 E.55478
G1 X142.383 Y127.083
G1 X129.083 Y140.383 E.57795
G1 X128.549 Y140.383
G1 X142.383 Y126.549 E.60112
G1 X142.383 Y126.016
G1 X128.016 Y140.383 E.62429
G1 X127.483 Y140.383
G1 X142.383 Y125.483 E.64747
G1 X142.383 Y124.95
G1 X126.95 Y140.383 E.67064
G1 X126.416 Y140.383
G1 X142.383 Y124.416 E.69381
G1 X142.383 Y123.883
G1 X125.883 Y140.383 E.71699
G1 X125.35 Y140.383
G1 X142.383 Y123.35 E.74016
G1 X142.383 Y122.816
G1 X124.816 Y140.383 E.76333
G1 X124.283 Y140.383
G1 X142.383 Y122.283 E.78651
G1 X142.383 Y121.75
G1 X123.75 Y140.383 E.80968
G1 X123.217 Y140.383
G1 X142.383 Y121.217 E.83285
G1 X142.383 Y120.683
G1 X122.683 Y140.383 E.85603
G1 X122.15 Y140.383
G1 X142.383 Y120.15 E.8792
G1 X142.383 Y119.617
G1 X121.617 Y140.383 E.90237
G1 X121.084 Y140.383
G1 X142.383 Y119.084 E.92555
G1 X142.383 Y118.55
G1 X120.55 Y140.383 E.94872
G1 X120.017 Y140.383
G1 X142.383 Y118.017 E.97189
G1 X142.383 Y117.484
G1 X119.484 Y140.383 E.99507
G1 X118.95 Y140.383
G1 X142.383 Y116.951 E1.01824
G1 X142.383 Y116.417
G1 X118.417 Y140.383 E1.04141
G1 X117.884 Y140.383
G1 X142.383 Y115.884 E1.06459
G1 X142.116 Y115.617
G1 X117.617 Y140.116 E1.06458
G1 X117.617 Y139.583
G1 X141.583 Y115.617 E1.04141
G1 X141.049 Y115.617
G1 X117.617 Y139.049 E1.01823
G1 X117.617 Y138.516
G1 X140.516 Y115.617 E.99506
G1 X139.983 Y115.617
G1 X117.617 Y137.983 E.97189
G1 X117.617 Y137.45
G1 X139.45 Y115.617 E.94871
G1 X138.916 Y115.617
G1 X117.617 Y136.916 E.92554
G1 X117.617 Y136.383
G1 X138.383 Y115.617 E.90237
G1 X137.85 Y115.617
G1 X117.617 Y135.85 E.87919
G1 X117.617 Y135.316
G1 X137.316 Y115.617 E.85602
G1 X136.783 Y115.617
G1 X117.617 Y134.783 E.83285
G1 X117.617 Y134.25
G1 X136.25 Y115.617 E.80967
G1 X135.717 Y115.617
G1 X117.617 Y133.717 E.7865
G1 X117.617 Y133.183
G1 X135.183 Y115.617 E.76333
G1 X134.65 Y115.617
G1 X117.617 Y132.65 E.74015
G1 X117.617 Y132.117
G1 X134.117 Y115.617 E.71698
G1 X133.584 Y115.617
G1 X117.617 Y131.584 E.69381
G1 X117.617 Y131.05
G1 X133.05 Y115.617 E.67064
G1 X132.517 Y115.617
G1 X117.617 Y130.517 E.64746
G1 X117.617 Y129.984
M73 P97 R0
G1 X131.984 Y115.617 E.62429
G1 X131.451 Y115.617
G1 X117.617 Y129.45 E.60112
G1 X117.617 Y128.917
G1 X130.917 Y115.617 E.57794
G1 X130.384 Y115.617
G1 X117.617 Y128.384 E.55477
G1 X117.617 Y127.851
G1 X129.851 Y115.617 E.5316
G1 X129.317 Y115.617
G1 X117.617 Y127.317 E.50842
G1 X117.617 Y126.784
G1 X128.784 Y115.617 E.48525
G1 X128.251 Y115.617
G1 X117.617 Y126.251 E.46208
G1 X117.617 Y125.718
G1 X127.718 Y115.617 E.4389
G1 X127.184 Y115.617
G1 X117.617 Y125.184 E.41573
G1 X117.617 Y124.651
G1 X126.651 Y115.617 E.39256
G1 X126.118 Y115.617
G1 X117.617 Y124.118 E.36938
G1 X117.617 Y123.585
G1 X125.585 Y115.617 E.34621
G1 X125.051 Y115.617
G1 X117.617 Y123.051 E.32304
G1 X117.617 Y122.518
G1 X124.518 Y115.617 E.29986
G1 X123.985 Y115.617
G1 X117.617 Y121.985 E.27669
G1 X117.617 Y121.451
G1 X123.451 Y115.617 E.25352
G1 X122.918 Y115.617
G1 X117.617 Y120.918 E.23034
G1 X117.617 Y120.385
G1 X122.385 Y115.617 E.20717
G1 X121.852 Y115.617
G1 X117.617 Y119.852 E.184
G1 X117.617 Y119.318
G1 X121.318 Y115.617 E.16083
G1 X120.785 Y115.617
G1 X117.617 Y118.785 E.13765
G1 X117.617 Y118.252
G1 X120.252 Y115.617 E.11448
G1 X119.719 Y115.617
G1 X117.617 Y117.719 E.09131
G1 X117.617 Y117.185
G1 X119.185 Y115.617 E.06813
G1 X118.652 Y115.617
G1 X117.617 Y116.652 E.04496
G1 X117.617 Y116.119
G1 X118.119 Y115.617 E.02179
M204 S10000
; close powerlost recovery
M1003 S0
; WIPE_START
G1 F24000
G1 X117.617 Y116.119 E-.26943
G1 X117.617 Y116.652 E-.20264
G1 X118.153 Y116.116 E-.28793
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
G1 Z26.1 F900 ; lower z a little
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

    G1 Z125.6 F600
    G1 Z123.6

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

