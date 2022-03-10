class EmailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  #GET/EMAILS
  def index
        @emails = Email.all
  end

  #POST/PUT EMAILS
  def create
    @emails = Email.create(object: Faker::Book.title, body: Faker::Lorem.paragraph,read: false)
    respond_to do |format|
      format.js { }
    end
  end

  def show
    @email.update(read: true) if !@email.read

    respond_to do |format|
      format.html{}
      format.js{}
    end
  end

  #PATCH/PUT EMAILS
  def update
    @email = Email.find(params[:id])
    if @email.read == false 
      @email.read = true
      @email.save
    else
      @email.read = false
      @email.save
    end
    respond_to do |format|
      format.js {  }
      format.html{ redirect_to root_path }
    end
  end

  #DELETE EMAILS
  def destroy

    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.js {  }
      format.html{ redirect_to root_path }
    end

  end

end

