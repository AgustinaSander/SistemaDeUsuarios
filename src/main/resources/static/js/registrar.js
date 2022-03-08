// Call the dataTables jQuery plugin
$(document).ready(function() {

});

async function registrarUsuario(){
    let datos = {
        nombre : document.getElementById('txtnombre').value,
        apellido : document.getElementById('txtapellido').value,
        email : document.getElementById('txtemail').value,
        telefono : document.getElementById('txttelefono').value,
        password : document.getElementById('txtpassword').value,
    };

    let repetirPassword = document.getElementById('txtrepetirpassword').value;
    if(repetirPassword != datos.password){
        alert('La contrasena que escribiste es diferente.');
        return;
    }

    const request = await fetch('api/usuarios', {
        method:'POST',
        headers: {
            'Accept':'application/json',
            'Content-Type':'application/json'
        },
        //Agarra un elemento de js y lo convierte en un string de json
        body: JSON.stringify(datos)
    });

    alert("Se ha registrado correctamente!");
    window.location.href="index.html";
}
