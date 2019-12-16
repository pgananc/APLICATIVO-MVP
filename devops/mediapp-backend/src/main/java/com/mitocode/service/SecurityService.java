package com.mitocode.service;

import com.mitocode.dto.RenewPasswordFirstDTO;
import com.mitocode.dto.RespuestaApi;
import com.mitocode.dto.UpdatePasswordDTO;

public interface SecurityService {

	public RespuestaApi getToken(String username, String password);
	public RespuestaApi resetNewPasswordFirst(RenewPasswordFirstDTO updatePassword);
	public RespuestaApi updatePassword(UpdatePasswordDTO updatePassword);
	public RespuestaApi signOut(String token);
	public RespuestaApi refreshToken(String token);
}
