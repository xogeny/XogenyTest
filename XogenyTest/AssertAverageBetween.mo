within XogenyTest;
model AssertAverageBetween "Assert an average value between two times."
  parameter Real average;
  parameter Real start;
  parameter Real finish;
  parameter Real eps=1e-6;
  input Real signal;
protected
  Real integral;
initial equation
  integral = 0;
  assert(finish>start,
    "The end of interval must be after start of interval.");
  assert(time<=start, "The simulation started after the interval.");
equation
  der(integral) = if (time<start) then 0 else signal;
  when time>=finish then
    assert(abs((integral/(finish-start))-average)<eps,
      "The average value between times "+String(start)+" and "+String(
      finish)+" was "+String(average)+" but should have been within "
      +String(eps)+" of "+String(integral/(finish-start))+".");
  end when;
algorithm
  when terminal() then
    assert(time>=finish,
      "The simulation terminated before the interval was completed.");
    // Note:  In Dymola 7.4, the simulation log may state "Integration
    // terminated successfully" and then the assertion statement below it.
  end when;
end AssertAverageBetween;
