package proiectLicenta.DentHelp.patientAppointments;

import com.intuit.karate.junit5.Karate;

public class PatientAppointmentsTestRun {
    @Karate.Test
    Karate testAuthController() {
        return Karate.run("classpath:karate/patientAppointments/patientAppointments-controller.feature");
    }
}
