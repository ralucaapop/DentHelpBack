package proiectLicenta.DentHelp.anamnesisAppointment;

import com.intuit.karate.junit5.Karate;

public class AnamnesisAppointmentTestRunner {
    @Karate.Test
    Karate testAuthController() {
        return Karate.run("classpath:karate/anamnesisAppointment/anamnesisAppointment-controller.feature");
    }
}
