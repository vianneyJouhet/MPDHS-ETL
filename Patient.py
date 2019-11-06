class Patient:
    def __init__ (self,patient_num,gender,birthdate):
        self.patient_num = patient_num
        self.gender = gender
        self.birthdate = birthdate

    def printPatient(self):
        print(" *******************")
        print("Patient")
        print(self.patient_num)
        print(self.gender)
        print(self.birthdate)
        print(" *******************")
