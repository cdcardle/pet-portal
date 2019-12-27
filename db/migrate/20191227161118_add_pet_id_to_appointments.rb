class AddPetIdToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :pet_id, :integer
  end
end
