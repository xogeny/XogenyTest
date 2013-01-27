within XogenyTest.Tests.LogValue;
function CheckSuccess
algorithm
  assertLogValue(actual=10, expected=1);
  annotation (TestCase(action="call",result="success"));
end CheckSuccess;
