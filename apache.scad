
length=215;
width=113.5;
$fn=$preview ? 30 : 90;

module top(height=10, thickness=1, d=20, hollowed=false){
  top_extra=0;
  difference(){
    hull() for(X=[-1,1], Y=[-1,1]){
      translate([(length/2-d/2)*X,(width/2-d/2+top_extra)*Y,0])
        cylinder(d=d,h=0.1,center=true);
      
      translate([(length/2-d/2)*X,(width/2-d/2+top_extra)*Y,height])
        sphere(d=d);
    }
    hull() for(X=[-1,1]) 
      translate([55*X,width/2+top_extra,7]) 
        cylinder(d=12,h=height+d/2-6);
    if( hollowed ) union(){
      difference(){
        translate([0,0,-thickness])
        hull() for(X=[-1,1], Y=[-1,1]){
          translate([(length/2-d/2-thickness)*X,(width/2-d/2+top_extra-thickness)*Y,0])
            cylinder(d=d,h=0.1,center=true);
          
          translate([(length/2-d/2-thickness)*X,(width/2-d/2+top_extra-thickness)*Y,height])
            sphere(d=d);
        }
        translate([0,-thickness,-thickness])
        hull() for(X=[-1,1]) 
          translate([55*X,width/2+top_extra,7]) 
            cylinder(d=12,h=height+d/2-6);
      }
    }
  }
}


module bottom(height=29, thickness=1, d=20, hollowed=false){
  difference(){
    hull() for(X=[-1,1], Y=[-1,1]){
      translate([(length/2-d/2)*X,(width/2-d/2)*Y,0])
        cylinder(d=d,h=0.1,center=true);
      
      translate([(length/2-d/2-2)*X,(width/2-d/2-2)*Y,-height])
        sphere(d=d);
    }
    if( hollowed )
    hull() for(X=[-1,1], Y=[-1,1]){
      translate([(length/2-d/2-thickness)*X,(width/2-d/2-thickness)*Y,0])
        cylinder(d=d,h=0.2,center=true);
      
      translate([(length/2-d/2-2-thickness)*X,(width/2-d/2-2-thickness)*Y,-height+thickness])
        sphere(d=d);
    }
  }
}
