gem 'minitest'
require 'minitest/autorun'
require "em/minitest/spec"

class TestEmMinitestSpec < MiniTest::Unit::TestCase
  def setup
    @spec = describe "EM::MiniTest::Spec" do
      include EM::MiniTest::Spec

      it "runs vanilla specs" do
        assert true
      end

      it "runs specs inside reactor" do
        assert EM.reactor_running?
      end

      it "allows pending specs"

      it "allows manual reactor control" do
        EM.add_timer(0.1) do
          done!
        end

        wait!
      end

      # XXX: Lame, but I couldn't think of another way to ensure the block was
      # XXX: called
      it "has a manual control helper" do
        wait_for do
          assert nil
        end
      end

      it "flunks long running specs" do
        wait!
      end
    end
  end

  def run_test name
    test_name = name.tr(' ', '_')
    test = @spec.instance_methods.detect {|m| m =~ /test_[0-9]+_#{test_name}/ }

    raise "no spec found matching: #{name}" unless test

    @spec.new(test).run(MiniTest::Unit.new)
  end

  def assert_passes name
    assert_equal '.', run_test(name)
  end

  def assert_skips name
    assert_equal 'S', run_test(name)
  end

  def assert_fails name
    assert_equal 'F', run_test(name)
  end

  def test_runs_regular_specs
    assert_passes "runs vanilla specs"
  end

  def test_runs_specs_in_em_reactor
    assert_passes "runs specs inside reactor"
  end

  def test_skips_specs_with_no_block
    assert_skips "allows pending specs"
  end

  def test_allows_manual_event_loop_control
    assert_passes "allows manual reactor control"
  end

  def test_wait_for
    assert_fails "has a manual control helper"
  end

  def test_timeout
    assert_fails "flunks long running specs"
  end
end
