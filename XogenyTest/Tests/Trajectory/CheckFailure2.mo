within XogenyTest.Tests.Trajectory;
model CheckFailure2
  "Check for failure when values don't match during simulation"
  extends CheckSuccess(x=time);
  annotation(TestCase(action="simulate", result="failure"), experiment(StopTime=4));
end CheckFailure2;
