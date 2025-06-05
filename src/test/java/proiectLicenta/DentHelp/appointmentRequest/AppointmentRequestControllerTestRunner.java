package proiectLicenta.DentHelp.appointmentRequest;

import com.intuit.karate.junit5.Karate;

public class AppointmentRequestControllerTestRunner {
    @Karate.Test
    Karate testAuthController() {
        return Karate.run("classpath:karate/appointmentRequest/appointmentRequest-controller.feature");
    }

}
