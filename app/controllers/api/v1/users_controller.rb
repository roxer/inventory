class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(name: Faker::Name.name)

    render json: user.to_json
  end
end
