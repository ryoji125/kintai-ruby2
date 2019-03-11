module SessionsHelper
    #引数に渡されたユーザーでログインする
    def log_in(user)
        session[:user_id] =user.id
    end
    #現在ログイン中のユーザーを返す（いる場合のみ）
    def current_user
        if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
        end
    end
    
    #渡されたユーザーがログイン済みであればtrueを返す
    def current_user?(user)
        user == current_user
    end
    
    def logged_in?
        !current_user.nil?
    end
    
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
    
    def redirect_back_or(default)
        redirect_to(session[:forwarding_url] || default)
        session.delete(:forwarding_url)
    end
    
    def store_location
        session[:forwarding_url] = request.original_url if request.get?
    end
end
