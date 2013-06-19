var strip, cards, cardNumber = 0;

window.addEventListener("load", function(){
  // translate all the TEXTAREA nodes into DIVs, and all TT nodes into SPANs
  var codeSnippets = document.getElementsByTagName('textarea');
  console.log(codeSnippets);
  for(var i=0; i < codeSnippets.length; i++){
    var node = document.createElement('div');
    node.className = 'editbox';
    codeSnippets[i].parentNode.insertBefore(node, codeSnippets[i]);
    CodeMirror.runMode(codeSnippets[i].value, "scheme2", node);
    codeSnippets[i].style.display = 'none';
  }
  var codeSnippets = document.getElementsByTagName('tt');
  for(var i=0; i < codeSnippets.length; i++){
    var node = document.createElement('span');
    node.className = 'editbox';
    codeSnippets[i].parentNode.insertBefore(node, codeSnippets[i]);
    CodeMirror.runMode(codeSnippets[i].firstChild.nodeValue, "scheme2", node);
    codeSnippets[i].style.display = 'none';
  }
  // setup globals we'll use later
  cardNumber = 0;
  strip = document.getElementsByClassName('lesson')[0];
  cards = strip.getElementsByTagName('LI');
  gotoCard(0);
  
});

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

function showTeacherNotes(){
  var strips = document.getElementsByClassName('lesson');
  for(var i=0; i< strips.length; i++)
    strips[i].className = (strips[i].className == 'lesson')? 'lesson teacherNotes' : 'lesson';
}
