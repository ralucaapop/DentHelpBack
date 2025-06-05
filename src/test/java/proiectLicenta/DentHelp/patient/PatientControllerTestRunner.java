package proiectLicenta.DentHelp.patient;

import com.intuit.karate.junit5.Karate;

public class PatientControllerTestRunner {
    @Karate.Test
    Karate testAuthController() {
        return Karate.run("classpath:karate/patient/patient-controller.feature");
    }
}
