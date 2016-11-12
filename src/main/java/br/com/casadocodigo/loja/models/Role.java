package br.com.casadocodigo.loja.models;

import javax.persistence.Id;

import org.springframework.security.core.GrantedAuthority;

public class Role implements GrantedAuthority{
	
	@Id
	private String name;
	
	@Override
	public String getAuthority(){
		return name;
	}
}
