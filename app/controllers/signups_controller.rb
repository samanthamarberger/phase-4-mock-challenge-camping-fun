class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    def create
        signup = Signup.create(signup_params)

        activity = Activity.find(params[:activity_id])
        render json: {
            id: activity.id,
            name: activity.name,
            difficulty: activity.difficulty
          }, status: :created
    end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    def render_unprocessable_entity(invalid)
        render json: {error: invalid.record.errors}, status: :unprocessable_entity
    end

end
