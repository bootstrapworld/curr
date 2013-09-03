/*******************************************
 * CARD INITIALIZATION AND SCROLLING
 *******************************************/

// for each lesson, initialize the list of cards and set button behaviors
function initializeCards(){
  var segments = document.getElementsByClassName('segment');
  for(var i=0; i<segments.length; i++){
    lesson = segments[i];
    lesson.cards = lesson.getElementsByClassName('lessonItem');
    lesson.currentCard = 0;
    lesson.prev = lesson.getElementsByClassName('prev')[0];
    lesson.next = lesson.getElementsByClassName('next')[0];
    lesson.prev.disabled = true;
    lesson.prev.onclick = function(){gotoCard(lesson, lesson.currentCard-1);};
    lesson.next.addEventListener("click", function(){gotoCard(lesson, lesson.currentCard+1);}, false);
    console.log(lesson.next.onclick);
  }
}

function gotoCard(lesson, cardNum){
  var width = lesson.cards[0].offsetWidth;
  if(lesson.currentCard < 0 || lesson.currentCard > lesson.cards.length-1) return;
  lesson.prev.disabled = (lesson.currentCard <= 0);
  lesson.next.disabled = (lesson.currentCard == lesson.cards.length-1);
  lesson.style.left = (-lesson.currentCard * width) + 'px';
}


/*******************************************
 * CODE RE-INDENTING
 *******************************************/

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
  var oldWrap   = (node.className.indexOf("wrapped") > -1),// original wrap state
  width     = node.cachedWidth || calculateWidth(node),   // current width (use cache if possible)
  maxWidth  = node.parentNode.clientWidth,                // maximum width
  newWrap   = width > maxWidth;                           // should we wrap?
  console.log('parent node\'s width is '+maxWidth+', while expression\'s width is '+width);
  console.log('previously, the node was '+(oldWrap? 'wrapped' : 'unwrapped')+', and now it should be '+(newWrap? 'wrapped' : 'unwrapped'))
  if((!oldWrap && newWrap) || (oldWrap && !newWrap)){
    console.log('REWRAPPING: old className is '+node.className+'. setting className to '+(newWrap? 'wrapped' : 'not wrapped'));
    node.className=newWrap? node.className+" wrapped" : node.className.replace(/\s*wrapped/g, "");
    for(var i = 0; i < node.children.length; i++){ rewrapOutput(node.children[i]); }
  }
}

// rewrap all REPL content onresize, throttled by 250ms
var rewrapThrottle = null;
var rewrapCodeExps = function(){
  clearTimeout(rewrapThrottle);
  rewrapThrottle = setTimeout(function(){
                              var repls = document.getElementsByClassName('codesexp');
                              for(var i=0; i<repls.length; i++){ rewrapOutput(repls[i])};
                              }, 500);
};

/*******************************************
 * EVENT HANDLERS
 *******************************************/

window.addEventListener("resize", function(){ rewrapCodeExps(); });

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

  // initialize card buttons
  //initializeCards();
});


window.addEventListener("scroll", function(){
  var overviewBlock = document.getElementsByTagName('blockquote')[0],
      blockDimensions = overviewBlock.getBoundingClientRect(),
      threshold = blockDimensions.height+overviewBlock.offsetTop,
      toolbar = document.getElementById('lessonToolbar'),
      scrollTop = (document.documentElement && document.documentElement.scrollTop) ||
                  document.body.scrollTop,
      fixed = scrollTop > threshold;
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
