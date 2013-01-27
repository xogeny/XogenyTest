within XogenyTest.Tests.BecomesTrueAt;
model CheckFailure4
  "Check for failure when expected transition is after simulation end"
  extends CheckSuccess(check_event(at=5)) annotation (TestCase(action=
          "simulate", result="failure"), experiment(StopTime=4));
end CheckFailure4;
