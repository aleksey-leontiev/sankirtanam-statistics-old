class WelcomeController < ApplicationController
  def index
  	@year = DateTime.now.year
  end
end
