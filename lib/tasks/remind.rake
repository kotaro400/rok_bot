require_relative "../ruin.rb"

namespace :remind do
  desc "太古の事前通知"
  task remind_ancient_ruin: :environment do
    first_time = Time.local(2021, 12, 6, 13, 24)
    ancient_ruin = Ruin.new(first_time, "ancient")
    ancient_ruin.remind_all_user
  end

  desc "暗黒の事前通知"
  task remind_dark_ruin: :environment do
    first_time = Time.local(2021, 12, 20, 1, 47)
    dark_ruin = Ruin.new(first_time, "dark")
    dark_ruin.remind_all_user
  end
end
