/*******************************************
 * CARD INITIALIZATION AND SCROLLING
 *******************************************/

// for each lesson, initialize the list of cards and set button behaviors
function initializeCards(){
  // if there's no next/prev button, don't initialize
  if(!document.getElementById('prev')){ return; }
  // get all the lessons and cards
  var lessons   = document.getElementsByClassName('LessonBoundary'),
      cardNodes = document.getElementsByClassName('lessonItem'),
      cards     = [].slice.call(cardNodes), // convert NodeList to Array
      lesson    = document.getElementsByClassName('lesson')[0];
  // attach buttons to this lesson
  lesson.prev    = document.getElementById('prev');
  lesson.next    = document.getElementById('next');
  lesson.flip    = document.getElementById('flip');

  // hide all segments after 1 and compile all cards into a single lesson
  for(var i=1; i < lessons.length; i++){ lessons[i].style.display='none'; }
  for(var j=0; j < cards.length;   j++){
    console.log('putting lessonitem '+j+' at the end of the first list. After adding, there are '+(lesson.childNodes.length+1)+' cards');
    lesson.appendChild(cards[j]);
  }
  
  // set lesson pointers
  lesson.cards = cards;
  lesson.currentCard = 0;
  lesson.prev.lesson = lesson.next.lesson = lesson;

  // draw the lesson and buttons, moving the cards so only the currentCard is visible
  function drawLesson(lesson){
    lesson.prev.disabled = (lesson.currentCard <= 0);
    lesson.next.disabled = (lesson.currentCard >= lesson.cards.length-1);
    var width = lesson.cards[0].offsetWidth;
    lesson.style.left = (-lesson.currentCard * width) + 'px';
  }

  // change the currentCard and redraw the lesson
  lesson.prev.onclick = function(){
    this.lesson.currentCard--;
    drawLesson(this.lesson);
  };
  lesson.next.onclick = function(){
    this.lesson.currentCard++;
    drawLesson(this.lesson);
  };
  lesson.flip.onclick = function(){
    var main = document.getElementsByClassName('main')[0];
    main.className = (main.className.indexOf("flipped") === -1)? "main flipped" : "main";
  }

  drawLesson(lesson);
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
// forEach method, could be shipped as part of an Object Literal/Module
var forEach = function (array, callback, scope) {
  for (var i = 0; i < array.length; i++) {
    callback.call(scope, i, array[i]); // passes back stuff we need
  }
};
function attachCodeMirror(){
  // translate all the TEXTAREA nodes into full-blown CM instances, and color TTs with runmode
  // (we use the more expensive CM stuff for indenting)
  var codeSnippets = document.querySelectorAll('textarea');
  forEach(codeSnippets, function(idx, textarea){
<<<<<<< HEAD
    if(textarea.className == "racket" || !textarea.className){
=======
    if(textarea.className == "racket"){
>>>>>>> pyret-bs2
      CodeMirror.fromTextArea(textarea, {mode:"scheme2", readOnly: "nocursor"});
    } else if(textarea.className == "pyret"){
      CodeMirror.fromTextArea(textarea, {mode:"pyret", readOnly: "nocursor"});
    }
  });
  
  var codeSnippets = document.querySelectorAll('tt');
  forEach(codeSnippets, function(idx, tt){
    var node = document.createElement('span');
    node.className = 'editbox';
    tt.parentNode.insertBefore(node, tt);
<<<<<<< HEAD
    if(tt.className == "racket" || !tt.className){
      CodeMirror.runMode(tt.firstChild.nodeValue, "scheme2", node);
    } else if(tt.className == "pyret"){
      CodeMirror.runMode(tt.firstChild.nodeValue, "pyret", node);
    } else {
      console.log('<tt> declared without a language className');
=======
    if(tt.className == "racket"){
      CodeMirror.runMode(tt.firstChild.nodeValue, "scheme2", node);
    } else if(tt.className == "pyret"){
      CodeMirror.runMode(tt.firstChild.nodeValue, "pyret", node);
>>>>>>> pyret-bs2
    }
    tt.style.display = 'none';
   });
}


// find all lesson lessons in the file, and toggle the notes className for each
function toggleTeacherNotes(button){
  button.value = (button.value == 'Show Teacher Notes')? 'Hide Teacher Notes' : 'Show Teacher Notes';
  var lessons = document.getElementsByClassName('lesson');
  for(var i=0; i<lessons.length; i++){
    lessons[i].className = (lessons[i].className == 'lesson')? 'lesson teacherNotes' : 'lesson';
  }
}

// load and toggle the embedded google group viewer
function loadGroup(){
  // if there's no forum embedded, don't initialize
  if(!document.getElementById('forum_embed')){ return; }
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
 * SLIDE MODE
 *******************************************/
function showSlides(){
  var cardNodes = document.getElementsByClassName('student'),
      cards     = [].slice.call(cardNodes), // convert NodeList to Array
      progress  = document.createElement('div');
  progress.id = 'progressBar';
  document.body.appendChild(progress);
  progress.style.width = (100 / cards.length) + "%";
  
  // hide everything
  document.getElementById('lessonToolbar').style.display = 'none';
  document.body.style.visibility = 'hidden';
  
  function slideNavigation(e){
    // grab the current slide element (if there is one)
    var oldSlideElement = document.getElementsByClassName('slide')[0];
    
    // change the index
    if( (e.keyCode == 39 || e.keyCode == 32) && (window.index < cards.length-1) ){
      e.preventDefault();
      window.index++;
    } else if((e.keyCode == 37 || e.keyCode == 32) && (window.index > 0) ){
      window.index--;
    } else if(e.keyCode == 27){
      console.log('escape');
      // remove the slide class from the old element.
      if(oldSlideElement){ oldSlideElement.classList.remove('slide'); }
      // restore everything to pre-slide state
      document.getElementById('lessonToolbar').style.display = 'block';
      document.body.style.visibility = 'visible';
      document.body.removeEventListener("keydown", slideNavigation);
      document.body.removeChild(progress);
      return;
    } else {
      return; // ignore all other keypresses
    }
    cards[window.index].classList.add('slide');
    progress.style.width = (index+1) * (100 / cards.length) + "%";
    // remove the slide class from the old element.
    if(oldSlideElement){ oldSlideElement.classList.remove('slide'); }
  }
  // set up index, and assign keydown listener
  window.index = 0;
  document.body.addEventListener("keydown", slideNavigation);
  cards[0].classList.add('slide');
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