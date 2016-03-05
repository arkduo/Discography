$('#search_img').html("<%= escape_javascript(render 'search_image', val: @tune.album.title) %>");
