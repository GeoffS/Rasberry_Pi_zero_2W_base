include <../OpenSCADdesigns/MakeInclude.scad>
ctrs = [23/2, 29, 0];

baseZ = 4;
standoffZ = baseZ + 4.5;

holeDia = 3;

module itemModule()
{
	difference()
	{
		union()
		{
			hull()
			{
				doubleX() doubleY() tcy(ctrs, d=20, h=baseZ);
			}
			doubleX() doubleY() translate(ctrs)
			{
				cylinder(d=5, h=standoffZ);
				d = 19;
				cylinder(d1=d, d2=0, h=d/2);
			}
		}

		// Holes:
		doubleX() doubleY() translate(ctrs)
		{
			tcy([0,0,-20], d=holeDia, h=40);
			translate([0,0,-5+holeDia/2+2.5]) cylinder(d2=0, d1=10, h=5);
		}
	}
}

module clip(d=0)
{
	//tc([-200, -400-d, -10], 400);
	tcu([-200, -ctrs[1]-400, -200], 400);
}

if(developmentRender)
{
	display() itemModule();
	displayGhost() boardGhost();
}
else
{
	itemModule();
}

module boardGhost()
{
	difference() 
	{
		hull()
		{
			translate([0,0,standoffZ]) doubleX() doubleY() tcy(ctrs, d=2*3.5, h=1);
		}
		doubleX() doubleY() tcy(ctrs+[0,0,-20], d=2.67, h=40);
	}
}
