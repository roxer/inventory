class User < ApplicationRecord
  has_one :onboarding
  has_many :users_integrations
  has_many :integrations, through: :users_integrations

  def add_integrations(items)
    items.each do |item|
      integration = Integration.find_by_name(item) or next
      self.integrations << integration unless integrations.include?(integration)
    end

    self.save!
  end
end
