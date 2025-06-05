package proiectLicenta.DentHelp.confirmAppointment;

import com.intuit.karate.junit5.Karate;

public class ConfirmAppointmentTestRunner {
    @Karate.Test
    Karate testAuthController() {
        return Karate.run("classpath:karate/confirmAppointment/confirmAppointment-controller.feature");
    }
}
