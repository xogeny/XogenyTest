within XogenyTest.Tests.BecomesTrueAt;
model CheckFailure2 "Check for failure when transition is early"
  extends CheckSuccess(check_event(event=(x>1)));
  annotation(TestCase(action="simulate", result="failure"), experiment(StopTime
        =4));
end CheckFailure2;
