within XogenyTest.Tests.ValueAt;
model CheckFailure3
  "Check for failure when value is specified after simulation end"
  extends CheckSuccess(check_x(at=5));
  annotation (TestCase(action="simulate", result="failure"), experiment(
        StopTime=4));
end CheckFailure3;
