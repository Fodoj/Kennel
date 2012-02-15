# -*- coding: utf-8 -*-
class Admin::PetsController < Admin::ApplicationController
  before_filter :find_photo, :except => [:index, :new, :create]

  def index
    @pets = Pet.all
  end

  def show
  end

  def new
    @pet = Pet.new
    @pet.kennel = Person.new
  end

  def create
    @pet = Pet.new(params[:pet])

    @pet.save
    redirect_to admin_pets_path
  end

  def edit
  end

  def update
    if @pet.update_attributes(params[:pet])
      flash[:info] = "Питомец успешно обновлен"
    else
      flash[:error] = "Что-то пошло не так"
    end
    redirect_to admin_pets_path
  end

  private
    def find_photo
      @pet = Pet.find(params[:id])
    end
end
