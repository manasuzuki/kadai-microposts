module SessionsHelper
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
        #if @current_user
           #return @current_user
        #else
           #@current_user = User.find_by(id: session[:user_id])
           #return @current_user
        #endと一緒
    end
    
    def logged_in?
        !!current_user
        #if current_user
           #return true
        #else
           #return false
        #endと一緒
    end    
end
