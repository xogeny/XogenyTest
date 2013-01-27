within XogenyTest.Tests.ValueAt;
model CheckFailure1
  "Check for failure when value is specified before simulation start"
  extends CheckSuccess(check_x(at=-1));
  annotation (TestCase(action="simulate", result="failure"), experiment(
        StopTime=4));
end CheckFailure1;
