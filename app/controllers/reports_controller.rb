class ReportsController < ApplicationController

    # before_action :user_login_check
    def new
    	@report = Report.new
    end

    def index
    	@reports = Report.all
        @report_value = ReportValue.new
    end

    def create
    	report = Report.new(report_params)
    	report.user_id = session[:user_id]
    	report.save
    	redirect_to reports_path
    end

    def value_create
        if    ReportValue.exists?(user_id: session[:user_id], report_id: params[:report_id])
              report_value = ReportValue.find_by(user_id: session[:user_id], report_id: params[:report_id])
            if  ReportValue.exists?(flag: params[:flag])
                report_value.destroy
                redirect_to reports_path
            else
                report_value.destroy
                report_value = ReportValue.new(user_id: session[:user_id], report_id: params[:report_id], flag: params[:flag])
                report_value.save
                redirect_to reports_path
            end
        else  report_value = ReportValue.new(user_id: session[:user_id], report_id: params[:report_id], flag: params[:flag])
              report_value.save
              redirect_to reports_path
        end
    end

    private
    def report_params
    	params.require(:report).permit(:title, :body, :item_id, :user_id, :value)
    end

end
