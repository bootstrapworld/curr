// translate all the TEXTAREA nodes into DIVs, and all TT nodes into SPANs
var codeSnippets = document.getElementsByTagName('textarea');
for(var i=0; i < codeSnippets.length; i++){
  var node = document.createElement('div');
  node.className = 'editbox';
  codeSnippets[i].parentNode.insertBefore(node, codeSnippets[i]);
  highlightText(codeSnippets[i].value, node);
  codeSnippets[i].style.display = 'none';
}
var codeSnippets = document.getElementsByTagName('tt');
for(var i=0; i < codeSnippets.length; i++){
  var node = document.createElement('span');
  node.className = 'editbox';
  codeSnippets[i].parentNode.insertBefore(node, codeSnippets[i]);
  highlightText(codeSnippets[i].firstChild.nodeValue, node);
  codeSnippets[i].style.display = 'none';
}

var cardNumber = 0,
strip = document.getElementsByClassName('lesson')[0],
cards = strip.getElementsByTagName('LI');

function gotoCard(cardNum){
  var width = cards[0].offsetWidth;
  if(cardNum < 0 || cardNum > cards.length-1) return;
  document.getElementById('prev').disabled = (cardNum <= 0);
  document.getElementById('next').disabled = (cardNum == cards.length-1);
  strip.style.left = (-cardNum * width) + 'px';
  cardNumber = cardNum;
}

function nextCard(){gotoCard(cardNumber+1);}
function prevCard(){gotoCard(cardNumber-1);}
gotoCard(0);

function showTeacherNotes(){
  var strip = document.getElementsByClassName('lesson')[0];
  strip.className = (strip.className == 'lesson')? 'lesson teacherNotes' : 'lesson';
}
