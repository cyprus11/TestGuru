class BadgeValidator < ActiveModel::Validator
  def validate(record)
    if record.image.present?
      unless record.image.start_with?("http")
        record.errors.add(:image, :not_exist) && record.image = nil unless ActionController::Base.helpers.resolve_asset_path(record.image)
      end
    end
  end
end