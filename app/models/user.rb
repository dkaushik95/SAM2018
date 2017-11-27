class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :papers



  enum role: [:author, :pcc, :pcm, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :author
  end

end
