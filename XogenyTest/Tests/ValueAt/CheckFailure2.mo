within XogenyTest.Tests.ValueAt;
model CheckFailure2 "Check for failure when value is incorrect"
  extends CheckSuccess(x=time);
  annotation (TestCase(action="simulate", result="failure"), experiment(
        StopTime=4));
end CheckFailure2;
