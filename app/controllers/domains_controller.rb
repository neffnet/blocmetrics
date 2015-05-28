class DomainsController < ApplicationController
  before_action :authenticate_user!

  def new
    @domain = Domain.new
  end

  def create
    @domain = current_user.domains.create(domain_params)

    if @domain.save
      flash[:notice] = "New domain added!"
      redirect_to @domain
    else
      flash[:error] = 'Action not completed: something went wrong!'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
    @domain = Domain.find(params[:id])
    authorize @domain

    @events = @domain.events.group_by(&:name)
  end

  def destroy
    @domain = Domain.find(params[:id])
    authorize @domain

    if @domain.destroy
      flash[:notice] = "Your domain has been deleted"
      redirect_to current_user
    else
      flash[:error] = "Something went wrong. Please try again."
      redirect_to current_user
    end    
  end

  private

  def domain_params
    params.require(:domain).permit(:name,:url)
  end
end
