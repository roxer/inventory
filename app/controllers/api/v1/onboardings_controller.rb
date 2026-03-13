class Api::V1::OnboardingsController < ApplicationController
  def create
    uid = params["user_id"]
    user = User.find(uid)
    onboarding = user.onboarding || user.create_onboarding

    render json: onboarding.to_json
  end

  def show
    uid = params["user_id"]
    user = User.find(uid)
    onboarding = user.onboarding

    render json: onboarding.to_json
  end

  def update
    uid = params["user_id"]
    step = params["current_step"]

    user = User.find(uid)
    onboarding = user.onboarding

    case step
    when "step_2"
      value = params["default_lead_time"]
      onboarding.default_lead_time = value if value.present?
    when "step_3"
      value = params["default_days_of_stock"]
      onboarding.default_days_of_stock = value if value.present?
    when "step_4"
      value = params["default_forecasting_days"]
      onboarding.default_forecasting_days = value if value.present?
    when "step_6"
      value = params["vendors_as_suppliers"]
      onboarding.vendors_as_suppliers = value if [ true, false ].include?(value)
    when "step_7"
      payload_integrations = params["integrations"]
      integrations = Integration::INTEGRATIONS
      new_integrations = integrations & payload_integrations
      requested_integrations = payload_integrations - integrations

      if requested_integrations.present?
        onboarding.requested_integrations = requested_integrations
      end

      if new_integrations.present?
        user.add_integrations(new_integrations)
      end
    end

    onboarding.current_step = step
    onboarding.save!

    render json: onboarding.to_json
  end

  def steps
    uid = params["user_id"]
    user = User.find(uid)

    result =
      if user.onboarding
        user.onboarding
          .current_steps
          .merge(current_step: user.onboarding.current_step)
      else
        Onboarding::STEPS.merge(current_step: "step_1")
      end

    render json: result.to_json
  end
end
