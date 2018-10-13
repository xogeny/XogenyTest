within XogenyTest;

model AssertContinuousTrajectory "Assert correctness of a whole solution trajectory"

input Real T1 "First trajectory"; 
input Real T2 "Second trajectory"; 

parameter Real MaxAccErr = 1e-3 "Maximum Accumulation Error"; 
parameter Real eps = 1e-7;  
parameter String testName = "" "Name of Test";
protected 
Real diff "Absolute value difference between two trajectories"; 
Real Area "Area under diff trajectory"; 

equation 

 diff = T1 - T2; 
 der(Area) = if (diff > 0) then diff else -diff; 
 
 when terminal() then
  XogenyTest.assertValue(Area,MaxAccErr,eps,testName);
 end when; 

annotation(
    Documentation(info = "<html><head></head><body>A testing facitilty for ensuring the correctness of a continuous variabl. Can be useful in checking a solution when<div><br></div><div><ul><li>Analytical solution is known in advance&nbsp;</li><li>Comparing a new implementation with an old one&nbsp;</li><li>Validating a new numerical solvers&nbsp;</li></ul><div>Practical usage can be followed by the GenKinetics library, see <a href=\"https://github.com/AtiyahElsheikh/GenKinetics\">here</a>.</div></div></body></html>"));end AssertContinuousTrajectory;
