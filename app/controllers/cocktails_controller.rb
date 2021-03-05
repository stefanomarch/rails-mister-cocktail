class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show,:edit, :update, :destroy ]
  def index
    @cocktails = Cocktail.all
  end

  def show
    # @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @new_cocktail = Cocktail.new(cocktail_params)

    if @new_cocktail.save
      redirect_to cocktail_path(@new_cocktail)
    else
      render :new
    end
  end

  # def edit; end

  # def update #patch request
  #   @cocktail.update(cocktail_params)

  #   redirect_to root_path(@cocktail.id)
  # end

  # def destroy
  #   @cocktail.destroy

  #   redirect_to :root
  # end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

end
