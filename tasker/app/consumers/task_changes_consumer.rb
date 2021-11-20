class TaskChangesConsumer
  def self.process(message)
    data = message['data']

    case message['event_name']
    when 'TaskCreated'
      # not implemented
    else
      # store events in DB
    end
  end
end
