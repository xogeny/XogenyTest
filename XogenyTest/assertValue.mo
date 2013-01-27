within XogenyTest;
function assertValue "Assert that a value is within specification"
  input Real actual "Actual value";
  input Real expected "Expected value";
  input Real eps=1e-7 "Error tolerance";
  input String name="" "Name of test";
algorithm
  assert(abs(actual - expected) <= eps, (if name <> "" then "Test " + name +
    " failed.\n" else "") + "The actual value (" + String(actual) +
    ") was not within " + String(eps) + " of the expected value (" + String(
    expected) + ").") annotation (Inline=true);
end assertValue;
