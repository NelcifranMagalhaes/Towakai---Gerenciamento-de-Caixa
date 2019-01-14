module BulmaFlashHelper
  NOTIFICATION_TYPES = [:danger, :info, :success, :warning, :notice, :alert, :error] unless const_defined?(:NOTIFICATION_TYPES)

  def bulma_flash(options = {})
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      # next if message.blank?

      type = type.to_sym
      type = :success if type == :notice
      type = :warning  if type == :alert
      type = :danger  if type == :error
      next unless NOTIFICATION_TYPES.include?(type)

      tag_class = options.extract!(:class)[:class]
      tag_options = {
          class: "notification is-#{type}"
      }.merge(options)

      close_button = content_tag(:button, raw("&times;"), type: "button", class: "delete is-small")

      Array(message).each do |msg|
        text = content_tag(:div, close_button + msg, tag_options)
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end
end
