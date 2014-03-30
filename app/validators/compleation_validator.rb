class CompleationValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present? && record.started_at.blank?
      record.errors[attribute] << (options[:message] || "cannot be compleated if it hasn't been started")
    end
  end
end
