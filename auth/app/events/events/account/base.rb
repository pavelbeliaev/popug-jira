module Events
  module Account
    class Base
      TOPIC = 'accounts-stream'.freeze

      attr_reader :account

      def initialize(account)
        @account = account
      end

      def publish
        producer.call(TOPIC, to_json)
      end

      private

      def producer
        @producer ||= Producer.new
      end

      def to_json
        raise 'Not implemented'
      end
    end
  end
end
