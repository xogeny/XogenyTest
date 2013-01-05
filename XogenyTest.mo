within ;
package XogenyTest
  "This is a stand-alone library to facilitate assertion based testing of Modelica code"

  model AssertTrajectory
    parameter Real expected[:,2];
    parameter Real eps=1e-6;
    input Real actual;
  protected
    Integer cur;
  algorithm
    when initial() then
      assert(size(expected,1)>0, "Error, expected trajectory contains no points");
      assert(expected[1,1]>=time, "Assertion failed because some points in the trajectory came before the start of the simulation");
      cur := 1;
      if (expected[1,1]>=time and expected[1,1]<=time) then
        assert(abs(actual-expected[cur,1])<eps, "Actual input value ("+String(actual)+") was not within "+String(eps)+" of the expected result: "+String(expected[cur,2]));
        cur := 2;
      end if;
    end when;
    when cur<=size(expected,1) and time>=expected[cur,2] then
      assert(abs(actual-expected[cur,1])<eps, "Actual input value ("+String(actual)+") was not within "+String(eps)+" of the expected result: "+String(expected[cur,2]));
      cur := pre(cur) + 1;
    end when;
    when terminal() then
      assert(cur>size(expected,1), "Assertion failed because simulation ended before all trajectory points could be checked");
    end when;
  end AssertTrajectory;

  model AssertBecomesTrueAt
    parameter Real expected;
    parameter Real eps=1e-6;
    input Boolean actual;
  protected
    Boolean checked;
  algorithm
    when initial() then
      checked := false;
      assert(expected>time+eps, "Expected crossing time is not in the future at simulation start");
    end when;
    when time>=expected-eps then
      assert(not actual, "Signal became true before expected crossing time");
    end when;
    when time>=expected+eps then
      assert(actual, "Signal was not true by the expected crossing time");
    end when;
  end AssertBecomesTrueAt;

  model AssertInitial "Assert the initial value of a signal"
    parameter Real expected;
    parameter Real eps=1e-6;
    input Real actual;
  algorithm
    when initial() then
      assert(abs(expected-actual)<eps, "Expected value, "+String(expected)+", didn't match actual value, "+String(actual)+" at time="+String(time));
    end when;
  end AssertInitial;

  model AssertFinal "Assert the final value of a signal"
    parameter Real expected;
    parameter Real eps=1e-6;
    input Real actual;
  algorithm
    when terminal() then
      assert(abs(expected-actual)<eps, "Expected value, "+String(expected)+", didn't match actual value, "+String(actual)+" at time="+String(time));
    end when;
  end AssertFinal;

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
    assert(finish>start, "End of interval must be after start of interval");
    assert(time<=start, "Simulation started after interval");
  equation
    der(integral) = if (time<start) then 0 else signal;
    when time>=finish then
      assert(abs((integral/(finish-start))-average)<eps, "Expected average value of "+String(average)+" between "+String(start)+" and "+String(finish)+" but got "+String(integral/(finish-start)));
    end when;
  algorithm
    when terminal() then
      assert(time>=finish, "Simulation terminated before interval was completed");
    end when;
  end AssertAverageBetween;

  package Tests "A library to test the assertion primitives in this library"
    package Trajectory "Tests on the AssertTrajectory model"
      model CheckSuccess
        Real x = time;
        AssertTrajectory check_x(actual=x, expected=[0,0; 1,1; 2,2; 3,3]);
        annotation(TestCase(action="simulate", result="success"), experiment(StopTime=4));
      end CheckSuccess;

      model CheckFailure1
        "Check to make sure this fails if first point is before start"
        Real x = time;
        AssertTrajectory check_x(actual=x, expected=[-1,-1; 1,1; 2,2; 3,3]);
        annotation(TestCase(action="simulate", result="failure"), experiment(StopTime=4));
      end CheckFailure1;

      model CheckFailure2 "Check to make sure values match during simulation"
        Real x = time;
        AssertTrajectory check_x(actual=x, expected=[0,0; 1,1; 2,2.5; 3,3]);
        annotation(TestCase(action="simulate", result="failure"), experiment(StopTime=4));
      end CheckFailure2;

      model CheckFailure3 "Check to make sure all points are checked"
        Real x = time;
        AssertTrajectory check_x(actual=x, expected=[0,0; 1,1; 2,2; 8,8]);
        annotation(TestCase(action="simulate", result="failure"), experiment(StopTime=4));
      end CheckFailure3;
    end Trajectory;

    package BecomesTrueAt "Tests on the AssertBecomesTrueAt model"
      model CheckSuccess
        Real x = time;
        AssertBecomesTrueAt check_event(actual=(x>2), expected=2);
        annotation(TestCase(action="simulate", result="success"), experiment(StopTime=4));
      end CheckSuccess;

      model CheckFailure1 "Check case of early transition"
        Real x = time;
        AssertBecomesTrueAt check_event(actual=(x>1), expected=2);
        annotation(TestCase(action="simulate", result="failure"), experiment(StopTime=4));
      end CheckFailure1;

      model CheckFailure2 "Check for case of late transition"
        Real x = time;
        AssertBecomesTrueAt check_event(actual=(x>3), expected=2);
        annotation(TestCase(action="simulate", result="success"), experiment(StopTime=4));
      end CheckFailure2;
    end BecomesTrueAt;

    package Initial "Tests associated with AssertInitial model"
      model CheckSuccess
        Real x = 2*time+1;
        AssertInitial check_x(actual=x, expected=1);
        annotation(TestCase(action="simulate", result="success"), experiment(StopTime=
                4));
      end CheckSuccess;

      model CheckFailure1 "Check to see that the initial check is correct"
        Real x = 2*time+1;
        AssertInitial check_x(actual=x, expected=2);
        annotation(TestCase(action="simulate", result="failure"), experiment(StopTime=4));
      end CheckFailure1;
    end Initial;

    package Final "Tests associated with AssertFinal model"
      model CheckSuccess
        Real x = 2*time+1;
        AssertFinal check_x(actual=x, expected=5);
        annotation(TestCase(action="simulate", result="success"), experiment(StopTime=
                4));
      end CheckSuccess;

      model CheckFailure1 "Check to see that the initial check is correct"
        Real x = 2*time+1;
        AssertFinal check_x(actual=x, expected=4);
        annotation(TestCase(action="simulate", result="failure"), experiment(StopTime=4));
      end CheckFailure1;
    end Final;

    package Average "Test the average value between two points in time."
      constant Real pi=3.141592653589793238462643383279502884197169399;

      model CheckSuccess "Check for successful value of average"
        Real x = sin(2*time);
        AssertAverageBetween check_x(average=0,start=0,finish=pi,signal=x,eps=1e-4);
        annotation(TestCase(action="simulate", result="success"), experiment(StopTime=
                8));
      end CheckSuccess;

      model CheckSuccess2 "Check for a longer interval"
        Real x = sin(2*time);
        AssertAverageBetween check_x(average=0,start=0,finish=2*pi,signal=x,eps=1e-4);
        annotation(TestCase(action="simulate", result="success"), experiment(StopTime=
                8));
      end CheckSuccess2;

      model CheckFailure1
        "Check for failure when starting in the middle of the interval"
        Real x = sin(2*time);
        AssertAverageBetween check_x(average=0,start=-pi,finish=pi,signal=x,eps=1e-4);
        annotation(TestCase(action="simulate", result="failure"), experiment(StopTime=8));
      end CheckFailure1;

      model CheckFailure2
        "Check for failure when simulation ends before interval"
        Real x = sin(2*time);
        AssertAverageBetween check_x(average=0,start=0,finish=3*pi,signal=x,eps=1e-4);
        annotation(TestCase(action="simulate", result="failure"), experiment(StopTime=8));
      end CheckFailure2;

      model CheckFailure3 "Check for failure when values don't agree"
        Real x = sin(2*time);
        AssertAverageBetween check_x(average=0,start=0,finish=7*pi/8,signal=x,eps=1e-4);
        annotation(TestCase(action="simulate", result="failure"), experiment(StopTime=8));
      end CheckFailure3;
    end Average;
  end Tests;
  annotation (uses(Modelica(version="3.2")));
  package Features
  end Features;

end XogenyTest;
