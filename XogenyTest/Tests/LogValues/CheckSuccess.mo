within XogenyTest.Tests.LogValues;
function CheckSuccess
algorithm
  assertLogValues(actual={0,1,100}, expected={0,10,10});
  annotation (TestCase(action="call",result="success"));
end CheckSuccess;
