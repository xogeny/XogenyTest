within XogenyTest.Tests.LogValues;
function CheckFailure1 "Check for failure when a value is incorrect"
algorithm
  assertLogValues(actual={1,101}, expected={10,10});
  annotation (TestCase(action="call",result="failure"));
end CheckFailure1;
