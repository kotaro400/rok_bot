namespace :remind do
  desc "太古の事前通知"
  task remind_ancient_ruin: :environment do
    first_time = Time.local(2021, 12, 6, 13, 24)
    current_time = Time.now
    remaining_second = 144000 - ((current_time - first_time) % 144000)
    if remaining_second <= 7200
      count = ((current_time - first_time) / 144000).ceil
      next_time = first_time + 144000 * count
      client = Line::Bot::Client.new { |config|
        config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
        config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
      }

      message = {
        type: "text",
        text: "太古の遺跡が【#{next_time.strftime("%H:%M")}】に開放"
      }
       
      User.all.each do |user|
        client.push_message(user.line_uid, message)
      end
    end
  end

  desc "暗黒の事前通知"
  task remind_ancient_ruin: :environment do
    first_time = Time.local(2021, 12, 20, 1, 47)
    current_time = Time.now
    remaining_second = 309600 - ((current_time - first_time) % 309600)
    if remaining_second <= 7200
      count = ((current_time - first_time) / 309600).ceil
      next_time = first_time + 309600 * count
      client = Line::Bot::Client.new { |config|
        config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
        config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
      }
      
      message = {
        type: "text",
        text: "暗黒の祭壇が【#{next_time.strftime("%H:%M")}】に開放"
      }
       
      User.all.each do |user|
        client.push_message(user.line_uid, message)
      end
    end
  end
end
