class QuestsController < ApplicationController
  def new
    @quest = Quest.new
  end

  def create
    # return if authenticate!(current_user)
    @quest = Quest.new(quest_params)
    if @quest.save
      render json: @quest
    else
      render json: {
        error: "Invalid input - please try again"
      }, status: 422
    end
  end

  private
  def quest_params
    params.require(:quest).permit(:creator_id, :title, :key, :description)
  end
end
