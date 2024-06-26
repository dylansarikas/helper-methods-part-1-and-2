class DirectorsController < ApplicationController
  def new
    @director = Director.new
  end

  def index
    @directors = Director.order(created_at: :desc)
  end

  def create
    director_attributes = params.require(:director).permit(:name, :dob, :bio, :films)
    @director = Director.new(director_params)

    if @director.valid?
      @director.save
      redirect_to directors_url, notice: "Director created successfully"
    else
      render "new"
    end
  end
  
  def director_params
    params.require(:director).permit(:name, :dob, :bio, :films)
  end
end
