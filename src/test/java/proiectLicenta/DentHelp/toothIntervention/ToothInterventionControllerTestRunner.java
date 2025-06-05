package proiectLicenta.DentHelp.toothIntervention;

import com.intuit.karate.junit5.Karate;

public class ToothInterventionControllerTestRunner {
    @Karate.Test
    Karate testAuthController() {
        return Karate.run("classpath:karate/toothIntervention/toothIntervention-controller.feature");
    }
}
