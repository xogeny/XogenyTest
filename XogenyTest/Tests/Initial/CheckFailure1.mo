within XogenyTest.Tests.Initial;
model CheckFailure1 "Check for failure when initial value is incorrect"
  extends CheckSuccess(x=time);
  annotation(TestCase(action="simulate", result="failure"));
end CheckFailure1;
