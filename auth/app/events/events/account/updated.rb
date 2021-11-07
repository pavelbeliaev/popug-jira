module Events
  module Account
    class Updated < Base

      private

      def to_json
        {
          name: 'AccountUpdated'
          data: {
            public_id: account.public_id,
            email: account.email,
            full_name: account.full_name,
            role: account.role
          }
        }
      end
    end
  end
end
