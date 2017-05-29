class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references(:patient)
      t.references(:doctor)
      t.references(:diagnosis)
      t.datetime :scheduled_at
      t.timestamps null: false
    end
  end
end
