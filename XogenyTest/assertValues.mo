within XogenyTest;
function assertValues "Assert that values are within specification"
  input Real actual[:] "Actual values";
  input Real expected[size(actual, 1)] "Expected values";
  input Real eps=1e-7 "Error tolerance";
  input String name="" "Name of test";
algorithm
  for i in 1:size(actual, 1) loop
    assert(abs(actual[i] - expected[i]) <= eps, "Test " + String(i) + (if name <> "" then
            " of " + name else "") + " failed.\n" + "The actual value (" +
      String(actual[i]) + ") was not within " + String(eps) + " of the expected value ("
       + String(expected[i]) + ").") annotation (Inline=true);
  end for;
end assertValues;
