class TaskStatusChangesConsumer
  def self.process(message)
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
