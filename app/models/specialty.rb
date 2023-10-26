class Specialty < ApplicationRecord
    has_many :listspecs
    has_many :doctors, through: :listspecs
end