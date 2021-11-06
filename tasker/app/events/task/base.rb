module Events
  module Task
    class Base
      attr_reader :task

      def initialize(task)
        @task = task
      end

      def publish
        Producer.call(to_json, topic: topic)
      end

      private

      def topic
        raise 'Not implemented'
      end

      def to_json
        raise 'Not implemented'
      end
    end
  end
end
