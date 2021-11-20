namespace :messages do
  task consume: :environment do
    Consumer.new.run
  end
end
