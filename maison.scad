
tla=27.33;
tlg=27.17;
dsud=5;
dest=5;
mla=8.58;
mhm=2.5;
mlg=10.98;
mhv=0.6;
gla=10;
glg=4.6;
ghm=mhm+mhv;

module maison()
{
	cube([mla,mlg,mhv]);
	translate([0,0,mhv])
		cube([mla,mlg,mhm]);
}

module garage()
{
	cube([gla,glg,ghm]);
}


module terrain()
{
	cube([tla,tlg,0.1]);
	translate([tla-mla-dest,dsud,0])
	{
		maison();
	}
	translate([tla-gla-dest,mlg+dsud,0])
	{
		garage();
	}
}

terrain();


