setTimeout('delayedRedirect()', 3000);

function delayedRedirect(){
  window.location.href = document.referrer;
}