# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

require 'faker'

Appointment.destroy_all
Doctor.destroy_all
Patient.destroy_all

#ATTENTION: l'ordre est important pour le destroy_all.
#Appointment a besoin de Doctor + Patient (c'est le + dépendant) il doit partir en premier pour "libérer" les autres
#Patient & Docteur (N-N, indépendants) une fois "libérés" de leurs obligations (rdv) peuvent être supprimés

all_existing_doctors = []
all_existing_patients = []

french_cities = ["Paris", "Marseille", "Lyon", "Toulouse", "Nice", "Nantes", "Strasbourg", "Montpellier", "Bordeaux", "Lille", "Rennes", "Reims", "Le Havre", "Cannes", "Limoges", "Dijon", "Amiens", "Angers", "Perpignan", "Besançon"]
medical_fields = ["Cardiologie", "Dermatologie", "Gastro-entérologie", "Gynécologie", "Hématologie", "Néphrologie", "Neurologie", "Oncologie", "Ophtalmologie", "Orthopédie", "Oto-rhino-laryngologie (ORL)", "Pédiatrie", "Pneumologie", "Psychiatrie", "Radiologie", "Rhumatologie", "Urologie", "Chirurgie générale", "Chirurgie plastique", "Chirurgie cardiaque", "Chirurgie thoracique", "Chirurgie vasculaire", "Endocrinologie", "Infectiologie", "Médecine interne", "Médecine du travail", "Médecine d'urgence", "Médecine nucléaire", "Médecine légale", "Médecine du sport"]
french_zip_codes = ["75001", "69002", "13003", "34000", "33005", "59006", "69007", "75008", "13009", "69010", "31011", "13012", "75013", "69014", "34015", "59016", "75017", "13018", "69019", "33020"]

10.times do 
    new_doctor = Doctor.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    specialty: medical_fields.sample,
    zip_code: french_zip_codes.sample,
    city: french_cities.sample
)

    all_existing_doctors << new_doctor
end

10.times do
    new_patient = Patient.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: french_cities.sample
    )

    all_existing_patients << new_patient
end

10.times do 
    appointed_doctor = all_existing_doctors.sample
    appointed_patient = all_existing_patients.sample

    new_appointment = Appointment.create(
        date: Faker::Time.forward(days: 60, format: :long),
        doctor: appointed_doctor,
        patient: appointed_patient,
        city: appointed_doctor.city
    )
end