namespace :remind do
  desc "太古の事前通知"
  task remind_ancient_ruin: :environment do
    first_time = Time.local(2021, 12, 6, 13, 24)
    current_time = Time.now
    remaining_second = 144000 - ((current_time - first_time) % 144000)
    if remaining_second <= 7200
      count = ((current_time - first_time) / 144000).ceil
      next_time = first_time + 144000 * count
    end
  end
end
