class Producer
  def call(topic, payload)
    producer.produce(
      topic: topic_with_prefix(topic),
      payload: payload
    ).wait
  end

  private

  def topic_with_prefix(topic)
    "#{ENV['CLOUDKARAFKA_TOPIC_PREFIX']}#{topic}"
  end

  def producer
    @producer ||= Rdkafka::Config.new(RDKAFKA_CONFIG).producer
  end
end
