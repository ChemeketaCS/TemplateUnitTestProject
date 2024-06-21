#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include "doctest.h"

using doctest::Approx;

int squareDifference(int a, int b)
{
  return (a - b) * (a - b);
}

double distance(int x1, int y1, int x2, int y2)
{
  return sqrt(squareDifference(x1, x2) + squareDifference(y1, y2));
}

TEST_CASE("squareDifference")
{
  // if a CHECK fails, the test case as a whole will fail, but still
  // try the rest of the assertions.
  CHECK(squareDifference(1, 4) == 9);

  // if a REQUIRE fails, the rest of the assertions in this
  // test case aren't even worth trying---just move on to the next
  // test case.
  REQUIRE(squareDifference(1, 4) == 9);

  // Test that ordering does not matter
  CHECK(squareDifference(4, 1) == 9);

  // Test that negatives are handled
  int answer3 = squareDifference(-2, -6);
  CHECK(answer3 == 16);
}

TEST_CASE("distance")
{
  int x1 = 0, y1 = 0;
  int x2 = 3, y2 = 4;
  int x3 = -2, y3 = -2;

  // Approx sees if a double value is "close enough" to believe that any
  // difference is based on rounding error.  Always test doubles using
  // Approx.  It only exists in unit tests---do not use in normal code.
  CHECK(distance(x1, y1, x2, y2) == Approx(5.0));

  // Check reverse direction
  CHECK(distance(x2, y2, x1, y1) == Approx(5.0));

  // Test some negative coordinate values
  double answer2 = distance(x1, y1, x3, y3);
  double answer2Desired = 2 * sqrt(2);
  CHECK(answer2 == Approx(answer2Desired));
}
