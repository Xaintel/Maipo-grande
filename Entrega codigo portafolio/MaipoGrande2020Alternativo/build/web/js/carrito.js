/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(function (){
    $('tr #borrar').click(function (e){
        var elemento = $(this);
        var iditem = elemento.parent().find('#idarticulo').text();
        $.ajax({
            url: 'DeleteItem',
            type: 'post',
            data: {iditem : iditem},
            success: function (r) {
                alert(r);
            }
        })
    });
});