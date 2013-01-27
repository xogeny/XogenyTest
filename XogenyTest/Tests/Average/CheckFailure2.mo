within XogenyTest.Tests.Average;
model CheckFailure2 "Check for failure when simulation ends before interval"
  extends CheckSuccess(check_x(start=pi,finish=3*pi));
  annotation(TestCase(action="simulate", result="failure"), experiment(StopTime=8));
end CheckFailure2;
