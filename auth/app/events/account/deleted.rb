module Events
  module Account
    class Deleted < Base

      private

      def to_json
        {
          name: 'AccountDeleted'
          data: {
            public_id: account.public_id,
            deleted_at: account.deleted_at
          }
        }
      end
    end
  end
end
