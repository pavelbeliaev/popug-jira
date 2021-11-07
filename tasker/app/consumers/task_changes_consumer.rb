class TaskChangesConsumer < ApplicationConsumer
  def consume
    params_batch.each do |message|
      puts '-' * 80
      p message
      puts '-' * 80

      case message['event_name']
      when 'TaskCreated'
        # not implemented
      else
        # store events in DB
      end
    end
  end
end
