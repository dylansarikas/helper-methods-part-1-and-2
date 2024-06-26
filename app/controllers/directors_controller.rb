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

  def show
    @director = Director.find(params[:id])
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    director = Director.find(params[:id])
    director.update!(director_params)

    if director.valid?
      director.save
      redirect_to director_url(director), notice: "Director updated successfully"
    else
      redirect_to director_url(director), notice: "Director failed to update successfully"
    end
  end

  def destroy
    director = Director.find(params[:id])

    director.destroy

    redirect_to directors_url, notice: "Director murdered softly"
  end
  
  def director_params
    params.require(:director).permit(:name, :dob, :bio, :films)
  end
end
