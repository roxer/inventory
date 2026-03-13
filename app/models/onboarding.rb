class Onboarding < ApplicationRecord
  belongs_to :user
  has_many :onboarding_states

  STEPS = {
    step_1: { locked: false },
    step_2: { locked: false },
    step_3: { locked: false },
    step_4: { locked: false },
    step_5: { locked: true },
    step_6: { locked: true },
    step_7: { locked: true },
  }.freeze

  def integrations
    user.integrations&.map(&:name)
  end

  def current_steps
    states = onboarding_states&.reduce({}) do |accu, obj|
      accu[obj.step.to_sym] = { state: obj.state, progress: obj.progress }
      accu
    end

    STEPS.merge(states)
  end

  def as_json(options = {})
    super(methods: [:integrations])
  end
end
