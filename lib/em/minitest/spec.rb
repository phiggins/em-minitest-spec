require 'eventmachine'
require 'minitest/spec'

module EM
  module MiniTest
    module Spec
      VERSION = '1.0.0'

      def wait
        @wait = true
      end
      alias wait! wait

      def done
        EM.cancel_timer(@timeout)
        EM.stop
      end
      alias done! done

      def wait_for(wait_time=0.1)
        EM.add_timer(wait_time) do
          done!
        end

        wait!
      end

      def self.included base
        base.extend(ClassMethods)
      end

      module ClassMethods
        def it *args, &block
          return super unless block_given?

          super do
            @wait = false

            EM.run do
              @timeout = EM.add_timer(0.5) do
                flunk "test timed out!"
              end

              instance_eval(&block)
              done! unless @wait
            end
          end
        end
      end
    end
  end
end
