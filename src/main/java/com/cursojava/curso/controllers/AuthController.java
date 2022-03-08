package com.cursojava.curso.controllers;

import com.cursojava.curso.dao.UsuarioDAO;
import com.cursojava.curso.models.Usuario;
import com.cursojava.curso.utils.JWTUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AuthController {

    @Autowired
    private UsuarioDAO usuarioDAO;

    @Autowired
    private JWTUtil jwtUtil;

    @RequestMapping(value = "api/login", method= RequestMethod.POST)
    public String login(@RequestBody Usuario usuario){
        Usuario u = usuarioDAO.obtenerUsuarioPorCredenciales(usuario);

        if(u != null){
            String tokenJWT = jwtUtil.create(String.valueOf(u.getId()), u.getEmail());
            return tokenJWT;
        }
        return "FAIL";
    }

}
