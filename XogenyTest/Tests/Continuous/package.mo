within XogenyTest.Tests;

package Continuous  
  extends Modelica.Icons.Package;





  model CheckSuccessEulerAgainstAnalytical "Simulate this model using Euler method"
    extends Continuous.CheckSuccessAgainstAnalyticalSol(check.MaxAccErr = 1e-2);
    annotation(
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-05, Interval = 0.0025));
  end CheckSuccessEulerAgainstAnalytical;

  annotation(
    Documentation(info = "<html><head></head><body>Package for demonstrating some test cases for the component AssertContrinuousTrajectory</body></html>"));
end Continuous;
