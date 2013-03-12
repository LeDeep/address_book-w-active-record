class CreateMailingAddresses < ActiveRecord::Migration
def change
    create_table :mailing_addresses do |t|
      t.column :building_number, :string
      t.column :street_name, :string
      t.column :unit_number, :string
      t.column :city, :string
      t.column :state, :string
      t.column :zip_code, :string
      t.column :kind, :string
      t.column :contact_id, :integer

      t.timestamps
    end
  end
end
