class Ruin
  attr_accessor :first_time, :type, :interval

  def initialize(first_time, type)
    self.first_time = first_time
    self.type = type
    self.interval = type == "ancient" ? 144000 : 309600
  end

  def get_remaining_second_until_next
    current_time = Time.now
    interval - ((current_time - first_time) % interval)
  end

  def get_next_time
    remaining_second = get_remaining_second_until_next
    count = ((current_time - first_time) / interval).ceil
    first_time + interval * count
  end

  def get_ruin_name
    type == "ancient" ? "太古の遺跡" : "暗黒の遺跡"
  end

  def get_remind_text
    "【あと#{(get_remaining_second_until_next / 60).floor}分】#{get_ruin_name}が#{get_next_time.strftime("%H:%M")}に開放"
  end

  def remind_all_user
    remaining_second = get_remaining_second_until_next
    if remaining_second <= 3600 && remaining_second > 3000
      client = Line::Bot::Client.new { |config|
        config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
        config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
      }

      message = {
        type: "text",
        text: ancient_ruin.get_remind_text
      }
       
      User.all.each do |user|
        client.push_message(user.line_uid, message)
      end
    end
  end
end