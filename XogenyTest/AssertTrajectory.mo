within XogenyTest;
model AssertTrajectory
  parameter Real expected[:,2];
  parameter Real eps=1e-6;
  input Real actual;
protected
  Integer cur(start=1,fixed=true);
algorithm
  when initial() then
    assert(size(expected,1)>0,
      "The expected trajectory contains no points.");
    assert(expected[1,1]>=time,
      "Some trajectory points precede the simulation.");
    cur := 1;
    if (expected[1,1]>=time and expected[1,1]<=time) then
      assertValue(
          actual,
          expected[cur,2],
          eps);
      cur := 2;
    end if;
  end when;
  when cur<=size(expected,1) and time>=expected[cur,1] then
    assertValue(
        actual,
        expected[cur,2],
        eps);
    cur := pre(cur) + 1;
  end when;
  when terminal() then
    assert(cur>size(expected, 1),
      "The simulation ended before all trajectory points could be checked.");
    // Note:  In Dymola 7.4, the simulation log may state "Integration
    // terminated successfully" and then the assertion statement below it.
  end when;
end AssertTrajectory;
