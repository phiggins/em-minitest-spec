= em_minitest_spec

* https://github.com/phiggins/em-minitest-spec

== DESCRIPTION:

Utility to allow easy integration of MiniTest::Spec and Eventmachine.

== FEATURES/PROBLEMS:

* Allows specs to run inside an EM reactor.
* Opt-in: this library does not automatically change how MiniTest::Spec works without your permission.
* before/after blocks and setup/teardown methods are not run in the reactor, and so cannot contain code that requires an EM reactor.

== SYNOPSIS:

  # Get the gem version on 1.9.x
  gem 'minitest'
  require 'minitest/autorun'
  require 'em/minitest/spec'

  describe MyEventmachineSpec do
    describe "these specs will run normally" do
      it "tests things" do
        puts "foo"
      end

      # ...
    end

    describe "these specs will run inside an EM reactor" do
      include EM::MiniTest::Spec

      it "runs this inside EM.run" do
        puts EM.reactor_running? # true
      end

      # ...
    end
  end

== REQUIREMENTS:

* Eventmachine: no specific version, although 1.0.0.beta.3 was tested with.
* MiniTest: 2.2.2 was the current version as of writing this, so probably
  that or newer.

== INSTALL:

* gem install em-minitest-spec

== LICENSE:

(The MIT License)

Copyright (c) 2011 Pete Higgins

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
