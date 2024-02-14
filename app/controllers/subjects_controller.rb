class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  def index
    @subjects = Subject.all
  end

  def show
  end

  private
    def set_subject
      @subject = Subject.find_by(name: params[:name])
    end
end