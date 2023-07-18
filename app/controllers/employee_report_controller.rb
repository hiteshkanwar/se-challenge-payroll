class EmployeeReportController < ApplicationController
	protect_from_forgery with: :null_session
	require 'csv'

  def upload_csv
  	report_id = params[:report_id].to_i
    file = params[:file]

    if EmployeeReport.exists?(report_id: report_id)
      render json: { error: "Report with ID #{report_id} already exists." }, status: :conflict
    else
    CSV.foreach(file.path, headers: true) do |row|
      EmployeeReport.create(
        report_id: report_id,
        date: row['date'],
        hours_worked: row['hours worked'].to_f,
        employee_id: row['employee id'],
        job_group: row['job group']
      )
    end
    render json: { message: "File uploaded successfully." }, status: :created
    end
  end

  def payroll_report
    employee_reports = []
    time_reports = EmployeeReport.all.order(:employee_id)
    
    time_reports.group_by { |record| [record.employee_id, calculate_pay_period(record.date)] }.each do |(employee_id, pay_period), records|
      hourly_rate = records.first.job_group == 'A' ? 20 : 30
      amount_paid = records.sum { |record| record.hours_worked * hourly_rate }
      employee_reports << {
        employeeId: employee_id,
        payPeriod: {
          startDate: pay_period.begin.strftime("%Y-%m-%d"),
          endDate: pay_period.end.strftime("%Y-%m-%d")
        },
        amountPaid: "$#{sprintf('%.2f', amount_paid)}"
      }
    end

    payroll_report = { payrollReport: { employeeReports: employee_reports } }

    render json: payroll_report
  end
  private

  def calculate_pay_period(date)
    if date.day <= 15
      date.beginning_of_month..date.beginning_of_month + 14.days
    else
      date.beginning_of_month + 15.days..date.end_of_month
    end
  end
end


