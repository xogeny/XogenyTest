within XogenyTest.Tests.Average;
model CheckFailure3 "Check for failure when values don't agree"
  extends CheckSuccess(check_x(finish=7*pi/8));
  annotation(TestCase(action="simulate", result="failure"), experiment(StopTime=8));
end CheckFailure3;
