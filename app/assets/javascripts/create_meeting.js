setTimeout('delayedRedirect()', 30000);

function delayedRedirect(){
  window.location.href = document.referrer;
}