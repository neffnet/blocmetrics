class DomainsController < ApplicationController

  def new
    @domain = Domain.new
  end

  def create
    @domain = current_user.domains.create(domain_params)

    if @domain.save
      flash[:notice] = "New domain added!"
      redirect_to @domain
    else
      flash[:error] = "Something went wrong, please try again."
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def domain_params
    params.require(:domain).permit(:name,:url)
  end
end
