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
 
 annotation(
    Documentation(info = "<html><head></head><body><div>A testing facitilty for ensuring the correctness of a continuous variabl. Can be useful in checking a solution when</div><div><ul><li>Analytical solution is known in advance&nbsp;</li><li>Comparing a new implementation with an old one&nbsp;</li><li>Validating a new numerical solvers&nbsp;</li></ul><div>Practical usage can be followed by the GenKinetics library, see <a href=\"https://github.com/AtiyahElsheikh/GenKinetics\">here</a>.&nbsp;</div></div><div><br></div><div>Developed by Atiyah Elsheikh</div></body></html>"),
    Icon(graphics = {Rectangle(origin = {-14, -1}, lineColor = {0, 0, 127}, pattern = LinePattern.DashDotDot, extent = {{-86, 101}, {114, -99}})}));

end AssertContinuousTrajectory;
