package com.fervil.spring.careercoach.model.domain;
import java.util.List;
import org.codehaus.jackson.annotate.JsonProperty;

public class ZipcodeContainer {
	@JsonProperty("results")
   public List<Zipcode> results;

	public List<Zipcode> getResults() {
		return results;
	}

	public void setResults(List<Zipcode> results) {
		this.results = results;
	}

}