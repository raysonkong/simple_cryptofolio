# types of tests

# unit test
test functionality of a specific segment of code, usually a function.
Given:
```ruby
def adder(x, y) do
  if x == 0
    raise error
  endif
  return x + y
end
```
You test specific domains of inputs to get the correct outputs (blackbox). Essentially reduce tests to most common or candidate classes for inputs. For adder, test (-, -), (+, +,) (0, 0), (0, -), ...

white box testing -- tests the implementation, test exceptions, test if/else branches. for examle, if there is an error to be raised, you feed in the input that would cause the error and make sure that that particular error is raised. extremely brittle tests.

# integration tests
If you have an email system, make sure it's utilized. (All API requests, like poloniex are exercises).

# end to end tests
testing from perspective of user, verifies use cases. For this, you need some kind of browser emulation (Selenium, phantomjs).

# distribution of tests
For every 10 unit tests you write, write 3 integrations, 1 end to end test.
