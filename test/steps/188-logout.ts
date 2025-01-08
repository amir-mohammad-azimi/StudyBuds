import {Given, When, Then} from "@cucumber/cucumber";
import { driver } from "./all";
import { byValueKey } from "appium-flutter-finder";
import {
    login,
    BottomBarIcon,
    do_logout,
    go_to_page,
    waitForElementByValue,
    clearChromeCacheFlutterCompatible
} from "../utils/utils.ts";

Given("I am on the profile page", async function () {
    await go_to_page(driver, BottomBarIcon.profile);
});

When("I click on the logout button", async function () {
    await do_logout(driver);
});

Then("A confirmation dialog should appear", async function () {
    const logout_confirmation_dialog = byValueKey("logout_confirmation_dialog");
    await driver.execute("flutter:waitFor", logout_confirmation_dialog);
});

When("I click on the confirm button", async function () {
    const confirm_logout = byValueKey("confirm_logout");
    await driver.elementClick(confirm_logout);
});

Then("I should be logged out and be redirected to the login screen", async function () {
    await clearChromeCacheFlutterCompatible();

    await waitForElementByValue(driver, 'Continue as a guest');

});
