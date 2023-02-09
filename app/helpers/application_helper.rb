module ApplicationHelper
  def form_error_notification(object)
    if object.errors.any?
      tag.div class: "error-message" do
        object.errors.full_messages.to_sentence.capitalize
      end
    end
  end

  def nested_dom_id(*args)
    args.map { |arg| arg.respond_to?(:to_key) ? dom_id(arg) : arg }.join('_')
  end

  # Handling of timezone based on current_user to be implemented later
  def formatted_datetime(created_at)
    created_at.in_time_zone('Eastern Time (US & Canada)').strftime('%b %d, %Y at %H:%M (EST)')
  end
end
