class ProjectsController < ApiController
    before_action :require_login
    before_action :set_project, only: [:show, :update, :destroy]

    def index 
        @projects = current_user.projects
        json_response(@projects)
    end
    
    def update
        @project.update(project_params)
        head :no_content
    end
    
    def destroy 
        @project.destroy
        head :no_content
    end
    
    def show 
        json_response(@project)
    end
    
    def create 
        @project = Project.create!(project_params)
        json_response(@project, :created)
    end
    
    private
    
    def project_params 
        params.permit(
            :title, 
            :budget, 
            :owner, 
            :contact_name, 
            :contact_email, 
            :contact_phone,
            :status,
            :description
            )
    end
    
    def set_project
        @project = Project.find(params[:id])
    end
end
