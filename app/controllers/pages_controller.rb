class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :gallery, :about, :contact ]

  def home
  end

  def gallery
    @films = Film.where(promo: true).first(10)
  end

  def about
  end

end
