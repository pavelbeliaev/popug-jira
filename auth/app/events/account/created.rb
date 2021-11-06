module Events
  module Account
    class Created < Base

      private

      def to_json
        {
          name: 'AccountCreated'
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
