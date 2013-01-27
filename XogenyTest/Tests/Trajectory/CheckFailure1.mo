within XogenyTest.Tests.Trajectory;
model CheckFailure1 "Check for failure when first point is before start"
  extends CheckSuccess(check_x(expected=[-1,1; 0,0; 1,1]));
  annotation(TestCase(action="simulate", result="failure"), experiment(StopTime=4));
end CheckFailure1;
