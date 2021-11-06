class Producer
  def self.call(payload, topic)
    puts "Publish: #{ payload } To: #{ topic }"
  end
end
