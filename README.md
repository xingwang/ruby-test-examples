# ruby-test-examples

Testing examples using minitest, mocha, and webmock

## thoughts

* minitest
	* For Ruby testing, it seems the 2 most popular frameworks are RSpec and Minitest. RSpec is humongous and I wanted something light-weight so Minitest was the way to go. In the case where I needed anything extra, there are plenty of extensions that adds a lot more functionality to it.
	* A caveat to using minitest is that you don't have any switches for recursive or globs to test everything. Instead, you have to create a loop to run all tests. This would ideally go into your rakefile.
* mocha
	* Mocha for Ruby is a pretty nice, little mocking/stubbing library that works well with Minitest.
	* It reads really well is very easy to use. For assertions, "a stub is just an expectation of zero or more invocations" and the "stubs method is syntactic sugar to make the intent of the test more explicit." This means you can just assign the stub to a variable and attach it to the expectations in your it statements.
	* One potential issue is that Mocha is not thread-safe.
* webmock
	* A really handy library for stubbing HTTP requests.
	* Stubs HTTP request at low http client lib level so there's no need to change tests when you change HTTP library.
	* The most awesome thing about this library is that it intercepts all HTTP requests and tells you what it found that wasn't stubbed. You can then just copy/paste with/without minor modifications of the stubbing code snippet and continue on without guessing where you messed up on the configurations.

### references

[Minitest](https://github.com/seattlerb/minitest)

[Mocha](https://github.com/freerange/mocha)

[WebMock](https://github.com/bblimke/webmock)
