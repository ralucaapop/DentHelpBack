package proiectLicenta.DentHelp.adminNotifications;

import com.intuit.karate.junit5.Karate;

public class AdminNotificationsTestRunner {
    @Karate.Test
    Karate testAdminNotificationsController() {
        return Karate.run("classpath:karate/adminNotifications/adminnotifications-controller.feature");
    }
}
