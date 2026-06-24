module NotificationsHelper
  def display_time(datetime)
    if datetime.to_date == Date.current
      datetime.strftime("%H:%M")
    else
      datetime.strftime("%-m/%-d")
    end
  end

  def filter_active?(value)
    current = params.dig(:q, :notification_type_eq)
    value.nil? ? current.blank? : current == value.to_s
  end

  def notification_type_badge(notification)
    badge = case notification.notification_type
    when "homework_correction" then { label: "宿題の訂正", color: "warning" }
    when "monthly_vocab_test"  then { label: "月例単語テスト", color: "success" }
    when "event"               then { label: "イベント", color: "primary" }
    when "eiken_result"        then { label: "英検結果", color: "info" }
    when "information"         then { label: "お知らせ", color: "secondary" }
    when "others"              then { label: "その他", color: "light" }
    end
    return unless badge

    content_tag(:span, class: "badge bg-#{badge[:color]}") do
      badge[:label]
    end
  end
end
