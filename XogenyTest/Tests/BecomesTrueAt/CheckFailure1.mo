within XogenyTest.Tests.BecomesTrueAt;
model CheckFailure1
  "Check for failure when expected transition is before simulation start"
  extends CheckSuccess(check_event(at=-1));
  annotation(TestCase(action="simulate", result="failure"), experiment(StopTime
        =4));
end CheckFailure1;
