class UnsubscribesController < ApplicationController
  allow_unauthenticated_access
  before_action :set_subscriber

  def show
    @subscriber&.destroy
    redirect_to root_path, notice: "Unsubscribed Successfuly"
  end

  private
    def set_subscriber
      @subscriber = Suscriber.find_by_token_for(:unsubscribe, params[:token])
    end
end
