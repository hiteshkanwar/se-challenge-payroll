class CreateEmployeeReports < ActiveRecord::Migration[7.0]
  def change
    create_table :employee_reports do |t|
      t.integer :report_id
      t.string :employee_id
      t.string :job_group
      t.float :hours_worked
      t.date :date

      t.timestamps
    end
  end
end
