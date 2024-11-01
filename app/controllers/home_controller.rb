class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    @name = 'test'
    @age = 45
  end

  def getData
    binding.pry
    @ur = 'das5d46555'
    @age = 45
    render 'index'  
  end
end
