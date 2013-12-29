/*******************************************
 * CARD INITIALIZATION AND SCROLLING
 *******************************************/

// for each lesson, initialize the list of cards and set button behaviors
function initializeCards(){

  function drawSegment(segment){
    segment.prev.disabled = (segment.currentCard <= 0);
    segment.next.disabled = (segment.currentCard >= segment.cards.length-1);
    var width = segment.cards[0].offsetWidth;
    var lessonUL = segment.getElementsByClassName('lesson')[0];
    lessonUL.style.left = (-segment.currentCard * width) + 'px';
  }

  var segments = document.getElementsByClassName('segment');
  for(var i=0; i<segments.length; i++){
    var segment = segments[i];
    segment.prev = segment.getElementsByClassName('prev')[0],
    segment.next = segment.getElementsByClassName('next')[0];
    segment.cards = segment.getElementsByClassName('lessonItem');
    segment.currentCard = 0;
    segment.prev.segment = segment.next.segment = segment;
    segment.prev.onclick = function(){
      this.segment.currentCard--;
      drawSegment(this.segment);
    };
    segment.next.onclick = function(){
      this.segment.currentCard++;
      drawSegment(this.segment);
    };
    drawSegment(segment);
  }
}

/*******************************************
 * CODE RE-INDENTING
 *******************************************/

// rewrap all REPL content onresize, throttled by 250ms
var rewrapThrottle = null;
var rewrapCodeExps = function(){
  
  // calculateWidth : node -> number
  // cache and return the width of the current node, and all of its children
  var calculateWidth = function(node){
    node.cachedWidth = 1;
    for(var i = 0; i < node.children.length; i++) {
      node.cachedWidth += (node.children[i].cachedWidth || calculateWidth(node.children[i]));
    }
    node.cachedWidth = Math.max(node.cachedWidth, node.offsetWidth);
    return node.cachedWidth;
  }
  
  // rewrap a single CodeExp: either every child fits on one line, or they all get their own line
  var rewrapCodeExp = function(node){
    var oldWrap   = node.className.indexOf("wrapped") > -1,      // original wrap state
        expWidth  = node.cachedWidth || calculateWidth(node),   // unwrapped exp width (use cache if possible)
        maxWidth  = node.parentNode.clientWidth,                // maximum width, including padding but not margin
        newWrap   = expWidth > maxWidth;                        // new wrapped state
    // if the wrapping status has changed, update the className and re-check all the children
    if(oldWrap !== newWrap){
      node.className = newWrap? node.className+" wrapped" : node.className.replace(/ wrapped/g, "");
      for(var i = 0; i < node.children.length; i++){ rewrapCodeExp(node.children[i]); }
    }
  }
  
  // clear the throttle and set timer for rewrapping
  clearTimeout(rewrapThrottle);
  rewrapThrottle = setTimeout(function(){
                              var repls = document.getElementsByClassName('codesexp');
                              for(var i=0; i<repls.length; i++){ rewrapCodeExp(repls[i])};
                              }, 250);
};


/*******************************************
 * CODEMIRROR
 *******************************************/
function attachCodeMirror(){
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
    // if for some reason there's an empty @code{} block, skip over it
    if(!codeSnippets[i].firstChild) continue;
    CodeMirror.runMode(codeSnippets[i].firstChild.nodeValue, "scheme2", node);
    codeSnippets[i].style.display = 'none';
  }
}

/*******************************************
 * LESSON TOOLBAR
 *******************************************/
function updateLessonToolbar(){
  var toolbar         = document.getElementById('lessonToolbar'),
      overviewBlock   = document.getElementsByTagName('blockquote')[0],
      blockDimensions = overviewBlock.getBoundingClientRect(),
      threshold       = blockDimensions.height+overviewBlock.offsetTop,
      scrollTop       = (document.documentElement && document.documentElement.scrollTop) ||
                        document.body.scrollTop,
      fixed           = scrollTop > threshold;
  // if there's no toolbar (in the student distribution, for example), abort
  if(!toolbar) return;
  toolbar.className = (fixed)? 'fixed' : '';
}

// find all lesson segments in the file, and toggle the notes className for each
function toggleTeacherNotes(button){
  button.value = (button.value == 'Show Teacher Notes')? 'Hide Teacher Notes' : 'Show Teacher Notes';
  var lessons = document.getElementsByClassName('lesson');
  for(var i=0; i<lessons.length; i++){
    lessons[i].className = (lessons[i].className == 'lesson')? 'lesson teacherNotes' : 'lesson';
  }
}

// load and toggle the embedded google group viewer
function loadGroup(){
  document.getElementById("forum_embed").src = "https://groups.google.com/forum/embed/?place=forum/bootstrap-discuss" +
  "&showsearch=true&showpopout=true&hideforumtitle=true&parenturl=" +
  encodeURIComponent(window.location.href);
}

function showGroup(){
  var frame = document.getElementById('forum_embed');
  if(frame.className === ''){
    frame.className = 'shown';
    setTimeout("window.onclick = showGroup", 500);
  } else {
    frame.className = '';
    window.onclick = null;
  }
}


/*******************************************
 * EVENT HANDLERS
 *******************************************/
window.addEventListener("resize", function(){
  rewrapCodeExps();
});

window.addEventListener("load", function(){
  loadGroup();
  attachCodeMirror();
  initializeCards();
  rewrapCodeExps();
});


window.addEventListener("scroll", function(){
  updateLessonToolbar();
});