var strip, cards, cardNumber = 0;

// calculateWidth : node -> number
// cache and return the width of the current node, and all of its children
function calculateWidth(node){
  node.cachedWidth = 1;
  for(var i = 0; i < node.children.length; i++) {
    node.cachedWidth += (node.children[i].cachedWidth || calculateWidth(node.children[i]));
  }
  node.cachedWidth = Math.max(node.cachedWidth, node.offsetWidth);
  return node.cachedWidth;
}

// rewrap the REPL output according to DrRacket's conventions
// compare width of the line to the interactions window
// If the wrapping status has changed, re-check- all the children
var rewrapOutput = function(node){
  var oldWrap   = (node.className.indexOf("wrapped") > -1),    // original wrap state
  width     = node.cachedWidth || calculateWidth(node),   // current width (use cache if possible)
  maxWidth  = node.parentNode.style.maxWidth,             // maximum width
  newWrap   = width > maxWidth;                           // should we wrap?
  console.log(maxWidth);
  if((!oldWrap && newWrap) || (oldWrap && !newWrap)){
    node.className=newWrap? node.className+" wrapped" : node.className.replace(/ wrapped/g, "");
    for(var i = 0; i < node.children.length; i++){ rewrapOutput(node.children[i]); }
  }
}


var rewrapCodeExps = function(){
  // find all sexps and circevalsexps and assign onClick handlers
  var circles = document.getElementsByClassName('circleevalsexp'),
      codes   = document.getElementsByClassName('codesexp');
  for (var i=0; i<codes.length;i++){
    rewrapOutput(codes[i]);
  }
};

window.addEventListener("load", function(){
  // translate all the TEXTAREA nodes into DIVs, and all TT nodes into SPANs
  var codeSnippets = document.getElementsByTagName('textarea');
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
                        
//window.addEventListener("resize", function(){ rewrapCodeExps(); });

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

function showTeacherNotes(elt){
  parentStrip = elt.parentNode.parentNode.getElementsByTagName('ul')[0];
  parentStrip.className = (parentStrip.className == 'lesson')? 'lesson teacherNotes' : 'lesson';
}
