module Events
  module Task
    class Created < Base

      private

      def topic
        'tasks-statuses'
      end

      def to_json
        {
          event_name: 'TaskAssigned',
          data: {
            public_id: task.public_id,
            status: task.status,
            account_public_id: task.account.public_id
          }
        }.to_json
      end
    end
  end
end
