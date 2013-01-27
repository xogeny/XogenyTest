within XogenyTest;
model AssertBecomesTrueAt
  parameter Modelica.SIunits.Time at;
  parameter Modelica.SIunits.Time eps=1e-6;
  input Boolean event;
algorithm
  when initial() then
    assert(at>time+eps, "The expected crossing time is before the start of the simulation.");
  end when;
  when time>=at-eps then
    assert(not event, "The signal became true before expected crossing time.");
  end when;
  when time>=at+eps then
    assert(event, "The signal was not true by the expected crossing time.");
  end when;
  when terminal() then
    assert(time >= at + eps,
      "The expected crossing time is after the end of the simulation.");
    // Note:  In Dymola 7.4, the simulation log may state "Integration
    // terminated successfully" and then the assertion statement below it.
  end when;
end AssertBecomesTrueAt;
