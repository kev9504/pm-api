class ApplicationController < ActionController::API
    include Response
    include ExceptionHandler
    include ActionController::HttpAuthentication::Token::ControllerMethods
end
