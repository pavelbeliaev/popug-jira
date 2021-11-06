module Events
  module Account
    class Disabled < Base

      private

      def to_json
        {
          name: 'AccountDisabled'
          data: {
            public_id: account.public_id,
            disabled_at: account.disabled_at
          }
        }
      end
    end
  end
end
