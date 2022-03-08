// Call the dataTables jQuery plugin
$(document).ready(function() {
    cargarUsuarios();
    $('#usuarios').DataTable();
    actualizarEmailUsuario();
});

function actualizarEmailUsuario(){
    document.getElementById('txt-email-usuario').innerHTML = localStorage.email;

}

async function cargarUsuarios(){
    const request = await fetch('api/usuarios', {
        method:'GET',
        headers: getHeaders()
    });
    const usuarios = await request.json();

    let tbody = document.querySelector("#usuarios tbody");

    tbody.innerHTML = "";
    for(u of usuarios){
        let deleteBtn = `<a href="#" onClick="eliminarUsuario(`+u.id+`)" class="btn btn-danger btn-circle btn-sm">
                            <i class="fas fa-trash"></i>
                         </a>`;
        let usuarioTr = `<tr>
                             <td>${u.id}</td>
                             <td>${u.nombre} ${u.apellido}</td>
                             <td>${u.email}</td>
                             <td>${u.telefono}</td>
                             <td>
                                 ${deleteBtn}
                             </td>
                         </tr>`;

        tbody.innerHTML += usuarioTr;
    }
}

function getHeaders(){
    return {
               'Accept':'application/json',
               'Content-Type':'application/json',
               'Authorization': localStorage.token
           }
}

async function eliminarUsuario(id){

    if(!confirm('Desea eliminar este usuario?')){
        return;
    }

     const request = await fetch('api/usuarios/'+id, {
            method:'DELETE',
            headers: getHeaders()
    });

    //Actualizo la pagina
    location.reload();
}