WaterDrop.setup do |config|
  config.deliver = true
  config.kafka.seed_brokers = ['kafka://192.168.99.101:9092']
end
