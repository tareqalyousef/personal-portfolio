class ProjectsController < ApplicationController

    before_action :authenticate_admin!, except: [:index, :show]

    def index
        @projects = Project.order(:id)
        render :index
    end
    
    def show
        @project = Project.find_by_slug(params[:id])
        render :show
    end

    def new
        @project = Project.new
        render :new
    end

    def create
        @project = Project.new(params.require(:project).permit(:title, :body, :description, :status, :github_link, :external_link))

        if @project.save
            redirect_to projects_path
        else
            render :new
        end
    end

    def edit
        @project = Project.find_by_slug(params[:id])
        render :edit
    end

    def update
        @project = Project.find_by_slug(params[:id])
        if @project.update(params.require(:project).permit(:title, :body, :description, :status, :github_link, :external_link))
            redirect_to projects_path
        else
            render :edit
        end
    end

    def destroy
        @project = Project.find_by_slug(params[:id])
        @project.destroy
        redirect_to projects_url
    end

end
