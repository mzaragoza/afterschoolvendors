class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates_uniqueness_of :email

  def name
    (first_name + ' ' + last_name).titleize
  end

  def full_name
    first_name + ' ' + last_name
  end


end
