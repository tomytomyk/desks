class ReportsController < ApplicationController

    # before_action :user_login_check
    def new
    	@report = Report.new
    end

    def index
        @report_value = ReportValue.new
        @sub_report = SubReport.new
        if params[:search] != nil
        @reports = Report.where('title LIKE ? or body LIKE ?', "%#{params[:search]}%","%#{params[:search]}%")
        @users = User.where('name LIKE ?', "%#{params[:search]}%")
        elsif params[:report] != nil
        @reports = Report.where("language_id = ? ",params[:report][:language_id])
        t = Time.now
        language = Language.find_by(id: params[:report][:language_id])
        if t - language.updated_at >= 30
           language.view += 1
           language.save
        end
        else
        @reports = Report.all.order(created_at: :desc)
        end
    end

    def create
        report = Report.new(report_params)
        report.user_id = session[:user_id]
        report.save
        redirect_to reports_path
    end

    def show
        @report = Report.find(params[:id])
        @report_value = ReportValue.new
        @sub_report = SubReport.new
        if Watch.exists?(report_id: params[:id], user_id: session[:user_id])
            watch = Watch.find_by(report_id: params[:id], user_id: session[:user_id])
            watch.touch
            watch.save
        else
            watch = Watch.new(report_id: params[:id], user_id: session[:user_id])
            watch.save
        end
        t = Time.now
        if t - @report.updated_at >= 30
           @report.view += 1
           @report.save
        end
    end

    def value_create
        if ReportValue.exists?(user_id: session[:user_id], report_id: params[:report_id])
            if ReportValue.exists?(user_id: session[:user_id], report_id: params[:report_id], flag: params[:flag])
              report_value = ReportValue.find_by(user_id: session[:user_id], report_id: params[:report_id])
                report_value.destroy
            else
              report_value = ReportValue.find_by(user_id: session[:user_id], report_id: params[:report_id])
                report_value.destroy
                report_value = ReportValue.new(user_id: session[:user_id], report_id: params[:report_id], flag: params[:flag])
                report_value.save
            end
        else  report_value = ReportValue.new(user_id: session[:user_id], report_id: params[:report_id], flag: params[:flag])
              report_value.save
        end
        @report = Report.find(params[:report_id])
    end

    def value_show
        report = Report.find(params[:id])
        @report_values = ReportValue.where(report_id: report.id, flag:params[:flag])
    end

    def new_sub_report
        @sub_report = SubReport.new
        @report = Report.find(params[:id])
    end

    def create_sub_report
        sub_report = SubReport.new(user_id: session[:user_id], report_id: params[:report_id], body: sub_report_params[:body])
        sub_report.save
        redirect_to report_path(params[:report_id])
    end

    def destroy_sub_report
    end
    private
    def report_params
    	params.require(:report).permit(:title, :body, :user_id, :value, :language_id)
    end
    def report_value_params
        params.require(:report_value).permit(:report_id, :user_id, :flag)
    end
    def watch_params
        params.require(:watch).permit(:report_id, :user_id)
    end
    def sub_report_params
        params.require(:sub_report).permit(:body, :user_id, :report_id)
    end
end
