within XogenyTest.Tests.Trajectory;
model CheckFailure3 "Check for failure when all points aren't checked"
  extends CheckSuccess(check_x(expected=[0,0; 1,1; 5,25]));
  annotation(TestCase(action="simulate", result="failure"), experiment(StopTime=4));
end CheckFailure3;
