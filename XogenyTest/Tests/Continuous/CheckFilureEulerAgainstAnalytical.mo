within XogenyTest.Tests.Continuous;

model CheckFilureEulerAgainstAnalytical
  extends Continuous.CheckSuccessAgainstAnalyticalSol(check.MaxAccErr = 1e-4);
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-05, Interval = 0.0025));
end CheckFilureEulerAgainstAnalytical;
