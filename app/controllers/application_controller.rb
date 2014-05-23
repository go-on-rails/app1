class ApplicationController < ActionController::Base
  protect_from_forgery
    
    private
    def current_history
        History.find(session[:history_id])
        rescue ActiveRecord::RecordNotFound
            history = History.create
            session[:history_id] = history.id
            history
    end
end
