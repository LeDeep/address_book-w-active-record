class CreateEmailAddresses < ActiveRecord::Migration
  def change
    create_table :email_addresses do |t|
      t.column :email, :string
      t.column :kind, :string
      t.column :contact_id, :integer

      t.timestamps
    end
  end
end
