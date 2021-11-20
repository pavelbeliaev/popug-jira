module Events
  module Task
    class Created < Base

      private

      def topic
        'tasks-stream'
      end

      def to_json
        {
          event_name: 'TaskCreated',
          data: {
            public_id: task.public_id,
            status: task.status,
            description: task.description
          }
        }.to_json
      end
    end
  end
end