within XogenyTest.Tests.Continuous;

model CheckSuccessAgainstAnalyticalSol

parameter Real x0 = 1; 
Real x(start=x0); 
Real x_ana; 
Real error; 

AssertContinuousTrajectory check(name="check analytical"); 

equation

  der(x) = time; 
  x_ana = time * time / 2 + x0 ; 
  
  connect(x,check.T1);
  connect(x_ana,check.T2); 
  connect(error,check.Area);  

annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
    
end CheckSuccessAgainstAnalyticalSol;
