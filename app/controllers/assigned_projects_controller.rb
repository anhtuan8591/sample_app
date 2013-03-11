class AssignedProjectsController < ApplicationController
  # GET /assigned_projects
  # GET /assigned_projects.json
  before_filter :admin_user

  def index
    @assigned_projects = AssignedProject.all
    @users = User.all
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assigned_projects }
    end
  end

  # GET /assigned_projects/1
  # GET /assigned_projects/1.json
  def show
    @assigned_project = AssignedProject.find(params[:id])
    @users = User.all
    @projects = Project.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @assigned_project }
    end
  end

  # GET /assigned_projects/new
  # GET /assigned_projects/new.json
  def new
    @assigned_project = AssignedProject.new
    @users = User.all
    @projects = Project.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @assigned_project }
    end
  end

  # GET /assigned_projects/1/edit
  def edit
    @assigned_project = AssignedProject.find(params[:id])
    @users = User.all
    @projects = Project.all
  end

  # POST /assigned_projects
  # POST /assigned_projects.json
  def create
    @assigned_project = AssignedProject.new(params[:assigned_project])

    respond_to do |format|
      if @assigned_project.save
        format.html { redirect_to @assigned_project, notice: 'Assigned project was successfully created.' }
        format.json { render json: @assigned_project, status: :created, location: @assigned_project }
      else
        format.html { render action: "new" }
        format.json { render json: @assigned_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assigned_projects/1
  # PUT /assigned_projects/1.json
  def update
    @assigned_project = AssignedProject.find(params[:id])

    respond_to do |format|
      if @assigned_project.update_attributes(params[:assigned_project])
        format.html { redirect_to @assigned_project, notice: 'Assigned project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @assigned_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assigned_projects/1
  # DELETE /assigned_projects/1.json
  def destroy
    @assigned_project = AssignedProject.find(params[:id])
    @assigned_project.destroy

    respond_to do |format|
      format.html { redirect_to assigned_projects_url }
      format.json { head :no_content }
    end
  end

  def admin_user
    if !current_user.admin?
      flash[:notice] = "You aren't administrator!"
      redirect_to(home_path) 
    end
  end
end
