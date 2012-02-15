# -*- coding: utf-8 -*-
class Admin::PeopleController < Admin::ApplicationController
  before_filter :find_person, :except => [:index, :create, :new]

  def index
    role = Role.find_by_name(params[:role])
    if role
      @people = role.people
    else
      redirect_to admin_pets_path, danger: 'Ошибка.'
    end
  end

  def show
  end

  def new
    @person = Person.new
  end

  def edit
  end

  def create
    @person = Person.new(params[:person])
    role = params[:role]
    if @person.save
      @person.has_role role
      redirect_to admin_people_path(:role => role), notice: 'Person was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    if @person.update_attributes(params[:person])
      redirect_to admin_person_path(@person), notice: 'Person was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @person.destroy
    redirect_to admin_people_url
  end

  private
  def find_person
    @person = Person.find(params[:id])
  end
end
