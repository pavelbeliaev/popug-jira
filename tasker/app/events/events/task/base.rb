module Events
  module Task
    class Base
      attr_reader :task

      def initialize(task)
        @task = task
      end

      def publish
        producer.call(topic, to_json)
      end

      private

      def producer
        @producer ||= Producer.new
      end

      def topic
        raise 'Not implemented'
      end

      def to_json
        raise 'Not implemented'
      end
    end
  end
end
