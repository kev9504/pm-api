class TasksController < ApplicationController
    before_action :set_project, only:[:index, :create]
    before_action :set_task, only:[:show, :update, :destroy]
    
    def index 
        json_response(@project.tasks)
    end
    
    def show 
        json_response(@task)
    end
    
    def create
        @task = @project.tasks.create!(task_params)
        json_response(@task)
    end
    
    def update 
        @task.update(task_params)
        head :no_content
    end
    
    def destroy 
        @task.destroy
        head :no_content
    end
    
    private
    
    def set_project 
        @project = Project.find(params[:project_id])
    end
    
    def set_task
        @task = Task.find(params[:id])
    end
    
    def task_params
        params.permit(
            :body, 
            :source, 
            :status, 
            :difficulty,
            )
    end
end
