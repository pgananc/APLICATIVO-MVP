package integration_test.cucumber.spring.testing;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.web.client.RestTemplate;

import com.jayway.jsonpath.DocumentContext;
import com.jayway.jsonpath.JsonPath;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import integration_test.cucumber.spring.config.TestingConfig;
import io.restassured.RestAssured;
import io.restassured.response.Response;

@ContextConfiguration(classes = TestingConfig.class)
public class IntegrationStepDefinition {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private RestTemplate restTemplate;

	private ResponseEntity<?> rpta;

	private Response rptaJWT;
	private String jwt;

	private static String HOST_BACKEND = System.getProperty("backend") == null ? "http://localhost:8080"
			: System.getProperty("backend");

	@Given("un cliente rest")
	public void un_cliente_rest() throws Throwable {
		assertNotNull(restTemplate);
	}

	@When("se invoca al servicio login con credenciales {string} y {string}")
	public void se_invoca_al_servicio_login(String user, String pass) throws Throwable {
		final Map<String, String> params = new HashMap<String, String>();
		params.put("grant_type", "password");
		params.put("username", user);
		params.put("password", pass);
		rptaJWT = RestAssured.given().auth().preemptive().basic("mitomediapp", "mito89codex").and().with()
				.params(params).when().post(HOST_BACKEND + "/oauth/token");
		assertTrue(rptaJWT.getStatusCode() == 200);
	}

	@Then("se obtiene un token de autorizacion")
	public void se_obtiene_un_token_de_autorizacion() throws Throwable {
		jwt = rptaJWT.jsonPath().getString("access_token");
	}

	@When("se invoca a la url {string}")
	public void se_invoca_a_la_url(String url) throws Throwable {
		try {
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_JSON);
			headers.set("Authorization", "Bearer " + jwt);

			HttpEntity<Void> entity = new HttpEntity<Void>(headers);

			rpta = restTemplate.exchange(HOST_BACKEND + url, HttpMethod.GET, entity, String.class);
		} catch (Exception e) {
			rpta = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		} finally {
			// System.out.println("rpta ws .getStatusCodeValue(): " +
			// rptaJWT.getStatusCodeValue());
		}
	}

	@Then("se obtiene el estado http {int}")
	public void se_obtiene_el_estado_http(int statusCode) throws Throwable {
		assertTrue(rpta.getStatusCodeValue() == statusCode);
	}

	@Then("se valida que el campo {string} sea {string}")
	public void se_valida_que_el_campo_sea(String jsonPathExpression, String expected) throws Throwable {
		DocumentContext data = JsonPath.parse(rpta.getBody().toString());
		String valueOfField = data.read(jsonPathExpression).toString();
		assertEquals(valueOfField, expected);
	}
}
