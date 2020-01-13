$(function(){
  var canvas = document.getElementById('canvas');
  if (canvas.getContext) {
      var ctx = canvas.getContext('2d');
      ctx.fillStyle = "rgb(255,255,255)"
      ctx.fillRect(0, 0, canvas.width, canvas.height);
  }
  var drawing = false;
  var before_x = 0;
  var before_y = 0;
  $('#canvas').mousedown(function(e){
      drawing = true;
      // let rect = e.target.getBoundingClientRect();
      before_x = e.pageX - $(this).offset().left
      before_y = e.pageY - $(this).offset().top
  })
  .mousemove(function(e){
      if (!drawing){
          return
      };
      // let rect = e.target.getBoundingClientRect();
      let x = e.pageX - $(this).offset().left
      let y = e.pageY - $(this).offset().top
      let w = $('#width').val();
      ctx.lineCap = 'round';

      let color = $('#color').val();
      ctx.strokeStyle = color;

      ctx.lineWidth = w;
      ctx.beginPath();
      ctx.moveTo(before_x, before_y);
      ctx.lineTo(x, y);
      ctx.stroke();
      ctx.closePath();
      before_x = x;
      before_y = y;
  })
  .mouseup(function(){
      drawing = false;
  })
  .mouseleave(function(){
      drawing = false;
  });
  $('#delete_canvas').click(function(){
      ret = confirm('お絵かきを削除します。');
      if (ret == true){
          ctx.fillStyle = "rgb(255,255,255)"
          ctx.fillRect(0, 0, canvas.width, canvas.height);
      }
  });
  // $('#pencil').click(function(){
  //     tool(1);
  // });
  // $('#eraser').click(function(){
  //     tool(2);
  // });
  // function tool(btnNum){
  //     if (btnNum == 1){
  //     ctx.globalCompositeOperation = 'source-over';
  //     $('#pencil').className = 'active';
  //     $('#eraser').className = '';
  //     }
  //     else if (btnNum == 2){
  //     ctx.globalCompositeOperation = 'destination-out';
  //     $('#pencil').className = '';
  //     $('#eraser').className = 'active';
  //     }
  // };

  $('form').click(function(){
      var dataURI = canvas.toDataURL();
      $('#post_dataURI').val(dataURI);
      // console.log(dataURI);
  });
});
