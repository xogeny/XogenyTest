XogenyTest
==========

This is just a start, I think the potential enhancements are obvious.
The goal of the library is to provide a set of models to perform common
and complex assertions on simulated models.  The library is quite
deliberately NOT part for the Modelica Standard Library and quite
deliberately avoids any references to the MSL as well.

I've included test cases on these assertion models.  In other words,
the library includes tests on itself.  I've created a test case for
each that should succeed and test cases for each model that should fail. 
In fact, I've created a failure test case for each of the possible failure modes.

I've used the proposed TestCase annotation from the design meeting in
each of my test cases so that the library itself could be automatically tested.

This is my notion of how testing should be done and (at least) the degree of rigor that should be applied.
