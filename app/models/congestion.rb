class Congestion < ApplicationRecord
  belongs_to :user
  belongs_to :exhibition

  def self.delete_test
    Congestion.delete_all
  end
end