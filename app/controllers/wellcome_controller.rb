class WellcomeController < ApplicationController

  def index

  end

  def notification
    render json: {}, status: :ok
  end
end
