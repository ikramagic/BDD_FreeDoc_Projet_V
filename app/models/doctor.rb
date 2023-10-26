class Doctor < ApplicationRecord
    has_many :appointments
    has_many :patients, through: :appointments
    has_many :listspecs
    has_many :specialtys, through: :listspecs
end

#quand on utilise has_many/through, on doit d'abord indiquer avec has_many où trouver cette info