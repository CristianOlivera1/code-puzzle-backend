package com.example.codepuzzle.Dto;

import java.sql.Timestamp;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DtoUser {
	private String idUsuario;
	private String idRol;
	private String nombre;
	private String email;
	private String contrasenha;
	private String foto;
	private Timestamp fechaRegistro;
	private String jwtToken;
}