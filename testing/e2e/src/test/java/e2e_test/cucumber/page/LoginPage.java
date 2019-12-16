package e2e_test.cucumber.page;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import util.Constants;

public class LoginPage {

	private WebDriver driver;

	private String URL = Constants.URL_WEBAPP + "/login";
	
	@FindBy(id = "email")
	private WebElement txtUser;
	
	@FindBy(id = "password")
	private WebElement txtPassword;
	
	@FindBy(id = "login")
	private WebElement btnLogin;

	@FindBy(xpath = "/html/body/app-root/div/mat-sidenav-container/mat-sidenav-content/app-login/form/div[1]/label")
	private WebElement banner;
	
	public LoginPage(WebDriver driver) {
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	public void open() {

		this.driver.get(URL);
	}
	
	public void writeUser(String value) {
		txtUser.sendKeys(value);
	}
	
	public void writePassword(String value) {
		txtPassword.sendKeys(value);
	}

	public WebElement getBanner(){
		return this.banner;
	}

	public String getValueFromTxtUser(){
		return this.txtUser.getText();
	}

	public WebElement getTxtUser(){
		return this.txtUser;
	}
	
	public void clickEntrar() {
		btnLogin.click();
	}

	public String getBannerTitle(){
		return this.banner.getText();
	}
	
	public void realizarLogin(String usuario, String password) throws Exception {
		open();
		writeUser(usuario);
		writePassword(password);
		clickEntrar();
		Thread.sleep(5000);
		driver.close();
		Thread.sleep(2000);
		driver.switchTo().window(driver.getWindowHandles().toArray()[0].toString());
	}
}
