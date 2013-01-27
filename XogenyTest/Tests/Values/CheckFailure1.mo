within XogenyTest.Tests.Values;
function CheckFailure1 "Check for failure when a value is incorrect"
algorithm
  assertValues(actual={1,2}, expected={1,1});
  annotation (TestCase(action="call",result="failure"));
end CheckFailure1;
