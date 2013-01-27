within XogenyTest.Tests.Values;
function CheckSuccess
algorithm
  assertValues(actual={1,1 + 1e-4}, expected={1,1}, eps=1e-4);
  annotation (TestCase(action="call",result="success"));
end CheckSuccess;
