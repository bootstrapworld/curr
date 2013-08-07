/*
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
 //window.addEventListener("resize", function(){ rewrapCodeExps(); });
*/

window.addEventListener("load", function(){
  // translate all the TEXTAREA nodes into full-blown CM instances, and color TTs with runmode
  // (we use the more expensive CM stuff for indenting)
  var codeSnippets = document.querySelectorAll('textarea');
  for(var i=0; i < codeSnippets.length; i++){
    CodeMirror.fromTextArea(codeSnippets[i], {mode:"scheme2", readOnly: "nocursor"});
  }
  var codeSnippets = document.querySelectorAll('tt');
  for(var i=0; i < codeSnippets.length; i++){
    var node = document.createElement('span');
    node.className = 'editbox';
    codeSnippets[i].parentNode.insertBefore(node, codeSnippets[i]);
    CodeMirror.runMode(codeSnippets[i].firstChild.nodeValue, "scheme2", node);
    codeSnippets[i].style.display = 'none';
  }

});
/*
var strip, cards, cardNumber = 0;

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
*/


window.addEventListener("scroll", function(){
  var overviewBlock = document.getElementsByTagName('blockquote')[0],
      blockDimensions = overviewBlock.getBoundingClientRect(),
      threshold = blockDimensions.height+overviewBlock.offsetTop,
      toolbar = document.getElementById('lessonToolbar'),
      fixed = document.body.scrollTop > threshold;
  toolbar.className = (fixed)? 'fixed lessonToolbar' : 'lessonToolbar';
});


// find all lesson segments in the file, and toggle the notes className for each
function toggleTeacherNotes(button){
  button.value = (button.value == 'Show Teacher Notes')? 'Hide Teacher Notes' : 'Show Teacher Notes';
  var lessons = document.getElementsByClassName('lesson');
  for(var i=0; i<lessons.length; i++){
    lessons[i].className = (lessons[i].className == 'lesson')? 'lesson teacherNotes' : 'lesson';
  }
}
