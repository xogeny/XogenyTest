within XogenyTest.Tests.Final;
model CheckFailure1 "Check for failure when final value is incorrect"
  extends CheckSuccess(x=time);
  annotation(TestCase(action="simulate", result="failure"), experiment(StopTime=4));
end CheckFailure1;
