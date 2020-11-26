class CreateApplicantJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :applicant_jobs do |t|
      t.references :applicant, null: false, foreign_key: true
      t.references :job, null: false, foreign_key: true
      t.boolean :is_active
      t.boolean :is_primary

      t.timestamps
    end
  end
end
