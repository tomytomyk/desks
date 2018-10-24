class ReportsController < ApplicationController

    # before_action :user_login_check
    def new
    	@report = Report.new
    end

    def index
    	@reports = Report.all.order(created_at: :desc)
        @report_value = ReportValue.new
        @sub_report = SubReport.new
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
    def sub_report_params
        params.require(:sub_report).permit(:body, :user_id, :report_id)
    end
end
