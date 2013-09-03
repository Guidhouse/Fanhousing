fanDimensions = [80, 80, 10];
fanDiameter = 78;
basedepth = 54;
numberOfOutlets = 4;
$fn = 50;


base(fanDimensions, fanDiameter);
house(fanDimensions, fanDiameter, numberOfOutlets);


module house(whd, fd, noo){
	translate([0,0,basedebth/2])
	difference(){
		sphere(fd/2+1.5);
		sphere(fd/2);
		translate([-fd/2-1.5,-fd/2-1.5,-fd/2-1.5])
		cube([fd+3,fd+3,fd/2+3]);
                cylinders(8, noo, fd);
        }
	        cylinders(8, noo, fd);
        
}




module cylinders(rad, noo, fd){
	for(i = [0: noo-1]){
		rotate( i * 360 / noo-180/noo, [0, 0, 1])
		rotate(-45, [1,0,0])
		difference(){
	  	cylinder(h=fd, r=rad+2 );
		cylinder(h=fd, r=rad);
	}
}
}



module base(whd, fd){
cr = 8;
sd = 4;
difference(){
	hull(){
		cornerCylinders([-whd[0]/2+cr, -whd[1]/2+cr, 0], cr);
		cornerCylinders([whd[0]/2-cr, -whd[1]/2+cr, 0], cr);
		cornerCylinders([-whd[0]/2+cr, whd[1]/2-cr, 0], cr);
		cornerCylinders([whd[0]/2-cr, whd[1]/2-cr, 0], cr);
	}
		cornerCylinders([-whd[0]/2+cr, -whd[1]/2+cr, 0], sd);
		cornerCylinders([whd[0]/2-cr, -whd[1]/2+cr, 0], sd);
		cornerCylinders([-whd[0]/2+cr, whd[1]/2-cr, 0], sd);
		cornerCylinders([whd[0]/2-cr, whd[1]/2-cr, 0], sd);
		cornerCylinders([0, 0, 0], fd/2);
}
	module cornerCylinders(pos, rad){
		translate(pos)
		cylinder(h = 5, r=rad, center=true);
	}
}


