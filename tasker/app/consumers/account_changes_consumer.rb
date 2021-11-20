class AccountChangesConsumer
  def self.process(message)
    data = message['data']

    case message['event_name']
    when 'AccountCreated'
      Account.create(data)
    when 'AccountUpdated'
      Account.find_by(public_id: data['public_id'])&.update(data)
    when 'AccountDeleted'
      Account.find_by(public_id: data['public_id'])&.destroy
    else
      # store events in DB
    end
  end
end
