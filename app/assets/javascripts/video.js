//= require jquery
$(function(){
    
  let roop = document.getElementById('count_video').value - 1
  
  for (let num = 0; num < roop; num++) {
  // ここからfor文 videoの数（新たにモデルで作った値分）まわす
    let video = document.getElementById("video"+String(num));
    
    video.addEventListener("ended", function () {
      
      $(this).remove();
      
      video = document.getElementById("video"+String(num += 1));
      
      $(video).show();
      
      video.play();
      
    });
  // ここまで
  }
    
});
