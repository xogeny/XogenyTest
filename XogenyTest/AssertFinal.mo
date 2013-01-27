within XogenyTest;
model AssertFinal "Assert the final value of a signal"
  parameter Real expected;
  parameter Real eps=1e-6;
  input Real actual;
algorithm
  when terminal() then
    assertValue(
        actual,
        expected,
        eps);
    // Note:  In Dymola 7.4, the simulation log may state "Integration
    // terminated successfully" and then the assertion statement below it.
  end when;
end AssertFinal;
