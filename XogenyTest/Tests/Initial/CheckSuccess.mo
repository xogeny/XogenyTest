within XogenyTest.Tests.Initial;
model CheckSuccess
  Real x = 2*time+1;
  AssertInitial check_x(actual=x, expected=1);
  annotation(TestCase(action="simulate", result="success"));
end CheckSuccess;
