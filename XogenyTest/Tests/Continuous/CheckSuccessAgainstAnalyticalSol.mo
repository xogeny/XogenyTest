within XogenyTest.Tests.Continuous;
model CheckSuccessAgainstAnalyticalSol
  parameter Real x0 = 1;
  Real x(start = x0);
  Real x_ana;
  Real error;
  AssertContinuousTrajectory check(MaxAccErr = 1e-5, name = "check analytical");
equation
  der(x) = time;
  x_ana = time * time / 2 + x0;
  x =  check.T1;
  x_ana = check.T2;
  error = check.Area;
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end CheckSuccessAgainstAnalyticalSol;
