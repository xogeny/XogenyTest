within XogenyTest;
function assertLogValues
  "Assert that values are within orders of magnitude of specification"
  import Modelica.Constants.small;
  import Modelica.Math.log10;
  input Real actual[:] "Actual values";
  input Real expected[size(actual,1)] "Expected values";
  input Real o=1 "Error tolerance in orders of magnitude";
  input String name="" "Name of test";
algorithm
  for i in 1:size(actual, 1) loop
    assert((abs(actual[i]) < small and abs(expected[i]) < small) or abs(log10(actual[i]/expected[i])) <= o, "Test " + String(i) + (if
      name <> "" then " of " + name else "") + " failed.\n" + "The actual value ("
       + String(actual[i]) + ") was not within " + String(o) + " orders of magnitude of the expected value ("
       + String(expected[i]) + ").") annotation (Inline=true);
  end for;
end assertLogValues;
