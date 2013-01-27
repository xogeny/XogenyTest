within XogenyTest.Tests.ValueAt;
model CheckSuccess
  Real x=2*time + 1;
  AssertValueAt check_x(
    actual=x,
    expected=5,
    at=2);
  annotation(TestCase(action="simulate", result="success"), experiment(
        StopTime=4));
end CheckSuccess;
