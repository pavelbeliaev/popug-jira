module Events
  module Account
    class Base
      TOPIC = 'accounts-stream'.freeze

      attr_reader :account

      def initialize(account)
        @account = account
      end

      def publish
        WaterDrop::SyncProducer.call(to_json, topic: TOPIC)
      end

      private

      def to_json
        raise 'Not implemented'
      end
    end
  end
end
