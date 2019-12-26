class AddAppointmentIdToInvoices < ActiveRecord::Migration[6.0]
  def change
    change_table :invoices do |t|
      t.integer :appointment_id
    end
  end
end
