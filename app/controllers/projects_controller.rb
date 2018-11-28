class ProjectsController < ApiController
    before_action :require_login, except: [:contact]
    before_action :set_project, only: [:show, :update, :destroy]
    
    def contact
        request_data = params.permit(
            :contact_name, 
            :contact_email,
            :description).merge(defaults)
        
        @project = Project.create!(request_data)
        @project.owner = 2
        @project.users << User.find(2)
        @project.save
        ProjectMailer.alert_email(@project.description).deliver_now
        json_response(@project, :created)
    end

    def index 
        @projects = current_user.projects.reorder("id DESC").paginate(page: params[:page], per_page: 5)
        json_response(@projects)
    end
    
    def projects_length
        @projects_length=current_user.projects.count
        json_response(@projects_length)
    end
    
    def update
        if current_user.id == @project.owner
        @project.update(project_params)
        json_response(@project)
        else
            render_unauthorized('unable to process request, only owner can modify project')
        end
    end
    
    def destroy 
        if current_user == @project.owner
        @project.destroy
        head :no_content 
        else 
            render_unauthorized('unable to process request, only owner can modify project')
        end
    end
    
    def show 
        json_response(@project)
    end
    
    def create 
        @project = Project.create!(project_params)
        @project.owner = current_user.id
        @project.users << current_user
        @project.save
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
            :description, 
            :delivery_date,
            :domain
            )
    end
    
    def set_project
        @project = Project.find(params[:id])
    end
    
    def defaults
        {
            title: 'contact form request',
            budget: 0,
            owner: 1,
            contact_phone: 'default',
            status: 0,
            delivery_date: Date.tomorrow,
            domain: 'default',
        }
    end
    
end
