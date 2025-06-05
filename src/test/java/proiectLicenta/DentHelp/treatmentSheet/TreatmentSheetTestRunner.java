package proiectLicenta.DentHelp.treatmentSheet;

import com.intuit.karate.junit5.Karate;

public class TreatmentSheetTestRunner {
    @Karate.Test
    Karate testAuthController() {
        return Karate.run("classpath:karate/treatmetSheet/treatmentSheet-controller.feature");
    }
}
