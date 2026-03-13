class OnboardingState < ApplicationRecord
  belongs_to :onboarding

  STEPS = Onboarding::STEPS.keys.freeze
  STATES = %i[
    completed
    in_progress
    locked
  ].freeze
end
