class DeviseCreateAdmins < ActiveRecord::Migration
  def change
    create_table(:admins) do |t|
      ## Database authenticatable
      t.string :email,              :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""
      t.string :first_name,            :null => false, :default => ""
      t.string :last_name,             :null => false, :default => ""
      t.string :address,               :null => false, :default => ""
      t.string :address2,              :null => false, :default => ""
      t.string :city,                  :null => false, :default => ""
      t.string :state,                 :null => false, :default => ""
      t.string :zip_code,              :null => false, :default => ""
      t.string :country,               :null => false, :default => ""
      t.string :time_zone,             :null => false, :default => ""
      t.string :phone,                 :null => false, :default => ""
      t.string :occupation,            :null => false, :default => ""
      t.boolean :active,               default: true

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0, :null => false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at


      t.timestamps
    end

    add_index :admins, :email,                :unique => true
    add_index :admins, :reset_password_token, :unique => true
    add_index :admins, :confirmation_token,   :unique => true
    add_index :admins, :unlock_token,         :unique => true
  end
end
