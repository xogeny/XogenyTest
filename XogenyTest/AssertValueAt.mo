within XogenyTest;
model AssertValueAt "Assert the initial value of a signal at a specific time"
  parameter Real expected;
  parameter Modelica.SIunits.Time at;
  parameter Real eps=1e-6;
  input Real actual;
algorithm
  when initial() then
    assert(at >= time,
      "The specified time is before the start of the simulation.");
  end when;
  when time>=at then
    assertValue(
        actual,
        expected,
        eps);
  end when;
  when terminal() then
    assert(time >= at,
      "The specified time is after the end of the simulation.");
    // Note:  In Dymola 7.4, the simulation log may state "Integration
    // terminated successfully" and then the assertion statement below it.
  end when;
end AssertValueAt;
