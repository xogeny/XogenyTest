within XogenyTest.Tests.Average;
model CheckSuccess "Check for successful value of average"
  Real x = sin(2*time);
  AssertAverageBetween check_x(
    average=0,
    start=0,
    finish=2*pi,
    signal=x,
    eps=1e-4);
  annotation(TestCase(action="simulate", result="success"), experiment(StopTime=8));
end CheckSuccess;
