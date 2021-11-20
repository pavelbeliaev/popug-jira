module Events
  module Task
    class Completed < Base

      private

      def topic
        'tasks-statuses'
      end

      def to_json
        {
          event_name: 'TaskCompleted',
          data: {
            public_id: task.public_id,
            status: task.status,
            completed_at: task.completed_at
          }
        }.to_json
      end
    end
  end
end
