within XogenyTest.Tests.BecomesTrueAt;
model CheckFailure3 "Check for failure when transition is late"
  extends CheckSuccess(check_event(event=(x > 3)));
  annotation (TestCase(action="simulate", result="success"), experiment(
        StopTime=4));
end CheckFailure3;
