class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.column :digits, :string
      t.column :kind, :string
      t.column :contact_id, :integer

      t.timestamps
    end
  end
end
