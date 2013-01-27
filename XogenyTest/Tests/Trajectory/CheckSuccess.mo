within XogenyTest.Tests.Trajectory;
model CheckSuccess
  Real x = time^2;
  AssertTrajectory check_x(actual=x, expected=[0,0; 1,1; 2,4; 3,9]);
  annotation(TestCase(action="simulate", result="success"), experiment(StopTime=4));
end CheckSuccess;
