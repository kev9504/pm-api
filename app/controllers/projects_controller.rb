class ProjectsController < ApplicationController
    def index 
        @projects = Project.all 
        json_response(@projects)
    end
end
