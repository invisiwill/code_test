class CreateSpecialties < ActiveRecord::Migration
  def change
    create_table :specialties do |t|
      t.string :name
    end
    add_reference :doctors, :specialty
  end
end
