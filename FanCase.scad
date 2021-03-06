fanDimensions = [80, 80, 10];
mountDimensions = [40, 40, 10];
fanDiameter = 78;
basedepth = 5;
numberOfOutlets = 4;
$fn = 50;

base(fanDimensions, fanDiameter, basedepth);
house(fanDimensions, fanDiameter, numberOfOutlets);
translate([20, -10, 40])//rotate(40, [1,0,0])
union(){
 base(mountDimensions, fanDiameter/2, basedepth);
 translate([-40, 0,0])
 base(mountDimensions, fanDiameter/2, basedepth);
}

module house(whd, fd, noo){
	translate([0,0,basedepth/1.5])
	difference(){
union(){
cylinders(10, noo, fd/2+2);

		sphere(fd/2+1.5);

}
		sphere(fd/2);
		translate([-fd/2-1.5,-fd/2-1.5,-fd/2-1.5])
		cube([fd+3,fd+3,fd/2+3]);
                cylinders(8, noo, fd);
        }
        
}

module cylinders(rad, noo, fd){
	for(i = [0: noo-1]){
		rotate( i * 360 / noo-180/noo, [0, 0, 1])
		rotate(-45, [1,0,0])
		cylinder(h=fd, r=rad);
}
}



module base(whd, fd, bd){
cr = 4;
sd = 2.3;
difference(){
	hull(){
		cornerCylinders([-whd[0]/2+cr, -whd[1]/2+cr, bd/2], cr, bd);
		cornerCylinders([whd[0]/2-cr, -whd[1]/2+cr, bd/2], cr, bd);
		cornerCylinders([-whd[0]/2+cr, whd[1]/2-cr,bd/2], cr, bd);
		cornerCylinders([whd[0]/2-cr, whd[1]/2-cr, bd/2], cr, bd);
	}
		cornerCylinders([-whd[0]/2+cr, -whd[1]/2+cr, bd/2], sd, bd+1);
		cornerCylinders([whd[0]/2-cr, -whd[1]/2+cr,  bd/2], sd, bd+1);
		cornerCylinders([-whd[0]/2+cr, whd[1]/2-cr,  bd/2], sd, bd+1);
		cornerCylinders([whd[0]/2-cr, whd[1]/2-cr,  bd/2], sd, bd+1);
		cornerCylinders([0, 0, 1], fd/2, bd+4);
}
	module cornerCylinders(pos, rad, bd){
		translate(pos)
		cylinder(h = bd, r=rad, center=true);
	}
}


