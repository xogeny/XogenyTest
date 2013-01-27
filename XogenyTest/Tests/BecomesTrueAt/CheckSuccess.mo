within XogenyTest.Tests.BecomesTrueAt;
model CheckSuccess
  Real x = time;
  AssertBecomesTrueAt check_event(event=(x>2), at=2);
  annotation(TestCase(action="simulate", result="success"), experiment(StopTime=4));
end CheckSuccess;
