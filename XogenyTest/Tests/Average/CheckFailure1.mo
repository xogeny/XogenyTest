within XogenyTest.Tests.Average;
model CheckFailure1
  "Check for failure when starting in the middle of the interval"
  extends CheckSuccess(check_x(start=-pi,finish=pi));
  annotation(TestCase(action="simulate", result="failure"), experiment(StopTime=8));
end CheckFailure1;
