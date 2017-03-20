class WelcomeController < ApplicationController
  def index
  	@page_title = "Welcome to emporium"
  end
  def about
  	@page_title = "About Emporium"
  end
end
