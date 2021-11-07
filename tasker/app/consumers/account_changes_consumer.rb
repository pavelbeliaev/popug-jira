class AccountChangesConsumer < ApplicationConsumer
  def consume
    params_batch.each do |message|
      puts '-' * 80
      p message
      puts '-' * 80

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
end
