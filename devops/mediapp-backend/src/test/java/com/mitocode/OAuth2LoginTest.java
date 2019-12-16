package com.mitocode;

import static org.junit.Assert.assertEquals;

import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.http.HttpStatus;
import org.springframework.test.context.junit4.SpringRunner;

import io.restassured.RestAssured;
import io.restassured.response.Response;

 

@RunWith(SpringRunner.class)
@SpringBootTest(classes = MediappBackendApplication.class, webEnvironment = WebEnvironment.DEFINED_PORT)
public class OAuth2LoginTest {

    private static final String URL_PREFIX = "http://localhost:8080";
    private String tokenValue = null;

    @Before
    public void obtenerTokenAcceso() {
        final Map<String, String> params = new HashMap<String, String>();
        params.put("grant_type", "password");
        params.put("username", "mito@gmail.com");
        params.put("password", "123");
        final Response response = RestAssured.given().auth().preemptive().basic("mitomediapp", "mito89codex").and().with().params(params).when().post("http://localhost:8080/oauth/token");

        tokenValue = response.jsonPath().getString("access_token");
    }

    @Test
    public void verificarSwaggerDocs() {
        Response response = RestAssured.get(URL_PREFIX + "/v2/api-docs");
        assertEquals(HttpStatus.UNAUTHORIZED.value(), response.getStatusCode());

        response = RestAssured.given().header("Authorization", "Bearer " + tokenValue).get(URL_PREFIX + "/v2/api-docs");
        assertEquals(HttpStatus.OK.value(), response.getStatusCode());
    }

    @Test
    public void verificarPacientes() {
        Response response = RestAssured.get(URL_PREFIX + "/pacientes/1");
        assertEquals(HttpStatus.UNAUTHORIZED.value(), response.getStatusCode());

        response = RestAssured.given().header("Authorization", "Bearer " + tokenValue).get(URL_PREFIX + "/pacientes/1");
        assertEquals(HttpStatus.OK.value(), response.getStatusCode());
    }

}