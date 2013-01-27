within XogenyTest.Tests.LogValue;
function CheckFailure1 "Check for failure when value is incorrect"
algorithm
  assertLogValue(actual=11, expected=1);
  annotation (TestCase(action="call",result="failure"));
end CheckFailure1;
