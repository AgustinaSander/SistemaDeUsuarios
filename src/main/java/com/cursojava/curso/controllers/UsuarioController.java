package com.cursojava.curso.controllers;

import com.cursojava.curso.dao.UsuarioDAO;
import com.cursojava.curso.models.Usuario;
import com.cursojava.curso.utils.JWTUtil;
import de.mkammerer.argon2.Argon2;
import de.mkammerer.argon2.Argon2Factory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
public class UsuarioController {

    @Autowired //Inyeccion de dependecias
    private UsuarioDAO usuarioDAO;

    @Autowired
    private JWTUtil jwtUtil;

    /*@RequestMapping(value="api/usuarios/{id}", method= RequestMethod.GET)
    public Usuario getUsuario(@PathVariable Long id){
        Usuario u = new Usuario();
        u.setId(id);
        u.setNombre("Agustina");
        u.setApellido("Sander");
        u.setEmail("asander00@hotmail.com");
        u.setTelefono("3424227082");
        u.setPassword("hola123");

        return u;
    }*/

    private boolean validarToken(String token){
        String usuarioId = jwtUtil.getKey(token);
        return usuarioId != null;
    }

    @RequestMapping(value="api/usuarios", method=RequestMethod.GET)
    public List<Usuario> getUsuarios(@RequestHeader(value="Authorization") String token){
        if(!validarToken(token)) return null;

        return usuarioDAO.getUsuarios();
    }

    @RequestMapping(value="api/usuarios/{id}", method= RequestMethod.DELETE)
    public void eliminar(@RequestHeader(value="Authorization") String token, @PathVariable Long id){
        if(!validarToken(token)) return;
        usuarioDAO.eliminar(id);
    }

    @RequestMapping(value="api/usuarios", method=RequestMethod.POST)
    public void registrarUsuario(@RequestBody Usuario usuario){
        //Con requestBody estoy convirtiendo el json que recibo a un usuario automaticamente

        //Encriptamos la contrasena
        Argon2 argon2 = Argon2Factory.create(Argon2Factory.Argon2Types.ARGON2id);
        String hash = argon2.hash(1,1024,1, usuario.getPassword());
        usuario.setPassword(hash);

        usuarioDAO.registrar(usuario);
    }

}
