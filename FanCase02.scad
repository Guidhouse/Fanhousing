fanDimensions = [80, 80, 15];
mountDimensions = [40, 40, 10];
fanDiameter = 78;
basedepth = 3;
NumberOfOutlets = 4;
$fn = 50;

base(basedepth, fanDimensions, fanDiameter);
house(-5, -5, 20);
//bases();

module bases(){
translate([20, -5, 20])rotate(-5, [1,0,0])
union(){
  base(basedepth, mountDimensions, 42.5);
  translate([-40, 0,0])
  base(basedepth, mountDimensions, 42.5);
 }
}

module house(deg, y, z){
 difference(){
  union(){
   hull(){
    translate([20, y, z])rotate(deg, [1,0,0])
    translate([0, 0,-2.5])
    cylinder(r=20);
    translate([0, 0,0.5])
    cylinder(h=1, r=fanDiameter/2);
   }
   hull(){
    translate([-20, y, z])rotate(deg, [1,0,0])
    translate([0, 0,-2.5])
    cylinder(r=20);
    translate([0, 0,0.5])
    cylinder(h=1, r=fanDiameter/2);
   }
   hull(){
    translate([5, -30, 5])rotate(20, [1,1,0])
    cylinder(h=18, r1= 8, r2=7);
    translate([-5, -30, 5])rotate(20, [1,-1,0])
    cylinder(h=18, r1= 8, r2=7);
   }
    translate([20, y, z-3.5])rotate(deg, [1,0,0])
    cylinder(h=5, r=19);
    translate([-20, y, z-3.5])rotate(deg, [1,0,0])
    cylinder(h=5, r=19);
  }
  union(){
   hull(){
    translate([20, y, z])rotate(deg, [1,0,0])
    translate([0, 0,-2.5])
    cylinder(r=17.5);
    translate([0, 0,0.5])
    cylinder(h=1, r=fanDiameter/2-1);
   }
   hull(){
    translate([-20, y, z])rotate(deg, [1,0,0])
    translate([0, 0,-2.5])
    cylinder(r=17.5);
    translate([0, 0,0.5])
    cylinder(h=1, r=fanDiameter/2-1);
   }
    translate([5, -30, 5])rotate(20, [1,1,0])
    cylinder(h=20, r1= 7, r2=6);
    translate([-5, -30, 5])rotate(20, [1,-1,0])
    cylinder(h=20, r1= 7, r2=6);
    translate([20, y, z-5])rotate(deg, [1,0,0])
    cylinder(h=8, r=17.5);
    translate([-20, y, z-5])rotate(deg, [1,0,0])
    cylinder(h=8, r=17.5); 
  }
 }
}
module houseSphere(bd, whd, fd, no){
	translate([0,0,basedepth/2])
	difference(){
		union(){
			sphere(fd/2);
			for ( i = [0 : no-1] ){	
			  	rotate( i * 360/no-180/no, [0, 0, 1])
			  	translate([0, fd/3, fd/3])
				rotate( -45, [1, 0, 0])
			  	cylinder(h=2, r=10);
			}
			translate([-25,-25,0])
                        minkowski(){
			cube([40,40,40]);
                        sphere(5);
}
		}
		sphere(fd/2-1.5);
		translate([0,0,-fd/4-bd/2])
		cube([fd,fd,fd/2], center=true);

for ( i = [0 : no-1] ){	
		  	rotate( i * 360/no-180/no, [0, 0, 1])
		  	translate([0, fd/3-1, fd/3-1])
			rotate( -45, [1, 0, 0])
		  	cylinder(h=10, r=8);
		}
	}
base(bd, whd, fd);
}



module reprapFastener(whd){
rd = 8;//RodRadius
dbr = 58;//Distance between rodcenters

translate([-whd[0]/2, -whd[0]/2, 0]) rotate([90,0,0])
cylinder(10);

}

//reprapFastener(fanDimensions);

module base(bd, whd, fd){
cr = 4;
sd = 2.2;
difference(){
	hull(){
		cornerCylinders(bd, [-whd[0]/2+cr, -whd[1]/2+cr, 0], cr);
		cornerCylinders(bd, [whd[0]/2-cr, -whd[1]/2+cr, 0], cr);
		cornerCylinders(bd, [-whd[0]/2+cr, whd[1]/2-cr, 0], cr);
		cornerCylinders(bd, [whd[0]/2-cr, whd[1]/2-cr, 0], cr);
	}
		cornerCylinders(bd + 0.1, [-whd[0]/2+cr, -whd[1]/2+cr, 0], sd);
		cornerCylinders(bd + 0.1, [whd[0]/2-cr, -whd[1]/2+cr, 0], sd);
		cornerCylinders(bd + 0.1, [-whd[0]/2+cr, whd[1]/2-cr, 0], sd);
		cornerCylinders(bd + 0.1, [whd[0]/2-cr, whd[1]/2-cr, 0], sd);
		cornerCylinders(bd + 0.1, [0, 0, 0], (fd/2)-2);
}
	module cornerCylinders(h, pos, rad){
		translate(pos)
		cylinder(h = h, r=rad, center=true);
	}
}


