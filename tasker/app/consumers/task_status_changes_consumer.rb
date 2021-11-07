class TaskStatusChangesConsumer < ApplicationConsumer
  def consume
    params_batch.each do |message|
      puts '-' * 80
      p message
      puts '-' * 80

      case message['event_name']
      when 'TaskAssigned'
        # not implemented
      when 'TaskCompleted'
        # not implemented
      else
        # store events in DB
      end
    end
  end
end
