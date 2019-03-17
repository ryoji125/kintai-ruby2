class AttendancesController < ApplicationController
    
    def create
        @user = User.find(params[:user_id])
        @attendances = @user.attendances.find_by(worked_on: Date.today)
        if @attendances.started_at.nil?
            @attendances.update_attributes(started_at: current_time )
                flash[:info] = "おはようございます"
            elsif @attendances.update_attributes(finished_at: current_time)
                flash[:info] = "お疲れ様でした"
            else
                flash[:danger] = "トラブルがあり、登録出来ませんでした"
        end
        redirect_to @user
    end
end
