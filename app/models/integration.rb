class Integration < ApplicationRecord
  has_many :users_integrations
  has_many :user, through: :users_integrations

  INTEGRATIONS = [
    "shiphero",
    "amazon",
    "shopify",
  ].freeze
end
