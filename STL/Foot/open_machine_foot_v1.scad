// "open machine foot" v1 by Dirk Feyerabend from Fablab Ideenreich
// released under Creative Commons Zero [CC0] v4.0 in 2018
//
// This is a parametric open source machine foot. It can be used to generate a variety of machine feet and vibration dampeners. Feel free to evolve it.
// For printing harder feet use ABS / PLA etc. For more grip and vibration-dampening Thermoplastic Copolyester Elastomer should work. 


// settings:
// #####################
// In this section you can change the foot parameters. Everything but wall_thickness_ratio/rounded_edges is in mm.

foot_diameter = 25;                 // diameter on the machine side 
foot_hight = 10; 
screw_diameter = 4;                // diameter of screw shank + thread
washer_diameter = 12;             // washer or screwhead diameter
bottom_thickness = 3;              // material thickness between washer and machine
wall_thickness_ratio = 0.28;        // ratio of the upper wall-thickness in respect to foot_diameter (0.28=28%), for vibration dampeners consider numbers greater then 0.8
rounded_edges = true;              // true or false

// ###################
// ###################

//code:
foot_radius= foot_diameter/2;
washer_radius= washer_diameter/2;
screwhole_radius= screw_diameter/2;

rotate_extrude($fn=200){  //rotate_extrude the base polygon
    if (rounded_edges == true) {
        offset(1,$fn=200) offset(-1,$fn=200) // offset 1/-1 for rounding edges 
            polygon(points=
                [[screwhole_radius+0.3,0],
                [foot_radius,0],
                [washer_radius+(wall_thickness_ratio*foot_radius),foot_hight],
                [washer_radius+0.3,foot_hight],[washer_radius+0.3,bottom_thickness],
                [screwhole_radius+0.3,bottom_thickness]]); } // base polygon 

    else {
             polygon(points=
                [[screwhole_radius+0.3,0],
                [foot_radius,0],
                [washer_radius+(wall_thickness_ratio*foot_radius),foot_hight],
                [washer_radius+0.2,foot_hight],[washer_radius+0.2,bottom_thickness],
                [screwhole_radius+0.3,bottom_thickness]]); } // base polygon 
}