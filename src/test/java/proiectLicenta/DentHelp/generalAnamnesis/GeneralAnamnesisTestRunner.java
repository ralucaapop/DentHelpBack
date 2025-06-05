package proiectLicenta.DentHelp.generalAnamnesis;

import com.intuit.karate.junit5.Karate;

public class GeneralAnamnesisTestRunner {
    @Karate.Test
    Karate testAuthController() {
        return Karate.run("classpath:karate/generalAnamnesis/generalAnamnesis-controller.feature");
    }
}
