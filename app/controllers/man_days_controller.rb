class ManDaysController < ApplicationController
  # GET /man_days
  # GET /man_days.json
  def index
    @man_days = ManDay.all.sort
    @users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @man_days }
    end
  end

  # GET /man_days/1
  # GET /man_days/1.json
  def show
    @man_day = ManDay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @man_day }
    end
  end

  # GET /man_days/new
  # GET /man_days/new.json
  def new
    @man_day = ManDay.new
    @projects = Project.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @man_day }
    end
  end

  # GET /man_days/1/edit
  def edit
    @man_day = ManDay.find(params[:id])
    @projects = Project.all
  end

  # POST /man_days
  # POST /man_days.json
  def create
    @man_day = ManDay.new(params[:man_day])
    @man_day.user_id = current_user.id
    if !current_user.admin?
      @man_day.check = false
    else
      @man_day.check = true
    end

    respond_to do |format|
      if @man_day.save
        format.html { redirect_to @man_day, notice: 'Man day was successfully created.' }
        format.json { render json: @man_day, status: :created, location: @man_day }
      else
        format.html { render action: "new" }
        format.json { render json: @man_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /man_days/1
  # PUT /man_days/1.json
  def update
    @man_day = ManDay.find(params[:id])
    if !current_user.admin?
       @man_day.user_id = current_user.id
    end    
    if !current_user.admin?
      @man_day.check = false
    else
      @man_day.check = true
    end  
    
    respond_to do |format|
      if @man_day.update_attributes(params[:man_day])
        format.html { redirect_to @man_day, notice: 'Man day was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @man_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /man_days/1
  # DELETE /man_days/1.json
  def destroy
    @man_day = ManDay.find(params[:id])
    @man_day.destroy

    respond_to do |format|
      format.html { redirect_to man_days_url }
      format.json { head :no_content }
    end
  end
end
