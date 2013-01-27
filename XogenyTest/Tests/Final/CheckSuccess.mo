within XogenyTest.Tests.Final;
model CheckSuccess
  Real x = 2*time+1;
  AssertFinal check_x(actual=x, expected=9);
  annotation(TestCase(action="simulate", result="success"), experiment(StopTime=4));
end CheckSuccess;
