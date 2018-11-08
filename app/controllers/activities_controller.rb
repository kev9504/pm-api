class ActivitiesController < ApiController
    before_action :set_project, only:[:index, :create]
    before_action :require_login
    before_action :set_activity, only:[:update, :destroy]
    
    def create 
        @activity = current_user.activities.create!(activities_params)
        json_response(@activity)
    end
    
    def index 
        @activities = @project.activities.reorder("id DESC")
        json_response(@activities)
    end
    
    def update 
        @activity.update(activities_params)
        head :no_content
    end
    
    def destroy 
        @activity.destroy
        head :no_content
    end
    
    private 
    def set_project
        @project = Project.find(params[:project_id])
    end
    
    def activities_params
        params.permit(:description, :time_spent, :user_id, :project_id)
    end
    
    def set_activity
        @activity = Activity.find(params[:id])
    end
end
