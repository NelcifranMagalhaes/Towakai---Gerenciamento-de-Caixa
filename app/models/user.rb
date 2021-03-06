# frozen_string_literal: true

class User < ApplicationRecord
  rolify
  # has_and_belongs_to_many :roles, :join_table => :users_roles

  after_create :assign_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def assign_default_role
    add_role(:visitante) if roles.blank?
  end
end
