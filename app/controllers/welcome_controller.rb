class WelcomeController < ApplicationController
  def index
    redirect_to tasks_url if signed_in?
  end
end
