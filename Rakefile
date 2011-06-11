# -*- ruby -*-

require 'rubygems'
require 'hoe'

Hoe.plugin :git

Hoe.spec 'em_minitest_spec' do
  developer('pete higgins', 'pete@peterhiggins.org')

  extra_deps << ["eventmachine"]
  extra_dev_deps << ["minitest", "~> 2.2"]

  self.testlib = :minitest
  self.test_prelude = 'gem "minitest"'
end

# vim: syntax=ruby
