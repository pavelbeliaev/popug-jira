class Consumer
  TOPICS = %w[tasks-stream tasks-statuses]

  def run
    consumer.subscribe(*topics)

    consumer.each do |message|
      puts "Message received: #{message}"
      payload = JSON.parse(message.payload)

      case message.topic
      when /accounts-stream$/
        puts 'ACCOUNTS'
        AccountChangesConsumer.process(payload)
      when /tasks-stream$/
        puts 'STREAM'
        TaskChangesConsumer.process(payload)
      when /tasks-statuses$/
        puts 'STATUSES'
        TaskStatusChangesConsumer.process(payload)
      end
    end
  rescue Rdkafka::RdkafkaError => e
    retry if e.is_partition_eof?
    raise
  end

  private

  def topics
    TOPICS.map { |t| topic_with_prefix(t) }
  end

  def topic_with_prefix(topic)
    "#{ENV['CLOUDKARAFKA_TOPIC_PREFIX']}#{topic}"
  end

  def consumer
    @consumer ||= Rdkafka::Config.new(RDKAFKA_CONFIG).consumer
  end
end
