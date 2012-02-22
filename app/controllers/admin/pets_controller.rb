# -*- coding: utf-8 -*-
class Admin::PetsController < Admin::ApplicationController
  before_filter :find_pet, :except => [:index, :new, :create]

  def index
    @pets = Pet.where(params[:search])
  end

  def show
    @albums_photos = @pet.photos.with_album.group_by(&:album)
    @unsorted_photos = @pet.photos.unsorted
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(params[:pet])

    if @pet.save
      flash[:info] = "Добавлен питомец '#{@pet.name}'"
    end

    redirect_to admin_pets_path
  end

  def edit
  end

  def update
    if @pet.update_attributes(params[:pet])
      flash[:info] = "Питомец '#{@pet.name}' успешно обновлен"
    else
      flash[:error] = "Что-то пошло не так"
    end
    redirect_to admin_pets_path
  end

  def destroy
    @pet.destroy
    flash[:error] = "Питомец '#{@pet.name}' удалён"
    redirect_to :back
  end

  private
    def find_pet
      @pet = Pet.find(params[:id])
    end
end
