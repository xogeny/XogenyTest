within XogenyTest;
model AssertInitial "Assert the initial value of a signal"
  parameter Real expected;
  parameter Real eps=1e-6;
  input Real actual;
algorithm
  when initial() then
    assertValue(
        actual,
        expected,
        eps);
  end when;
end AssertInitial;
