within XogenyTest.Tests.Continuous;

model CheckFailureEulerAgainstAnalytical "Simulate this model using Euler method"
  extends Continuous.CheckSuccessAgainstAnalyticalSol(check.MaxAccErr = 1e-4);
  annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-05, Interval = 0.0025),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "euler"),TestCase(action="simulate", result="failure"));
end CheckFailureEulerAgainstAnalytical;
