//https://solder-stencil.me/

$fn=40;

module bottom_cart() {

    translate ([-1.4,-1.35,7.5])  {
        color([1,0,0]) 
        rotate([90,0,0]) 
        rotate([0,270,0]) 
        translate ([-12,25,-25]) 
        import("files/CartBottom.stl", convexity=3);
    }
}

module top_cart() {

    translate ([-1.4,-1.35,7.5])  {

        color([1,0,0]) 
        rotate([90,0,0]) 
        rotate([0,270,0]) 
        translate ([-12,25,-25]) 
        import("files/CartTop.stl", convexity=3);
    }
}


//rotate([90,90,0]) 
module bpi() {

  if (0) color([.15,0.25,.15]) translate([-95.75,-31.5,0.5]) import("bpi/bpi-m2-zero-v1_0_DXF_top.dxf");
  
  if (1) color([0.3,0.3,0.3]) translate([12.375,-1.8,1+1.5]) scale([15,20,9]/2) rotate([90,0,0]) cylinder(1,1);
     
  color([0,0,0]) translate([7.163075,23.97,1]) cube([20*2.54,2*2.54,2.54]);

  color([0,0,0,0.5]) translate([0,0,-2.54]) cube([65,30,2.54]);


  color([0.8,0.8,0.8]) translate([-5,10.65,1]) cube([20,12.5,1.6]);
  
  for (i = [0:1]) {
      for (j = [0:19]) {
          color([0.2,0.2,0.2]) 
          translate([2.54*j,2.54*i,0]) 
          translate([2.54,2.54,-4]/2) 
          translate([7.163075,23.97,1]) 
          scale([0.4,0.4,8]) 
            cylinder();
      }
  }
  
    
  translate([37.45,-5,1-0.25]) { 
    difference() { 
      color([0.8,0.8,0.8]) cube([8,10,3]);
      {
        translate([-0.5,-1,-0.5]) rotate([0,45,0]) translate([-1.5,0,-1.5]) cube([3,12,3]); 
        translate([8+0.5,-1,-0.5]) rotate([0,45,0]) translate([-1.5,0,-1.5]) cube([3,12,3]); 
      }
    }
  }

  translate([50.10,-5,1-0.25]) { 
    difference() { 
      color([0.8,0.8,0.8]) cube([8,10,3]);
      {
        translate([-0.5,-1,-0.5]) rotate([0,45,0]) translate([-1.5,0,-1.5]) cube([3,12,3]); 
        translate([8+0.5,-1,-0.5]) rotate([0,45,0]) translate([-1.5,0,-1.5]) cube([3,12,3]); 
      }
    }
  }

  translate([6.45,-6,1-0.25]) { 
    difference() { 
      color([0.8,0.8,0.8]) cube([12,12,4]);
      {
        translate([-0.5,-1,-0.5]) rotate([0,45,0]) translate([-1.5,0,-1.5]) cube([3,12,3]); 
        translate([12+0.5,-1,-0.5]) rotate([0,45,0]) translate([-1.5,0,-1.5]) cube([3,12,3]); 
      }
    }
  }
}

module lcd() {
    
  for (i = [0:13]) {
    color([0.2,0.2,0.2]) 
    translate([2,4.85 + 2.54*i,-14]) 
    scale([0.4,0.4,16]) 
      cylinder();
  }

  color([0.8,0.3,0.3]) cube([77.18,42.72,1.54]);

  color([0.3,0.3,0.3]) translate([77.18-9.26-48.96,3,1.54]) cube([48.96,36.72,5]);

  color([0.73,0.73,0.73]) translate([77.18-6.51-60.26,0,1.54]) cube([60.26,42.72,3.8]);

  //color([0.3,0.3,0.3]) translate([18,1,1]) cube([51.5,41,1]);
    
}

module gbcart() {
    
  translate([-57/2,-12,0]) {
    
    color([0.4,0.4,0.4]) difference() {
      cube([57,32,8]);
      {
        translate([-0.5,-1,8+0.5]) rotate([0,45,0]) translate([-2,0,-2]) cube([4,35,4]);
        translate([57+0.5,-1,8+0.5]) rotate([0,45,0]) translate([-2,0,-2]) cube([4,35,4]);
      }
    }
  }
}

module jack() {
    
  color([0.4,0.4,0.4]) translate([0,0,-0.5]) rotate([-90,0,0]) scale([3,3,10]) cylinder();

  translate([0,0,-5]) scale([0.5,0.5,10]) cylinder();
}

module antenna() {
    
    color([.15,0.25,.15]) cube([15,50,1]);
}

module pcb() { 

  if(0) color([.25,0.5,.25]) 
  translate([-101.6,+134.11,0]) 
    import("../bananarama_pcb.stl", convexity=3); 

  translate([101.785,65.215,-3.54]) rotate([0,0,180]) bpi();
    
  translate([7.09,22.37,10]) lcd();

  translate([-101.6+152.4,50,1.55]) gbcart();
    
  translate([3.575,61.425,3+1.55]) jack();
    
  //translate([-2,10,7.5+1.55/2]) rotate([0,90,0]) antenna();
  //translate([87,12,10]) antenna();
}

module pcb2() { 

  if(0) color([.25,0.5,.25]) 
  translate([-101.6,+134.11,0]) 
    import("../bananarama_pcb.stl", convexity=3); 

  translate([101.785,65.215,-3.54]) rotate([0,0,180]) bpi();
    
  //translate([7.09,65.05,-5]) rotate([0,180,180]) lcd();

  if(1) translate([-101.6+152.4,50,1.55]) gbcart();
    
  translate([3.575,61.425,3+1.55]) jack();
    
  //translate([-2,10,7.5+1.55/2]) rotate([0,90,0]) antenna();
  //translate([87,12,10]) antenna();
}

if (0) {
    
//    top_cart();
//    bottom_cart();
    pcb2();
}

module top_cart_named() {
    
  difference() {
    union() { 
        
        
        top_cart();
        translate([-60/2,-11.75,0.125]) {
            translate([-101.6+152.4,50,1.55]) color([0.4,0.4,0.4]) cube([60,29,7.5]);
        }
    }

    union() { 

        translate([12.5,28,9])
        rotate([0,0,0]) linear_extrude(height = 1) {
            text(text = "BANANAMAX", font = "Interceptor:style=Bold Italic", size = 8);
        }
    
        pcb2();
        
    }
  }  
}

module bottom_cart_named() {
    difference() {
        bottom_cart();
        union() {
            pcb2();
            top_cart_named();
        }
    }
}

top_cart_named();


