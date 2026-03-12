class Onboarding < ApplicationRecord
  belongs_to :user

  def integrations
    user.integrations&.map(&:name)
  end

  def as_json(options = {})
    super(methods: [:integrations])
  end
end
