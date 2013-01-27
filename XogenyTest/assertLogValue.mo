within XogenyTest;
function assertLogValue
  "Assert that a value is within orders of magnitude of specification"
  import Modelica.Constants.small;
  import Modelica.Math.log10;
  input Real actual "Actual value";
  input Real expected "Expected value";
  input Real o=1 "Error tolerance in orders of magnitude";
  input String name="" "Name of test";
algorithm
  assert((abs(actual) < small and abs(expected) < small) or abs(log10(actual/expected)) <= o, (if name <> "" then "Test " + name + " failed.\n" else
          "") + "The actual value (" + String(actual) + ") was not within " +
    String(o) + " orders of magnitude of the expected value (" + String(
    expected) + ").") annotation (Inline=true);
end assertLogValue;
