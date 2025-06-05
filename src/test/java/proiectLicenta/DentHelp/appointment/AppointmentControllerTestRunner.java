package proiectLicenta.DentHelp.appointment;

import com.intuit.karate.junit5.Karate;

public class AppointmentControllerTestRunner {

    @Karate.Test
    Karate testAuthController() {
        return Karate.run("classpath:karate/appointment/appointment-controller.feature");
    }
}
