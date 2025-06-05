package proiectLicenta.DentHelp.auth;

import com.intuit.karate.junit5.Karate;

public class AuthControllerTestRunner {
    @Karate.Test
    Karate testAuthController() {
        return Karate.run("classpath:karate/auth/auth-controller.feature");
    }
}
