within XogenyTest;

model AssertContinuousTrajectory "Assert correctness of a whole solution trajectory"

input Real T1 "First trajectory"  ; 
input Real T2 "Second trajectory" ; 

parameter Real MaxAccErr = 1e-3 "Maximum Accumulation Error"; 
parameter String name = "" "Name of Test";


output Real Area "The area of the difference between the input trajectories";

protected 

Real diff "Absolute value difference between two trajectories"; 

equation 

 diff = abs(T1 - T2); 
 der(Area) = diff; 
 
 when terminal() then
   assert(Area < MaxAccErr, (if name <> "" then "Test " + name +
    " failed.\n" else "") + " The area between the input trajectories was more than " + String(MaxAccErr) + ").") annotation (Inline=true);
 end when; 

end AssertContinuousTrajectory;
