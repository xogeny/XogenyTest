within XogenyTest;

model AssertContinuousTrajectory "Assert correctness of a whole solution trajectory"

input Modelica.Blocks.Interfaces.RealInput T1 "First trajectory" annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-96, 66}, extent = {{-20, -20}, {20, 20}}, rotation = 0))); 
input Modelica.Blocks.Interfaces.RealInput T2 "Second trajectory" annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-94, -76}, extent = {{-20, -20}, {20, 20}}, rotation = 0))); 

parameter Real MaxAccErr = 1e-3 "Maximum Accumulation Error"; 
parameter String testName = "" "Name of Test";

  Modelica.Blocks.Interfaces.RealOutput Area "The area of the difference between the input trajectories" annotation(
    Placement(visible = true, transformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

protected 

Real diff "Absolute value difference between two trajectories"; 

equation 

 diff = T1 - T2; 
 der(Area) = if (diff > 0) then diff else -diff; 
 
 when terminal() then
  XogenyTest.assertValue(Area,0,eps=MaxAccErr,name=testName);
 end when; 

annotation(
    Documentation(info = "<html><head></head><body>A testing facitilty for ensuring the correctness of a continuous variabl. Can be useful in checking a solution when<div><br></div><div><ul><li>Analytical solution is known in advance&nbsp;</li><li>Comparing a new implementation with an old one&nbsp;</li><li>Validating a new numerical solvers&nbsp;</li></ul><div>Practical usage can be followed by the GenKinetics library, see <a href=\"https://github.com/AtiyahElsheikh/GenKinetics\">here</a>.</div></div></body></html>"));end AssertContinuousTrajectory;
